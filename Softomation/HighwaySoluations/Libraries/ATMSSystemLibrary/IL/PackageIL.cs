using System;

namespace HighwaySoluations.Softomation.ATMSSystemLibrary.IL
{
    public class PackageIL: ControlRoomIL
    {
        short packageId;
        string packageName;
        decimal startChainageNumber;
        decimal endChainageNumber;
        decimal startLatitude;
        decimal startLongitude;
        decimal endLatitude;
        decimal endLongitude;

        public PackageIL()
        {
            packageId = 0;
            packageName = string.Empty;
            startChainageNumber = 0; 
            endChainageNumber = 0;
            startLatitude = 0;
            startLongitude = 0;
            endLatitude = 0;
            endLongitude = 0;
        }

        public Int16 PackageId
        {
            get
            {
                return packageId;
            }

            set
            {
                packageId = value;
            }
        }

        public String PackageName
        {
            get
            {
                return packageName;
            }

            set
            {
                packageName = value;
            }
        }

        public Decimal StartChainageNumber
        {
            get
            {
                return startChainageNumber;
            }

            set
            {
                startChainageNumber = value;
            }
        }

        public Decimal EndChainageNumber
        {
            get
            {
                return endChainageNumber;
            }

            set
            {
                endChainageNumber = value;
            }
        }

        public Decimal StartLatitude
        {
            get
            {
                return startLatitude;
            }

            set
            {
                startLatitude = value;
            }
        }

        public Decimal StartLongitude
        {
            get
            {
                return startLongitude;
            }

            set
            {
                startLongitude = value;
            }
        }

        public Decimal EndLatitude
        {
            get
            {
                return endLatitude;
            }

            set
            {
                endLatitude = value;
            }
        }

        public Decimal EndLongitude
        {
            get
            {
                return endLongitude;
            }

            set
            {
                endLongitude = value;
            }
        }
    }
}
