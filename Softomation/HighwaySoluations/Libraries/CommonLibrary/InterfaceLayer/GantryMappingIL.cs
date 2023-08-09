using System;

namespace Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer
{
    public class GantryMappingIL : CommonIL
    {
        Int32 entryGantryId;
        String entryGantryName;
        Int32 exitGantryId;
        String exitGantryName;
        Decimal gantryDistance;
        public GantryMappingIL()
        {
            this.entryGantryId = 0;
            this.exitGantryId = 0;
            this.gantryDistance = 0;
            this.entryGantryName = String.Empty;
            this.exitGantryName = String.Empty;
        }
        public int EntryGantryId
        {
            get => entryGantryId; set => entryGantryId = value;
        }
        public string EntryGantryName
        {
            get => entryGantryName; set => entryGantryName = value;
        }
        public int ExitGantryId
        {
            get => exitGantryId; set => exitGantryId = value;
        }
        public string ExitGantryName
        {
            get => exitGantryName; set => exitGantryName = value;
        }
        public decimal GantryDistance
        {
            get => gantryDistance; set => gantryDistance = value;
        }
    }
}
