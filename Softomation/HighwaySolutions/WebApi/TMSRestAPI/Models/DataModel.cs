using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using HighwaySoluations.Softomation.TMSSystemLibrary.IL;
using HighwaySoluations.Softomation.TMSSystemLibrary.SystemLogger;
using static HighwaySoluations.Softomation.CommonLibrary.Constants;

namespace TMSRestAPI.Models
{
    public class DataModel
    {
        internal static void BankOfficeAPILog(string message)
        {
            LogMaster.Write(message, ErrorLogModule.BankOfficeAPI);
        }
        public static ICDResponsePayIL ReadXMLFile(ICDResponsePayIL icd)
        {
            try
            {
                DataSet dataSet = new DataSet();
                dataSet.ReadXml(icd.SaveLoc);
                icd.MsgId = Convert.ToString(dataSet.Tables["Head"].Rows[0]["msgId"]);
                icd.OrgId = Convert.ToString(dataSet.Tables["Head"].Rows[0]["orgId"]);
                icd.Version = Convert.ToString(dataSet.Tables["Head"].Rows[0]["ver"]);
                icd.TranscationId = Convert.ToString(dataSet.Tables["Txn"].Rows[0]["Txn_Id"]);
                icd.ID = Convert.ToString(dataSet.Tables["Txn"].Rows[0]["Id"]);
                icd.Note = Convert.ToString(dataSet.Tables["Txn"].Rows[0]["Note"]);
                icd.OrgTxnId = Convert.ToString(dataSet.Tables["Txn"].Rows[0]["orgTxnId"]);
                icd.RFIDTranscation = Convert.ToString(dataSet.Tables["Txn"].Rows[0]["refId"]);
                icd.RefURL = Convert.ToString(dataSet.Tables["Txn"].Rows[0]["refUrl"]);
                icd.TransactionType = Convert.ToString(dataSet.Tables["Txn"].Rows[0]["type"]);
                icd.RespPayId = Convert.ToString(dataSet.Tables["Txn"].Rows[0]["RespPay_Id"]);
                icd.TransctionDateTime = Convert.ToDateTime(dataSet.Tables["Txn"].Rows[0]["ts"]);
                //iDC.TransctionLibility = dataSet.Tables["Txn"].Rows[0]["RespPay_Id"].ToString(); // Temp Declare
                icd.CCHTrasactionId = Convert.ToString(dataSet.Tables["EntryTxn"].Rows[0]["Id"]);
                icd.RespId = Convert.ToString(dataSet.Tables["Resp"].Rows[0]["Resp_Id"]);
                icd.ResponseFareType = Convert.ToString(dataSet.Tables["Resp"].Rows[0]["fareType"]);
                icd.PlazaId = Convert.ToString(dataSet.Tables["Resp"].Rows[0]["plazaid"]);
                icd.ResponseCode = Convert.ToString(dataSet.Tables["Resp"].Rows[0]["respcode"]);
                icd.ResponseResult = Convert.ToString(dataSet.Tables["Resp"].Rows[0]["result"]);
                icd.ResponseDateTime = Convert.ToDateTime(dataSet.Tables["Resp"].Rows[0]["ts"]);

                try
                {

                    icd.VehicleId = "";
                    icd.TID = "";
                    icd.TagId = "";
                    icd.VehicleRespId = "";
                    icd.VehicleDetailID = "";
                    icd.VehicleDetailsID = "";
                    icd.DetailName = "";
                    icd.VehicleClass = "0";
                    icd.DetailVehicleDetailsId = "0";
                    icd.DetailName1 = "";
                    icd.VehicleNumber = "";
                    icd.DetailVehicleDetailsId1 = "";
                    icd.DetailName2 = "";
                    icd.IsComvehicle = "0";
                    icd.DetailVehicleDetailsId2 = "";
                    icd.RefTollfare = "0";
                    icd.RefApprovalNum = "0";
                    icd.RefErrcode = "0";
                    icd.RefSettCurrency = "0";
                    icd.RefRespId = "0";
                    if (dataSet.Tables.Contains("Vehicle") && dataSet.Tables["Vehicle"].Rows.Count > 0)
                    {
                        icd.TID = Convert.ToString(dataSet.Tables["Vehicle"].Rows[0]["TID"]);
                        icd.TagId = Convert.ToString(dataSet.Tables["Vehicle"].Rows[0]["tagId"]);
                        icd.VehicleRespId = Convert.ToString(dataSet.Tables["Vehicle"].Rows[0]["Resp_Id"]);
                    }
                    else
                    {

                        icd.TID = "";
                        icd.TagId = "";
                        icd.VehicleRespId = "";
                    }
                    if (dataSet.Tables.Count > 17)
                    {
                        icd.VehicleId = Convert.ToString(dataSet.Tables["Vehicle"].Rows[0]["Vehicle_Id"]);
                        icd.VehicleDetailID = Convert.ToString(dataSet.Tables["VehicleDetails"].Rows[0]["VehicleDetails_Id"]);
                        icd.VehicleDetailsID = Convert.ToString(dataSet.Tables["VehicleDetails"].Rows[0]["Vehicle_ID"]);
                        icd.DetailName = Convert.ToString(dataSet.Tables["Detail"].Rows[0]["name"]);
                        if (Convert.ToString(icd.DetailName) == "COMVEHICLE")
                        {
                            icd.IsComvehicle = Convert.ToString(dataSet.Tables["Detail"].Rows[0]["Value"]);
                        }
                        else if (Convert.ToString(icd.DetailName) == "VEHICLECLASS")
                        {
                            icd.VehicleClass = Convert.ToString(dataSet.Tables["Detail"].Rows[0]["Value"]);
                        }
                        else if (Convert.ToString(icd.DetailName) == "REGNUMBER")
                        {
                            icd.VehicleNumber = Convert.ToString(dataSet.Tables["Detail"].Rows[0]["Value"]);
                        }
                        icd.DetailName1 = Convert.ToString(dataSet.Tables["Detail"].Rows[1]["name"]);
                        if (Convert.ToString(icd.DetailName1) == "COMVEHICLE")
                        {
                            icd.IsComvehicle = Convert.ToString(dataSet.Tables["Detail"].Rows[1]["Value"]);
                        }
                        else if (Convert.ToString(icd.DetailName1) == "VEHICLECLASS")
                        {
                            icd.VehicleClass = Convert.ToString(dataSet.Tables["Detail"].Rows[1]["Value"]);
                        }
                        else if (Convert.ToString(icd.DetailName1) == "REGNUMBER")
                        {
                            icd.VehicleNumber = Convert.ToString(dataSet.Tables["Detail"].Rows[1]["Value"]);
                        }
                        icd.DetailName2 = Convert.ToString(dataSet.Tables["Detail"].Rows[2]["name"]);
                        if (Convert.ToString(icd.DetailName2) == "COMVEHICLE")
                        {
                            icd.IsComvehicle = Convert.ToString(dataSet.Tables["Detail"].Rows[2]["Value"]);
                        }

                        else if (Convert.ToString(icd.DetailName2) == "VEHICLECLASS")
                        {
                            icd.VehicleClass = Convert.ToString(dataSet.Tables["Detail"].Rows[2]["Value"]);
                        }
                        else if (Convert.ToString(icd.DetailName2) == "REGNUMBER")
                        {
                            icd.VehicleNumber = Convert.ToString(dataSet.Tables["Detail"].Rows[2]["Value"]);
                        }
                        icd.DetailVehicleDetailsId = Convert.ToString(dataSet.Tables["Detail"].Rows[0]["VehicleDetails_Id"]);
                        icd.DetailVehicleDetailsId1 = Convert.ToString(dataSet.Tables["Detail"].Rows[1]["VehicleDetails_Id"]);
                        icd.DetailVehicleDetailsId2 = Convert.ToString(dataSet.Tables["Detail"].Rows[2]["VehicleDetails_Id"]);
                        icd.IsResponseFileSuccess = true;
                    }
                    if (dataSet.Tables.Contains("Ref") && dataSet.Tables["Ref"].Rows.Count > 0)
                    {
                        icd.RefTollfare = Convert.ToString(dataSet.Tables["Ref"].Rows[0]["Tollfare"]);
                        icd.RefApprovalNum = Convert.ToString(dataSet.Tables["Ref"].Rows[0]["ApprovalNum"]);
                        icd.RefErrcode = Convert.ToString(dataSet.Tables["Ref"].Rows[0]["errcode"]);
                        icd.RefSettCurrency = Convert.ToString(dataSet.Tables["Ref"].Rows[0]["Settcurrency"]);
                        icd.RefRespId = Convert.ToString(dataSet.Tables["Ref"].Rows[0]["Resp_Id"]);
                    }
                    else
                    {
                        icd.RefTollfare = "0.0";
                        icd.RefApprovalNum = "";
                        icd.RefErrcode = "";
                        icd.RefSettCurrency = "INR";
                        icd.RefRespId = "0";
                    }
                    BankOfficeAPILog("ResponsePay-PayResponse file " + icd.MsgId + ".xml read successfully.");
                    icd.IsResponseFileSuccess = true;
                }
                catch (Exception ex)
                {
                    icd.IsResponseFileSuccess = false;
                    BankOfficeAPILog("Error: ReadXMLFile :" + ex.Message + "-" + ex.StackTrace);
                }
            }
            catch (Exception ex)
            {
                icd.IsResponseFileSuccess = false;
                BankOfficeAPILog("Error: ReadXMLFile :" + ex.Message + "-" + ex.StackTrace);
            }
            return icd;
        }

