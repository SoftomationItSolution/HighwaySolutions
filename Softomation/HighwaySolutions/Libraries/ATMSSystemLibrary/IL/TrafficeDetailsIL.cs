using System;

namespace HighwaySoluations.Softomation.ATMSSystemLibrary.IL
{
    public class TrafficeDetailsIL
    {
        Int16 directionId;
        String directionName;
        String timeSloat;
        Int16 vehcileClassId;
        String vehcileClassName;
        String vehcileClassIcon;
        Decimal chainageNumber;
        String chainageName;
      

        public TrafficeDetailsIL()
        {
            directionId = 0;
            directionName = string.Empty;
            timeSloat = string.Empty;
            vehcileClassId = 0;
            vehcileClassName = string.Empty;
            vehcileClassIcon = string.Empty;
            chainageNumber = 0;
            chainageName = string.Empty;
        }

        public Int16 DirectionId
        {
            get
            {
                return directionId;
            }

            set
            {
                directionId = value;
            }
        }
        public String DirectionName
        {
            get
            {
                return directionName;
            }

            set
            {
                directionName = value;
            }
        }
        public String TimeSloat
        {
            get
            {
                return timeSloat;
            }

            set
            {
                timeSloat = value;
            }
        }
        public Int16 VehcileClassId
        {
            get
            {
                return vehcileClassId;
            }

            set
            {
                vehcileClassId = value;
            }
        }
        public String VehcileClassName
        {
            get
            {
                return vehcileClassName;
            }

            set
            {
                vehcileClassName = value;
            }
        }
        public String VehcileClassIcon
        {
            get
            {
                return vehcileClassIcon;
            }

            set
            {
                vehcileClassIcon = value;
            }
        }
        public Decimal ChainageNumber
        {
            get
            {
                return chainageNumber;
            }

            set
            {
                chainageNumber = value;
                //ChainageName = chainageNumber.ToString().Replace(".","+");
                ChainageName = string.Format("{0:0+000}", chainageNumber);
            }
        }
        //public String ChainageName
        //{
        //    get; set;
        //}
        public String ChainageName
        {
            get
            {
                return chainageName;
            }

            set
            {
                chainageName = value;
            }
        }
    }
}
