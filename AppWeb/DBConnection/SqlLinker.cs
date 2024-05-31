using System.Data;
using System.Data.SqlClient;

namespace DBLinker
{
    interface SqlLinker{
        
    }

    class SqlLinker
    {
        readonly SqlConnection dbc;
        readonly Dictionary<string, DataTableAdapter> tables = [];
        readonly bool autoFill, autoUpdate;

        public SqlLinker(string server, string database, string user, string password, bool encrypt = true, bool trustCertificate = true, bool autoFill = false, bool autoUpdate = false)
        {
            SqlConnectionStringBuilder builder = new()
            {
                DataSource = server,
                InitialCatalog = database,
                UserID = user,
                Password = password,
                Encrypt = encrypt,
                TrustServerCertificate = trustCertificate
            };
            this.autoFill = autoFill;
            this.autoUpdate = autoUpdate;
            dbc = new SqlConnection(builder.ConnectionString);
            dbc.Open();
        }

        public string[] GetTableNames(){
            SqlCommand cmd = new("SELECT TABLE_SCHEMA,TABLE_NAME FROM INFORMATION_SCHEMA.TABLES;", dbc);
            SqlDataReader reader = cmd.ExecuteReader();

            List<string> ts = [];

            while (reader.Read())
            {
                ts.Add($"[{reader["TABLE_SCHEMA"]}].[{reader["TABLE_NAME"]}]");
            }
            reader.Close();
            return ts.ToArray();
        }

        public bool LoadTables()
        {            
            string[] strTables = GetTableNames();

            foreach (var table in strTables)
            {
                tables.Add(table, new DataTableAdapter(new SqlDataAdapter($"SELECT * FROM {table};", dbc), autoFill, autoUpdate));
            }

            return false;
        }

        public DataTableAdapter this[string tableName] { get => tables[tableName]; }
    }

    public class DataTableAdapter : DataTable
    {
        bool fillRoutine = false;
        private SqlDataAdapter adapter;

        public DataTableAdapter(SqlDataAdapter adapter, bool autoFill = false, bool autoUpdate = false) : base()
        {
            SqlCommandBuilder cmdbuild = new SqlCommandBuilder(adapter);
            adapter.InsertCommand = cmdbuild.GetInsertCommand();
            adapter.DeleteCommand = cmdbuild.GetDeleteCommand();
            adapter.UpdateCommand = cmdbuild.GetUpdateCommand();
            adapter.ContinueUpdateOnError = true;
            //adapter.AcceptChangesDuringUpdate=true;
            this.adapter = adapter;

            if (autoFill)
            {
                Fill();
                //AcceptChanges();
            }
            if (autoUpdate)
            {
                RowChanged += AutoUpdateFunc;
                RowDeleted += AutoUpdateFunc;
            }
        }

        public void Fill()
        {
            fillRoutine = true;
            Clear();
            adapter.Fill(this);
            AcceptChanges();
            fillRoutine = false;
        }
        public void Update()
        {
            Console.WriteLine("update");
            adapter.Update(this);
            Console.WriteLine(this.GetErrors().Length);
            if (GetErrors().Length > 0)
            {
                Console.WriteLine("errors");
                RejectChanges();
            }
            else
            {
                Console.WriteLine("no errors");
                AcceptChanges();
            }
        }

        private void AutoUpdateFunc(object sender, DataRowChangeEventArgs e)
        {
            if (!fillRoutine && ((e.Action & (DataRowAction.Commit | DataRowAction.Rollback)) > 0))
                return;

            Console.WriteLine("Changed");
            Console.WriteLine(e.Action);
            Update();
        }
    }
}