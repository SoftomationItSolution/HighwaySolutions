using System;
using System.Data.Common;
using System.Data;
using Softomation.ATMSSystemLibrary.SystemLogger;

namespace Softomation.ATMSSystemLibrary.DBA
{
    public class DBAccessor
    {
        
        public static int ExecuteNonQuery(DbCommand command)
        {
            int rowsAffected = 0;

            try
            {
                Microsoft.Practices.EnterpriseLibrary.Data.Database db = DBSelector.Instance.GetDataBase;
                rowsAffected = db.ExecuteNonQuery(command);
            }
            catch (Exception ex)
            {
                LogMaster.WriteGeneralLog("Failed to execute non query." + ex.Message);
                throw ex;
            }

            return rowsAffected;
        }

        
        public static DbCommand GetStoredProcCommand(string spName)
        {
            DbCommand dbCommand = null;

            try
            {
                Microsoft.Practices.EnterpriseLibrary.Data.Database db = DBSelector.Instance.GetDataBase;

                dbCommand = db.GetStoredProcCommand(spName);
            }
            catch (Exception ex)
            {
                throw ex;
            }

            return dbCommand;
        }

        
        public static DbCommand GetSqlStringCommand(string query)
        {
            DbCommand dbCommand = null;

            try
            {
                Microsoft.Practices.EnterpriseLibrary.Data.Database db = DBSelector.Instance.GetDataBase;
                dbCommand = db.GetSqlStringCommand(query);
            }
            catch (Exception ex)
            {
                throw ex;
            }

            return dbCommand;
        }

        
        public static DataSet LoadDataSet(DbCommand command, string tableName)
        {
            DataSet ds = new DataSet();
            try
            {
                Microsoft.Practices.EnterpriseLibrary.Data.Database db = DBSelector.Instance.GetDataBase;
                db.LoadDataSet(command, ds, tableName);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return ds;
        }

        public static void LoadDataSet(DbCommand command, string tableName, ref DataSet ds)
        {
            try
            {
                Microsoft.Practices.EnterpriseLibrary.Data.Database db = DBSelector.Instance.GetDataBase;
                db.LoadDataSet(command, ds, tableName);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        
        public static Object ExecuteScalar(DbCommand command)
        {
            object obj = new object();

            try
            {
                Microsoft.Practices.EnterpriseLibrary.Data.Database db = DBSelector.Instance.GetDataBase;
                obj = db.ExecuteScalar(command);
            }
            catch (Exception ex)
            {
                throw ex;
            }

            return obj;
        }

        
        public static Object ExecuteScalarString(string commandText)
        {
            object obj = new object();

            try
            {
                Microsoft.Practices.EnterpriseLibrary.Data.Database db = DBSelector.Instance.GetDataBase;
                DbCommand command = db.GetSqlStringCommand(commandText);
                obj = db.ExecuteScalar(command);
            }
            catch (Exception ex)
            {
                throw ex;
            }

            return obj;
        }

        public static DbParameter CreateDbParameter(ref DbCommand cmd, String paramName, DbType dbType, object value, ParameterDirection paramDirection)
        {
            DbParameter dbParam = cmd.CreateParameter();
            dbParam.ParameterName = paramName;
            dbParam.DbType = dbType;
            dbParam.Value = value;
            dbParam.Direction = paramDirection;

            return dbParam;
        }
        public static DbParameter CreateDbParameter(ref DbCommand cmd, String paramName, DbType dbType, object value, ParameterDirection paramDirection, int size)
        {
            DbParameter dbParam = cmd.CreateParameter();
            dbParam.ParameterName = paramName;
            dbParam.DbType = dbType;
            dbParam.Value = value;
            dbParam.Size = size;
            dbParam.Direction = paramDirection;

            return dbParam;
        }

        public static DbConnection CreateConnection()
        {
            Microsoft.Practices.EnterpriseLibrary.Data.Database db = DBSelector.Instance.GetDataBase;
            return db.CreateConnection();
        }
    }
}
