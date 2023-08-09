using System;
using System.Data;
using System.Data.SqlClient;
using System.IdentityModel.Tokens.Jwt;
using System.IO;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Text.RegularExpressions;
using HighwaySoluations.Softomation.TMSSystemLibrary.IL;
using Microsoft.IdentityModel.Tokens;
using HighwaySoluations.Softomation.TMSSystemLibrary.DBA;


namespace HighwaySoluations.Softomation.TMSSystemLibrary
{
    public class Constants
    {
        #region Project Config
        public static string DriveLetter = "C";
        public static string ProjectName = "TMSv1";
        public static string ProjectConfigRoot = DriveLetter + @":\ProjectConfig\";
        public static string ProjectConfigDirectory = ProjectConfigRoot + ProjectName + @"\MasterConfig\";
        public static string ProjectConfigKey = DriveLetter + @":\ProjectConfig\" + ProjectName + @"\MasterConfig\Key\";
        public static string Version = "1.0.0.1";
        public const string AppProvider = "Softomation";
        public static string SqlPackagePrefix = "dbo.";
        #endregion

        #region For encryption and decryption
        public static string issuer = "http://www.softomation.com";
        public static string passPhrase = "$0ft0m@ti0n";//Pas5pr@se        // can be any string
        public static string saltValue = "HP5502@$";//s@1tValue        // can be any string
        public static string hashAlgorithm = "SHA1";             // can be "MD5"
        public static int passwordIterations = 2;                  // can be any number
        public static string initVector = "@1B2c3D4e5F6g7H8"; // must be 16 bytes
        public static int keySize = 256;                // can be 192 or 128
        public static string JWTkey = AppProvider + "TollingSolutionSystemProvider";
        #endregion

        #region Date Time
        public static string DateTimeFormatJson = "dd-MMM-yyyy HH:mm:ss.fff";
        public static string DateTimeFormat12H = "yyyy-MM-dd hh:mm:ss.fff";
        public static string DateTimeFormat24H = "yyyy-MM-dd HH:mm:ss.fff";
        public static string DateTimeFormat24HForFileName = "yyyy-MM-dd-HH-mm-ss-fff";
        public static string DateTimeFormatFileName = "yyyyMMddHHmmssfff";
        public static string DateTimeFormat24HsqlServer = "yyyy-MM-dd HH:mm:ss.fff";
        public static string DateTimeFormat24HOracleQuery = "dd/MM/yyyy HH:mm:ss";
        public static string dateTimeFormat24HFileFormat = "MM/dd/yyyyHH:mm:ss";
        public static string dateTimeFormatQualixFormat = "yyyy-MM-ddTHH:mm:ss";
        public static string dateTimeFormatTxnFormat = "yyyy-MM-ddTHH:mm:ss.ffff";
        #endregion

        #region Variable
        public static string DATE_FORMAT = "dd-MMM-yyyy";
        public static string DATETIME_FORMAT = "dd/MM/yyyy hh:mm:ss tt";
        public static string DATETIME_FORMAT_WITHOUT_SECONDS = "dd/MM/yyyy hh:mm tt";
        public static string DATETIME_FORMAT_Client = "dd-MMM-yyyy HH:mm:ss";
        public static string DATETIME_FORMAT_String = "dd-MMM-yyyy HH:mm:ss.fff";
        public static string dateTimeFormat24H = "yyyy-MM-dd HH:mm:ss.fff";
        public static string dateTimeFormat24HWithoutMS = "yyyy-MM-dd HH:mm:ss";
        public static string dateTimeFormat24HForFileName = "yyyy-MM-dd-HH-mm-ss-fff";
        public static string dateTimeFormatFileName = "yyyyMMddHHmmssfff";
        public static string dateTimeFormat24HsqlServer = "yyyy-MM-dd HH:mm:ss.fff";
        public static string dateTimeFormat24HOracleQuery = "dd/MM/yyyy HH:mm:ss";
        public static char hardwareStatusMessageSeparator = '≠';
        public static string driveLetter = "C";
        public static string webPublishPrefix = @"\inetpub\wwwroot\";
        public static string projectConfigDirectory = driveLetter + @":\" + ProjectName + @"\Config\";
        public static string csvFilePath = driveLetter + @":\" + ProjectName + @"\CSV\";
        public static string CutomerDocuments = driveLetter + @":\" + ProjectName + @"\cutomerdocuments\";
        public static string companyLogoPath = driveLetter + @":\" + ProjectName + @"\images\company_logo.jpg";
        public static string companyLogoPath2 = driveLetter + @":\" + ProjectName + @"\images\company_logo2.jpg";

