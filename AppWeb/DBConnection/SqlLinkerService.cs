using System.Reflection.Metadata.Ecma335;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.SignalR;

namespace DBLinker
{
    interface ISqlLinkerService{
        public bool IsConnected {get;}
        public bool Connect(string server, string database, string user, string password, bool encrypt = true, bool trustCertificate = true, bool autoFill = false, bool autoUpdate = false);
        public void Disconnect();
        public void LoadTables();
        public string[]? GetTableNames();
        public string[]? GetViewNames();
        public DataTableAdapter? GetTableL(string tableName);
        public DataTableAdapter? GetTable(string tableName, string where="", string orderBy="");
        public DataTableAdapter? GetView(string viewName, string where="", string orderBy="");

        public string[]? GetDBUsers(string server, string database, string user, string password, bool encrypt = true, bool trustCertificate = true);
    }

    class SqlLinkerService : ISqlLinkerService
    {
        private static SqlLinker? dbLink = null;

        public bool IsConnected => dbLink?.IsConnected ?? false; // el operador ?? verifica que lo que está a la derecha no sea null, en caso de serlo, ejecuta lo que está a la izquierda
        
        public bool Connect(string server, string database, string user, string password, bool encrypt = true, bool trustCertificate = true, bool autoFill = false, bool autoUpdate = false)
        {
            Disconnect();

            try{
                dbLink = new(server,database,user,password,encrypt,trustCertificate,autoFill,autoUpdate);
            }
            catch{
                dbLink = null;
            }

            return IsConnected;
        }

        public void Disconnect()
        {
            dbLink?.Close();
            dbLink=null;
        }
        public DataTableAdapter? GetView(string viewName, string where="", string orderBy="") => dbLink?.GetView(viewName,where,orderBy);
        public DataTableAdapter? GetTableL(string tableName) => dbLink?[tableName];
        public DataTableAdapter? GetTable(string tableName, string where="", string orderBy="") => dbLink?.GetTable(tableName,where,orderBy);//SELECT * FROM DBPROCEDURES_PARAMS ORDER BY SPECIFIC_NAME,OBJECT_ID,PARAM_ID
        public string[]? GetTableNames() => dbLink?.GetTableNames();
        public string[]? GetViewNames() => dbLink?.GetViewNames();
        public void LoadTables()
        {
            dbLink?.LoadTables();
        }

        public string[]? GetDBUsers(string server, string database, string user, string password, bool encrypt = true, bool trustCertificate = true) =>
            SqlLinker.GetDBUsers(server, database, user, password, encrypt, trustCertificate);
        
    }
}