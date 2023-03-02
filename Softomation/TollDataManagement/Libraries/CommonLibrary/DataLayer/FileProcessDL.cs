using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using CommonLibrary.DBA;
using Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer;

namespace Softomation.DMS.Libraries.CommonLibrary.DataLayer
{
    internal class FileProcessDL
    {
        #region Global Varialble
        static DataTable dt;
        static string tableName = "tbl_IHMCLClass";
        #endregion

        internal static void ImportData(DataTable ImportDT, string SessionId)
        {
            //List<ResponceIL> responces = null;
            if (BulkCopy(ImportDT, "tbl_TempBlackListData"))
            {
                //string spName = "USP_IHMCLVehicleClassUpload";
                //DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                //command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@FileName", DbType.String, fileName, ParameterDirection.Input, 20));
                //command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@SessionId", DbType.String, SessionId, ParameterDirection.Input, 20));
                //command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@DataStatus", DbType.Int16, common.DataStatus, ParameterDirection.Input));
                //command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@UserId", DbType.Int32, common.CreatedBy, ParameterDirection.Input));
                //command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@CDateTime", DbType.DateTime, DateTime.Now, ParameterDirection.Input));
                //dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                //responces = Constants.ConvertResponceList(dt);
            }

            //return responces;
        }

        internal static void Insert(string SessionId)
        {
            try
            {
                string spName = "USP_BlackListDataInsert";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@SessionId", DbType.String, SessionId, ParameterDirection.Input, 500));
                DBAccessor.ExecuteNonQuery(command);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }


        #region Helper Method
        private static bool BulkCopy(DataTable dt, string table)
        {
            bool error = true;
            SqlConnection con = (SqlConnection)DBAccessor.CreateConnection();
            con.Open();
            using (SqlBulkCopy bulcopy = new SqlBulkCopy(con))
            {
                bulcopy.DestinationTableName = table;
                try
                {
                    //bulcopy.ColumnMappings.Add(0, 0);
                    //bulcopy.ColumnMappings.Add(1, 1);
                    //bulcopy.ColumnMappings.Add(2, 2);
                    //bulcopy.ColumnMappings.Add(3, 3);
                    //bulcopy.ColumnMappings.Add(4, 4);
                    //bulcopy.ColumnMappings.Add(5, 13);
                    bulcopy.WriteToServer(dt);
                    con.Dispose();
                }
                catch (Exception ex)
                {
                    con.Dispose();
                    error = false;
                    throw ex;
                }
                return error;
            }
        }
        #endregion
    }
}
