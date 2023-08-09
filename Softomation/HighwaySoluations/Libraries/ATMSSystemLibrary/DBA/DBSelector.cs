using System;
using HighwaySoluations.Softomation.ATMSSystemLibrary.SystemConfigurations;

namespace HighwaySoluations.Softomation.ATMSSystemLibrary.DBA
{
    public class DBSelector
    {
        private static DBSelector instance;



        //Database object
        private Microsoft.Practices.EnterpriseLibrary.Data.Database database;

        private DBSelector(SystemConstants.DataBaseProvider provider)
        {
            SelectDataBase(provider);
        }



        /// <summary>
        /// Get property to retrieve the current database.
        /// </summary>
        public Microsoft.Practices.EnterpriseLibrary.Data.Database GetDataBase
        {
            get { return this.database; }
        }

        public static DBSelector Instance
        {
            get
            {
                if (instance == null)
                {
                    instance = new DBSelector(SystemConstants.DataBaseProvider.SqlServer);
                }
                return instance;
            }
        }

        /// <summary>
        /// Create new database.
        /// 1. Oracle
        /// 2. Sql Server
        /// 3. DB2
        /// </summary>
        /// <returns></returns>
        public void SelectDataBase(SystemConstants.DataBaseProvider provider)
        {
            try
            {
                string connString = string.Empty;
                DataBaseConfig dbConfig = DataBaseConfig.Deserialize();
                //string plainText = Constants.Decrypt(dbConfig.DBPassword);
                if (provider == SystemConstants.DataBaseProvider.Oracle)
                {
                    #region Oracle
                    connString = "Data Source = " + dbConfig.DBServerName + ";User ID=" + dbConfig.DBLogin + "; Password = " + dbConfig.DBPassword + ";Unicode=True";
                    this.database = new Microsoft.Practices.EnterpriseLibrary.Data.Oracle.OracleDatabase(connString);
                    #endregion
                }
                else if (provider == SystemConstants.DataBaseProvider.SqlServer)
                {
                    #region SQL Server
                    connString = @"Data Source=" + dbConfig.DBServerName + "; Initial Catalog=" + dbConfig.DBName + "; Max Pool size=" + dbConfig.PoolSize + "; Connection Timeout=" + dbConfig.Timeout + "; pooling=yes; Persist Security Info=True; User ID=" + dbConfig.DBLogin + "; Password=" + dbConfig.DBPassword + ";";
                    this.database = new Microsoft.Practices.EnterpriseLibrary.Data.Sql.SqlDatabase(connString);
                    #endregion
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
