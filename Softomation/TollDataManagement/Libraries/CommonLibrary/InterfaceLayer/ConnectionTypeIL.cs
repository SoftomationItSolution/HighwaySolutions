using System;


namespace Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer
{
    public class ConnectionTypeIL : CommonIL
    {
        String connectionType;

        public ConnectionTypeIL()
        {
            this.connectionType = string.Empty;
        }
        public String ConnectionType
        {
            get
            {
                return connectionType;
            }

            set
            {
                connectionType = value;
            }
        }
    }
}
