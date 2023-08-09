using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer;
using Softomation.DMS.Libraries.CommonLibrary.Logger;

namespace TollSolutionsAPI.Models
{
    public class CommonMethods
    {
        public static ResponceMessage SaveImage(string base64, string FilePath, string FolderName, string FileName, string ext)
        {
            ResponceMessage objMessage = new ResponceMessage();

            try
            {
                if (base64.Contains(","))
                {
                    base64 = base64.Split(',')[1];
                }

                byte[] bytes = System.Convert.FromBase64String(base64);

                string path = HttpContext.Current.Server.MapPath("~/" + FolderName + "/" + FilePath);
                if (!Directory.Exists(path))
                {
                    Directory.CreateDirectory(path);
                }
                FilePath = FileName + ext;
                File.WriteAllBytes(path + FilePath, bytes);
                objMessage.AlertMessage = FilePath;
            }
            catch (Exception ex)
            {

                objMessage.AlertMessage = "Invalid";
                throw ex;
            }
            return objMessage;
        }


        internal static void BackOfficeAPILog(string message)
        {
            Log.Write(message, Log.ErrorLogModule.BackOfficeAPI);
        }
        internal static void PlazaOfficeAPILog(string message)
        {
            Log.Write(message, Log.ErrorLogModule.BackOfficeAPI);
        }
        internal static void EventAPILog(string message)
        {
            Log.Write(message, Log.ErrorLogModule.EventAPI);
        }
        internal static void LaneAPILog(string message)
        {
            Log.Write(message, Log.ErrorLogModule.LaneAPI);
        }
        internal static void PlazaAPILog(string message)
        {
            Log.Write(message, Log.ErrorLogModule.PlazaAPI);
        }


    }

    public class Responce
    {
        List<ResponceMessage> message;
        Object responceData;

        public Responce()
        {
            this.message = new List<ResponceMessage>();
            this.responceData = new object();
        }
        public List<ResponceMessage> Message
        {
            get
            {
                return message;
            }

            set
            {
                message = value;
            }
        }

        public Object ResponceData
        {
            get
            {
                return responceData;
            }

            set
            {
                responceData = value;
            }
        }
    }

    public class ResponceMessage
    {
        string alertMessage;

        public ResponceMessage()
        {
            this.alertMessage = "success";
        }
        public String AlertMessage
        {
            get
            {
                return alertMessage;
            }

            set
            {
                alertMessage = value;
            }
        }
    }
    public class LaneTrsnResponce
    {
        List<ResponceMessage> message;
        LaneTransactionIL currentTransactionDetails;
        LaneTransactionIL mappedTransactionDetalis;
        FareDetailsIL fareDetalis;
        public LaneTrsnResponce()
        {
            this.message = new List<ResponceMessage>();
            this.currentTransactionDetails = new LaneTransactionIL();
            this.mappedTransactionDetalis = new LaneTransactionIL();
            this.fareDetalis = new FareDetailsIL();
        }

        public List<ResponceMessage> Message
        {
            get
            {
                return message;
            }

            set
            {
                message = value;
            }
        }

        public LaneTransactionIL CurrentTransactionDetails
        {
            get
            {
                return currentTransactionDetails;
            }

            set
            {
                currentTransactionDetails = value;
            }
        }

        public LaneTransactionIL MappedTransactionDetalis
        {
            get
            {
                return mappedTransactionDetalis;
            }

            set
            {
                mappedTransactionDetalis = value;
            }
        }

        public FareDetailsIL FareDetalis
        {
            get
            {
                return fareDetalis;
            }

            set
            {
                fareDetalis = value;
            }
        }
    }

    public class ValidatFareResponce
    {
        Int16 journeyType;
        Int16 entryPlazaId;
        Int64 referenceTransactionId;
        String entryImage;
        Int16 classId;
        Decimal alredayPaid;
        Decimal tollFare;
        Decimal penaltyFare;
        Decimal overWeightFare;
        Decimal returnFare;
        public ValidatFareResponce()
        {
            this.journeyType = 0;
            this.entryPlazaId = 0;
            this.referenceTransactionId = 0;
            this.entryImage = string.Empty;
            this.classId = 0;
            this.alredayPaid = 0;
            this.tollFare = 0;
            this.penaltyFare = 0;
            this.overWeightFare = 0;
            this.returnFare = 0;
        }
        public Int16 JourneyType
        {
            get
            {
                return journeyType;
            }

            set
            {
                journeyType = value;
            }
        }
        public Int16 EntryPlazaId
        {
            get
            {
                return entryPlazaId;
            }

            set
            {
                entryPlazaId = value;
            }
        }
        public Int64 ReferenceTransactionId
        {
            get
            {
                return referenceTransactionId;
            }

            set
            {
                referenceTransactionId = value;
            }
        }
        public String EntryImage
        {
            get
            {
                return entryImage;
            }

            set
            {
                entryImage = value;
            }
        }
        public Int16 ClassId
        {
            get
            {
                return classId;
            }

            set
            {
                classId = value;
            }
        }
        public Decimal AlredayPaid
        {
            get
            {
                return alredayPaid;
            }

            set
            {
                alredayPaid = value;
            }
        }
        public Decimal TollFare
        {
            get
            {
                return tollFare;
            }

            set
            {
                tollFare = value;
            }
        }
        public Decimal PenaltyFare
        {
            get
            {
                return penaltyFare;
            }

            set
            {
                penaltyFare = value;
            }
        }
        public Decimal OverWeightFare
        {
            get
            {
                return overWeightFare;
            }

            set
            {
                overWeightFare = value;
            }
        }
        public Decimal ReturnFare
        {
            get
            {
                return returnFare;
            }

            set
            {
                returnFare = value;
            }
        }
    }





}