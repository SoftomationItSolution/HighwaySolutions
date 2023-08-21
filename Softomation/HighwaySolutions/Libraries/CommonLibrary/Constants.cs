using System;
using System.Data;
using System.IdentityModel.Tokens.Jwt;
using System.IO;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Text.RegularExpressions;
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
        public static string DateFormat= "dd-MMM-yyyy";
        public static string DateTimeFormatClient = "dd-MMM-yyyy HH:mm:ss";
        public static string DateTimeFormatJson = "dd-MMM-yyyy HH:mm:ss.fff";
        public static string DateTimeFormat12H = "yyyy-MM-dd hh:mm:ss.fff";
        public static string DateTimeFormat24H = "yyyy-MM-dd HH:mm:ss.fff";
        public static string DateTimeFormat24HForFileName = "yyyy-MM-dd-HH-mm-ss-fff";
        public static string DateTimeFormatFileName = "yyyyMMddHHmmssfff";
        public static string DateTimeFormat24HsqlServer = "yyyy-MM-dd HH:mm:ss.fff";
        public static string DateTimeFormat24HOracleQuery = "dd/MM/yyyy HH:mm:ss";
        public static string DateTimeFormat24HFileFormat = "MM/dd/yyyyHH:mm:ss";
        public static string DateTimeFormatTxnFormat = "yyyy-MM-ddTHH:mm:ss.ffff";
        
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

        #endregion
    }
}
