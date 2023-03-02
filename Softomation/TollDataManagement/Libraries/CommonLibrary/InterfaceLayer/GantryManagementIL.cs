using System;
using System.Text;

namespace Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer
{
    public class GantryManagementIL : ControlRoomIL
    {
        Int16 controlRoomId;
        String gantryName;
        String latitude;
        String longitude;
        public GantryManagementIL()
        {
            this.controlRoomId = 0;
            this.gantryName = string.Empty;
            this.latitude = string.Empty;
            this.longitude = string.Empty;
        }

        public override string ToString()
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("controlRoomId = " + this.controlRoomId.ToString() + Environment.NewLine);
            sb.Append("gantryName = " + this.gantryName.ToString() + Environment.NewLine);
            sb.Append("latitude = " + this.latitude.ToString() + Environment.NewLine);
            sb.Append("longitude = " + this.longitude.ToString() + Environment.NewLine);
            return sb.ToString();
        }
        public short ControlRoomId
        {
            get => controlRoomId; set => controlRoomId = value;
        }
        public string GantryName
        {
            get => gantryName; set => gantryName = value;
        }
        public string Latitude
        {
            get => latitude; set => latitude = value;
        }
        public string Longitude
        {
            get => longitude; set => longitude = value;
        }
    }
}
