using System;
using System.Collections.Generic;
using HighwaySoluations.Softomation.CommonLibrary.IL;

namespace HighwaySoluations.Softomation.TMSSystemLibrary.IL
{
    public class ReportMasterIL
    {
        private Int32 reportId;
        private String reportName;
        
        public ReportMasterIL()
        {
            this.reportId = 0;
            this.reportName = string.Empty;
        }
        
        public Int32 ReportId
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
        public string ReportName
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


    }
}
