using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Text;
using CommonLibrary.DBA;
using Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer;
namespace Softomation.DMS.Libraries.CommonLibrary.DataLayer
{
    internal class VehicleClassDL
    {
        #region Global Varialble
        static DataTable dt;
        static string tableName = "tbl_VehicleClassMapping";
        #endregion

        internal static List<ResponceIL> InsertUpdate(VehicleClassIL vehicleClass)
        {
            List<ResponceIL> responces = null;
            try
            {

                StringBuilder xmlPermission = new StringBuilder();
                for (int i = 0; i < vehicleClass.IhmclVehicleClassIL.Count; i++)
                {
                    xmlPermission.AppendLine("<nodes>");
                    xmlPermission.AppendLine("    <node>");
                    xmlPermission.AppendLine("      <IHMCLClassId>" + vehicleClass.IhmclVehicleClassIL[i].IHMCLClassId + "</IHMCLClassId>");
                    xmlPermission.AppendLine("    </node>");
                    xmlPermission.AppendLine("</nodes>");
                }
                string spName = "USP_VehicleClassInsertUpdate";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EntryId", DbType.Int32, vehicleClass.EntryId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ClientId", DbType.Int16, vehicleClass.ClientId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ClassId", DbType.Int16, vehicleClass.ClassId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@AVCClassId", DbType.Int16, vehicleClass.AvcClassId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ClassName", DbType.String, vehicleClass.ClassName, ParameterDirection.Input, 100));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ClassDescription", DbType.String, vehicleClass.ClassDescription, ParameterDirection.Input, 100));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@VehicleWeight", DbType.Decimal, vehicleClass.VehicleWeight, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@MappingData", DbType.String, xmlPermission.ToString(), ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@DataStatus", DbType.Int16, vehicleClass.DataStatus, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@UserId", DbType.Int32, vehicleClass.CreatedBy, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@CDateTime", DbType.DateTime, DateTime.Now, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                responces = Constants.ConvertResponceList(dt);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return responces;
        }

