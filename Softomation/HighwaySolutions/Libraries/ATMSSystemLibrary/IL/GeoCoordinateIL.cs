namespace HighwaySoluations.Softomation.ATMSSystemLibrary.IL
{
    public class GeoCoordinateIL
    {
        double latitude;
        double longitude;

        public GeoCoordinateIL()
        {
            this.latitude = 0;
            this.longitude = 0;
        }
        public double Latitude
        {
            get => latitude; set => latitude = value;
        }
        public double Longitude
        {
            get => longitude; set => longitude = value;
        }
    }
}
