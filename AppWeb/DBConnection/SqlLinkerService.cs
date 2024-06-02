namespace DBLinker
{
    interface ISqlLinkerService{
        public bool IsConnected {get;}
        public void Connect(string server, string database, string user, string password, bool encrypt = true, bool trustCertificate = true, bool autoFill = false, bool autoUpdate = false);
        public void Disconnect();
        public void LoadTables();
        public string[]? GetTableNames();
        public string[]? GetViewNames();
        public DataTableAdapter? GetTableL(string tableName);
        public DataTableAdapter? GetTable(string tableName);
        public DataTableAdapter? GetView(string viewName);
    }

    class SqlLinkerService : ISqlLinkerService
    {
        private static SqlLinker? dbLink = null;

        public bool IsConnected => dbLink?.IsConnected ?? false; // el operador ?? verifica que lo que está a la derecha no sea null, en caso de serlo, ejecuta lo que está a la izquierda
        
        public void Connect(string server, string database, string user, string password, bool encrypt = true, bool trustCertificate = true, bool autoFill = false, bool autoUpdate = false)
        {
            dbLink = new(server,database,user,password,encrypt,trustCertificate,autoFill,autoUpdate);
        }

        public void Disconnect()
        {
            dbLink?.Close();
        }
        public DataTableAdapter? GetView(string viewName) => dbLink?.GetView(viewName);
        public DataTableAdapter? GetTableL(string tableName) => dbLink?[tableName];
        public DataTableAdapter? GetTable(string tableName) => dbLink?.GetTable(tableName);
        public string[]? GetTableNames() => dbLink?.GetTableNames();
        public string[]? GetViewNames() => dbLink?.GetViewNames();
        public void LoadTables() => dbLink?.LoadTables();
    }
}