using System;

namespace Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer
{
    public class IncidentIL : CommonIL
    {
        private String incidentName;
        private DateTime incidentReportDate;
        private DateTime incidentDate;
        private Int32 incidentCategoryId;
        private string incidentCategoryname;
        private String incidentRefNo;
        private String incidentSourceType;
        private String incidentSourceDevice;
        private String vehicleRegNo;
        private String personName;
        private String phoneNo;
        private String comments;
        private String incidentLocation;
        private String incidentLat;
        private String incidentLong;
        //private Int32 incidentStatus;
        //private int modifierId;
        //private int createrId;
        //private DateTime creationDate;
        //private DateTime modificationDate;

        public IncidentIL()
        {
            this.incidentName = String.Empty;
            this.incidentReportDate = DateTime.Now;
            this.incidentDate = DateTime.Now;
            this.incidentCategoryId = 0;
            this.incidentRefNo = String.Empty;
            this.incidentSourceType = String.Empty;
            this.incidentSourceDevice = String.Empty;
            this.vehicleRegNo = String.Empty;
            this.personName = String.Empty;
            this.phoneNo = String.Empty;
            this.comments = String.Empty;
            this.incidentLocation = String.Empty;
            this.incidentLat = String.Empty;
            this.incidentLong = String.Empty;
            //this.incidentStatus = 0;
            //this.createrId = 0;
            //this.modifierId = 0;
            //this.creationDate = DateTime.Now;
            //this.modificationDate = DateTime.Now;
        }

        
        public String IncidentName
        {
            get
            {
                return this.incidentName;
            }
            set
            {
                this.incidentName = value;
            }
        }
        public DateTime IncidentReportDate
        {
            get
            {
                return this.incidentReportDate;
            }
            set
            {
                this.incidentReportDate = value;
            }
        }
        public DateTime IncidentDate
        {
            get
            {
                return this.incidentDate;
            }
            set
            {
                this.incidentDate = value;
            }
        }
        public Int32 IncidentCategoryId
        {
            get
            {
                return this.incidentCategoryId;
            }
            set
            {
                this.incidentCategoryId = value;
            }
        }
        public string IncidentCategoryName
        {
            get
            {
                return this.incidentCategoryname;
            }
            set
            {
                this.incidentCategoryname = value;
            }
        }
        public String IncidentRefNo
        {
            get
            {
                return this.incidentRefNo;
            }
            set
            {
                this.incidentRefNo = value;
            }
        }
        public String IncidentSourceType
        {
            get
            {
                return this.incidentSourceType;
            }
            set
            {
                this.incidentSourceType = value;
            }
        }
        public String IncidentSourceDevice
        {
            get
            {
                return this.incidentSourceDevice;
            }
            set
            {
                this.incidentSourceDevice = value;
            }
        }
        public String VehicleRegNo
        {
            get
            {
                return this.vehicleRegNo;
            }
            set
            {
                this.vehicleRegNo = value;
            }
        }
        public String PersonName
        {
            get
            {
                return this.personName;
            }
            set
            {
                this.personName = value;
            }
        }
        public String PhoneNo
        {
            get
            {
                return this.phoneNo;
            }
            set
            {
                this.phoneNo = value;
            }
        }
        public String Comments
        {
            get
            {
                return this.comments;
            }
            set
            {
                this.comments = value;
            }
        }
        public String IncidentLocation
        {
            get
            {
                return this.incidentLocation;
            }
            set
            {
                this.incidentLocation = value;
            }
        }
        public String IncidentLat
        {
            get
            {
                return this.incidentLat;
            }
            set
            {
                this.incidentLat = value;
            }
        }
        public String IncidentLong
        {
            get
            {
                return this.incidentLong;
            }
            set
            {
                this.incidentLong = value;
            }
        }
        //public Int32 IncidentStatus
        //{
        //    get
        //    {
        //        return this.incidentStatus;
        //    }
        //    set
        //    {
        //        this.incidentStatus = value;
        //    }
        //}
        //public DateTime CreationDate
        //{
        //    get
        //    {
        //        return this.creationDate;
        //    }
        //    set
        //    {
        //        this.creationDate = value;
        //    }
        //}
        //public int CreaterId
        //{
        //    get
        //    {
        //        return this.createrId;
        //    }
        //    set
        //    {
        //        this.createrId = value;
        //    }
        //}
        //public DateTime ModificationDate
        //{
        //    get
        //    {
        //        return this.modificationDate;
        //    }
        //    set
        //    {
        //        this.modificationDate = value;
        //    }
        //}
        //public int ModifierId
        //{
        //    get
        //    {
        //        return this.modifierId;
        //    }
        //    set
        //    {
        //        this.modifierId = value;
        //    }
        //}
    }
}
