using System;
using HighwaySoluations.Softomation.CommonLibrary;

namespace HighwaySoluations.Softomation.CommonLibrary.IL
{
    public class CommonIL
    {
        Int16 dataStatus;
        String dataStatusName;
        DateTime createdDate;
        Int32 createdBy;
        DateTime modifiedDate;
        Int32 modifiedBy;
        String createdByLoginId;
        String modifiedByLoginId;
        Boolean dataSendStatus;
        Boolean mediaSendStatus;


        public CommonIL()
        {
            this.dataStatus = 0;
            this.dataStatusName = Enum.GetName(typeof(Constants.DataStatusType), (Constants.DataStatusType)dataStatus);
            this.createdDate = DateTime.Now;
            this.createdBy = 0;
            this.createdByLoginId = string.Empty;
            this.modifiedDate = DateTime.Now;
            this.modifiedBy = 0;
            this.modifiedByLoginId = string.Empty;
            this.dataSendStatus = false;
            this.mediaSendStatus = false;
        }

        public Int16 DataStatus
        {
            get => dataStatus; set => dataStatus = value;
        }
        public String DataStatusName
        {
            get
            {
                return dataStatusName;
            }

            set
            {
                dataStatusName = value;
            }
        }
        public DateTime CreatedDate
        {
            get => createdDate; set => createdDate = value;
        }
        public Int32 CreatedBy
        {
            get => createdBy; set => createdBy = value;
        }
        public DateTime ModifiedDate
        {
            get => modifiedDate; set => modifiedDate = value;
        }
        public Int32 ModifiedBy
        {
            get => modifiedBy; set => modifiedBy = value;
        }
        public String CreatedByLoginId
        {
            get
            {
                return createdByLoginId;
            }

            set
            {
                createdByLoginId = value;
            }
        }
        public String ModifiedByLoginId
        {
            get
            {
                return modifiedByLoginId;
            }

            set
            {
                modifiedByLoginId = value;
            }
        }

        public Boolean DataSendStatus
        {
            get
            {
                return dataSendStatus;
            }

            set
            {
                dataSendStatus = value;
            }
        }

        public Boolean MediaSendStatus
        {
            get
            {
                return mediaSendStatus;
            }

            set
            {
                mediaSendStatus = value;
            }
        }
    }
}
