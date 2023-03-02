using System;


namespace Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer
{
    public class ResponceIL
    {
        private String alertMessage;
        public ResponceIL()
        {
            alertMessage = string.Empty;
        }
        public String AlertMessage
        {
            get
            {
                return alertMessage;
            }

            set
            {
                alertMessage = value;
            }
        }
    }
}
