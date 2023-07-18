using System;
using System.Data;
using System.Data.SqlClient;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;
using System.Text;
using Microsoft.IdentityModel.Tokens;
using Softomation.ATMSSystemLibrary.DBA;
using Softomation.ATMSSystemLibrary.IL;

namespace Softomation.ATMSSystemLibrary
{
    public class Constants
    {
        #region Project Config
        public static string DriveLetter = "C";
        public static string ProjectName = "ATMSv1";
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

        //public static DevicesMasterIL GetCentralGeoCoordinate(List<DevicesMasterIL> geoCoordinates)
        //{
        //    DevicesMasterIL data = new DevicesMasterIL();
        //    if (geoCoordinates.Count == 1)
        //    {
        //        data.Latitude = geoCoordinates[0].Latitude.ToString();
        //        data.Longitude = geoCoordinates[0].Longitude.ToString();
        //        return data;
        //    }

        //    double x = 0;
        //    double y = 0;
        //    double z = 0;

        //    foreach (var geoCoordinate in geoCoordinates)
        //    {
        //        var latitude = Convert.ToDouble(geoCoordinate.Latitude) * Math.PI / 180;
        //        var longitude = Convert.ToDouble(geoCoordinate.Longitude) * Math.PI / 180;

        //        x += Math.Cos(latitude) * Math.Cos(longitude);
        //        y += Math.Cos(latitude) * Math.Sin(longitude);
        //        z += Math.Sin(latitude);
        //    }

        //    var total = geoCoordinates.Count;

        //    x = x / total;
        //    y = y / total;
        //    z = z / total;

        //    var centralLongitude = Math.Atan2(y, x);
        //    var centralSquareRoot = Math.Sqrt(x * x + y * y);
        //    var centralLatitude = Math.Atan2(z, centralSquareRoot);


        //    data.Latitude = (centralLatitude * 180 / Math.PI).ToString();
        //    data.Longitude = (centralLongitude * 180 / Math.PI).ToString();

        //    return data;//new GeoCoordinate(centralLatitude * 180 / Math.PI, centralLongitude * 180 / Math.PI);
        //}
        //public static string MediaPath(short PlazaId, short LaneNumber, DateTime TransactionTimeStamp)
        //{
        //    return "P" + PlazaId.ToString() + "/" + "L" + LaneNumber.ToString() + "/" + TransactionTimeStamp.ToString("ddMMMyyyy");
        //}

        //public static string ParseJsonForResponce(string JsonResponce)
        //{
        //    JsonResponce = JsonResponce.Replace(",\"ResponceMessage\":\"success\"", "");
        //    JsonResponce = JsonResponce.Replace("{\"ResponceData\":", "");
        //    return JsonResponce = JsonResponce.TrimEnd('}');
        //}

        //public static string ParseJsonForResponceObject(string JsonResponce)
        //{
        //    JsonResponce = JsonResponce.Replace(",\"ResponceMessage\":\"success\"", "");
        //    JsonResponce = JsonResponce.Replace("{\"ResponceData\":", "");
        //    JsonResponce = JsonResponce.TrimEnd('}');
        //    return JsonResponce = JsonResponce + "}";
        //}
        //public static string ImagetoBase64(string FilePath)
        //{
        //    try
        //    {
        //        using (Image image = Image.FromFile(FilePath))
        //        {
        //            using (MemoryStream m = new MemoryStream())
        //            {
        //                image.Save(m, image.RawFormat);
        //                byte[] imageBytes = m.ToArray();

        //                // Convert byte[] to Base64 String
        //                string base64String = Convert.ToBase64String(imageBytes);
        //                return base64String;
        //            }
        //        }
        //    }
        //    catch (Exception ex)
        //    {

        //        throw ex;
        //    }
        //}
        //public static string VideotoBase64(string FilePath)
        //{
        //    try
        //    {
        //        string contentType = "data:video/mp4;base64,";
        //        using (FileStream fsRead = new FileStream(FilePath, FileMode.Open))
        //        {
        //            int fsLen = (int)fsRead.Length;
        //            byte[] heByte = new byte[fsLen];
        //            int r = fsRead.Read(heByte, 0, heByte.Length);

        //            string base64Str = Convert.ToBase64String(heByte);

