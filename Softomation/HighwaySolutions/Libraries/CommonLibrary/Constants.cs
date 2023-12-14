using System;
using System.Data;
using System.Drawing;
using System.Globalization;
using System.IdentityModel.Tokens.Jwt;
using System.IO;
using System.Linq;
using System.Net;
using System.Reflection;
using System.Security.Claims;
using System.Text;
using System.Text.RegularExpressions;
using ColorHelper;
using HighwaySoluations.Softomation.CommonLibrary.IL;
using Microsoft.IdentityModel.Tokens;

namespace HighwaySoluations.Softomation.CommonLibrary
{
    public class Constants
    {
        #region Project Config
        public const string AppProvider = "Softomation";
        private static Random random = new Random();
        #endregion


        #region For encryption and decryption
        public static string issuer = "http://www.softomation.com";
        public static string passPhrase = "$0ft0m@ti0n";//Pas5pr@se        // can be any string
        public static string saltValue = "HP5502@$";//s@1tValue        // can be any string
        public static string hashAlgorithm = "SHA1";             // can be "MD5"
        public static int passwordIterations = 2;                  // can be any number
        public static string initVector = "@1B2c3D4e5F6g7H8"; // must be 16 bytes
        public static int keySize = 256;                // can be 192 or 128
        public static string JWTkey = AppProvider + "HighwaySoluationsProvider";
        #endregion
        #region Date Time
        public static string DateFormat = "dd-MMM-yyyy";
        public static string DateFileFormat = "ddMMMyyyy";
        public static string DateTimeFormatClient = "dd-MMM-yyyy HH:mm:ss";
        public static string DateTimeFormatJson = "dd-MMM-yyyy HH:mm:ss.fff";
        public static string DateTimeFormat12H = "yyyy-MM-dd hh:mm:ss.fff";
        public static string DateTimeFormat24H = "yyyy-MM-dd HH:mm:ss.fff";
        public static string DateTimeFormat24HForFileName = "yyyy-MM-dd-HH-mm-ss-fff";
        public static string DateTimeFormatFileName = "yyyyMMddHHmmssfff";
        public static string DateTimeFormat24HsqlServer = "yyyy-MM-dd HH:mm:ss.fff";
        public static string DateTimeFormat24HOracleQuery = "dd/MM/yyyy HH:mm:ss";
        public static string DateTimeFormat24HFileFormat = "MM/dd/yyyyHH:mm:ss";
        public static string DateTimeFormatTxnIdFormat = "ddMMyyyyHHmmssffff";

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
            BackOfficeReportAPI,
            BankAPI,
            EventAPI,
            ServiceMonitor,
            BackOfficeService,
            BankService,
            LaneDataTranService,
            LaneConfig
        }
        public enum DataStatusType
        {
            Deleted = 0,
            Active = 1,
            Inactive = 2
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
            MySql = 4,
        }
        public enum ServerEnum
        {
            Local = 0,
            Development = 1,
            Production = 2
        }

        public enum SystemProviderType
        {
            Softomation = 0,
            Other = 1
        }
        public enum MqttMessageType
        {
            SendOnly = 1,
            ReveiveOnly = 2,
            Both = 3
        }
        public enum IPPbxCallStatusType
        {
            Created = 0,
            Setup = 1,
            TransferSetup = 2,
            Ringing = 3,
            InCall = 4,
            CalleeOnHold = 5,
            CallerOnHold = 6,
            OnHold = 7,
            OnHoldInactive = 8,
            TransferRequested = 9,
            Transferring = 10,
            TransferCompleted = 11,
            TransferFailed = 12,
            CallerHungUp = 13,
            CalleeHungUp = 14,
            Redirected = 15,
            NotFound = 16,
            Busy = 17,
            Cancelled = 18,
            NotAnswered = 19,
            Error = 20,
            Aborted = 21,
            Completed = 22
        }
       
        #endregion

