using System;
using System.Collections.Generic;

namespace Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer
{
    public class VidsIL : CommonIL
    {
        DateTime eventDateTime;
        String controlRoomName;
        String deviceName;
        Int64 vidsId;
        Int16 eventtypeid;
        String eventypename;

        public VidsIL()
        {
            this.eventDateTime = DateTime.Now;
            this.controlRoomName = string.Empty;
            this.deviceName = string.Empty;
            this.vidsId = 0;
            this.eventtypeid = 0;
            this.eventypename = string.Empty;

        }
        public DateTime EventDateTime
        {
            get => eventDateTime; set => eventDateTime = value;
        }
        public string ControlRoomName
        {
            get => controlRoomName; set => controlRoomName = value;
        }
        public string DeviceName
        {
            get => deviceName; set => deviceName = value;
        }
        public long VidsId
        {
            get => vidsId; set => vidsId = value;
        }
        public Int16 EventTypeId
        {
            get => eventtypeid; set => eventtypeid = value;
        }
        public string EvenTypeName
        {
            get => eventypename; set => eventypename = value;
        }
    }
}
