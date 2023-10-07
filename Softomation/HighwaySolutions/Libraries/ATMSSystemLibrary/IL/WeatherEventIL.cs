using System;

namespace HighwaySoluations.Softomation.ATMSSystemLibrary.IL
{
    public class WeatherEventIL : EquipmentDetailsIL
    {
        DateTime eventDateTime;
        String eventDateTimeStamp;
        Decimal airTemperature;
        Decimal surfaceTemperature;
        Decimal humidity;
        Decimal visibility;
        Decimal windDirection;
        Decimal windSpeed;
        Decimal airQuality;
        Decimal rainMeasurement;
        String weatherDescription;


        public WeatherEventIL()
        {
            eventDateTime = DateTime.Now;
            eventDateTimeStamp = string.Empty;
            airTemperature = 0;
            surfaceTemperature = 0;
            humidity = 0;
            visibility = 0;
            windDirection = 0;
            windSpeed = 0;
            airQuality = 0;
            rainMeasurement = 0;
            weatherDescription = string.Empty;
        }

        public DateTime EventDateTime
        {
            get
            {
                return eventDateTime;
            }

            set
            {
                eventDateTime = value;
            }
        }
        public String EventDateTimeStamp
        {
            get
            {
                return eventDateTimeStamp;
            }

            set
            {
                eventDateTimeStamp = value;
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
        public Decimal SurfaceTemperature
        {
            get
            {
                return surfaceTemperature;
            }

            set
            {
                surfaceTemperature = value;
            }
        }
        public Decimal Humidity
        {
            get
            {
                return humidity;
            }

            set
            {
                humidity = value;
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
        public Decimal WindDirection
        {
            get
            {
                return windDirection;
            }

            set
            {
                windDirection = value;
            }
        }
        public Decimal WindSpeed
        {
            get
            {
                return windSpeed;
            }

            set
            {
                windSpeed = value;
            }
        }
        public Decimal AirQuality
        {
            get
            {
                return airQuality;
            }

            set
            {
                airQuality = value;
            }
        }
        public Decimal RainMeasurement
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
        public String WeatherDescription
        {
            get
            {
                return weatherDescription;
            }

            set
            {
                weatherDescription = value;
            }
        }
    }
}
