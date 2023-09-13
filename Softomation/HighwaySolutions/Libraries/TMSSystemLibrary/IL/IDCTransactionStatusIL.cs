using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HighwaySoluations.Softomation.TMSSystemLibrary.IL
{
    public class IDCTransactionStatusIL
    {

        string ChkTxn_MsgID;
        string ChkTxn_ApiCallDatetime;
        string ChkTxn_ApiVersion;
        string ChkTxn_Txnid;
        string ChkTxn_OrgId;
        string ChkTxn_Note;
        string ChkTxn_TransactionRefID;
        string ChkTxn_TransactionRefUrl;
        string ChkTxn_Transaction_DateTime;
        string ChkTxn_TransactionType;
        string ChkTxn_OrgTxnId;
        string ChkTxn_plazaid;
        string ChkTxn_ResponseTime;
        string ChkTxn_Result;
        string ChkTxn_ResponseCode;
        string ChkTxn_TotalReqCount;
        string ChkTxn_SuccessReqCount;
        string ChkTxn_CCHTransactionId;
        string ChkTxn_laneId;
        string ChkTxn_Result1;
        string ChkTxn_RequestedErrorCode;
        string ChkTxn_SettlementDate;
        string ChkTxn_ReaderDateTime1;
        string ChkTxn_FilePath;
        List<CheckTransactionStatus> txnList;
        string ChkTxn_saveLoc;
        string ReadFileLocation;
    }

    public class CheckTransactionStatus
    {
        public string txnStatus
        {
            get; set;
        }
        public string txnReaderTime
        {
            get; set;
        }
        public string txnType
        {
            get; set;
        }
        public string txnRecivedTime
        {
            get; set;
        }
        public string TollFare
        {
            get; set;
        }
        public string FareType
        {
            get; set;
        }
        public string VehicleClass
        {
            get; set;
        }
        public string RegNumber
        {
            get; set;
        }
        public string errCode
        {
            get; set;
        }

    }
}
