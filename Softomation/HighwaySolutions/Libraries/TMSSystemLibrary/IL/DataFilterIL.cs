using System;
using System.Collections.Generic;
using HighwaySoluations.Softomation.CommonLibrary.IL;

namespace HighwaySoluations.Softomation.TMSSystemLibrary.IL
{
    public class DataFilterIL
    {
        private String shiftFilterList;
        private String tCUserFilterList;
        private String auditerFilterList;
        private String plazaFilterList;
        private String laneFilterList;
        private String transactionTypeFilterList;
        private String payemntTypeFilterList;
        private String exemptTypeFilterList;
        private String vehicleSubClassFilterList;
        private String vehicleClassFilterList;
        private String reviewedFilterList;
        private String startDateTime;
        private String endDateTime;
        private String plateNumber;
        private Int64 transactionId;
        Boolean isReviewedRequired;
        private String filterQuery;
        private List<MasterDataIL> shiftTiminingList;
        private List<MasterDataIL> tCMasterList;
        private List<MasterDataIL> auditerMasterList;
        private List<MasterDataIL> plazaDataList;
        private List<MasterDataIL> laneDataList;
        private List<MasterDataIL> transactionTypeList;
        private List<MasterDataIL> payemntTypeList;
        private List<MasterDataIL> exemptTypeList;
        private List<MasterDataIL> systemClassList;
        private List<MasterDataIL> systemSubClassList;

        public DataFilterIL()
        {
            this.shiftFilterList = string.Empty;
            this.tCUserFilterList = string.Empty;
            this.auditerFilterList = string.Empty;
            this.plazaFilterList = string.Empty;
            this.laneFilterList = string.Empty;
            this.transactionTypeFilterList = string.Empty;
            this.payemntTypeFilterList = string.Empty;
            this.exemptTypeFilterList = string.Empty;
            this.vehicleClassFilterList = string.Empty;
            this.vehicleSubClassFilterList = string.Empty;
            this.reviewedFilterList = string.Empty;
            this.startDateTime = string.Empty;
            this.endDateTime = string.Empty;
            this.plateNumber = string.Empty;
            this.transactionId = 0;
            this.isReviewedRequired = false;
            this.filterQuery = string.Empty;
           
            shiftTiminingList = new List<MasterDataIL>();
            tCMasterList = new List<MasterDataIL>();
            auditerMasterList = new List<MasterDataIL>();
            plazaDataList = new List<MasterDataIL>();
            laneDataList = new List<MasterDataIL>();
            transactionTypeList = new List<MasterDataIL>();
            payemntTypeList = new List<MasterDataIL>();
            exemptTypeList = new List<MasterDataIL>();
            systemClassList = new List<MasterDataIL>();
            systemSubClassList = new List<MasterDataIL>();
        }

        public string ShiftFilterList
        {
            get => shiftFilterList; set => shiftFilterList = value;
        }
        public string TCUserFilterList
        {
            get => tCUserFilterList; set => tCUserFilterList = value;
        }
        public string AuditerFilterList
        {
            get => auditerFilterList; set => auditerFilterList = value;
        }
        public string PlazaFilterList
        {
            get => plazaFilterList; set => plazaFilterList = value;
        }
        public string LaneFilterList
        {
            get => laneFilterList; set => laneFilterList = value;
        }
        public string TransactionTypeFilterList
        {
            get => transactionTypeFilterList; set => transactionTypeFilterList = value;
        }
        public string PayemntTypeFilterList
        {
            get => payemntTypeFilterList; set => payemntTypeFilterList = value;
        }
        public string ExemptTypeFilterList
        {
            get => exemptTypeFilterList; set => exemptTypeFilterList = value;
        }
        public string VehicleClassFilterList
        {
            get => vehicleClassFilterList; set => vehicleClassFilterList = value;
        }
        public string VehicleSubClassFilterList
        {
            get => vehicleSubClassFilterList; set => vehicleSubClassFilterList = value;
        }
        public string ReviewedFilterList
        {
            get => reviewedFilterList; set => reviewedFilterList = value;
        }
        public string StartDateTime
        {
            get => startDateTime; set => startDateTime = value;
        }
        public string EndDateTime
        {
            get => endDateTime; set => endDateTime = value;
        }
        public string PlateNumber
        {
            get => plateNumber; set => plateNumber = value;
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
        public bool IsReviewedRequired
        {
            get => isReviewedRequired; set => isReviewedRequired = value;
        }
        public string FilterQuery
        {
            get => filterQuery; set => filterQuery = value;
        }
        public List<MasterDataIL> ShiftTiminingList
        {
            get
            {
                return shiftTiminingList;
            }

            set
            {
                shiftTiminingList = value;
            }
        }
        public List<MasterDataIL> TCMasterList
        {
            get
            {
                return tCMasterList;
            }

            set
            {
                tCMasterList = value;
            }
        }
        public List<MasterDataIL> AuditerMasterList
        {
            get
            {
                return auditerMasterList;
            }

            set
            {
                auditerMasterList = value;
            }
        }
        public List<MasterDataIL> PlazaDataList
        {
            get
            {
                return plazaDataList;
            }

            set
            {
                plazaDataList = value;
            }
        }
        public List<MasterDataIL> LaneDataList
        {
            get
            {
                return laneDataList;
            }

            set
            {
                laneDataList = value;
            }
        }
        public List<MasterDataIL> TransactionTypeList
        {
            get
            {
                return transactionTypeList;
            }

            set
            {
                transactionTypeList = value;
            }
        }
        public List<MasterDataIL> PayemntTypeList
        {
            get
            {
                return payemntTypeList;
            }

            set
            {
                payemntTypeList = value;
            }
        }
        public List<MasterDataIL> ExemptTypeList
        {
            get
            {
                return exemptTypeList;
            }

            set
            {
                exemptTypeList = value;
            }
        }
        public List<MasterDataIL> SystemClassList
        {
            get
            {
                return systemClassList;
            }

            set
            {
                systemClassList = value;
            }
        }
        public List<MasterDataIL> SystemSubClassList
        {
            get
            {
                return systemSubClassList;
            }

            set
            {
                systemSubClassList = value;
            }
        }

        
    }
}
