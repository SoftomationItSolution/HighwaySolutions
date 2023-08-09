using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Softomation.DMS.Libraries.CommonLibrary.Json
{
    public class IntegrationRequestResponce
    {
        string message;
        Object responceData;
        //IEnumerable<Object> responceListData;

        public IntegrationRequestResponce()
        {
            this.message = string.Empty;
            this.responceData = new object();
            //this.responceListData = null;
        }
        public Object ResponceData
        {
            get
            {
                return responceData;
            }

            set
            {
                responceData = value;
            }
        }

        public String ResponceMessage
        {
            get
            {
                return message;
            }

            set
            {
                message = value;
            }
        }

        //public IEnumerable<Object> ResponceListData
        //{
        //    get
        //    {
        //        return responceListData;
        //    }

        //    set
        //    {
        //        responceListData = value;
        //    }
        //}
    }
}
