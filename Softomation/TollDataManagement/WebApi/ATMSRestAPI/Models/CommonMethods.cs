using System;
using System.Collections.Generic;
using System.IO;
using System.Web;


namespace ATMSRestAPI.Models
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
}