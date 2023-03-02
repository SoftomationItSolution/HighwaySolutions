using System;

namespace Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer
{
    public class AVCVehicleClassIL : CommonIL
    {
        Int16 avcClassId;
        String avcClassName;
        String avcClassDescription;
        Int16 minAxleCount;
        Int16 maxAxleCount;
        Decimal minHeight;
        Decimal maxHeight;
        Decimal minWidth;
        Decimal maxWidth;
        Decimal minLength;
        Decimal maxLength;
        public AVCVehicleClassIL()
        {
            this.avcClassId = 0;
            this.minAxleCount = 0;
            this.maxAxleCount = 0;
            this.minHeight = 0;
            this.maxHeight = 0;
            this.minWidth = 0;
            this.maxWidth = 0;
            this.minLength = 0;
            this.maxLength = 0;
            this.avcClassName = string.Empty;
            this.avcClassDescription = string.Empty;
        }

        public Int16 AvcClassId
        {
            get
            {
                return avcClassId;
            }

            set
            {
                avcClassId = value;
            }
        }

        public String AvcClassName
        {
            get
            {
                return avcClassName;
            }

            set
            {
                avcClassName = value;
            }
        }

        public String AvcClassDescription
        {
            get
            {
                return avcClassDescription;
            }

            set
            {
                avcClassDescription = value;
            }
        }
        public Int16 MinAxleCount
        {
            get
            {
                return minAxleCount;
            }

            set
            {
                minAxleCount = value;
            }
        }
        public Int16 MaxAxleCount
        {
            get
            {
                return maxAxleCount;
            }

            set
            {
                maxAxleCount = value;
            }
        }
        public Decimal MinHeight
        {
            get
            {
                return minHeight;
            }

            set
            {
                minHeight = value;
            }
        }
        public Decimal MaxHeight
        {
            get
            {
                return maxHeight;
            }

            set
            {
                maxHeight = value;
            }
        }
        public Decimal MinWidth
        {
            get
            {
                return minWidth;
            }

            set
            {
                minWidth = value;
            }
        }
        public Decimal MaxWidth
        {
            get
            {
                return maxWidth;
            }

            set
            {
                maxWidth = value;
            }
        }
        public Decimal MinLength
        {
            get
            {
                return minLength;
            }

            set
            {
                minLength = value;
            }
        }
        public Decimal MaxLength
        {
            get
            {
                return maxLength;
            }

            set
            {
                maxLength = value;
            }
        }
    }
}
