using System;
using System.IO;
using System.Text;
using System.Threading;
using static HighwaySoluations.Softomation.CommonLibrary.Constants;

namespace HighwaySoluations.Softomation.ATMSSystemLibrary.SystemLogger
{
    public class LogMaster
    {
        static LogMaster()
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
                    case ErrorLogModule.BackOfficeAPI:
                        {
                            path = CreateDirectory("BackOfficeAPI//") + dt.ToString("yyyy-MM-dd") + ".log";
                            break;
                        }
                    case ErrorLogModule.EventAPI:
                        {
                            path = CreateDirectory("EventAPI//") + dt.ToString("yyyy-MM-dd") + ".log";
                            break;
                        }
                    case ErrorLogModule.ServiceMonitor:
                        {
                            path = CreateDirectory("Services/SM//") + dt.ToString("yyyy-MM-dd") + ".log";
                            break;
                        }
                    case ErrorLogModule.BackOfficeService:
                        {
                            path = CreateDirectory("Services/BackOfficeService//") + dt.ToString("yyyy-MM-dd") + ".log";
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
            string directory = SystemConstants.DriveLetter + ":\\" + SystemConstants.ProjectName + "\\log\\" + directoryName;

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
                    Write(msg, ErrorLogModule.GeneralLog);
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
