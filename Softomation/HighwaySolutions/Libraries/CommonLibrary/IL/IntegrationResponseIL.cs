using System;
using System.Collections.Generic;

namespace HighwaySoluations.Softomation.CommonLibrary.IL
{
    public class IntegrationResponseIL
    {
        string responseMessage;
        Object responseData;
        public IntegrationResponseIL()
        {
            this.responseMessage = string.Empty;
            this.responseData = new object();
        }
        public string ResponseMessage
        {
            get => responseMessage; set => responseMessage = value;
        }
        public object ResponseData
        {
            get => responseData; set => responseData = value;
        }
    }
}