        //            //return contentType + base64Str;
        //            return base64Str;
        //        }
        //    }
        //    catch (Exception ex)
        //    {

        //        throw ex;
        //    }
        //}
        //public static string RandomString(int length)
        //{
        //    const string chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
        //    return new string(Enumerable.Repeat(chars, length)
        //      .Select(s => s[random.Next(s.Length)]).ToArray());
        //}
        //public static List<ResponceIL> ConvertResponceList(DataTable dt)
        //{
        //    List<ResponceIL> responces = new List<ResponceIL>();
        //    try
        //    {
        //        foreach (DataRow item in dt.Rows)
        //            responces.Add(ConvertResponceCBE(item));

        //    }
        //    catch (Exception ex)
        //    {
        //        throw ex;
        //    }
        //    return responces;
        //}
        //public static ResponceIL ConvertResponceCBE(DataRow row)
        //{
        //    ResponceIL responce = new ResponceIL();
        //    try
        //    {

        //        if (row["AlertMessage"] != DBNull.Value)
        //            responce.AlertMessage = Convert.ToString(row["AlertMessage"]);

        //    }
        //    catch (Exception ex)
        //    {
        //        throw ex;
        //    }
        //    return responce;
        //}

        //public static string DecimaltoString(Decimal input)
        //{
        //    string result = (Decimal.ToInt32(input)).ToString();

        //    return result;
        //}


        //public static string GetAddress()
        //{
        //    StringBuilder sb = new StringBuilder();
        //    sb.Append("Equity Tower 38th floor Sudirman Central Business District (SCBD)");
        //    sb.Append("Jl.Jend.Sudirman kav.52 - 53, Lot 9");
        //    sb.Append("Jakarta 12190, Indonesia");
        //    sb.Append("P: +62 21 515 0100");
        //    sb.Append("F: +62 21 515 1221");

        //    return sb.ToString();
        //}
        //public static string GetEmailBody()
        //{
        //    string body = string.Empty;
        //    using (StreamReader reader = new StreamReader(projectConfigDirectory + "EmailTemplate.html"))
        //    {
        //        body = reader.ReadToEnd();
        //    }
        //    body = body.Replace("[ProjectName]", ProjectName);
        //    body = body.Replace("[Address]", GetAddress());
        //    return body;
        //}
        //public static Boolean PingFunction(string ipAddress)
        //{
        //    try
        //    {
        //        Ping pingSender = new Ping();
        //        PingOptions options = new PingOptions();

        //        // Use the default Ttl value which is 128,
        //        // but change the fragmentation behavior.
        //        options.DontFragment = true;

        //        // Create a buffer of 32 bytes of data to be transmitted.
        //        string data = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa";
        //        byte[] buffer = Encoding.ASCII.GetBytes(data);
        //        int timeout = 50;

        //        PingReply reply = pingSender.Send(ipAddress, timeout, buffer, options);
        //        if (reply.Status == IPStatus.Success)
        //        {
        //            return true;
        //        }
        //        else
        //        {
        //            return false;
        //        }
        //    }
        //    catch
        //    {
        //        return false;
        //    }
        //}

        //public static string IsLetterOrDigit(string input)
        //{
        //    string result = "";

        //    foreach (char c in input)
        //    {
        //        if (Char.IsLetterOrDigit(c))
        //        {
        //            result += c;
        //        }
        //    }

        //    return result;
        //}
        //public static String RemoveControlCharacter(string input)
        //{
        //    string temp = "";

        //    foreach (char c in input)
        //    {
        //        if (!char.IsControl(c))
        //        {
        //            temp += c;
        //        }
        //    }

        //    return temp;
        //}



        //public static string GetLocalIPAddress()
        //{
        //    var host = Dns.GetHostEntry(Dns.GetHostName());
        //    foreach (var ip in host.AddressList)
        //    {
        //        if (ip.AddressFamily == AddressFamily.InterNetwork && ip.ToString() != "127.0.0.1")
        //        {
        //            if (!ip.ToString().StartsWith("169"))
        //                return ip.ToString();
        //        }
        //    }
        //    throw new Exception("Local IP Address Not Found!");

        //}

