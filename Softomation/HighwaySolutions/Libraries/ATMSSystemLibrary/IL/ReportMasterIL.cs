using System;
using HighwaySoluations.Softomation.CommonLibrary.IL;
namespace HighwaySoluations.Softomation.ATMSSystemLibrary.IL
{
    public class ReportMasterIL : CommonIL
    {
        Int16 reportId;
        String reportName;
        Boolean isLandscape;
        Int16 parentId;
        Int16 orderBy;

        public ReportMasterIL()
        {
            reportId = 0;
            reportName = String.Empty;
            isLandscape = false;
            parentId = 0;
            orderBy = 0;
        }

        public Int16 ReportId
        {
            get
            {
                return reportId;
            }

            set
            {
                reportId = value;
            }
        }

        public String ReportName
        {
            get
            {
                return reportName;
            }

            set
            {
                reportName = value;
            }
        }

        public Boolean IsLandscape
        {
            get
            {
                return isLandscape;
            }

            set
            {
                isLandscape = value;
            }
        }

        public Int16 ParentId
        {
            get
            {
                return parentId;
            }

            set
            {
                parentId = value;
            }
        }

        public Int16 OrderBy
        {
            get
            {
                return orderBy;
            }

            set
            {
                orderBy = value;
            }
        }
    }
}
