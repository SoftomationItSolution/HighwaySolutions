using System;
using Softomation.DMS.Libraries.CommonLibrary;
using Softomation.DMS.Libraries.CommonLibrary.XMLConfigurationClasses;

namespace CommonLibrary.DBA
{
    public class DBSelector
    {
        private static DBSelector instance;



        //Database object
        private Microsoft.Practices.EnterpriseLibrary.Data.Database database;

        private DBSelector(Constants.DataBaseProvider provider)
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
                    instance = new DBSelector(Constants.DataBaseProvider.SqlServer);
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
        public void SelectDataBase(Constants.DataBaseProvider provider)
        {
            try
            {
                string connString = string.Empty;
                GeneralConfiguration generalConfig = GeneralConfiguration.Deserialize();
                string plainText = Constants.Decrypt(generalConfig.DatabasePassword);
                if (provider == Constants.DataBaseProvider.Oracle)
                {
                    #region Oracle
                    connString = "Data Source = " + generalConfig.DatabaseServer + ";User ID=" + generalConfig.DatabaseUser + "; Password = " + plainText + ";Unicode=True";
                    this.database = new Microsoft.Practices.EnterpriseLibrary.Data.Oracle.OracleDatabase(connString);
                    #endregion
                }
                else if (provider == Constants.DataBaseProvider.SqlServer)
                {
                    #region SQL Server
                    connString = @"Data Source=" + generalConfig.DatabaseServer + ";Initial Catalog=" + generalConfig.DatabaseName + ";Persist Security Info=True;User ID=" + generalConfig.DatabaseUser + "; password=" + plainText + ";";
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