        //public static List<string> GetLocalIPAddressList()
        //{
        //    List<string> result = new List<string>();
        //    var host = Dns.GetHostEntry(Dns.GetHostName());
        //    result.Add("127.0.0.1");
        //    foreach (var ip in host.AddressList)
        //    {
        //        if (IsValidateIP(ip.ToString()))
        //        {
        //            result.Add(ip.ToString());
        //        }

        //        //if (ip.AddressFamily == AddressFamily.InterNetwork && ip.ToString() != "127.0.0.1")
        //        //{
        //        //    result.Add(ip.ToString());
        //        //    //if (!ip.ToString().StartsWith("169"))
        //        //    //    return ip.ToString();
        //        //}
        //    }
        //    return result;
        //    throw new Exception("Local IP Address Not Found!");
        //}

        //public static DateTime GetCultureDateTime(string DT)
        //{
        //    return Convert.ToDateTime(DT, System.Globalization.CultureInfo.GetCultureInfo("hi-IN").DateTimeFormat);
        //}

        //public static String GetCultureDateTimeFormated(string DT)
        //{
        //    return (Convert.ToDateTime(DT, System.Globalization.CultureInfo.GetCultureInfo("hi-IN").DateTimeFormat)).ToString("yyyy/MM/dd HH:mm:ss");
        //}
        //public static Int16 GetCurrentTMSId(string IPAddress)
        //{
        //    Int16 TMS = 1;
        //    return TMS;
        //}


        //public static int GetCurrentPlazaId()
        //{
        //    return 1;
        //}

        //public static int GetControlRoomId()
        //{
        //    return 1;
        //}

        //public static String GetDevelopedByName()
        //{
        //    string result = "Softomation Technologies";
        //    return result;
        //}

        //public static String GetCompanyName()
        //{
        //    string result = "Softomation Technologies";



        //    return result;

        //}

        //public static bool IsPingSuccessful(string ipAddress)
        //{
        //    bool result = true;

        //    try
        //    {
        //        Ping pingSender = new Ping();
        //        PingOptions options = new PingOptions();

        //        // Use the default Ttl value which is 128,
        //        // but change the fragmentation behavior.
        //        options.DontFragment = true;

        //        // Create a buffer of 32 bytes of data to be transmitted.
        //        string data = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa";
        //        byte[] buffer = Encoding.ASCII.GetBytes(data);
        //        int timeout = 50;

        //        PingReply reply = pingSender.Send(ipAddress, timeout, buffer, options);
        //        if (reply.Status == IPStatus.Success)
        //        {
        //            result = true;
        //        }
        //        else
        //        {
        //            result = false;
        //        }
        //    }
        //    catch
        //    {
        //        result = false;
        //    }

        //    return result;
        //}

        //public static bool CheckIPValid(string strIP)
        //{
        //    IPAddress result = null;
        //    return
        //        !String.IsNullOrEmpty(strIP) &&
        //        IPAddress.TryParse(strIP, out result);
        //}
        //public static bool IsPortOpen(string host, int port, TimeSpan timeout)
        //{
        //    try
        //    {
        //        using (var client = new System.Net.Sockets.TcpClient())
        //        {
        //            var result = client.BeginConnect(host, port, null, null);
        //            var success = result.AsyncWaitHandle.WaitOne(timeout);
        //            client.EndConnect(result);
        //            return success;
        //        }
        //    }
        //    catch (Exception)
        //    {
        //        return false;
        //    }
        //}
        //public static int DeleteLogFile()
        //{
        //    int count = 0;

        //    try
        //    {
        //        //Get all files with full path
        //        string[] filePaths = Directory.GetFiles(driveLetter + @":\ATMS\log\", "*.*", SearchOption.AllDirectories);

        //        //Iterate thru each file
        //        foreach (string path in filePaths)
        //        {
        //            FileInfo fi = new FileInfo(path);

        //            //Delete file if size is greater than 500 MB it happens some time if there is no connectivity and log file is written in thread loop
        //            // Delete 20 days older log files
        //            if (fi.Length >= 524288000 || (DateTime.Now - fi.CreationTime).TotalDays > 20)
        //            {
        //                fi.Delete();
        //                count++;
        //            }
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        throw ex;
        //    }

        //    return count;
        //}