        #region Methods
        public static string Decrypt(string input)
        {
            //return Cryptography.AesCbc.DecryptAes256Cbc(input, passPhrase, saltValue, hashAlgorithm, passwordIterations, initVector, keySize);
            return Cryptography.AesCbc.DecryptAes256Cbc(input);
        }
        public static string Encrypt(string input)
        {
            //return Cryptography.AesCbc.EncryptAes256Cbc(input, passPhrase, saltValue, hashAlgorithm, passwordIterations, initVector, keySize);
            return Cryptography.AesCbc.EncryptAes256Cbc(input);
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
            return Regex.Replace(Regex.Replace(str, @"(\P{Ll})(\P{Ll}\p{Ll})", "$1 $2"), @"(\p{Ll})(\P{Ll})", "$1 $2").Replace("_", " ");
        }
        public static string CurrecyFromater(Decimal amount)
        {
            decimal parsed = decimal.Parse(amount.ToString(), CultureInfo.InvariantCulture);
            CultureInfo hindi = new CultureInfo("hi-IN");
            return string.Format(hindi, "{0:c}", parsed);
        }
        public static string ImagetoBase64(string FilePath, string ext)
        {
            try
            {
                using (Image image = Image.FromFile(FilePath))
                {
                    using (MemoryStream m = new MemoryStream())
                    {
                        image.Save(m, image.RawFormat);
                        byte[] imageBytes = m.ToArray();

                        // Convert byte[] to Base64 String
                        string base64String = Convert.ToBase64String(imageBytes);
                        base64String = "data:image/" + ext + ";base64," + base64String;
                        return base64String;
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public static string VideotoBase64(string FilePath, string ext)
        {
            try
            {
                //string contentType = "data:video/mp4;base64,";
                using (FileStream fsRead = new FileStream(FilePath, FileMode.Open))
                {
                    int fsLen = (int)fsRead.Length;
                    byte[] heByte = new byte[fsLen];
                    int r = fsRead.Read(heByte, 0, heByte.Length);

                    string base64Str = Convert.ToBase64String(heByte);
                    base64Str = "data:video/" + ext + ";base64," + base64Str;
                    return base64Str;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public static string BaseToString(string base64)
        {
            try
            {
                byte[] data = Convert.FromBase64String(base64);
                return Encoding.UTF8.GetString(data);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public static DateTime ConvertFromUnixTimestamp(double timestamp)
        {
            DateTime origin = new DateTime(1970, 1, 1, 0, 0, 0, 0, DateTimeKind.Utc);
            return origin.AddSeconds(timestamp);
        }
        public static DateTime ConvertFromUnixTimestampMilisec(double timestamp)
        {
            DateTime origin = new DateTime(1970, 1, 1, 0, 0, 0, 0, DateTimeKind.Utc);
            return origin.AddMilliseconds(timestamp);
        }
        public static double ConvertToUnixTimestamp(DateTime date)
        {
            DateTime origin = new DateTime(1970, 1, 1, 0, 0, 0, 0, DateTimeKind.Utc);
            TimeSpan diff = date.ToUniversalTime() - origin;
            return Math.Floor(diff.TotalSeconds);
        }
        public static DateTime UnixTimeStampToDateTimeLocal(double unixTimeStamp)
        {
            DateTime dateTime = new DateTime(1970, 1, 1, 0, 0, 0, 0, DateTimeKind.Utc);
            dateTime = dateTime.AddSeconds(unixTimeStamp).ToLocalTime();
            return dateTime;
        }
        public static IPAddress[] GetLocalIPAddress()
        {
            try
            {
                string hostName = Dns.GetHostName();
                Console.WriteLine(hostName);

                // Get the IP from GetHostByName method of dns class. 
                return Dns.GetHostByName(hostName).AddressList;
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }
        public static string RGBtoHEX(int red, int green, int blue)
        {
            try
            {
                Color color = Color.FromArgb(red, green, blue);
                string strColor = ColorTranslator.ToHtml(color);
                return strColor;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        static string GetColorName(Color color)
        {
            var colorProperties = typeof(Color)
                .GetProperties(BindingFlags.Public | BindingFlags.Static)
                .Where(p => p.PropertyType == typeof(Color));
            foreach (var colorProperty in colorProperties)
            {
                var colorPropertyValue = (Color)colorProperty.GetValue(null, null);
                if (colorPropertyValue.R == color.R
                       && colorPropertyValue.G == color.G
                       && colorPropertyValue.B == color.B)
                {
                    return colorPropertyValue.Name;
                }
            }

            //If unknown color, fallback to the hex value
            //(or you could return null, "Unkown" or whatever you want)
            return ColorTranslator.ToHtml(color);
        }
        #endregion
    }
}
