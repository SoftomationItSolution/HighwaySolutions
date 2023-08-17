using System;
using HighwaySoluations.Softomation.CommonLibrary.IL;

namespace HighwaySoluations.Softomation.TMSSystemLibrary.IL
{
    public class ExemptTypeIL : CommonIL
    {
        Int16 exemptTypeId;
        String exemptTypeName;

        public ExemptTypeIL()
        {
            this.exemptTypeId = 0;
            this.exemptTypeName = string.Empty;
        }
        public short ExemptTypeId
        {
            get => exemptTypeId; set => exemptTypeId = value;
        }
        public string ExemptTypeName
        {
            get => exemptTypeName; set => exemptTypeName = value;
        }
    }
}