        public static string AnprRootPath = @"\Attachment\\anpr\";
        public static string AnprVrnImagePath = @"\{date}\\{gantryId}\\VRN\\";
        public static string AnprVehicleImagePath = @"\{date}\\{gantryId}\\VehicleImage\\";
        public static string SDKImageRootPath = @":\\anprImages\";
        public static string vmsMMFName = @"Global\myVmsStatuses";//Memory mapped file name
        public static string ANPRImageFilePath = driveLetter + @":\inetpub\wwwroot\DMS_RSCEventAPI\Anpr_Data\";

        //For encryption and decryption
        public static string oraclePackagePrefix = "DMS_PACKAGE.";
        public static string sqlPackagePrefix = "dbo.";
        public static string oraclePackageReportPrefix = "DMS_PACKAGE_REPORTS.";
        private static Random random = new Random();
        #endregion

        #region Enum
        public enum VIDSEquipmentPositionType
        {
            Entry = 1,
            Exit = 2,
            MainCarriageway = 3,
            ParkingSpot = 4
        }
        public enum ATCCEquipmentPositionType
        {
            Entry = 1,
            Exit = 2,
        }
        public enum VMSEquipmentPositionType
        {
            Entry = 1,
            Exit = 2,
        }
        public enum HighwayLaneNumber
        {
            Lane_0 = 0,
            Lane_1 = 1,
            Lane_2 = 2,
            Lane_3 = 3,
            Lane_4 = 4,
            Lane_5 = 5,
            Lane_6 = 6,
            Lane_7 = 7,
            Lane_8 = 8
        }

        public enum SystemMasterType
        {
            ADAS = 1,
            ATCC = 2,
            ECS = 3,
            FMS = 4,
            TMCS = 5,
            VIDS = 6,
            VMS = 7,
            VSDS = 8,
            Weather = 9,
            IMS = 10,
            Config = 11,
            TTMS = 12,
            RMS = 13,
            NMS = 14,
            Challan = 15,
            CRS = 16,
            MRCS = 17
        }
        public enum PriorityType
        {
            Critical = 1,
            High = 2,
            Medium = 3,
            Low = 4
        }
        public enum ErrorLogModule
        {
            GeneralLog,
            BackOfficeAPI,
            EventAPI,
            ServiceMonitor,
            BackOfficeService,
        }
        public enum AppUserType
        {
            SysAdmin = 0,
            Administrator = 1,
            Enforcement = 2,
            Operater = 3,
            Commuters = 4,
            PetrollingTeam = 5
        }
        public enum DataStatusType
        {
            Deleted = 0,
            Active = 1,
            Inactive = 2
        }
        public enum IncidentGeneratedByType
        {
            SysAdmin = 0,
            Administrator = 1,
            Enforcement = 2,
            Operater = 3,
            Commuters = 4,
            PetrollingTeam = 5,
            Auto = 6
        }
        public enum DirectionType
        {
            None = 0,
            LHS = 1,
            RHS = 2,
            Median = 3
        }
        public enum UserLoginStatus
        {
            Invalid = 0,
            Login = 1,
            Logout = 2
        }
        public enum VmsMessageFormat
        {
            None = 0,
            Text = 1,
            Image = 2
        }
        public enum VmsMessageType
        {
            None = 0,
            Static = 1,
            Scroll = 2
        }
        public enum EquipmentCategoryType
        {
            FieldEquipment = 1,
            ControlRoomEquipment = 2,
            NetworkInfrastructure = 3,
            PowerEquipment = 4,
            OtherAssets = 5
        }

        public enum ChallanType
        {
            None = 0,
            OverSpeed = 1,
            SectionOverSpeed = 2,
            WrongLane = 3,
            LaneOverspeed = 4,
            WrongwayParking = 5,
            WrongwayDriving = 6
        }
        public enum EquipmentConnectionType
        {
            Network = 1,
            COM = 2,
            Other = 3
        }
        public enum ConnectionProtocolType
        {
            TCP = 1,
            UDP = 2,
            Serail = 3,
            MQTT = 4,
            HTTP = 5,
            RTSP = 6,
            Other = 7
        }
        public enum DataBaseProvider
        {
            Oracle = 1,
            SqlServer = 2,
            PostGrayServer = 3,
            MySql = 4,
        }
        public enum ServerEnum
        {
            Local = 0,
            Development = 1,
            Production = 2
        }

        #region Hardware
        public enum HardwarePosition
        {
            Front = 1,
            Rear = 2,
        }

        #endregion

        #region User Type Flags
        public enum UserType
        {
            Commuter = 1,
            BackOffice
        };
        #endregion

        #region Activity Flags
        public enum ActivityType
        {
            Save = 1,
            Update
        };
        #endregion

        #region Customer Vehicle Flags
        public enum QueuedFlag
        {
            Complete = 1,
            Process,
            Register
        };

