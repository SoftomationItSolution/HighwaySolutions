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
            Dedicated = 0,
            Hybrid = 1,
            Handheld = 2
        }
        public enum LaneStatusType
        {
            Open = 0,
            Close = 1
        }
        public enum LaneModeType
        {
            Maintenance = 0,
            Normal = 1
        }
        public enum LanePointType
        {
            Normal = 0,
            Entry = 1,
            Exit = 2
        }
        public enum LanePositionType
        {
            LHS = 0,
            RHS = 1,
        }
        public enum LaneDirectionType
        {
            East = 1,
            West = 2,
            North = 3,
            South = 4,
            North_East=5,
            North_West=6,
            South_West = 7,
            South_East= 8
        }
        public enum ICDRequestStatusType
        {
            Generated = 0,
            Send = 1,
            Received = 2,
            Send_Error = 3,
            Received_Error = 4,
        }
       
        public enum ICDDirectionType
        {
            E = 1,
            W = 2,
            N = 3,
            S = 4
        }
        public enum ICDLaneStatusType
        {
            OPEN = 1,
            CLOSE = 2
        }
        public enum ICDLaneModeType
        {
            Maintenance = 1,
            Normal = 2
        }
        public enum ICDLaneType
        {
            Dedicated = 1,
            Hybrid = 2,
            Handheld = 3
        }

        public enum ICDRequestPayTxnType
        {
            DEBIT = 1,
            CREDIT = 2,
            NON_FIN = 3
        }

        public enum ICDSignAuthType
        {
            VALID = 1,
            INVALID = 2,
            NOT_VERIFIED = 3
        }
        public enum ICDTagVerifiedType
        {
            NETC_TAG = 1,
            NON_NETC_TAG = 2,
        }
        public enum ICDVehicleAuthType
        {
            YES = 1,
            NO = 2,
            UNKNOWN = 3,
        }
        public enum ICDTxnStatusType
        {
            SUCCESS = 1,
            FAILED = 2
        }
        public enum ICDPriceModeType
        {
            DISTANCE = 1,
            POINT = 2,
            CUSTOM = 3
        }
        public enum ICDPaymentModeType
        {
            Tag = 1,
            Cash = 2,
            Card = 3,
            QRCode = 4,
            Other = 5
        }
        public enum ICDFareType
        {
            DISCOUNTED = 1,
            EXEMPTED = 2,
            FULL = 3,
            RETURN = 4
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
        public static string ParseJsonResponseObject(string InJsonResponce)
        {
            InJsonResponce = InJsonResponce.Replace("\"ResponseMessage\":\"success\"", "");
            InJsonResponce = InJsonResponce.Replace("{,\"ResponseData\":", "");
            InJsonResponce = InJsonResponce.TrimEnd('}');
            return InJsonResponce = InJsonResponce + "}";
        }
        public static string ParseJsonForResponseList(string JsonResponce)
        {
            JsonResponce = JsonResponce.Replace("\"ResponseMessage\":\"success\"", "");
            JsonResponce = JsonResponce.Replace("{,\"ResponseData\":", "");
            return JsonResponce = JsonResponce.TrimEnd('}');
        }
        #endregion
    }


}
