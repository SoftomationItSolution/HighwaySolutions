using System.Messaging;


namespace Softomation.DMS.Libraries.CommonLibrary.MSMQ
{
    public class MSMQConfiguration
    {
        public static string PlazaEntryLaneDataQueueName = "{ipaddress}\\Private$\\plazaEntryLaneData";
        public static string PlazaExitLaneDataQueueName = "{ipaddress}\\Private$\\plazaExitLaneData";
        public static string PlazaFailedLaneDataQueueName = "{ipaddress}\\Private$\\plazaFailedLaneData";

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
