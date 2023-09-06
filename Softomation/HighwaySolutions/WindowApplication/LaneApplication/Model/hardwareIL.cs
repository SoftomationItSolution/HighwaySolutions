using System;
using System.Windows.Media.Imaging;

namespace LaneApplication.Model
{
    public class hardwareIL
    {
        private String hardwareName;
        private String imagePath;
        private BitmapImage imageData;
        private String colorCode;

        public String HardwareName
        {
            get
            {
                return this.hardwareName;
            }
            set
            {
                this.hardwareName = value;
            }
        }
        public String ImagePath
        {
            get
            {
                return this.imagePath;
            }
            set
            {
                this.imagePath = value;
            }
        }
        public BitmapImage ImageData
        {
            get
            {
                return this.imageData;
            }
            set
            {
                this.imageData = value;
            }
        }
        public String ColorCode
        {
            get
            {
                return this.colorCode;
            }
            set
            {
                this.colorCode = value;
            }
        }
    }
}
