using System;
using System.Text;

namespace Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer
{
    public class SoftwareUtilityIL :CommonIL
    {
        Int32 deviceId;
        String applicationName;
        Int16 integrationMethodologyId;
        String methodologyName;
        String localIpAddress;
        Int16 localPort;
        String publicIpAddress;
        Int16 publicPort;

        public SoftwareUtilityIL()
        {
            this.deviceId = 0;
            this.applicationName = string.Empty;
            this.integrationMethodologyId = 0;
            this.methodologyName = string.Empty;
            this.localIpAddress = string.Empty;
            this.localPort = 80;
            this.publicIpAddress = string.Empty;
            this.publicPort = 0;
        }
        public override string ToString()
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("deviceId = " + this.deviceId.ToString() + Environment.NewLine);
            sb.Append("applicationName = " + this.applicationName.ToString() + Environment.NewLine);
            sb.Append("integrationMethodologyId = " + this.integrationMethodologyId.ToString() + Environment.NewLine);
            sb.Append("methodologyName = " + this.methodologyName.ToString() + Environment.NewLine);
            sb.Append("localIpAddress = " + this.localIpAddress.ToString() + Environment.NewLine);
            sb.Append("localPort = " + this.localPort.ToString() + Environment.NewLine);
            sb.Append("publicIpAddress = " + this.publicIpAddress.ToString() + Environment.NewLine);
            sb.Append("publicPort = " + this.publicPort.ToString() + Environment.NewLine);
            return sb.ToString();
        }
        public int DeviceId
        {
            get => deviceId; set => deviceId = value;
        }
        public string ApplicationName
        {
            get => applicationName; set => applicationName = value;
        }
        public short IntegrationMethodologyId
        {
            get => integrationMethodologyId; set => integrationMethodologyId = value;
        }
        public string MethodologyName
        {
            get => methodologyName; set => methodologyName = value;
        }
        public string LocalIpAddress
        {
            get => localIpAddress; set => localIpAddress = value;
        }
        public short LocalPort
        {
            get => localPort; set => localPort = value;
        }
        public string PublicIpAddress
        {
            get => publicIpAddress; set => publicIpAddress = value;
        }
        public short PublicPort
        {
            get => publicPort; set => publicPort = value;
        }
    }
}
