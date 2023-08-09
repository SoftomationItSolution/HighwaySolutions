using System;

namespace Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer
{
    public class ControlRoomIL : CommonIL
    {
        String controlRoomName;

        public ControlRoomIL()
        {
            this.controlRoomName = string.Empty;
        }
        public String ControlRoomName
        {
            get
            {
                return controlRoomName;
            }

            set
            {
                controlRoomName = value;
            }
        }
    }
}
