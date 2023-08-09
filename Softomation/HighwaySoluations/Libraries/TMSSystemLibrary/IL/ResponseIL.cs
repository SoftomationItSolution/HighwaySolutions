using System;
using System.Collections.Generic;
using System.Data;

namespace HighwaySoluations.Softomation.TMSSystemLibrary.IL
{
    public class ResponseIL
    {
        private String alertMessage;
        public ResponseIL()
        {
            alertMessage = string.Empty;
        }
        public String AlertMessage
        {
            get => alertMessage; set => alertMessage = value;
        }

        public static List<ResponseIL> ConvertResponseList(DataTable dt)
        {
            List<ResponseIL> responses = new List<ResponseIL>();
            try
            {
                foreach (DataRow item in dt.Rows)
                    responses.Add(ConvertresponseCBE(item));

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return responses;
        }
        public static ResponseIL ConvertresponseCBE(DataRow row)
        {
            ResponseIL response = new ResponseIL();
            try
            {

                if (row["AlertMessage"] != DBNull.Value)
                    response.AlertMessage = Convert.ToString(row["AlertMessage"]);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return response;
        }
    }
}
