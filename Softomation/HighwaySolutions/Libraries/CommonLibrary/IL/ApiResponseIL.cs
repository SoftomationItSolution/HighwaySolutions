using System;
using System.Collections.Generic;

namespace HighwaySoluations.Softomation.CommonLibrary.IL
{
    public class ApiResponseIL
    {
        List<ResponseIL> message;
        Object responseData;

        public ApiResponseIL()
        {
            this.message = new List<ResponseIL>();
            this.responseData = new object();
        }
        public List<ResponseIL> Message
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

        public Object ResponseData
        {
            get
            {
                return responseData;
            }

            set
            {
                responseData = value;
            }
        }
    }
}
