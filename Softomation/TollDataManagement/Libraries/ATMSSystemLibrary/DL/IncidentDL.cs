using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using Softomation.ATMSSystemLibrary.DBA;
using Softomation.ATMSSystemLibrary.IL;

namespace Softomation.ATMSSystemLibrary.DL
{
    internal class IncidentDL
    {

        #region Helper Methods
        private static IncidentIL CreateObjectFromDataRow(DataRow dr)
        {
            IncidentIL id = new IncidentIL();

            if (dr["IncidentId"] != DBNull.Value)
                id.IncidentId = Convert.ToString(dr["IncidentId"]);

            if (dr["ReferenceNumber"] != DBNull.Value)
                id.ReferenceNumber = Convert.ToString(dr["ReferenceNumber"]);

            if (dr["IncidentCategoryId"] != DBNull.Value)
                id.IncidentCategoryId = Convert.ToInt16(dr["IncidentCategoryId"]);

            if (dr["IncidentDescription"] != DBNull.Value)
                id.IncidentDescription = Convert.ToString(dr["IncidentDescription"]);
            
            if (dr["IncidentImagePath"] != DBNull.Value)
                id.IncidentImagePath = Convert.ToString(dr["IncidentImagePath"]);

            if (dr["IncidentVideoPath"] != DBNull.Value)
                id.IncidentVideoPath = Convert.ToString(dr["IncidentVideoPath"]);

            if (dr["IncidentAudioPath"] != DBNull.Value)
                id.IncidentAudioPath = Convert.ToString(dr["IncidentAudioPath"]);

            if (dr["DirectionId"] != DBNull.Value)
                id.DirectionId = Convert.ToInt16(dr["DirectionId"]);

            if (dr["ChainageNumber"] != DBNull.Value)
                id.ChainageNumber = Convert.ToDecimal(dr["ChainageNumber"]);

            if (dr["Latitude"] != DBNull.Value)
                id.Latitude = Convert.ToDecimal(dr["Latitude"]);

            if (dr["Longitude"] != DBNull.Value)
                id.Longitude = Convert.ToDecimal(dr["Longitude"]);

            if (dr["VehiclePlateNumber"] != DBNull.Value)
                id.VehiclePlateNumber = Convert.ToString(dr["VehiclePlateNumber"]);

            if (dr["VehicleClassId"] != DBNull.Value)
                id.VehicleClassId = Convert.ToInt16(dr["VehicleClassId"]);

            if (dr["SourceSystemId"] != DBNull.Value)
                id.SourceSystemId = Convert.ToInt16(dr["SourceSystemId"]);

            if (dr["EquipmentId"] != DBNull.Value)
                id.EquipmentId = Convert.ToInt64(dr["EquipmentId"]);

            if (dr["NearByVMSId"] != DBNull.Value)
                id.NearByVMSId = Convert.ToInt64(dr["NearByVMSId"]);

            if (dr["NearByPTZId"] != DBNull.Value)
                id.NearByPTZId = Convert.ToInt64(dr["NearByPTZId"]);

            if (dr["IncidentGeneratedByTypeId"] != DBNull.Value)
                id.IncidentGeneratedByTypeId = Convert.ToInt16(dr["IncidentGeneratedByTypeId"]);

            if (dr["IncidentGeneratedById"] != DBNull.Value)
                id.IncidentGeneratedById = Convert.ToInt64(dr["IncidentGeneratedById"]);

            if (dr["RejectedBy"] != DBNull.Value)
                id.RejectedBy = Convert.ToInt64(dr["RejectedBy"]);

            if (dr["RejectionRemark"] != DBNull.Value)
                id.RejectionRemark = Convert.ToString(dr["RejectionRemark"]);

            if (dr["RejectionDateTime"] != DBNull.Value)
                id.RejectionDateTime = Convert.ToDateTime(dr["RejectionDateTime"]);

            if (dr["ApprovedBy"] != DBNull.Value)
                id.ApprovedBy = Convert.ToInt64(dr["ApprovedBy"]);

            if (dr["ApprovedRemark"] != DBNull.Value)
                id.ApprovedRemark = Convert.ToString(dr["ApprovedRemark"]);

            if (dr["ApprovedDateTime"] != DBNull.Value)
                id.ApprovedDateTime = Convert.ToDateTime(dr["ApprovedDateTime"]);

            if (dr["AssignedTo"] != DBNull.Value)
                id.AssignedTo = Convert.ToInt64(dr["AssignedTo"]);

            if (dr["AssignedDateTime"] != DBNull.Value)
                id.AssignedDateTime = Convert.ToDateTime(dr["AssignedDateTime"]);

            if (dr["ResolvedBy"] != DBNull.Value)
                id.ResolvedBy = Convert.ToInt64(dr["ResolvedBy"]);

            if (dr["ResolvedRemark"] != DBNull.Value)
                id.ResolvedRemark = Convert.ToString(dr["ResolvedRemark"]);

            if (dr["ResolvedDateTime"] != DBNull.Value)
                id.ResolvedDateTime = Convert.ToDateTime(dr["ResolvedDateTime"]);
            
            if (dr["IncidentStatusId"] != DBNull.Value)
                id.IncidentStatusId = Convert.ToInt16(dr["IncidentStatusId"]);

            if (dr["ProcessPercentage"] != DBNull.Value)
                id.ProcessPercentage = Convert.ToDecimal(dr["ProcessPercentage"]);

            if (dr["SubCategoryId"] != DBNull.Value)
                id.SubCategoryId = Convert.ToInt16(dr["SubCategoryId"]);

            if (dr["Comments"] != DBNull.Value)
                id.Comments = Convert.ToString(dr["Comments"]);

            if (dr["SendStatus"] != DBNull.Value)
                id.SendStatus = Convert.ToInt16(dr["SendStatus"]);

            if (dr["DataStatus"] != DBNull.Value)
                id.DataStatus = Convert.ToInt16(dr["DataStatus"]);

            if (dr["CreatedDate"] != DBNull.Value)
                id.CreatedDate = Convert.ToDateTime(dr["CreatedDate"]);

            if (dr["CreatedBy"] != DBNull.Value)
                id.CreatedBy = Convert.ToInt32(dr["CreatedBy"]);

            if (dr["ModifiedDate"] != DBNull.Value)
                id.ModifiedDate = Convert.ToDateTime(dr["ModifiedDate"]);

            if (dr["ModifiedBy"] != DBNull.Value)
                id.ModifiedBy = Convert.ToInt32(dr["ModifiedBy"]);

            id.DataStatusName = Enum.GetName(typeof(Constants.DataStatus), (Constants.DataStatus)id.DataStatus);
            //id.DirectionName = Enum.GetName(typeof(Constants.DirectionType), (Constants.DirectionType)id.DirectionId);
            //SubCategoryId,IncidentCategoryId,VehicleClassId,SourceSystemId,EquipmentId,NearByVMSId,NearByPTZId,IncidentGeneratedByTypeId,IncidentGeneratedById
            //RejectedBy,ApprovedBy,AssignedTo,ResolvedBy,IncidentStatusId,SubCategoryId,DirectionId
            return id;
        }
        #endregion
    }
}
