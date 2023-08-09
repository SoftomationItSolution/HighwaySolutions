using System;
using System.Text;

namespace Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer
{
    public class METConfigurationIL : CommonIL
    {
        Decimal airTemperatureMin;
        Decimal airTemperatureMax;
        Decimal humidityRH;
        Decimal humidityAH;
        Decimal visibility;
        Decimal roadTemperature;
        Decimal windDirectionValue;
        Decimal windSpeedValue;
        Decimal rainValue;
        Int16 synchronizeTime;

        public METConfigurationIL()
        {
            this.airTemperatureMin = 0;
            this.airTemperatureMax = 0;
            this.humidityRH = 0;
            this.humidityAH = 0;
            this.visibility = 0;
            this.roadTemperature = 0;
            this.windDirectionValue = 0;
            this.windSpeedValue = 0;
            this.rainValue = 0;
            this.synchronizeTime = 0;
        }
        public decimal AirTemperatureMin
        {
            get => airTemperatureMin; set => airTemperatureMin = value;
        }
        public decimal AirTemperatureMax
        {
            get => airTemperatureMax; set => airTemperatureMax = value;
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
        public decimal WindSpeedValue
        {
            get => windSpeedValue; set => windSpeedValue = value;
        }
        public decimal RainValue
        {
            get => rainValue; set => rainValue = value;
        }
        public short SynchronizeTime
        {
            get => synchronizeTime; set => synchronizeTime = value;
        }
    }
}