        internal static List<ResponceIL> Update(VehicleClassIL vehicleClass)
        {
            List<ResponceIL> responces = null;
            try
            {
                string spName = "USP_VehicleClassUpdate";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ClassId", DbType.Int16, vehicleClass.ClassId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ClassName", DbType.String, vehicleClass.ClassName, ParameterDirection.Input, 100));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ClassDescription", DbType.String, vehicleClass.ClassDescription, ParameterDirection.Input, 100));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@VehicleWeight", DbType.Decimal, vehicleClass.VehicleWeight, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@DataStatus", DbType.Int16, vehicleClass.DataStatus, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@UserId", DbType.Int32, vehicleClass.CreatedBy, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@CDateTime", DbType.DateTime, DateTime.Now, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                responces = Constants.ConvertResponceList(dt);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return responces;
        }

        internal static List<ResponceIL> PInsertUpdate(VehicleClassIL vehicleClass)
        {
            List<ResponceIL> responces = null;
            try
            {
                string spName = "USP_VehicleClassInsertUpdate";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ClassId", DbType.Int16, vehicleClass.ClassId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ClassName", DbType.String, vehicleClass.ClassName, ParameterDirection.Input, 100));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ClassDescription", DbType.String, vehicleClass.ClassDescription, ParameterDirection.Input, 100));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@VehicleWeight", DbType.Decimal, vehicleClass.VehicleWeight, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@DataStatus", DbType.Int16, vehicleClass.DataStatus, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@CreatedBy", DbType.Int32, vehicleClass.CreatedBy, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@CreatedDate", DbType.DateTime, vehicleClass.CreatedDate, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ModifiedBy", DbType.Int32, vehicleClass.ModifiedBy, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ModifiedDate", DbType.DateTime, vehicleClass.ModifiedDate, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                responces = Constants.ConvertResponceList(dt);

                //StringBuilder xmlPermission = new StringBuilder();
                //for (int i = 0; i < vehicleClass.IhmclVehicleClassIL.Count; i++)
                //{
                //    xmlPermission.AppendLine("<nodes>");
                //    xmlPermission.AppendLine("    <node>");
                //    xmlPermission.AppendLine("      <IHMCLClassId>" + vehicleClass.IhmclVehicleClassIL[i].IHMCLClassId + "</IHMCLClassId>");
                //    xmlPermission.AppendLine("    </node>");
                //    xmlPermission.AppendLine("</nodes>");
                //}
                //string spName = "USP_VehicleClassInsertUpdate";
                //DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                //command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EntryId", DbType.Int32, vehicleClass.EntryId, ParameterDirection.Input));
                //command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ClientId", DbType.Int16, vehicleClass.ClientId, ParameterDirection.Input));
                //command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ClassId", DbType.Int16, vehicleClass.ClassId, ParameterDirection.Input));
                //command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@AVCClassId", DbType.Int16, vehicleClass.AvcClassId, ParameterDirection.Input));
                //command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ClassName", DbType.String, vehicleClass.ClassName, ParameterDirection.Input, 100));
                //command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ClassDescription", DbType.String, vehicleClass.ClassDescription, ParameterDirection.Input, 100));
                //command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@VehicleWeight", DbType.Decimal, vehicleClass.VehicleWeight, ParameterDirection.Input));
                //command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@MappingData", DbType.String, xmlPermission.ToString(), ParameterDirection.Input));
                //command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@DataStatus", DbType.Int16, vehicleClass.DataStatus, ParameterDirection.Input));
                //command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@CreatedBy", DbType.Int32, vehicleClass.CreatedBy, ParameterDirection.Input));
                //command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@CreatedDate", DbType.DateTime, vehicleClass.CreatedDate, ParameterDirection.Input));
                //command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ModifiedBy", DbType.Int32, vehicleClass.ModifiedBy, ParameterDirection.Input));
                //command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ModifiedDate", DbType.DateTime, vehicleClass.ModifiedDate, ParameterDirection.Input));
                //dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                //responces = Constants.ConvertResponceList(dt);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return responces;
        }

        internal static void MarkedDeleted()
        {
            try
            {
                string spName = "USP_VehicleClassMarkedDeleted";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                DBAccessor.ExecuteNonQuery(command);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        internal static void DeletedData()
        {
            try
            {
                string spName = "USP_VehicleClassDeletedData";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                DBAccessor.ExecuteNonQuery(command);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }


        #region Get Methods
        internal static List<VehicleClassIL> GetAll()
        {
            DataTable dt = new DataTable();
            List<VehicleClassIL> vehicleClasses = new List<VehicleClassIL>();
            try
            {
                string spName = "USP_VehicleClassGetAll";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    vehicleClasses.Add(CreateObjectFromDataRow(dr));

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return vehicleClasses;

        }

        internal static List<VehicleClassIL> GetActive()
        {
            DataTable dt = new DataTable();
            List<VehicleClassIL> vehicleClasses = new List<VehicleClassIL>();
            try
            {
                string spName = "USP_VehicleClassGetActive";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    vehicleClasses.Add(CreateObjectFromDataRow(dr));

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return vehicleClasses;

        }

        internal static List<VehicleClassIL> GetByClientId(Int32 ClientId)
        {
            DataTable dt = new DataTable();
            List<VehicleClassIL> vehicleClasses = new List<VehicleClassIL>();
            try
            {
                string spName = "USP_VehicleClassGetClientId";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ClientId", DbType.Int32, ClientId, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    vehicleClasses.Add(CreateObjectFromDataRow(dr));

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return vehicleClasses;
        }

        internal static VehicleClassIL GetByClassId(Int32 ClassId)
        {
            DataTable dt = new DataTable();
            VehicleClassIL vehicleClasses = new VehicleClassIL();
            try
            {
                string spName = "USP_VehicleClassGetClassId";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ClassId", DbType.Int32, ClassId, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    vehicleClasses = CreateObjectFromDataRow(dr);

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return vehicleClasses;
        }

        internal static List<IHMCLVehicleClassIL> GetIHMCLClassDetails(Int16 ClientId, Int16 ClassId)
        {
            DataTable dt = new DataTable();
            List<IHMCLVehicleClassIL> vehicleClasses = new List<IHMCLVehicleClassIL>();
            try
            {
                string spName = "USP_VehicleClassIHMCLDetails";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ClientId", DbType.Int32, ClientId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ClassId", DbType.Int32, ClassId, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    vehicleClasses.Add(CreateIHMCLObjectFromDataRow(dr));

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return vehicleClasses;
        }
        #endregion

        #region Helper Methods
        private static VehicleClassIL CreateObjectFromDataRow(DataRow dr)
        {
            VehicleClassIL vc = new VehicleClassIL();

            if (dr["ClientId"] != DBNull.Value)
                vc.ClientId = Convert.ToInt16(dr["ClientId"]);

            if (dr["ClientName"] != DBNull.Value)
                vc.ClientName = Convert.ToString(dr["ClientName"]);

            if (dr["ClassId"] != DBNull.Value)
                vc.ClassId = Convert.ToInt16(dr["ClassId"]);

            if (dr["ClassName"] != DBNull.Value)
                vc.ClassName = Convert.ToString(dr["ClassName"]);

            if (dr["ClassDescription"] != DBNull.Value)
                vc.ClassDescription = Convert.ToString(dr["ClassDescription"]);

            if (dr["VehicleWeight"] != DBNull.Value)
                vc.VehicleWeight = Convert.ToDecimal(dr["VehicleWeight"]);

            if (dr["AvcClassId"] != DBNull.Value)
                vc.AvcClassId = Convert.ToInt16(dr["AvcClassId"]);

            if (dr["AvcClassName"] != DBNull.Value)
                vc.AvcClassName = Convert.ToString(dr["AvcClassName"]);

            if (dr["AvcClassDescription"] != DBNull.Value)
                vc.AvcClassDescription = Convert.ToString(dr["AvcClassDescription"]);

            if (dr["MinAxleCount"] != DBNull.Value)
                vc.MinAxleCount = Convert.ToInt16(dr["MinAxleCount"]);

            if (dr["MaxAxleCount"] != DBNull.Value)
                vc.MaxAxleCount = Convert.ToInt16(dr["MaxAxleCount"]);

            if (dr["MinHeight"] != DBNull.Value)
                vc.MinHeight = Convert.ToDecimal(dr["MinHeight"]);

            if (dr["MaxHeight"] != DBNull.Value)
                vc.MaxHeight = Convert.ToDecimal(dr["MaxHeight"]);

            if (dr["MinWidth"] != DBNull.Value)
                vc.MinWidth = Convert.ToDecimal(dr["MinWidth"]);

            if (dr["MaxWidth"] != DBNull.Value)
                vc.MaxWidth = Convert.ToDecimal(dr["MaxWidth"]);

            if (dr["MinLength"] != DBNull.Value)
                vc.MinLength = Convert.ToDecimal(dr["MinLength"]);

            if (dr["MaxLength"] != DBNull.Value)
                vc.MaxLength = Convert.ToDecimal(dr["MaxLength"]);

            if (dr["CreatedDate"] != DBNull.Value)
                vc.CreatedDate = Convert.ToDateTime(dr["CreatedDate"]);

            if (dr["CreatedBy"] != DBNull.Value)
                vc.CreatedBy = Convert.ToInt32(dr["CreatedBy"]);

            if (dr["ModifiedDate"] != DBNull.Value)
                vc.ModifiedDate = Convert.ToDateTime(dr["ModifiedDate"]);

            if (dr["ModifiedBy"] != DBNull.Value)
                vc.ModifiedBy = Convert.ToInt32(dr["ModifiedBy"]);

            if (dr["DataStatus"] != DBNull.Value)
            {
                vc.DataStatus = Convert.ToInt16(dr["DataStatus"]);
                if (vc.DataStatus != 1)
                    vc.DataStatusName = "Inactive";
            }

            vc.IhmclVehicleClassIL = GetIHMCLClassDetails(vc.ClientId, vc.ClassId);
            return vc;
        }

        private static IHMCLVehicleClassIL CreateIHMCLObjectFromDataRow(DataRow dr)
        {
            IHMCLVehicleClassIL acvClass = new IHMCLVehicleClassIL();

            if (dr["IHMCLClassId"] != DBNull.Value)
                acvClass.IHMCLClassId = Convert.ToInt16(dr["IHMCLClassId"]);

            if (dr["IHMCLClassName"] != DBNull.Value)
                acvClass.IHMCLClassName = Convert.ToString(dr["IHMCLClassName"]);

            if (dr["IHMCLClassDescription"] != DBNull.Value)
                acvClass.IHMCLClassDescription = Convert.ToString(dr["IHMCLClassDescription"]);

            if (dr["CreatedDate"] != DBNull.Value)
                acvClass.CreatedDate = Convert.ToDateTime(dr["CreatedDate"]);

            if (dr["CreatedBy"] != DBNull.Value)
                acvClass.CreatedBy = Convert.ToInt32(dr["CreatedBy"]);

            if (dr["ModifiedDate"] != DBNull.Value)
                acvClass.ModifiedDate = Convert.ToDateTime(dr["ModifiedDate"]);

            if (dr["ModifiedBy"] != DBNull.Value)
                acvClass.ModifiedBy = Convert.ToInt32(dr["ModifiedBy"]);

            if (dr["DataStatus"] != DBNull.Value)
                acvClass.DataStatus = Convert.ToInt16(dr["DataStatus"]);
            return acvClass;
        }

        #endregion
    }
}
