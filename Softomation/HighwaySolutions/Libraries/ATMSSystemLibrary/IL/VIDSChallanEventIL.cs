using System;

namespace HighwaySoluations.Softomation.ATMSSystemLibrary.IL
{
    public class VIDSChallanEventIL : VIDSReviewedEventIL
    {
        Int16 challanTypeId;
        String challanTypeName;
        Int16 challanStatusId;
        String challanStatusName;
        String challanRemark;
        public VIDSChallanEventIL()
        {
            this.challanTypeId = 0;
            this.challanTypeName = string.Empty;
            this.challanStatusId = 0;
            this.challanStatusName = string.Empty;
            this.challanRemark = string.Empty;
        }

        
        public Int16 ChallanTypeId
        {
            get
            {
                return challanTypeId;
            }

            set
            {
                challanTypeId = value;
            }
        }
        public String ChallanTypeName
        {
            get
            {
                return challanTypeName;
            }

            set
            {
                challanTypeName = value;
            }
        }
        public Int16 ChallanStatusId
        {
            get
            {
                return challanStatusId;
            }

            set
            {
                challanStatusId = value;
            }
        }
        public String ChallanStatusName
        {
            get
            {
                return challanStatusName;
            }

            set
            {
                challanStatusName = value;
            }
        }
        public String ChallanRemark
        {
            get
            {
                return challanRemark;
            }

            set
            {
                challanRemark = value;
            }
        }
    }
}
