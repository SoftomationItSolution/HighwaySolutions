using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Softomation.ATMSSystemLibrary.IL
{
    public class CommonIL
    {
        Int64 entryId;
        Int16 clientId;
        String clientName;
        Int32 plazaId;
        Int16 dataStatus;
        String dataStatusName;
        DateTime createdDate;
        Int32 createdBy;
        DateTime modifiedDate;
        Int32 modifiedBy;
        String plazaName;
        string createdByLoginId;
        string modifiedByLoginId;
        public CommonIL()
        {
            this.entryId = 0;
            this.clientId = 0;
            this.clientName = string.Empty;
            this.plazaName = string.Empty;
            this.plazaId = 0;
            this.dataStatus = 0;
            this.dataStatusName = "Active";
            this.createdDate = DateTime.Now;
            this.createdBy = 0;
            this.createdByLoginId = string.Empty;
            this.modifiedDate = DateTime.Now;
            this.modifiedBy = 0;
            this.modifiedByLoginId = string.Empty;
        }
        public Int64 EntryId
        {
            get => entryId; set => entryId = value;
        }
        public Int16 ClientId
        {
            get => clientId; set => clientId = value;
        }
        public String ClientName
        {
            get
            {
                return clientName;
            }

            set
            {
                clientName = value;
            }
        }
        public Int32 PlazaId
        {
            get => plazaId; set => plazaId = value;
        }

        public String PlazaName
        {
            get
            {
                return plazaName;
            }

            set
            {
                plazaName = value;
            }
        }

        public Int16 DataStatus
        {
            get => dataStatus; set => dataStatus = value;
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
    }
}