        public enum ExemptFlag
        {
            Charged = 1,
            FreePass,
            BlackList
        };

        public enum Gender
        {
            Male = 1,
            Female,

        };


        #endregion

        #region Data 
        public enum PaymentStatus
        {
            Process = 0,
            Success = 1,
            Pending
        }
        public enum TransactionType
        {
            Sale = 1,
            Recharge,
            Refund,
            LaneDebit
        }
        public enum DataTransferStatus
        {
            NotTransferred = 1,
            Transferred,
            FailedToTransfer,
        }
        public enum AuditTransactionType
        {
            Charged = 1,
            Violation,
            Refunds
        }


        #endregion
        public enum ApiCommandStatus
        {
            Success = 1,
            Failed,
            Queued,
        }
        public enum Activity
        {
            View = 1,
            Add,
            Edit,
            Delete,
            Control,
        };
        #endregion

        #region Methods
        public static string Decrypt(string input)
        {
            return Cryptography.Encryption.Decrypt(input, passPhrase, saltValue, hashAlgorithm, passwordIterations, initVector, keySize);
        }
        public static string Encrypt(string input)
        {
            return Cryptography.Encryption.Encrypt(input, passPhrase, saltValue, hashAlgorithm, passwordIterations, initVector, keySize);
        }
        public static object GetToken(AppLoginIL input)
        {
            //http://stackoverflow.com/questions/18223868/how-to-encrypt-jwt-security-token
            //DateTime issuedAt = DateTime.UtcNow;
            DateTime issuedAt = DateTime.UtcNow.ToLocalTime();
            //set the time when it expires
            //DateTime expires = DateTime.UtcNow.AddDays(1);
            DateTime expires = DateTime.UtcNow.ToLocalTime().AddDays(1);

            ClaimsIdentity claimsIdentity = new ClaimsIdentity(new[]
           {
                new Claim(ClaimTypes.Name, input.LoginId)
            });

            var tokenHandler = new JwtSecurityTokenHandler();

            var securityKey = new SymmetricSecurityKey(Encoding.Default.GetBytes(JWTkey));
            var signingCredentials = new SigningCredentials(securityKey, SecurityAlgorithms.HmacSha256Signature);


            //create the jwt
            var token = tokenHandler.CreateJwtSecurityToken(issuer: issuer, audience: issuer, subject: claimsIdentity, notBefore: issuedAt, expires: expires, signingCredentials: signingCredentials);
            var tokenString = tokenHandler.WriteToken(token);
            input.AccessTokenExpired = expires;
            input.AccessToken = tokenString;
            input.AccessTokenExpiredTimeStamp = expires.ToString(DateTimeFormatJson);
            return input;
            //return tokenString;
        }
        public static string RandomString(int length)
        {
            const string chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
            return new string(Enumerable.Repeat(chars, length).Select(s => s[random.Next(s.Length)]).ToArray());
        }
        public static string RandomDigit(int length)
        {
            const string chars = "123456789";
            return new string(Enumerable.Repeat(chars, length).Select(s => s[random.Next(s.Length)]).ToArray());
        }
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
        public static string SaveMediaFiles(string base64, string FilePath, string FileName, string ext)
        {
            string preExt = string.Empty;
            string result = string.Empty;
            string fileType = string.Empty;
            if (!string.IsNullOrEmpty(base64))
            {
                try
                {
                    if (!Directory.Exists(FilePath))
                    {
                        Directory.CreateDirectory(FilePath);
                    }
                    FilePath = FilePath + FileName + ext;
                    if (ext != ".html")
                    {
                        if (base64.StartsWith("data:"))
                        {
                            preExt = base64.Split(',')[0];
                            preExt = preExt.Split(';')[0];
                            preExt = preExt.Replace("data:", "");
                            string[] fileDetails = preExt.Split('/');
                            preExt = fileDetails[1];
                            fileType = fileDetails[0];
                            base64 = base64.Split(',')[1];
                        }
                        byte[] bytes = Convert.FromBase64String(base64);
                        if (!string.IsNullOrEmpty(preExt))
                            FilePath = FilePath.Replace(ext, "." + preExt);
                        File.WriteAllBytes(FilePath, bytes);
                    }
                    else
                    {
                        File.WriteAllText(FilePath, base64);
                    }
                    result = FilePath;
                }
                catch (Exception ex)
                {

                    result = "Invalid";
                    throw ex;
                }
            }
            return result;
        }
        public static string SplitCamelCase(string str)
        {
            return Regex.Replace(Regex.Replace(str,@"(\P{Ll})(\P{Ll}\p{Ll})","$1 $2"),@"(\p{Ll})(\P{Ll})","$1 $2").Replace("_"," ");
        }
        #endregion
    }

   
}
