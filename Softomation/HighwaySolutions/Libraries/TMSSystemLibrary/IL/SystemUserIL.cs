using System;
using HighwaySoluations.Softomation.CommonLibrary.IL;

namespace HighwaySoluations.Softomation.TMSSystemLibrary.IL
{
    public class SystemUserIL: UserManagementIL
    {
        Int16 plazaId;
        String plazaName;

        public SystemUserIL()
        {
            plazaId = 0;
            plazaName = string.Empty;
        }

        public Int16 PlazaId
        {
            get
            {
                return plazaId;
            }

            set
            {
                plazaId = value;
            }
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
    }
}