        //public static string UTCtoDateTimeString(string timestamp)
        //{
        //    DateTime dt = DateTime.Now;
        //    string cTime = "";
        //    try
        //    {
        //        if (!string.IsNullOrEmpty(timestamp))
        //        {
        //            double Dtimestamp = Convert.ToDouble(timestamp);
        //            dt = new DateTime(1970, 1, 1, 0, 0, 0, 0).AddSeconds(Math.Round(Dtimestamp / 1000d)).ToLocalTime();

        //            cTime = dt.ToString(Libraries.CommonLibrary.Constants.dateTimeFormat24HWithoutMS);

        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        throw ex;
        //    }
        //    return cTime;
        //}

        //public static DateTime UTCtoDateTime(string timestamp)
        //{
        //    DateTime dt = DateTime.Now;

        //    try
        //    {
        //        if (!string.IsNullOrEmpty(timestamp))
        //        {
        //            double Dtimestamp = Convert.ToDouble(timestamp);
        //            dt = new DateTime(1970, 1, 1, 0, 0, 0, 0).AddSeconds(Math.Round(Dtimestamp / 1000d)).ToLocalTime();
        //            dt = Convert.ToDateTime(dt.ToString(Libraries.CommonLibrary.Constants.dateTimeFormat24HWithoutMS));
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        throw ex;
        //    }
        //    return dt;
        //}

        //public static string ConversionDateTimeString(string timestamp)
        //{
        //    try
        //    {
        //        return Convert.ToDateTime(timestamp).ToString(Libraries.CommonLibrary.Constants.dateTimeFormat24HWithoutMS);
        //    }
        //    catch (Exception ex)
        //    {
        //        throw ex;
        //    }
        //}

        //public static DateTime ConversionDateTime(string timestamp)
        //{
        //    try
        //    {
        //        return Convert.ToDateTime(Convert.ToDateTime(timestamp).ToString(Libraries.CommonLibrary.Constants.dateTimeFormat24HWithoutMS));
        //    }
        //    catch (Exception ex)
        //    {
        //        throw ex;
        //    }
        //}

        //public static string GetHashValue(string input)
        //{
        //    var hash = new SHA1Managed().ComputeHash(Encoding.UTF8.GetBytes(input));
        //    return string.Concat(hash.Select(b => b.ToString("x2")));
        //}

        //public static string SaveByteArrayAsImage(string fullOutputPath, string bytesString, string FileName)
        //{
        //    try
        //    {

        //        if (!string.IsNullOrEmpty(bytesString))
        //        {
        //            string base64String = bytesString.Replace("\n", "");
        //            byte[] imageBytes = Convert.FromBase64String(base64String);
        //            Image x = (Bitmap)((new ImageConverter()).ConvertFrom(imageBytes));
        //            FileName = fullOutputPath + "\\" + FileName;
        //            x.Save(FileName);
        //        }
        //        else
        //        {
        //            FileName = string.Empty;
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        throw ex;
        //    }
        //    return FileName;
        //}

        //public static string MD5Hash(string input)
        //{
        //    StringBuilder hash = new StringBuilder();
        //    MD5CryptoServiceProvider md5provider = new MD5CryptoServiceProvider();
        //    byte[] bytes = md5provider.ComputeHash(new UTF8Encoding().GetBytes(input));

        //    for (int i = 0; i < bytes.Length; i++)
        //    {
        //        hash.Append(bytes[i].ToString("x2"));
        //    }
        //    return hash.ToString();
        //}

        //public static string Hash(string input)
        //{
        //    using (SHA1Managed sha1 = new SHA1Managed())
        //    {
        //        var hash = sha1.ComputeHash(Encoding.UTF8.GetBytes(input));
        //        var sb = new StringBuilder(hash.Length * 2);

        //        foreach (byte b in hash)
        //        {
        //            // can be "x2" if you want lowercase
        //            sb.Append(b.ToString("X2"));
        //        }
        //        return sb.ToString();
        //    }
        //}

        //public static string SubStringSMSResponce(string responce)
        //{
        //    int length = responce.Length;
        //    string result = string.Empty;

        //    if (length > 4)
        //    {
        //        string successcode = responce.Substring(0, 4);
        //        result = successcode;
        //        string trsnId = responce.Substring(4, length - 4);
        //        result = successcode + "," + trsnId;
        //    }
        //    else
        //    {
        //        string successcode = responce.Substring(0, 4);
        //        result = successcode;
        //        result = successcode + ",";
        //    }
        //    return result;
        //}

