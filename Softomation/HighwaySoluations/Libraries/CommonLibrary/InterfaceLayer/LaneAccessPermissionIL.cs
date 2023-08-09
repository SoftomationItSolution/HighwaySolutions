using System;

namespace Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer
{
    public class LaneAccessPermissionIL : CommonIL
    {
        Int16 laneNumber;
        Int16 permissionType;
        Int16 exemptTypeId;
        String exemptTypeName;
        Int16 accessType;
        String accessTypeName;
        Int64 operatorId;
        String operatorName;
        public LaneAccessPermissionIL()
        {
            this.laneNumber = 0;
            this.permissionType = 0;
            this.exemptTypeId = 0;
            this.exemptTypeName = string.Empty;
            this.accessType = 0;
            this.accessTypeName = string.Empty;
            this.operatorId = 0;
            this.operatorName = string.Empty;
        }

        public Int16 LaneNumber
        {
            get
            {
                return laneNumber;
            }

            set
            {
                laneNumber = value;
            }
        }
        public Int16 PermissionType
        {
            get
            {
                return permissionType;
            }

            set
            {
                permissionType = value;
            }
        }
        public Int16 ExemptTypeId
        {
            get
            {
                return exemptTypeId;
            }

            set
            {
                exemptTypeId = value;
            }
        }
        public String ExemptTypeName
        {
            get
            {
                return exemptTypeName;
            }

            set
            {
                exemptTypeName = value;
            }
        }
        public Int16 AccessType
        {
            get
            {
                return accessType;
            }

            set
            {
                accessType = value;
            }
        }
        public String AccessTypeName
        {
            get
            {
                return accessTypeName;
            }

            set
            {
                accessTypeName = value;
            }
        }
        public Int64 OperatorId
        {
            get
            {
                return operatorId;
            }

            set
            {
                operatorId = value;
            }
        }
        public String OperatorName
        {
            get
            {
                return operatorName;
            }

            set
            {
                operatorName = value;
            }
        }
    }
}
