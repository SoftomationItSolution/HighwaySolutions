using System;

namespace Softomation.ATMSSystemLibrary.IL
{
    public class VIDSChallanEventIL : VIDSReviewedEventIL
    {
        Boolean isChallanRequired;
        Int16 challanTypeId;
        String challanTypeName;
        Int16 challanStatusId;
        String challanStatusName;
        String challanRemark;
        public VIDSChallanEventIL()
        {
            this.isChallanRequired = false;
            this.challanTypeId = 0;
            this.challanTypeName = string.Empty;
            this.challanStatusId = 0;
            this.challanStatusName = string.Empty;
            this.challanRemark = string.Empty;
        }

        public Boolean IsChallanRequired
        {
            get
            {
                return isChallanRequired;
            }

            set
            {
                isChallanRequired = value;
            }
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
