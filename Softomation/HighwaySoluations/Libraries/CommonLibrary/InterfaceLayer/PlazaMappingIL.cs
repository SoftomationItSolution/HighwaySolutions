using System;


namespace Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer
{
    public class PlazaMappingIL :CommonIL
    {
        Int16 entryPlazaId;
        String entryPlazaName;
        Int16 exitPlazaId;
        String exitPlazaName;
        Decimal distance;
        public PlazaMappingIL()
        {
            this.entryPlazaId = 0;
            this.exitPlazaId = 0;
            this.distance = 0;
            this.entryPlazaName = String.Empty;
            this.exitPlazaName = String.Empty;
        }
        public short EntryPlazaId
        {
            get => entryPlazaId; set => entryPlazaId = value;
        }
        public string EntryPlazaName
        {
            get => entryPlazaName; set => entryPlazaName = value;
        }
        public short ExitPlazaId
        {
            get => exitPlazaId; set => exitPlazaId = value;
        }
        public string ExitPlazaName
        {
            get => exitPlazaName; set => exitPlazaName = value;
        }
        public decimal PlazaDistance
        {
            get => distance; set => distance = value;
        }
    }
}
