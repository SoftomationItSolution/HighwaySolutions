using System;

namespace HighwaySoluations.Softomation.CommonLibrary.IL
{
    public class ManufactureIL : CommonIL
    {

        Int32 manufactureId;
        String manufactureName;
        String manufactureAddress;
        String manufactureEmailId;
        String manufactureMobileNumber;

        public ManufactureIL()
        {
            manufactureId = 0;
            manufactureName = string.Empty;
            manufactureAddress = string.Empty;
            manufactureEmailId = string.Empty;
            manufactureMobileNumber = string.Empty;
        }

        public Int32 ManufactureId
        {
            get
            {
                return manufactureId;
            }

            set
            {
                manufactureId = value;
            }
        }
        public String ManufactureName
        {
            get
            {
                return manufactureName;
            }

            set
            {
                manufactureName = value;
            }
        }
        public String ManufactureAddress
        {
            get
            {
                return manufactureAddress;
            }

            set
            {
                manufactureAddress = value;
            }
        }
        public String ManufactureEmailId
        {
            get
            {
                return manufactureEmailId;
            }

            set
            {
                manufactureEmailId = value;
            }
        }
        public String ManufactureMobileNumber
        {
            get
            {
                return manufactureMobileNumber;
            }

            set
            {
                manufactureMobileNumber = value;
            }
        }
    }
}
