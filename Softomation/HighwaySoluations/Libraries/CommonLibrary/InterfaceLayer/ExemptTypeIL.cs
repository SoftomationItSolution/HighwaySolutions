using System;

namespace Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer
{
    public class ExemptTypeIL : CommonIL
    {
        String exemptTypeName;

        public ExemptTypeIL()
        {
            exemptTypeName = string.Empty;
        }

        public String ExemptTypeName
        {
            get
            {
                return exemptTypeName;
            }

            set
            {
                exemptTypeName = value;
            }
        }
    }
}
