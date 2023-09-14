using System;
using System.Data;
using System.Data.SqlClient;
using HighwaySoluations.Softomation.TMSSystemLibrary.DBA;
using HighwaySoluations.Softomation.CommonLibrary;

namespace HighwaySoluations.Softomation.TMSSystemLibrary
{
    public class SystemConstants : Constants
    {
        #region Project Config
        public static string DriveLetter = "C";
        public static string ProjectName = "TMSv1";
        public static string ProjectConfigRoot = DriveLetter + @":\ProjectConfig\";
        public static string ProjectConfigDirectory = ProjectConfigRoot + ProjectName + @"\MasterConfig\";
        public static string ProjectConfigKey = DriveLetter + @":\ProjectConfig\" + ProjectName + @"\MasterConfig\Key\";
        public static string Version = "1.0.0.1";
        #endregion

        #region Date Time
        public static string dateTimeFormat24HFileFormat = "MM/dd/yyyyHH:mm:ss";
        public static string dateTimeFormatQualixFormat = "yyyy-MM-ddTHH:mm:ss";
        public static string dateTimeFormatTxnFormat = "yyyy-MM-ddTHH:mm:ss.ffff";
        public static string dateTimeFormatICDFormat = "YYYY-MM-DDThh:mm:ss";
        #endregion

        #region Enum
        public enum TollingType
        {
            Normal = 0,
            AccessControl = 1,
            FreeFlow = 2
        }

        public enum AppUserType
        {
            SysAdmin = 0,
            Administrator = 1,
            Manager = 2,
            Auditor = 3,
            TollCollector = 4,
            Maintenance = 5
        }

        public enum LaneType
        {
            Normal = 0,
            Entry = 1,
            Exit = 2
        }
        public enum ICDRequestStatusType
        {
            Generated = 0,
            Send = 1,
            Received = 2
        }

        #endregion

        #region Methods
        public static bool BulkCopy(DataTable dt, string table)
        {
            try
            {
                bool error = true;
                SqlConnection con = (SqlConnection)DBAccessor.CreateConnection();
                con.Open();
                using (SqlBulkCopy bulcopy = new SqlBulkCopy(con))
                {
                    bulcopy.DestinationTableName = table;
                    try
                    {
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
            catch (Exception ex)
            {
                throw ex;
            }
        }
        #endregion
    }


}
