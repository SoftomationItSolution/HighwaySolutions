using System;
using System.Collections.Generic;

namespace Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer
{
    public class VMSMessagingIL : CommonIL
    {
        List<DevicesMasterIL> vmsList;
        String vmsIds;
        Int16 messageFormatId;
        String messageFormat;
        String fontFormat;
        Int16 fontSize;
        Int16 alignmentId;
        String alignmentName;
        Int16 brightness;
        Int16 messageLanguageId;
        String messageLanguage;
        Int16 messageOrientationId;
        String messageOrientation;
        Int16 messageDuration;
        Int16 messagePriority;
        String messageBody;

        public VMSMessagingIL()
        {
            this.vmsList = new List<DevicesMasterIL>();
            this.vmsIds = string.Empty;
            this.messageFormatId = 1;
            this.messageFormat = string.Empty;
            this.fontFormat = string.Empty;
            this.fontSize = 12;
            this.alignmentId = 2;
            this.alignmentName = "Center";
            this.brightness = 1;
            this.messageLanguageId = 1;
            this.messageLanguage = "English";
            this.messageOrientationId = 1;
            this.messageOrientation = "Static";
            this.messageDuration = 10;
            this.messagePriority = 0;
            this.messageBody = String.Empty;
          
        }
        public List<DevicesMasterIL> VmsList
        {
            get => vmsList; set => vmsList = value;
        }
        public string VmsIds
        {
            get => vmsIds; set => vmsIds = value;
        }
        public short MessageFormatId
        {
            get => messageFormatId; set => messageFormatId = value;
        }
        public string MessageFormat
        {
            get => messageFormat; set => messageFormat = value;
        }
        public string FontFormat
        {
            get => fontFormat; set => fontFormat = value;
        }
        public short FontSize
        {
            get => fontSize; set => fontSize = value;
        }
        public short AlignmentId
        {
            get => alignmentId; set => alignmentId = value;
        }
        public string AlignmentName
        {
            get => alignmentName; set => alignmentName = value;
        }
        public short Brightness
        {
            get => brightness; set => brightness = value;
        }
        public short MessageOrientationId
        {
            get => messageOrientationId; set => messageOrientationId = value;
        }
        public string MessageOrientation
        {
            get => messageOrientation; set => messageOrientation = value;
        }
        public short MessageLanguageId
        {
            get => messageLanguageId; set => messageLanguageId = value;
        }
        public string MessageLanguage
        {
            get => messageLanguage; set => messageLanguage = value;
        }
        public short MessageDuration
        {
            get => messageDuration; set => messageDuration = value;
        }
        public short MessagePriority
        {
            get => messagePriority; set => messagePriority = value;
        }
        public string MessageBody
        {
            get => messageBody; set => messageBody = value;
        }
    }
}
