using System;

namespace Softomation.ATMSSystemLibrary.IL
{
    public class ControlRoomIL : CommonIL
    {
        Int64 controlRoomId;
        String controlRoomName;

        public ControlRoomIL()
        {
            this.controlRoomId = 0;
            this.controlRoomName = string.Empty;
        }
        public Int64 ControlRoomId
        {
            get
            {
                return controlRoomId;
            }

            set
            {
                controlRoomId = value;
            }
        }
        public String ControlRoomName
        {
            get => controlRoomName; set => controlRoomName = value;
        }
    }
}