        public static ICDTransactionStatusIL ReadXMLFile(ICDTransactionStatusIL icd)
        {
            try
            {
                DataSet dataSet = new DataSet();
                dataSet.ReadXml(@"" + icd.FilePath + icd.FileReadLocation);
                icd.TransactionMessageId = Convert.ToString(dataSet.Tables["Head"].Rows[0]["msgId"]);
                icd.OrganizationTransactionId = Convert.ToString(dataSet.Tables["Head"].Rows[0]["orgId"]);
                icd.TransactionDateTime = Convert.ToDateTime(dataSet.Tables["Head"].Rows[0]["ts"]);
                icd.TransactionApiCallDatetime = Convert.ToDateTime(dataSet.Tables["Head"].Rows[0]["ts"]);
                icd.TransactionApiVersion = Convert.ToString(dataSet.Tables["Head"].Rows[0]["ver"]);
                icd.TransactionId = Convert.ToString(dataSet.Tables["Txn"].Rows[0]["Id"]);
                icd.TransactionNote = Convert.ToString(dataSet.Tables["Txn"].Rows[0]["Note"]);
                icd.TransactionReferenceId = Convert.ToString(dataSet.Tables["Txn"].Rows[0]["refId"]);
                icd.TransactionReferenceURL = Convert.ToString(dataSet.Tables["Txn"].Rows[0]["refUrl"]);
                icd.TransactionType = Convert.ToString(dataSet.Tables["Txn"].Rows[0]["type"]);
                icd.OrganizationTransactionId = Convert.ToString(dataSet.Tables["Txn"].Rows[0]["OrgTxnId"]);
                icd.TransactionReaderDateTime = Convert.ToDateTime(dataSet.Tables["Txn"].Rows[0]["ts"]);
                bool IsContineue = false;
                icd.TransactionList = new List<CheckTransactionStatus>();
                if (dataSet.Tables.Count > 15)
                    IsContineue = true;
                icd.TransactionResult = Convert.ToString(dataSet.Tables["Resp"].Rows[0]["result"]);
                icd.TransactionResponseCode = Convert.ToString(dataSet.Tables["Resp"].Rows[0]["respcode"]);
                if (IsContineue)
                {
                    icd.TransactionTotalRequestCount = Convert.ToString(dataSet.Tables["Resp"].Rows[0]["totReqCnt"]);
                    icd.TransactionSuccessRequestCount = Convert.ToString(dataSet.Tables["Resp"].Rows[0]["sucessReqCnt"]);
                    icd.TransactionResponseTime = Convert.ToDateTime(dataSet.Tables["Resp"].Rows[0]["ts"]);
                    icd.CCHTransactionId = Convert.ToString(dataSet.Tables["Status"].Rows[0]["txnId"]);
                    icd.TransactionPlazaId = Convert.ToString(dataSet.Tables["Status"].Rows[0]["plazaId"]);
                    icd.TransactionLaneId = Convert.ToString(dataSet.Tables["Status"].Rows[0]["laneId"]);
                    icd.TransactionResultSecond = Convert.ToString(dataSet.Tables["Status"].Rows[0]["result"]);
                    icd.TransactionRequestedErrorCode = Convert.ToString(dataSet.Tables["Status"].Rows[0]["errCode"]);
                    if (!string.IsNullOrEmpty(Convert.ToString(dataSet.Tables["Status"].Rows[0]["settleDate"])))
                        icd.TransactionSettlementDate = Convert.ToDateTime(dataSet.Tables["Status"].Rows[0]["settleDate"]);
                    else
                        icd.TransactionSettlementDate = Convert.ToDateTime("1900-01-01 00:00:00.000");
                    icd.TransactionList = dataSet.Tables["TxnList"].AsEnumerable().Select(
                               dataRow => new CheckTransactionStatus {
                                   TransactionStatus = dataRow.Field<string>("txnStatus"),
                                   TransactionReaderTime = dataRow.Field<string>("txnReaderTime"),
                                   TransactionType = dataRow.Field<string>("txnType"),
                                   TransactionReceivedTime = dataRow.Field<string>("txnReceivedTime"),
                                   TransactionFare = dataRow.Field<string>("TollFare"),
                                   TransactionFareType = dataRow.Field<string>("FareType"),
                                   TransactionVehicleClass = dataRow.Field<string>("VehicleClass"),
                                   TransactionRegistrationNumber = dataRow.Field<string>("RegNumber"),
                                   TransactionErrorCode = dataRow.Field<string>("errCode"),
                               }).ToList();
                }

                BankOfficeAPILog("ChkTransactionStatusResponse-Check Txn status response file " + icd.TransactionMessageId + ".xml read successfully.");
            }
            catch (Exception ex)
            {
                BankOfficeAPILog("Error: Read XML File :" + ex.Message + "-" + ex.StackTrace);
            }
            return icd;
        }

