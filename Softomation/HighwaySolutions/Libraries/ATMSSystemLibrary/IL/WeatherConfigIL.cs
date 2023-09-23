using System;
using System.Collections.Generic;
using HighwaySoluations.Softomation.CommonLibrary.IL;
namespace HighwaySoluations.Softomation.ATMSSystemLibrary.IL
{
    public class WeatherConfigIL:CommonIL
    {
        Int16 weatherConfigurationId;
        Decimal airTemperatureMin;
        Decimal airTemperatureMax;
        Decimal humidityRH;
        Decimal humidityAH;
        Decimal visibility;
        Decimal roadTemperature;
        Decimal windDirectionValue;
        Decimal windSpeedValue;
        Decimal rainValue;
        public WeatherConfigIL()
        {
            this.weatherConfigurationId = 0;
            this.airTemperatureMin =0; 
            this.airTemperatureMax = 0; 
            this.humidityRH = 0;
            this.humidityAH = 0;
            this.visibility = 0;
            this.roadTemperature = 0;
            this.windDirectionValue = 0;
            this.windSpeedValue = 0;
            this.rainValue = 0;
        }

        public Int16 WeatherConfigurationId
        {
            get
            {
                return weatherConfigurationId;
            }

            set
            {
                weatherConfigurationId = value;
            }
        }

        public Decimal AirTemperatureMin
        {
            get
            {
                return airTemperatureMin;
            }

            set
            {
                airTemperatureMin = value;
            }
        }

        public Decimal AirTemperatureMax
        {
            get
            {
                return airTemperatureMax;
            }

            set
            {
                airTemperatureMax = value;
            }
        }

        public Decimal HumidityRH
        {
            get
            {
                return humidityRH;
            }

            set
            {
                humidityRH = value;
            }
        }

        public Decimal HumidityAH
        {
            get
            {
                return humidityAH;
            }

            set
            {
                humidityAH = value;
            }
        }

        public Decimal Visibility
        {
            get
            {
                return visibility;
            }

            set
            {
                visibility = value;
            }
        }

        public Decimal RoadTemperature
        {
            get
            {
                return roadTemperature;
            }

            set
            {
                roadTemperature = value;
            }
        }

        public Decimal WindDirectionValue
        {
            get
            {
                return windDirectionValue;
            }

            set
            {
                windDirectionValue = value;
            }
        }

        public Decimal WindSpeedValue
        {
            get
            {
                return windSpeedValue;
            }

            set
            {
                windSpeedValue = value;
            }
        }

        public Decimal RainValue
        {
            get
            {
                return rainValue;
            }

            set
            {
                rainValue = value;
            }
        }
    }
    public class WeatherDataIL : WeatherConfigIL
    {
        Int64 transactionId;
        Int64 equipmentId;
        string equipmentName;
        DateTime eventDate;
        string eventDateTimestamp;
        Decimal airTemperature;
        string windSpeedMeasurement;
        string rainMeasurement;
        bool isAlertRequired;
    
        public WeatherDataIL()
        {
            this.transactionId = 0;
            this.equipmentId = 0;
            this.equipmentName = string.Empty;
            this.eventDate = DateTime.Now;
            this.eventDateTimestamp = string.Empty;
            this.airTemperature = 0;
            this.windSpeedMeasurement = string.Empty;
            this.rainMeasurement = string.Empty;
            this.isAlertRequired = false;
        }

        public Int64 TransactionId
        {
            get
            {
                return transactionId;
            }

            set
            {
                transactionId = value;
            }
        }

        public Int64 EquipmentId
        {
            get
            {
                return equipmentId;
            }

            set
            {
                equipmentId = value;
            }
        }
        public string EquipmentName
        {
            get
            {
                return equipmentName;
            }

            set
            {
                equipmentName = value;
            }
        }
        public DateTime EventDate
        {
            get
            {
                return eventDate;
            }

            set
            {
                eventDate = value;
            }
        }

        public String EventDateTimestamp
        {
            get
            {
                return eventDateTimestamp;
            }

            set
            {
                eventDateTimestamp = value;
            }
        }

        public Decimal AirTemperature
        {
            get
            {
                return airTemperature;
            }

            set
            {
                airTemperature = value;
            }
        }

        public String WindSpeedMeasurement
        {
            get
            {
                return windSpeedMeasurement;
            }

            set
            {
                windSpeedMeasurement = value;
            }
        }

        public String RainMeasurement
        {
            get
            {
                return rainMeasurement;
            }

            set
            {
                rainMeasurement = value;
            }
        }

        public Boolean IsAlertRequired
        {
            get
            {
                return isAlertRequired;
            }

            set
            {
                isAlertRequired = value;
            }
        }
    }

}
