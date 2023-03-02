using System;
using System.Text;

namespace Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer
{
    public class METEventsIL : CommonIL
    {
        DateTime eventDateTime;
        String controlRoomName;
        String deviceName;
        Int64 metId;
        Decimal airTemperature;
        Decimal humidityRH;
        Decimal humidityAH;
        Decimal visibility;
        Decimal roadTemperature;
        Decimal windDirectionValue;
        String windDirection;
        Decimal windSpeedValue;
        String windSpeedMeasurement;
        Decimal rainValue;
        String rainMeasurement;
        Int16 alertRequired;
        String alertStatus;
        public METEventsIL()
        {
            this.eventDateTime = DateTime.Now;
            this.controlRoomName = string.Empty;
            this.deviceName = string.Empty;
            this.metId = 0;
            this.airTemperature = 0;
            this.humidityRH = 0;
            this.humidityAH = 0;
            this.visibility = 0;
            this.roadTemperature = 0;
            this.windDirectionValue = 0;
            this.windDirection = string.Empty;
            this.windSpeedValue = 0;
            this.windSpeedMeasurement = string.Empty;
            this.rainValue = 0;
            this.rainMeasurement = string.Empty;
            this.alertRequired = 0;
            this.alertStatus = string.Empty;
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
        public long MetId
        {
            get => metId; set => metId = value;
        }
        public decimal AirTemperature
        {
            get => airTemperature; set => airTemperature = value;
        }
        public decimal HumidityRH
        {
            get => humidityRH; set => humidityRH = value;
        }
        public decimal HumidityAH
        {
            get => humidityAH; set => humidityAH = value;
        }
        public decimal Visibility
        {
            get => visibility; set => visibility = value;
        }
        public decimal RoadTemperature
        {
            get => roadTemperature; set => roadTemperature = value;
        }
        public decimal WindDirectionValue
        {
            get => windDirectionValue; set => windDirectionValue = value;
        }
        public string WindDirection
        {
            get => windDirection; set => windDirection = value;
        }
        public decimal WindSpeedValue
        {
            get => windSpeedValue; set => windSpeedValue = value;
        }
        public string WindSpeedMeasurement
        {
            get => windSpeedMeasurement; set => windSpeedMeasurement = value;
        }
        public decimal RainValue
        {
            get => rainValue; set => rainValue = value;
        }
        public string RainMeasurement 
        {
            get => rainMeasurement; set => rainMeasurement = value;
        }
        public short AlertRequired
        {
            get => alertRequired; set => alertRequired = value;
        }
        public string AlertStatus
        {
            get => alertStatus; set => alertStatus = value;
        }
    }
}
