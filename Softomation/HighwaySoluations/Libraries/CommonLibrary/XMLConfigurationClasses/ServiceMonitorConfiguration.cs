using System;

namespace Softomation.DMS.Libraries.CommonLibrary.XMLConfigurationClasses
{
    public class ServiceMonitorConfiguration
    {
        #region Variable
        string databaseService;
        string otherService;
        string logFolder;
        #endregion

        #region Constructor
        public ServiceMonitorConfiguration()
        {
            this.databaseService = String.Empty;
            this.otherService = String.Empty;
            this.logFolder = String.Empty;
        }
        #endregion

        #region Property
        public String DatabaseService
        {
            get
            {
                return this.databaseService;
            }
            set
            {
                this.databaseService = value;
            }
        }
        public String OtherService
        {
            get
            {
                return this.otherService;
            }
            set
            {
                this.otherService = value;
            }
        }
        public String LogFolder
        {
            get
            {
                return this.logFolder;
            }
            set
            {
                this.logFolder = value;
            }
        }
        #endregion

        #region Helper
        public static ServiceMonitorConfiguration Deserialize()
        {
            ServiceMonitorConfiguration config = (ServiceMonitorConfiguration)Serialization.Serialization.Deserialize(typeof(ServiceMonitorConfiguration), Constants.projectConfigDirectory + "ServiceMonitorConfiguration.xml");
            return config;
        }

        public static void Serialize(ServiceMonitorConfiguration config)
        {
            Serialization.Serialization.Serialize(typeof(ServiceMonitorConfiguration), Constants.projectConfigDirectory + "ServiceMonitorConfiguration.xml", config);
        }
        #endregion
    }
}