        public static ICDQueryExceptionIL ReadXMLFile(ICDQueryExceptionIL icd, string FilePath)
        {
            try
            {
                DataSet dataSet = new DataSet();
                dataSet.ReadXml(FilePath);
                icd.MessageId = Convert.ToString(dataSet.Tables["Head"].Rows[0]["msgId"]);
                icd.OrganizationId = Convert.ToString(dataSet.Tables["Head"].Rows[0]["orgId"]);
                icd.TransactionHeadDateTime = Convert.ToDateTime(dataSet.Tables["Head"].Rows[0]["ts"]);
                icd.ApiVersion = Convert.ToString(dataSet.Tables["Head"].Rows[0]["ver"]);
                icd.TransactionId = Convert.ToString(dataSet.Tables["Txn"].Rows[0]["Id"]);
                icd.Note = Convert.ToString(dataSet.Tables["Txn"].Rows[0]["Note"]);
                icd.OrganizationTransactionId = Convert.ToString(dataSet.Tables["Txn"].Rows[0]["OrgTxnId"]);
                icd.TransactionReferanceId = Convert.ToString(dataSet.Tables["Txn"].Rows[0]["refId"]);
                icd.TransactionReferanceUrl = Convert.ToString(dataSet.Tables["Txn"].Rows[0]["refUrl"]);
                icd.TransactionType = Convert.ToString(dataSet.Tables["Txn"].Rows[0]["type"]);
                icd.TransactionDateTime = Convert.ToDateTime(dataSet.Tables["Txn"].Rows[0]["ts"]);
                icd.ResponseMessageNumber = Convert.ToString(dataSet.Tables["Resp"].Rows[0]["msgnum"]);
                icd.ResponseResult = Convert.ToString(dataSet.Tables["Resp"].Rows[0]["result"]);
                icd.ResponseCode = Convert.ToString(dataSet.Tables["Resp"].Rows[0]["respcode"]);
                icd.SuccessRequestCount = Convert.ToString(dataSet.Tables["Resp"].Rows[0]["successReqCnt"]);
                icd.ResponseTotalRequestCount = Convert.ToString(dataSet.Tables["Resp"].Rows[0]["totReqCnt"]);
                icd.ResponseTotalMessage = Convert.ToString(dataSet.Tables["Resp"].Rows[0]["totalMsg"]);
                icd.ResponseTime = Convert.ToDateTime(dataSet.Tables["Resp"].Rows[0]["ts"]);
                icd.TotalTagsInMessage = Convert.ToString(dataSet.Tables["Resp"].Rows[0]["totalTagsInMsg"]);
                icd.TotalTagsInResponse = Convert.ToString(dataSet.Tables["Resp"].Rows[0]["totalTagsInResponse"]);
                bool ExIDExist = false;
                if (dataSet.Tables.Count.Equals(15)) ExIDExist = true;
                icd.ReadQueryExceptionList = dataSet.Tables["Exception"].AsEnumerable().Select(
                          dataRow => new ReadQueryException {
                              Description = dataRow.Field<string>("desc"),
                              ErrorCode = dataRow.Field<string>("errCode"),
                              ExceptionCode = dataRow.Field<string>("excCode"),
                              Priority = dataRow.Field<string>("priority"),
                              Result = dataRow.Field<string>("result"),
                              TotalTag = dataRow.Field<string>("totalTag"),
                              ExceptionId = ExIDExist ? dataRow.Field<int>("Exception_Id") : 0,
                          }).ToList();



                if (ExIDExist)
                {

                    icd.CheckTransactionStatusList = dataSet.Tables["Tag"].AsEnumerable().Select(
                               dataRow => new QueryCheckTransactionStatus {
                                   TagId = dataRow.Field<string>("tagId"),
                                   Operation = dataRow.Field<string>("op"),
                                   UpdatedTime = dataRow.Field<string>("updatedTime"),
                                   ExceptionId = dataRow.Field<Int32>("Exception_Id"),
                               }).ToList();
                }
                BankOfficeAPILog("QueryExceptionResponse-Query Exception response file " + icd.MessageId + ".xml read successfully. for file name " + FilePath);
            }
            catch (Exception ex)
            {
                BankOfficeAPILog("Error: ReadQueryExceptionListResponsePayXMLFile :" + ex.Message + "-" + ex.StackTrace + " for file name " + FilePath);
            }
            return icd;
        }
    }
}