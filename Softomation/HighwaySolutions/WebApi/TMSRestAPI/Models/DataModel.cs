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
            LogMaster.Write(message, ErrorLogModule.BankAPI);
        }
        public static ICDPaymentResponseIL ReadXMLFile(ICDPaymentResponseIL icd)
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
        public static ICDTransactionStatusResponseIL ReadXMLFile(ICDTransactionStatusResponseIL icd)
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
        public static ICDQueryExceptionResponseIL ReadXMLFile(ICDQueryExceptionResponseIL icd, string FilePath)
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
                //icd.ResponseCode = Convert.ToString(dataSet.Tables["Resp"].Rows[0]["respcode"]);
                icd.SuccessRequestCount = Convert.ToString(dataSet.Tables["Resp"].Rows[0]["successReqCnt"]);
                icd.ResponseTotalRequestCount = Convert.ToString(dataSet.Tables["Resp"].Rows[0]["totReqCnt"]);
                icd.ResponseTotalMessage = Convert.ToString(dataSet.Tables["Resp"].Rows[0]["totalMsg"]);
                icd.ResponseDateTime = Convert.ToDateTime(dataSet.Tables["Resp"].Rows[0]["ts"]);
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
       
        public static ICDHeartBeatDetailsIL ReadXMLFile(ICDHeartBeatDetailsIL icd)
        {
            try
            {
                DataSet dataSet = new DataSet();
                dataSet.ReadXml(@"" + icd.FilePath + icd.FileReadLocation);
                icd.MessageId = Convert.ToString(dataSet.Tables["Head"].Rows[0]["msgId"]);
                icd.OrganizationId = Convert.ToString(dataSet.Tables["Head"].Rows[0]["orgId"]);
                icd.TransactionHeadDateTime = Convert.ToDateTime(dataSet.Tables["Head"].Rows[0]["ts"]);
                icd.ApiVersion = Convert.ToString(dataSet.Tables["Head"].Rows[0]["ver"]);
                icd.TransactionId = Convert.ToString(dataSet.Tables["Txn"].Rows[0]["id"]);
                icd.Note = Convert.ToString(dataSet.Tables["Txn"].Rows[0]["note"]);
                icd.OrgTransactionId = Convert.ToString(dataSet.Tables["Txn"].Rows[0]["orgTxnId"]);
                icd.RefId = Convert.ToString(dataSet.Tables["Txn"].Rows[0]["refId"]);
                icd.RefUrl = Convert.ToString(dataSet.Tables["Txn"].Rows[0]["refUrl"]);
                icd.TransactionDateTime = Convert.ToDateTime(dataSet.Tables["Txn"].Rows[0]["ts"]);
                icd.OrgTransactionId = Convert.ToString(dataSet.Tables["Txn"].Rows[0]["type"]);
                if (!string.IsNullOrEmpty(Convert.ToString(dataSet.Tables["Resp"].Rows[0]["errcode"])))
                    icd.AcquirerId = Convert.ToInt32(dataSet.Tables["Resp"].Rows[0]["errcode"]);
                icd.ResponseResult = Convert.ToString(dataSet.Tables["Resp"].Rows[0]["result"]);
                icd.ResponseDateTime = Convert.ToDateTime(dataSet.Tables["Resp"].Rows[0]["ts"]);
                BankOfficeAPILog("HeartBeatResponse-Heart Beat Response file " + icd.MessageId + ".xml read successfully.");
            }
            catch (Exception ex)
            {
                BankOfficeAPILog("Error: ReadHeartBeatResponseXMLFile :" + ex.Message + "-" + ex.StackTrace);
            }

            return icd;
        }
       
        public static ICDNotificationResponseIL ReadXMLFile(ICDNotificationResponseIL icd)
        {
            try
            {
                DataSet dataSet = new DataSet();
                dataSet.ReadXml(@"" + icd.FilePath + icd.FileReadLocation);
                if (dataSet.Tables.Contains("Head") && dataSet.Tables["Head"].Rows.Count > 0)
                {
                    icd.MessageId = Convert.ToString(dataSet.Tables["Head"].Rows[0]["msgId"]);
                    icd.OrganizationId = Convert.ToString(dataSet.Tables["Head"].Rows[0]["orgId"]);
                    icd.TransactionHeadDateTime = Convert.ToDateTime(dataSet.Tables["Head"].Rows[0]["ts"]);
                    icd.ApiVersion = Convert.ToString(dataSet.Tables["Head"].Rows[0]["ver"]);
                }
                else if (!dataSet.Tables.Contains("Head") && dataSet.Tables["Head"].Rows.Count == 0)
                {
                    icd.MessageId = "";
                    icd.OrganizationId = "";
                    icd.ApiVersion = "";
                }
                if (dataSet.Tables.Contains("Txn") && dataSet.Tables["Txn"].Rows.Count > 0)
                {
                    icd.TransactionDateTime = Convert.ToDateTime(dataSet.Tables["Txn"].Rows[0]["ts"]);
                    icd.TransactionType = Convert.ToString(dataSet.Tables["Txn"].Rows[0]["type"]);
                    icd.TransactionReferenceURL = Convert.ToString(dataSet.Tables["Txn"].Rows[0]["refUrl"]);
                    icd.TransactionReferenceId = Convert.ToString(dataSet.Tables["Txn"].Rows[0]["refId"]);
                    icd.TransactionOrganizationId = Convert.ToString(dataSet.Tables["Txn"].Rows[0]["orgTxnId"]);
                    icd.TransactionNote = Convert.ToString(dataSet.Tables["Txn"].Rows[0]["note"]);
                    icd.TransactionId = Convert.ToString(dataSet.Tables["Txn"].Rows[0]["id"]);
                }
                else if (!dataSet.Tables.Contains("Txn") && dataSet.Tables["Txn"].Rows.Count == 0)
                {
                    icd.TransactionType = "";
                    icd.TransactionReferenceURL = "";
                    icd.TransactionReferenceId = "";
                    icd.TransactionOrganizationId = "";
                    icd.TransactionNote = "";
                    icd.TransactionId = "";
                }
                if (dataSet.Tables.Contains("Notify") && dataSet.Tables["Notify"].Rows.Count > 0)
                {
                    if (!string.IsNullOrEmpty(Convert.ToString(dataSet.Tables["Notify"].Rows[0]["ts"])))
                        icd.NotifyDateTime = Convert.ToDateTime(dataSet.Tables["Notify"].Rows[0]["ts"]);
                    else
                        icd.NotifyDateTime = DateTime.MinValue;
                    icd.NotifyResult = Convert.ToString(dataSet.Tables["Notify"].Rows[0]["result"]);
                    icd.NotifyPlazaId = Convert.ToString(dataSet.Tables["Notify"].Rows[0]["plazaID"]);
                    icd.NotifyNPCIErrCode = Convert.ToString(dataSet.Tables["Notify"].Rows[0]["NPCIErrCode"]);
                }
                else if (!dataSet.Tables.Contains("Notify") || dataSet.Tables["Notify"].Rows.Count == 0)
                {
                    icd.NotifyDateTime = DateTime.MinValue;
                    icd.NotifyResult = "";
                    icd.NotifyPlazaId = "";
                    icd.NotifyNPCIErrCode = "";
                }
                if (dataSet.Tables.Contains("Vehicle") && dataSet.Tables["Vehicle"].Rows.Count > 0)
                {
                    icd.TagId = Convert.ToString(dataSet.Tables["Vehicle"].Rows[0]["tagID"]);
                    icd.TID = Convert.ToString(dataSet.Tables["Vehicle"].Rows[0]["TID"]);
                }
                else if (!dataSet.Tables.Contains("Vehicle") || dataSet.Tables["Vehicle"].Rows.Count == 0)
                {
                    icd.TagId = "";
                    icd.TID = "";
                }

                if (dataSet.Tables.Contains("Detail") && dataSet.Tables["Detail"].Rows.Count > 4)
                {
                    icd.IsNotificationFileSuccess = true;
                    icd.VehicleRegistrationNumber = Convert.ToString(dataSet.Tables["Detail"].Rows[1]["value"]);
                    icd.TransactionVehicleClass = Convert.ToString(dataSet.Tables["Detail"].Rows[0]["value"]);
                    icd.IsCommercialVehicle = Convert.ToBoolean(dataSet.Tables["Detail"].Rows[2]["value"]);
                    icd.Tollfare = Convert.ToDecimal(dataSet.Tables["Detail"].Rows[3]["value"]);
                    icd.FareType = Convert.ToString(dataSet.Tables["Detail"].Rows[4]["value"]);

                }
                else if (!dataSet.Tables.Contains("Detail") || dataSet.Tables["Detail"].Rows.Count <= 4)
                {
                    icd.IsNotificationFileSuccess = true;
                    icd.VehicleRegistrationNumber = "";
                    icd.TransactionVehicleClass = "";
                    icd.IsCommercialVehicle = false;
                    icd.Tollfare = 0;
                    icd.FareType = "";
                }
                BankOfficeAPILog("NotificationResponse-NotificationResponse " + icd.MessageId + ".xml read successfully.");
            }
            catch (Exception ex)
            {
                icd = new ICDNotificationResponseIL();
                BankOfficeAPILog("Error: ReadNotificationResponseXMLFile :" + ex.Message + "-" + ex.StackTrace);
            }
            return icd;
        }
        public static ICDCashDetailResponseIL ReadXMLFile(ICDCashDetailResponseIL icd)
        {
            try
            {
                DataSet dataSet = new DataSet();
                dataSet.ReadXml(icd.FileSaveLocation);
                icd.MessageId = Convert.ToString(dataSet.Tables["Head"].Rows[0]["msgId"]);
                icd.OrganizationId = Convert.ToString(dataSet.Tables["Head"].Rows[0]["orgId"]);
                icd.HeadVersion = Convert.ToString(dataSet.Tables["Head"].Rows[0]["ver"]);
                icd.TagName = Convert.ToString(dataSet.Tables["Tag"].Rows[0]["name"]);
                if (Convert.ToString(icd.TagName).Contains("TollCollectorClass"))
                {
                    icd.TollCollectorClass = Convert.ToString(dataSet.Tables["Tag"].Rows[0]["Value"]);
                }
                else if (Convert.ToString(icd.TagName).Contains("PermissibleWeight"))
                {
                    icd.PermissibleWeight = Convert.ToString(dataSet.Tables["Tag"].Rows[0]["Value"]);
                }
                else if (Convert.ToString(icd.TagName).Contains("ApplicablePenalty"))
                {
                    icd.ApplicablePenalty = Convert.ToString(dataSet.Tables["Tag"].Rows[0]["Value"]);
                }
                icd.TagClassSecond = Convert.ToString(dataSet.Tables["Tag"].Rows[1]["name"]);
                if (Convert.ToString(icd.TagClassSecond).Contains("TollCollectorClass"))
                {
                    icd.TollCollectorClassSecond = Convert.ToString(dataSet.Tables["Tag"].Rows[1]["Value"]);
                }
                else if (Convert.ToString(icd.TagClassSecond).Contains("PermissibleWeight"))
                {
                    icd.PermissibleWeightSecond = Convert.ToString(dataSet.Tables["Tag"].Rows[1]["Value"]);
                }
                else if (Convert.ToString(icd.TagClassSecond).Contains("ApplicablePenalty"))
                {
                    icd.ApplicablePenaltySecond = Convert.ToString(dataSet.Tables["Tag"].Rows[1]["Value"]);
                }
                icd.TagClassThird = Convert.ToString(dataSet.Tables["Tag"].Rows[2]["name"]);
                if (Convert.ToString(icd.TagClassThird).Contains("TollCollectorClass"))
                {
                    icd.TollCollectorClassThird = Convert.ToString(dataSet.Tables["Tag"].Rows[2]["Value"]);
                }

                else if (Convert.ToString(icd.TagClassThird).Contains("PermissibleWeight"))
                {
                    icd.PermissibleWeightThird = Convert.ToString(dataSet.Tables["Tag"].Rows[2]["Value"]);
                }
                else if (Convert.ToString(icd.TagClassThird).Contains("ApplicablePenalty"))
                {
                    icd.ApplicablePenaltyThird = Convert.ToString(dataSet.Tables["Tag"].Rows[2]["Value"]);
                }

                icd.TransactionId = Convert.ToString(dataSet.Tables["Txn"].Rows[0]["Txn_Id"]);
                icd.TransactionTxnId = Convert.ToString(dataSet.Tables["Txn"].Rows[0]["Id"]);
                icd.Note = Convert.ToString(dataSet.Tables["Txn"].Rows[0]["Note"]);
                icd.TransactionOrganizationId = Convert.ToString(dataSet.Tables["Txn"].Rows[0]["orgTxnId"]);
                icd.TransactionReferenceId = Convert.ToString(dataSet.Tables["Txn"].Rows[0]["refId"]);
                icd.TransactionReferenceURL = Convert.ToString(dataSet.Tables["Txn"].Rows[0]["refUrl"]);
                icd.TransactionType = Convert.ToString(dataSet.Tables["Txn"].Rows[0]["type"]);
                icd.TransactionDateTime = Convert.ToDateTime(dataSet.Tables["Txn"].Rows[0]["ts"]);
                icd.TransactionLibility = Convert.ToString(dataSet.Tables["Txn"].Rows[0]["txnLiability"]); // Temp Declare
                icd.CCHTransactionId = Convert.ToString(dataSet.Tables["EntryTxn"].Rows[0]["Id"]);
                icd.EntryTransactionId = Convert.ToString(dataSet.Tables["EntryTxn"].Rows[0]["Id"]);
                icd.EntryTransactionTime = Convert.ToDateTime(dataSet.Tables["EntryTxn"].Rows[0]["ts"]);
                icd.EntryReaderReadDateTime = Convert.ToDateTime(dataSet.Tables["EntryTxn"].Rows[0]["tsRead"]);
                icd.EntryTransactionType = Convert.ToString(dataSet.Tables["EntryTxn"].Rows[0]["type"]);
                icd.EntryTransactionTxnId = Convert.ToString(dataSet.Tables["EntryTxn"].Rows[0]["Txn_Id"]);
                icd.ResponseId = Convert.ToString(dataSet.Tables["Resp"].Rows[0]["Resp_Id"]);
                icd.ResponseFareType = Convert.ToString(dataSet.Tables["Resp"].Rows[0]["fareType"]);
                icd.PlazaId = Convert.ToString(dataSet.Tables["Resp"].Rows[0]["plazaid"]);
                //icd.ResponseCode = Convert.ToString(dataSet.Tables["Resp"].Rows[0]["respcode"]);
                icd.ResponseResult = Convert.ToString(dataSet.Tables["Resp"].Rows[0]["result"]);
                icd.ResponseDateTime = Convert.ToDateTime(dataSet.Tables["Resp"].Rows[0]["ts"]);
                try
                {
                    if (dataSet.Tables.Contains("Vehicle") && dataSet.Tables["Vehicle"].Rows.Count > 0)
                    {
                        icd.TID = Convert.ToString(dataSet.Tables["Vehicle"].Rows[0]["TID"]);
                        icd.TagId = Convert.ToString(dataSet.Tables["Vehicle"].Rows[0]["tagId"]);
                        icd.ResponseId = Convert.ToString(dataSet.Tables["Vehicle"].Rows[0]["Resp_Id"]);
                    }
                    else
                    {
                        icd.TID = "";
                        icd.TagId = "";
                        icd.ResponseId = "";
                    }
                    if (dataSet.Tables.Count > 17)
                    {
                        if (dataSet.Tables["VehicleDetails"] != null)
                        {
                            icd.VehicleClassId = Convert.ToString(dataSet.Tables["Vehicle"].Rows[0]["Vehicle_Id"]);
                            icd.VehicleDetailId = Convert.ToString(dataSet.Tables["VehicleDetails"].Rows[0]["VehicleDetails_Id"]);
                            icd.VehicleDetailsId = Convert.ToString(dataSet.Tables["VehicleDetails"].Rows[0]["Vehicle_ID"]);
                            icd.VehicleClass = Convert.ToString(dataSet.Tables["Detail"].Rows[0]["name"]);
                            if (Convert.ToString(icd.VehicleDetailsName) == "COMVEHICLE")
                            {
                                icd.IsCommercialVehicle = Convert.ToString(dataSet.Tables["Detail"].Rows[0]["Value"]) == "T" ? true : false;
                            }
                            else if (Convert.ToString(icd.VehicleDetailsName) == "VEHICLECLASS")
                            {
                                icd.VehicleClass = Convert.ToString(dataSet.Tables["Detail"].Rows[0]["Value"]);
                            }
                            else if (Convert.ToString(icd.VehicleDetailsName) == "REGNUMBER")
                            {
                                icd.VehicleNumber = Convert.ToString(dataSet.Tables["Detail"].Rows[0]["Value"]);
                            }
                            icd.VehicleDetailsNameSecond = Convert.ToString(dataSet.Tables["Detail"].Rows[1]["name"]);
                            if (Convert.ToString(icd.VehicleDetailsNameSecond) == "COMVEHICLE")
                            {
                                icd.IsCommercialVehicleSecond = Convert.ToString(dataSet.Tables["Detail"].Rows[1]["Value"]) == "T" ? true : false;
                            }
                            else if (Convert.ToString(icd.VehicleDetailsNameSecond) == "VEHICLECLASS")
                            {
                                icd.VehicleClassSecond = Convert.ToString(dataSet.Tables["Detail"].Rows[1]["Value"]);
                            }
                            else if (Convert.ToString(icd.VehicleDetailsNameSecond) == "REGNUMBER")
                            {
                                icd.VehicleNumberSecond = Convert.ToString(dataSet.Tables["Detail"].Rows[1]["Value"]);
                            }
                            icd.VehicleNumberThird = Convert.ToString(dataSet.Tables["Detail"].Rows[2]["name"]);
                            if (Convert.ToString(icd.VehicleNumberThird) == "COMVEHICLE")
                            {
                                icd.IsCommercialVehicleThird = Convert.ToString(dataSet.Tables["Detail"].Rows[2]["Value"]) == "T" ? true : false;
                            }

                            else if (Convert.ToString(icd.VehicleNumberThird) == "VEHICLECLASS")
                            {
                                icd.VehicleClassThird = Convert.ToString(dataSet.Tables["Detail"].Rows[2]["Value"]);
                            }
                            else if (Convert.ToString(icd.VehicleNumberThird) == "REGNUMBER")
                            {
                                icd.VehicleNumberThird = Convert.ToString(dataSet.Tables["Detail"].Rows[2]["Value"]);
                            }
                            icd.VehicleDetails_Id = Convert.ToString(dataSet.Tables["Detail"].Rows[0]["VehicleDetails_Id"]);
                            icd.VehicleDetails_IdSecond = Convert.ToString(dataSet.Tables["Detail"].Rows[1]["VehicleDetails_Id"]);
                            icd.VehicleDetails_IdThird = Convert.ToString(dataSet.Tables["Detail"].Rows[2]["VehicleDetails_Id"]);
                        }
                        icd.IsResponseFileSuccess = true;
                    }
                    if (dataSet.Tables.Contains("Ref") && dataSet.Tables["Ref"].Rows.Count > 0)
                    {
                        icd.RefTollfare = Convert.ToString(dataSet.Tables["Ref"].Rows[0]["Tollfare"]);
                        icd.RefApprovalNum = Convert.ToString(dataSet.Tables["Ref"].Rows[0]["ApprovalNum"]);
                        icd.RefErrCode = Convert.ToString(dataSet.Tables["Ref"].Rows[0]["errcode"]);
                        icd.RefSettCurrency = Convert.ToString(dataSet.Tables["Ref"].Rows[0]["Settcurrency"]);
                        icd.RefRespId = Convert.ToString(dataSet.Tables["Ref"].Rows[0]["Resp_Id"]);

                    }
                    else
                    {
                        icd.RefApprovalNum = "";
                        icd.RefErrCode = "";
                        icd.RefSettCurrency = "INR";
                        icd.RefRespId = "0";
                    }
                    if (string.IsNullOrEmpty(icd.RefTollfare))
                        icd.RefTollfare = "0.0";
                    BankOfficeAPILog("RespCashDetail-PayResponse cash file " + icd.MessageId + ".xml read successfully.");
                    icd.IsResponseFileSuccess = true;
                }
                catch (Exception ex)
                {
                    icd.IsResponseFileSuccess = false;
                    BankOfficeAPILog("Error: ReadXMLFile :" + ex.Message + "-" + ex.StackTrace);
                }

                //if (Cash_ISComvehicle == "F")
                //{
                //    Cash_ISComvehicle = "0";
                //}
                //else if (Cash_ISComvehicle == "T")
                //{
                //    Cash_ISComvehicle = "1";
                //}
                //else
                //{
                //    Cash_ISComvehicle = "0";
                //}
            }
            catch (Exception ex)
            {
                icd.IsResponseFileSuccess = false;
                BankOfficeAPILog("Error: ReadXMLFile :" + ex.Message + "-" + ex.StackTrace);
            }
            return icd;
        }

        public static ICDSyncTimeDetailsIL ReadXMLFile(ICDSyncTimeDetailsIL icd)
        {
            try
            {
                DataSet dataSet = new DataSet();
                dataSet.ReadXml(@"" + icd.FilePath + icd.FileReadLocation);
                icd.MessageId = Convert.ToString(dataSet.Tables["Head"].Rows[0]["msgId"]);
                icd.OrganizationId = Convert.ToString(dataSet.Tables["Head"].Rows[0]["orgId"]);
                icd.RequestDateTime = Convert.ToDateTime(dataSet.Tables["Head"].Rows[0]["ts"]);
                icd.ApiVersion = Convert.ToString(dataSet.Tables["Head"].Rows[0]["ver"]);
                if (!string.IsNullOrEmpty(Convert.ToString(dataSet.Tables["Resp"].Rows[0]["respcode"])))
                    icd.ResponseCode = Convert.ToInt32(dataSet.Tables["Resp"].Rows[0]["respcode"]);
                icd.ResponseResult = Convert.ToString(dataSet.Tables["Resp"].Rows[0]["result"]);
                icd.ResponseDateTime = Convert.ToDateTime(dataSet.Tables["Resp"].Rows[0]["ts"]);
                icd.BankServerDateTime = Convert.ToDateTime(dataSet.Tables["Time"].Rows[0]["ServerTime"]);
                BankOfficeAPILog("SyncTimeResponse-Sync time response file " + icd.MessageId + ".xml read successfully.");
            }
            catch (Exception ex)
            {
                BankOfficeAPILog("Error: ReadsyncTimeResponseXMLFile :" + ex.Message + "-" + ex.StackTrace);
            }
            return icd;
        }
        public static ICDTagDetailsIL ReadXMLFile(ICDTagDetailsIL icd)
        {
            icd.IsResponseSuccess = false;
            try
            {
                DataSet dataSet = new DataSet();
                dataSet.ReadXml(@"" + icd.FilePath + icd.FileReadLocation);
                icd.MessageId = Convert.ToString(dataSet.Tables["Head"].Rows[0]["msgId"]);
                icd.OrganizationId = Convert.ToString(dataSet.Tables["Head"].Rows[0]["orgId"]);
                icd.TransactionHeadDateTime = Convert.ToDateTime(dataSet.Tables["Head"].Rows[0]["ts"]);
                icd.ApiVersion = Convert.ToString(dataSet.Tables["Head"].Rows[0]["ver"]);
                icd.Note = Convert.ToString(dataSet.Tables["Txn"].Rows[0]["note"]);
                icd.TransactionDateTime = Convert.ToDateTime(dataSet.Tables["Txn"].Rows[0]["ts"]);
                icd.ResponseResult = Convert.ToString(dataSet.Tables["Resp"].Rows[0]["result"]);
                if (icd.ResponseResult == "SUCCESS")
                    icd.IsResponseSuccess = true;
                if (!string.IsNullOrEmpty(Convert.ToString(dataSet.Tables["Resp"].Rows[0]["totReqCnt"])))
                    icd.TotalRequestCount = Convert.ToInt32(dataSet.Tables["Resp"].Rows[0]["totReqCnt"]);

                if (!string.IsNullOrEmpty(Convert.ToString(dataSet.Tables["Resp"].Rows[0]["successReqCnt"])))
                    icd.SuccessRequestCount = Convert.ToInt32(dataSet.Tables["Resp"].Rows[0]["successReqCnt"]);

                if (!string.IsNullOrEmpty(Convert.ToString(dataSet.Tables["Resp"].Rows[0]["respCode"])))
                    icd.ResponseCode = Convert.ToInt32(dataSet.Tables["Resp"].Rows[0]["respCode"]);

                if (!string.IsNullOrEmpty(Convert.ToString(dataSet.Tables["Vehicle"].Rows[0]["errCode"])))
                    icd.ErrorCode = Convert.ToInt32(dataSet.Tables["Vehicle"].Rows[0]["errCode"]);
                if (icd.IsResponseSuccess)
                {
                    icd.ResponseDateTime = Convert.ToDateTime(dataSet.Tables["Resp"].Rows[0]["ts"]);
                    icd.TagId = Convert.ToString(dataSet.Tables["Detail"].Rows[0]["Value"]);        //TAGID
                    icd.VRN = Convert.ToString(dataSet.Tables["Detail"].Rows[1]["Value"]);    // REGNUMBER     
                    icd.TID = Convert.ToString(dataSet.Tables["Detail"].Rows[2]["Value"]);          //TID
                    icd.VehicleClass = Convert.ToString(dataSet.Tables["Detail"].Rows[3]["Value"]); //VEHICLECLASS
                    if (!string.IsNullOrEmpty(Convert.ToString(dataSet.Tables["Detail"].Rows[4]["Value"])))// TAGSTATUS 
                        icd.TagStatus = Convert.ToString(dataSet.Tables["Detail"].Rows[4]["Value"]) == "A" ? true : false;
                    if (!string.IsNullOrEmpty(Convert.ToString(dataSet.Tables["Detail"].Rows[5]["Value"])))
                        icd.ErrorCode = Convert.ToInt32(dataSet.Tables["Detail"].Rows[5]["Value"]);
                    if (!string.IsNullOrEmpty(Convert.ToString(dataSet.Tables["Detail"].Rows[6]["Value"])))
                        icd.IsCommercialVehicle = Convert.ToBoolean(dataSet.Tables["Detail"].Rows[6]["Value"]);
                }
            }
            catch (Exception ex)
            {
                BankOfficeAPILog("Error: ReadTagDetailsXMLFile :" + ex.Message + "-" + ex.StackTrace);

            }
            return icd;
        }
        public static ICDViolationAuditDetailsRequestIL ReadXMLFile(ICDViolationAuditDetailsRequestIL icd)
        {
            try
            {
                DataSet dataSet = new DataSet();
                dataSet.ReadXml(@"" + icd.FilePath + icd.FileReadLocation);
                DataTable dtHead = dataSet.Tables["Head"];
                DataTable dtItem = dataSet.Tables["Item"];
                DataTable dtDetail = dataSet.Tables["Detail"];
                if (dtHead.Rows.Count > 0)
                {
                    icd.MessageId = Convert.ToString(dtHead.Rows[0]["msgId"]);
                    icd.OrganizationId = Convert.ToString(dtHead.Rows[0]["orgId"]);
                    icd.TransactionHeadDateTime = Convert.ToDateTime(dtHead.Rows[0]["ts"]);
                }
                if (dtItem.Rows.Count > 0)
                {
                    DataTable tblAVCFiltered = dtItem.AsEnumerable().Where(r => r.Field<string>("name") == "AVC").CopyToDataTable();
                    if (tblAVCFiltered.Rows.Count > 0)
                        icd.AVC = Convert.ToString(tblAVCFiltered.Rows[0]["value"]);

                    DataTable tblMVCFiltered = dtItem.AsEnumerable().Where(r => r.Field<string>("name") == "MVC").CopyToDataTable();
                    if (tblMVCFiltered.Rows.Count > 0)
                        icd.MVC = Convert.ToString(tblMVCFiltered.Rows[0]["value"]);

                    DataTable tblAuditedVCFiltered = dtItem.AsEnumerable().Where(r => r.Field<string>("name") == "AuditedVC").CopyToDataTable();
                    if (tblAuditedVCFiltered.Rows.Count > 0)
                        icd.AuditedVC = Convert.ToString(tblAuditedVCFiltered.Rows[0]["value"]);

                    DataTable tblViolationAmountFiltered = dtItem.AsEnumerable().Where(r => r.Field<string>("name") == "ViolationAmount").CopyToDataTable();
                    if (tblViolationAmountFiltered.Rows.Count > 0)
                    {
                        if (!string.IsNullOrEmpty(Convert.ToString(tblViolationAmountFiltered.Rows[0]["value"])))
                            icd.ViolationAmount = Convert.ToDecimal(tblViolationAmountFiltered.Rows[0]["value"]);
                    }

                    DataTable tblProcessedAmountFiltered = dtItem.AsEnumerable().Where(r => r.Field<string>("name") == "ProcessedAmount").CopyToDataTable();
                    if (tblProcessedAmountFiltered.Rows.Count > 0)
                    {
                        if (!string.IsNullOrEmpty(Convert.ToString(tblProcessedAmountFiltered.Rows[0]["value"])))
                            icd.ProcessedAmount = Convert.ToDecimal(tblProcessedAmountFiltered.Rows[0]["value"]);
                    }

                    DataTable tblProcessedDateFiltered = dtItem.AsEnumerable().Where(r => r.Field<string>("name") == "ProcessedDate").CopyToDataTable();
                    if (tblProcessedDateFiltered.Rows.Count > 0)
                    {
                        if (!string.IsNullOrEmpty(Convert.ToString(tblProcessedDateFiltered.Rows[0]["value"])))
                            icd.ProcessedDate = Convert.ToDateTime(tblProcessedDateFiltered.Rows[0]["value"]);
                    }
                }
                if (dtDetail.Rows.Count > 0)
                {
                    DataTable tblImageReviewResultFiltered = dtDetail.AsEnumerable().Where(r => r.Field<string>("name") == "ImageReviewResult").CopyToDataTable();
                    if (tblImageReviewResultFiltered.Rows.Count > 0)
                        icd.ImageReviewResult = Convert.ToString(tblImageReviewResultFiltered.Rows[0]["value"]) == "ACCEPTED" ? true : false;

                    DataTable tblRespCodeFiltered = dtDetail.AsEnumerable().Where(r => r.Field<string>("name") == "RespCode").CopyToDataTable();
                    if (tblRespCodeFiltered.Rows.Count > 0)
                    {
                        if (!string.IsNullOrEmpty(Convert.ToString(tblRespCodeFiltered.Rows[0]["value"])))
                            icd.ResponseCode = Convert.ToInt32(tblRespCodeFiltered.Rows[0]["value"]);
                    }
                }
                BankOfficeAPILog("VoilationAuditResponse-Violation Audit Response file " + icd.MessageId + ".xml read successfully.");
            }
            catch (Exception ex)
            {
                BankOfficeAPILog("Error: ReadVoilationAuditResponseXMLFile :" + ex.Message + "-" + ex.StackTrace);
            }

            return icd;
        }
    }
}