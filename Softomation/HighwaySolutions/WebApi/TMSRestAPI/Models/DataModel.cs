using System;
using System.Data;
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
        public static IDCResponsePayIL ReadXMLFile(IDCResponsePayIL iDC)
        {
            try
            {
                DataSet dataSet = new DataSet();
                dataSet.ReadXml(iDC.SaveLoc);
                iDC.MsgId = Convert.ToString(dataSet.Tables["Head"].Rows[0]["msgId"]);
                iDC.OrgId = Convert.ToString(dataSet.Tables["Head"].Rows[0]["orgId"]);
                iDC.Version = Convert.ToString(dataSet.Tables["Head"].Rows[0]["ver"]);
                iDC.TranscationId = Convert.ToString(dataSet.Tables["Txn"].Rows[0]["Txn_Id"]);
                iDC.ID = Convert.ToString(dataSet.Tables["Txn"].Rows[0]["Id"]);
                iDC.Note = Convert.ToString(dataSet.Tables["Txn"].Rows[0]["Note"]);
                iDC.OrgTxnId = Convert.ToString(dataSet.Tables["Txn"].Rows[0]["orgTxnId"]);
                iDC.RFIDTranscation = Convert.ToString(dataSet.Tables["Txn"].Rows[0]["refId"]);
                iDC.RefURL = Convert.ToString(dataSet.Tables["Txn"].Rows[0]["refUrl"]);
                iDC.TransactionType = Convert.ToString(dataSet.Tables["Txn"].Rows[0]["type"]);
                iDC.RespPayId = Convert.ToString(dataSet.Tables["Txn"].Rows[0]["RespPay_Id"]);
                iDC.TransctionDateTime = Convert.ToDateTime(dataSet.Tables["Txn"].Rows[0]["ts"]);
                //iDC.TransctionLibility = dataSet.Tables["Txn"].Rows[0]["RespPay_Id"].ToString(); // Temp Declare
                iDC.CCHTrasactionId = Convert.ToString(dataSet.Tables["EntryTxn"].Rows[0]["Id"]);
                iDC.RespId = Convert.ToString(dataSet.Tables["Resp"].Rows[0]["Resp_Id"]);
                iDC.ResponseFareType = Convert.ToString(dataSet.Tables["Resp"].Rows[0]["fareType"]);
                iDC.PlazaId = Convert.ToString(dataSet.Tables["Resp"].Rows[0]["plazaid"]);
                iDC.ResponseCode = Convert.ToString(dataSet.Tables["Resp"].Rows[0]["respcode"]);
                iDC.ResponseResult = Convert.ToString(dataSet.Tables["Resp"].Rows[0]["result"]);
                iDC.ResponseDateTime = Convert.ToDateTime(dataSet.Tables["Resp"].Rows[0]["ts"]);

                try
                {

                    iDC.VehicleId = "";
                    iDC.TID = "";
                    iDC.TagId = "";
                    iDC.VehicleRespId = "";
                    iDC.VehicleDetailID = "";
                    iDC.VehicleDetailsID = "";
                    iDC.DetailName = "";
                    iDC.VehicleClass = "0";
                    iDC.DetailVehicleDetailsId = "0";
                    iDC.DetailName1 = "";
                    iDC.VehicleNumber = "";
                    iDC.DetailVehicleDetailsId1 = "";
                    iDC.DetailName2 = "";
                    iDC.IsComvehicle = "0";
                    iDC.DetailVehicleDetailsId2 = "";
                    iDC.RefTollfare = "0";
                    iDC.RefApprovalNum = "0";
                    iDC.RefErrcode = "0";
                    iDC.RefSettCurrency = "0";
                    iDC.RefRespId = "0";
                    if (dataSet.Tables.Contains("Vehicle") && dataSet.Tables["Vehicle"].Rows.Count > 0)
                    {
                        iDC.TID = Convert.ToString(dataSet.Tables["Vehicle"].Rows[0]["TID"]);
                        iDC.TagId = Convert.ToString(dataSet.Tables["Vehicle"].Rows[0]["tagId"]);
                        iDC.VehicleRespId = Convert.ToString(dataSet.Tables["Vehicle"].Rows[0]["Resp_Id"]);
                    }
                    else
                    {

                        iDC.TID = "";
                        iDC.TagId = "";
                        iDC.VehicleRespId = "";
                    }
                    if (dataSet.Tables.Count > 17)
                    {
                        iDC.VehicleId = Convert.ToString(dataSet.Tables["Vehicle"].Rows[0]["Vehicle_Id"]);
                        iDC.VehicleDetailID = Convert.ToString(dataSet.Tables["VehicleDetails"].Rows[0]["VehicleDetails_Id"]);
                        iDC.VehicleDetailsID = Convert.ToString(dataSet.Tables["VehicleDetails"].Rows[0]["Vehicle_ID"]);
                        iDC.DetailName = Convert.ToString(dataSet.Tables["Detail"].Rows[0]["name"]);
                        if (Convert.ToString(iDC.DetailName) == "COMVEHICLE")
                        {
                            iDC.IsComvehicle = Convert.ToString(dataSet.Tables["Detail"].Rows[0]["Value"]);
                        }
                        else if (Convert.ToString(iDC.DetailName) == "VEHICLECLASS")
                        {
                            iDC.VehicleClass = Convert.ToString(dataSet.Tables["Detail"].Rows[0]["Value"]);
                        }
                        else if (Convert.ToString(iDC.DetailName) == "REGNUMBER")
                        {
                            iDC.VehicleNumber = Convert.ToString(dataSet.Tables["Detail"].Rows[0]["Value"]);
                        }
                        iDC.DetailName1 = Convert.ToString(dataSet.Tables["Detail"].Rows[1]["name"]);
                        if (Convert.ToString(iDC.DetailName1) == "COMVEHICLE")
                        {
                            iDC.IsComvehicle = Convert.ToString(dataSet.Tables["Detail"].Rows[1]["Value"]);
                        }
                        else if (Convert.ToString(iDC.DetailName1) == "VEHICLECLASS")
                        {
                            iDC.VehicleClass = Convert.ToString(dataSet.Tables["Detail"].Rows[1]["Value"]);
                        }
                        else if (Convert.ToString(iDC.DetailName1) == "REGNUMBER")
                        {
                            iDC.VehicleNumber = Convert.ToString(dataSet.Tables["Detail"].Rows[1]["Value"]);
                        }
                        iDC.DetailName2 = Convert.ToString(dataSet.Tables["Detail"].Rows[2]["name"]);
                        if (Convert.ToString(iDC.DetailName2) == "COMVEHICLE")
                        {
                            iDC.IsComvehicle = Convert.ToString(dataSet.Tables["Detail"].Rows[2]["Value"]);
                        }

                        else if (Convert.ToString(iDC.DetailName2) == "VEHICLECLASS")
                        {
                            iDC.VehicleClass = Convert.ToString(dataSet.Tables["Detail"].Rows[2]["Value"]);
                        }
                        else if (Convert.ToString(iDC.DetailName2) == "REGNUMBER")
                        {
                            iDC.VehicleNumber = Convert.ToString(dataSet.Tables["Detail"].Rows[2]["Value"]);
                        }
                        iDC.DetailVehicleDetailsId = Convert.ToString(dataSet.Tables["Detail"].Rows[0]["VehicleDetails_Id"]);
                        iDC.DetailVehicleDetailsId1 = Convert.ToString(dataSet.Tables["Detail"].Rows[1]["VehicleDetails_Id"]);
                        iDC.DetailVehicleDetailsId2 = Convert.ToString(dataSet.Tables["Detail"].Rows[2]["VehicleDetails_Id"]);
                        iDC.IsResponseFileSuccess = true;
                    }
                    if (dataSet.Tables.Contains("Ref") && dataSet.Tables["Ref"].Rows.Count > 0)
                    {
                        iDC.RefTollfare = Convert.ToString(dataSet.Tables["Ref"].Rows[0]["Tollfare"]);
                        iDC.RefApprovalNum = Convert.ToString(dataSet.Tables["Ref"].Rows[0]["ApprovalNum"]);
                        iDC.RefErrcode = Convert.ToString(dataSet.Tables["Ref"].Rows[0]["errcode"]);
                        iDC.RefSettCurrency = Convert.ToString(dataSet.Tables["Ref"].Rows[0]["Settcurrency"]);
                        iDC.RefRespId = Convert.ToString(dataSet.Tables["Ref"].Rows[0]["Resp_Id"]);
                    }
                    else
                    {
                        iDC.RefTollfare = "0.0";
                        iDC.RefApprovalNum = "";
                        iDC.RefErrcode = "";
                        iDC.RefSettCurrency = "INR";
                        iDC.RefRespId = "0";
                    }
                    BankOfficeAPILog("ResponsePay-PayResponse file " + iDC.MsgId + ".xml read successfully.");
                    iDC.IsResponseFileSuccess = true;
                }
                catch (Exception ex)
                {
                    iDC.IsResponseFileSuccess = false;
                    BankOfficeAPILog("Error: ReadXMLFile :" + ex.Message + "-" + ex.StackTrace);
                }
            }
            catch (Exception ex)
            {
                iDC.IsResponseFileSuccess = false;
                BankOfficeAPILog("Error: ReadXMLFile :" + ex.Message + "-" + ex.StackTrace);
            }
            return iDC;
        }
    }
}