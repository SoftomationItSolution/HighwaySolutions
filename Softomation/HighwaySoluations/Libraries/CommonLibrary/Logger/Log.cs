using System;
using System.IO;
using System.Text;
using System.Threading;

namespace Softomation.DMS.Libraries.CommonLibrary.Logger
{
    /// <summary>
    /// This class is used to log the errors in the application.
    /// </summary>
    public class Log
    {
        #region variable
        #endregion

        /// <summary>
        /// Module log folder
        /// </summary>
        public enum ErrorLogModule
        {
            GeneralLog,
            WebAPI,
            BackOfficeAPI,
            PlazaOfficeAPI,
            EventAPI,
            LaneAPI,
            PlazaAPI,
            PDSS,
            CRDA,
            ServiceMonitor,
            BLTFile
        }

        /// <summary>
        /// Constructor
        /// </summary>
        static Log()
        {

        }




        /// <summary>
        /// Write message to log file.
        /// </summary>
        /// <param name="message"></param>
        /// <param name="logModule"></param>
        public static void Write(string message, ErrorLogModule logModule)
        {
            string path = string.Empty;
            DateTime dt = DateTime.Now;

            try
            {
                //Create folder name
                switch (logModule)
                {
                    case ErrorLogModule.GeneralLog:
                        {
                            path = CreateDirectory("General//") + dt.ToString("yyyy-MM-dd") + ".log";
                            break;
                        }
                    case ErrorLogModule.WebAPI:
                        {
                            path = CreateDirectory("WebAPI//") + dt.ToString("yyyy-MM-dd") + ".log";
                            break;
                        }
                    case ErrorLogModule.BackOfficeAPI:
                        {
                            path = CreateDirectory("BackOfficeAPI//") + dt.ToString("yyyy-MM-dd") + ".log";
                            break;
                        }
                    case ErrorLogModule.PlazaOfficeAPI:
                        {
                            path = CreateDirectory("PlazaOfficeAPI//") + dt.ToString("yyyy-MM-dd") + ".log";
                            break;
                        }
                    case ErrorLogModule.EventAPI:
                        {
                            path = CreateDirectory("EventAPI//") + dt.ToString("yyyy-MM-dd") + ".log";
                            break;
                        }
                    case ErrorLogModule.LaneAPI:
                        {
                            path = CreateDirectory("LaneAPI//") + dt.ToString("yyyy-MM-dd") + ".log";
                            break;
                        }
                    case ErrorLogModule.PlazaAPI:
                        {
                            path = CreateDirectory("PlazaAPI//") + dt.ToString("yyyy-MM-dd") + ".log";
                            break;
                        }
                    case ErrorLogModule.PDSS:
                        {
                            path = CreateDirectory("Services/PDSS//") + dt.ToString("yyyy-MM-dd") + ".log";
                            break;
                        }
                    case ErrorLogModule.CRDA:
                        {
                            path = CreateDirectory("Services/CRDA//") + dt.ToString("yyyy-MM-dd") + ".log";
                            break;
                        }
                    case ErrorLogModule.ServiceMonitor:
                        {
                            path = CreateDirectory("Services/SM//") + dt.ToString("yyyy-MM-dd") + ".log";
                            break;
                        }

                }
                try
                {
                    FileInfo fi = new FileInfo(path);
                    if (fi.Exists)
                    {
                        if ((fi.Length / 1024f) / 1024f >= 10) // Converts bytes to MB
                        {
                            fi.MoveTo(fi.FullName.Replace(".log", string.Format("_{0:00}{1:00}{2:00}.log", dt.Hour, dt.Minute, dt.Second)));
                        }
                    }
                }
                catch (Exception ex)
                {

                    path = CreateDirectory("General//") + dt.ToString("yyyy-MM-dd") + ".log";
                    using (StreamWriter writer = new StreamWriter(path, true))
                    {
                        writer.WriteLine(GetFormattedMessage("Exception in rename the file " + Environment.NewLine + ex.ToString()));
                    }
                }

                //Write log to file.
                for (int i = 0; i < 10; i++)
                {
                    try
                    {
                        using (StreamWriter writer = new StreamWriter(path, true))
                        {
                            writer.WriteLine(GetFormattedMessage(message));
                            break;
                        }
                    }
                    catch
                    {
                        Thread.Sleep(50);
                    }
                }
            }
            catch (Exception ex)
            {
                try
                {
                    path = CreateDirectory("General//") + dt.ToString("yyyy-MM-dd") + ".log";
                    using (StreamWriter writer = new StreamWriter(path, true))
                    {
                        writer.WriteLine(GetFormattedMessage("Exception in log file writer. Original message was " + message + Environment.NewLine + ex.ToString()));
                    }
                }
                catch
                {
                    //Ignore exception
                }
            }
        }




        public static string CreateDirectory(string directoryName)
        {
            string directory = Constants.driveLetter + ":\\" + Constants.ProjectName + "\\log\\" + directoryName;

            if (!Directory.Exists(directory))
            {
                Directory.CreateDirectory(directory);
            }

            return directory;
        }

       

        private static string GetFormattedMessage(string message)
        {
            StringBuilder sb = new StringBuilder();

            sb.AppendLine(DateTime.Now.ToString("hh:mm:ss.FFFF tt") + ": " + message); //time should not be here. this should be the time when the event happeded. CJS.

            return sb.ToString();
        }


        public static void WriteGeneralLog(String msg)
        {
            for (int i = 0; i < 5; i++)
            {
                try
                {
                    Logger.Log.Write(msg, Logger.Log.ErrorLogModule.GeneralLog);
                    break;
                }
                catch
                {
                    //Ignore
                    Thread.Sleep(50);
                }
            }
        }
    }
}
