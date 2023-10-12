using System;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace HighwaySoluations.Softomation.CommonLibrary.IL
{
    public class ServiceMonitorIL
    {
        #region Variable
        string databaseService;
        string otherService;
        string deleteFileExtensions;
        string deleteFileRootPath;
        #endregion

        #region Constructor
        public ServiceMonitorIL()
        {
            this.databaseService = String.Empty;
            this.otherService = String.Empty;
            this.deleteFileExtensions = String.Empty;
            this.deleteFileRootPath = String.Empty;
        }
        #endregion

        #region Property
       
        [DisplayName("Database Service:")]
        public string DatabaseService
        {
            get => databaseService; set => databaseService = value;
        }
        [Required]
        [DisplayName("System Service:")]
        public string OtherService
        {
            get => otherService; set => otherService = value;
        }

        [Required]
        [DisplayName("File Extension(Delete):")]
        public string DeleteFileExtensions
        {
            get => deleteFileExtensions; set => deleteFileExtensions = value;
        }
        [Required]
        [DisplayName("File Path(Delete):")]
        public string DeleteFileRootPath
        {
            get => deleteFileRootPath; set => deleteFileRootPath = value;
        }
        #endregion
    }
}