        //public static string ReferenceNumber(Int64 Id, string Initial)
        //{
        //    String RefNumber = String.Empty;
        //    RefNumber = Initial + Id.ToString("00000000");
        //    return RefNumber;
        //}
        //#endregion

        //#region Regex

        //public static bool IsValidateIP(string Address)
        //{
        //    //Match pattern for IP address    
        //    string Pattern = @"^([1-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])(\.([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])){3}$";
        //    //Regular Expression object    
        //    Regex check = new Regex(Pattern);

        //    //check to make sure an ip address was provided    
        //    if (string.IsNullOrEmpty(Address))
        //        //returns false if IP is not provided    
        //        return false;
        //    else
        //        //Matching the pattern    
        //        return check.IsMatch(Address, 0);
        //}

        ///// <summary>
        ///// for digits with decimal. 7 digits before decimal & 3digits after decimal.
        ///// </summary>
        ///// <param name="input"></param>
        ///// <returns></returns>
        //public static bool IsDecimalNumber(string input)
        //{
        //    bool result = false;

        //    if (Regex.Match(input, @"^\d{1,7}(\.\d{0,3})?$").Success)
        //    {
        //        result = true;
        //    }

        //    return result;
        //}

        ///// <summary>
        ///// for only digits with length of 4.
        ///// </summary>
        ///// <param name="input"></param>
        ///// <returns></returns>
        //public static bool IsDigit(string input)
        //{
        //    bool result = false;

        //    if (Regex.Match(input, @"^\d{1,4}$").Success)
        //    {
        //        result = true;
        //    }

        //    return result;
        //}


        ///// <summary>
        ///// for only digits.
        ///// </summary>
        ///// <param name="input"></param>
        ///// <returns></returns>
        //public static bool IsADigit(string input)
        //{
        //    bool result = false;

        //    if (Regex.Match(input, @"^\d{1,10}$").Success)
        //    {
        //        result = true;
        //    }

        //    return result;
        //}

        ///// <summary>
        ///// for alphabets with space.
        ///// </summary>
        ///// <param name="input"></param>
        ///// <returns></returns>
        //public static bool IsAlpha(string input)
        //{
        //    bool result = false;

        //    if (Regex.Match(input, @"^([a-zA-Z\s])*$").Success)
        //    {
        //        result = true;
        //    }

        //    return result;
        //}

        ///// <summary>
        ///// for IP address.
        ///// </summary>
        ///// <param name="input"></param>
        ///// <returns></returns>
        //public static bool IsIP(string input)
        //{
        //    bool result = false;

        //    if (Regex.Match(input, @"^(([01]?\d\d?|2[0-4]\d|25[0-5])\.){3}([01]?\d\d?|25[0-5]|2[0-4]\d)$").Success)
        //    {
        //        result = true;
        //    }

        //    return result;
        //}

        ///// <summary>
        ///// for Email.
        ///// </summary>
        ///// <param name="input"></param>
        ///// <returns></returns>
        //public static bool IsEmail(string input)
        //{
        //    bool result = false;

        //    if (Regex.Match(input, @"^[\w-]+(\.[\w-]+)*@([a-z0-9-]+(\.[a-z0-9-]+)*?\.[a-z]{2,6}|(\d{1,3}\.){3}\d{1,3})(:\d{4})?$").Success)
        //    {
        //        result = true;
        //    }

        //    return result;
        //}



        ///// <summary>
        ///// for CellNo.
        ///// </summary>
        ///// <param name="input"></param>
        ///// <returns></returns>
        //public static bool IsCellNO(string input)
        //{
        //    bool result = false;

        //    if (Regex.Match(input, @"^([0-9]{10})$").Success)
        //    {
        //        result = true;
        //    }

        //    return result;
        //}

        ///// <summary>
        ///// for Special Chararcters
        ///// </summary>
        ///// <param name="input"></param>
        ///// <returns></returns>
        //public static bool IsSpecialChar(string input)
        //{
        //    bool result = false;

        //    if (Regex.Match(input, @"^[a-zA-Z0-9]*$").Success)
        //    {
        //        result = true;
        //    }

        //    return result;
        //}
        #endregion
    }
}
