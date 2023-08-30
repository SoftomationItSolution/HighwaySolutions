using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HighwaySoluations.Softomation.CommonLibrary.IL
{
    public class MasterDataIL
    {
        Int64 dataId;
        String dataName;
        Int64 parentId;
        Decimal minValue;
        Decimal maxValue;
        Decimal dataValue;

        public MasterDataIL()
        {
            dataId = 0;
            dataName = string.Empty;
            parentId = 0;
            minValue = 0;
            maxValue = 0;
            dataValue = 0;
        }

        public Int64 DataId
        {
            get
            {
                return dataId;
            }

            set
            {
                dataId = value;
            }
        }

        public String DataName
        {
            get
            {
                return dataName;
            }

            set
            {
                dataName = value;
            }
        }

        public Int64 ParentId
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

        public Decimal MinValue
        {
            get
            {
                return minValue;
            }

            set
            {
                minValue = value;
            }
        }

        public Decimal MaxValue
        {
            get
            {
                return maxValue;
            }

            set
            {
                maxValue = value;
            }
        }
        public Decimal DataValue
        {
            get
            {
                return dataValue;
            }

            set
            {
                dataValue = value;
            }
        }
    }
}
