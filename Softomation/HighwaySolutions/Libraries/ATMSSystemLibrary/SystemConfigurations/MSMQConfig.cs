using System.Messaging;

namespace HighwaySoluations.Softomation.ATMSSystemLibrary.SystemConfigurations
{
    public class MSMQConfig
    {
        public static string RseAtccQueueName = "{ipaddress}\\Private$\\RseAtccQueue";
        public static string RseECBQueueName = "{ipaddress}\\Private$\\RseECBQueue";

        public static MessageQueue Create(string queueName)
        {
            MessageQueue mq;
            if (!MessageQueue.Exists(queueName))
            {
                mq = MessageQueue.Create(queueName);
                mq.DefaultPropertiesToSend.Recoverable = true;
                mq.Formatter = new BinaryMessageFormatter();
                mq.ResetPermissions();
                mq.SetPermissions("Administrator", MessageQueueAccessRights.FullControl);
                mq.SetPermissions("EveryOne", MessageQueueAccessRights.FullControl);
                mq.SetPermissions("ANONYMOUS LOGON", MessageQueueAccessRights.FullControl);
            }
            else
            {
                mq = new MessageQueue(queueName);
                mq.Formatter = new BinaryMessageFormatter();
            }

            return mq;
        }
    }
}
