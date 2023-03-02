using System;

namespace Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer
{
    public class PlazaManagementIL : CommonIL
    {
       
        String plazaServerIpAddress;
        String dataSendAPI;
        String dataReceiveAPI;
        //String fTPPath;
        //String fTPLoginId;
        //String fTPPassword;

        public PlazaManagementIL()
        {
            
            this.plazaServerIpAddress = string.Empty;
            this.dataSendAPI = string.Empty;
            this.dataReceiveAPI = string.Empty;
            //this.fTPPath = string.Empty;
            //this.fTPLoginId = string.Empty;
            //this.fTPPassword = string.Empty;
        }
      
      
        public String PlazaServerIpAddress
        {
            get
            {
                return plazaServerIpAddress;
            }

            set
            {
                plazaServerIpAddress = value;
            }
        }
        public String DataSendAPI
        {
            get
            {
                return dataSendAPI;
            }

            set
            {
                dataSendAPI = value;
            }
        }
        public String DataReceiveAPI
        {
            get
            {
                return dataReceiveAPI;
            }

            set
            {
                dataReceiveAPI = value;
            }
        }
        //public String FTPPath
        //{
        //    get
        //    {
        //        return fTPPath;
        //    }

        //    set
        //    {
        //        fTPPath = value;
        //    }
        //}
        //public String FTPLoginId
        //{
        //    get
        //    {
        //        return fTPLoginId;
        //    }

        //    set
        //    {
        //        fTPLoginId = value;
        //    }
        //}
        //public String FTPPassword
        //{
        //    get
        //    {
        //        return fTPPassword;
        //    }

        //    set
        //    {
        //        fTPPassword = value;
        //    }
        //}
    }
}
