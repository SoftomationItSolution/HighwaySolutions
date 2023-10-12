using System;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace HighwaySoluations.Softomation.CommonLibrary.IL
{
    public class DataBaseIL
    {
        #region Variable
        short dataBaseProvider;
        string dbServername;
        string dbName;
        string dbLogin;
        string dbPassword;
        string poolSize;
        string timeout;
        #endregion

        #region Constructor
        public DataBaseIL()
        {
            this.dataBaseProvider = 2;
            this.dbServername = String.Empty;
            this.dbName = String.Empty;
            this.dbLogin = String.Empty;
            this.dbPassword = String.Empty;
            this.poolSize = String.Empty;
            this.timeout = String.Empty;
        }
        #endregion

        #region Property
        [Required]
        [DisplayName("Database Provider:")]
        public short DataBaseProvider
        {
            get => dataBaseProvider; set => dataBaseProvider = value;
        }
        [Required]
        [DisplayName("Database Server:")]
        public string DBServerName
        {
            get => dbServername; set => dbServername = value;
        }
        [Required]
        [DisplayName("Database Name:")]
        public string DBName
        {
            get => dbName; set => dbName = value;
        }
        [Required]
        [DisplayName("Database Username:")]
        public string DBLogin
        {
            get => dbLogin; set => dbLogin = value;
        }
        [Required]
        [DisplayName("Database Password:")]
        public string DBPassword
        {
            get => dbPassword; set => dbPassword = value;
        }
        [Required]
        [DisplayName("Database Poolsize:")]
        public string PoolSize
        {
            get => poolSize; set => poolSize = value;
        }
        [Required]
        [DisplayName("Database Timeout:")]
        public string Timeout
        {
            get => timeout; set => timeout = value;
        }

        #endregion
    }
}
