USE [TMSv1]
GO
/****** Object:  StoredProcedure [dbo].[USP_WimTransactionInsert]    Script Date: 07-Jan-25 9:11:38 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_WimTransactionInsert]
GO
/****** Object:  StoredProcedure [dbo].[USP_WimTransactionAxleDetailsInsert]    Script Date: 07-Jan-25 9:11:38 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_WimTransactionAxleDetailsInsert]
GO
/****** Object:  StoredProcedure [dbo].[USP_UserUpdatePassword]    Script Date: 07-Jan-25 9:11:38 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_UserUpdatePassword]
GO
/****** Object:  StoredProcedure [dbo].[USP_UsersGetByLoginId]    Script Date: 07-Jan-25 9:11:38 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_UsersGetByLoginId]
GO
/****** Object:  StoredProcedure [dbo].[USP_UserProfileChange]    Script Date: 07-Jan-25 9:11:38 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_UserProfileChange]
GO
/****** Object:  StoredProcedure [dbo].[USP_UserLogout]    Script Date: 07-Jan-25 9:11:38 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_UserLogout]
GO
/****** Object:  StoredProcedure [dbo].[USP_UserLoginActivityLog]    Script Date: 07-Jan-25 9:11:38 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_UserLoginActivityLog]
GO
/****** Object:  StoredProcedure [dbo].[USP_UserInsertUpdate]    Script Date: 07-Jan-25 9:11:38 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_UserInsertUpdate]
GO
/****** Object:  StoredProcedure [dbo].[USP_UserGetByUserTypeId]    Script Date: 07-Jan-25 9:11:38 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_UserGetByUserTypeId]
GO
/****** Object:  StoredProcedure [dbo].[USP_UserGetBySystemUserTypeId]    Script Date: 07-Jan-25 9:11:38 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_UserGetBySystemUserTypeId]
GO
/****** Object:  StoredProcedure [dbo].[USP_UserGetbyId]    Script Date: 07-Jan-25 9:11:38 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_UserGetbyId]
GO
/****** Object:  StoredProcedure [dbo].[USP_UserGetAll]    Script Date: 07-Jan-25 9:11:38 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_UserGetAll]
GO
/****** Object:  StoredProcedure [dbo].[USP_UserforLaneGetAll]    Script Date: 07-Jan-25 9:11:38 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_UserforLaneGetAll]
GO
/****** Object:  StoredProcedure [dbo].[USP_TransactionTypeUpdate]    Script Date: 07-Jan-25 9:11:38 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_TransactionTypeUpdate]
GO
/****** Object:  StoredProcedure [dbo].[USP_TransactionTypeGetAll]    Script Date: 07-Jan-25 9:11:38 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_TransactionTypeGetAll]
GO
/****** Object:  StoredProcedure [dbo].[USP_TransactionTypeGetActive]    Script Date: 07-Jan-25 9:11:38 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_TransactionTypeGetActive]
GO
/****** Object:  StoredProcedure [dbo].[USP_TrafficTransactionDetailReport]    Script Date: 07-Jan-25 9:11:38 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_TrafficTransactionDetailReport]
GO
/****** Object:  StoredProcedure [dbo].[USP_TollFareSetup]    Script Date: 07-Jan-25 9:11:38 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_TollFareSetup]
GO
/****** Object:  StoredProcedure [dbo].[USP_TollFareGetDefault]    Script Date: 07-Jan-25 9:11:38 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_TollFareGetDefault]
GO
/****** Object:  StoredProcedure [dbo].[USP_TollFareGetByEffectedFrom]    Script Date: 07-Jan-25 9:11:38 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_TollFareGetByEffectedFrom]
GO
/****** Object:  StoredProcedure [dbo].[USP_TollFareConfigurationGetById]    Script Date: 07-Jan-25 9:11:38 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_TollFareConfigurationGetById]
GO
/****** Object:  StoredProcedure [dbo].[usp_TEST]    Script Date: 07-Jan-25 9:11:38 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TEST]
GO
/****** Object:  StoredProcedure [dbo].[USP_SystemVehicleSubClassGetActive]    Script Date: 07-Jan-25 9:11:38 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_SystemVehicleSubClassGetActive]
GO
/****** Object:  StoredProcedure [dbo].[USP_SystemVehicleClassInsertUpdate]    Script Date: 07-Jan-25 9:11:38 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_SystemVehicleClassInsertUpdate]
GO
/****** Object:  StoredProcedure [dbo].[USP_SystemVehicleClassGetById]    Script Date: 07-Jan-25 9:11:38 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_SystemVehicleClassGetById]
GO
/****** Object:  StoredProcedure [dbo].[USP_SystemVehicleClassGetAll]    Script Date: 07-Jan-25 9:11:38 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_SystemVehicleClassGetAll]
GO
/****** Object:  StoredProcedure [dbo].[USP_SystemVehicleClassGetActive]    Script Date: 07-Jan-25 9:11:38 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_SystemVehicleClassGetActive]
GO
/****** Object:  StoredProcedure [dbo].[USP_SystemSettingInsertUpdate]    Script Date: 07-Jan-25 9:11:38 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_SystemSettingInsertUpdate]
GO
/****** Object:  StoredProcedure [dbo].[USP_SystemSettingGet]    Script Date: 07-Jan-25 9:11:38 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_SystemSettingGet]
GO
/****** Object:  StoredProcedure [dbo].[USP_SystemIntegratorInsertUpdate]    Script Date: 07-Jan-25 9:11:38 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_SystemIntegratorInsertUpdate]
GO
/****** Object:  StoredProcedure [dbo].[USP_SystemIntegratorGetbyId]    Script Date: 07-Jan-25 9:11:38 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_SystemIntegratorGetbyId]
GO
/****** Object:  StoredProcedure [dbo].[USP_SystemIntegratorGetAll]    Script Date: 07-Jan-25 9:11:38 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_SystemIntegratorGetAll]
GO
/****** Object:  StoredProcedure [dbo].[USP_SystemIntegratorGetActive]    Script Date: 07-Jan-25 9:11:38 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_SystemIntegratorGetActive]
GO
/****** Object:  StoredProcedure [dbo].[USP_ShiftTiminingGetById]    Script Date: 07-Jan-25 9:11:38 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_ShiftTiminingGetById]
GO
/****** Object:  StoredProcedure [dbo].[USP_ShiftTiminingGetAll]    Script Date: 07-Jan-25 9:11:38 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_ShiftTiminingGetAll]
GO
/****** Object:  StoredProcedure [dbo].[USP_ShiftTiminingGetActive]    Script Date: 07-Jan-25 9:11:38 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_ShiftTiminingGetActive]
GO
/****** Object:  StoredProcedure [dbo].[USP_ShiftStatusGetOpen]    Script Date: 07-Jan-25 9:11:38 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_ShiftStatusGetOpen]
GO
/****** Object:  StoredProcedure [dbo].[USP_ShiftStatusGetClose]    Script Date: 07-Jan-25 9:11:38 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_ShiftStatusGetClose]
GO
/****** Object:  StoredProcedure [dbo].[USP_ShiftStatusGetAll]    Script Date: 07-Jan-25 9:11:38 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_ShiftStatusGetAll]
GO
/****** Object:  StoredProcedure [dbo].[USP_ShiftStatusByDate]    Script Date: 07-Jan-25 9:11:38 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_ShiftStatusByDate]
GO
/****** Object:  StoredProcedure [dbo].[USP_ShiftGetByDateTime]    Script Date: 07-Jan-25 9:11:38 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_ShiftGetByDateTime]
GO
/****** Object:  StoredProcedure [dbo].[USP_RolesPermissionGetByRoleId]    Script Date: 07-Jan-25 9:11:38 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_RolesPermissionGetByRoleId]
GO
/****** Object:  StoredProcedure [dbo].[USP_RolesPermissionGetByMenuId]    Script Date: 07-Jan-25 9:11:38 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_RolesPermissionGetByMenuId]
GO
/****** Object:  StoredProcedure [dbo].[USP_RolesPermissionGetByMenu]    Script Date: 07-Jan-25 9:11:38 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_RolesPermissionGetByMenu]
GO
/****** Object:  StoredProcedure [dbo].[USP_RolesGetById]    Script Date: 07-Jan-25 9:11:38 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_RolesGetById]
GO
/****** Object:  StoredProcedure [dbo].[USP_RolesGetAll]    Script Date: 07-Jan-25 9:11:38 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_RolesGetAll]
GO
/****** Object:  StoredProcedure [dbo].[USP_RolesGetActive]    Script Date: 07-Jan-25 9:11:38 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_RolesGetActive]
GO
/****** Object:  StoredProcedure [dbo].[USP_RolePermissionInsertUpdate]    Script Date: 07-Jan-25 9:11:38 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_RolePermissionInsertUpdate]
GO
/****** Object:  StoredProcedure [dbo].[USP_RoleInsertUpdate]    Script Date: 07-Jan-25 9:11:38 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_RoleInsertUpdate]
GO
/****** Object:  StoredProcedure [dbo].[USP_RevenueTransactionDetailReport]    Script Date: 07-Jan-25 9:11:38 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_RevenueTransactionDetailReport]
GO
/****** Object:  StoredProcedure [dbo].[USP_ReportCategoryById]    Script Date: 07-Jan-25 9:11:38 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_ReportCategoryById]
GO
/****** Object:  StoredProcedure [dbo].[USP_ReportCategory]    Script Date: 07-Jan-25 9:11:38 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_ReportCategory]
GO
/****** Object:  StoredProcedure [dbo].[USP_ProtocolTypeMasterGetAll]    Script Date: 07-Jan-25 9:11:38 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_ProtocolTypeMasterGetAll]
GO
/****** Object:  StoredProcedure [dbo].[USP_PlazaInsertUpdate]    Script Date: 07-Jan-25 9:11:38 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_PlazaInsertUpdate]
GO
/****** Object:  StoredProcedure [dbo].[USP_PlazaGetbyIpAddress]    Script Date: 07-Jan-25 9:11:38 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_PlazaGetbyIpAddress]
GO
/****** Object:  StoredProcedure [dbo].[USP_PlazaGetbyId]    Script Date: 07-Jan-25 9:11:38 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_PlazaGetbyId]
GO
/****** Object:  StoredProcedure [dbo].[USP_PlazaGetAll]    Script Date: 07-Jan-25 9:11:38 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_PlazaGetAll]
GO
/****** Object:  StoredProcedure [dbo].[USP_PlazaGetActive]    Script Date: 07-Jan-25 9:11:38 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_PlazaGetActive]
GO
/****** Object:  StoredProcedure [dbo].[USP_PaymentTypeUpdate]    Script Date: 07-Jan-25 9:11:38 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_PaymentTypeUpdate]
GO
/****** Object:  StoredProcedure [dbo].[USP_PaymentTypeGetAll]    Script Date: 07-Jan-25 9:11:38 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_PaymentTypeGetAll]
GO
/****** Object:  StoredProcedure [dbo].[USP_PaymentTypeGetActive]    Script Date: 07-Jan-25 9:11:38 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_PaymentTypeGetActive]
GO
/****** Object:  StoredProcedure [dbo].[USP_OverloadTransactionDetailReport]    Script Date: 07-Jan-25 9:11:38 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_OverloadTransactionDetailReport]
GO
/****** Object:  StoredProcedure [dbo].[USP_OverloadRevenueTransactionDetailReport]    Script Date: 07-Jan-25 9:11:38 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_OverloadRevenueTransactionDetailReport]
GO
/****** Object:  StoredProcedure [dbo].[USP_MISReport]    Script Date: 07-Jan-25 9:11:38 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_MISReport]
GO
/****** Object:  StoredProcedure [dbo].[USP_MenuGetByRoleId]    Script Date: 07-Jan-25 9:11:38 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_MenuGetByRoleId]
GO
/****** Object:  StoredProcedure [dbo].[USP_MenuGetAll]    Script Date: 07-Jan-25 9:11:38 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_MenuGetAll]
GO
/****** Object:  StoredProcedure [dbo].[USP_MasterDataGet]    Script Date: 07-Jan-25 9:11:38 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_MasterDataGet]
GO
/****** Object:  StoredProcedure [dbo].[USP_ManufacturerInsertUpdate]    Script Date: 07-Jan-25 9:11:38 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_ManufacturerInsertUpdate]
GO
/****** Object:  StoredProcedure [dbo].[USP_ManufacturerGetbyId]    Script Date: 07-Jan-25 9:11:38 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_ManufacturerGetbyId]
GO
/****** Object:  StoredProcedure [dbo].[USP_ManufacturerGetAll]    Script Date: 07-Jan-25 9:11:38 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_ManufacturerGetAll]
GO
/****** Object:  StoredProcedure [dbo].[USP_ManufacturerGetActive]    Script Date: 07-Jan-25 9:11:38 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_ManufacturerGetActive]
GO
/****** Object:  StoredProcedure [dbo].[USP_LogingActivityUpdate]    Script Date: 07-Jan-25 9:11:38 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_LogingActivityUpdate]
GO
/****** Object:  StoredProcedure [dbo].[USP_LogingActivityInsert]    Script Date: 07-Jan-25 9:11:38 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_LogingActivityInsert]
GO
/****** Object:  StoredProcedure [dbo].[USP_LastSevenDaysDetailReport]    Script Date: 07-Jan-25 9:11:38 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_LastSevenDaysDetailReport]
GO
/****** Object:  StoredProcedure [dbo].[USP_LaneTypeMasterGetAll]    Script Date: 07-Jan-25 9:11:38 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_LaneTypeMasterGetAll]
GO
/****** Object:  StoredProcedure [dbo].[USP_LaneTransactionUnReviewedGetLatest]    Script Date: 07-Jan-25 9:11:38 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_LaneTransactionUnReviewedGetLatest]
GO
/****** Object:  StoredProcedure [dbo].[USP_LaneTransactionReviewUpdate]    Script Date: 07-Jan-25 9:11:38 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_LaneTransactionReviewUpdate]
GO
/****** Object:  StoredProcedure [dbo].[USP_LaneTransactionReviewedGetLatest]    Script Date: 07-Jan-25 9:11:38 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_LaneTransactionReviewedGetLatest]
GO
/****** Object:  StoredProcedure [dbo].[USP_LaneTransactionReviewCancel]    Script Date: 07-Jan-25 9:11:38 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_LaneTransactionReviewCancel]
GO
/****** Object:  StoredProcedure [dbo].[USP_LaneTransactionInsert]    Script Date: 07-Jan-25 9:11:38 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_LaneTransactionInsert]
GO
/****** Object:  StoredProcedure [dbo].[USP_LaneTransactionGetLatest]    Script Date: 07-Jan-25 9:11:38 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_LaneTransactionGetLatest]
GO
/****** Object:  StoredProcedure [dbo].[USP_LaneTransactionGetByFilter]    Script Date: 07-Jan-25 9:11:38 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_LaneTransactionGetByFilter]
GO
/****** Object:  StoredProcedure [dbo].[USP_LaneTransactionGetAll]    Script Date: 07-Jan-25 9:11:38 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_LaneTransactionGetAll]
GO
/****** Object:  StoredProcedure [dbo].[USP_LaneTransactionDataInsert]    Script Date: 07-Jan-25 9:11:38 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_LaneTransactionDataInsert]
GO
/****** Object:  StoredProcedure [dbo].[USP_LaneStatusMasterGetAll]    Script Date: 07-Jan-25 9:11:38 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_LaneStatusMasterGetAll]
GO
/****** Object:  StoredProcedure [dbo].[USP_LanePositionMasterGetAll]    Script Date: 07-Jan-25 9:11:38 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_LanePositionMasterGetAll]
GO
/****** Object:  StoredProcedure [dbo].[USP_LanePointMasterGetAll]    Script Date: 07-Jan-25 9:11:38 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_LanePointMasterGetAll]
GO
/****** Object:  StoredProcedure [dbo].[USP_LaneModeMasterGetAll]    Script Date: 07-Jan-25 9:11:38 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_LaneModeMasterGetAll]
GO
/****** Object:  StoredProcedure [dbo].[USP_LaneInsertUpdate]    Script Date: 07-Jan-25 9:11:38 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_LaneInsertUpdate]
GO
/****** Object:  StoredProcedure [dbo].[USP_LaneHandledGet]    Script Date: 07-Jan-25 9:11:38 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_LaneHandledGet]
GO
/****** Object:  StoredProcedure [dbo].[USP_LaneGetbyPlazaId]    Script Date: 07-Jan-25 9:11:38 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_LaneGetbyPlazaId]
GO
/****** Object:  StoredProcedure [dbo].[USP_LaneGetbyIpAddress]    Script Date: 07-Jan-25 9:11:38 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_LaneGetbyIpAddress]
GO
/****** Object:  StoredProcedure [dbo].[USP_LaneGetbyId]    Script Date: 07-Jan-25 9:11:38 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_LaneGetbyId]
GO
/****** Object:  StoredProcedure [dbo].[USP_LaneGetAll]    Script Date: 07-Jan-25 9:11:38 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_LaneGetAll]
GO
/****** Object:  StoredProcedure [dbo].[USP_LaneGetActive]    Script Date: 07-Jan-25 9:11:38 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_LaneGetActive]
GO
/****** Object:  StoredProcedure [dbo].[USP_LaneDirectionMasterGetAll]    Script Date: 07-Jan-25 9:11:38 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_LaneDirectionMasterGetAll]
GO
/****** Object:  StoredProcedure [dbo].[USP_KeyboardDetailsUpdate]    Script Date: 07-Jan-25 9:11:38 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_KeyboardDetailsUpdate]
GO
/****** Object:  StoredProcedure [dbo].[USP_KeyboardDetailsGet]    Script Date: 07-Jan-25 9:11:38 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_KeyboardDetailsGet]
GO
/****** Object:  StoredProcedure [dbo].[USP_ICDViolationAuditDetailsRequest]    Script Date: 07-Jan-25 9:11:38 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_ICDViolationAuditDetailsRequest]
GO
/****** Object:  StoredProcedure [dbo].[USP_ICDViolationAuditDetailPendingRequest]    Script Date: 07-Jan-25 9:11:38 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_ICDViolationAuditDetailPendingRequest]
GO
/****** Object:  StoredProcedure [dbo].[USP_ICDTagStatusProcess]    Script Date: 07-Jan-25 9:11:38 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_ICDTagStatusProcess]
GO
/****** Object:  StoredProcedure [dbo].[USP_ICDResponseSyncTimeInsert]    Script Date: 07-Jan-25 9:11:38 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_ICDResponseSyncTimeInsert]
GO
/****** Object:  StoredProcedure [dbo].[USP_ICDRequestSyncTimeUpdateRequest]    Script Date: 07-Jan-25 9:11:38 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_ICDRequestSyncTimeUpdateRequest]
GO
/****** Object:  StoredProcedure [dbo].[USP_ICDRequestSyncTimeRequest]    Script Date: 07-Jan-25 9:11:38 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_ICDRequestSyncTimeRequest]
GO
/****** Object:  StoredProcedure [dbo].[USP_ICDRequestPayUpdateResponse]    Script Date: 07-Jan-25 9:11:38 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_ICDRequestPayUpdateResponse]
GO
/****** Object:  StoredProcedure [dbo].[USP_ICDRequestPayUpdateRequest]    Script Date: 07-Jan-25 9:11:38 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_ICDRequestPayUpdateRequest]
GO
/****** Object:  StoredProcedure [dbo].[USP_ICDRequestPayGetPendingStatus]    Script Date: 07-Jan-25 9:11:38 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_ICDRequestPayGetPendingStatus]
GO
/****** Object:  StoredProcedure [dbo].[USP_ICDRequestPayGetPending]    Script Date: 07-Jan-25 9:11:38 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_ICDRequestPayGetPending]
GO
/****** Object:  StoredProcedure [dbo].[USP_ICDRequestHeartBeatUpdateResponse]    Script Date: 07-Jan-25 9:11:38 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_ICDRequestHeartBeatUpdateResponse]
GO
/****** Object:  StoredProcedure [dbo].[USP_ICDRequestHeartBeatUpdateRequest]    Script Date: 07-Jan-25 9:11:38 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_ICDRequestHeartBeatUpdateRequest]
GO
/****** Object:  StoredProcedure [dbo].[USP_ICDRequestHeartBeatInsert]    Script Date: 07-Jan-25 9:11:38 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_ICDRequestHeartBeatInsert]
GO
/****** Object:  StoredProcedure [dbo].[USP_ICDRequestExceptionDetailUpdateRequest]    Script Date: 07-Jan-25 9:11:38 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_ICDRequestExceptionDetailUpdateRequest]
GO
/****** Object:  StoredProcedure [dbo].[USP_ICDRequestExceptionDetailGetLastRequest]    Script Date: 07-Jan-25 9:11:38 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_ICDRequestExceptionDetailGetLastRequest]
GO
/****** Object:  StoredProcedure [dbo].[USP_ICDPlazaInsertUpdate]    Script Date: 07-Jan-25 9:11:38 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_ICDPlazaInsertUpdate]
GO
/****** Object:  StoredProcedure [dbo].[USP_ICDPlazaGetById]    Script Date: 07-Jan-25 9:11:38 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_ICDPlazaGetById]
GO
/****** Object:  StoredProcedure [dbo].[USP_ICDPlazaGetAll]    Script Date: 07-Jan-25 9:11:38 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_ICDPlazaGetAll]
GO
/****** Object:  StoredProcedure [dbo].[USP_ICDNotificationInsert]    Script Date: 07-Jan-25 9:11:38 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_ICDNotificationInsert]
GO
/****** Object:  StoredProcedure [dbo].[USP_GetReportTransactionTrafficCount_bkp]    Script Date: 07-Jan-25 9:11:38 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_GetReportTransactionTrafficCount_bkp]
GO
/****** Object:  StoredProcedure [dbo].[USP_GetReportTransactionTrafficCount]    Script Date: 07-Jan-25 9:11:38 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_GetReportTransactionTrafficCount]
GO
/****** Object:  StoredProcedure [dbo].[USP_GetReportOverWeightTrafficRevenue]    Script Date: 07-Jan-25 9:11:38 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_GetReportOverWeightTrafficRevenue]
GO
/****** Object:  StoredProcedure [dbo].[USP_GetReportOverWeightTrafficCount]    Script Date: 07-Jan-25 9:11:38 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_GetReportOverWeightTrafficCount]
GO
/****** Object:  StoredProcedure [dbo].[USP_GetReportExemptCount]    Script Date: 07-Jan-25 9:11:38 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_GetReportExemptCount]
GO
/****** Object:  StoredProcedure [dbo].[USP_GetReportData]    Script Date: 07-Jan-25 9:11:38 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_GetReportData]
GO
/****** Object:  StoredProcedure [dbo].[USP_GetReportConsolidatedRevenue]    Script Date: 07-Jan-25 9:11:38 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_GetReportConsolidatedRevenue]
GO
/****** Object:  StoredProcedure [dbo].[USP_FloatTransactionsTypeGetAll]    Script Date: 07-Jan-25 9:11:38 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_FloatTransactionsTypeGetAll]
GO
/****** Object:  StoredProcedure [dbo].[USP_FloatProcessInsertUpdate]    Script Date: 07-Jan-25 9:11:38 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_FloatProcessInsertUpdate]
GO
/****** Object:  StoredProcedure [dbo].[USP_FloatProcessGetById]    Script Date: 07-Jan-25 9:11:38 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_FloatProcessGetById]
GO
/****** Object:  StoredProcedure [dbo].[USP_FloatProcessGetAll]    Script Date: 07-Jan-25 9:11:38 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_FloatProcessGetAll]
GO
/****** Object:  StoredProcedure [dbo].[USP_FloatProcessDenominationGetById]    Script Date: 07-Jan-25 9:11:38 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_FloatProcessDenominationGetById]
GO
/****** Object:  StoredProcedure [dbo].[USP_FasTagVehicleClassInsertUpdate]    Script Date: 07-Jan-25 9:11:38 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_FasTagVehicleClassInsertUpdate]
GO
/****** Object:  StoredProcedure [dbo].[USP_FasTagVehicleClassGetByIds]    Script Date: 07-Jan-25 9:11:38 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_FasTagVehicleClassGetByIds]
GO
/****** Object:  StoredProcedure [dbo].[USP_FasTagVehicleClassGetById]    Script Date: 07-Jan-25 9:11:38 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_FasTagVehicleClassGetById]
GO
/****** Object:  StoredProcedure [dbo].[USP_FasTagVehicleClassGetAll]    Script Date: 07-Jan-25 9:11:38 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_FasTagVehicleClassGetAll]
GO
/****** Object:  StoredProcedure [dbo].[USP_FasTagVehicleClassGetActive]    Script Date: 07-Jan-25 9:11:38 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_FasTagVehicleClassGetActive]
GO
/****** Object:  StoredProcedure [dbo].[USP_ExemptTypeUpdate]    Script Date: 07-Jan-25 9:11:38 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_ExemptTypeUpdate]
GO
/****** Object:  StoredProcedure [dbo].[USP_ExemptTypeMasterGetAll]    Script Date: 07-Jan-25 9:11:38 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_ExemptTypeMasterGetAll]
GO
/****** Object:  StoredProcedure [dbo].[USP_ExemptTypeMasterGetActive]    Script Date: 07-Jan-25 9:11:38 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_ExemptTypeMasterGetActive]
GO
/****** Object:  StoredProcedure [dbo].[USP_ErrorInfoInsert]    Script Date: 07-Jan-25 9:11:38 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_ErrorInfoInsert]
GO
/****** Object:  StoredProcedure [dbo].[USP_EquipmentTypeMasterGetAll]    Script Date: 07-Jan-25 9:11:38 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_EquipmentTypeMasterGetAll]
GO
/****** Object:  StoredProcedure [dbo].[USP_EquipmentTypeMasterGetActive]    Script Date: 07-Jan-25 9:11:38 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_EquipmentTypeMasterGetActive]
GO
/****** Object:  StoredProcedure [dbo].[USP_EquipmentDetailsInsertUpdate]    Script Date: 07-Jan-25 9:11:38 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_EquipmentDetailsInsertUpdate]
GO
/****** Object:  StoredProcedure [dbo].[USP_EquipmentDetailsGetByLaneId]    Script Date: 07-Jan-25 9:11:38 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_EquipmentDetailsGetByLaneId]
GO
/****** Object:  StoredProcedure [dbo].[USP_EquipmentDetailsGetById]    Script Date: 07-Jan-25 9:11:38 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_EquipmentDetailsGetById]
GO
/****** Object:  StoredProcedure [dbo].[USP_EquipmentDetailsGetAll]    Script Date: 07-Jan-25 9:11:38 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_EquipmentDetailsGetAll]
GO
/****** Object:  StoredProcedure [dbo].[USP_EquipmentDetailsGetActive]    Script Date: 07-Jan-25 9:11:38 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_EquipmentDetailsGetActive]
GO
/****** Object:  StoredProcedure [dbo].[USP_DenominationGetAll]    Script Date: 07-Jan-25 9:11:38 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_DenominationGetAll]
GO
/****** Object:  StoredProcedure [dbo].[USP_DenominationGetActive]    Script Date: 07-Jan-25 9:11:38 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_DenominationGetActive]
GO
/****** Object:  StoredProcedure [dbo].[USP_DataStatusMasterGetAll]    Script Date: 07-Jan-25 9:11:38 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_DataStatusMasterGetAll]
GO
/****** Object:  StoredProcedure [dbo].[USP_DashboardGetData]    Script Date: 07-Jan-25 9:11:38 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_DashboardGetData]
GO
/****** Object:  StoredProcedure [dbo].[USP_AvcTransactionInsert]    Script Date: 07-Jan-25 9:11:38 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_AvcTransactionInsert]
GO
/****** Object:  StoredProcedure [dbo].[USP_AvcAccuracyUnReviewed]    Script Date: 07-Jan-25 9:11:38 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_AvcAccuracyUnReviewed]
GO
/****** Object:  StoredProcedure [dbo].[USP_AvcAccuracyReviewedFilter]    Script Date: 07-Jan-25 9:11:38 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_AvcAccuracyReviewedFilter]
GO
/****** Object:  StoredProcedure [dbo].[USP_AvcAccuracyReviewed]    Script Date: 07-Jan-25 9:11:38 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_AvcAccuracyReviewed]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_UserActivityLog]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_UserActivityLog] DROP CONSTRAINT IF EXISTS [DF__tbl_UserA__Logou__5A9A4855]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_UserActivityLog]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_UserActivityLog] DROP CONSTRAINT IF EXISTS [DF__tbl_UserA__Login__59A6241C]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_UserActivityLog]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_UserActivityLog] DROP CONSTRAINT IF EXISTS [DF__tbl_UserA__Activ__58B1FFE3]
GO
/****** Object:  Table [dbo].[tbl_UserActivityLog]    Script Date: 07-Jan-25 9:11:38 PM ******/
DROP TABLE IF EXISTS [dbo].[tbl_UserActivityLog]
GO
/****** Object:  Table [dbo].[tbl_UserActivityLog]    Script Date: 07-Jan-25 9:11:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_UserActivityLog](
	[UserActivityId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [bigint] NULL,
	[ActivityType] [bit] NULL,
	[LocalIPAddress] [nvarchar](50) NULL,
	[IPAddress] [nvarchar](50) NULL,
	[LoginDateTime] [datetime] NULL,
	[LogoutDateTime] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserActivityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tbl_UserActivityLog] ADD  DEFAULT ((1)) FOR [ActivityType]
GO
ALTER TABLE [dbo].[tbl_UserActivityLog] ADD  DEFAULT (getdate()) FOR [LoginDateTime]
GO
ALTER TABLE [dbo].[tbl_UserActivityLog] ADD  DEFAULT (getdate()) FOR [LogoutDateTime]
GO
/****** Object:  StoredProcedure [dbo].[USP_AvcAccuracyReviewed]    Script Date: 07-Jan-25 9:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_AvcAccuracyReviewed]
@Filter varchar(4000)    
           
AS BEGIN
	SET NOCOUNT ON 

	CREATE TABLE #tempAvcData (TotalCount int , VehicleClassName varchar(50))
	CREATE TABLE #tempAvcCountTable(VehicleClassId int,VehicleClassName varchar(100))
	CREATE TABLE #tempAvcPercentageTable(VehicleClassId int,VehicleClassName varchar(100))
	CREATE TABLE #tempClassDetails(RowNumber smallint,VehicleClassId smallint,VehicleClassName varchar(50))
	
	INSERT INTO #tempClassDetails(RowNumber,VehicleClassId,VehicleClassName) VALUES(0,0,'No Class')
	INSERT INTO #tempClassDetails(VehicleClassId,VehicleClassName,RowNumber)
	Select SystemVehicleSubClassId,FasTagVehicleClassName,ROW_NUMBER() OVER(ORDER BY SystemVehicleSubClassId asc)AS Row          
	FROM tbl_SystemVehicleSubClass S 
	INNER JOIN tbl_FasTagVehicleClass F ON S.SystemVehicleSubClassId = F.FasTagVehicleClassId 
	ORDER BY SystemVehicleSubClassId asc  

	
	DECLARE @count int=0   
	DECLARE @Index  int=0
	DECLARE @AvcClassId INT
	DECLARE @ColumnName varchar(max)
	DECLARE @SumColumnName varchar(max)
	DECLARE @SumofColumnName varchar(max)
	DECLARE @PerColumnName varchar(max)
	DECLARE @CommaSepratedColumnName varchar(max)
	DECLARE @ClassNameWithPercentage VARCHAR(max)
	
	DECLARE @sqlQuery AS VARCHAR(MAX)
	
	select @count=count(1) from #tempClassDetails      
	
	WHILE @Index < @count  
	BEGIN
		SELECT @ColumnName = VehicleClassName FROM #tempClassDetails WHERE RowNumber = @Index;
		EXEC('ALTER TABLE #tempAvcCountTable ADD [' + @ColumnName + '] FLOAT(2)');
		EXEC('ALTER TABLE #tempAvcPercentageTable ADD [' + @ColumnName + '] FLOAT(2)');
		
		SET @SumColumnName = ISNULL(@SumColumnName, '') + ',sum([' + @ColumnName + ']) ';
		SET @PerColumnName = ISNULL(@PerColumnName, '') + ',isnull(cast(NULLIF(cast([' + @ColumnName + '] as decimal(10,2)),0) / NULLIF(cast(Total as decimal(10,2)),0) * 100 as decimal(10,2)), 0) ';
		SET @CommaSepratedColumnName = ISNULL(@CommaSepratedColumnName, '') + ',[' + @ColumnName + '] ';
		SET @SumofColumnName = ISNULL(@SumofColumnName, '') + '+[' + @ColumnName + '] ';
		SET @Index += 1;
	END
	Set @CommaSepratedColumnName=substring(@CommaSepratedColumnName,2,len(@CommaSepratedColumnName))
	Set @SumColumnName=substring(@SumColumnName,2,len(@SumColumnName))
	set @SumofColumnName =  substring(@SumofColumnName,2,len(@SumofColumnName))
	SET @PerColumnName = Substring(@PerColumnName, 2, Len(@PerColumnName))
	
	ALTER TABLE #tempAvcCountTable ADD Total int DEFAULT 0
	ALTER TABLE #tempAvcPercentageTable ADD Total decimal(10,2) DEFAULT 0
	--[Accurecy(%)]

	DECLARE @ClassName varchar(max)
	SET @Index=0
	WHILE(@Index < @count )
      BEGIN
		SELECT 
		@AvcClassId = VehicleClassId,
		@ColumnName = '[' + VehicleClassName + ']',
		@ClassName = '''' + VehicleClassName + '''',
		@ClassNameWithPercentage = '''' + VehicleClassName + '%''' 
		FROM   #tempClassDetails(nolock)
		WHERE  RowNumber = @Index


		TRUNCATE TABLE #tempAvcData
		SET @sqlQuery = ' Insert INTO #tempAvcData    
		Select isnull(d.TotalCount,0) TotalCount,c.VehicleClassName
		from #tempClassDetails c (nolock)
		left join           
		(
			Select VehicleClassName, sum(TotalCount)TotalCount from 
			(
				Select count(1) TotalCount,b.VehicleClassName from tbl_LaneTransaction L(nolock)       
				inner join #tempClassDetails b(nolock)  
				on b.VehicleClassId= case when isnull(L.ReviewedSubClassId,0)=0 then L.VehicleSubClassId else L.ReviewedSubClassId END 
				AND 
				isnull(L.VehicleAvcClassId,0)='+cast(@AvcClassId as varchar(20))+' AND L.ReviewedStatus=1 
				'+ @Filter +'
				group by b.VehicleClassName
			 )y  
			 group by VehicleClassName
		 )d     
		on c.VehicleClassName = d.VehicleClassName'

		exec(@sqlQuery)



		exec ('insert into #tempAvcCountTable (VehicleClassId,VehicleClassName,' + @CommaSepratedColumnName+') 
		SELECT  '+@AvcClassId+','+@ClassName+',' + @CommaSepratedColumnName+' FROM (SELECT TotalCount, VehicleClassName FROM #tempavcdata) #tempavcdata 
		PIVOT (MAX(TotalCount) FOR VehicleClassName IN (' + @CommaSepratedColumnName + ')) Result;')
		
		SET @sqlQuery = 'UPDATE #tempAvcCountTable SET Total = ROUND(' + @SumofColumnName + ', 1) WHERE VehicleClassId = ' + CAST(@AvcClassId AS NVARCHAR(10));
		exec(@sqlQuery) 
		SET @sqlQuery ='Insert into #tempAvcPercentageTable(VehicleClassId,VehicleClassName,'+@CommaSepratedColumnName+')
		Select '+cast(@AvcClassId as varchar(20))+','+@ClassName+','+@PerColumnName+'  
		from  #tempAvcCountTable(nolock) where VehicleClassName ='+@ClassName+''
		exec(@sqlQuery) 
		
		set @sqlQuery='update #tempAvcPercentageTable set Total = (Select '+@ColumnName+' from #tempAvcPercentageTable(nolock) 
		where VehicleClassId = '+cast(@AvcClassId as NVARCHAR(10))+' and VehicleClassName ='+@ClassName+') 
		where VehicleClassName='+@ClassName+''         
		exec(@sqlQuery) 
		SET @Index+=1
	  END

	  set @sqlQuery =         
		'Insert into #tempAvcCountTable(VehicleClassId,VehicleClassName,'+@CommaSepratedColumnName+')         
		Select -1,''Total'' as Total,'+@SumColumnName+'  from  #tempAvcCountTable(nolock) where Right(VehicleClassName,1) !=''%'''        
		exec(@sqlQuery)  

		SET @sqlQuery = 'UPDATE #tempAvcCountTable SET Total = ROUND(' + @SumofColumnName + ', 1) WHERE VehicleClassId = -1';
		exec(@sqlQuery) 

		SET @sqlQuery =         
		'Insert into #tempAvcPercentageTable(VehicleClassId,VehicleClassName,'+@CommaSepratedColumnName+')         
		Select -1,''Total'' as Total,'+@PerColumnName+'  from  #tempAvcCountTable(nolock) where VehicleClassName=''Total'''        
		exec(@sqlQuery) 
		

		UPDATE #tempAvcPercentageTable SET Total = 
		(
			SELECT ISNULL(ROUND(CAST(SUM(Total) AS FLOAT) / NULLIF(CAST(COUNT(1) AS FLOAT), 0), 2), 0) AS AverageTotal 
			FROM #tempAvcPercentageTable WHERE VehicleClassId <> -1
		) WHERE VehicleClassId = -1
	  
	  EXEC('SELECT VehicleClassName AS [Vehicle Class],'+@CommaSepratedColumnName+',Total AS [Total / Accuracy(%)] FROM #tempAvcCountTable')
	  EXEC('SELECT VehicleClassName AS [Vehicle Class],'+@CommaSepratedColumnName+',Total AS [Total / Accuracy(%)] FROM #tempAvcPercentageTable')
END
--GO
--EXEC USP_AvcAccuracyReviewed
--@Filter='WHERE CONVERT(DATE,L.TransactionDateTime) >= CONVERT(DATE,''27-Aug-2024 13:52:14'') AND CONVERT(DATE,L.TransactionDateTime) <= CONVERT(DATE,''06-Sep-2024 13:52:14'')'
GO
/****** Object:  StoredProcedure [dbo].[USP_AvcAccuracyReviewedFilter]    Script Date: 07-Jan-25 9:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_AvcAccuracyReviewedFilter]
@PlazaId smallint=0,    
@StartDateTime Datetime,    
@EndDateTime Datetime,    
@ClassId varchar(4000),    
@Filter varchar(4000),    
@SessionId varchar(20),    
@LaneType varchar(20)    
           
As                
Begin        
if(@Filter ='')    
begin    
 set @Filter = 'Where 1=1'    
end    
     
begin try        
DROP TABLE #tempavcclass        
DROP TABLE ##tempavcTable             
DROP TABLE ##tempavcTablepercentage         
Drop table #tempavcdata        
drop table ##tempmatchavc       
end try        
begin catch        
end catch        
 -----------------------------              
  --Variables declared for making query dynamic fileld              
  -----------------------------              
declare @Index int = 0              
declare @count int=0              
declare @ClasseSchema varchar(max) =''              
declare @sql varchar(max)=''              
declare @sqlMain varchar(max)=''              
declare @sqlMain1 varchar(max)=''              
declare @sqlTable varchar(max)=''              
declare @AvcCount int = 0              
declare @TcCount int = 0              
declare @ClasseNamePlus varchar(max) =''              
declare @ClasseNameSumForLastRowTotal varchar(max) =''              
declare @ClasseNameSumForLastRowPercenage varchar(max) =''              
declare @ClasseNameSumForPercenage varchar(max) =''              
declare @ClasseName varchar(max) =''              
declare @ValidationModeCondition varchar(max)=''              
Declare @intcount int = 0, @intclassid int = 0;              
Declare @inttotalcount int;              
declare @sqq varchar(max)              
--------------------------------              
-- temp table alterd for active class              
--------------------------------           
IF OBJECT_ID('tempdb..##tempaTCavcclass') IS NOT NULL              
DROP TABLE ##tempaTCavcclass    
create table  ##tempaTCavcclass (Classid int,classname varchar(40))      
insert into ##tempaTCavcclass  values (0,'No Class')    
insert into ##tempaTCavcclass     
select classid,rtrim(ltrim(classname)) from tbl_TCVehicleClass with(nolock) where DataStatus=1 and ParantId!=0    
       
IF OBJECT_ID('tempdb..#tempavcclass') IS NOT NULL              
DROP TABLE #tempavcclass    
Select Classid,classname description,ROW_NUMBER() OVER(ORDER BY Classid asc) AS Row          
into #tempavcclass          
from ##tempaTCavcclass  order by classid asc           
        
            
           
select @count =count(1)   from #tempavcclass              
SET @ClasseSchema = '';              
----------------------------------              
-- While loop to add fileds to dclared valiable for making dynamic fileds              
-----------------------          
-----------            
          
declare @classwithcomma varchar(max) =''           
declare @classwithplus varchar(max)=''          
declare @classwithpercentage varchar(max)=''        
declare @ClassName varchar(100)        
declare @sumclassname varchar(max)=''        
while @Index <@count              
begin           
Select  @ClassName =    description from #tempavcclass(nolock) where row = @Index+1        
set @ClasseSchema=@ClasseSchema +',['+(select description from  #tempavcclass where row = @Index+1 )+'] float(2) '          
set @sumclassname = @sumclassname +  ',sum(['+(select description from  #tempavcclass where row = @Index+1 )+']) '          
set @classwithpercentage = @classwithpercentage    +',isnull(cast(NULLIF(cast(['+@ClassName+'] as decimal(10,2)),0)/NULLIF(cast(Total as decimal(10,2)),0)*100 as decimal(10,2)),0) '          
set @classwithcomma = @classwithcomma    +',['+(select description from  #tempavcclass where row = @Index+1 )+']  '          
set @classwithplus = @classwithplus +'+['+(select description from  #tempavcclass where row = @Index+1 )+']  '          
set @ClasseNamePlus=@ClasseNamePlus +'+['+(select description from  #tempavcclass where row = @Index+1 )+']  '        
set @ClasseNameSumForLastRowTotal=@ClasseNameSumForLastRowTotal+',isnull(sum(['+(select description from  #tempavcclass where row = @Index+1 )+']),0) '              
set @ClasseNameSumForLastRowPercenage=@ClasseNameSumForLastRowPercenage+',isnull(cast((isnull(sum(['+(select description from  #tempavcclass where row = @Index+1 )+']),1)*100.00)/(case when sum(Total)=0 then 1 else sum(Total) end ) as decimal(10,2)),0) '
   
   
     
      
set @Index = @Index+1              
end            
           
Set  @classwithcomma=substring(@classwithcomma,2,len(@classwithcomma))           
set @classwithplus =  substring(@classwithplus,2,len(@classwithplus))        
set @classwithpercentage = substring(@classwithpercentage,2,len(@classwithpercentage))        
set @sumclassname =  substring(@sumclassname,2,len(@sumclassname))        
        
        
            
IF OBJECT_ID('tempdb..##tempavcTable') IS NOT NULL              
    DROP TABLE ##tempavcTable        
if  OBJECT_ID('tempdb..##tempmatchavc') IS NOT NULL              
    DROP TABLE ##tempmatchavc       
             
IF OBJECT_ID('tempdb..##tempavcTablepercentage') IS NOT NULL              
    DROP TABLE ##tempavcTablepercentage              
set @sqlTable='create table ##tempavcTable               
(                            
ID int,ClassName varchar(100)'+@ClasseSchema+' ,Total int,[%age] decimal(10,2)              
) '    
                
--Print @ClasseSchema;              
          
          
--------------------------------------              
-- removing ',' from the last index of every declared variable              
--------------------------------------              
set @ClasseSchema = substring(@ClasseSchema,2,len(@ClasseSchema))              
set @ClasseNamePlus = substring(@ClasseNamePlus,2,len(@ClasseNamePlus))              
              
set @ClasseNameSumForLastRowTotal = substring(@ClasseNameSumForLastRowTotal,2,len(@ClasseNameSumForLastRowTotal))              
set @ClasseNameSumForLastRowPercenage = substring(@ClasseNameSumForLastRowPercenage,2,len(@ClasseNameSumForLastRowPercenage))              
--Print @ClasseSchema;              
--Print @ClasseNamePlus;              
--Print @ClasseNameSumForLastRowTotal;              
--Print @ClasseNameSumForLastRowPercenage;              
--print 'Complete'              
--print @sqlTable              
exec (@sqlTable)              
Declare @Acclassid int          
DECLARE @Category AS VARCHAR(MAX)          
Declare @ClassNameWithPercentage varchar(500)        
Declare @ClassNameAcc varchar(500)        
Declare @MatchCount varchar(max)=''    
Declare @SqlData varchar(max)=''    
print @count      
--set @count =0       
  IF OBJECT_ID('tempdb..#tempavcdata') IS NOT NULL                
    DROP TABLE #tempavcdata          
 Create Table #tempavcdata (TotalCount int , ClassName varchar(50))    
     
while(@AvcCount<@count)              
begin              
Select @Acclassid=Classid,@ClassNameAcc ='['+description+']', @ClassName = ''''+description+'''',@ClassNameWithPercentage =''''+description+'%'''  from #tempavcclass(nolock) where Row=@AvcCount+1          
print @ClassName        
      
if (@LaneType=0)    
begin    
set @SqlData ='    
truncate table #tempavcdata    
  Insert into #tempavcdata    
 Select isnull(d.TotalCount,0) TotalCount,c.ClassName  classname          
 --into #tempavcdata           
 from           
  ##tempaTCavcclass c (nolock)             
left join           
(     
         
Select ClassName, sum(TotalCount)TotalCount from     
(     
Select count(1) TotalCount,b.ClassName  ClassName           
         
 from tbl_lanetransactionentry a(nolock)       
 left join tbl_LaneTransactionReviewStatus f (Nolock)    
 on a.Plazatransactionid=f.TransactionId    
inner join ##tempaTCavcclass b(nolock)  on b.ClassID = case when isnull(f.ReveiwedParentSubClassId,0)=0 then a.VehicleSubClassId else f.ReveiwedParentSubClassId end    
          
 '+ @Filter +' and            
 isnull(AvcClassId,0)='+cast(@Acclassid as varchar(2))+'    
 and       
             
           
 ( a.transactiondatetime between '''+cast(@StartDateTime as varchar(50))+''' and '''+cast(@EndDateTime as varchar(50))+''')               
            
 and Transactionstatus=1     
 and lanetransactionid!=0            
 and a.Plazaid ='+cast(@PlazaId as varchar(2))+'    
          
group by b.ClassName       
union all     
Select count(1) TotalCount,b.classname ClassName    
from tbl_lanetransactionexit a(nolock)      
left join tbl_LaneTransactionReviewStatus f (Nolock)     
 on a.Plazatransactionid=f.TransactionId    
inner join ##tempaTCavcclass b(nolock)  on b.ClassID = case when isnull(f.ReveiwedParentSubClassId,0)=0 then a.VehicleSubClassId else f.ReveiwedParentSubClassId end    
           
 '+ @Filter +' and             
 isnull(AvcClassId,0)='+cast(@Acclassid as varchar(2))+'       
 and         
            
     
 ( a.transactiondatetime between '''+cast(@StartDateTime as varchar(50))+''' and '''+cast(@EndDateTime as varchar(50))+''')          
             
 and Transactionstatus=1    
 and lanetransactionid!=0     
 and a.Plazaid ='+cast(@PlazaId as varchar(2))+'     
 group by b.ClassName          
)y    
group by ClassName    
     
)     
d     
on c.ClassName = d.ClassName            
'    
--print @SqlData    
exec(@sqldata)    
end    
if (@LaneType=1)    
begin    
     
  set @SqlData ='    
  truncate table #tempavcdata    
  Insert into #tempavcdata    
 Select isnull(d.TotalCount,0) TotalCount,c.ClassName  classname          
 --into #tempavcdata           
     
     
 from           
  ##tempaTCavcclass c (nolock)             
left join           
(     
         
Select ClassName, sum(TotalCount)TotalCount from     
(     
Select count(1) TotalCount,b.ClassName  ClassName           
         
 from tbl_lanetransactionentry a(nolock)       
 left join tbl_LaneTransactionReviewStatus f (Nolock)    
 on a.PlazaTransactionid=f.TransactionId    
inner join ##tempaTCavcclass b(nolock)  on b.ClassID =case when isnull(f.ReveiwedParentSubClassId,0)=0 then a.VehicleSubClassId else f.ReveiwedParentSubClassId end    
           
'+ @Filter +' and            
isnull(AvcClassId,0)='+cast(@Acclassid as varchar(2))+'          
 and      
             
           
( a.transactiondatetime between '''+cast(@StartDateTime as varchar(50))+''' and '''+cast(@EndDateTime as varchar(50))+''')               
            
 and Transactionstatus=1     
 and lanetransactionid!=0            
  and a.Plazaid ='+cast(@PlazaId as varchar(2))+'         
          
group by b.ClassName       
        
)y    
group by ClassName    
     
)     
d     
on c.ClassName = d.ClassName             
'    
--print @SqlData    
exec(@sqldata)    
end     
if (@LaneType=2)    
begin    
 --IF OBJECT_ID('tempdb..#tempavcdata') IS NOT NULL              
 --   DROP TABLE #tempavcdata    
 set @SqlData ='    
 truncate table #tempavcdata    
  Insert into #tempavcdata    
 Select isnull(d.TotalCount,0) TotalCount,c.ClassName  classname          
 --into #tempavcdata           
 from           
  ##tempaTCavcclass c (nolock)             
left join           
(     
         
Select ClassName, sum(TotalCount)TotalCount from     
(     
Select count(1) TotalCount,b.ClassName  ClassName           
         
 from tbl_LaneTransactionExit a(nolock)       
 left join tbl_LaneTransactionReviewStatus f (Nolock)    
 on a.plazatransactionid=f.TransactionId    
inner join ##tempaTCavcclass b(nolock)  on b.ClassID =case when isnull(f.ReveiwedParentSubClassId,0)=0 then a.VehicleSubClassId else f.ReveiwedParentSubClassId end    
     
           
'+ @Filter +' and            
isnull(AvcClassId,0)='+cast(@Acclassid as varchar(2))+'          
 and  b.    
             
           
( a.transactiondatetime between '''+cast(@StartDateTime as varchar(50))+''' and '''+cast(@EndDateTime as varchar(50))+''')               
            
 and Transactionstatus=1     
 and lanetransactionid!=0            
 and a.Plazaid ='+cast(@PlazaId as varchar(2))+'           
          
group by b.ClassName       
        
)y    
group by ClassName    
     
)     
d     
on c.ClassName = d.ClassName          
w      
'    
--print @SqlData    
exec(@sqldata)    
end     
      
 IF OBJECT_ID('tempdb..##tempone') IS NOT NULL              
    DROP TABLE ##tempone           
          
SELECT @Category =           
    COALESCE(@Category + '], [', '') + CAST(ClassName AS VARCHAR(20))           
    FROM (SELECT DISTINCT ClassName FROM #tempavcdata) Books          
 DECLARE @DynamicPIVOT AS VARCHAR(MAX)          
 set @Category=@classwithcomma          
          
SELECT @DynamicPIVOT = 'SELECT  ' + @Category+ +          
' into ##tempone FROM (          
 SELECT TotalCount, ClassName FROM #tempavcdata          
) #tempavcdata          
PIVOT (          
    MAX(TotalCount) FOR ClassName IN (' + +@Category + ')          
) Result;'      
--select * from #tempavcdata    
--select * from #tempavcclass    
      
print @DynamicPIVOT          
EXEC (@DynamicPIVOT)          
          
set @sql=          
'Insert into ##tempavcTable  (ID,ClassName,'+@classwithcomma+')          
Select '+cast(@AvcCount + 1 as varchar(2))+','+@ClassName+'  ,'+@classwithcomma+'  from  ##tempone(nolock)'          
exec(@sql)          
set @sql='          
update ##tempavcTable set Total = '+@classwithplus+' where ID = '+cast(@AvcCount+1 as varchar(2))+''          
exec(@sql)           
        
        
set @sql =         
'Insert into ##tempavcTable(ID,ClassName,'+@classwithcomma+')         
Select '+cast(@AvcCount + 1 as varchar(2))+','+@ClassNameWithPercentage+'  ,'+@classwithpercentage+'  from  ##tempavcTable(nolock) where ClassName ='+@ClassName+'        
'        
print @sql        
exec(@sql)        
        
set @sql='          
update ##tempavcTable set Total = Round('+@classwithplus+',1) where ID = '+cast(@AvcCount+1 as varchar(2))+''          
exec(@sql)           
        
set @sql='          
update ##tempavcTable set [%age] = (Select '+@ClassNameAcc+' from ##tempavcTable(nolock)    where ID = '+cast(@AvcCount+1 as varchar(2))+' and ClassName ='+@ClassNameWithPercentage+')        
 where ClassName='''+replace(replace(@ClassNameAcc,'[',''),']','')+''''         
print @sql        
exec(@sql)        
        
set @MatchCount =@MatchCount + '+(Select '+@ClassNameAcc+' from ##tempavcTable(nolock)  where  ClassName='''+replace(replace(@ClassNameAcc,'[',''),']','')+''')'       
      
set @AvcCount=@AvcCount+1          
end          
print @sumclassname        
        
        
set @sql =         
'Insert into ##tempavcTable(ID,ClassName,'+@classwithcomma+')         
Select '+cast(@AvcCount + 1 as varchar(2))+',''Total'' as Total,'+@sumclassname+'  from  ##tempavcTable(nolock) where Right(ClassName,1) !=''%'''        
print(@sql)        
exec(@sql)        
set @AvcCount = @AvcCount+1        
        
--set @sql =         
--'Insert into ##tempavcTable(ID,ClassName,'+@classwithcomma+')         
--Select '+cast(@AvcCount + 1 as varchar(2))+',''%age'' as Total,'+@sumclassname+'  from  ##tempavcTable(nolock) where Right(ClassName,1) =''%'''        
--print(@sql)        
--exec(@sql)        
        
        
        
        
        
Update ##tempavcTable set Total = (Select Sum(Total) from ##tempavcTable (nolock) where Right(ClassName,1) !='%' and ClassName not in('Total','%age'))        
where ClassName = 'Total'        
        
set @sql =         
'Insert into ##tempavcTable(ID,ClassName,'+@classwithcomma+')         
Select '+cast(@AvcCount + 1 as varchar(2))+',''%age'' as Total  ,'+@classwithpercentage+'  from  ##tempavcTable(nolock) where ClassName =''Total''        
'        
print @sql        
exec(@sql)        
        
Update ##tempavcTable set Total = (Select Sum(Total) from ##tempavcTable (nolock) where Right(ClassName,1) !='%' and ClassName not in('Total','%age'))        
where ClassName = 'Total'        
        
      
        
set @sql='          
update ##tempavcTable set Total = Round('+@classwithplus+',1) where ClassName = ''%age'''          
exec(@sql)        
   
set @MatchCount ='Select * into ##tempmatchavc  from(Select  ' +  substring(@MatchCount,2,len(@MatchCount))+' As ''Value'')X'      
exec(@MatchCount)      
print @MatchCount        
      
Declare @TotalTraffic int,@MatchValue int      
Select @TotalTraffic=Total from ##tempavcTable(nolock) where ClassName ='Total'      
Select @MatchValue = Value from  ##tempmatchavc(nolock)      
--set @classwithpercentage = @classwithpercentage    +',isnull(cast(NULLIF(cast(['+@ClassName+'] as decimal(10,2)),0)/NULLIF(cast(Total as decimal(10,2)),0)*100 as decimal(10,2)),0) '        
update ##tempavcTable set [%age] = cast(cast(@MatchValue as decimal(10,2))/nullif(cast(@TotalTraffic as decimal(10,2)),0)*100 as decimal(10,2)) where ClassName ='Total'      
      
         
      
    update ##tempavcTable set Total =null where Right(ClassName,1) ='%'     
--update ##tempavcTable set [%age] = '' where Right(ClassName,1) ='%'        
Select * from ##tempavcTable(nolock)  where substring(ClassName,len(ClassName),1)!='%'  order by id asc         
        
      
      
      
        
        
 end           
--update ##tempavcTable set [%age] = (Select [NoClass] from ##tempavcTable(nolock)    where ID = 1 and ClassName ='NoClass%')        
-- where ClassName='NoClass'        
        
--  Select * into ##tempmatchavc  from      
--  (      
--  Select        
--     (Select [NoClass] from ##tempavcTable(nolock)  where  ClassName='NoClass')+(Select [Car] from ##tempavcTable(nolock)  where  ClassName='Car')+(Select [Lcv] from ##tempavcTable(nolock)  where  ClassName='Lcv')+(Select [Bus/Truck] from     
--##tempavcTable(nolock)  where  ClassName='Bus/Truck')+(Select [Truck(3-Axle)] from ##tempavcTable(nolock)  where  ClassName='Truck(3-Axle)')+(Select [M-Axle(4 to 6 axle)] from ##tempavcTable(nolock)  where  ClassName='M-Axle(4 to 6 axle)')+(Select [OSV 
  
     
--(More than 6 Ax    
--le)] from ##tempavcTable(nolock)  where  ClassName='OSV (More than 6 Axle)') As 'Value'      
--)X      
         
      
--[Reporting_SP].[Reporting_AVCAccuracyReportWeb]  '2021-12-13 00:00:00.000','2021-12-13 00:00:00.000',0,1,'Before Validation',0,0,1 
GO
/****** Object:  StoredProcedure [dbo].[USP_AvcAccuracyUnReviewed]    Script Date: 07-Jan-25 9:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_AvcAccuracyUnReviewed]
@Filter varchar(4000)    
           
AS BEGIN
	SET NOCOUNT ON 

	CREATE TABLE #tempAvcData (TotalCount int , VehicleClassName varchar(50))
	CREATE TABLE #tempAvcCountTable(VehicleClassId int,VehicleClassName varchar(100))
	CREATE TABLE #tempAvcPercentageTable(VehicleClassId int,VehicleClassName varchar(100))
	CREATE TABLE #tempClassDetails(RowNumber smallint,VehicleClassId smallint,VehicleClassName varchar(50))
	
	INSERT INTO #tempClassDetails(RowNumber,VehicleClassId,VehicleClassName) VALUES(0,0,'No Class')
	INSERT INTO #tempClassDetails(VehicleClassId,VehicleClassName,RowNumber)
	Select SystemVehicleSubClassId,FasTagVehicleClassName,ROW_NUMBER() OVER(ORDER BY SystemVehicleSubClassId asc)AS Row          
	FROM tbl_SystemVehicleSubClass S 
	INNER JOIN tbl_FasTagVehicleClass F ON S.SystemVehicleSubClassId = F.FasTagVehicleClassId 
	ORDER BY SystemVehicleSubClassId asc  

	
	DECLARE @count int=0   
	DECLARE @Index  int=0
	DECLARE @AvcClassId INT
	DECLARE @ColumnName varchar(max)
	DECLARE @SumColumnName varchar(max)
	DECLARE @SumofColumnName varchar(max)
	DECLARE @PerColumnName varchar(max)
	DECLARE @CommaSepratedColumnName varchar(max)
	DECLARE @ClassNameWithPercentage VARCHAR(max)
	
	DECLARE @sqlQuery AS VARCHAR(MAX)
	
	select @count=count(1) from #tempClassDetails      
	
	WHILE @Index < @count  
	BEGIN
		SELECT @ColumnName = VehicleClassName FROM #tempClassDetails WHERE RowNumber = @Index;
		EXEC('ALTER TABLE #tempAvcCountTable ADD [' + @ColumnName + '] FLOAT(2)');
		EXEC('ALTER TABLE #tempAvcPercentageTable ADD [' + @ColumnName + '] FLOAT(2)');
		
		SET @SumColumnName = ISNULL(@SumColumnName, '') + ',sum([' + @ColumnName + ']) ';
		SET @PerColumnName = ISNULL(@PerColumnName, '') + ',isnull(cast(NULLIF(cast([' + @ColumnName + '] as decimal(10,2)),0) / NULLIF(cast(Total as decimal(10,2)),0) * 100 as decimal(10,2)), 0) ';
		SET @CommaSepratedColumnName = ISNULL(@CommaSepratedColumnName, '') + ',[' + @ColumnName + '] ';
		SET @SumofColumnName = ISNULL(@SumofColumnName, '') + '+[' + @ColumnName + '] ';
		SET @Index += 1;
	END
	Set @CommaSepratedColumnName=substring(@CommaSepratedColumnName,2,len(@CommaSepratedColumnName))
	Set @SumColumnName=substring(@SumColumnName,2,len(@SumColumnName))
	set @SumofColumnName =  substring(@SumofColumnName,2,len(@SumofColumnName))
	SET @PerColumnName = Substring(@PerColumnName, 2, Len(@PerColumnName))
	
	ALTER TABLE #tempAvcCountTable ADD Total int DEFAULT 0
	ALTER TABLE #tempAvcPercentageTable ADD Total decimal(10,2) DEFAULT 0
	--[Accurecy(%)]

	DECLARE @ClassName varchar(max)
	SET @Index=0
	WHILE(@Index < @count )
      BEGIN
		SELECT 
		@AvcClassId = VehicleClassId,
		@ColumnName = '[' + VehicleClassName + ']',
		@ClassName = '''' + VehicleClassName + '''',
		@ClassNameWithPercentage = '''' + VehicleClassName + '%''' 
		FROM   #tempClassDetails(nolock)
		WHERE  RowNumber = @Index

		TRUNCATE TABLE #tempAvcData
		EXEC('Insert INTO #tempAvcData    
		Select isnull(d.TotalCount,0) TotalCount,c.VehicleClassName
		from #tempClassDetails c (nolock)
		left join           
		(
			Select VehicleClassName, sum(TotalCount)TotalCount from 
			(
				Select count(1) TotalCount,b.VehicleClassName from tbl_LaneTransaction L(nolock)       
				inner join #tempClassDetails b(nolock)  on b.VehicleClassId = L.VehicleSubClassId AND 
				isnull(L.VehicleAvcClassId,0)='+@AvcClassId+' AND L.Transactionstatus=1 
				'+ @Filter +'
				group by b.VehicleClassName
			 )y  
			 group by VehicleClassName
		 )d     
		on c.VehicleClassName = d.VehicleClassName') 
		exec ('insert into #tempAvcCountTable (VehicleClassId,VehicleClassName,' + @CommaSepratedColumnName+') 
		SELECT  '+@AvcClassId+','+@ClassName+',' + @CommaSepratedColumnName+' FROM (SELECT TotalCount, VehicleClassName FROM #tempavcdata) #tempavcdata 
		PIVOT (MAX(TotalCount) FOR VehicleClassName IN (' + @CommaSepratedColumnName + ')) Result;')
		
		SET @sqlQuery = 'UPDATE #tempAvcCountTable SET Total = ROUND(' + @SumofColumnName + ', 1) WHERE VehicleClassId = ' + CAST(@AvcClassId AS NVARCHAR(10));
		exec(@sqlQuery) 
		SET @sqlQuery ='Insert into #tempAvcPercentageTable(VehicleClassId,VehicleClassName,'+@CommaSepratedColumnName+')
		Select '+cast(@AvcClassId as varchar(20))+','+@ClassName+','+@PerColumnName+'  
		from  #tempAvcCountTable(nolock) where VehicleClassName ='+@ClassName+''
		exec(@sqlQuery) 
		
		set @sqlQuery='update #tempAvcPercentageTable set Total = (Select '+@ColumnName+' from #tempAvcPercentageTable(nolock) 
		where VehicleClassId = '+cast(@AvcClassId as NVARCHAR(10))+' and VehicleClassName ='+@ClassName+') 
		where VehicleClassName='+@ClassName+''         
		exec(@sqlQuery) 
		SET @Index+=1
	  END

	  set @sqlQuery =         
		'Insert into #tempAvcCountTable(VehicleClassId,VehicleClassName,'+@CommaSepratedColumnName+')         
		Select -1,''Total'' as Total,'+@SumColumnName+'  from  #tempAvcCountTable(nolock) where Right(VehicleClassName,1) !=''%'''        
		exec(@sqlQuery)  

		SET @sqlQuery = 'UPDATE #tempAvcCountTable SET Total = ROUND(' + @SumofColumnName + ', 1) WHERE VehicleClassId = -1';
		exec(@sqlQuery) 

		SET @sqlQuery =         
		'Insert into #tempAvcPercentageTable(VehicleClassId,VehicleClassName,'+@CommaSepratedColumnName+')         
		Select -1,''Total'' as Total,'+@PerColumnName+'  from  #tempAvcCountTable(nolock) where VehicleClassName=''Total'''        
		exec(@sqlQuery) 
		

		UPDATE #tempAvcPercentageTable SET Total = 
		(
			SELECT ISNULL(ROUND(CAST(SUM(Total) AS FLOAT) / NULLIF(CAST(COUNT(1) AS FLOAT), 0), 2), 0) AS AverageTotal 
			FROM #tempAvcPercentageTable WHERE VehicleClassId <> -1
		) WHERE VehicleClassId = -1
	  
	  EXEC('SELECT VehicleClassName AS [Vehicle Class],'+@CommaSepratedColumnName+',Total AS [Total / Accuracy(%)] FROM #tempAvcCountTable')
	  EXEC('SELECT VehicleClassName AS [Vehicle Class],'+@CommaSepratedColumnName+',Total AS [Total / Accuracy(%)] FROM #tempAvcPercentageTable')
END

GO
/****** Object:  StoredProcedure [dbo].[USP_AvcTransactionInsert]    Script Date: 07-Jan-25 9:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_AvcTransactionInsert]
@LaneId smallint,
@TransactionCount bigint,
@AvcSensorClassId smallint,
@AvcClassId smallint,
@AxleCount smallint,
@IsReverseDirection bit,
@WheelBase bigint,
@ImageName varchar(255),
@TransactionDateTime datetime2(6),
@LaneTransactionId varchar(45)
AS BEGIN
	CREATE TABLE #Temp(AlertMessage varchar(100))
	BEGIN TRY
		INSERT INTO tbl_AvcTransaction(LaneId,TransactionCount,AvcSensorClassId,AvcClassId,AxleCount,IsReverseDirection,WheelBase,ImageName,TransactionDateTime,LaneTransactionId)
		VALUES(@LaneId,@TransactionCount,@AvcSensorClassId,@AvcClassId,@AxleCount,@IsReverseDirection,@WheelBase,@ImageName,@TransactionDateTime,@LaneTransactionId)
		INSERT INTO #Temp(AlertMessage)VALUES('success');
	END TRY  
	BEGIN CATCH  
		INSERT INTO #Temp(AlertMessage)VALUES('failed');
		EXECUTE usp_ErrorInfoInsert;  
	END CATCH  
	SELECT * FROM #Temp
END
GO
/****** Object:  StoredProcedure [dbo].[USP_DashboardGetData]    Script Date: 07-Jan-25 9:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_DashboardGetData]
AS BEGIN
	DECLARE @ShiftDateTime DateTime
	DECLARE @TransactionDateTime DateTime2(4)
	DECLARE @StartTransactionDateTime DateTime2(4)
	DECLARE @ShiftDate DATE
	DECLARE @ShiftId smallint
	DECLARE @DefaultPlazaId smallint
	DECLARE @ShiftStatusId bigint
	SELECT @TransactionDateTime=MAX(TransactionDateTime) FROM tbl_LaneTransaction (nolock);
	SET @TransactionDateTime=ISNULL(@TransactionDateTime,GETDATE())
	SET @StartTransactionDateTime=DATEADD(DAY,-1,@TransactionDateTime)
	SELECT @DefaultPlazaId=DefaultPlazaId FROM tbl_SystemSetting
	SELECT @ShiftDate=MAX(ShiftDate) FROM tbl_ShiftStatusDetail WHERE PlazaId=@DefaultPlazaId
	SELECT @ShiftId=MAX(ShiftId) FROM tbl_ShiftStatusDetail WHERE ShiftDate=@ShiftDate AND PlazaId=@DefaultPlazaId
	SELECT @ShiftStatusId=MAX(ShiftStatusId) FROM tbl_ShiftStatusDetail  WHERE ShiftDate=@ShiftDate AND ShiftId=@ShiftId
	
	SET @ShiftStatusId=ISNULL(@ShiftStatusId,0)
	SET @ShiftDateTime=GETDATE();
	
	CREATE TABLE #temp(ShiftId	smallint,StartTimmng DateTime,EndTimming DateTime,DataStatus smallint,CreatedDate datetime,CreatedBy bigint,ModifiedDate datetime,ModifiedBy bigint)
	CREATE TABLE #ShiftDetails(ShiftStatusId bigint DEFAULT 0,ShiftDate Date,ShiftId smallint,StartTimmng DateTime,EndTimming DateTime)
	CREATE TABLE #laneDetails(ShiftDate Date,ShiftId smallint,StartTimmng DateTime,EndTimming DateTime,LaneId smallint,PlazaId smallint,LaneNumber smallint,LaneName varchar(50),LaneTransactionCount bigint default 0)
	CREATE TABLE #TransactionTypeMaster(TransactionTypeId smallint,TransactionTypeName varchar(100),TransactionTypeCount bigint default 0,ColorCode varchar(50))
	CREATE TABLE #VehicleClassMaster(FasTagVehicleClassId smallint,FasTagVehicleClassName varchar(100),VehicleClassCount bigint default 0,ColorCode varchar(50))
	
	INSERT INTO #TransactionTypeMaster(TransactionTypeId,TransactionTypeName,ColorCode)
	SELECT TransactionTypeId,TransactionTypeName,TransactionTypeColor FROM tbl_TransactionTypeMaster WHERE DataStatus=1 

	INSERT INTO #VehicleClassMaster(FasTagVehicleClassId,FasTagVehicleClassName,ColorCode)
	SELECT FasTagVehicleClassId,FasTagVehicleClassName,FasTagVehicleClassColor FROM tbl_FasTagVehicleClass WHERE DataStatus=1 

	INSERT INTO #laneDetails(LaneId,PlazaId,LaneNumber,LaneName)
	SELECT LaneId,PlazaId,LaneNumber,LaneName FROM tbl_LaneConfiguration
	WHERE DataStatus=1 AND PlazaId=@DefaultPlazaId
	
	
	IF(@ShiftStatusId=0)
	BEGIN
		Insert into #temp
		EXEC USP_ShiftGetByDateTime @ShiftDateTime
		INSERT INTO #ShiftDetails(ShiftDate,ShiftId,StartTimmng,EndTimming)
		SELECT @ShiftDateTime,ShiftId,StartTimmng,EndTimming FROM #temp
	END
	ELSE
	BEGIN
		INSERT INTO #ShiftDetails(ShiftStatusId,ShiftDate,ShiftId,StartTimmng,EndTimming)
		Select @ShiftStatusId,@ShiftDate,ShiftId,CONVERT(datetime,(CONVERT(varchar,@ShiftDate)+' '+StartTimmng)),
		CONVERT(datetime,(CONVERT(varchar,@ShiftDate)+' '+EndTimming))
		from tbl_ShiftTimining WHERE ShiftId=@ShiftId
	END
	
	UPDATE T SET T.LaneTransactionCount=V.LaneTransactionCount,
	T.ShiftDate=V.ShiftDate,T.ShiftId=V.ShiftId,T.StartTimmng=V.StartTimmng,T.EndTimming=V.EndTimming
	FROM #laneDetails T 
	INNER JOIN 
	(
		SELECT SS.LaneId,SS.LaneTransactionCount,S.ShiftDate,S.ShiftId,S.StartTimmng,S.EndTimming
		FROM #ShiftDetails S 
		LEFT JOIN tbl_ShiftStatusLaneDetails SS ON S.ShiftStatusId=SS.ShiftStatusId
	) V ON T.LaneId=V.LaneId

	UPDATE T SET T.TransactionTypeCount=V.TransactionTypeCount FROM  #TransactionTypeMaster T 
	INNER JOIN 
	(
		SELECT TransactionTypeId,COUNT(TransactionTypeId) TransactionTypeCount FROM tbl_LaneTransaction 
		WHERE TransactionDateTime>=@StartTransactionDateTime AND TransactionDateTime<=@TransactionDateTime
		GROUP BY TransactionTypeId
	)V ON T.TransactionTypeId=V.TransactionTypeId

	UPDATE T SET T.VehicleClassCount=V.VehicleClassCount FROM  #VehicleClassMaster T 
	INNER JOIN 
	(
		SELECT VehicleSubClassId,COUNT(VehicleSubClassId) VehicleClassCount FROM tbl_LaneTransaction 
		WHERE TransactionDateTime>=@StartTransactionDateTime AND TransactionDateTime<=@TransactionDateTime
		GROUP BY VehicleSubClassId
	)V ON T.FasTagVehicleClassId=V.VehicleSubClassId

	SELECT * FROM #laneDetails
	SELECT * FROM #TransactionTypeMaster
	SELECT * FROM #VehicleClassMaster
END
--GO
--EXEC USP_DashboardGetData




GO
/****** Object:  StoredProcedure [dbo].[USP_DataStatusMasterGetAll]    Script Date: 07-Jan-25 9:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_DataStatusMasterGetAll]
As BEGIN
	SELECT * FROM tbl_DataStatusMaster;
END
GO
/****** Object:  StoredProcedure [dbo].[USP_DenominationGetActive]    Script Date: 07-Jan-25 9:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_DenominationGetActive]
AS BEGIN
	SELECT D.DenominationId,D.DenominationValue,0 AS DenominationCount,D.OrderBy,D.DataStatus,DS.DataStatusName,D.CreatedDate,D.CreatedBy,D.ModifiedDate,D.ModifiedBy 
	FROM tbl_DenominationMaster D INNER JOIN tbl_DataStatusMaster DS ON D.DataStatus=DS.DataStatusId
	WHERE D.DataStatus=1
END
GO
/****** Object:  StoredProcedure [dbo].[USP_DenominationGetAll]    Script Date: 07-Jan-25 9:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_DenominationGetAll]
AS BEGIN
	SELECT D.DenominationId,D.DenominationValue,0 AS DenominationCount,D.OrderBy,D.DataStatus,DS.DataStatusName,D.CreatedDate,D.CreatedBy,D.ModifiedDate,D.ModifiedBy 
	FROM tbl_DenominationMaster D INNER JOIN tbl_DataStatusMaster DS ON D.DataStatus=DS.DataStatusId
END
GO
/****** Object:  StoredProcedure [dbo].[USP_EquipmentDetailsGetActive]    Script Date: 07-Jan-25 9:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[USP_EquipmentDetailsGetActive]
AS BEGIN
	SELECT ED.EquipmentId,ED.PlazaId,PD.PlazaName,ED.EquipmentTypeId,ED.EquipmentName,ED.ProtocolTypeId,P.ProtocolTypeName,ED.IpAddress,ED.PortNumber,
	ED.LoginId,ED.LoginPassword,ED.MacAddress,ED.ModelNumber,ED.SerialNumber,ED.ManufacturerId,
	MD.Name as ManufacturerName,ED.ManufacturerDate,ED.PurchageDate,ED.UrlAddress,ED.WarrantyExpireDate,
	ED.OnLineStatus,0 AS ConnectionStatus,ED.DataStatus,ED.CreatedDate,ED.CreatedBy,
	ED.ModifiedDate,ED.ModifiedBy,ET.EquipmentTypeName,ET.EquipmentIconName,ET.EquipmentIcon,LC.LaneId,LC.LaneNumber,
	DM.DataStatusName
	FROM tbl_EquipmentDetails ED 
	INNER JOIN tbl_DataStatusMaster DM ON DM.DataStatusId=DM.DataStatus
	LEFT JOIN tbl_PlazaConfiguration PD ON ED.PlazaId=PD.PlazaId 
	LEFT JOIN tbl_LaneConfiguration LC ON ED.LaneId=LC.LaneId 
	LEFT JOIN tbl_ManufacturerDetails MD ON ED.ManufacturerId=MD.ManufacturerId
	LEFT JOIN tbl_EquipmentTypeMaster ET ON ED.EquipmentTypeId=ET.EquipmentTypeId 
	LEFT JOIN tbl_ProtocolTypeMaster P ON ED.ProtocolTypeId=P.ProtocolTypeId   
	WHERE ED.DataStatus=1
END
GO
/****** Object:  StoredProcedure [dbo].[USP_EquipmentDetailsGetAll]    Script Date: 07-Jan-25 9:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[USP_EquipmentDetailsGetAll]
AS BEGIN
	SELECT ED.EquipmentId,ED.PlazaId,PD.PlazaName,ED.EquipmentTypeId,ED.EquipmentName,ED.ProtocolTypeId,P.ProtocolTypeName,ED.IpAddress,ED.PortNumber,
	ED.LoginId,ED.LoginPassword,ED.MacAddress,ED.ModelNumber,ED.SerialNumber,ED.ManufacturerId,
	MD.Name as ManufacturerName,ED.ManufacturerDate,ED.PurchageDate,ED.UrlAddress,ED.WarrantyExpireDate,
	ED.OnLineStatus,0 AS ConnectionStatus,ED.DataStatus,ED.CreatedDate,ED.CreatedBy,
	ED.ModifiedDate,ED.ModifiedBy,ET.EquipmentTypeName,ET.EquipmentIconName,ET.EquipmentIcon,LC.LaneId,LC.LaneNumber,
	DM.DataStatusName
	FROM tbl_EquipmentDetails ED 
	INNER JOIN tbl_DataStatusMaster DM ON DM.DataStatusId=DM.DataStatus
	LEFT JOIN tbl_PlazaConfiguration PD ON ED.PlazaId=PD.PlazaId 
	LEFT JOIN tbl_LaneConfiguration LC ON ED.LaneId=LC.LaneId 
	LEFT JOIN tbl_ManufacturerDetails MD ON ED.ManufacturerId=MD.ManufacturerId
	LEFT JOIN tbl_EquipmentTypeMaster ET ON ED.EquipmentTypeId=ET.EquipmentTypeId 
	LEFT JOIN tbl_ProtocolTypeMaster P ON ED.ProtocolTypeId=P.ProtocolTypeId   
END
GO
/****** Object:  StoredProcedure [dbo].[USP_EquipmentDetailsGetById]    Script Date: 07-Jan-25 9:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[USP_EquipmentDetailsGetById]
@EquipmentId bigint
AS BEGIN
	SELECT ED.EquipmentId,ED.PlazaId,PD.PlazaName,ED.EquipmentTypeId,ED.EquipmentName,ED.ProtocolTypeId,P.ProtocolTypeName,ED.IpAddress,ED.PortNumber,
	ED.LoginId,ED.LoginPassword,ED.MacAddress,ED.ModelNumber,ED.SerialNumber,ED.ManufacturerId,MD.Name as ManufacturerName,ED.ManufacturerDate,
	ED.PurchageDate,ED.UrlAddress,ED.WarrantyExpireDate,ED.OnLineStatus,ED.DataStatus,ED.CreatedDate,ED.CreatedBy,
	ED.ModifiedDate,ED.ModifiedBy,ET.EquipmentTypeName,ET.EquipmentIconName,LC.LaneId,LC.LaneNumber,DM.DataStatusName
	FROM tbl_EquipmentDetails ED 
	INNER JOIN tbl_DataStatusMaster DM ON DM.DataStatusId=DM.DataStatus
	LEFT JOIN tbl_PlazaConfiguration PD ON ED.PlazaId=PD.PlazaId 
	LEFT JOIN tbl_LaneConfiguration LC ON ED.LaneId=LC.LaneId 
	LEFT JOIN tbl_ManufacturerDetails MD ON ED.ManufacturerId=MD.ManufacturerId
	LEFT JOIN tbl_EquipmentTypeMaster ET ON ED.EquipmentTypeId=ET.EquipmentTypeId 
	LEFT JOIN tbl_ProtocolTypeMaster P ON ED.ProtocolTypeId=P.ProtocolTypeId 
	WHERE ED.EquipmentId=@EquipmentId
END
GO
/****** Object:  StoredProcedure [dbo].[USP_EquipmentDetailsGetByLaneId]    Script Date: 07-Jan-25 9:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[USP_EquipmentDetailsGetByLaneId]
@LaneId bigint
AS BEGIN
	SELECT ED.EquipmentId,ED.PlazaId,PD.PlazaName,ED.EquipmentTypeId,ED.EquipmentName,ED.ProtocolTypeId,P.ProtocolTypeName,ED.IpAddress,ED.PortNumber,
	ED.LoginId,ED.LoginPassword,ED.MacAddress,ED.ModelNumber,ED.SerialNumber,ED.ManufacturerId,
	MD.Name as ManufacturerName,ED.ManufacturerDate,ED.PurchageDate,ED.UrlAddress,ED.WarrantyExpireDate,
	0 AS OnLineStatus,0 AS ConnectionStatus,ED.DataStatus,ED.CreatedDate,ED.CreatedBy,
	ED.ModifiedDate,ED.ModifiedBy,ET.EquipmentTypeName,ET.EquipmentIconName,ET.EquipmentIcon,LC.LaneId,LC.LaneNumber,
	DM.DataStatusName
	FROM tbl_EquipmentDetails ED 
	INNER JOIN tbl_DataStatusMaster DM ON DM.DataStatusId=DM.DataStatus
	LEFT JOIN tbl_PlazaConfiguration PD ON ED.PlazaId=PD.PlazaId 
	LEFT JOIN tbl_LaneConfiguration LC ON ED.LaneId=LC.LaneId 
	LEFT JOIN tbl_ManufacturerDetails MD ON ED.ManufacturerId=MD.ManufacturerId
	LEFT JOIN tbl_EquipmentTypeMaster ET ON ED.EquipmentTypeId=ET.EquipmentTypeId 
	LEFT JOIN tbl_ProtocolTypeMaster P ON ED.ProtocolTypeId=P.ProtocolTypeId   
	WHERE ED.LaneId=@LaneId
END
--GO
--EXEC USP_EquipmentDetailsGetByLaneId
--@LaneId=2
GO
/****** Object:  StoredProcedure [dbo].[USP_EquipmentDetailsInsertUpdate]    Script Date: 07-Jan-25 9:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_EquipmentDetailsInsertUpdate] 
@EquipmentId bigint,
@PlazaId smallint,
@LaneId smallint,
@EquipmentTypeId smallint,
@EquipmentName varchar(100),
@ProtocolTypeId smallint,
@IpAddress varchar(20),	 
@PortNumber int,
@LoginId varchar(50),	     
@LoginPassword varchar(50),
@ManufacturerId int,
@MacAddress varchar(100),	     
@ModelNumber varchar(100),	     
@SerialNumber varchar(100),
@ManufacturerDate date,
@PurchageDate date,
@WarrantyExpireDate date,
@UrlAddress varchar(255),
@DataStatus smallint,
@CreatedDate DateTime,
@CreatedBy bigint,
@ModifiedDate DateTime,
@ModifiedBy bigint

AS
BEGIN
	DECLARE @MenuId smallint=4;
	DECLARE @CVal nvarchar(4000)
	DECLARE @PVal nvarchar(4000)
	CREATE TABLE #Temp(AlertMessage varchar(100),AlertData varchar(8000))
	DECLARE @cnt int
	BEGIN TRY  
	SELECT @MenuId=MenuId FROM tbl_MenuMaster WHERE MenuName ='Equipment'
	IF EXISTS(SELECT EquipmentId FROM tbl_EquipmentDetails where EquipmentName=@EquipmentName AND EquipmentId<>@EquipmentId)
		BEGIN
			INSERT INTO #Temp(AlertMessage)
			VALUES('Equipment name already exists!')
		END
	IF EXISTS(SELECT EquipmentId FROM tbl_EquipmentDetails where MacAddress=@MacAddress AND EquipmentId<>@EquipmentId)
	BEGIN
		INSERT INTO #Temp(AlertMessage)
		VALUES('Equipment macAddress already exists!')
	END
	IF EXISTS(SELECT EquipmentId FROM tbl_EquipmentDetails where SerialNumber=@SerialNumber AND EquipmentId<>@EquipmentId)
	BEGIN
		INSERT INTO #Temp(AlertMessage)
		VALUES('Equipment serial number already exists!')
	END
	IF (@ProtocolTypeId=3)
	BEGIN
		IF EXISTS(SELECT EquipmentId FROM tbl_EquipmentDetails where IpAddress=@IpAddress AND PortNumber=@PortNumber 
		AND EquipmentId<>@EquipmentId AND PortNumber<>0 and LaneId=@LaneId)
			BEGIN
				INSERT INTO #Temp(AlertMessage)
				VALUES('Serail details already exists!')
			END
	END
	else
	BEGIN
		IF EXISTS(SELECT EquipmentId FROM tbl_EquipmentDetails where IpAddress=@IpAddress AND PortNumber=@PortNumber 
		AND EquipmentId<>@EquipmentId AND PortNumber<>0)
			BEGIN
				INSERT INTO #Temp(AlertMessage)
				VALUES('Ip Address and Port already exists!')
			END
	END


	SELECT @cnt=COUNT(AlertMessage)  FROM #Temp
	IF(@cnt=0)
		BEGIN
			IF(@EquipmentId=0)
			BEGIN
				insert into tbl_EquipmentDetails(LaneId,PlazaId,EquipmentTypeId,ProtocolTypeId,EquipmentName,IpAddress,PortNumber,
				LoginId,LoginPassword,ManufacturerId,MacAddress,ModelNumber,SerialNumber,ManufacturerDate,PurchageDate,WarrantyExpireDate,
				UrlAddress,DataStatus,CreatedDate,CreatedBy)
				values(@LaneId,@PlazaId,@EquipmentTypeId,@ProtocolTypeId,@EquipmentName,@IpAddress,@PortNumber,
				@LoginId,@LoginPassword,@ManufacturerId,@MacAddress,@ModelNumber,@SerialNumber,@ManufacturerDate,@PurchageDate,@WarrantyExpireDate,
				@UrlAddress,@DataStatus,@CreatedDate,@CreatedBy);
				SELECT @EquipmentId=@@IDENTITY

				SET @CVal=(SELECT * FROM tbl_EquipmentDetails WHERE EquipmentId=@EquipmentId FOR JSON AUTO, WITHOUT_ARRAY_WRAPPER)		
				
				INSERT INTO tbl_ActivityLog(UserId,CurrentColumn,ActionId,MenuId,CreatedDate)
				VALUES(@CreatedBy,@CVal,'Insert',@MenuId,@CreatedDate);
				
				INSERT INTO #Temp(AlertMessage,AlertData)VALUES('success',@CVal);
			END
			ELSE
			BEGIN
				SET @PVal=(SELECT * FROM tbl_EquipmentDetails WHERE EquipmentId=@EquipmentId FOR JSON AUTO, WITHOUT_ARRAY_WRAPPER)	
				UPDATE tbl_EquipmentDetails SET 
				PlazaId=@PlazaId,LaneId=@LaneId,EquipmentTypeId=@EquipmentTypeId,EquipmentName=@EquipmentName,ProtocolTypeId=@ProtocolTypeId,
				IpAddress=@IpAddress,PortNumber=@PortNumber,LoginId=@LoginId,LoginPassword=@LoginPassword,ManufacturerId=@ManufacturerId,
				MacAddress=@MacAddress,ModelNumber=@ModelNumber,SerialNumber=@SerialNumber,ManufacturerDate=@ManufacturerDate,PurchageDate=@PurchageDate,
				WarrantyExpireDate=@WarrantyExpireDate,DataStatus=@DataStatus,ModifiedDate=@ModifiedDate,ModifiedBy=@ModifiedBy,
				UrlAddress=@UrlAddress
				WHERE EquipmentId=@EquipmentId
				
				SET @CVal=(SELECT * FROM tbl_EquipmentDetails WHERE EquipmentId=@EquipmentId FOR JSON AUTO, WITHOUT_ARRAY_WRAPPER)		

				INSERT INTO tbl_ActivityLog(UserId,PrevColumn,CurrentColumn,ActionId,MenuId,CreatedDate)
				VALUES(@ModifiedBy,@PVal,@CVal,'Update',@MenuId,@ModifiedDate);

				INSERT INTO #Temp(AlertMessage,AlertData)VALUES('success',@CVal);
			END
		END
		END TRY  
	BEGIN CATCH  
		INSERT INTO #Temp(AlertMessage)VALUES('failed');
		EXECUTE USP_ErrorInfoInsert;  
	END CATCH  
		select * from #Temp;
END


GO
/****** Object:  StoredProcedure [dbo].[USP_EquipmentTypeMasterGetActive]    Script Date: 07-Jan-25 9:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_EquipmentTypeMasterGetActive]
AS BEGIN
	SELECT E.EquipmentTypeId,E.EquipmentTypeName,E.EquipmentIconName,E.EquipmentIcon,
	E.DataStatus,E.CreatedDate,E.CreatedBy,E.ModifiedDate,E.ModifiedBy,DS.DataStatusName 
	FROM tbl_EquipmentTypeMaster E 
	INNER JOIN tbl_DataStatusMaster DS ON E.DataStatus=DS.DataStatusId
	WHERE E.DataStatus=1
	
END
GO
/****** Object:  StoredProcedure [dbo].[USP_EquipmentTypeMasterGetAll]    Script Date: 07-Jan-25 9:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_EquipmentTypeMasterGetAll]
AS BEGIN
	SELECT E.EquipmentTypeId,E.EquipmentTypeName,E.EquipmentIconName,
	E.DataStatus,E.CreatedDate,E.CreatedBy,E.ModifiedDate,E.ModifiedBy,DS.DataStatusName
	FROM tbl_EquipmentTypeMaster E 
	INNER JOIN tbl_DataStatusMaster DS ON E.DataStatus=DS.DataStatusId

END
GO
/****** Object:  StoredProcedure [dbo].[USP_ErrorInfoInsert]    Script Date: 07-Jan-25 9:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_ErrorInfoInsert]

AS  INSERT INTO tbl_ErrorInfo(ErrorNumber,ErrorSeverity,ErrorState,ErrorProcedure,ErrorLine,ErrorMessage)
	SELECT ERROR_NUMBER() AS ErrorNumber,ERROR_SEVERITY() AS ErrorSeverity,ERROR_STATE() AS ErrorState,
	ERROR_PROCEDURE() AS ErrorProcedure,ERROR_LINE() AS ErrorLine ,ERROR_MESSAGE() AS ErrorMessage;  
GO
/****** Object:  StoredProcedure [dbo].[USP_ExemptTypeMasterGetActive]    Script Date: 07-Jan-25 9:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_ExemptTypeMasterGetActive]
AS BEGIN
	SELECT E.ExemptTypeId,E.ExemptTypeName,E.ParentId,E.DataStatus,E.CreatedDate,E.CreatedBy,E.ModifiedDate,E.ModifiedBy,DS.DataStatusName
	FROM tbl_ExemptTypeMaster E
	INNER JOIN tbl_DataStatusMaster DS ON E.DataStatus=DS.DataStatusId  
	WHERE E.DataStatus=1
	ORDER BY ExemptTypeId
END
GO
/****** Object:  StoredProcedure [dbo].[USP_ExemptTypeMasterGetAll]    Script Date: 07-Jan-25 9:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_ExemptTypeMasterGetAll]
AS BEGIN
	SELECT E.ExemptTypeId,E.ExemptTypeName,E.ParentId,E.DataStatus,E.CreatedDate,E.CreatedBy,E.ModifiedDate,E.ModifiedBy,DS.DataStatusName
	FROM tbl_ExemptTypeMaster E
	INNER JOIN tbl_DataStatusMaster DS ON E.DataStatus=DS.DataStatusId  
	ORDER BY ExemptTypeId
END
GO
/****** Object:  StoredProcedure [dbo].[USP_ExemptTypeUpdate]    Script Date: 07-Jan-25 9:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[USP_ExemptTypeUpdate] 
@SessionId varchar(20),
@CreatedDate DateTime,
@CreatedBy bigint,
@ModifiedDate DateTime,
@ModifiedBy bigint
AS
BEGIN
	DECLARE @Datacnt int
	DECLARE @MenuId smallint=0;
	DECLARE @cnt int
	DECLARE @PositionCount int
	DECLARE @ActionId varchar(100)
	CREATE TABLE #Temp(AlertMessage varchar(100))
	BEGIN TRY  
		
		SELECT @MenuId=MenuId FROM tbl_MenuMaster WHERE MenuName ='Exempt Type'
		
		UPDATE T SET T.DataStatus=V.DataStatus 
		FROM tbl_ExemptTypeMaster T INNER JOIN
		(
			SELECT ExemptTypeId,DataStatus
			FROM temp_ExemptTypeMaster
		    WHERE SessionId=@SessionId
		) V ON T.ExemptTypeId=V.ExemptTypeId
		
		DELETE FROM temp_ExemptTypeMaster WHERE SessionId=@SessionId

		INSERT INTO tbl_ActivityLog(UserId,ActionId,MenuId,CreatedDate)
		VALUES(@CreatedBy,'Update',@MenuId,@CreatedDate);
		
		INSERT INTO #Temp(AlertMessage)VALUES('success');
	
	END TRY  
	BEGIN CATCH  
		INSERT INTO #Temp(AlertMessage)VALUES('failed');
		EXECUTE USP_ErrorInfoInsert;  
	END CATCH  
		select * from #Temp;
END
--GO
--EXEC USP_EquipmentConfigInsertUpdate
--@SessionId ='MN7VD8TUAI',
--@SystemId=6,
--@CreatedDate ='26-Jul-2022 11:30:00',
--@CreatedBy =0,
--@ModifiedDate='26-Jul-2022 11:30:00',
--@ModifiedBy =0
GO
/****** Object:  StoredProcedure [dbo].[USP_FasTagVehicleClassGetActive]    Script Date: 07-Jan-25 9:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_FasTagVehicleClassGetActive]
AS BEGIN
	SELECT F.FasTagVehicleClassId,F.FasTagVehicleClassName,F.FasTagVehicleClassDescription,F.PermissibleWeight,F.AxcelCount,F.VehicleHeight,
	F.VehicleLength,F.FasTagVehicleClassColor,F.DataStatus,F.CreatedDate,F.CreatedBy,F.ModifiedDate,F.ModifiedBy,DS.DataStatusName 
	FROM tbl_FasTagVehicleClass F
	INNER JOIN tbl_DataStatusMaster DS ON F.DataStatus=DS.DataStatusId
	WHERE F.DataStatus=1
END
GO
/****** Object:  StoredProcedure [dbo].[USP_FasTagVehicleClassGetAll]    Script Date: 07-Jan-25 9:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_FasTagVehicleClassGetAll]
AS BEGIN
	SELECT F.FasTagVehicleClassId,F.FasTagVehicleClassName,F.FasTagVehicleClassDescription,F.PermissibleWeight,F.AxcelCount,F.VehicleHeight,
	F.VehicleLength,F.FasTagVehicleClassColor,F.DataStatus,F.CreatedDate,F.CreatedBy,F.ModifiedDate,F.ModifiedBy,DS.DataStatusName 
	FROM tbl_FasTagVehicleClass F
	INNER JOIN tbl_DataStatusMaster DS ON F.DataStatus=DS.DataStatusId
END
GO
/****** Object:  StoredProcedure [dbo].[USP_FasTagVehicleClassGetById]    Script Date: 07-Jan-25 9:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_FasTagVehicleClassGetById]
@FasTagVehicleClassId smallint
AS BEGIN
	SELECT F.FasTagVehicleClassId,F.FasTagVehicleClassName,F.FasTagVehicleClassDescription,F.PermissibleWeight,F.AxcelCount,F.VehicleHeight,
	F.VehicleLength,F.FasTagVehicleClassColor,F.DataStatus,F.CreatedDate,F.CreatedBy,F.ModifiedDate,F.ModifiedBy,DS.DataStatusName 
	FROM tbl_FasTagVehicleClass F
	INNER JOIN tbl_DataStatusMaster DS ON F.DataStatus=DS.DataStatusId
	WHERE FasTagVehicleClassId=@FasTagVehicleClassId
END
GO
/****** Object:  StoredProcedure [dbo].[USP_FasTagVehicleClassGetByIds]    Script Date: 07-Jan-25 9:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_FasTagVehicleClassGetByIds]
(
@FasTagVehicleClassIds varchar(4000)
)
AS BEGIN
	SELECT F.FasTagVehicleClassId,F.FasTagVehicleClassName,F.FasTagVehicleClassDescription,F.PermissibleWeight,F.AxcelCount,F.VehicleHeight,
	F.VehicleLength,F.FasTagVehicleClassColor,F.DataStatus,F.CreatedDate,F.CreatedBy,F.ModifiedDate,F.ModifiedBy,DS.DataStatusName 
	FROM tbl_FasTagVehicleClass F
	INNER JOIN tbl_DataStatusMaster DS ON F.DataStatus=DS.DataStatusId
	WHERE FasTagVehicleClassId IN (SELECT DataValue from fnc_CommaSeparated(@FasTagVehicleClassIds)) AND F.DataStatus=1

END

--GO 
--EXEC USP_ReportMasterGetByIds
--@ReportIds='13,14'

GO
/****** Object:  StoredProcedure [dbo].[USP_FasTagVehicleClassInsertUpdate]    Script Date: 07-Jan-25 9:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_FasTagVehicleClassInsertUpdate] 
@FasTagVehicleClassId smallint,
@FasTagVehicleClassName varchar(100),
@FasTagVehicleClassDescription varchar(100),
@PermissibleWeight decimal(18,3),
@DataStatus smallint,
@CreatedDate DateTime,
@CreatedBy bigint,
@ModifiedDate DateTime,
@ModifiedBy bigint

AS
BEGIN
	DECLARE @MenuId smallint=3;
	DECLARE @CVal nvarchar(4000)
	DECLARE @PVal nvarchar(4000)
	CREATE TABLE #Temp(AlertMessage varchar(100))
	DECLARE @cnt int
	BEGIN TRY 
	SELECT @MenuId=MenuId FROM tbl_MenuMaster WHERE MenuName ='FasTag Class'
	IF EXISTS(SELECT FasTagVehicleClassId FROM tbl_FasTagVehicleClass where FasTagVehicleClassName=@FasTagVehicleClassName AND FasTagVehicleClassId<>@FasTagVehicleClassId)
	BEGIN
		INSERT INTO #Temp(AlertMessage)
		VALUES('FasTag Vehicle Class Name already exists')
	END
	SELECT @cnt=COUNT(AlertMessage)  FROM #Temp
	IF(@cnt=0)
		BEGIN
			IF(@FasTagVehicleClassId=0)
			BEGIN
				insert into tbl_FasTagVehicleClass(FasTagVehicleClassName,FasTagVehicleClassDescription,PermissibleWeight,DataStatus,CreatedDate,CreatedBy)
				values(@FasTagVehicleClassName,@FasTagVehicleClassDescription,@PermissibleWeight,@DataStatus,@CreatedDate,@CreatedBy);
				SELECT @FasTagVehicleClassId=@@IDENTITY

				SET @CVal=(SELECT * FROM tbl_FasTagVehicleClass WHERE FasTagVehicleClassId=@FasTagVehicleClassId FOR JSON AUTO, WITHOUT_ARRAY_WRAPPER)		
				
				INSERT INTO tbl_ActivityLog(UserId,CurrentColumn,ActionId,MenuId,CreatedDate)
				VALUES(@CreatedBy,@CVal,'Insert',@MenuId,@CreatedDate);
				
				INSERT INTO #Temp(AlertMessage)VALUES('success');
			END
			ELSE
			BEGIN
				
				SET @PVal=(SELECT * FROM tbl_FasTagVehicleClass WHERE FasTagVehicleClassId=@FasTagVehicleClassId FOR JSON AUTO, WITHOUT_ARRAY_WRAPPER)	
				
				UPDATE tbl_FasTagVehicleClass SET FasTagVehicleClassName=@FasTagVehicleClassName,
				FasTagVehicleClassDescription=@FasTagVehicleClassDescription,PermissibleWeight=@PermissibleWeight,
				DataStatus=@DataStatus,ModifiedDate=@ModifiedDate,ModifiedBy=@ModifiedBy
				WHERE FasTagVehicleClassId=@FasTagVehicleClassId
				
				SET @CVal=(SELECT * FROM tbl_FasTagVehicleClass WHERE FasTagVehicleClassId=@FasTagVehicleClassId FOR JSON AUTO, WITHOUT_ARRAY_WRAPPER)		

				INSERT INTO tbl_ActivityLog(UserId,PrevColumn,CurrentColumn,ActionId,MenuId,CreatedDate)
				VALUES(@ModifiedBy,@PVal,@CVal,'Update',@MenuId,@ModifiedDate);

				INSERT INTO #Temp(AlertMessage)VALUES('success');
			END
		END
		END TRY  
	BEGIN CATCH  
		INSERT INTO #Temp(AlertMessage)VALUES('failed');
		EXECUTE USP_ErrorInfoInsert;  
	END CATCH  
		select * from #Temp;
END


GO
/****** Object:  StoredProcedure [dbo].[USP_FloatProcessDenominationGetById]    Script Date: 07-Jan-25 9:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_FloatProcessDenominationGetById]
@FloatProcessId bigint
AS BEGIN
	SELECT * FROM tbl_FloatProcessDenominationDetails
	WHERE FloatProcessId=@FloatProcessId
END
GO
/****** Object:  StoredProcedure [dbo].[USP_FloatProcessGetAll]    Script Date: 07-Jan-25 9:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_FloatProcessGetAll]
AS BEGIN
		SELECT FP.FloatProcessId,FP.PlazaId,P.PlazaName,FP.LaneId,L.LaneNumber,FP.ShiftId,S.StartTimmng,S.EndTimming,
		FP.FloatTransactionTypeId,FT.FloatTransactionTypeName,FP.TransactionDate,FP.TransactionAmount,
		FP.ReceiptNumber,FP.AssignedBy,ISNULL(UAB.LoginId,'Sys Admin') AS AssignedByLoginId,FP.AssignedTo,UAT.LoginId AS AssignedToLoginId,
		FP.DataStatus,FP.CreatedDate,FP.CreatedBy,FP.ModifiedDate,FP.ModifiedBy 
		FROM tbl_FloatProcessTransactions FP
		LEFT JOIN tbl_PlazaConfiguration P ON FP.PlazaId=P.PlazaId
		LEFT JOIN tbl_LaneConfiguration L ON FP.PlazaId=P.PlazaId AND FP.LaneId=L.LaneId
		LEFT JOIN tbl_ShiftTimining S ON FP.ShiftId=S.ShiftId 
		LEFT JOIN tbl_FloatTransactionsTypeMaster FT ON FP.FloatTransactionTypeId=FT.FloatTransactionsTypeId 
		LEFT JOIN tbl_UserMaster UAT ON FP.AssignedTo=UAT.UserId 
		LEFT JOIN tbl_UserMaster UAB ON FP.AssignedBy=UAB.UserId 
END
GO
/****** Object:  StoredProcedure [dbo].[USP_FloatProcessGetById]    Script Date: 07-Jan-25 9:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_FloatProcessGetById]
@FloatProcessId bigint
AS BEGIN
		SELECT FP.FloatProcessId,FP.PlazaId,P.PlazaName,FP.LaneId,L.LaneNumber,FP.ShiftId,S.StartTimmng,S.EndTimming,
		FP.FloatTransactionTypeId,FT.FloatTransactionTypeName,FP.TransactionDate,FP.TransactionAmount,
		FP.ReceiptNumber,FP.AssignedBy,ISNULL(UAB.LoginId,'Sys Admin') AS AssignedByLoginId,FP.AssignedTo,UAT.LoginId AS AssignedToLoginId,
		FP.DataStatus,FP.CreatedDate,FP.CreatedBy,FP.ModifiedDate,FP.ModifiedBy 
		FROM tbl_FloatProcessTransactions FP
		LEFT JOIN tbl_PlazaConfiguration P ON FP.PlazaId=P.PlazaId
		LEFT JOIN tbl_LaneConfiguration L ON FP.PlazaId=P.PlazaId AND FP.LaneId=L.LaneId
		LEFT JOIN tbl_ShiftTimining S ON FP.ShiftId=S.ShiftId 
		LEFT JOIN tbl_FloatTransactionsTypeMaster FT ON FP.FloatTransactionTypeId=FT.FloatTransactionsTypeId 
		LEFT JOIN tbl_UserMaster UAT ON FP.AssignedTo=UAT.UserId 
		LEFT JOIN tbl_UserMaster UAB ON FP.AssignedBy=UAB.UserId 
		WHERE FP.FloatProcessId=@FloatProcessId
END
GO
/****** Object:  StoredProcedure [dbo].[USP_FloatProcessInsertUpdate]    Script Date: 07-Jan-25 9:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[USP_FloatProcessInsertUpdate]
@FloatProcessId bigint,
@PlazaId smallint,
@LaneId smallint,
@ShiftId smallint,
@FloatTransactionTypeId smallint,
@TransactionDate date,
@TransactionAmount decimal(18,2),
@ReceiptNumber varchar(50),
@AssignedBy bigint,
@AssignedTo bigint,
@LaneTransactionCount bigint,
@DataStatus smallint,
@CreatedDate DateTime,
@CreatedBy bigint,
@ModifiedDate DateTime,
@ModifiedBy bigint
AS
BEGIN
  DECLARE @PVal varchar(4000)
	DECLARE @CVal varchar(4000)
	DECLARE @OpeningBalance decimal(18,2);
	DECLARE @ClosingBalance decimal(18,2);
	DECLARE @AvailableBalnace decimal(18,2);
	DECLARE @ProcessBalance decimal(18,2);
	DECLARE @DifferenceAmount decimal(18,2);
	DECLARE @CashierBalance decimal(18,2);
	DECLARE @MenuId smallint=0;
	DECLARE @ShiftStatusId bigint=0
	DECLARE @ShiftStartTimming datetime
	DECLARE @ShiftEndTimming datetime
	DECLARE @MaxAllowedTime datetime
	DECLARE @AllotmentDays smallint
	DECLARE @FloatTransactionTypeName varchar(255)
	DECLARE @LaneName varchar(255)
	DECLARE @ShiftName varchar(255)
	DECLARE @AssignedToName varchar(255)
	DECLARE @AssignedByName varchar(255)
	CREATE TABLE #Temp(AlertMessage varchar(100))
	DECLARE @cnt int
	DECLARE @dcnt int
	BEGIN TRY
		SELECT @FloatTransactionTypeName=FloatTransactionTypeName FROM tbl_FloatTransactionsTypeMaster WHERE FloatTransactionsTypeId=@FloatTransactionTypeId
		SELECT @LaneName=LaneName FROM tbl_LaneConfiguration WHERE LaneId=@LaneId
		SELECT @AssignedToName=LoginId FROM tbl_UserMaster WHERE UserId=@AssignedTo
		SELECT @AssignedByName=LoginId FROM tbl_UserMaster WHERE UserId=@AssignedBy
		SET @ShiftName ='Shift-'+CONVERT(VARCHAR(255),@ShiftId)

		SELECT @MenuId=MenuId FROM tbl_MenuMaster WHERE MenuName ='Float Process'
		SELECT @OpeningBalance=OpeningBalance,@ClosingBalance=ClosingBalance,@AllotmentDays=AllotmentDays FROM tbl_SystemSetting;
		SET @MaxAllowedTime=DATEADD(DAY, @AllotmentDays, GETDATE());
	
		CREATE TABLE #FloatProcessDenominationDetails(DenominationId smallint,DenominationValue smallint,DenominationCount smallint,TotalAmount DECIMAL(18,2))
		
		insert into #FloatProcessDenominationDetails(DenominationId,DenominationValue,DenominationCount)
		SELECT DenominationId,DenominationValue,DenominationCount FROM temp_DenominationDetails
		WHERE SessionId=@ReceiptNumber
		
		DELETE FROM temp_DenominationDetails WHERE SessionId=@ReceiptNumber

		SELECT @ShiftStartTimming=CONVERT(DATETIME,CONVERT(VARCHAR(11),@TransactionDate)+' '+ StartTimmng),
		@ShiftEndTimming=CONVERT(DATETIME,CONVERT(VARCHAR(11),@TransactionDate)+' '+ EndTimming)
		FROM tbl_ShiftTimining WHERE ShiftId=@ShiftId;
		IF(@FloatProcessId<>0)
		BEGIN
			if EXISTS(SELECT FP.ShiftId FROM tbl_FloatProcessTransactions FP INNER JOIN tbl_ShiftStatusDetail SD ON FP.ShiftId=SD.ShiftId AND FP.PlazaId=SD.PlazaId
			AND FP.TransactionDate=SD.ShiftDate AND SD.ShiftStatus=0
			WHERE FloatProcessId=@FloatProcessId)
			BEGIN
				INSERT INTO #Temp(AlertMessage) 
			    VALUES('Float cannot be modified due to this Shift already closed!')
			END
		END

		if EXISTS(SELECT ShiftId FROM tbl_ShiftStatusDetail WHERE ShiftId=@ShiftId AND ShiftDate=@TransactionDate AND PlazaId=@PlazaId AND ShiftStatus=0)
		BEGIN
			INSERT INTO #Temp(AlertMessage) 
			VALUES('This Shift already closed!')
		END
		IF(@FloatTransactionTypeId=3)
		BEGIN
		  IF (GETDATE() > @ShiftEndTimming)
		  BEGIN
				INSERT INTO #Temp(AlertMessage) 
				VALUES('Float can not assign for this shift.')
		  END
		  ELSE IF(@ShiftEndTimming>@MaxAllowedTime)
		  BEGIN
				INSERT INTO #Temp(AlertMessage) 
				VALUES('Float can not assign for this future shift.')
		  END
		SELECT @dcnt=COUNT(1) FROM tbl_FloatProcessTransactions
		IF(@dcnt=0)
		BEGIN
			SET @ClosingBalance=@OpeningBalance-@TransactionAmount
			IF(@TransactionAmount>@OpeningBalance)
			BEGIN
				INSERT INTO #Temp(AlertMessage) 
				VALUES('Float cannot assign due to low fund.')
			END
		END
		ELSE
		BEGIN
			SELECT @ProcessBalance=TransactionAmount FROM tbl_FloatProcessTransactions
			WHERE FloatProcessId=@FloatProcessId
			SET @ClosingBalance=@ClosingBalance+@ProcessBalance-@TransactionAmount;
			IF(@TransactionAmount>@ClosingBalance)
			BEGIN
				INSERT INTO #Temp(AlertMessage) 
				VALUES('Float cannot assign due to low fund.')
			END
		END
		END
		ELSE IF(@FloatTransactionTypeId IN (4,5))
		BEGIN
			IF (@FloatTransactionTypeId =4 and (@ShiftStartTimming > GETDATE() OR @ShiftEndTimming < GETDATE()))
			BEGIN
				INSERT INTO #Temp(AlertMessage) 
				VALUES('Float mid-shift can not process for this shift')
			END
			IF(@FloatProcessId=0)
			BEGIN
				SET @ClosingBalance=@ClosingBalance+@TransactionAmount
			END
			ELSE
			BEGIN
				SELECT @ProcessBalance=TransactionAmount FROM tbl_FloatProcessTransactions
				WHERE FloatProcessId=@FloatProcessId
				SET @ClosingBalance=@ClosingBalance-@ProcessBalance+@TransactionAmount;
			END
		END
		SELECT @cnt=COUNT(AlertMessage)  FROM #Temp
		IF(@cnt=0)
			BEGIN
				IF(@FloatProcessId=0)
					BEGIN
						insert into tbl_FloatProcessTransactions(PlazaId,LaneId,ShiftId,FloatTransactionTypeId,TransactionDate,TransactionAmount,ReceiptNumber,AssignedBy,AssignedTo,DataStatus,CreatedDate,CreatedBy)
						values(@PlazaId,@LaneId,@ShiftId,@FloatTransactionTypeId,@TransactionDate,@TransactionAmount,@ReceiptNumber,@AssignedBy,@AssignedTo,@DataStatus,@CreatedDate,@CreatedBy);
						SELECT @FloatProcessId=@@IDENTITY
						SET @CVal=(SELECT * FROM tbl_FloatProcessTransactions WHERE FloatProcessId=@FloatProcessId  FOR JSON AUTO, WITHOUT_ARRAY_WRAPPER)
					
						DELETE FROM tbl_FloatProcessDenominationDetails WHERE FloatProcessId=@FloatProcessId
						INSERT INTO tbl_FloatProcessDenominationDetails(FloatProcessId,DenominationId,DenominationValue,DenominationCount,TotalAmount)

						SELECT @FloatProcessId,DenominationId,DenominationValue,DenominationCount,DenominationValue*DenominationCount 
						FROM #FloatProcessDenominationDetails
						UPDATE tbl_SystemSetting SET  ClosingBalance=@ClosingBalance
						INSERT INTO tbl_ActivityLog(UserId,CurrentColumn,ActionId,MenuId,CreatedDate)
						VALUES(@CreatedBy,@CVal,'Insert',@MenuId,@CreatedDate);
				
						IF NOT EXISTS(SELECT ShiftId FROM tbl_ShiftStatusDetail WHERE ShiftId=@ShiftId AND ShiftDate=@TransactionDate AND PlazaId=@PlazaId)
						BEGIN
							INSERT INTO tbl_ShiftStatusDetail(PlazaId,ShiftId,ShiftDate)
							VALUES(@PlazaId,@ShiftId,@TransactionDate)
							SELECT @ShiftStatusId=@@IDENTITY
						END
						IF(@FloatTransactionTypeId=5)
						BEGIN
							SELECT @ShiftStatusId=ShiftStatusId FROM tbl_ShiftStatusDetail WHERE ShiftId=@ShiftId AND ShiftDate=@TransactionDate AND PlazaId=@PlazaId
							IF NOT EXISTS(SELECT ShiftStatusId FROM tbl_ShiftStatusLaneDetails WHERE ShiftStatusId=@ShiftStatusId AND LaneId=@LaneId)
							BEGIN
								INSERT INTO tbl_ShiftStatusLaneDetails(ShiftStatusId,LaneId,LaneTransactionCount)
								VALUES(@ShiftStatusId,@LaneId,@LaneTransactionCount)
							END
						END
						INSERT INTO #Temp(AlertMessage)VALUES('success');
			END
				ELSE
					BEGIN
						SET @PVal=(SELECT * FROM tbl_FloatProcessTransactions WHERE FloatProcessId=@FloatProcessId FOR JSON AUTO, WITHOUT_ARRAY_WRAPPER)
					
						UPDATE tbl_FloatProcessTransactions SET PlazaId=@PlazaId,LaneId=@LaneId,ShiftId=@ShiftId,FloatTransactionTypeId=@FloatTransactionTypeId,
						TransactionDate=@TransactionDate,TransactionAmount=@TransactionAmount,ReceiptNumber=@ReceiptNumber,AssignedBy=@AssignedBy,AssignedTo=@AssignedTo,
						DataStatus=@DataStatus,ModifiedDate=@ModifiedDate,ModifiedBy=@ModifiedBy
						WHERE FloatProcessId=@FloatProcessId

						DELETE FROM tbl_FloatProcessDenominationDetails WHERE FloatProcessId=@FloatProcessId
						INSERT INTO tbl_FloatProcessDenominationDetails(FloatProcessId,DenominationId,DenominationValue,DenominationCount,TotalAmount)

						SELECT @FloatProcessId,DenominationId,DenominationValue,DenominationCount,DenominationValue*DenominationCount 
						FROM #FloatProcessDenominationDetails
					
						SET @CVal=(SELECT * FROM tbl_FloatProcessTransactions WHERE FloatProcessId=@FloatProcessId FOR JSON AUTO, WITHOUT_ARRAY_WRAPPER)	
						IF(@FloatTransactionTypeId=5)
						BEGIN
							SELECT @ShiftStatusId=ShiftStatusId FROM tbl_ShiftStatusDetail WHERE ShiftId=@ShiftId AND ShiftDate=@TransactionDate AND PlazaId=@PlazaId
							IF NOT EXISTS(SELECT ShiftStatusId FROM tbl_ShiftStatusLaneDetails WHERE ShiftStatusId=@ShiftStatusId AND LaneId=@LaneId)
							BEGIN
								INSERT INTO tbl_ShiftStatusLaneDetails(ShiftStatusId,LaneId,LaneTransactionCount)
								VALUES(@ShiftStatusId,@LaneId,@LaneTransactionCount)
							END
						END
						INSERT INTO tbl_ActivityLog(UserId,PrevColumn,CurrentColumn,ActionId,MenuId,CreatedDate)
						VALUES(@ModifiedBy,@PVal,@CVal,'Update',@MenuId,@ModifiedDate);
						INSERT INTO #Temp(AlertMessage)VALUES('success');
					END
			END
END TRY  
BEGIN CATCH  
	INSERT INTO #Temp(AlertMessage)VALUES('failed');
	EXECUTE usp_ErrorInfoInsert;  
END CATCH  
	SELECT * FROM #Temp
	SELECT @FloatTransactionTypeName AS FloatType,@LaneName AS LaneName,@ShiftName AS ShiftName,
	@AssignedToName AS AssignedTo,@AssignedByName AS AssignedBy,@TransactionDate AS TransactionDate
END
GO
/****** Object:  StoredProcedure [dbo].[USP_FloatTransactionsTypeGetAll]    Script Date: 07-Jan-25 9:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_FloatTransactionsTypeGetAll]
AS BEGIN
	SELECT * FROM tbl_FloatTransactionsTypeMaster  
END
GO
/****** Object:  StoredProcedure [dbo].[USP_GetReportConsolidatedRevenue]    Script Date: 07-Jan-25 9:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_GetReportConsolidatedRevenue]
(
@TDate VARCHAR(20),
@TType VARCHAR(20)
)
AS 
BEGIN
    DECLARE @columns NVARCHAR(MAX), @sql NVARCHAR(MAX), @Scolumns NVARCHAR(MAX), @Dcolumns NVARCHAR(MAX);

		SET @columns = 
		(
			SELECT QUOTENAME(SystemVehicleClassName) + ',' 
			FROM tbl_SystemVehicleClass 
			WHERE DataStatus=1 ORDER BY SystemVehicleClassId
			FOR XML PATH('')
		);

		SET @Dcolumns = 
		(
			SELECT 'ISNULL('+QUOTENAME(SystemVehicleClassName) + ',0) AS'+QUOTENAME(SystemVehicleClassName+' (amount)') +' ,' 
			FROM tbl_SystemVehicleClass 
			WHERE DataStatus=1 ORDER BY SystemVehicleClassId
			FOR XML PATH('')
		);

		SET @Scolumns = 
		(
			SELECT 'ISNULL('+QUOTENAME(SystemVehicleClassName) + ',0)+' 
			FROM tbl_SystemVehicleClass 
			WHERE DataStatus=1 ORDER BY SystemVehicleClassId
			FOR XML PATH('')
		);
		SET @columns = LEFT(@columns, LEN(@columns) - 1);
		SET @Scolumns = LEFT(@Scolumns, LEN(@Scolumns) - 1);
		SET @Dcolumns = LEFT(@Dcolumns, LEN(@Dcolumns) - 1);

    SET @sql = '
    SELECT 
       ''' + @TDate + ''' AS TDate ,TransactionTypeName AS [Transaction Type],[Lane], ' + @Dcolumns + ', ISNULL(Total,0) AS [Total (amount)]
	   
    FROM 
        (
             SELECT 
                LT.LaneId,LC.LaneName AS [Lane],TT.TransactionTypeName, 
                SVC.SystemVehicleClassName,
                SUM(ISNULL(LT.TransactionAmount,0) + ISNULL(LT.TagPenaltyAmount,0) + ISNULL(LT.OverWeightAmount,0)) AS [Total]
            FROM 
                tbl_LaneConfiguration LC
            CROSS JOIN tbl_SystemVehicleClass SVC
            LEFT JOIN 
			tbl_LaneTransaction LT ON 
			LT.LaneId = LC.LaneId AND
			LT.VehicleClassId = SVC.SystemVehicleClassId AND 
			ISNULL(LT.VehicleClassId,0)>0 AND ISNULL(LT.VehicleClassId,0)<21 AND LT.TransactionTypeId IN ('+@TType+')
			INNER JOIN tbl_TransactionTypeMaster TT ON LT.TransactionTypeId=TT.TransactionTypeId AND
			CONVERT(date,LT.TransactionDateTime)=CONVERT(date,''' + @TDate + ''') 
             GROUP BY 
                LT.LaneId,LC.LaneName, SVC.SystemVehicleClassName,TT.TransactionTypeName
        ) AS SourceTable
    PIVOT 
        (
           SUM([Total]) FOR SystemVehicleClassName IN (' + @columns + ')
        ) AS PivotTable
    CROSS APPLY (
        SELECT SUM(cnt) AS Total
        FROM (VALUES (' + @Scolumns + ')) AS X(cnt)
    ) AS TotalColumns;';

    EXEC sp_executesql @sql;
END
GO
/****** Object:  StoredProcedure [dbo].[USP_GetReportData]    Script Date: 07-Jan-25 9:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_GetReportData]
@CategoryId smallint,
@ReportId smallint,
@StartDateTime varchar(50),
@EndDateTime varchar(50),
@ShiftFilterList varchar(4000)='0',
@TCUserFilterList varchar(4000)='0',
@PlazaFilterList varchar(4000)='0',
@LaneFilterList varchar(4000)='0',
@VehicleClassFilterList varchar(4000)='0',
@VehicleSubClassFilterList varchar(4000)='0',
@TransactionTypeFilterList varchar(4000)='0',
@AuditerFilterList varchar(4000)='0',
@PlateNumber varchar(20)='',
@TransactionId VARCHAR(50)='0',
@FilterQuery varchar(4000)='0'

AS BEGIN
	DECLARE @StartDate datetime
	DECLARE @EndDate datetime
	SET @StartDate = CONVERT(datetime, @StartDateTime)
	SET @EndDate = CONVERT(datetime, @EndDateTime)
	DECLARE @CurrentDate datetime
	DECLARE @CurrentDateString varchar(20)
	SET @CurrentDate = @StartDate

	CREATE TABLE #tempHeader(ReportCategory varchar(100),ReportType varchar(100),StartDateTime varchar(50),
	EndDateTime varchar(50),ShiftName varchar(4000) DEFAULT 'All',OperatorName varchar(4000) DEFAULT 'All',
	LaneNames varchar(4000) DEFAULT 'All',VehicleClassNames varchar(4000) DEFAULT 'All',
	SubVehicleClassNames varchar(4000) DEFAULT 'All',TransactionTypeNames varchar(4000) DEFAULT 'All',PlateNumber varchar(20),TransactionId varchar(50))
	
	INSERT INTO #tempHeader(ReportCategory,StartDateTime,EndDateTime,TransactionId,PlateNumber)
	SELECT ReportName,@StartDateTime,@EndDateTime,
	CASE @TransactionId WHEN '0' THEN 'All' ELSE CONVERT(VARCHAR(50),@TransactionId) END,
	CASE @PlateNumber WHEN '' THEN 'All' ELSE @PlateNumber END
	FROM tbl_ReportMaster WHERE ReportId=@CategoryId

	UPDATE #tempHeader SET ReportType=(SELECT ReportName FROM tbl_ReportMaster WHERE ReportId=@ReportId)

	IF @ShiftFilterList<>'0'
		UPDATE #tempHeader SET ShiftName=
		(
			SELECT STRING_AGG('Shift-' + CONVERT(VARCHAR(4000), M.ShiftId), ',') AS ShiftNames
			FROM tbl_ShiftTimining M 
			CROSS APPLY dbo.fnc_CommaSeparated(@ShiftFilterList) V
			WHERE M.ShiftId = V.DataValue
		)

	IF @TCUserFilterList<>'0'
		UPDATE #tempHeader SET OperatorName=
		(
			SELECT STRING_AGG(LoginId, ',') AS LoginIds
			FROM tbl_UserMaster M 
			CROSS APPLY dbo.fnc_CommaSeparated(@TCUserFilterList) V
			WHERE M.UserId = V.DataValue
		)


	IF @LaneFilterList<>'0'
		UPDATE #tempHeader SET LaneNames=
		(
			SELECT STRING_AGG(LaneName, ',') AS LaneNames
			FROM tbl_LaneConfiguration M 
			CROSS APPLY dbo.fnc_CommaSeparated(@LaneFilterList)V 
			WHERE M.LaneId = V.DataValue
		)
		
	IF @VehicleClassFilterList<>'0'
		UPDATE #tempHeader SET VehicleClassNames=
		(
			SELECT STRING_AGG(SystemVehicleClassName, ',') AS SystemVehicleClassNames
			FROM tbl_SystemVehicleClass M 
			CROSS APPLY dbo.fnc_CommaSeparated(@VehicleClassFilterList)V 
			WHERE M.SystemVehicleClassId = V.DataValue
		)

	IF @VehicleSubClassFilterList<>'0'
		UPDATE #tempHeader SET SubVehicleClassNames=
		(
			SELECT STRING_AGG(F.FasTagVehicleClassName, ',') AS SystemVehicleClassNames
			FROM tbl_SystemVehicleSubClass M INNER JOIN tbl_FasTagVehicleClass F ON M.SystemVehicleSubClassId=F.FasTagVehicleClassId
			CROSS APPLY dbo.fnc_CommaSeparated(@VehicleSubClassFilterList)V 
			WHERE M.SystemVehicleSubClassId = V.DataValue
		)

	IF @TransactionTypeFilterList<>'0'
		UPDATE #tempHeader SET TransactionTypeNames=
		(
			SELECT STRING_AGG(TransactionTypeName, ',') AS TransactionTypeNames
			FROM tbl_TransactionTypeMaster M 
			CROSS APPLY dbo.fnc_CommaSeparated(@TransactionTypeFilterList)V 
			WHERE M.TransactionTypeId = V.DataValue
		)

	SELECT * FROM #tempHeader

	IF @ReportId =6
		BEGIN
			EXEC USP_AvcAccuracyReviewed @FilterQuery
		END
	else if @ReportId =7
		BEGIN
			EXEC USP_AvcAccuracyUnReviewed @FilterQuery
		END
	else if @ReportId =8
		EXEC('SELECT L.PlazaTransactionId AS [Transaction Id],LC.LaneNumber AS Lane,L.ShiftId AS Shift,L.PlateNumber AS [VRN],
		SV.SystemVehicleClassName AS [Vehicle Class],SSV.FasTagVehicleClassName AS [Sub Class],AVC.FasTagVehicleClassName AS [Avc Class],
		TTM.TransactionTypeName [MOP],CASE L.TransactionTypeId WHEN 2 THEN PTM.PaymentTypeName WHEN 3 THEN ETM.ExemptTypeName ELSE '''' END AS [Type],L.RCTNumber AS [Receipt /TID],FC.FasTagVehicleClassName AS [Tag Class],
		L.TagPlateNumber AS [Tag Plate],L.PermissibleVehicleWeight [Permissible WT],L.ActualVehicleWeight AS [Actual WT],
		L.OverWeightAmount AS[O/W Amount],L.TagPenaltyAmount AS [Tag Penalty Amount],L.TransactionAmount[Toll Fee],
		L.TransactionDateTime AS [Date Time],L.LoginId [TC Id],L.IsReturnJourney [Is Return],L.IsTowVehicle [Is Tow],
		L.IsFleetTranscation [Is Fleet],L.FleetCount [Fleet Count],TCRemark [TC Remark],U.LoginId AS [Reviewer Id] ,ReviewedRemark [Reviewer Remark]
		FROM tbl_LaneTransaction L
		LEFT JOIN tbl_SystemIntegratorConfiguration SI ON L.SystemIntegratorId=SI.SystemIntegratorId
		LEFT JOIN tbl_PlazaConfiguration PC ON L.PlazaId=PC.PlazaId
		LEFT JOIN tbl_JourneyMaster JM ON L.JourneyId=JM.JourneyId
		LEFT JOIN tbl_LaneConfiguration LC ON L.LaneId=LC.LaneId
		LEFT JOIN tbl_SystemVehicleClass SV ON L.VehicleClassId=SV.SystemVehicleClassId
		LEFT JOIN tbl_FasTagVehicleClass SSV ON L.VehicleSubClassId=SSV.FasTagVehicleClassId
		LEFT JOIN tbl_FasTagVehicleClass AVC ON L.VehicleAvcClassId=AVC.FasTagVehicleClassId
		LEFT JOIN tbl_TransactionTypeMaster TTM ON L.TransactionTypeId=TTM.TransactionTypeId
		LEFT JOIN tbl_PaymentTypeMaster PTM ON L.PaymentTypeId=PTM.PaymentTypeId
		LEFT JOIN tbl_ExemptTypeMaster ETM ON L.ExemptTypeId=ETM.ExemptTypeId
		LEFT JOIN tbl_FasTagVehicleClass FC ON L.TagClassId=FC.FasTagVehicleClassId
		LEFT JOIN tbl_FasTagVehicleClass RFC ON L.ReviewedSubClassId=RFC.FasTagVehicleClassId
		LEFT JOIN tbl_TransactionTypeMaster RTTM ON L.ReviewedTransactionTypeId=RTTM.TransactionTypeId
		LEFT JOIN tbl_UserMaster U ON L.ReviewedById=U.UserId
		LEFT JOIN tbl_ClassCorrectionMaster CC ON L.ReviewedClassCorrectionId=CC.ClassCorrectionId
		'+@FilterQuery+' AND ISNULL(L.TransactionStatus,1)=0 ORDER BY TransactionDateTime DESC')

	else if @ReportId=11
	BEGIN
		WHILE @CurrentDate <= @EndDate
		BEGIN
			SET @CurrentDateString=FORMAT(@CurrentDate, 'dd-MMM-yyyy')
			EXEC USP_GetReportConsolidatedRevenue @CurrentDateString,'1,2'
			SET @CurrentDate = DATEADD(day, 1, @CurrentDate)
		END
	END

	else if @ReportId=13
	BEGIN
		WHILE @CurrentDate <= @EndDate
		BEGIN
			SET @CurrentDateString=FORMAT(@CurrentDate, 'dd-MMM-yyyy')
			EXEC USP_GetReportConsolidatedRevenue @CurrentDateString,'1'
			SET @CurrentDate = DATEADD(day, 1, @CurrentDate)
		END
	END

	else if @ReportId=16
	BEGIN
		WHILE @CurrentDate <= @EndDate
		BEGIN
			SET @CurrentDateString=FORMAT(@CurrentDate, 'dd-MMM-yyyy')
			EXEC USP_GetReportOverWeightTrafficRevenue @CurrentDateString
			SET @CurrentDate = DATEADD(day, 1, @CurrentDate)
		END
	END

	else if @ReportId=20
		EXEC('SELECT L.PlazaTransactionId AS [Transaction Id],LC.LaneNumber AS Lane,L.ShiftId AS Shift,L.PlateNumber AS [VRN],
		SV.SystemVehicleClassName AS [Vehicle Class],SSV.FasTagVehicleClassName AS [Sub Class],AVC.FasTagVehicleClassName AS [Avc Class],
		L.RCTNumber AS [TID],L.TagEPC [EPC],FC.FasTagVehicleClassName AS [Tag Class],
		L.TagPlateNumber AS [Tag Plate],L.PermissibleVehicleWeight [Permissible WT],L.ActualVehicleWeight AS [Actual WT],
		L.OverWeightAmount AS[O/W Amount],L.TransactionAmount[Toll Fee],L.TransactionDateTime AS [Date Time],
		L.LoginId [TC Id],L.IsReturnJourney [Is Return],L.IsTowVehicle [Is Tow],
		L.IsFleetTranscation [Is Fleet],L.FleetCount [Fleet Count],
		ISNULL(L.TransactionStatus,1) AS [Status],
		TCRemark [TC Remark]
		FROM tbl_LaneTransaction L
		LEFT JOIN tbl_SystemIntegratorConfiguration SI ON L.SystemIntegratorId=SI.SystemIntegratorId
		LEFT JOIN tbl_PlazaConfiguration PC ON L.PlazaId=PC.PlazaId
		LEFT JOIN tbl_JourneyMaster JM ON L.JourneyId=JM.JourneyId
		LEFT JOIN tbl_LaneConfiguration LC ON L.LaneId=LC.LaneId
		LEFT JOIN tbl_SystemVehicleClass SV ON L.VehicleClassId=SV.SystemVehicleClassId
		LEFT JOIN tbl_FasTagVehicleClass SSV ON L.VehicleSubClassId=SSV.FasTagVehicleClassId
		LEFT JOIN tbl_FasTagVehicleClass AVC ON L.VehicleAvcClassId=AVC.FasTagVehicleClassId
		LEFT JOIN tbl_TransactionTypeMaster TTM ON L.TransactionTypeId=TTM.TransactionTypeId
		LEFT JOIN tbl_PaymentTypeMaster PTM ON L.PaymentTypeId=PTM.PaymentTypeId
		LEFT JOIN tbl_ExemptTypeMaster ETM ON L.ExemptTypeId=ETM.ExemptTypeId
		LEFT JOIN tbl_FasTagVehicleClass FC ON L.TagClassId=FC.FasTagVehicleClassId
		LEFT JOIN tbl_FasTagVehicleClass RFC ON L.ReviewedSubClassId=RFC.FasTagVehicleClassId
		LEFT JOIN tbl_TransactionTypeMaster RTTM ON L.ReviewedTransactionTypeId=RTTM.TransactionTypeId
		LEFT JOIN tbl_UserMaster U ON L.ReviewedById=U.UserId
		LEFT JOIN tbl_ClassCorrectionMaster CC ON L.ReviewedClassCorrectionId=CC.ClassCorrectionId
		'+@FilterQuery+' ORDER BY TransactionDateTime DESC')
	else if @ReportId =22
		EXEC('SELECT L.PlazaTransactionId AS [Transaction Id],LC.LaneNumber AS Lane,L.ShiftId AS Shift,L.PlateNumber AS [Plate Number],
		SV.SystemVehicleClassName AS [Vehicle Class],SSV.FasTagVehicleClassName AS [Sub Class],AVC.FasTagVehicleClassName AS [Avc Class],
		ETM.ExemptTypeName AS [Exempt],TCRemark [TC Remark],L.PermissibleVehicleWeight [Permissible WT],L.ActualVehicleWeight AS [Actual WT],
		L.TransactionDateTime AS [Date Time],L.LoginId [TC Id],
		CASE ISNULL(L.TransactionStatus,1) WHEN 1 THEN ''Active'' ELSE ''Cancel'' END AS [Status]
		FROM tbl_LaneTransaction L
		LEFT JOIN tbl_SystemIntegratorConfiguration SI ON L.SystemIntegratorId=SI.SystemIntegratorId
		LEFT JOIN tbl_PlazaConfiguration PC ON L.PlazaId=PC.PlazaId
		LEFT JOIN tbl_JourneyMaster JM ON L.JourneyId=JM.JourneyId
		LEFT JOIN tbl_LaneConfiguration LC ON L.LaneId=LC.LaneId
		LEFT JOIN tbl_SystemVehicleClass SV ON L.VehicleClassId=SV.SystemVehicleClassId
		LEFT JOIN tbl_FasTagVehicleClass SSV ON L.VehicleSubClassId=SSV.FasTagVehicleClassId
		LEFT JOIN tbl_FasTagVehicleClass AVC ON L.VehicleAvcClassId=AVC.FasTagVehicleClassId
		LEFT JOIN tbl_TransactionTypeMaster TTM ON L.TransactionTypeId=TTM.TransactionTypeId
		LEFT JOIN tbl_PaymentTypeMaster PTM ON L.PaymentTypeId=PTM.PaymentTypeId
		LEFT JOIN tbl_ExemptTypeMaster ETM ON L.ExemptTypeId=ETM.ExemptTypeId
		LEFT JOIN tbl_FasTagVehicleClass FC ON L.TagClassId=FC.FasTagVehicleClassId
		LEFT JOIN tbl_FasTagVehicleClass RFC ON L.ReviewedSubClassId=RFC.FasTagVehicleClassId
		LEFT JOIN tbl_TransactionTypeMaster RTTM ON L.ReviewedTransactionTypeId=RTTM.TransactionTypeId
		LEFT JOIN tbl_UserMaster U ON L.ReviewedById=U.UserId
		LEFT JOIN tbl_ClassCorrectionMaster CC ON L.ReviewedClassCorrectionId=CC.ClassCorrectionId
		'+@FilterQuery+' ORDER BY TransactionDateTime DESC')
	else if @ReportId=23
	BEGIN
		WHILE @CurrentDate <= @EndDate
		BEGIN
			SET @CurrentDateString=FORMAT(@CurrentDate, 'dd-MMM-yyyy')
			EXEC USP_GetReportExemptCount @CurrentDateString
			SET @CurrentDate = DATEADD(day, 1, @CurrentDate)
		END
	END
	else if @ReportId=27
	BEGIN
		WHILE @CurrentDate <= @EndDate
		BEGIN
			SET @CurrentDateString=FORMAT(@CurrentDate, 'dd-MMM-yyyy')
			EXEC USP_GetReportTransactionTrafficCount @CurrentDateString,@FilterQuery
			SET @CurrentDate = DATEADD(day, 1, @CurrentDate)
		END
	END
	else IF @ReportId =28
		EXEC('SELECT L.PlazaTransactionId AS [Transaction Id],LC.LaneNumber AS Lane,L.ShiftId AS Shift,L.PlateNumber AS [VRN],
		SV.SystemVehicleClassName AS [Vehicle Class],SSV.FasTagVehicleClassName AS [Sub Class],AVC.FasTagVehicleClassName AS [Avc Class],
		TTM.TransactionTypeName [MOP],CASE L.TransactionTypeId WHEN 2 THEN PTM.PaymentTypeName WHEN 3 THEN ETM.ExemptTypeName ELSE '''' END AS [Type],L.RCTNumber AS [Receipt /TID],FC.FasTagVehicleClassName AS [Tag Class],
		L.TagPlateNumber AS [Tag Plate],L.PermissibleVehicleWeight [Permissible WT],L.ActualVehicleWeight AS [Actual WT],
		L.OverWeightAmount AS[O/W Amount],L.TagPenaltyAmount AS [Tag Penalty Amount],L.TransactionAmount[Toll Fee],
		L.TransactionDateTime AS [Date Time],L.LoginId [TC Id],L.IsReturnJourney [Is Return],L.IsTowVehicle [Is Tow],
		L.IsFleetTranscation [Is Fleet],L.FleetCount [Fleet Count],
		CASE ISNULL(L.TransactionStatus,1) WHEN 1 THEN ''Active'' ELSE ''Cancel'' END AS [Status],
		TCRemark [TC Remark]
		FROM tbl_LaneTransaction L
		LEFT JOIN tbl_SystemIntegratorConfiguration SI ON L.SystemIntegratorId=SI.SystemIntegratorId
		LEFT JOIN tbl_PlazaConfiguration PC ON L.PlazaId=PC.PlazaId
		LEFT JOIN tbl_JourneyMaster JM ON L.JourneyId=JM.JourneyId
		LEFT JOIN tbl_LaneConfiguration LC ON L.LaneId=LC.LaneId
		LEFT JOIN tbl_SystemVehicleClass SV ON L.VehicleClassId=SV.SystemVehicleClassId
		LEFT JOIN tbl_FasTagVehicleClass SSV ON L.VehicleSubClassId=SSV.FasTagVehicleClassId
		LEFT JOIN tbl_FasTagVehicleClass AVC ON L.VehicleAvcClassId=AVC.FasTagVehicleClassId
		LEFT JOIN tbl_TransactionTypeMaster TTM ON L.TransactionTypeId=TTM.TransactionTypeId
		LEFT JOIN tbl_PaymentTypeMaster PTM ON L.PaymentTypeId=PTM.PaymentTypeId
		LEFT JOIN tbl_ExemptTypeMaster ETM ON L.ExemptTypeId=ETM.ExemptTypeId
		LEFT JOIN tbl_FasTagVehicleClass FC ON L.TagClassId=FC.FasTagVehicleClassId
		LEFT JOIN tbl_FasTagVehicleClass RFC ON L.ReviewedSubClassId=RFC.FasTagVehicleClassId
		LEFT JOIN tbl_TransactionTypeMaster RTTM ON L.ReviewedTransactionTypeId=RTTM.TransactionTypeId
		LEFT JOIN tbl_UserMaster U ON L.ReviewedById=U.UserId
		LEFT JOIN tbl_ClassCorrectionMaster CC ON L.ReviewedClassCorrectionId=CC.ClassCorrectionId
		'+@FilterQuery+' ORDER BY TransactionDateTime DESC')
	
	else if @ReportId =30
		EXEC('SELECT L.PlazaTransactionId AS [Transaction Id],LC.LaneNumber AS Lane,L.ShiftId AS Shift,L.PlateNumber AS [Plate Number],
		SV.SystemVehicleClassName AS [Vehicle Class],SSV.FasTagVehicleClassName AS [Sub Class],AVC.FasTagVehicleClassName AS [Avc Class],
		TTM.TransactionTypeName [Transaction Type],L.PermissibleVehicleWeight [Permissible WT],
		L.ActualVehicleWeight AS [Actual WT],L.PermissibleVehicleWeight-L.ActualVehicleWeight AS [Access Weight],OverWeightAmount [Over Weight Amount],
		L.TransactionDateTime AS [Date Time],L.LoginId [TC Id],
		CASE ISNULL(L.TransactionStatus,1) WHEN 1 THEN ''Active'' ELSE ''Cancel'' END AS [Status]
		FROM tbl_LaneTransaction L
		LEFT JOIN tbl_SystemIntegratorConfiguration SI ON L.SystemIntegratorId=SI.SystemIntegratorId
		LEFT JOIN tbl_PlazaConfiguration PC ON L.PlazaId=PC.PlazaId
		LEFT JOIN tbl_JourneyMaster JM ON L.JourneyId=JM.JourneyId
		LEFT JOIN tbl_LaneConfiguration LC ON L.LaneId=LC.LaneId
		LEFT JOIN tbl_SystemVehicleClass SV ON L.VehicleClassId=SV.SystemVehicleClassId
		LEFT JOIN tbl_FasTagVehicleClass SSV ON L.VehicleSubClassId=SSV.FasTagVehicleClassId
		LEFT JOIN tbl_FasTagVehicleClass AVC ON L.VehicleAvcClassId=AVC.FasTagVehicleClassId
		LEFT JOIN tbl_TransactionTypeMaster TTM ON L.TransactionTypeId=TTM.TransactionTypeId
		LEFT JOIN tbl_PaymentTypeMaster PTM ON L.PaymentTypeId=PTM.PaymentTypeId
		LEFT JOIN tbl_ExemptTypeMaster ETM ON L.ExemptTypeId=ETM.ExemptTypeId
		LEFT JOIN tbl_FasTagVehicleClass FC ON L.TagClassId=FC.FasTagVehicleClassId
		LEFT JOIN tbl_FasTagVehicleClass RFC ON L.ReviewedSubClassId=RFC.FasTagVehicleClassId
		LEFT JOIN tbl_TransactionTypeMaster RTTM ON L.ReviewedTransactionTypeId=RTTM.TransactionTypeId
		LEFT JOIN tbl_UserMaster U ON L.ReviewedById=U.UserId
		LEFT JOIN tbl_ClassCorrectionMaster CC ON L.ReviewedClassCorrectionId=CC.ClassCorrectionId
		'+@FilterQuery+' ORDER BY TransactionDateTime DESC')
	else if @ReportId=31
	BEGIN
		WHILE @CurrentDate <= @EndDate
		BEGIN
			SET @CurrentDateString=FORMAT(@CurrentDate, 'dd-MMM-yyyy')
			EXEC USP_GetReportOverWeightTrafficCount @CurrentDateString
			SET @CurrentDate = DATEADD(day, 1, @CurrentDate)
		END
	END
	else if @ReportId =32
	BEGIN
		EXEC('SELECT L.PlazaTransactionId AS [Transaction Id],LC.LaneNumber AS Lane,L.ShiftId AS Shift,L.PlateNumber AS [VRN],
		SV.SystemVehicleClassName AS [Vehicle Class],
		SSV.FasTagVehicleClassName AS [Sub Class],
		AVC.FasTagVehicleClassName AS [Avc Class],
		FC.FasTagVehicleClassName AS [Tag Class],
		TTM.TransactionTypeName [MOP],
		L.TransactionDateTime AS [Date Time],L.LoginId [TC Id],
		CASE ISNULL(L.TransactionStatus,1) WHEN 1 THEN ''Active'' ELSE ''Cancel'' END AS [Status],
		TCRemark [TC Remark]
		FROM tbl_LaneTransaction L
		LEFT JOIN tbl_SystemIntegratorConfiguration SI ON L.SystemIntegratorId=SI.SystemIntegratorId
		LEFT JOIN tbl_PlazaConfiguration PC ON L.PlazaId=PC.PlazaId
		LEFT JOIN tbl_JourneyMaster JM ON L.JourneyId=JM.JourneyId
		LEFT JOIN tbl_LaneConfiguration LC ON L.LaneId=LC.LaneId
		LEFT JOIN tbl_SystemVehicleClass SV ON L.VehicleClassId=SV.SystemVehicleClassId
		LEFT JOIN tbl_FasTagVehicleClass SSV ON L.VehicleSubClassId=SSV.FasTagVehicleClassId
		LEFT JOIN tbl_FasTagVehicleClass AVC ON L.VehicleAvcClassId=AVC.FasTagVehicleClassId
		LEFT JOIN tbl_TransactionTypeMaster TTM ON L.TransactionTypeId=TTM.TransactionTypeId
		LEFT JOIN tbl_PaymentTypeMaster PTM ON L.PaymentTypeId=PTM.PaymentTypeId
		LEFT JOIN tbl_ExemptTypeMaster ETM ON L.ExemptTypeId=ETM.ExemptTypeId
		LEFT JOIN tbl_FasTagVehicleClass FC ON L.TagClassId=FC.FasTagVehicleClassId
		LEFT JOIN tbl_FasTagVehicleClass RFC ON L.ReviewedSubClassId=RFC.FasTagVehicleClassId
		LEFT JOIN tbl_TransactionTypeMaster RTTM ON L.ReviewedTransactionTypeId=RTTM.TransactionTypeId
		LEFT JOIN tbl_UserMaster U ON L.ReviewedById=U.UserId
		LEFT JOIN tbl_ClassCorrectionMaster CC ON L.ReviewedClassCorrectionId=CC.ClassCorrectionId
		'+@FilterQuery+' AND L.VehicleClassId <> L.VehicleAvcClassId ORDER BY TransactionDateTime DESC')
	END	
	else if @ReportId=33
	BEGIN
		SET @CurrentDateString=FORMAT(@StartDate, 'dd-MMM-yyyy')
		EXEC USP_MISReport @CurrentDateString
	END
END

--GO 
--EXEC USP_GetReportData
--@CategoryId=4,
--@ReportId=27,
--@StartDateTime='03-Jan-2025 12:12:12',
--@EndDateTime='03-Jan-2025 13:26:03',
--@ShiftFilterList='2',
--@FilterQuery='WHERE CONVERT(DATE,L.TransactionDateTime) >= CONVERT(DATE,''03-Jan-2025 23:38:50'') AND CONVERT(DATE,L.TransactionDateTime) <= CONVERT(DATE,''03-Jan-2025 23:38:50'') AND L.ShiftId IN (2)'
GO
/****** Object:  StoredProcedure [dbo].[USP_GetReportExemptCount]    Script Date: 07-Jan-25 9:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_GetReportExemptCount]
(@TDate VARCHAR(20))
AS 
BEGIN
    DECLARE @columns NVARCHAR(MAX), @sql NVARCHAR(MAX), @Scolumns NVARCHAR(MAX);

    SET @columns = 
    (
        SELECT DISTINCT QUOTENAME(SystemVehicleClassName) + ',' 
        FROM tbl_SystemVehicleClass 
        WHERE DataStatus=1
        FOR XML PATH('')
    );

    SET @Scolumns = 
    (
        SELECT DISTINCT QUOTENAME(SystemVehicleClassName) + '+' 
        FROM tbl_SystemVehicleClass 
        WHERE DataStatus=1
        FOR XML PATH('')
    );

    SET @columns = LEFT(@columns, LEN(@columns) - 1);
    SET @Scolumns = LEFT(@Scolumns, LEN(@Scolumns) - 1);

    SET @sql = '
    SELECT 
       ''' + @TDate + ''' AS TDate ,[Exempt Type], ' + @columns + ', Total
    FROM 
        (
            SELECT 
                ETM.ExemptTypeName AS [Exempt Type], 
                SVC.SystemVehicleClassName,
                COUNT(LT.VehicleClassId) AS [Count]
            FROM 
                tbl_ExemptTypeMaster ETM
            CROSS JOIN tbl_SystemVehicleClass SVC
            LEFT JOIN tbl_LaneTransaction LT ON LT.ExemptTypeId = ETM.ExemptTypeId AND LT.VehicleClassId = SVC.SystemVehicleClassId
            AND LT.TransactionTypeId =3 AND CONVERT(date,LT.TransactionDateTime)=CONVERT(date,''' + @TDate + ''') 
            WHERE ETM.DataStatus=1 
            GROUP BY 
                ETM.ExemptTypeName, SVC.SystemVehicleClassName
        ) AS SourceTable
    PIVOT 
        (
            SUM([Count]) FOR SystemVehicleClassName IN (' + @columns + ')
        ) AS PivotTable
    CROSS APPLY (
        SELECT SUM(cnt) AS Total
        FROM (VALUES (' + @Scolumns + ')) AS X(cnt)
    ) AS TotalColumns;';

    EXEC sp_executesql @sql;
END
GO
/****** Object:  StoredProcedure [dbo].[USP_GetReportOverWeightTrafficCount]    Script Date: 07-Jan-25 9:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_GetReportOverWeightTrafficCount]
(@TDate VARCHAR(20))
AS 
BEGIN
    DECLARE @columns NVARCHAR(MAX), @sql NVARCHAR(MAX), @Scolumns NVARCHAR(MAX);

    SET @columns = 
    (
        SELECT QUOTENAME(SystemVehicleClassName) + ',' 
        FROM tbl_SystemVehicleClass 
        WHERE DataStatus=1 ORDER BY SystemVehicleClassId
        FOR XML PATH('')
    );

    SET @Scolumns = 
    (
        SELECT QUOTENAME(SystemVehicleClassName) + '+' 
        FROM tbl_SystemVehicleClass 
        WHERE DataStatus=1 ORDER BY SystemVehicleClassId
        FOR XML PATH('')
    );

    SET @columns = LEFT(@columns, LEN(@columns) - 1);
    SET @Scolumns = LEFT(@Scolumns, LEN(@Scolumns) - 1);

    SET @sql = '
    SELECT 
       ''' + @TDate + ''' AS TDate ,[Lane], ' + @columns + ', Total
    FROM 
        (
             SELECT 
                LC.LaneName AS [Lane], 
                SVC.SystemVehicleClassName,
                COUNT(LT.VehicleClassId) AS [Count]
            FROM 
                tbl_LaneConfiguration LC
            CROSS JOIN tbl_SystemVehicleClass SVC
            LEFT JOIN 
			tbl_LaneTransaction LT ON 
			LT.LaneId = LC.LaneId AND
			LT.VehicleClassId = SVC.SystemVehicleClassId AND 
			ISNULL(LT.VehicleClassId,0)>0 AND 
			ISNULL(LT.VehicleClassId,0)<21 AND 
			CONVERT(date,LT.TransactionDateTime)=CONVERT(date,''' + @TDate + ''') 
            GROUP BY 
                LC.LaneName, SVC.SystemVehicleClassName
        ) AS SourceTable
    PIVOT 
        (
            SUM([Count]) FOR SystemVehicleClassName IN (' + @columns + ')
        ) AS PivotTable
    CROSS APPLY (
        SELECT SUM(cnt) AS Total
        FROM (VALUES (' + @Scolumns + ')) AS X(cnt)
    ) AS TotalColumns;';

    EXEC sp_executesql @sql;
END
--GO
--EXEC USP_GetReportOverWeightTrafficCount '01-Jun-2024'
GO
/****** Object:  StoredProcedure [dbo].[USP_GetReportOverWeightTrafficRevenue]    Script Date: 07-Jan-25 9:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_GetReportOverWeightTrafficRevenue]
(@TDate VARCHAR(20))
AS 
BEGIN
    DECLARE @columns NVARCHAR(MAX), @Scolumns NVARCHAR(MAX),@Dcolumns NVARCHAR(MAX), @sql NVARCHAR(MAX);

    SET @columns = 
    (
        SELECT QUOTENAME(SystemVehicleClassName) + ',' 
        FROM tbl_SystemVehicleClass 
        WHERE DataStatus=1 ORDER BY SystemVehicleClassId
        FOR XML PATH('')
    );
	SET @Dcolumns = 
		(
			SELECT 'ISNULL('+QUOTENAME(SystemVehicleClassName) + ',0) AS'+QUOTENAME(SystemVehicleClassName+' (amount)') +' ,' 
			FROM tbl_SystemVehicleClass 
			WHERE DataStatus=1 ORDER BY SystemVehicleClassId
			FOR XML PATH('')
		);
    

	SET @Scolumns = 
	(
		SELECT 'ISNULL('+QUOTENAME(SystemVehicleClassName) + ',0)+' 
		FROM tbl_SystemVehicleClass 
		WHERE DataStatus=1 ORDER BY SystemVehicleClassId
		FOR XML PATH('')
	);


    SET @columns = LEFT(@columns, LEN(@columns) - 1);
    SET @Dcolumns = LEFT(@Dcolumns, LEN(@Dcolumns) - 1);
    SET @Scolumns = LEFT(@Scolumns, LEN(@Scolumns) - 1);

    SET @sql = '
    SELECT 
       ''' + @TDate + ''' AS TDate ,[Lane], ' + @Dcolumns + ', ISNULL(Total,0) AS [Total (amount)]
    FROM 
        (
             SELECT 
                LC.LaneName AS [Lane], 
                SVC.SystemVehicleClassName,
                SUM(LT.OverWeightAmount) AS [Total]
            FROM 
                tbl_LaneConfiguration LC
            CROSS JOIN tbl_SystemVehicleClass SVC
            LEFT JOIN 
			tbl_LaneTransaction LT ON 
			LT.LaneId = LC.LaneId AND
			LT.VehicleClassId = SVC.SystemVehicleClassId AND 
			ISNULL(LT.VehicleClassId,0)>0 AND ISNULL(LT.VehicleClassId,0)<21 AND 
			CONVERT(date,LT.TransactionDateTime)=CONVERT(date,''' + @TDate + ''') AND LT.IsOverWeightCharged=1
            GROUP BY 
                LC.LaneName, SVC.SystemVehicleClassName
        ) AS SourceTable
    PIVOT 
        (
            SUM([Total]) FOR SystemVehicleClassName IN (' + @columns + ')
        ) AS PivotTable
    CROSS APPLY (
        SELECT SUM(cnt) AS Total
        FROM (VALUES (' + @Scolumns + ')) AS X(cnt)
    ) AS TotalColumns;';

    EXEC sp_executesql @sql;
END
--GO
--EXEC USP_GetReportOverWeightTrafficCount '01-Jun-2024'
GO
/****** Object:  StoredProcedure [dbo].[USP_GetReportTransactionTrafficCount]    Script Date: 07-Jan-25 9:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_GetReportTransactionTrafficCount]
(
@TDate VARCHAR(20),
@FilterQuery varchar(4000)='0'
)
AS 
BEGIN

	DECLARE @columns NVARCHAR(MAX), @PIVOTcolumns NVARCHAR(MAX),@Scolumns NVARCHAR(MAX), @sql NVARCHAR(MAX);
		SET @columns = 
		(
			SELECT 'ISNULL([' + SystemVehicleClassName + '], 0) AS [' + SystemVehicleClassName + '],' 
			FROM tbl_SystemVehicleClass 
			WHERE DataStatus = 1
			ORDER BY SystemVehicleClassId
			FOR XML PATH('')
		);
		
	SET @PIVOTcolumns = 
	(
		SELECT QUOTENAME(SystemVehicleClassName) + ',' 
		FROM tbl_SystemVehicleClass 
		WHERE DataStatus = 1
		ORDER BY SystemVehicleClassId
		FOR XML PATH('')
	);
	
	
    SET @Scolumns = 
	(
    SELECT 'ISNULL([' + SystemVehicleClassName + '], 0) + ' 
    FROM tbl_SystemVehicleClass 
    WHERE DataStatus = 1
    ORDER BY SystemVehicleClassId
    FOR XML PATH('')
	);


    SET @columns = LEFT(@columns, LEN(@columns) - 1);
    SET @PIVOTcolumns = LEFT(@PIVOTcolumns, LEN(@PIVOTcolumns) - 1);
	SET @Scolumns = LEFT(@Scolumns, LEN(@Scolumns) - 1);
	if @FilterQuery='0'
	BEGIN
		EXEC('
			SELECT 
			   ''' + @TDate + ''' AS TDate ,[Lane], ' + @columns + ',(' + @Scolumns + ') AS Total 
			FROM 
				(
					SELECT 
						LC.LaneName AS [Lane], 
						SVC.SystemVehicleClassName,
						COUNT(L.VehicleClassId) AS [Count]
					FROM 
						tbl_LaneConfiguration LC
					CROSS JOIN tbl_SystemVehicleClass SVC
					LEFT JOIN tbl_LaneTransaction L ON L.LaneId = LC.LaneId AND L.VehicleClassId = SVC.SystemVehicleClassId
					AND L.TransactionTypeId NOT IN (4) AND CONVERT(date,L.TransactionDateTime)=CONVERT(date,''' + @TDate + ''') 
					WHERE LC.DataStatus=1 
					GROUP BY 
						LC.LaneName, SVC.SystemVehicleClassName
				) AS SourceTable
			PIVOT 
				(
					SUM([Count]) FOR SystemVehicleClassName IN (' + @PIVOTcolumns + ')
				) AS PivotTable
			');
	END
	ELSE
	BEGIN
		EXEC('
			SELECT 
			   ''' + @TDate + ''' AS TDate ,[Lane], ' + @columns + ',(' + @Scolumns + ') AS Total 
			FROM 
				(
					SELECT 
						LC.LaneName AS [Lane], 
						SVC.SystemVehicleClassName,
						COUNT(L.VehicleClassId) AS [Count]
					FROM 
						tbl_LaneConfiguration LC
					CROSS JOIN tbl_SystemVehicleClass SVC
					LEFT JOIN tbl_LaneTransaction L ON L.LaneId = LC.LaneId AND L.VehicleClassId = SVC.SystemVehicleClassId
					AND L.TransactionTypeId NOT IN (4) AND CONVERT(date,L.TransactionDateTime)=CONVERT(date,''' + @TDate + ''') 
					'+@FilterQuery+' AND LC.DataStatus=1 
					GROUP BY 
						LC.LaneName, SVC.SystemVehicleClassName
				) AS SourceTable
			PIVOT 
				(
					SUM([Count]) FOR SystemVehicleClassName IN (' + @PIVOTcolumns + ')
				) AS PivotTable
			');
	END
    --EXEC sp_executesql @sql;
END

--GO 
--EXEC USP_GetReportTransactionTrafficCount
--@TDate='03-Jan-2025',
--@FilterQuery='WHERE CONVERT(DATE,L.TransactionDateTime) >= CONVERT(DATE,''03-Jan-2025 23:38:50'') AND CONVERT(DATE,L.TransactionDateTime) <= CONVERT(DATE,''03-Jan-2025 23:38:50'') AND L.ShiftId IN (2)'
GO
/****** Object:  StoredProcedure [dbo].[USP_GetReportTransactionTrafficCount_bkp]    Script Date: 07-Jan-25 9:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_GetReportTransactionTrafficCount_bkp]
(
@TDate VARCHAR(20),
@FilterQuery varchar(4000)='0'
)
AS 
BEGIN
    DECLARE @columns NVARCHAR(MAX), @sql NVARCHAR(MAX), @Scolumns NVARCHAR(MAX);

    SET @columns = 
    (
        SELECT QUOTENAME(SystemVehicleClassName) + ',' 
        FROM tbl_SystemVehicleClass 
        WHERE DataStatus=1 ORDER BY SystemVehicleClassId
        FOR XML PATH('')
    );

    SET @Scolumns = 
    (
       SELECT QUOTENAME(SystemVehicleClassName) + '+' 
        FROM tbl_SystemVehicleClass 
        WHERE DataStatus=1 ORDER BY SystemVehicleClassId
        FOR XML PATH('')
    );

    SET @columns = LEFT(@columns, LEN(@columns) - 1);
    SET @Scolumns = LEFT(@Scolumns, LEN(@Scolumns) - 1);
	if @FilterQuery='0'
	BEGIN
		SET @sql = '
    SELECT 
       ''' + @TDate + ''' AS TDate ,[Lane], ' + @columns + ',(' + @Scolumns + ') AS Total 
    FROM 
        (
            SELECT 
                LC.LaneName AS [Lane], 
                SVC.SystemVehicleClassName,
                COUNT(L.VehicleClassId) AS [Count]
            FROM 
                tbl_LaneConfiguration LC
            CROSS JOIN tbl_SystemVehicleClass SVC
            LEFT JOIN tbl_LaneTransaction L ON L.LaneId = LC.LaneId AND L.VehicleClassId = SVC.SystemVehicleClassId
            AND L.TransactionTypeId NOT IN (4) AND CONVERT(date,L.TransactionDateTime)=CONVERT(date,''' + @TDate + ''') 
            WHERE LC.DataStatus=1 
            GROUP BY 
                LC.LaneName, SVC.SystemVehicleClassName
        ) AS SourceTable
    PIVOT 
        (
            SUM([Count]) FOR SystemVehicleClassName IN (' + @columns + ')
        ) AS PivotTable
    ';
	END
	ELSE
	BEGIN
		SET @sql = '
    SELECT 
       ''' + @TDate + ''' AS TDate ,[Lane], ' + @columns + ',(' + @Scolumns + ') AS Total 
    FROM 
        (
            SELECT 
                LC.LaneName AS [Lane], 
                SVC.SystemVehicleClassName,
                COUNT(L.VehicleClassId) AS [Count]
            FROM 
                tbl_LaneConfiguration LC
            CROSS JOIN tbl_SystemVehicleClass SVC
            LEFT JOIN tbl_LaneTransaction L ON L.LaneId = LC.LaneId AND L.VehicleClassId = SVC.SystemVehicleClassId
            AND L.TransactionTypeId NOT IN (4) AND CONVERT(date,L.TransactionDateTime)=CONVERT(date,''' + @TDate + ''') 
            '+@FilterQuery+' AND LC.DataStatus=1 
            GROUP BY 
                LC.LaneName, SVC.SystemVehicleClassName
        ) AS SourceTable
    PIVOT 
        (
            SUM([Count]) FOR SystemVehicleClassName IN (' + @columns + ')
        ) AS PivotTable
    ';
	END
	--print(@sql)
    EXEC sp_executesql @sql;
END

GO
/****** Object:  StoredProcedure [dbo].[USP_ICDNotificationInsert]    Script Date: 07-Jan-25 9:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_ICDNotificationInsert]
(
@MessageId varchar(35),
@NotificationDateTime dateTime,
@NotificationTypeId smallint,
@NotificationResult smallint,
@NPCIErrCode smallint,
@VehicleTID varchar(50),
@VehicleTagId varchar(50),
@VehicleClass smallint,
@RegNumber varchar(20),
@IsComVehicle bit,
@TollFare decimal(18,2),
@TollFareTypeId smallint
)
AS BEGIN
	SET NOCOUNT ON;   
	CREATE TABLE #Temp(AlertMessage varchar(100))
	BEGIN TRY
		INSERT INTO tbl_ICDNotification(MessageId,NotificationDateTime,NotificationTypeId,NotificationResult,
		NPCIErrCode,VehicleTID,VehicleTagId,VehicleClass,RegNumber,IsComVehicle,TollFare,TollFareTypeId)
		VALUES(@MessageId,@NotificationDateTime,@NotificationTypeId,@NotificationResult,
		@NPCIErrCode,@VehicleTID,@VehicleTagId,@VehicleClass,@RegNumber,@IsComVehicle,@TollFare,@TollFareTypeId)
		INSERT INTO #Temp(AlertMessage)VALUES('success');
	END TRY    
	BEGIN CATCH 
		INSERT INTO #Temp(AlertMessage)VALUES('failed');
		EXECUTE USP_ErrorInfoInsert;  
	END CATCH;
		select * from #Temp;
END
GO
/****** Object:  StoredProcedure [dbo].[USP_ICDPlazaGetAll]    Script Date: 07-Jan-25 9:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_ICDPlazaGetAll] 

AS
BEGIN
	Select * from tbl_PlazaConfiguration 
	WHERE DataStatus=1	
END


GO
/****** Object:  StoredProcedure [dbo].[USP_ICDPlazaGetById]    Script Date: 07-Jan-25 9:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_ICDPlazaGetById] 
@PlazaId smallint
AS
BEGIN
	Select * from tbl_PlazaConfiguration 
	WHERE PlazaId=@PlazaId	
END


GO
/****** Object:  StoredProcedure [dbo].[USP_ICDPlazaInsertUpdate]    Script Date: 07-Jan-25 9:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_ICDPlazaInsertUpdate] 
@PlazaId int,
@PlazaType varchar(50),
@PlazaSubType varchar(50),
@PlazaZoneId varchar(50),
@PlazaAgencyCode varchar(100),
@PlazaAcquirerId int,
@OrganizationId varchar(4),
@IsProducation bit,
@CertificateName varchar(250),
@CertificatePassword varchar(250),
@CreatedDate DateTime,
@CreatedBy bigint,
@ModifiedDate DateTime,
@ModifiedBy bigint

AS
BEGIN
	DECLARE @MenuId smallint=3;
	DECLARE @CVal nvarchar(4000)
	DECLARE @PVal nvarchar(4000)
	CREATE TABLE #Temp(AlertMessage varchar(100),AlertData varchar(8000))
	DECLARE @cnt int
	BEGIN TRY 
	SELECT @MenuId=MenuId FROM tbl_MenuMaster WHERE MenuUrl ='#PopUpIcdConfig'
	SELECT @cnt=COUNT(AlertMessage)  FROM #Temp
	IF(@cnt=0)
		BEGIN
			SET @PVal=(SELECT * FROM tbl_PlazaConfiguration WHERE PlazaId=@PlazaId FOR JSON AUTO, WITHOUT_ARRAY_WRAPPER)	
				
			UPDATE tbl_PlazaConfiguration SET CertificatePassword=@CertificatePassword,CertificateName=@CertificateName,
			IsProducation=@IsProducation,OrganizationId=@OrganizationId,PlazaAcquirerId=@PlazaAcquirerId,
			PlazaAgencyCode=@PlazaAgencyCode,PlazaZoneId=@PlazaZoneId,PlazaSubType=@PlazaSubType,PlazaType=@PlazaType,
			ModifiedDate=@ModifiedDate,ModifiedBy=@ModifiedBy
			WHERE PlazaId=@PlazaId
				
			SET @CVal=(SELECT * FROM tbl_PlazaConfiguration WHERE PlazaId=@PlazaId FOR JSON AUTO, WITHOUT_ARRAY_WRAPPER)		

			INSERT INTO tbl_ActivityLog(UserId,PrevColumn,CurrentColumn,ActionId,MenuId,CreatedDate)
			VALUES(@ModifiedBy,@PVal,@CVal,'Update',@MenuId,@ModifiedDate);

			INSERT INTO #Temp(AlertMessage,AlertData)VALUES('success',@CVal);
		END
		END TRY  
	BEGIN CATCH  
		INSERT INTO #Temp(AlertMessage)VALUES('failed');
		EXECUTE USP_ErrorInfoInsert;  
	END CATCH  
		select * from #Temp;
END


GO
/****** Object:  StoredProcedure [dbo].[USP_ICDRequestExceptionDetailGetLastRequest]    Script Date: 07-Jan-25 9:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_ICDRequestExceptionDetailGetLastRequest]
AS BEGIN
	SELECT RequestType,RequestCode,ISNULL(LastUpdatedDateTime, DATEADD(MINUTE, -3, GETDATE())) AS LastUpdatedDateTime
	FROM tbl_ICDQueryExceptionCodes
END
GO
/****** Object:  StoredProcedure [dbo].[USP_ICDRequestExceptionDetailUpdateRequest]    Script Date: 07-Jan-25 9:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_ICDRequestExceptionDetailUpdateRequest]
(
@RequestCode varchar(2),
@LastRequestedDateTime datetime,
@RequestStatusId bit
)

AS BEGIN
	CREATE TABLE #Temp(AlertMessage varchar(100))
	BEGIN TRY
			UPDATE tbl_ICDQueryExceptionCodes SET RequestStatusId=@RequestStatusId,
			LastRequestedDateTime=@LastRequestedDateTime
			WHERE RequestCode=@RequestCode
			INSERT INTO #Temp(AlertMessage)VALUES('success');	
	END TRY  
	BEGIN CATCH  
		INSERT INTO #Temp(AlertMessage)VALUES('failed');
		EXECUTE USP_ErrorInfoInsert;  
	END CATCH  
		select * from #Temp;
END
GO
/****** Object:  StoredProcedure [dbo].[USP_ICDRequestHeartBeatInsert]    Script Date: 07-Jan-25 9:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_ICDRequestHeartBeatInsert] 
@MessageId varchar(35),
@RequestDateTime datetime

AS
BEGIN
	CREATE TABLE #Temp(AlertMessage varchar(100),AlertData varchar(8000))
	BEGIN TRY
			INSERT INTO tbl_ICDRequestHeartBeatDetail(MessageId,RequestDateTime)
			VALUES(@MessageId,@RequestDateTime);
			INSERT INTO #Temp(AlertMessage,AlertData)VALUES('success',null);	
	END TRY  
	BEGIN CATCH  
		INSERT INTO #Temp(AlertMessage)VALUES('failed');
		EXECUTE USP_ErrorInfoInsert;  
	END CATCH  
		select * from #Temp;
END


GO
/****** Object:  StoredProcedure [dbo].[USP_ICDRequestHeartBeatUpdateRequest]    Script Date: 07-Jan-25 9:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_ICDRequestHeartBeatUpdateRequest] 
@MessageId varchar(35),
@RequestStatusId smallint

AS
BEGIN
	CREATE TABLE #Temp(AlertMessage varchar(100),AlertData varchar(8000))
	BEGIN TRY
			UPDATE tbl_ICDRequestHeartBeatDetail SET RequestStatusId=@RequestStatusId
			WHERE MessageId=@MessageId
			INSERT INTO #Temp(AlertMessage,AlertData)VALUES('success',null);	
	END TRY  
	BEGIN CATCH  
		INSERT INTO #Temp(AlertMessage)VALUES('failed');
		EXECUTE USP_ErrorInfoInsert;  
	END CATCH  
		select * from #Temp;
END
GO
/****** Object:  StoredProcedure [dbo].[USP_ICDRequestHeartBeatUpdateResponse]    Script Date: 07-Jan-25 9:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_ICDRequestHeartBeatUpdateResponse] 
@MessageId varchar(35),
@ResponseResult smallint,
@ResponseDateTime dateTime,
@ErrorCode int

AS
BEGIN
	CREATE TABLE #Temp(AlertMessage varchar(100),AlertData varchar(8000))
	BEGIN TRY
			UPDATE tbl_ICDRequestHeartBeatDetail SET ResponseResult=@ResponseResult,ResponseDateTime=@ResponseDateTime,
			ErrorCode=@ErrorCode
			WHERE MessageId=@MessageId
			INSERT INTO #Temp(AlertMessage,AlertData)VALUES('success',null);	
	END TRY  
	BEGIN CATCH  
		INSERT INTO #Temp(AlertMessage)VALUES('failed');
		EXECUTE USP_ErrorInfoInsert;  
	END CATCH  
		select * from #Temp;
END
GO
/****** Object:  StoredProcedure [dbo].[USP_ICDRequestPayGetPending]    Script Date: 07-Jan-25 9:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

    
CREATE PROCEDURE [dbo].[USP_ICDRequestPayGetPending]

AS    
BEGIN    
SET NOCOUNT ON;   

BEGIN TRY 
	SELECT TOP 1 R.PlazaTransactionId,MessageId,TransactionId,Note,RefId,RefUrl,
	DATEADD(HOUR, -1, GETDATE()) AS TransactionDateTime, --T.TransactionDateTime,
	TransactionTypeName,
	DATEADD(HOUR, -1, GETDATE()) AS TagReadDateTime, --T.TagReadDateTime,
	P.Latitude,P.Longitude,P.PlazaZoneId,P.PlazaName,P.OrganizationId,P.PlazaType,P.PlazaSubType,1 AS TxnCounter,L.LaneId AS ReaderId,
	T.LaneId,L.LaneCode,LD.LaneDirectionCode,LS.LaneStatusName,LM.LaneModeName,LT.LaneTypeName,L.LaneGateId,
	L.LaneFloorId,ReaderSignAuth,ReaderTagVerified,ReaderProcRestrictionResult,ReaderVehicleAuth,
	CASE T.TransactionStatus WHEN 1 THEN 'SUCCESS' ELSE 'FAILED' END AS LaneTransactionStatus,
	ReaderPublicKeyCVV,T.RCTNumber AS TID,T.TagPlateNumber,T.TagClassId,T.TagEPC,T.PermissibleVehicleWeight,T.ActualVehicleWeight,
	T.VehicleAvcClassId,T.PlateNumber,T.TransactionAmount,PaymentMode,IsOverWeightCharged,T.OverWeightAmount,OverwightPaymentMode
	FROM tbl_ICDRequestPayDetail R 
	INNER JOIN tbl_LaneTransaction T ON R.PlazaTransactionId=T.PlazaTransactionId	
	INNER JOIN tbl_PlazaConfiguration P ON T.PlazaId=P.PlazaId	
	INNER JOIN tbl_LaneConfiguration L ON T.LaneId=L.LaneId	
	INNER JOIN tbl_LaneDirectionMaster LD ON L.LaneDirectionId=LD.LaneDirectionId	
	INNER JOIN tbl_LaneStatusMaster LS ON T.LaneStatusId=LS.LaneStatusId
	INNER JOIN tbl_LaneModeMaster LM ON T.LaneModeId=LM.LaneModeId
	INNER JOIN tbl_LaneTypeMaster LT ON L.LaneTypeId=LT.LaneTypeId
	WHERE R.RequestStatusId=0 
	--AND T.TagReadDateTime BETWEEN DATEADD(HOUR, -48, GETDATE()) AND GETDATE()
	ORDER BY T.TagReadDateTime;
END TRY    
Begin CATCH 
	EXECUTE USP_ErrorInfoInsert;  
END CATCH;
END  
--GO 
--EXEC [USP_ICDRequestPayGetPending]
GO
/****** Object:  StoredProcedure [dbo].[USP_ICDRequestPayGetPendingStatus]    Script Date: 07-Jan-25 9:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_ICDRequestPayGetPendingStatus]

AS    
BEGIN    
SET NOCOUNT ON;   

BEGIN TRY 
	SELECT R.PlazaTransactionId,MessageId,TransactionId,Note,RefId,RefUrl,
	T.TransactionDateTime,
	TransactionTypeName,
	T.TagReadDateTime,
	P.Latitude,P.Longitude,P.PlazaZoneId,P.PlazaName,P.OrganizationId,P.PlazaType,P.PlazaSubType,1 AS TxnCounter,1 AS ReaderId,
	T.LaneId,L.LaneCode,LD.LaneDirectionCode,LS.LaneStatusName,LM.LaneModeName,LT.LaneTypeName,L.LaneGateId,
	L.LaneFloorId,ReaderSignAuth,ReaderTagVerified,ReaderProcRestrictionResult,ReaderVehicleAuth,
	CASE T.TransactionStatus WHEN 1 THEN 'SUCCESS' ELSE 'FAILED' END AS LaneTransactionStatus,
	ReaderPublicKeyCVV,T.RCTNumber AS TID,T.TagPlateNumber,T.TagClassId,T.TagEPC,T.PermissibleVehicleWeight,T.ActualVehicleWeight,
	T.VehicleAvcClassId,T.PlateNumber,T.TransactionAmount,PaymentMode,IsOverWeightCharged,T.OverWeightAmount,OverwightPaymentMode
	FROM tbl_ICDRequestPayDetail R 
	INNER JOIN tbl_LaneTransaction T ON R.PlazaTransactionId=T.PlazaTransactionId	
	INNER JOIN tbl_PlazaConfiguration P ON T.PlazaId=P.PlazaId	
	INNER JOIN tbl_LaneConfiguration L ON T.LaneId=L.LaneId	
	INNER JOIN tbl_LaneDirectionMaster LD ON L.LaneDirectionId=LD.LaneDirectionId	
	INNER JOIN tbl_LaneStatusMaster LS ON T.LaneStatusId=LS.LaneStatusId
	INNER JOIN tbl_LaneModeMaster LM ON T.LaneModeId=LM.LaneModeId
	INNER JOIN tbl_LaneTypeMaster LT ON L.LaneTypeId=LT.LaneTypeId
	WHERE R.ResponseResult=3 
	ORDER BY T.TagReadDateTime;
END TRY    
Begin CATCH 
	EXECUTE USP_ErrorInfoInsert;  
END CATCH;
END  
--GO 
--EXEC [USP_ICDRequestPayGetPending]
GO
/****** Object:  StoredProcedure [dbo].[USP_ICDRequestPayUpdateRequest]    Script Date: 07-Jan-25 9:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

    
CREATE PROCEDURE [dbo].[USP_ICDRequestPayUpdateRequest]
@MessageId varchar(35),
@RequestStatusId smallint,
@RequestDateTime datetime
AS    
BEGIN    
SET NOCOUNT ON;   
CREATE TABLE #Temp(AlertMessage varchar(100))
BEGIN TRY 
	    UPDATE tbl_ICDRequestPayDetail SET RequestDateTime=@RequestDateTime,RequestStatusId=@RequestStatusId
		WHERE MessageId=@MessageId
		INSERT INTO #Temp(AlertMessage)VALUES('success');
END TRY    
Begin CATCH 
	INSERT INTO #Temp(AlertMessage)VALUES('failed');
	EXECUTE USP_ErrorInfoInsert;  
END CATCH;
	select * from #Temp;
END   
GO
/****** Object:  StoredProcedure [dbo].[USP_ICDRequestPayUpdateResponse]    Script Date: 07-Jan-25 9:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

    
CREATE PROCEDURE [dbo].[USP_ICDRequestPayUpdateResponse]
@MessageId varchar(35),
@ResponseVehicleClass smallint,
@ResponseRegistrationNumber varchar(20),
@ResponseCommercialVehicle bit,
@ResponseErrCode varchar(50),
@ResponseTollFare decimal(18,2),
@ResponseApprovalNumber varchar(10),
@ResponseCurrencyCode varchar(10),
@ResponseFareType smallint,
@ResponseCode varchar(50),
@ResponseResult smallint,
@ResponseDateTime datetime
AS    
BEGIN    
SET NOCOUNT ON;   
CREATE TABLE #Temp(AlertMessage varchar(100))
BEGIN TRY 
	    UPDATE tbl_ICDRequestPayDetail SET ResponseVehicleClass=@ResponseVehicleClass,
		ResponseRegistrationNumber=@ResponseRegistrationNumber,ResponseCommercialVehicle=@ResponseCommercialVehicle,
		ResponseErrCode=@ResponseErrCode,ResponseTollFare=@ResponseTollFare,ResponseApprovalNumber=@ResponseApprovalNumber,
		ResponseCurrencyCode=@ResponseCurrencyCode,ResponseFareType=@ResponseFareType,ResponseCode=@ResponseCode,
		ResponseResult=@ResponseResult,ResponseDateTime=@ResponseDateTime
		WHERE MessageId=@MessageId
		INSERT INTO #Temp(AlertMessage)VALUES('success');
END TRY    
Begin CATCH 
	INSERT INTO #Temp(AlertMessage)VALUES('failed');
	EXECUTE USP_ErrorInfoInsert;  
END CATCH;
	select * from #Temp;
END   
GO
/****** Object:  StoredProcedure [dbo].[USP_ICDRequestSyncTimeRequest]    Script Date: 07-Jan-25 9:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_ICDRequestSyncTimeRequest]
@MessageId varchar(35),
@RequestDateTime datetime
AS BEGIN
	SET NOCOUNT ON;   
	CREATE TABLE #Temp(AlertMessage varchar(100))
	BEGIN TRY 
		INSERT INTO tbl_ICDRequestSyncTimeDetail(MessageId,RequestDateTime)
		VALUES(@MessageId,@RequestDateTime)
	END TRY    
	BEGIN CATCH 
		INSERT INTO #Temp(AlertMessage)VALUES('failed');
		EXECUTE USP_ErrorInfoInsert;  
	END CATCH;
		select * from #Temp;
END
GO
/****** Object:  StoredProcedure [dbo].[USP_ICDRequestSyncTimeUpdateRequest]    Script Date: 07-Jan-25 9:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_ICDRequestSyncTimeUpdateRequest]
@MessageId varchar(35),
@RequestStatusId smallint,
@ResponseDateTime datetime,
@ResponseCode int,
@BankServerDateTime datetime=null
AS BEGIN
	SET NOCOUNT ON;   
	CREATE TABLE #Temp(AlertMessage varchar(100))
	BEGIN TRY
		if @RequestStatusId=1
		BEGIN
			UPDATE tbl_ICDRequestSyncTimeDetail SET RequestStatusId=@RequestStatusId,ResponseDateTime=@ResponseDateTime,ResponseCode=@ResponseCode,
			BankServerDateTime=@BankServerDateTime,ModifiedDate=GETDATE()
			WHERE MessageId=@MessageId
		END
		else
		begin
			UPDATE tbl_ICDRequestSyncTimeDetail SET RequestStatusId=@RequestStatusId,ResponseDateTime=@ResponseDateTime,ResponseCode=@ResponseCode,
			ModifiedDate=GETDATE()
			WHERE MessageId=@MessageId
		end
	END TRY    
	BEGIN CATCH 
		INSERT INTO #Temp(AlertMessage)VALUES('failed');
		EXECUTE USP_ErrorInfoInsert;  
	END CATCH;
		select * from #Temp;
END
GO
/****** Object:  StoredProcedure [dbo].[USP_ICDResponseSyncTimeInsert]    Script Date: 07-Jan-25 9:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

    
CREATE PROCEDURE [dbo].[USP_ICDResponseSyncTimeInsert]    
@MessageId varchar(35),
@OrganizationId varchar(4),
@TransactionDateTime datetime,
@ApiVersion varchar(50),
@ResponseCode int,
@ResponseTime datetime,
@ResponseResult varchar(10),
@ServerDateTime datetime
AS    
BEGIN    
SET NOCOUNT ON;   
CREATE TABLE #Temp(AlertMessage varchar(100))
BEGIN TRY 
	Declare @Active int =0
	Declare @value int=0
	insert into tbl_ICDResponseSyncTime (MessageId,OrganizationId,TransactionDateTime,ApiVersion,ResponseCode,ResponseTime,ResponseResult,ServerDateTime)  
	VALUES(@MessageId,@OrganizationId,@TransactionDateTime,@ApiVersion,@ResponseCode,@ResponseTime,@ResponseResult,@ServerDateTime)
	INSERT INTO #Temp(AlertMessage)VALUES('success');
END Try    
Begin CATCH 
	INSERT INTO #Temp(AlertMessage)VALUES('failed');
	EXECUTE USP_ErrorInfoInsert;  
END CATCH;
	select * from #Temp;
END   
GO
/****** Object:  StoredProcedure [dbo].[USP_ICDTagStatusProcess]    Script Date: 07-Jan-25 9:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--DROP TABLE tbl_ICDTagStatus;CREATE TABLE tbl_ICDTagStatus(TagId varchar(35),IsBlackList bit default 0,IsLowBalance bit default 0);

CREATE PROCEDURE [dbo].[USP_ICDTagStatusProcess]
@XmlData XML,
@Type varchar(30),
@MessageId varchar(35),
@ResponseDateTime datetime,
@RespCode int,
@ResponseResult	smallint,
@ErrCode int,
@ExcCode int,
@Result smallint   
AS
BEGIN
    BEGIN TRY
        SET NOCOUNT ON;
		DECLARE @LastRequestMaxDateTime DATETIME
        CREATE TABLE #Temp(AlertMessage varchar(100));
        CREATE TABLE #TempTagData (TagId varchar(35),TagStatus bit,UpdatedTime DATETIME);
        INSERT INTO #TempTagData (TagId, TagStatus, UpdatedTime)
        SELECT 
            Tag.value('(TagId)[1]', 'VARCHAR(35)') AS TagId,
            Tag.value('(TagStatus)[1]', 'BIT') AS TagStatus,
            Tag.value('(UpdatedTime)[1]', 'DATETIME') AS UpdatedTime
        FROM @XmlData.nodes('/Tags/Tag') AS X(Tag);
		SELECT @LastRequestMaxDateTime=MAX(UpdatedTime) FROM #TempTagData
		
        DELETE FROM tbl_ICDTagStatus 
        WHERE TagId IN (SELECT TagId FROM #TempTagData WHERE TagStatus = 0);
		
        IF @Type='05'
        BEGIN
            MERGE INTO tbl_ICDTagStatus AS target
            USING #TempTagData AS source
            ON target.TagId = source.TagId
            WHEN MATCHED AND source.TagStatus = 1 THEN
                UPDATE SET target.IsBlackList = source.TagStatus
            WHEN NOT MATCHED BY TARGET AND source.TagStatus = 1 THEN
                INSERT (TagId, IsBlackList)
                VALUES (source.TagId, source.TagStatus);
			
          
            INSERT INTO #Temp(AlertMessage) VALUES('success');
        END

        else IF @Type = '03'
        BEGIN
            MERGE INTO tbl_ICDTagStatus AS target
            USING #TempTagData AS source
            ON target.TagId = source.TagId
            WHEN MATCHED AND source.TagStatus = 1 THEN
                UPDATE SET target.IsLowBalance = source.TagStatus
            WHEN NOT MATCHED BY TARGET AND source.TagStatus = 1 THEN
                INSERT (TagId, IsLowBalance)
                VALUES (source.TagId, source.TagStatus);
            INSERT INTO #Temp(AlertMessage) VALUES('success');
        END
		else
		BEGIN
			INSERT INTO #Temp(AlertMessage) VALUES('no data process');
		END
		  UPDATE tbl_ICDQueryExceptionCodes
            SET 
				LastUpdatedDateTime=@LastRequestMaxDateTime,ResponseStatusId=1
				WHERE RequestCode = @Type;

    END TRY
    BEGIN CATCH
        INSERT INTO #Temp(AlertMessage) VALUES('failed');
        EXECUTE USP_ErrorInfoInsert;
    END CATCH
	SELECT * FROM #Temp;
	
END;
GO
/****** Object:  StoredProcedure [dbo].[USP_ICDViolationAuditDetailPendingRequest]    Script Date: 07-Jan-25 9:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[USP_ICDViolationAuditDetailPendingRequest]
AS BEGIN
		SELECT VA.ViolationAuditId,L.ReviewedDateTime AS AuditDateTime,L.VehicleAvcClassId AS AVCClassId,C.AxcelCount AS AVCNumberAxcel,
		C.VehicleHeight,C.VehicleLength,VA.DoubleWheelDetected,VA.PlazaId,VA.LaneId,L.TagReadDateTime AS ReaderReadTime,
		VA.AuditTransactionId,VA.ICDTrasactionId,VA.MessageId,VA.RequestDateTime,VA.TransactionDateTime,VA.ImageFirstName,
		VA.ImageFirstPath,VA.ImageSecondName,VA.ImageSecondPath,VA.ImageAVCFirstName,VA.ImageAVCFirstPath,VA.ImageAVCSecondName,
		VA.ImageAVCSecondPath,VA.AVC,VA.MVC,VA.AuditedVC,VA.ViolationAmount,VA.ProcessedAmount,VA.ProcessedDate,VA.ImageReviewResult,
		VA.ResponseCode,VA.ResponseResult,VA.ResponseDateTime,VA.RequestStatusId,VA.IsImagesSended,VA.CreatedDate,VA.ModifiedDate 
		FROM tbl_ICDRequestViolationAuditDetail VA 
		INNER JOIN tbl_LaneTransaction L ON VA.AuditTransactionId=L.PlazaTransactionId
		INNER JOIN tbl_FasTagVehicleClass C ON L.VehicleAvcClassId=C.FasTagVehicleClassId
		WHERE VA.RequestStatusId=0 AND VA.IsImagesSended=1
	END
GO
/****** Object:  StoredProcedure [dbo].[USP_ICDViolationAuditDetailsRequest]    Script Date: 07-Jan-25 9:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

    
CREATE PROCEDURE [dbo].[USP_ICDViolationAuditDetailsRequest]
@ViolationAuditId bigint,
@AuditTransactionId bigint,
@ICDTrasactionId varchar(22),
@MessageId	varchar(35),
@RequestDateTime datetime,
@TransactionDateTime datetime,
@ImageFirstName varchar(255),
@ImageFirstPath varchar(255),
@ImageSecondName varchar(255),
@ImageSecondPath varchar(255),
@ImageAVCFirstName varchar(255),
@ImageAVCFirstPath varchar(255),
@ImageAVCSecondName varchar(255),
@ImageAVCSecondPath varchar(255),
@DoubleWheelDetected bit,
@PlazaId bigint,
@LaneId	varchar(5),
@AVC varchar(5),
@MVC varchar(5),
@AuditedVC varchar(5),
@ViolationAmount decimal(18,2),
@ProcessedAmount decimal(18,2),
@ProcessedDate datetime,
@ImageReviewResult bit,
@ResponseCode int,
@ResponseResult varchar(10),
@ResponseDateTime datetime,
@RequestStatusId smallint,
@MessageType bit,
@IsImagesSended bit
AS    
BEGIN    
SET NOCOUNT ON;   
CREATE TABLE #Temp(AlertMessage varchar(100))
BEGIN TRY 
	IF(@MessageType=0)
	BEGIN
		IF(@ViolationAuditId=0)
		BEGIN
			INSERT INTO tbl_ICDRequestViolationAuditDetail(AuditTransactionId,ICDTrasactionId,MessageId,RequestDateTime,TransactionDateTime,
			ImageFirstName,ImageFirstPath,ImageSecondName,ImageSecondPath,ImageAVCFirstName,ImageAVCFirstPath,ImageAVCSecondName,
			ImageAVCSecondPath,DoubleWheelDetected,PlazaId,LaneId,IsImagesSended)
			VALUES(@AuditTransactionId,@ICDTrasactionId,@MessageId,@RequestDateTime,@TransactionDateTime,
			@ImageFirstName,@ImageFirstPath,@ImageSecondName,@ImageSecondPath,@ImageAVCFirstName,@ImageAVCFirstPath,@ImageAVCSecondName,
			@ImageAVCSecondPath,@DoubleWheelDetected,@PlazaId,@LaneId,@IsImagesSended)
			SELECT @ViolationAuditId=@@IDENTITY
			INSERT INTO #Temp(AlertMessage)VALUES('success');
		END
		ELSE
		BEGIN
			UPDATE tbl_ICDRequestViolationAuditDetail SET RequestDateTime=@RequestDateTime,RequestStatusId=@RequestStatusId,IsImagesSended=@IsImagesSended
			WHERE ViolationAuditId=@ViolationAuditId
			INSERT INTO #Temp(AlertMessage)VALUES('success');
		END
	END
	ELSE
	BEGIN
		IF EXISTS(SELECT ViolationAuditId FROM tbl_ICDRequestViolationAuditDetail WHERE MessageId=@MessageId)
		BEGIN
			UPDATE tbl_ICDRequestViolationAuditDetail SET AVC=@AVC,MVC=@MVC,AuditedVC=@AuditedVC,ViolationAmount=@ViolationAmount,
			ProcessedAmount=@ProcessedAmount,ProcessedDate=@ProcessedDate,ImageReviewResult=@ImageReviewResult,ResponseCode=@ResponseCode,
			ResponseResult=@ResponseResult,ResponseDateTime=@ResponseDateTime,RequestStatusId=@RequestStatusId,ModifiedDate=GETDATE()
			WHERE MessageId=@MessageId 
			INSERT INTO #Temp(AlertMessage)VALUES('success');
		END
		ELSE
		BEGIN
			INSERT INTO tbl_ICDRequestViolationAuditDetail(AuditTransactionId,ICDTrasactionId,MessageId,RequestDateTime,TransactionDateTime,
			ImageFirstName,ImageFirstPath,ImageSecondName,ImageSecondPath,ImageAVCFirstName,ImageAVCFirstPath,ImageAVCSecondName,ImageAVCSecondPath,
			DoubleWheelDetected,PlazaId,LaneId,AVC,MVC,AuditedVC,ViolationAmount,ProcessedAmount,ProcessedDate,ImageReviewResult,ResponseCode,
			ResponseResult,ResponseDateTime,RequestStatusId,IsImagesSended)
			VALUES(@AuditTransactionId,@ICDTrasactionId,@MessageId,@RequestDateTime,@TransactionDateTime,@ImageFirstName,@ImageFirstPath,
			@ImageSecondName,@ImageSecondPath,@ImageAVCFirstName,@ImageAVCFirstPath,@ImageAVCSecondName,@ImageAVCSecondPath,@DoubleWheelDetected,
			@PlazaId,@LaneId,@AVC,@MVC,@AuditedVC,@ViolationAmount,@ProcessedAmount,@ProcessedDate,@ImageReviewResult,@ResponseCode,@ResponseResult,
			@ResponseDateTime,@RequestStatusId,@IsImagesSended)
			INSERT INTO #Temp(AlertMessage)VALUES('success');
		END
		
	END
END TRY    
Begin CATCH 
	INSERT INTO #Temp(AlertMessage)VALUES('failed');
	EXECUTE USP_ErrorInfoInsert;  
END CATCH;
	select * from #Temp;
	SELECT ISNULL(@ViolationAuditId,0) AS ViolationAuditId
END   
GO
/****** Object:  StoredProcedure [dbo].[USP_KeyboardDetailsGet]    Script Date: 07-Jan-25 9:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_KeyboardDetailsGet]
AS BEGIN

		 SELECT * FROM tbl_KeyboardDetails
		 ORDER BY EventTypeId,EventId
	--INSERT INTO tbl_KeyboardDetails(EventId, EventName, EventTypeId,KeyCode)
	--SELECT FasTagVehicleClassId EventId,FasTagVehicleClassName EventName,1 AS EventTypeId,Null AS KeyCode 
	--FROM tbl_FasTagVehicleClass WHERE DataStatus=1
	--UNION ALL
	--SELECT TransactionTypeId EventId,TransactionTypeName EventName,2 AS EventTypeId,Null AS KeyCode 
	--FROM tbl_TransactionTypeMaster WHERE DataStatus=1 AND TransactionTypeName <>'Violation'
	--UNION ALL
	--SELECT 1 AS EventId, 'Digital Payment' AS EventName,3 AS EventTypeId,Null AS KeyCode
	--UNION ALL
	--SELECT 2 AS EventId, 'Single Journey' AS EventName,3 AS EventTypeId,Null AS KeyCode
	--UNION ALL
	--SELECT 3 AS EventId, 'Retrun Journey' AS EventName,3 AS EventTypeId,Null AS KeyCode
	--UNION ALL
	--SELECT 4 AS EventId, 'Remark' AS EventName,3 AS EventTypeId,Null AS KeyCode
	--UNION ALL
	--SELECT 5 AS EventId, 'Print' AS EventName,3 AS EventTypeId,Null AS KeyCode
	--UNION ALL
	--SELECT 6 AS EventId, 'Reset' AS EventName,3 AS EventTypeId ,Null AS KeyCode
	--UNION ALL
	--SELECT 7 AS EventId, 'Fleet Start' AS EventName,3 AS EventTypeId,Null AS KeyCode
	--UNION ALL
	--SELECT 8 AS EventId, 'Fleet Stop' AS EventName,3 AS EventTypeId,Null AS KeyCode
	--UNION ALL
	--SELECT 9 AS EventId, 'Bleed Off' AS EventName,3 AS EventTypeId,Null AS KeyCode
	--UNION ALL
	--SELECT 10 AS EventId, 'WIM Reset' AS EventName,3 AS EventTypeId,Null AS KeyCode
	--UNION ALL
	--SELECT 11 AS EventId, 'Alarm' AS EventName,3 AS EventTypeId,Null AS KeyCode
	--UNION ALL
	--SELECT 12 AS EventId, 'Camera Zoom' AS EventName,3 AS EventTypeId,Null AS KeyCode
	--UNION ALL
	--SELECT 13 AS EventId, 'Plate Number' AS EventName,3 AS EventTypeId,Null AS KeyCode
	--UNION ALL
	--SELECT 14 AS EventId, 'Tab Space' AS EventName,3 AS EventTypeId,Null AS KeyCode
	--UNION ALL
	--SELECT 15 AS EventId, 'Back Space' AS EventName,3 AS EventTypeId,Null AS KeyCode
	--UNION ALL
	--SELECT 16 AS EventId, 'Space' AS EventName,3 AS EventTypeId,Null AS KeyCode
	--UNION ALL
	--SELECT 17 AS EventId, 'Logout' AS EventName,3 AS EventTypeId,Null AS KeyCode
	--UNION ALL
	--SELECT 18 AS EventId, 'Validate Receipt' AS EventName,3 AS EventTypeId,Null AS KeyCode
	--UNION ALL
	--SELECT 19 AS EventId, 'UP' AS EventName,3 AS EventTypeId,Null AS KeyCode
	--UNION ALL
	--SELECT 20 AS EventId, 'Down' AS EventName,3 AS EventTypeId,Null AS KeyCode
END
GO
/****** Object:  StoredProcedure [dbo].[USP_KeyboardDetailsUpdate]    Script Date: 07-Jan-25 9:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_KeyboardDetailsUpdate]
@ModifiedBy bigint,
@JsonList NVARCHAR(MAX)
AS BEGIN
	DECLARE @MenuId smallint=0;
	CREATE TABLE #Temp(AlertMessage varchar(100))
	BEGIN TRY  
		
		SELECT @MenuId=MenuId FROM tbl_MenuMaster WHERE MenuName ='Keyboard Master'
		CREATE TABLE #tbl_KeyboardDetails(EventId smallint,EventName varchar(50),EventTypeId smallint,KeyCode smallint)
		TRUNCATE TABLE tbl_KeyboardDetails
		INSERT INTO tbl_KeyboardDetails (EventId, EventName, EventTypeId,KeyCode,CreatedBy,ModifiedBy)
		SELECT EventId, EventName, EventTypeId,KeyCode,@ModifiedBy,@ModifiedBy
		FROM OPENJSON(@JsonList)
		WITH (EventId smallint,EventName varchar(50),EventTypeId smallint,KeyCode smallint);

		INSERT INTO tbl_ActivityLog(UserId,ActionId,MenuId,CreatedDate)
		VALUES(@ModifiedBy,'Update',@MenuId,GETDATE());
		
		INSERT INTO #Temp(AlertMessage)VALUES('success');

	END TRY  
	BEGIN CATCH  
		INSERT INTO #Temp(AlertMessage)VALUES('failed');
		EXECUTE USP_ErrorInfoInsert;  
	END CATCH  
		select * from #Temp;
END
GO
/****** Object:  StoredProcedure [dbo].[USP_LaneDirectionMasterGetAll]    Script Date: 07-Jan-25 9:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_LaneDirectionMasterGetAll]
As BEGIN
	SELECT * FROM tbl_LaneDirectionMaster;
END
GO
/****** Object:  StoredProcedure [dbo].[USP_LaneGetActive]    Script Date: 07-Jan-25 9:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[USP_LaneGetActive] 
AS
BEGIN
	SELECT L.LaneId,L.PlazaId,P.SystemIntegratorId,S.Name as SystemIntegratorName,P.PlazaName,P.PlazaServerIpAddress,
	P.ChainageNumber,P.Latitude,P.Longitude,P.PlazaZoneId,L.LaneName,L.LaneNumber,L.LaneCode,L.LaneTypeId,L.LanePositionId,L.LanePointId,
	L.LaneDirectionId,L.LaneStatusId,L.LaneModeId,L.LaneSystemIpAddress,L.DataStatus,L.CreatedDate,L.CreatedBy,L.ModifiedDate,
	L.ModifiedBy,DS.DataStatusName,LD.LaneDirectionName,LD.LaneDirectionCode,LT.LaneTypeName,LPP.LanePositionName,LP.LanePointName,LS.LaneStatusName,
	LM.LaneModeName
	FROM tbl_LaneConfiguration L 
	INNER JOIN tbl_PlazaConfiguration P ON L.PlazaId=P.PlazaId
	INNER JOIN tbl_SystemIntegratorConfiguration S ON P.SystemIntegratorId=S.SystemIntegratorId
	INNER JOIN tbl_DataStatusMaster DS ON L.DataStatus=DS.DataStatusId
	INNER JOIN tbl_LaneDirectionMaster LD ON L.LaneDirectionId=LD.LaneDirectionId
	INNER JOIN tbl_LaneTypeMaster LT ON L.LaneTypeId=LT.LaneTypeId
	INNER JOIN tbl_LanePositionMaster LPP ON L.LanePositionId=LPP.LanePositionId
	INNER JOIN tbl_LanePointMaster LP ON L.LanePointId=LP.LanePointId
	INNER JOIN tbl_LaneStatusMaster LS ON L.LaneStatusId=LS.LaneStatusId
	INNER JOIN tbl_LaneModeMaster LM ON L.LaneModeId=LM.LaneModeId
	WHERE L.DataStatus=1
END


GO
/****** Object:  StoredProcedure [dbo].[USP_LaneGetAll]    Script Date: 07-Jan-25 9:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[USP_LaneGetAll] 
AS
BEGIN
	SELECT L.LaneId,L.PlazaId,P.SystemIntegratorId,S.Name as SystemIntegratorName,P.PlazaName,P.PlazaServerIpAddress,
	P.ChainageNumber,P.Latitude,P.Longitude,P.PlazaZoneId,L.LaneName,L.LaneNumber,L.LaneCode,L.LaneTypeId,L.LanePositionId,L.LanePointId,
	L.LaneDirectionId,L.LaneStatusId,L.LaneModeId,L.LaneSystemIpAddress,L.DataStatus,L.CreatedDate,L.CreatedBy,L.ModifiedDate,
	L.ModifiedBy,DS.DataStatusName,LD.LaneDirectionName,LD.LaneDirectionCode,LT.LaneTypeName,LPP.LanePositionName,LP.LanePointName,LS.LaneStatusName,
	LM.LaneModeName
	FROM tbl_LaneConfiguration L 
	LEFT JOIN tbl_PlazaConfiguration P ON L.PlazaId=P.PlazaId
	LEFT JOIN tbl_SystemIntegratorConfiguration S ON P.SystemIntegratorId=S.SystemIntegratorId
	LEFT JOIN tbl_DataStatusMaster DS ON L.DataStatus=DS.DataStatusId
	LEFT JOIN tbl_LaneDirectionMaster LD ON L.LaneDirectionId=LD.LaneDirectionId
	LEFT JOIN tbl_LaneTypeMaster LT ON L.LaneTypeId=LT.LaneTypeId
	LEFT JOIN tbl_LanePositionMaster LPP ON L.LanePositionId=LPP.LanePositionId
	LEFT JOIN tbl_LanePointMaster LP ON L.LanePointId=LP.LanePointId
	LEFT JOIN tbl_LaneStatusMaster LS ON L.LaneStatusId=LS.LaneStatusId
	LEFT JOIN tbl_LaneModeMaster LM ON L.LaneModeId=LM.LaneModeId
END
--GO
--EXEC USP_LaneGetAll


GO
/****** Object:  StoredProcedure [dbo].[USP_LaneGetbyId]    Script Date: 07-Jan-25 9:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_LaneGetbyId] 
@LaneId smallint
AS
BEGIN
	SELECT L.LaneId,L.PlazaId,P.SystemIntegratorId,S.Name as SystemIntegratorName,P.PlazaName,P.PlazaServerIpAddress,
	P.ChainageNumber,P.Latitude,P.Longitude,P.PlazaZoneId,L.LaneName,L.LaneNumber,L.LaneCode,L.LaneTypeId,L.LanePositionId,L.LanePointId,
	L.LaneDirectionId,L.LaneStatusId,L.LaneModeId,L.LaneSystemIpAddress,L.DataStatus,L.CreatedDate,L.CreatedBy,L.ModifiedDate,
	L.ModifiedBy,DS.DataStatusName,LD.LaneDirectionName,LD.LaneDirectionCode,LT.LaneTypeName,LPP.LanePositionName,LP.LanePointName,LS.LaneStatusName,
	LM.LaneModeName
	FROM tbl_LaneConfiguration L 
	INNER JOIN tbl_PlazaConfiguration P ON L.PlazaId=P.PlazaId
	INNER JOIN tbl_SystemIntegratorConfiguration S ON P.SystemIntegratorId=S.SystemIntegratorId
	INNER JOIN tbl_DataStatusMaster DS ON L.DataStatus=DS.DataStatusId
	INNER JOIN tbl_LaneDirectionMaster LD ON L.LaneDirectionId=LD.LaneDirectionId
	INNER JOIN tbl_LaneTypeMaster LT ON L.LaneTypeId=LT.LaneTypeId
	INNER JOIN tbl_LanePositionMaster LPP ON L.LanePositionId=LPP.LanePositionId
	INNER JOIN tbl_LanePointMaster LP ON L.LanePointId=LP.LanePointId
	INNER JOIN tbl_LaneStatusMaster LS ON L.LaneStatusId=LS.LaneStatusId
	INNER JOIN tbl_LaneModeMaster LM ON L.LaneModeId=LM.LaneModeId
	WHERE L.LaneId=@LaneId
END


GO
/****** Object:  StoredProcedure [dbo].[USP_LaneGetbyIpAddress]    Script Date: 07-Jan-25 9:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_LaneGetbyIpAddress] 
@LaneSystemIpAddress varchar(50)
AS
BEGIN
	SELECT L.LaneId,L.PlazaId,P.SystemIntegratorId,S.Name as SystemIntegratorName,P.PlazaName,P.PlazaServerIpAddress,
	P.ChainageNumber,P.Latitude,P.Longitude,P.PlazaZoneId,L.LaneName,L.LaneNumber,L.LaneCode,L.LaneTypeId,L.LanePositionId,L.LanePointId,
	L.LaneDirectionId,L.LaneStatusId,L.LaneModeId,L.LaneSystemIpAddress,L.DataStatus,L.CreatedDate,L.CreatedBy,L.ModifiedDate,
	L.ModifiedBy,DS.DataStatusName,LD.LaneDirectionName,LD.LaneDirectionCode,LT.LaneTypeName,LPP.LanePositionName,LP.LanePointName,LS.LaneStatusName,
	LM.LaneModeName
	FROM tbl_LaneConfiguration L 
	INNER JOIN tbl_PlazaConfiguration P ON L.PlazaId=P.PlazaId
	INNER JOIN tbl_SystemIntegratorConfiguration S ON P.SystemIntegratorId=S.SystemIntegratorId
	INNER JOIN tbl_DataStatusMaster DS ON L.DataStatus=DS.DataStatusId
	INNER JOIN tbl_LaneDirectionMaster LD ON L.LaneDirectionId=LD.LaneDirectionId
	INNER JOIN tbl_LaneTypeMaster LT ON L.LaneTypeId=LT.LaneTypeId
	INNER JOIN tbl_LanePositionMaster LPP ON L.LanePositionId=LPP.LanePositionId
	INNER JOIN tbl_LanePointMaster LP ON L.LanePointId=LP.LanePointId
	INNER JOIN tbl_LaneStatusMaster LS ON L.LaneStatusId=LS.LaneStatusId
	INNER JOIN tbl_LaneModeMaster LM ON L.LaneModeId=LM.LaneModeId
	WHERE L.LaneSystemIpAddress=@LaneSystemIpAddress
END
--GO
--EXEC USP_LaneGetbyIpAddress
--@IpAddress='192.168.1.10'

GO
/****** Object:  StoredProcedure [dbo].[USP_LaneGetbyPlazaId]    Script Date: 07-Jan-25 9:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_LaneGetbyPlazaId] 
@PlazaId int
AS
BEGIN
	SELECT L.LaneId,L.PlazaId,P.SystemIntegratorId,S.Name as SystemIntegratorName,P.PlazaName,P.PlazaServerIpAddress,
	P.ChainageNumber,P.Latitude,P.Longitude,P.PlazaZoneId,L.LaneName,L.LaneNumber,L.LaneCode,L.LaneTypeId,L.LanePositionId,L.LanePointId,
	L.LaneDirectionId,L.LaneStatusId,L.LaneModeId,L.LaneSystemIpAddress,L.DataStatus,L.CreatedDate,L.CreatedBy,L.ModifiedDate,
	L.ModifiedBy,DS.DataStatusName,LD.LaneDirectionName,LD.LaneDirectionCode,LT.LaneTypeName,LPP.LanePositionName,LP.LanePointName,LS.LaneStatusName,
	LM.LaneModeName
	FROM tbl_LaneConfiguration L 
	LEFT JOIN tbl_PlazaConfiguration P ON L.PlazaId=P.PlazaId
	LEFT JOIN tbl_SystemIntegratorConfiguration S ON P.SystemIntegratorId=S.SystemIntegratorId
	LEFT JOIN tbl_DataStatusMaster DS ON L.DataStatus=DS.DataStatusId
	LEFT JOIN tbl_LaneDirectionMaster LD ON L.LaneDirectionId=LD.LaneDirectionId
	LEFT JOIN tbl_LaneTypeMaster LT ON L.LaneTypeId=LT.LaneTypeId
	LEFT JOIN tbl_LanePositionMaster LPP ON L.LanePositionId=LPP.LanePositionId
	LEFT JOIN tbl_LanePointMaster LP ON L.LanePointId=LP.LanePointId
	LEFT JOIN tbl_LaneStatusMaster LS ON L.LaneStatusId=LS.LaneStatusId
	LEFT JOIN tbl_LaneModeMaster LM ON L.LaneModeId=LM.LaneModeId
	WHERE L.PlazaId=@PlazaId
END


GO
/****** Object:  StoredProcedure [dbo].[USP_LaneHandledGet]    Script Date: 07-Jan-25 9:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[USP_LaneHandledGet] 
AS
BEGIN
	SELECT L.LaneId AS LaneID,L.LaneName,L.LaneSystemIpAddress AS IPAddress
	FROM tbl_LaneConfiguration L 
	INNER JOIN tbl_PlazaConfiguration P ON L.PlazaId=P.PlazaId
	INNER JOIN tbl_SystemIntegratorConfiguration S ON P.SystemIntegratorId=S.SystemIntegratorId
	INNER JOIN tbl_DataStatusMaster DS ON L.DataStatus=DS.DataStatusId
	INNER JOIN tbl_LaneDirectionMaster LD ON L.LaneDirectionId=LD.LaneDirectionId
	INNER JOIN tbl_LaneTypeMaster LT ON L.LaneTypeId=LT.LaneTypeId
	INNER JOIN tbl_LanePositionMaster LPP ON L.LanePositionId=LPP.LanePositionId
	INNER JOIN tbl_LanePointMaster LP ON L.LanePointId=LP.LanePointId
	INNER JOIN tbl_LaneStatusMaster LS ON L.LaneStatusId=LS.LaneStatusId
	INNER JOIN tbl_LaneModeMaster LM ON L.LaneModeId=LM.LaneModeId
	WHERE L.DataStatus=1
END


GO
/****** Object:  StoredProcedure [dbo].[USP_LaneInsertUpdate]    Script Date: 07-Jan-25 9:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_LaneInsertUpdate] 
@LaneId bigint,
@PlazaId int,
@LaneNumber smallint,
@LaneName varchar(10),
@LaneTypeId smallint,
@LanePositionId smallint,
@LanePointId smallint,
@LaneDirectionId smallint,
@LaneStatusId smallint,
@LaneModeId smallint,
@LaneSystemIpAddress varchar(20),
@DataStatus smallint,
@CreatedDate DateTime,
@CreatedBy bigint,
@ModifiedDate DateTime,
@ModifiedBy bigint
AS
BEGIN
	DECLARE @MenuId smallint=15;
	DECLARE @PVal varchar(4000)
	DECLARE @CVal varchar(4000)
	DECLARE @cnt int
	CREATE TABLE #Temp(AlertMessage varchar(100),AlertData varchar(8000))
	BEGIN TRY  
		SELECT @MenuId=MenuId FROM tbl_MenuMaster WHERE MenuName ='Lane Master'
		IF EXISTS(SELECT LaneId FROM tbl_LaneConfiguration where PlazaId=@PlazaId AND LaneSystemIpAddress=@LaneSystemIpAddress AND LaneId<>@LaneId)
		BEGIN
			INSERT INTO #Temp(AlertMessage)
			VALUES('Lane ip-address already exists')
		END
		IF EXISTS(SELECT LaneId FROM tbl_LaneConfiguration where PlazaId=@PlazaId AND LaneName=@LaneName
		AND LaneId<>@LaneId)
		BEGIN
			INSERT INTO #Temp(AlertMessage)
			VALUES('Lane name already exists')
		END
		IF EXISTS(SELECT LaneId FROM tbl_LaneConfiguration where PlazaId=@PlazaId AND LaneNumber=@LaneNumber
		AND LaneId<>@LaneId)
		BEGIN
			INSERT INTO #Temp(AlertMessage)
			VALUES('Lane number already exists')
		END
		IF EXISTS(SELECT LaneId FROM tbl_EquipmentDetails where IpAddress=@LaneSystemIpAddress AND EquipmentTypeId<>6)
		BEGIN
			INSERT INTO #Temp(AlertMessage)
			VALUES('Lane ip-address already exists in Equipment')
		END
		IF(@LaneId<>0 AND @DataStatus<>1)
		BEGIN
			IF EXISTS(SELECT LaneId FROM tbl_EquipmentDetails where LaneId=@LaneId AND PlazaId=@PlazaId AND DataStatus=1)
			BEGIN
				INSERT INTO #Temp(AlertMessage)
				VALUES('Lane cannot inactive due to hardware already connected!');
			END	
		END
	SELECT @cnt=COUNT(AlertMessage)  FROM #Temp
	IF(@cnt=0)
		BEGIN
			IF(@LaneId=0)
			BEGIN
				insert into tbl_LaneConfiguration(PlazaId,LaneNumber,LaneName,LaneTypeId,LanePositionId,LanePointId,LaneDirectionId,LaneStatusId,LaneModeId,LaneSystemIpAddress,DataStatus,CreatedDate,CreatedBy)
				values(@PlazaId,@LaneNumber,@LaneName,@LaneTypeId,@LanePositionId,@LanePointId,@LaneDirectionId,@LaneStatusId,@LaneModeId,@LaneSystemIpAddress,@DataStatus,@CreatedDate,@CreatedBy);
				SELECT @LaneId=@@IDENTITY
				SET @CVal=(SELECT * FROM tbl_LaneConfiguration WHERE LaneId=@LaneId FOR JSON AUTO, WITHOUT_ARRAY_WRAPPER)		
				
				INSERT INTO tbl_ActivityLog(UserId,CurrentColumn,ActionId,MenuId,CreatedDate)
				VALUES(@CreatedBy,@CVal,'Insert',@MenuId,@CreatedDate);
				
				INSERT INTO #Temp(AlertMessage,AlertData)VALUES('success',@CVal);
			END
			ELSE
			BEGIN
			
				SET @PVal=(SELECT * FROM tbl_LaneConfiguration WHERE LaneId=@LaneId FOR JSON AUTO, WITHOUT_ARRAY_WRAPPER)	
				
				UPDATE tbl_LaneConfiguration SET PlazaId=@PlazaId,LaneName=@LaneName,LaneNumber=@LaneNumber,LaneTypeId=@LaneTypeId,LanePositionId=@LanePositionId,
				LanePointId=@LanePointId,LaneDirectionId=@LaneDirectionId,LaneStatusId=@LaneStatusId,LaneModeId=@LaneModeId,
				LaneSystemIpAddress=@LaneSystemIpAddress,DataStatus=@DataStatus,ModifiedDate=@ModifiedDate,ModifiedBy=@ModifiedBy
				WHERE LaneId=@LaneId
				
				SET @CVal=(SELECT * FROM tbl_LaneConfiguration WHERE LaneId=@LaneId FOR JSON AUTO, WITHOUT_ARRAY_WRAPPER)	
				
					
				INSERT INTO tbl_ActivityLog(UserId,PrevColumn,CurrentColumn,ActionId,MenuId,CreatedDate)
				VALUES(@ModifiedBy,@PVal,@CVal,'Update',@MenuId,@ModifiedDate);

				INSERT INTO #Temp(AlertMessage,AlertData)VALUES('success',@CVal);
			END
		END
	END TRY  
	BEGIN CATCH  
		INSERT INTO #Temp(AlertMessage)VALUES('failed');
		EXECUTE usp_ErrorInfoInsert;  
	END CATCH  
	select * from #Temp;
END
--GO 
--EXEC [USP_LaneInsertUpdate] 
--@LaneId=1,
--@PlazaId =2,
--@LaneNumber =2,
--@LaneType =1,
--@LaneFor =1,
--@LaneDirection =1,
--@LaneIP='192.168.2.1',
--@DataStatus =2,
--@UserId =0,
--@CDateTime ='01-Nov-2021'
GO
/****** Object:  StoredProcedure [dbo].[USP_LaneModeMasterGetAll]    Script Date: 07-Jan-25 9:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_LaneModeMasterGetAll]
As BEGIN
	SELECT * FROM tbl_LaneModeMaster;
END
GO
/****** Object:  StoredProcedure [dbo].[USP_LanePointMasterGetAll]    Script Date: 07-Jan-25 9:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_LanePointMasterGetAll]
As BEGIN
	SELECT * FROM tbl_LanePointMaster;
END
GO
/****** Object:  StoredProcedure [dbo].[USP_LanePositionMasterGetAll]    Script Date: 07-Jan-25 9:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_LanePositionMasterGetAll]
As BEGIN
	SELECT * FROM tbl_LanePositionMaster;
END
GO
/****** Object:  StoredProcedure [dbo].[USP_LaneStatusMasterGetAll]    Script Date: 07-Jan-25 9:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_LaneStatusMasterGetAll]
As BEGIN
	SELECT * FROM tbl_LaneStatusMaster;
END
GO
/****** Object:  StoredProcedure [dbo].[USP_LaneTransactionDataInsert]    Script Date: 07-Jan-25 9:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_LaneTransactionDataInsert]
@MasterTransactionId VARCHAR(30),
@PlazaTransactionId VARCHAR(30),
@LaneTransactionId VARCHAR(30),
@JourneyId smallint,
@PlazaId smallint,
@LaneId smallint,
@ShiftId smallint,
@TransactionTypeId smallint,
@PaymentTypeId smallint,
@ExemptTypeId smallint,
@ExemptSubTypeId smallint,
@VehicleClassId smallint,
@VehicleSubClassId smallint,
@VehicleAvcClassId smallint,
@PlateNumber varchar(20),
@RCTNumber varchar(32),
@TagEPC varchar(32),
@TagClassId smallint,
@TagPlateNumber varchar(20),
@TagReadDateTime datetime2(4),
@TagReadCount smallint,
@TagReadById smallint,
@PermissibleVehicleWeight decimal(18, 3),
@ActualVehicleWeight decimal(18, 3),
@IsOverWeightCharged bit,
@OverWeightAmount decimal(18, 2),
@TagPenaltyAmount decimal(18, 2),
@TransactionAmount decimal(18, 2),
@TransactionDateTime datetime2(4),
@TransactionFrontImage varchar(255),
@TransactionBackImage varchar(255),
@TransactionAvcImage varchar(255),
@TransactionVideo varchar(255),
@ExemptionProofImage varchar(255),
@UserId bigint,
@LoginId varchar(20),
@IsReturnJourney bit,
@IsExcessJourney bit,
@IsBarrierAutoClose bit,
@IsTowVehicle bit,
@IsFleetTranscation bit,
@FleetCount smallint,
@TCRemark varchar(255),
@TxnCounter bigint,
@ReceivedDateTime datetime
AS BEGIN
	CREATE TABLE #Temp(AlertMessage varchar(100))
	BEGIN TRY
		DECLARE @IsReviewedRequired bit
		DECLARE @IsAccessControl bit
		DECLARE @FasTagTransactionId varchar(50)
		DECLARE @PlazaZoneId varchar(50)
		DECLARE @LaneNumber smallint
		SELECT @IsAccessControl=IsAccessControl FROM tbl_SystemSetting
		SELECT @IsReviewedRequired=ReviewRequired FROM tbl_TransactionTypeMaster WHERE TransactionTypeId=@TransactionTypeId
		DECLARE @SystemIntegratorId SMALLINT
		DECLARE @LaneStatusId SMALLINT     DECLARE @LaneModeId SMALLINT			 DECLARE @LaneDirectionId SMALLINT
		SELECT @SystemIntegratorId=SystemIntegratorId FROM tbl_PlazaConfiguration WHERE PlazaId=@PlazaId
		SELECT @LaneStatusId=LaneStatusId,@LaneModeId=LaneModeId,@LaneDirectionId=LaneDirectionId FROM tbl_LaneConfiguration WHERE LaneId=@LaneId
		if @VehicleAvcClassId=0
		BEGIN
			SET @VehicleAvcClassId=@VehicleClassId
		END
                
		IF(@IsReviewedRequired=0 AND @VehicleAvcClassId<> @VehicleSubClassId)
		BEGIN
			SET @IsReviewedRequired=1
		END
		IF EXISTS (SELECT 1 FROM tbl_LaneTransaction WHERE LaneTransactionId = @LaneTransactionId)
        BEGIN
            UPDATE tbl_LaneTransaction
            SET MasterTransactionId = @MasterTransactionId,
                PlazaTransactionId = @PlazaTransactionId,
                SystemIntegratorId = @SystemIntegratorId,
                JourneyId = @JourneyId,
                PlazaId = @PlazaId,
                LaneId = @LaneId,
                LaneStatusId = @LaneStatusId,
                LaneModeId = @LaneModeId,
                LaneDirectionId = @LaneDirectionId,
                ShiftId = @ShiftId,
                TransactionTypeId = @TransactionTypeId,
                PaymentTypeId = @PaymentTypeId,
                ExemptTypeId = @ExemptTypeId,
                ExemptSubTypeId = @ExemptSubTypeId,
                RCTNumber = @RCTNumber,
                PlateNumber = @PlateNumber,
                VehicleClassId = @VehicleClassId,
                VehicleSubClassId = @VehicleSubClassId,
                VehicleAvcClassId = @VehicleAvcClassId,
                TagEPC = @TagEPC,
                TagClassId = @TagClassId,
                TagPlateNumber = @TagPlateNumber,
                TagReadDateTime = @TagReadDateTime,
                TagReadCount = @TagReadCount,
                TagReadById = @TagReadById,
                PermissibleVehicleWeight = @PermissibleVehicleWeight,
                ActualVehicleWeight = @ActualVehicleWeight,
                IsOverWeightCharged = @IsOverWeightCharged,
                OverWeightAmount = @OverWeightAmount,
                TagPenaltyAmount = @TagPenaltyAmount,
                TransactionAmount = @TransactionAmount,
                TransactionDateTime = @TransactionDateTime,
                TransactionFrontImage = @TransactionFrontImage,
                TransactionBackImage = @TransactionBackImage,
                TransactionAvcImage = @TransactionAvcImage,
                TransactionVideo = @TransactionVideo,
                ExemptionProofImage = @ExemptionProofImage,
                DestinationPlazaId = 0,
                UserId = @UserId,
                LoginId = @LoginId,
                IsReturnJourney = @IsReturnJourney,
                IsExcessJourney = @IsExcessJourney,
                IsBarrierAutoClose = @IsBarrierAutoClose,
                IsTowVehicle = @IsTowVehicle,
                IsFleetTranscation = @IsFleetTranscation,
                FleetCount = @FleetCount,
                TCRemark = @TCRemark,
                IsReviewedRequired = @IsReviewedRequired,
				LaneTransactionCount=@TxnCounter,
                ReceivedDateTime = @ReceivedDateTime
            WHERE LaneTransactionId = @LaneTransactionId
        END
        ELSE
        BEGIN
			IF(@TransactionTypeId<>1)
			BEGIN
				INSERT INTO tbl_LaneTransaction(MasterTransactionId,PlazaTransactionId,LaneTransactionId,SystemIntegratorId,JourneyId,PlazaId,LaneId,
				LaneStatusId,LaneModeId,LaneDirectionId,ShiftId,TransactionTypeId,PaymentTypeId,ExemptTypeId,ExemptSubTypeId,RCTNumber,PlateNumber,VehicleClassId,
				VehicleSubClassId,VehicleAvcClassId,PermissibleVehicleWeight,ActualVehicleWeight,IsOverWeightCharged,OverWeightAmount,TagPenaltyAmount,
				TransactionAmount,TransactionDateTime,TransactionFrontImage,TransactionBackImage,TransactionAvcImage,TransactionVideo,ExemptionProofImage,
				DestinationPlazaId,UserId,LoginId,IsReturnJourney,IsExcessJourney,IsBarrierAutoClose,IsTowVehicle,IsFleetTranscation,FleetCount,
				IsReviewedRequired,TCRemark,ReceivedDateTime,TransactionStatus,LaneTransactionCount,CreatedDate)
				VALUES(@MasterTransactionId,@PlazaTransactionId,@LaneTransactionId,@SystemIntegratorId,@JourneyId,@PlazaId,@LaneId,
				@LaneStatusId,@LaneModeId,@LaneDirectionId,@ShiftId,@TransactionTypeId,@PaymentTypeId,@ExemptTypeId,@ExemptSubTypeId,@RCTNumber,@PlateNumber,@VehicleClassId,
				@VehicleSubClassId,@VehicleAvcClassId,@PermissibleVehicleWeight,@ActualVehicleWeight,@IsOverWeightCharged,@OverWeightAmount,@TagPenaltyAmount,
				@TransactionAmount,@TransactionDateTime,@TransactionFrontImage,@TransactionBackImage,@TransactionAvcImage,@TransactionVideo,@ExemptionProofImage,
				0,@UserId,@LoginId,@IsReturnJourney,@IsExcessJourney,@IsBarrierAutoClose,@IsTowVehicle,@IsFleetTranscation,@FleetCount,
				@IsReviewedRequired,@TCRemark,@ReceivedDateTime,1,@TxnCounter,GETDATE())
			END
			ELSE
			BEGIN
				INSERT INTO tbl_LaneTransaction(MasterTransactionId,PlazaTransactionId,LaneTransactionId,SystemIntegratorId,JourneyId,PlazaId,LaneId,
				LaneStatusId,LaneModeId,LaneDirectionId,ShiftId,TransactionTypeId,PaymentTypeId,ExemptTypeId,ExemptSubTypeId,RCTNumber,PlateNumber,VehicleClassId,
				VehicleSubClassId,VehicleAvcClassId,TagEPC,TagClassId,TagPlateNumber,TagReadDateTime,TagReadCount,TagReadById,PermissibleVehicleWeight,ActualVehicleWeight,
				IsOverWeightCharged,OverWeightAmount,TagPenaltyAmount,TransactionAmount,TransactionDateTime,TransactionFrontImage,TransactionBackImage,
				TransactionAvcImage,TransactionVideo,ExemptionProofImage,DestinationPlazaId,UserId,LoginId,IsReturnJourney,IsExcessJourney,IsBarrierAutoClose,
				IsTowVehicle,IsFleetTranscation,FleetCount,TCRemark,LaneTransactionCount,IsReviewedRequired,ReceivedDateTime,TransactionStatus,CreatedDate)
				VALUES(@MasterTransactionId,@PlazaTransactionId,@LaneTransactionId,@SystemIntegratorId,@JourneyId,@PlazaId,@LaneId,
				@LaneStatusId,@LaneModeId,@LaneDirectionId,@ShiftId,@TransactionTypeId,@PaymentTypeId,@ExemptTypeId,@ExemptSubTypeId,@RCTNumber,@PlateNumber,@VehicleClassId,
				@VehicleSubClassId,@VehicleAvcClassId,@TagEPC,@TagClassId,@TagPlateNumber,@TagReadDateTime,@TagReadCount,@TagReadById,@PermissibleVehicleWeight,@ActualVehicleWeight,
				@IsOverWeightCharged,@OverWeightAmount,@TagPenaltyAmount,@TransactionAmount,@TransactionDateTime,@TransactionFrontImage,@TransactionBackImage,
				@TransactionAvcImage,@TransactionVideo,@ExemptionProofImage,0,@UserId,@LoginId,@IsReturnJourney,@IsExcessJourney,@IsBarrierAutoClose,
				@IsTowVehicle,@IsFleetTranscation,@FleetCount,@TCRemark,@TxnCounter,@IsReviewedRequired,@ReceivedDateTime,1,GETDATE())
				IF(@PlazaTransactionId<>0 AND @IsAccessControl=0)
				BEGIN
					SELECT @PlazaZoneId=PlazaZoneId FROM tbl_PlazaConfiguration WHERE PlazaId=@PlazaId
					SELECT @LaneNumber=LaneNumber FROM tbl_LaneConfiguration WHERE LaneId=@LaneId
					SET @FasTagTransactionId=@PlazaZoneId+RIGHT('LLL'+CAST(@LaneNumber AS VARCHAR),3)+CONVERT(VARCHAR,FORMAT(@TransactionDateTime, 'ddMMyyHHmmssf'))
				

					INSERT INTO tbl_ICDRequestPayDetail(PlazaTransactionId,MessageId,TransactionId,Note,RefId,RefUrl,TransactionTypeName,ReaderSignAuth,
					ReaderTagVerified,ReaderProcRestrictionResult,ReaderVehicleAuth,ReaderPublicKeyCVV,TagSignature,PaymentMode,OverwightPaymentMode,RequestStatusId)
					VALUES(@PlazaTransactionId,REPLACE(newid(),'-',''),@FasTagTransactionId,'','','','DEBIT','NOT_VERIFIED',
					'NETC TAG','','UNKNOWN','','','Tag','Cash',0)
				END
			END
			IF NOT EXISTS(SELECT ShiftId FROM tbl_ShiftStatusDetail WHERE ShiftId=@ShiftId AND ShiftDate=CONVERT(DATE,@TransactionDateTime) AND PlazaId=@PlazaId)
			BEGIN
				INSERT INTO tbl_ShiftStatusDetail(PlazaId,ShiftId,ShiftDate)
				VALUES(@PlazaId,@ShiftId,CONVERT(DATE,@TransactionDateTime))
			END
		END
		INSERT INTO #Temp(AlertMessage)VALUES('success');
	END TRY  
	BEGIN CATCH  
		INSERT INTO #Temp(AlertMessage)VALUES('failed');
		EXECUTE usp_ErrorInfoInsert;  
	END CATCH  
	SELECT * FROM #Temp
END
GO
/****** Object:  StoredProcedure [dbo].[USP_LaneTransactionGetAll]    Script Date: 07-Jan-25 9:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_LaneTransactionGetAll]
AS BEGIN
	SELECT L.MasterTransactionId,L.PlazaTransactionId,L.LaneTransactionId,L.SystemIntegratorId,SI.Name AS SystemIntegratorName,L.JourneyId,JM.JourneyName,
	L.PlazaId,PC.PlazaName,L.LaneId,LC.LaneNumber,LC.LaneTypeId,L.LaneStatusId,LC.LaneDirectionId,L.ShiftId,L.PlateNumber,L.VehicleClassId,SV.SystemVehicleClassName AS VehicleClassName,
	L.VehicleSubClassId,SSV.FasTagVehicleClassName AS VehicleSubClassName,L.VehicleAvcClassId,AVC.FasTagVehicleClassName AS VehicleAvcClassName,
	L.TransactionTypeId,TTM.TransactionTypeName,L.PaymentTypeId,PTM.PaymentTypeName,L.ExemptTypeId,ETM.ExemptTypeName,L.ExemptSubTypeId,
	L.RCTNumber,L.TagClassId,FC.FasTagVehicleClassName AS TagClassName,L.TagPlateNumber,L.TagEPC,L.TagReadDateTime,L.TagReadById,
	L.PermissibleVehicleWeight,L.ActualVehicleWeight,L.OverWeightAmount,L.TagPenaltyAmount,L.TransactionAmount,L.TransactionDateTime,
	L.TransactionFrontImage,L.TransactionBackImage,L.TransactionAvcImage,L.TransactionVideo,L.ExemptionProofImage,L.DestinationPlazaId,L.UserId,L.LoginId,
	L.IsReturnJourney,L.IsExcessJourney,L.IsBarrierAutoClose,L.IsTowVehicle,L.IsFleetTranscation,L.FleetCount,L.TransactionStatus,L.IsReviewedRequired,
	L.ReviewedStatus,L.ReviewedPlateNumber,L.ReviewedClassCorrectionId,L.ReviewedSubClassId,RFC.FasTagVehicleClassName AS ReviewedSubClassName,
	ReviewedTransactionTypeId,RTTM.TransactionTypeName AS ReviewedTransactionTypeName,L.ReviewedTransactionAmount,CC.ClassCorrectionName AS ReviewedClassCorrectionName,
	L.DifferenceAmount,L.ReviewedById,U.LoginId AS ReviewedLoginId,L.ReviewedDateTime,L.ReviewedRemark,L.ReceivedDateTime,L.CreatedDate 
	FROM tbl_LaneTransaction L
	LEFT JOIN tbl_SystemIntegratorConfiguration SI ON L.SystemIntegratorId=SI.SystemIntegratorId
	LEFT JOIN tbl_PlazaConfiguration PC ON L.PlazaId=PC.PlazaId
	LEFT JOIN tbl_JourneyMaster JM ON L.JourneyId=JM.JourneyId
	LEFT JOIN tbl_LaneConfiguration LC ON L.LaneId=LC.LaneId
	LEFT JOIN tbl_SystemVehicleClass SV ON L.VehicleClassId=SV.SystemVehicleClassId
	LEFT JOIN tbl_FasTagVehicleClass SSV ON L.VehicleSubClassId=SSV.FasTagVehicleClassId
	LEFT JOIN tbl_FasTagVehicleClass AVC ON L.VehicleAvcClassId=AVC.FasTagVehicleClassId
	LEFT JOIN tbl_TransactionTypeMaster TTM ON L.TransactionTypeId=TTM.TransactionTypeId
	LEFT JOIN tbl_PaymentTypeMaster PTM ON L.PaymentTypeId=PTM.PaymentTypeId
	LEFT JOIN tbl_ExemptTypeMaster ETM ON L.ExemptTypeId=ETM.ExemptTypeId
	LEFT JOIN tbl_FasTagVehicleClass FC ON L.TagClassId=FC.FasTagVehicleClassId
	LEFT JOIN tbl_FasTagVehicleClass RFC ON L.ReviewedSubClassId=RFC.FasTagVehicleClassId
	LEFT JOIN tbl_TransactionTypeMaster RTTM ON L.ReviewedTransactionTypeId=RTTM.TransactionTypeId
	LEFT JOIN tbl_UserMaster U ON L.ReviewedById=U.UserId
	LEFT JOIN tbl_ClassCorrectionMaster CC ON L.ReviewedClassCorrectionId=CC.ClassCorrectionId
	ORDER BY L.TransactionDateTime DESC
END
GO
/****** Object:  StoredProcedure [dbo].[USP_LaneTransactionGetByFilter]    Script Date: 07-Jan-25 9:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_LaneTransactionGetByFilter]
@FilterQuery varchar(4000)
AS
	BEGIN
		EXEC('SELECT L.MasterTransactionId,L.PlazaTransactionId,L.LaneTransactionId,L.SystemIntegratorId,SI.Name as SystemIntegratorName,L.JourneyId,JM.JourneyName,
	L.PlazaId,PC.PlazaName,L.LaneId,LC.LaneNumber,LC.LaneTypeId,L.LaneStatusId,LC.LaneDirectionId,L.ShiftId,L.PlateNumber,L.VehicleClassId,SV.SystemVehicleClassName AS VehicleClassName,
	L.VehicleSubClassId,SSV.FasTagVehicleClassName AS VehicleSubClassName,L.VehicleAvcClassId,AVC.FasTagVehicleClassName AS VehicleAvcClassName,
	L.TransactionTypeId,TTM.TransactionTypeName,L.PaymentTypeId,PTM.PaymentTypeName,L.ExemptTypeId,ETM.ExemptTypeName,L.ExemptSubTypeId,
	L.RCTNumber,L.TagClassId,FC.FasTagVehicleClassName AS TagClassName,L.TagPlateNumber,L.TagEPC,L.TagReadDateTime,L.TagReadById,
	L.PermissibleVehicleWeight,L.ActualVehicleWeight,L.OverWeightAmount,L.TagPenaltyAmount,L.TransactionAmount,L.TransactionDateTime,
	L.TransactionFrontImage,L.TransactionBackImage,L.TransactionAvcImage,L.TransactionVideo,L.ExemptionProofImage,L.DestinationPlazaId,L.UserId,L.LoginId,
	L.IsReturnJourney,L.IsExcessJourney,L.IsBarrierAutoClose,L.IsTowVehicle,L.IsFleetTranscation,L.FleetCount,L.TransactionStatus,L.IsReviewedRequired,
	L.ReviewedStatus,L.ReviewedPlateNumber,L.ReviewedClassCorrectionId,L.ReviewedSubClassId,RFC.FasTagVehicleClassName AS ReviewedSubClassName,
	ReviewedTransactionTypeId,RTTM.TransactionTypeName AS ReviewedTransactionTypeName,L.ReviewedTransactionAmount,CC.ClassCorrectionName AS ReviewedClassCorrectionName,
	L.DifferenceAmount,L.ReviewedById,U.LoginId AS ReviewedLoginId,L.ReviewedDateTime,L.ReviewedRemark,L.ReceivedDateTime,L.CreatedDate 
		FROM tbl_LaneTransaction L
		LEFT JOIN tbl_SystemIntegratorConfiguration SI ON L.SystemIntegratorId=SI.SystemIntegratorId
		LEFT JOIN tbl_PlazaConfiguration PC ON L.PlazaId=PC.PlazaId
		LEFT JOIN tbl_JourneyMaster JM ON L.JourneyId=JM.JourneyId
		LEFT JOIN tbl_LaneConfiguration LC ON L.LaneId=LC.LaneId
		LEFT JOIN tbl_SystemVehicleClass SV ON L.VehicleClassId=SV.SystemVehicleClassId
		LEFT JOIN tbl_FasTagVehicleClass SSV ON L.VehicleSubClassId=SSV.FasTagVehicleClassId
		LEFT JOIN tbl_FasTagVehicleClass AVC ON L.VehicleAvcClassId=AVC.FasTagVehicleClassId
		LEFT JOIN tbl_TransactionTypeMaster TTM ON L.TransactionTypeId=TTM.TransactionTypeId
		LEFT JOIN tbl_PaymentTypeMaster PTM ON L.PaymentTypeId=PTM.PaymentTypeId
		LEFT JOIN tbl_ExemptTypeMaster ETM ON L.ExemptTypeId=ETM.ExemptTypeId
		LEFT JOIN tbl_FasTagVehicleClass FC ON L.TagClassId=FC.FasTagVehicleClassId
		LEFT JOIN tbl_FasTagVehicleClass RFC ON L.ReviewedSubClassId=RFC.FasTagVehicleClassId
		LEFT JOIN tbl_TransactionTypeMaster RTTM ON L.ReviewedTransactionTypeId=RTTM.TransactionTypeId
		LEFT JOIN tbl_UserMaster U ON L.ReviewedById=U.UserId
		LEFT JOIN tbl_ClassCorrectionMaster CC ON L.ReviewedClassCorrectionId=CC.ClassCorrectionId
			'+@FilterQuery+' ORDER BY TransactionDateTime DESC')
	END
	--GO
	--EXEC USP_LaneTransactionGetByFilter
	--@FilterQuery='WHERE CONVERT(DATE,L.TransactionDateTime) >= CONVERT(DATE,''01-Aug-2023 16:16:39'') 
	--AND CONVERT(DATE,L.TransactionDateTime) <= CONVERT(DATE,''02-Sep-2023 16:16:39'') AND L.ShiftId IN (2) '
GO
/****** Object:  StoredProcedure [dbo].[USP_LaneTransactionGetLatest]    Script Date: 07-Jan-25 9:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_LaneTransactionGetLatest]
AS BEGIN
SELECT TOP 100 L.MasterTransactionId,L.PlazaTransactionId,L.LaneTransactionId,L.SystemIntegratorId,SI.Name as SystemIntegratorName,L.JourneyId,JM.JourneyName,
	L.PlazaId,PC.PlazaName,L.LaneId,LC.LaneNumber,LC.LaneTypeId,L.LaneStatusId,L.LaneModeId,L.LaneDirectionId,L.ShiftId,
	L.TransactionTypeId,TTM.TransactionTypeName,L.PaymentTypeId,PTM.PaymentTypeName,L.ExemptTypeId,ETM.ExemptTypeName,L.ExemptSubTypeId,
	L.VehicleClassId,SV.SystemVehicleClassName AS VehicleClassName,L.VehicleSubClassId,SSV.FasTagVehicleClassName AS VehicleSubClassName,
	L.VehicleAvcClassId,AVC.FasTagVehicleClassName AS VehicleAvcClassName,L.PlateNumber,L.RCTNumber,L.TagEPC,L.TagClassId,FC.FasTagVehicleClassName AS TagClassName,
	L.TagPlateNumber,L.TagReadDateTime,L.TagReadCount,L.TagReadById,L.PermissibleVehicleWeight,L.ActualVehicleWeight,L.IsOverWeightCharged,
	L.OverWeightAmount,L.TagPenaltyAmount,L.TransactionAmount,L.TransactionDateTime,L.TransactionFrontImage,L.TransactionBackImage,
	L.TransactionAvcImage,L.TransactionVideo,L.ExemptionProofImage,L.DestinationPlazaId,L.UserId,L.LoginId,L.IsReturnJourney,L.IsExcessJourney,
	L.IsBarrierAutoClose,L.IsTowVehicle,L.IsFleetTranscation,L.FleetCount,L.TransactionStatus,L.IsReviewedRequired,L.ReviewedStatus,
	L.ReviewedPlateNumber,L.ReviewedClassCorrectionId,L.ReviewedSubClassId,RFC.FasTagVehicleClassName AS ReviewedSubClassName,
	ReviewedTransactionTypeId,RTTM.TransactionTypeName AS ReviewedTransactionTypeName,L.ReviewedTransactionAmount,CC.ClassCorrectionName AS ReviewedClassCorrectionName,
	L.DifferenceAmount,L.ReviewedById,U.LoginId AS ReviewedLoginId,L.ReviewedDateTime,L.ReviewedRemark,L.ReceivedDateTime,L.CreatedDate 
	FROM tbl_LaneTransaction L
	LEFT JOIN tbl_SystemIntegratorConfiguration SI ON L.SystemIntegratorId=SI.SystemIntegratorId
	LEFT JOIN tbl_PlazaConfiguration PC ON L.PlazaId=PC.PlazaId
	LEFT JOIN tbl_JourneyMaster JM ON L.JourneyId=JM.JourneyId
	LEFT JOIN tbl_LaneConfiguration LC ON L.LaneId=LC.LaneId
	LEFT JOIN tbl_SystemVehicleClass SV ON L.VehicleClassId=SV.SystemVehicleClassId
	LEFT JOIN tbl_FasTagVehicleClass SSV ON L.VehicleSubClassId=SSV.FasTagVehicleClassId
	LEFT JOIN tbl_FasTagVehicleClass AVC ON L.VehicleAvcClassId=AVC.FasTagVehicleClassId
	LEFT JOIN tbl_TransactionTypeMaster TTM ON L.TransactionTypeId=TTM.TransactionTypeId
	LEFT JOIN tbl_PaymentTypeMaster PTM ON L.PaymentTypeId=PTM.PaymentTypeId
	LEFT JOIN tbl_ExemptTypeMaster ETM ON L.ExemptTypeId=ETM.ExemptTypeId
	LEFT JOIN tbl_FasTagVehicleClass FC ON L.TagClassId=FC.FasTagVehicleClassId
	LEFT JOIN tbl_FasTagVehicleClass RFC ON L.ReviewedSubClassId=RFC.FasTagVehicleClassId
	LEFT JOIN tbl_TransactionTypeMaster RTTM ON L.ReviewedTransactionTypeId=RTTM.TransactionTypeId
	LEFT JOIN tbl_UserMaster U ON L.ReviewedById=U.UserId
	LEFT JOIN tbl_ClassCorrectionMaster CC ON L.ReviewedClassCorrectionId=CC.ClassCorrectionId
ORDER BY L.TransactionDateTime DESC
END
GO
/****** Object:  StoredProcedure [dbo].[USP_LaneTransactionInsert]    Script Date: 07-Jan-25 9:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_LaneTransactionInsert]
@MasterTransactionId VARCHAR(30),
@PlazaTransactionId VARCHAR(30),
@LaneTransactionId VARCHAR(30),
@SystemIntegratorId smallint,
@JourneyId smallint,
@PlazaId smallint,
@LaneId smallint,
@LaneStatusId bit,
@LaneModeId bit,
@LaneDirectionId smallint,
@ShiftId smallint,
@TransactionTypeId smallint,
@PaymentTypeId smallint,
@ExemptTypeId smallint,
@ExemptSubTypeId smallint,
@VehicleClassId smallint,
@VehicleSubClassId smallint,
@VehicleAvcClassId smallint,
@PlateNumber varchar(20),
@RCTNumber varchar(32),
@TagEPC varchar(32),
@TagClassId smallint,
@TagPlateNumber varchar(20),
@TagReadDateTime datetime2(4),
@TagReadCount smallint,
@TagReadById smallint,
@PermissibleVehicleWeight decimal(18, 3),
@ActualVehicleWeight decimal(18, 3),
@IsOverWeightCharged bit,
@OverWeightAmount decimal(18, 2),
@TagPenaltyAmount decimal(18, 2),
@TransactionAmount decimal(18, 2),
@TransactionDateTime datetime2(4),
@TransactionFrontImage varchar(255),
@TransactionBackImage varchar(255),
@TransactionAvcImage varchar(255),
@TransactionVideo varchar(255),
@ExemptionProofImage varchar(255),
@DestinationPlazaId smallint,
@UserId bigint,
@LoginId varchar(20),
@IsReturnJourney bit,
@IsExcessJourney bit,
@IsBarrierAutoClose bit,
@IsTowVehicle bit,
@IsFleetTranscation bit,
@FleetCount smallint,
@TCRemark varchar(255),
@ReceivedDateTime datetime
AS BEGIN
	CREATE TABLE #Temp(AlertMessage varchar(100))
	BEGIN TRY
		DECLARE @IsReviewedRequired bit
		DECLARE @IsAccessControl bit
		DECLARE @FasTagTransactionId varchar(50)
		DECLARE @PlazaZoneId varchar(50)
		DECLARE @LaneNumber smallint
		SELECT @IsAccessControl=IsAccessControl FROM tbl_SystemSetting
		SELECT @IsReviewedRequired=ReviewRequired FROM tbl_TransactionTypeMaster WHERE TransactionTypeId=@TransactionTypeId
		if @VehicleAvcClassId=0
		BEGIN
			SET @VehicleAvcClassId=@VehicleClassId
		END
		IF(@IsReviewedRequired=0 AND @VehicleAvcClassId<> @VehicleSubClassId)
		BEGIN
			SET @IsReviewedRequired=1
		END
		IF EXISTS (SELECT 1 FROM tbl_LaneTransaction WHERE LaneTransactionId = @LaneTransactionId)
        BEGIN
            UPDATE tbl_LaneTransaction
            SET MasterTransactionId = @MasterTransactionId,
                PlazaTransactionId = @PlazaTransactionId,
                SystemIntegratorId = @SystemIntegratorId,
                JourneyId = @JourneyId,
                PlazaId = @PlazaId,
                LaneId = @LaneId,
                LaneStatusId = @LaneStatusId,
                LaneModeId = @LaneModeId,
                LaneDirectionId = @LaneDirectionId,
                ShiftId = @ShiftId,
                TransactionTypeId = @TransactionTypeId,
                PaymentTypeId = @PaymentTypeId,
                ExemptTypeId = @ExemptTypeId,
                ExemptSubTypeId = @ExemptSubTypeId,
                RCTNumber = @RCTNumber,
                PlateNumber = @PlateNumber,
                VehicleClassId = @VehicleClassId,
                VehicleSubClassId = @VehicleSubClassId,
                VehicleAvcClassId = @VehicleAvcClassId,
                TagEPC = @TagEPC,
                TagClassId = @TagClassId,
                TagPlateNumber = @TagPlateNumber,
                TagReadDateTime = @TagReadDateTime,
                TagReadCount = @TagReadCount,
                TagReadById = @TagReadById,
                PermissibleVehicleWeight = @PermissibleVehicleWeight,
                ActualVehicleWeight = @ActualVehicleWeight,
                IsOverWeightCharged = @IsOverWeightCharged,
                OverWeightAmount = @OverWeightAmount,
                TagPenaltyAmount = @TagPenaltyAmount,
                TransactionAmount = @TransactionAmount,
                TransactionDateTime = @TransactionDateTime,
                TransactionFrontImage = @TransactionFrontImage,
                TransactionBackImage = @TransactionBackImage,
                TransactionAvcImage = @TransactionAvcImage,
                TransactionVideo = @TransactionVideo,
                ExemptionProofImage = @ExemptionProofImage,
                DestinationPlazaId = @DestinationPlazaId,
                UserId = @UserId,
                LoginId = @LoginId,
                IsReturnJourney = @IsReturnJourney,
                IsExcessJourney = @IsExcessJourney,
                IsBarrierAutoClose = @IsBarrierAutoClose,
                IsTowVehicle = @IsTowVehicle,
                IsFleetTranscation = @IsFleetTranscation,
                FleetCount = @FleetCount,
                TCRemark = @TCRemark,
                IsReviewedRequired = @IsReviewedRequired,
                ReceivedDateTime = @ReceivedDateTime
            WHERE LaneTransactionId = @LaneTransactionId
        END
        ELSE
        BEGIN
			IF(@TransactionTypeId<>1)
			BEGIN
				INSERT INTO tbl_LaneTransaction(MasterTransactionId,PlazaTransactionId,LaneTransactionId,SystemIntegratorId,JourneyId,PlazaId,LaneId,
				LaneStatusId,LaneModeId,LaneDirectionId,ShiftId,TransactionTypeId,PaymentTypeId,ExemptTypeId,ExemptSubTypeId,RCTNumber,PlateNumber,VehicleClassId,
				VehicleSubClassId,VehicleAvcClassId,PermissibleVehicleWeight,ActualVehicleWeight,IsOverWeightCharged,OverWeightAmount,TagPenaltyAmount,
				TransactionAmount,TransactionDateTime,TransactionFrontImage,TransactionBackImage,TransactionAvcImage,TransactionVideo,ExemptionProofImage,
				DestinationPlazaId,UserId,LoginId,IsReturnJourney,IsExcessJourney,IsBarrierAutoClose,IsTowVehicle,IsFleetTranscation,FleetCount,
				IsReviewedRequired,TCRemark,ReceivedDateTime,TransactionStatus,CreatedDate)
				VALUES(@MasterTransactionId,@PlazaTransactionId,@LaneTransactionId,@SystemIntegratorId,@JourneyId,@PlazaId,@LaneId,
				@LaneStatusId,@LaneModeId,@LaneDirectionId,@ShiftId,@TransactionTypeId,@PaymentTypeId,@ExemptTypeId,@ExemptSubTypeId,@RCTNumber,@PlateNumber,@VehicleClassId,
				@VehicleSubClassId,@VehicleAvcClassId,@PermissibleVehicleWeight,@ActualVehicleWeight,@IsOverWeightCharged,@OverWeightAmount,@TagPenaltyAmount,
				@TransactionAmount,@TransactionDateTime,@TransactionFrontImage,@TransactionBackImage,@TransactionAvcImage,@TransactionVideo,@ExemptionProofImage,
				@DestinationPlazaId,@UserId,@LoginId,@IsReturnJourney,@IsExcessJourney,@IsBarrierAutoClose,@IsTowVehicle,@IsFleetTranscation,@FleetCount,
				@IsReviewedRequired,@TCRemark,@ReceivedDateTime,1,GETDATE())
			END
			ELSE
			BEGIN
				INSERT INTO tbl_LaneTransaction(MasterTransactionId,PlazaTransactionId,LaneTransactionId,SystemIntegratorId,JourneyId,PlazaId,LaneId,
				LaneStatusId,LaneModeId,LaneDirectionId,ShiftId,TransactionTypeId,PaymentTypeId,ExemptTypeId,ExemptSubTypeId,RCTNumber,PlateNumber,VehicleClassId,
				VehicleSubClassId,VehicleAvcClassId,TagEPC,TagClassId,TagPlateNumber,TagReadDateTime,TagReadCount,TagReadById,PermissibleVehicleWeight,ActualVehicleWeight,
				IsOverWeightCharged,OverWeightAmount,TagPenaltyAmount,TransactionAmount,TransactionDateTime,TransactionFrontImage,TransactionBackImage,
				TransactionAvcImage,TransactionVideo,ExemptionProofImage,DestinationPlazaId,UserId,LoginId,IsReturnJourney,IsExcessJourney,IsBarrierAutoClose,
				IsTowVehicle,IsFleetTranscation,FleetCount,TCRemark,IsReviewedRequired,ReceivedDateTime,TransactionStatus,CreatedDate)
				VALUES(@MasterTransactionId,@PlazaTransactionId,@LaneTransactionId,@SystemIntegratorId,@JourneyId,@PlazaId,@LaneId,
				@LaneStatusId,@LaneModeId,@LaneDirectionId,@ShiftId,@TransactionTypeId,@PaymentTypeId,@ExemptTypeId,@ExemptSubTypeId,@RCTNumber,@PlateNumber,@VehicleClassId,
				@VehicleSubClassId,@VehicleAvcClassId,@TagEPC,@TagClassId,@TagPlateNumber,@TagReadDateTime,@TagReadCount,@TagReadById,@PermissibleVehicleWeight,@ActualVehicleWeight,
				@IsOverWeightCharged,@OverWeightAmount,@TagPenaltyAmount,@TransactionAmount,@TransactionDateTime,@TransactionFrontImage,@TransactionBackImage,
				@TransactionAvcImage,@TransactionVideo,@ExemptionProofImage,@DestinationPlazaId,@UserId,@LoginId,@IsReturnJourney,@IsExcessJourney,@IsBarrierAutoClose,
				@IsTowVehicle,@IsFleetTranscation,@FleetCount,@TCRemark,@IsReviewedRequired,@ReceivedDateTime,1,GETDATE())
				IF(@PlazaTransactionId<>0 AND @IsAccessControl=0)
				BEGIN
					SELECT @PlazaZoneId=PlazaZoneId FROM tbl_PlazaConfiguration WHERE PlazaId=@PlazaId
					SELECT @LaneNumber=LaneNumber FROM tbl_LaneConfiguration WHERE LaneId=@LaneId
					SET @FasTagTransactionId=@PlazaZoneId+RIGHT('LLL'+CAST(@LaneNumber AS VARCHAR),3)+CONVERT(VARCHAR,FORMAT(@TransactionDateTime, 'ddMMyyHHmmssf'))
				

					INSERT INTO tbl_ICDRequestPayDetail(PlazaTransactionId,MessageId,TransactionId,Note,RefId,RefUrl,TransactionTypeName,ReaderSignAuth,
					ReaderTagVerified,ReaderProcRestrictionResult,ReaderVehicleAuth,ReaderPublicKeyCVV,TagSignature,PaymentMode,OverwightPaymentMode,RequestStatusId)
					VALUES(@PlazaTransactionId,REPLACE(newid(),'-',''),@FasTagTransactionId,'','','','DEBIT','NOT_VERIFIED',
					'NETC TAG','','UNKNOWN','','','Tag','Cash',0)
				END
			END
			IF NOT EXISTS(SELECT ShiftId FROM tbl_ShiftStatusDetail WHERE ShiftId=@ShiftId AND ShiftDate=CONVERT(DATE,@TransactionDateTime) AND PlazaId=@PlazaId)
			BEGIN
				INSERT INTO tbl_ShiftStatusDetail(PlazaId,ShiftId,ShiftDate)
				VALUES(@PlazaId,@ShiftId,CONVERT(DATE,@TransactionDateTime))
			END
		END
		INSERT INTO #Temp(AlertMessage)VALUES('success');
	END TRY  
	BEGIN CATCH  
		INSERT INTO #Temp(AlertMessage)VALUES('failed');
		EXECUTE usp_ErrorInfoInsert;  
	END CATCH  
	SELECT * FROM #Temp
END
GO
/****** Object:  StoredProcedure [dbo].[USP_LaneTransactionReviewCancel]    Script Date: 07-Jan-25 9:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[USP_LaneTransactionReviewCancel]
@PlazaTransactionId varchar(30),
@LaneTransactionId varchar(30),
@ReviewedById	bigint,
@ReviewedDateTime datetime,
@ReviewedRemark	varchar(255)
AS
BEGIN
	DECLARE @MenuId smallint=9;
	DECLARE @CVal nvarchar(4000)
	DECLARE @PVal nvarchar(4000)
	DECLARE @ShiftId smallint;
	DECLARE @ShiftStatus smallint;
	DECLARE @ShiftDate DATE;
	CREATE TABLE #Temp(AlertMessage varchar(100))
	DECLARE @cnt int
	BEGIN TRY 
	SELECT @MenuId=MenuId FROM tbl_MenuMaster WHERE MenuURL ='Unaudited'
	IF EXISTS(SELECT LaneTransactionId FROM tbl_LaneTransaction where PlazaTransactionId=@PlazaTransactionId and LaneTransactionId=@LaneTransactionId and ReviewedStatus=1)
	BEGIN
		INSERT INTO #Temp(AlertMessage)
		VALUES('Transaction already audited!')
	END
	SELECT @cnt=COUNT(AlertMessage)  FROM #Temp
	IF(@cnt=0)
		BEGIN

			SELECT @ShiftStatus=ShiftStatus FROM tbl_ShiftStatusDetail WHERE ShiftId=@ShiftId AND ShiftDate=@ShiftDate
			IF(ISNULL(@ShiftStatus,0)<>1)
			BEGIN
				UPDATE tbl_LaneTransaction 
				SET ReviewedStatus=1,ReviewedById=@ReviewedById,ReviewedDateTime=@ReviewedDateTime,
				ReviewedRemark=@ReviewedRemark,TransactionStatus=0
				WHERE PlazaTransactionId=@PlazaTransactionId AND LaneTransactionId=@LaneTransactionId;

				SET @CVal=(SELECT PlazaTransactionId,PlateNumber,VehicleClassId
				FROM tbl_LaneTransaction 
				WHERE PlazaTransactionId=@PlazaTransactionId AND LaneTransactionId=@LaneTransactionId
				FOR JSON AUTO, WITHOUT_ARRAY_WRAPPER)	
			
				SET @PVal=(SELECT PlazaTransactionId,ReviewedPlateNumber,ReviewedSubClassId
				FROM tbl_LaneTransaction 
				WHERE PlazaTransactionId=@PlazaTransactionId AND LaneTransactionId=@LaneTransactionId
				FOR JSON AUTO, WITHOUT_ARRAY_WRAPPER)	
				
				INSERT INTO tbl_ActivityLog(UserId,CurrentColumn,ActionId,MenuId,CreatedDate)
				VALUES(@ReviewedById,@CVal,'Insert',@MenuId,@ReviewedDateTime);
				INSERT INTO #Temp(AlertMessage)
			    VALUES('success')

			END
			ELSE
			BEGIN
				INSERT INTO #Temp(AlertMessage)VALUES('This transaction shift already closed');
			END
		END
		END TRY  
	BEGIN CATCH  
		INSERT INTO #Temp(AlertMessage)VALUES('failed');
		EXECUTE USP_ErrorInfoInsert;  
	END CATCH  
		select * from #Temp;
END
GO
/****** Object:  StoredProcedure [dbo].[USP_LaneTransactionReviewedGetLatest]    Script Date: 07-Jan-25 9:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_LaneTransactionReviewedGetLatest]
AS BEGIN
	SELECT TOP 100 L.MasterTransactionId,L.PlazaTransactionId,L.LaneTransactionId,L.SystemIntegratorId,SI.Name as SystemIntegratorName,L.JourneyId,JM.JourneyName,
	L.PlazaId,PC.PlazaName,L.LaneId,LC.LaneNumber,LC.LaneTypeId,L.LaneStatusId,LC.LaneDirectionId,L.ShiftId,L.PlateNumber,L.VehicleClassId,SV.SystemVehicleClassName AS VehicleClassName,
	L.VehicleSubClassId,SSV.FasTagVehicleClassName AS VehicleSubClassName,L.VehicleAvcClassId,AVC.FasTagVehicleClassName AS VehicleAvcClassName,
	L.TransactionTypeId,TTM.TransactionTypeName,L.PaymentTypeId,PTM.PaymentTypeName,L.ExemptTypeId,ETM.ExemptTypeName,L.ExemptSubTypeId,
	L.RCTNumber,L.TagClassId,FC.FasTagVehicleClassName AS TagClassName,L.TagPlateNumber,L.TagEPC,L.TagReadDateTime,L.TagReadById,
	L.PermissibleVehicleWeight,L.ActualVehicleWeight,L.OverWeightAmount,L.TagPenaltyAmount,L.TransactionAmount,L.TransactionDateTime,
	L.TransactionFrontImage,L.TransactionBackImage,L.TransactionAvcImage,L.TransactionVideo,L.ExemptionProofImage,L.DestinationPlazaId,L.UserId,L.LoginId,
	L.IsReturnJourney,L.IsExcessJourney,L.IsBarrierAutoClose,L.IsTowVehicle,L.IsFleetTranscation,L.FleetCount,L.TransactionStatus,L.IsReviewedRequired,
	L.ReviewedStatus,L.ReviewedPlateNumber,L.ReviewedClassCorrectionId,L.ReviewedSubClassId,RFC.FasTagVehicleClassName AS ReviewedSubClassName,
	ReviewedTransactionTypeId,RTTM.TransactionTypeName AS ReviewedTransactionTypeName,L.ReviewedTransactionAmount,CC.ClassCorrectionName AS ReviewedClassCorrectionName,
	L.DifferenceAmount,L.ReviewedById,U.LoginId AS ReviewedLoginId,L.ReviewedDateTime,L.ReviewedRemark,L.ReceivedDateTime,L.CreatedDate 
	FROM tbl_LaneTransaction L
	LEFT JOIN tbl_SystemIntegratorConfiguration SI ON L.SystemIntegratorId=SI.SystemIntegratorId
	LEFT JOIN tbl_PlazaConfiguration PC ON L.PlazaId=PC.PlazaId
	LEFT JOIN tbl_JourneyMaster JM ON L.JourneyId=JM.JourneyId
	LEFT JOIN tbl_LaneConfiguration LC ON L.LaneId=LC.LaneId
	LEFT JOIN tbl_SystemVehicleClass SV ON L.VehicleClassId=SV.SystemVehicleClassId
	LEFT JOIN tbl_FasTagVehicleClass SSV ON L.VehicleSubClassId=SSV.FasTagVehicleClassId
	LEFT JOIN tbl_FasTagVehicleClass AVC ON L.VehicleAvcClassId=AVC.FasTagVehicleClassId
	LEFT JOIN tbl_TransactionTypeMaster TTM ON L.TransactionTypeId=TTM.TransactionTypeId
	LEFT JOIN tbl_PaymentTypeMaster PTM ON L.PaymentTypeId=PTM.PaymentTypeId
	LEFT JOIN tbl_ExemptTypeMaster ETM ON L.ExemptTypeId=ETM.ExemptTypeId
	LEFT JOIN tbl_FasTagVehicleClass FC ON L.TagClassId=FC.FasTagVehicleClassId
	LEFT JOIN tbl_FasTagVehicleClass RFC ON L.ReviewedSubClassId=RFC.FasTagVehicleClassId
	LEFT JOIN tbl_TransactionTypeMaster RTTM ON L.ReviewedTransactionTypeId=RTTM.TransactionTypeId
	LEFT JOIN tbl_UserMaster U ON L.ReviewedById=U.UserId
	LEFT JOIN tbl_ClassCorrectionMaster CC ON L.ReviewedClassCorrectionId=CC.ClassCorrectionId
	WHERE L.ReviewedStatus=1
	ORDER BY L.TransactionDateTime DESC
END
--GO
--EXEC USP_LaneTransactionUnReviewedGetLatest
GO
/****** Object:  StoredProcedure [dbo].[USP_LaneTransactionReviewUpdate]    Script Date: 07-Jan-25 9:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[USP_LaneTransactionReviewUpdate]
@PlazaTransactionId varchar(30),
@LaneTransactionId varchar(30),
@ReviewedPlateNumber varchar(20),
@ReviewedClassCorrectionId smallint,
@ReviewedSubClassId	smallint,
@ReviewedTransactionTypeId smallint,
@ReviewedTransactionAmount decimal(18,2),
@DifferenceAmount decimal(18,2),
@ReviewedById	bigint,
@ReviewedDateTime datetime,
@ReviewedRemark	varchar(255)
AS
BEGIN
	DECLARE @MenuId smallint=9;
	DECLARE @CVal nvarchar(4000)
	DECLARE @PVal nvarchar(4000)
	DECLARE @ShiftId smallint;
	DECLARE @ShiftStatus smallint;
	DECLARE @ShiftDate DATE;
	CREATE TABLE #Temp(AlertMessage varchar(100))
	DECLARE @cnt int
	BEGIN TRY 
	SELECT @MenuId=MenuId FROM tbl_MenuMaster WHERE MenuURL ='Unaudited'
	IF EXISTS(SELECT LaneTransactionId FROM tbl_LaneTransaction where PlazaTransactionId=@PlazaTransactionId and LaneTransactionId=@LaneTransactionId and ReviewedStatus=1)
	BEGIN
		INSERT INTO #Temp(AlertMessage)
		VALUES('Transaction already audited!')
	END
	SELECT @cnt=COUNT(AlertMessage)  FROM #Temp
	IF(@cnt=0)
		BEGIN

			SELECT @ShiftStatus=ShiftStatus FROM tbl_ShiftStatusDetail WHERE ShiftId=@ShiftId AND ShiftDate=@ShiftDate
			IF(ISNULL(@ShiftStatus,0)<>1)
			BEGIN
				UPDATE tbl_LaneTransaction 
				SET ReviewedStatus=1,ReviewedPlateNumber=@ReviewedPlateNumber,
				ReviewedClassCorrectionId=@ReviewedClassCorrectionId,ReviewedSubClassId=@ReviewedSubClassId,
				ReviewedTransactionTypeId=@ReviewedTransactionTypeId,ReviewedTransactionAmount=@ReviewedTransactionAmount,
				DifferenceAmount=@DifferenceAmount,ReviewedById=@ReviewedById,ReviewedDateTime=@ReviewedDateTime,ReviewedRemark=@ReviewedRemark
				WHERE PlazaTransactionId=@PlazaTransactionId AND LaneTransactionId=@LaneTransactionId;

				SET @CVal=(SELECT PlazaTransactionId,PlateNumber,VehicleClassId
				FROM tbl_LaneTransaction 
				WHERE PlazaTransactionId=@PlazaTransactionId AND LaneTransactionId=@LaneTransactionId
				FOR JSON AUTO, WITHOUT_ARRAY_WRAPPER)	
			
				SET @PVal=(SELECT PlazaTransactionId,ReviewedPlateNumber,ReviewedSubClassId
				FROM tbl_LaneTransaction 
				WHERE PlazaTransactionId=@PlazaTransactionId AND LaneTransactionId=@LaneTransactionId
				FOR JSON AUTO, WITHOUT_ARRAY_WRAPPER)	
				
				INSERT INTO tbl_ActivityLog(UserId,CurrentColumn,ActionId,MenuId,CreatedDate)
				VALUES(@ReviewedById,@CVal,'Insert',@MenuId,@ReviewedDateTime);
				INSERT INTO #Temp(AlertMessage)
			    VALUES('success')

			END
			ELSE
			BEGIN
				INSERT INTO #Temp(AlertMessage)VALUES('This transaction shift already closed');
			END
		END
		END TRY  
	BEGIN CATCH  
		INSERT INTO #Temp(AlertMessage)VALUES('failed');
		EXECUTE USP_ErrorInfoInsert;  
	END CATCH  
		select * from #Temp;
END
GO
/****** Object:  StoredProcedure [dbo].[USP_LaneTransactionUnReviewedGetLatest]    Script Date: 07-Jan-25 9:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_LaneTransactionUnReviewedGetLatest]
AS BEGIN
	SELECT TOP 100 L.MasterTransactionId,L.PlazaTransactionId,L.LaneTransactionId,L.SystemIntegratorId,SI.Name as SystemIntegratorName,L.JourneyId,JM.JourneyName,
	L.PlazaId,PC.PlazaName,L.LaneId,LC.LaneNumber,LC.LaneTypeId,L.LaneStatusId,LC.LaneDirectionId,L.ShiftId,L.PlateNumber,L.VehicleClassId,SV.SystemVehicleClassName AS VehicleClassName,
	L.VehicleSubClassId,SSV.FasTagVehicleClassName AS VehicleSubClassName,L.VehicleAvcClassId,AVC.FasTagVehicleClassName AS VehicleAvcClassName,
	L.TransactionTypeId,TTM.TransactionTypeName,L.PaymentTypeId,PTM.PaymentTypeName,L.ExemptTypeId,ETM.ExemptTypeName,L.ExemptSubTypeId,
	L.RCTNumber,L.TagClassId,FC.FasTagVehicleClassName AS TagClassName,L.TagPlateNumber,L.TagEPC,L.TagReadDateTime,L.TagReadById,
	L.PermissibleVehicleWeight,L.ActualVehicleWeight,L.OverWeightAmount,L.TagPenaltyAmount,L.TransactionAmount,L.TransactionDateTime,
	L.TransactionFrontImage,L.TransactionBackImage,L.TransactionAvcImage,L.TransactionVideo,L.ExemptionProofImage,L.DestinationPlazaId,L.UserId,L.LoginId,
	L.IsReturnJourney,L.IsExcessJourney,L.IsBarrierAutoClose,L.IsTowVehicle,L.IsFleetTranscation,L.FleetCount,L.TransactionStatus,L.IsReviewedRequired,
	L.ReviewedStatus,L.ReviewedPlateNumber,L.ReviewedClassCorrectionId,L.ReviewedSubClassId,RFC.FasTagVehicleClassName AS ReviewedSubClassName,
	ReviewedTransactionTypeId,RTTM.TransactionTypeName AS ReviewedTransactionTypeName,L.ReviewedTransactionAmount,CC.ClassCorrectionName AS ReviewedClassCorrectionName,
	L.DifferenceAmount,L.ReviewedById,U.LoginId AS ReviewedLoginId,L.ReviewedDateTime,L.ReviewedRemark,L.ReceivedDateTime,L.CreatedDate 
	FROM tbl_LaneTransaction L
	LEFT JOIN tbl_SystemIntegratorConfiguration SI ON L.SystemIntegratorId=SI.SystemIntegratorId
	LEFT JOIN tbl_PlazaConfiguration PC ON L.PlazaId=PC.PlazaId
	LEFT JOIN tbl_JourneyMaster JM ON L.JourneyId=JM.JourneyId
	LEFT JOIN tbl_LaneConfiguration LC ON L.LaneId=LC.LaneId
	LEFT JOIN tbl_SystemVehicleClass SV ON L.VehicleClassId=SV.SystemVehicleClassId
	LEFT JOIN tbl_FasTagVehicleClass SSV ON L.VehicleSubClassId=SSV.FasTagVehicleClassId
	LEFT JOIN tbl_FasTagVehicleClass AVC ON L.VehicleAvcClassId=AVC.FasTagVehicleClassId
	LEFT JOIN tbl_TransactionTypeMaster TTM ON L.TransactionTypeId=TTM.TransactionTypeId
	LEFT JOIN tbl_PaymentTypeMaster PTM ON L.PaymentTypeId=PTM.PaymentTypeId
	LEFT JOIN tbl_ExemptTypeMaster ETM ON L.ExemptTypeId=ETM.ExemptTypeId
	LEFT JOIN tbl_FasTagVehicleClass FC ON L.TagClassId=FC.FasTagVehicleClassId
	LEFT JOIN tbl_FasTagVehicleClass RFC ON L.ReviewedSubClassId=RFC.FasTagVehicleClassId
	LEFT JOIN tbl_TransactionTypeMaster RTTM ON L.ReviewedTransactionTypeId=RTTM.TransactionTypeId
	LEFT JOIN tbl_UserMaster U ON L.ReviewedById=U.UserId
	LEFT JOIN tbl_ClassCorrectionMaster CC ON L.ReviewedClassCorrectionId=CC.ClassCorrectionId
	WHERE L.IsReviewedRequired=1 AND L.ReviewedStatus=0
	ORDER BY L.TransactionDateTime DESC
END
--GO
--EXEC USP_LaneTransactionUnReviewedGetLatest
GO
/****** Object:  StoredProcedure [dbo].[USP_LaneTypeMasterGetAll]    Script Date: 07-Jan-25 9:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_LaneTypeMasterGetAll]
As BEGIN
	SELECT * FROM tbl_LaneTypeMaster;
END
GO
/****** Object:  StoredProcedure [dbo].[USP_LastSevenDaysDetailReport]    Script Date: 07-Jan-25 9:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_LastSevenDaysDetailReport]
@TDate VARCHAR(20)
AS BEGIN
	DECLARE 
	@ColumnName NVARCHAR(MAX), 
	@sql NVARCHAR(MAX), 
	@Scolumns NVARCHAR(MAX) , 
	@Totcolumns NVARCHAR(MAX),
	@NColumnName NVARCHAR(MAX),
	@StartDate Date,
	@EndDate Date;

	CREATE TABLE #tempData (ReportName varchar(50),TDate varchar(50),  TotalTraffic int, TotalRevenue DECIMAL(18,2))

	SET @EndDate=CONVERT(DATE,@TDate)
	SET @StartDate=DATEADD(DAY, -6, @EndDate)

	WHILE @StartDate <=@EndDate
	BEGIN
		INSERT INTO #tempData
		SELECT 'Last Seven Days Details',FORMAT(@StartDate, 'dd-MMM-yyyy')+' 23:59:59',COUNT(1),SUM(TransactionAmount) FROM tbl_LaneTransaction 
		WHERE CONVERT(DATE,TransactionDateTime)=@StartDate AND TransactionStatus=1

		SET @StartDate=DATEADD(DAY, 1, @StartDate)
	END
	INSERT INTO #tempData(TDate,TotalTraffic,TotalRevenue)
	SELECT 'Total',SUM(TotalTraffic),SUM(TotalRevenue) FROM #tempData
	EXEC('SELECT ReportName,TDate AS [Date],TotalTraffic as [Total Traffic],TotalRevenue as [Total Revenue] FROM #tempData')
END

--GO 
--EXEC USP_LastSevenDaysDetailReport
--@TDate='29-Aug-2024'
GO
/****** Object:  StoredProcedure [dbo].[USP_LogingActivityInsert]    Script Date: 07-Jan-25 9:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_LogingActivityInsert]
(
@LoginId varchar(50),
@LoginStatusId smallint,
@UserTypeId bigint=null,
@LoginDateTime datetime,
@LogoutDateTime datetime,
@CreatedDate datetime
)
AS BEGIN
	DECLARE @UserId VARCHAR; 
	SET @UserId= (SELECT UserId FROM tbl_UserMaster WHERE LoginId=@LoginId)

	IF(@LoginStatusId <> 1)BEGIN SET @LoginDateTime = NULL; END
	INSERT INTO tbl_LogingActivity(LoginId,LoginStatusId,UserTypeId,LoginDateTime,LogoutDateTime,CreatedDate)
	VALUES(@UserId,@LoginStatusId,@UserTypeId,@LoginDateTime,NULL,@CreatedDate)
END
GO
/****** Object:  StoredProcedure [dbo].[USP_LogingActivityUpdate]    Script Date: 07-Jan-25 9:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_LogingActivityUpdate]
(
@LoginId varchar(50),
@LoginStatusId smallint,
@UserTypeId bigint=null,
@LoginDateTime datetime,
@LogoutDateTime datetime,
@CreatedDate datetime
)
AS BEGIN
	DECLARE @UserId VARCHAR; 
	SET @UserId= (SELECT UserId FROM tbl_UserMaster WHERE LoginId=@LoginId)

	UPDATE tbl_LogingActivity SET LoginStatusId=@LoginStatusId, LogoutDateTime=@LogoutDateTime, CreatedDate=@CreatedDate 
	WHERE LoginId=@UserId AND LoginStatusId=1 AND ISNULL(LogoutDateTime,'') = ''  
END

GO
/****** Object:  StoredProcedure [dbo].[USP_ManufacturerGetActive]    Script Date: 07-Jan-25 9:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_ManufacturerGetActive] 
AS BEGIN
	SELECT M.ManufacturerId,M.Name,M.Address,M.EmailId,M.MobileNumber,
	M.DataStatus,M.CreatedDate,M.CreatedBy,M.ModifiedDate,M.ModifiedBy,DS.DataStatusName FROM tbl_ManufacturerDetails M
	INNER JOIN tbl_DataStatusMaster DS ON M.DataStatus=DS.DataStatusId
	WHERE M.DataStatus=1
END
GO
/****** Object:  StoredProcedure [dbo].[USP_ManufacturerGetAll]    Script Date: 07-Jan-25 9:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_ManufacturerGetAll] 
AS BEGIN
	SELECT M.ManufacturerId,M.Name,M.Address,M.EmailId,M.MobileNumber,
	M.DataStatus,M.CreatedDate,M.CreatedBy,M.ModifiedDate,M.ModifiedBy,DS.DataStatusName FROM tbl_ManufacturerDetails M
	INNER JOIN tbl_DataStatusMaster DS ON M.DataStatus=DS.DataStatusId
END
GO
/****** Object:  StoredProcedure [dbo].[USP_ManufacturerGetbyId]    Script Date: 07-Jan-25 9:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_ManufacturerGetbyId] 
@ManufacturerId smallint
AS BEGIN
	SELECT M.ManufacturerId,M.Name,M.Address,M.EmailId,M.MobileNumber,
	M.DataStatus,M.CreatedDate,M.CreatedBy,M.ModifiedDate,M.ModifiedBy,DS.DataStatusName FROM tbl_ManufacturerDetails M
	INNER JOIN tbl_DataStatusMaster DS ON M.DataStatus=DS.DataStatusId
	WHERE ManufacturerId=@ManufacturerId
END
GO
/****** Object:  StoredProcedure [dbo].[USP_ManufacturerInsertUpdate]    Script Date: 07-Jan-25 9:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_ManufacturerInsertUpdate] 
@ManufacturerId	smallint,
@Name varchar(100),
@Address varchar(255),
@EmailId varchar(100),
@MobileNumber varchar(20),
@DataStatus smallint,
@CreatedDate DateTime,
@CreatedBy bigint,
@ModifiedDate DateTime,
@ModifiedBy bigint

AS
BEGIN
	DECLARE @MenuId smallint=3;
	DECLARE @CVal nvarchar(4000)
	DECLARE @PVal nvarchar(4000)
	CREATE TABLE #Temp(AlertMessage varchar(100))
	DECLARE @cnt int
	BEGIN TRY 
	SELECT @MenuId=MenuId FROM tbl_MenuMaster WHERE MenuName ='Manufacturer'
	IF EXISTS(SELECT ManufacturerId FROM tbl_ManufacturerDetails where Name=@Name AND ManufacturerId<>@ManufacturerId)
	BEGIN
		INSERT INTO #Temp(AlertMessage)
		VALUES('Equipment Manufacturer Name already exists')
	END
	IF EXISTS(SELECT ManufacturerId FROM tbl_ManufacturerDetails where MobileNumber=@MobileNumber AND ManufacturerId<>@ManufacturerId)
	BEGIN
		INSERT INTO #Temp(AlertMessage)
		VALUES('Equipment Manufacturer Mobile number already exists')
	END
	IF EXISTS(SELECT ManufacturerId FROM tbl_ManufacturerDetails where EmailId=@EmailId AND ManufacturerId<>@ManufacturerId)
	BEGIN
		INSERT INTO #Temp(AlertMessage)
		VALUES('Equipment Manufacturer Email already exists')
	END
	
	SELECT @cnt=COUNT(AlertMessage)  FROM #Temp
	IF(@cnt=0)
		BEGIN
			IF(@ManufacturerId=0)
			BEGIN
				insert into tbl_ManufacturerDetails(Name,Address,EmailId,MobileNumber,DataStatus,CreatedDate,CreatedBy)
				values(@Name,@Address,@EmailId,@MobileNumber,@DataStatus,@CreatedDate,@CreatedBy);
				SELECT @ManufacturerId=@@IDENTITY

				SET @CVal=(SELECT * FROM tbl_ManufacturerDetails WHERE ManufacturerId=@ManufacturerId FOR JSON AUTO, WITHOUT_ARRAY_WRAPPER)		
				
				INSERT INTO tbl_ActivityLog(UserId,CurrentColumn,ActionId,MenuId,CreatedDate)
				VALUES(@CreatedBy,@CVal,'Insert',@MenuId,@CreatedDate);
				
				INSERT INTO #Temp(AlertMessage)VALUES('success');
			END
			ELSE
			BEGIN
				
				SET @PVal=(SELECT * FROM tbl_ManufacturerDetails WHERE ManufacturerId=@ManufacturerId FOR JSON AUTO, WITHOUT_ARRAY_WRAPPER)	
				
				UPDATE tbl_ManufacturerDetails SET Name=@Name,
				Address=@Address,EmailId=@EmailId,
				MobileNumber=@MobileNumber,
				DataStatus=@DataStatus,ModifiedDate=@ModifiedDate,ModifiedBy=@ModifiedBy
				WHERE ManufacturerId=@ManufacturerId
				
				SET @CVal=(SELECT * FROM tbl_ManufacturerDetails WHERE ManufacturerId=@ManufacturerId FOR JSON AUTO, WITHOUT_ARRAY_WRAPPER)		

				INSERT INTO tbl_ActivityLog(UserId,PrevColumn,CurrentColumn,ActionId,MenuId,CreatedDate)
				VALUES(@ModifiedBy,@PVal,@CVal,'Update',@MenuId,@ModifiedDate);

				INSERT INTO #Temp(AlertMessage)VALUES('success');
			END
		END
		END TRY  
	BEGIN CATCH  
		INSERT INTO #Temp(AlertMessage)VALUES('failed');
		EXECUTE USP_ErrorInfoInsert;  
	END CATCH  
		select * from #Temp;
END


GO
/****** Object:  StoredProcedure [dbo].[USP_MasterDataGet]    Script Date: 07-Jan-25 9:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_MasterDataGet]
AS BEGIN
	CREATE TABLE #tempSystemClass(id smallint identity,SystemVehicleClassId smallint,SystemVehicleClassName varchar(100),SystemSubClassIds varchar(4000))
	CREATE TABLE #tempSystemSubClass(ParentClassId smallint,FasTagVehicleClassId smallint,FasTagVehicleClassName varchar(100))
	
	SELECT * FROM tbl_ShiftTimining
	WHERE DataStatus=1

	SELECT * FROM tbl_UserMaster 
	WHERE UserTypeId=4 AND DataStatus=1

	SELECT * FROM tbl_UserMaster 
	WHERE UserTypeId=3 AND DataStatus=1

	SELECT * FROM tbl_PlazaConfiguration 
	WHERE DataStatus=1

	SELECT * FROM tbl_LaneConfiguration 
	WHERE DataStatus=1

	SELECT * FROM tbl_TransactionTypeMaster 
	WHERE DataStatus=1

	SELECT * FROM tbl_PaymentTypeMaster 
	WHERE DataStatus=1

	SELECT * FROM tbl_ExemptTypeMaster 
	WHERE DataStatus=1
	
	INSERT INTO #tempSystemClass(SystemVehicleClassId,SystemVehicleClassName,SystemSubClassIds)
	SELECT SystemVehicleClassId,SystemVehicleClassName,SystemSubClassIds FROM tbl_SystemVehicleClass 
	WHERE DataStatus=1

	DECLARE @Counter INT 
	DECLARE @DCounter INT 
	DECLARE @ParentClassId INT 
	DECLARE @FasTagVehicleClassIds varchar(4000)
	SET @Counter=1
	SELECT @DCounter=COUNT(1) FROM #tempSystemClass
	WHILE (@Counter <= @DCounter)
	BEGIN
		SELECT @FasTagVehicleClassIds=SystemSubClassIds,@ParentClassId=SystemVehicleClassId FROM #tempSystemClass
		WHERE id=@Counter
		INSERT INTO #tempSystemSubClass(ParentClassId,FasTagVehicleClassId,FasTagVehicleClassName)
		SELECT @ParentClassId,FasTagVehicleClassId,FasTagVehicleClassName FROM tbl_FasTagVehicleClass 
		WHERE FasTagVehicleClassId IN (SELECT DataValue from fnc_CommaSeparated(@FasTagVehicleClassIds)) AND DataStatus=1
		SET @Counter  = @Counter  + 1
	END
	SELECT * FROM #tempSystemClass
	SELECT * FROM #tempSystemSubClass
	Select * from tbl_ReportMaster
	WHERE DataStatus=1;
END
--GO
--EXEC USP_MasterDataGet
GO
/****** Object:  StoredProcedure [dbo].[USP_MenuGetAll]    Script Date: 07-Jan-25 9:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_MenuGetAll]
AS BEGIN
	SELECT M.MenuId,M.MenuName,M.MenuUrl,M.MenuIcon,M.OrderBy,0 AS SystemId,
	M.ParentId,M.DataStatus,M.CreatedDate,M.CreatedBy,M.ModifiedDate,M.ModifiedBy,
	(SELECT COUNT(1) FROM tbl_MenuMaster WHERE ParentId=M.MenuId) AS ChildCount
    FROM tbl_MenuMaster M
	WHERE M.ForPlazaServer=1 AND M.DataStatus=1
	ORDER BY OrderBy
END

--GO
--EXEC USP_MenuGetAll


GO
/****** Object:  StoredProcedure [dbo].[USP_MenuGetByRoleId]    Script Date: 07-Jan-25 9:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_MenuGetByRoleId]
@RoleId bigint
AS BEGIN
	
	CREATE table #Temp (MenuId bigint,MenuName varchar(100),MenuUrl varchar(100),MenuIcon varchar(100),OrderBy Smallint,
	ParentId bigint,ChildCount int default 0,DataStatus smallint,CreatedDate datetime,CreatedBy int,ModifiedDate datetime,ModifiedBy int)
	INSERT INTO #Temp(MenuId,MenuName,MenuUrl,MenuIcon,OrderBy,ParentId,DataStatus,CreatedDate,CreatedBy,ModifiedDate,ModifiedBy)
	SELECT M.MenuId,M.MenuName,M.MenuUrl,M.MenuIcon,M.OrderBy,M.ParentId,M.DataStatus,M.CreatedDate,M.CreatedBy,M.ModifiedDate,M.ModifiedBy
    FROM tbl_MenuMaster M
	WHERE M.DataStatus=1 and M.MenuId IN (SELECT MenuId FROM tbl_RolePermission WHERE RoleId=@RoleId AND DataView=1)
	ORDER BY OrderBy

	UPDATE T SET T.ChildCount=V.ChildCount FROM #Temp T INNER JOIN 
	(
		SELECT ParentId,COUNT(1) as ChildCount 
		FROM #Temp WHERE ParentId IN (SELECT MenuId FROM #Temp WHERE ParentId=0)
		GROUP BY ParentId
	) V ON T.MenuId=V.ParentId

	SELECT * FROM #Temp 
	ORDER BY OrderBy

END

--GO
--EXEC USP_MenuGetByRoleId
--@RoleId=1

GO
/****** Object:  StoredProcedure [dbo].[USP_MISReport]    Script Date: 07-Jan-25 9:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_MISReport]
@StartDate VARCHAR(20)
AS BEGIN
EXEC USP_TrafficTransactionDetailReport  @StartDate
EXEC USP_RevenueTransactionDetailReport  @StartDate
EXEC USP_OverloadTransactionDetailReport  @StartDate
EXEC USP_OverloadRevenueTransactionDetailReport @StartDate
EXEC USP_LastSevenDaysDetailReport  @StartDate
EXEC USP_ShiftStatusByDate  @StartDate



END

--GO 
--EXEC USP_MISReport
--@StartDate='05-Aug-2024'
GO
/****** Object:  StoredProcedure [dbo].[USP_OverloadRevenueTransactionDetailReport]    Script Date: 07-Jan-25 9:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_OverloadRevenueTransactionDetailReport]
@TDate VARCHAR(20)
AS BEGIN
	
	CREATE TABLE #tempClassDetails(RowNumber smallint,VehicleClassId smallint,VehicleClassName varchar(50))
	INSERT INTO #tempClassDetails(VehicleClassId,VehicleClassName,RowNumber)
	Select SystemVehicleSubClassId,FasTagVehicleClassName,ROW_NUMBER() OVER(ORDER BY SystemVehicleSubClassId asc)AS Row          
	FROM tbl_SystemVehicleSubClass S 
	INNER JOIN tbl_FasTagVehicleClass F ON S.SystemVehicleSubClassId = F.FasTagVehicleClassId 
	ORDER BY SystemVehicleSubClassId asc

	CREATE TABLE #tempData (ReportName varchar(50),MOP varchar(50))
	

	DECLARE @count int=0   
	DECLARE @Index  int=1


	
	DECLARE 
	@ColumnName NVARCHAR(MAX), 
	@sql NVARCHAR(MAX), 
	@Scolumns NVARCHAR(MAX) , 
	@Totcolumns NVARCHAR(MAX),
	@NColumnName NVARCHAR(MAX);

	select @count=count(1) from #tempClassDetails      
	WHILE @Index <= @count  
	BEGIN
		SELECT @ColumnName = VehicleClassName FROM #tempClassDetails WHERE RowNumber = @Index;
		EXEC('ALTER TABLE #tempData ADD [' + @ColumnName + '] decimal(10,2) DEFAULT 0');
		SET @Index += 1;
	END
	ALTER TABLE #tempData ADD Total decimal(10,2) DEFAULT 0, RevenueAverage decimal(10,2) DEFAULT 0
	

	SET @ColumnName = 
	(
		SELECT DISTINCT '' + QUOTENAME(VehicleClassName) + ',' 
		FROM #tempClassDetails 
		FOR XML PATH('')
	);

	SET @NColumnName = 
	(
		SELECT DISTINCT 'ISNULL(' + QUOTENAME(VehicleClassName) + ', 0),' 
		FROM #tempClassDetails 
		FOR XML PATH('')
	);

	SET @Scolumns = 
	(
		SELECT DISTINCT 'ISNULL(' + QUOTENAME(VehicleClassName) + ', 0)+' 
		FROM #tempClassDetails 
		FOR XML PATH('')
	);

	SET @Totcolumns = 
	(
		SELECT DISTINCT 'SUM(ISNULL(' + QUOTENAME(VehicleClassName) + ', 0)),' 
		FROM #tempClassDetails 
		FOR XML PATH('')
	);



	SET @ColumnName = LEFT(@ColumnName, LEN(@ColumnName) - 1);
	SET @Scolumns = LEFT(@Scolumns, LEN(@Scolumns) - 1);
	SET @Totcolumns = LEFT(@Totcolumns, LEN(@Totcolumns) - 1);
	SET @NColumnName = LEFT(@NColumnName, LEN(@NColumnName) - 1);
	SET @sql = '
	INSERT INTO #tempData(ReportName,MOP,' + @ColumnName + ',Total)
	SELECT 
		ReportName,MOP, ' + @NColumnName + ', Total
	FROM 
		(
			SELECT 
				''Overload Revenue Transaction Detail'' AS ReportName,
				ETM.TransactionTypeName AS MOP, 
				SVC.SystemVehicleClassName,
				SUM(LT.TransactionAmount) AS [Count]
			FROM 
				tbl_TransactionTypeMaster ETM
			CROSS JOIN tbl_SystemVehicleClass SVC
			LEFT JOIN tbl_LaneTransaction LT ON LT.TransactionTypeId = ETM.TransactionTypeId AND LT.VehicleClassId = SVC.SystemVehicleClassId
			AND CONVERT(date,LT.TransactionDateTime)=CONVERT(date,''' + @TDate + ''') AND ActualVehicleWeight>PermissibleVehicleWeight
			WHERE ETM.DataStatus=1 AND ETM.TransactionTypeId <> 4
			GROUP BY 
				ETM.TransactionTypeName, SVC.SystemVehicleClassName
		) AS SourceTable
	PIVOT 
		(
			SUM([Count]) FOR SystemVehicleClassName IN (' + @ColumnName + ')
		) AS PivotTable
	CROSS APPLY (
		SELECT SUM(cnt) AS Total
		FROM (VALUES (' + @Scolumns + ')) AS X(cnt)
	) AS TotalColumns'
		
		EXEC sp_executesql @sql;
		EXEC('INSERT INTO #tempData(MOP,' + @ColumnName + ',Total) SELECT ''Total'','+@Totcolumns+',SUM(Total) FROM #tempData')

		

		UPDATE #tempData 
		SET RevenueAverage = ISNULL((Total / 
		(SELECT NULLIF(Total, 0) FROM #tempData WHERE MOP = 'Total'))*100,0);

		EXEC('SELECT ReportName,MOP,'+@ColumnName+',Total,RevenueAverage AS [Revenue Average] FROM #tempData')
END

--GO 
--EXEC USP_OverloadRevenueTransactionDetailReport
--@TDate='29-Aug-2024'
GO
/****** Object:  StoredProcedure [dbo].[USP_OverloadTransactionDetailReport]    Script Date: 07-Jan-25 9:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_OverloadTransactionDetailReport]
@TDate VARCHAR(20)
AS BEGIN
	
	CREATE TABLE #tempClassDetails(RowNumber smallint,VehicleClassId smallint,VehicleClassName varchar(50))
	INSERT INTO #tempClassDetails(VehicleClassId,VehicleClassName,RowNumber)
	Select SystemVehicleSubClassId,FasTagVehicleClassName,ROW_NUMBER() OVER(ORDER BY SystemVehicleSubClassId asc)AS Row          
	FROM tbl_SystemVehicleSubClass S 
	INNER JOIN tbl_FasTagVehicleClass F ON S.SystemVehicleSubClassId = F.FasTagVehicleClassId 
	ORDER BY SystemVehicleSubClassId asc

	CREATE TABLE #tempData (ReportName varchar(50),MOP varchar(50))
	

	DECLARE @count int=0   
	DECLARE @Index  int=1


	
	DECLARE 
	@ColumnName NVARCHAR(MAX), 
	@sql NVARCHAR(MAX), 
	@Scolumns NVARCHAR(MAX) , 
	@Totcolumns NVARCHAR(MAX),
	@NColumnName NVARCHAR(MAX);

	select @count=count(1) from #tempClassDetails      
	WHILE @Index <= @count  
	BEGIN
		SELECT @ColumnName = VehicleClassName FROM #tempClassDetails WHERE RowNumber = @Index;
		EXEC('ALTER TABLE #tempData ADD [' + @ColumnName + '] int');
		SET @Index += 1;
	END
	ALTER TABLE #tempData ADD Total int DEFAULT 0, TrafficAverage decimal(10,2) DEFAULT 0
	

	SET @ColumnName = 
	(
		SELECT DISTINCT '' + QUOTENAME(VehicleClassName) + ',' 
		FROM #tempClassDetails 
		FOR XML PATH('')
	);

	SET @NColumnName = 
	(
		SELECT DISTINCT 'ISNULL(' + QUOTENAME(VehicleClassName) + ', 0),' 
		FROM #tempClassDetails 
		FOR XML PATH('')
	);

	SET @Scolumns = 
	(
		SELECT DISTINCT 'ISNULL(' + QUOTENAME(VehicleClassName) + ', 0)+' 
		FROM #tempClassDetails 
		FOR XML PATH('')
	);

	SET @Totcolumns = 
	(
		SELECT DISTINCT 'SUM(ISNULL(' + QUOTENAME(VehicleClassName) + ', 0)),' 
		FROM #tempClassDetails 
		FOR XML PATH('')
	);



	SET @ColumnName = LEFT(@ColumnName, LEN(@ColumnName) - 1);
	SET @Scolumns = LEFT(@Scolumns, LEN(@Scolumns) - 1);
	SET @Totcolumns = LEFT(@Totcolumns, LEN(@Totcolumns) - 1);
	SET @NColumnName = LEFT(@NColumnName, LEN(@NColumnName) - 1);
	SET @sql = '
	INSERT INTO #tempData(ReportName,MOP,' + @ColumnName + ',Total)
	SELECT 
		ReportName,MOP, ' + @NColumnName + ', Total
	FROM 
		(
			SELECT 
				''Overload Traffic Transaction Detail'' AS ReportName,
				ETM.TransactionTypeName AS MOP, 
				SVC.SystemVehicleClassName,
				COUNT(LT.VehicleClassId) AS [Count]
			FROM 
				tbl_TransactionTypeMaster ETM
			CROSS JOIN tbl_SystemVehicleClass SVC
			LEFT JOIN tbl_LaneTransaction LT ON LT.TransactionTypeId = ETM.TransactionTypeId AND LT.VehicleClassId = SVC.SystemVehicleClassId
			AND CONVERT(date,LT.TransactionDateTime)=CONVERT(date,''' + @TDate + ''')  AND ActualVehicleWeight>PermissibleVehicleWeight
			WHERE ETM.DataStatus=1 AND ETM.TransactionTypeId <> 4
			GROUP BY 
				ETM.TransactionTypeName, SVC.SystemVehicleClassName
		) AS SourceTable
	PIVOT 
		(
			SUM([Count]) FOR SystemVehicleClassName IN (' + @ColumnName + ')
		) AS PivotTable
	CROSS APPLY (
		SELECT SUM(cnt) AS Total
		FROM (VALUES (' + @Scolumns + ')) AS X(cnt)
	) AS TotalColumns'
		
		EXEC sp_executesql @sql;
		EXEC('INSERT INTO #tempData(MOP,' + @ColumnName + ',Total) SELECT ''Total'','+@Totcolumns+',SUM(Total) FROM #tempData')

		

		UPDATE #tempData 
		SET TrafficAverage = ISNULL((Total / 
		(SELECT NULLIF(Total, 0) FROM #tempData WHERE MOP = 'Total'))*100,0);

		EXEC('SELECT ReportName,MOP,'+@ColumnName+',Total,TrafficAverage AS [Traffic Average] FROM #tempData')
END

--GO 
--EXEC USP_OverloadTransactionDetailReport
--@TDate='29-Aug-2024'
GO
/****** Object:  StoredProcedure [dbo].[USP_PaymentTypeGetActive]    Script Date: 07-Jan-25 9:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_PaymentTypeGetActive]
AS BEGIN
	SELECT P.PaymentTypeId,P.PaymentTypeName,P.TransactionTypeId,T.TransactionTypeName,P.DataStatus,P.CreatedDate,P.CreatedBy,P.ModifiedDate,P.ModifiedBy,DS.DataStatusName 
	FROM tbl_PaymentTypeMaster P 
	INNER JOIN tbl_TransactionTypeMaster T ON P.TransactionTypeId=T.TransactionTypeId
	INNER JOIN tbl_DataStatusMaster DS ON P.DataStatus=DS.DataStatusId
	WHERE P.DataStatus=1
END
GO
/****** Object:  StoredProcedure [dbo].[USP_PaymentTypeGetAll]    Script Date: 07-Jan-25 9:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_PaymentTypeGetAll]
AS BEGIN
	SELECT P.PaymentTypeId,P.PaymentTypeName,P.TransactionTypeId,T.TransactionTypeName,P.DataStatus,P.CreatedDate,P.CreatedBy,P.ModifiedDate,P.ModifiedBy,DS.DataStatusName 
	FROM tbl_PaymentTypeMaster P 
	INNER JOIN tbl_TransactionTypeMaster T ON P.TransactionTypeId=T.TransactionTypeId
	INNER JOIN tbl_DataStatusMaster DS ON P.DataStatus=DS.DataStatusId
END
GO
/****** Object:  StoredProcedure [dbo].[USP_PaymentTypeUpdate]    Script Date: 07-Jan-25 9:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[USP_PaymentTypeUpdate] 
@SessionId varchar(20),
@CreatedDate DateTime,
@CreatedBy bigint,
@ModifiedDate DateTime,
@ModifiedBy bigint
AS
BEGIN
	DECLARE @Datacnt int
	DECLARE @MenuId smallint=0;
	DECLARE @cnt int
	DECLARE @PositionCount int
	DECLARE @ActionId varchar(100)
	CREATE TABLE #Temp(AlertMessage varchar(100))
	BEGIN TRY  
		
		SELECT @MenuId=MenuId FROM tbl_MenuMaster WHERE MenuName ='Payment Type'
		
		UPDATE T SET T.TransactionTypeId=V.TransactionTypeId,T.DataStatus=V.DataStatus 
		FROM tbl_PaymentTypeMaster T INNER JOIN
		(
			SELECT PaymentTypeId,TransactionTypeId,DataStatus
			FROM temp_PaymentTypeMaster
		    WHERE SessionId=@SessionId
		) V ON T.PaymentTypeId=V.PaymentTypeId
		
		DELETE FROM temp_PaymentTypeMaster WHERE SessionId=@SessionId

		INSERT INTO tbl_ActivityLog(UserId,ActionId,MenuId,CreatedDate)
		VALUES(@CreatedBy,'Update',@MenuId,@CreatedDate);
		
		INSERT INTO #Temp(AlertMessage)VALUES('success');
	
	END TRY  
	BEGIN CATCH  
		INSERT INTO #Temp(AlertMessage)VALUES('failed');
		EXECUTE USP_ErrorInfoInsert;  
	END CATCH  
		select * from #Temp;
END
--GO
--EXEC USP_EquipmentConfigInsertUpdate
--@SessionId ='MN7VD8TUAI',
--@SystemId=6,
--@CreatedDate ='26-Jul-2022 11:30:00',
--@CreatedBy =0,
--@ModifiedDate='26-Jul-2022 11:30:00',
--@ModifiedBy =0
GO
/****** Object:  StoredProcedure [dbo].[USP_PlazaGetActive]    Script Date: 07-Jan-25 9:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_PlazaGetActive] 

AS
BEGIN
	Select P.PlazaId,P.SystemIntegratorId,S.Name AS SystemIntegratorName,P.PlazaName,P.PlazaServerIpAddress,
	P.ChainageNumber,P.Latitude,P.Longitude,P.DataStatus,P.CreatedDate,P.CreatedBy,P.ModifiedDate,P.ModifiedBy,
	DS.DataStatusName,CONVERT(VARCHAR(10), ChainageNumber, 103) AS ChainageName
	from tbl_PlazaConfiguration P 
	INNER JOIN tbl_SystemIntegratorConfiguration S ON P.SystemIntegratorId=S.SystemIntegratorId
	INNER JOIN tbl_DataStatusMaster DS ON P.DataStatus=DS.DataStatusId
	WHERE P.DataStatus=1
	
END


GO
/****** Object:  StoredProcedure [dbo].[USP_PlazaGetAll]    Script Date: 07-Jan-25 9:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_PlazaGetAll] 

AS
BEGIN
	Select P.PlazaId,P.SystemIntegratorId,S.Name AS SystemIntegratorName,P.PlazaName,P.PlazaServerIpAddress,
	P.ChainageNumber,P.Latitude,P.Longitude,P.DataStatus,P.CreatedDate,P.CreatedBy,P.ModifiedDate,P.ModifiedBy,
	DS.DataStatusName,CONVERT(VARCHAR(10), ChainageNumber, 103) AS ChainageName
	from tbl_PlazaConfiguration P 
	INNER JOIN tbl_SystemIntegratorConfiguration S ON P.SystemIntegratorId=S.SystemIntegratorId
	INNER JOIN tbl_DataStatusMaster DS ON P.DataStatus=DS.DataStatusId
	
END


GO
/****** Object:  StoredProcedure [dbo].[USP_PlazaGetbyId]    Script Date: 07-Jan-25 9:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_PlazaGetbyId] 
@PlazaId int
AS
BEGIN
	Select P.PlazaId,P.SystemIntegratorId,S.Name AS SystemIntegratorName,P.PlazaName,P.PlazaServerIpAddress,
	P.ChainageNumber,P.Latitude,P.Longitude,P.DataStatus,P.CreatedDate,P.CreatedBy,P.ModifiedDate,P.ModifiedBy,
	DS.DataStatusName,CONVERT(VARCHAR(10), ChainageNumber, 103) AS ChainageName
	from tbl_PlazaConfiguration P 
	INNER JOIN tbl_SystemIntegratorConfiguration S ON P.SystemIntegratorId=S.SystemIntegratorId
	INNER JOIN tbl_DataStatusMaster DS ON P.DataStatus=DS.DataStatusId
	WHERE P.PlazaId=@PlazaId
END
GO
/****** Object:  StoredProcedure [dbo].[USP_PlazaGetbyIpAddress]    Script Date: 07-Jan-25 9:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_PlazaGetbyIpAddress] 
@PlazaServerIpAddress varchar(20)
AS
BEGIN
	Select P.PlazaId,P.SystemIntegratorId,S.Name AS SystemIntegratorName,P.PlazaName,P.PlazaServerIpAddress,
	P.ChainageNumber,P.Latitude,P.Longitude,P.DataStatus,P.CreatedDate,P.CreatedBy,P.ModifiedDate,P.ModifiedBy,
	DS.DataStatusName,CONVERT(VARCHAR(10), ChainageNumber, 103) AS ChainageName
	from tbl_PlazaConfiguration P 
	INNER JOIN tbl_SystemIntegratorConfiguration S ON P.SystemIntegratorId=S.SystemIntegratorId
	INNER JOIN tbl_DataStatusMaster DS ON P.DataStatus=DS.DataStatusId
	WHERE P.PlazaServerIpAddress=@PlazaServerIpAddress
END


GO
/****** Object:  StoredProcedure [dbo].[USP_PlazaInsertUpdate]    Script Date: 07-Jan-25 9:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_PlazaInsertUpdate] 
@PlazaId int,
@SystemIntegratorId smallint,
@PlazaName varchar(100),
@PlazaServerIpAddress varchar(20),
@ChainageNumber decimal(16,3),  
@Latitude decimal(8,6),
@Longitude	decimal(9,6), 
@DataStatus smallint,
@CreatedDate DateTime,
@CreatedBy bigint,
@ModifiedDate DateTime,
@ModifiedBy bigint

AS
BEGIN
	DECLARE @MenuId smallint=3;
	DECLARE @CVal nvarchar(4000)
	DECLARE @PVal nvarchar(4000)
	CREATE TABLE #Temp(AlertMessage varchar(100),AlertData varchar(8000))
	DECLARE @cnt int
	BEGIN TRY 
	SELECT @MenuId=MenuId FROM tbl_MenuMaster WHERE MenuName ='Plaza Master'
	IF EXISTS(SELECT PlazaId FROM tbl_PlazaConfiguration where PlazaServerIpAddress=@PlazaServerIpAddress AND PlazaId<>@PlazaId AND @PlazaServerIpAddress<>'')
	BEGIN
		INSERT INTO #Temp(AlertMessage)
		VALUES('This Plaza Server IP is alreated exists')
	END
	IF EXISTS(SELECT PlazaId FROM tbl_PlazaConfiguration where ChainageNumber=@ChainageNumber AND PlazaId<>@PlazaId)
	BEGIN
		INSERT INTO #Temp(AlertMessage)
		VALUES('Chainage number already exists')
	END
	IF EXISTS(SELECT PlazaId FROM tbl_PlazaConfiguration where PlazaName=@PlazaName AND PlazaId<>@PlazaId)
	BEGIN
		INSERT INTO #Temp(AlertMessage)
		VALUES('This Plaza is alreated exists')
	END
	SELECT @cnt=COUNT(AlertMessage)  FROM #Temp
	IF(@cnt=0)
		BEGIN
			IF(@PlazaId=0)
			BEGIN
				insert into tbl_PlazaConfiguration(SystemIntegratorId,PlazaName,PlazaServerIpAddress,ChainageNumber,Latitude,Longitude,DataStatus,CreatedDate,CreatedBy)
				values(@SystemIntegratorId,@PlazaName,@PlazaServerIpAddress,@ChainageNumber,@Latitude,@Longitude,@DataStatus,@CreatedDate,@CreatedBy);
				SELECT @PlazaId=@@IDENTITY

				SET @CVal=(SELECT * FROM tbl_PlazaConfiguration WHERE PlazaId=@PlazaId FOR JSON AUTO, WITHOUT_ARRAY_WRAPPER)		
				
				INSERT INTO tbl_ActivityLog(UserId,CurrentColumn,ActionId,MenuId,CreatedDate)
				VALUES(@CreatedBy,@CVal,'Insert',@MenuId,@CreatedDate);
				
				INSERT INTO #Temp(AlertMessage,AlertData)VALUES('success',@CVal);
			END
			ELSE
			BEGIN
				
				SET @PVal=(SELECT * FROM tbl_PlazaConfiguration WHERE PlazaId=@PlazaId FOR JSON AUTO, WITHOUT_ARRAY_WRAPPER)	
				
				UPDATE tbl_PlazaConfiguration SET SystemIntegratorId=@SystemIntegratorId,PlazaName=@PlazaName,
				ChainageNumber=@ChainageNumber,Latitude=@Latitude,Longitude=@Longitude,
				DataStatus=@DataStatus,ModifiedDate=@ModifiedDate,ModifiedBy=@ModifiedBy,
				PlazaServerIpAddress=@PlazaServerIpAddress
				WHERE PlazaId=@PlazaId
				
				SET @CVal=(SELECT * FROM tbl_PlazaConfiguration WHERE PlazaId=@PlazaId FOR JSON AUTO, WITHOUT_ARRAY_WRAPPER)		

				INSERT INTO tbl_ActivityLog(UserId,PrevColumn,CurrentColumn,ActionId,MenuId,CreatedDate)
				VALUES(@ModifiedBy,@PVal,@CVal,'Update',@MenuId,@ModifiedDate);

				INSERT INTO #Temp(AlertMessage,AlertData)VALUES('success',@CVal);
			END
		END
		END TRY  
	BEGIN CATCH  
		INSERT INTO #Temp(AlertMessage)VALUES('failed');
		EXECUTE USP_ErrorInfoInsert;  
	END CATCH  
		select * from #Temp;
END


GO
/****** Object:  StoredProcedure [dbo].[USP_ProtocolTypeMasterGetAll]    Script Date: 07-Jan-25 9:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[USP_ProtocolTypeMasterGetAll]
AS BEGIN
	SELECT * FROM tbl_ProtocolTypeMaster
END
GO
/****** Object:  StoredProcedure [dbo].[USP_ReportCategory]    Script Date: 07-Jan-25 9:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_ReportCategory]

AS BEGIN
	Select * from tbl_ReportMaster where ParentId=0 AND DataStatus=1;
END



GO
/****** Object:  StoredProcedure [dbo].[USP_ReportCategoryById]    Script Date: 07-Jan-25 9:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_ReportCategoryById]
@ReportId bigint
AS BEGIN
	Select * from tbl_ReportMaster where ParentId=@ReportId and DataStatus=1;
END



GO
/****** Object:  StoredProcedure [dbo].[USP_RevenueTransactionDetailReport]    Script Date: 07-Jan-25 9:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_RevenueTransactionDetailReport]
@TDate VARCHAR(20)
AS BEGIN
	
	CREATE TABLE #tempClassDetails(RowNumber smallint,VehicleClassId smallint,VehicleClassName varchar(50))
	INSERT INTO #tempClassDetails(VehicleClassId,VehicleClassName,RowNumber)
	Select SystemVehicleSubClassId,FasTagVehicleClassName,ROW_NUMBER() OVER(ORDER BY SystemVehicleSubClassId asc)AS Row          
	FROM tbl_SystemVehicleSubClass S 
	INNER JOIN tbl_FasTagVehicleClass F ON S.SystemVehicleSubClassId = F.FasTagVehicleClassId 
	ORDER BY SystemVehicleSubClassId asc

	CREATE TABLE #tempData (ReportName varchar(50),MOP varchar(50))
	

	DECLARE @count int=0   
	DECLARE @Index  int=1


	
	DECLARE 
	@ColumnName NVARCHAR(MAX), 
	@sql NVARCHAR(MAX), 
	@Scolumns NVARCHAR(MAX) , 
	@Totcolumns NVARCHAR(MAX),
	@NColumnName NVARCHAR(MAX);

	select @count=count(1) from #tempClassDetails      
	WHILE @Index <= @count  
	BEGIN
		SELECT @ColumnName = VehicleClassName FROM #tempClassDetails WHERE RowNumber = @Index;
		EXEC('ALTER TABLE #tempData ADD [' + @ColumnName + '] decimal(10,2) DEFAULT 0');
		SET @Index += 1;
	END
	ALTER TABLE #tempData ADD Total decimal(10,2) DEFAULT 0, RevenueAverage decimal(10,2) DEFAULT 0
	

	SET @ColumnName = 
	(
		SELECT DISTINCT '' + QUOTENAME(VehicleClassName) + ',' 
		FROM #tempClassDetails 
		FOR XML PATH('')
	);

	SET @NColumnName = 
	(
		SELECT DISTINCT 'ISNULL(' + QUOTENAME(VehicleClassName) + ', 0),' 
		FROM #tempClassDetails 
		FOR XML PATH('')
	);

	SET @Scolumns = 
	(
		SELECT DISTINCT 'ISNULL(' + QUOTENAME(VehicleClassName) + ', 0)+' 
		FROM #tempClassDetails 
		FOR XML PATH('')
	);

	SET @Totcolumns = 
	(
		SELECT DISTINCT 'SUM(ISNULL(' + QUOTENAME(VehicleClassName) + ', 0)),' 
		FROM #tempClassDetails 
		FOR XML PATH('')
	);



	SET @ColumnName = LEFT(@ColumnName, LEN(@ColumnName) - 1);
	SET @Scolumns = LEFT(@Scolumns, LEN(@Scolumns) - 1);
	SET @Totcolumns = LEFT(@Totcolumns, LEN(@Totcolumns) - 1);
	SET @NColumnName = LEFT(@NColumnName, LEN(@NColumnName) - 1);
	SET @sql = '
	INSERT INTO #tempData(ReportName,MOP,' + @ColumnName + ',Total)
	SELECT 
		ReportName,MOP, ' + @NColumnName + ', Total
	FROM 
		(
			SELECT 
				''Revenue Transaction Detail'' AS ReportName,
				ETM.TransactionTypeName AS MOP, 
				SVC.SystemVehicleClassName,
				SUM(LT.TransactionAmount) AS [Count]
			FROM 
				tbl_TransactionTypeMaster ETM
			CROSS JOIN tbl_SystemVehicleClass SVC
			LEFT JOIN tbl_LaneTransaction LT ON LT.TransactionTypeId = ETM.TransactionTypeId AND LT.VehicleClassId = SVC.SystemVehicleClassId
			AND CONVERT(date,LT.TransactionDateTime)=CONVERT(date,''' + @TDate + ''') AND LT.TransactionTypeId<>3
			WHERE ETM.DataStatus=1 AND ETM.TransactionTypeId <> 4
			GROUP BY 
				ETM.TransactionTypeName, SVC.SystemVehicleClassName
		) AS SourceTable
	PIVOT 
		(
			SUM([Count]) FOR SystemVehicleClassName IN (' + @ColumnName + ')
		) AS PivotTable
	CROSS APPLY (
		SELECT SUM(cnt) AS Total
		FROM (VALUES (' + @Scolumns + ')) AS X(cnt)
	) AS TotalColumns'
		
		EXEC sp_executesql @sql;
		EXEC('INSERT INTO #tempData(MOP,' + @ColumnName + ',Total) SELECT ''Total'','+@Totcolumns+',SUM(Total) FROM #tempData')

		

		UPDATE #tempData 
		SET RevenueAverage = ISNULL((Total / 
		(SELECT NULLIF(Total, 0) FROM #tempData WHERE MOP = 'Total'))*100,0);

		EXEC('SELECT ReportName,MOP,'+@ColumnName+',Total,RevenueAverage AS [Revenue Average] FROM #tempData')
END

--GO 
--EXEC USP_RevenueTransactionDetailReport
--@TDate='29-Aug-2024'
GO
/****** Object:  StoredProcedure [dbo].[USP_RoleInsertUpdate]    Script Date: 07-Jan-25 9:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_RoleInsertUpdate] 
@RoleId bigint,
@RoleName varchar(200),
@DataStatus smallint,
@CreatedBy bigint,
@ModifiedBy bigint,
@CreatedDate DateTime,
@ModifiedDate DateTime

AS
BEGIN
	DECLARE @MenuId smallint=9;
	DECLARE @CVal nvarchar(4000)
	DECLARE @PVal nvarchar(4000)
	CREATE TABLE #Temp(AlertMessage varchar(100))
	DECLARE @cnt int
	BEGIN TRY
	SELECT @MenuId=MenuId FROM tbl_MenuMaster WHERE MenuName ='Roles'
	IF EXISTS(SELECT RoleId FROM tbl_RoleMaster where RoleName=@RoleName and RoleId<>@RoleId)
		BEGIN
			INSERT INTO #Temp(AlertMessage)
			VALUES('Role name already exists!')
		END
	IF(@RoleId<>0 AND @DataStatus<>1)
	BEGIN
		IF EXISTS(SELECT RoleId FROM tbl_UserMaster where RoleId=@RoleId AND DataStatus=1)
		BEGIN
			INSERT INTO #Temp(AlertMessage)
			VALUES('Role cannot inactive due to users already conncted!')
		END	
	END
	SELECT @cnt=COUNT(AlertMessage)  FROM #Temp
	IF(@cnt=0)
		BEGIN
			IF(@RoleId=0)
			BEGIN
				insert into tbl_RoleMaster(RoleName,DataStatus,CreatedDate,CreatedBy)
				values(@RoleName,@DataStatus,@CreatedDate,@CreatedBy);
				SELECT @RoleId=@@IDENTITY

				INSERT INTO tbl_RolePermission(RoleId,MenuId,DataView,DataAdd,DataUpdate,DataStatus,CreatedDate,CreatedBy)
				SELECT @RoleId,MenuId,1,0,0,DataStatus,@CreatedDate,@CreatedBy FROM tbl_MenuMaster

				SET @CVal=(SELECT * FROM tbl_RoleMaster WHERE RoleId=@RoleId FOR JSON AUTO, WITHOUT_ARRAY_WRAPPER)		
				
				INSERT INTO tbl_ActivityLog(UserId,CurrentColumn,ActionId,MenuId,CreatedDate)
				VALUES(@CreatedBy,@CVal,'Insert',@MenuId,@CreatedDate);
				
				INSERT INTO #Temp(AlertMessage)VALUES('success');
			END
			ELSE
			BEGIN
				
				SET @PVal=(SELECT * FROM tbl_RoleMaster WHERE RoleId=@RoleId FOR JSON AUTO, WITHOUT_ARRAY_WRAPPER)	
				UPDATE tbl_RoleMaster SET RoleName=@RoleName,
					DataStatus=@DataStatus,ModifiedDate=@ModifiedDate,ModifiedBy=@ModifiedBy
					WHERE RoleId=@RoleId
					IF NOT EXISTS(SELECT 1 FROM tbl_RolePermission WHERE RoleId=@RoleId)
					BEGIN
						INSERT INTO tbl_RolePermission(RoleId,MenuId,DataView,DataAdd,DataUpdate,DataStatus,CreatedDate,CreatedBy)
					SELECT @RoleId,MenuId,1,0,0,DataStatus,@ModifiedDate,@ModifiedBy FROM tbl_MenuMaster
					END
				

				SET @CVal=(SELECT * FROM tbl_RoleMaster WHERE RoleId=@RoleId FOR JSON AUTO, WITHOUT_ARRAY_WRAPPER)		

				INSERT INTO tbl_ActivityLog(UserId,PrevColumn,CurrentColumn,ActionId,MenuId,CreatedDate)
				VALUES(@ModifiedBy,@PVal,@CVal,'Update',@MenuId,@ModifiedDate);

				INSERT INTO #Temp(AlertMessage)VALUES('success');
			END
		END
		END TRY  
	BEGIN CATCH  
		INSERT INTO #Temp(AlertMessage)VALUES('failed');
		EXECUTE USP_ErrorInfoInsert;  
	END CATCH  
		select * from #Temp;
END


GO
/****** Object:  StoredProcedure [dbo].[USP_RolePermissionInsertUpdate]    Script Date: 07-Jan-25 9:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_RolePermissionInsertUpdate] 
@SessionId varchar(20),
@RoleId bigint,
@DataStatus smallint,
@CreatedBy bigint,
@ModifiedBy bigint,
@CreatedDate DateTime,
@ModifiedDate DateTime
AS
BEGIN
	DECLARE @Datacnt int
	DECLARE @MenuId smallint=9;
	CREATE TABLE #Temp(AlertMessage varchar(100))
	SELECT @MenuId=MenuId FROM tbl_MenuMaster WHERE MenuName ='Roles'
	CREATE table #TempUpload (MenuId bigint,EventName varchar(100),RoleId bigint,DataView Smallint,DataAdd Smallint,
	DataUpdate smallint,DataStatus smallint,CreatedDate datetime,CreatedBy int,ModifiedDate datetime,ModifiedBy int)
	
	INSERT INTO #TempUpload(MenuId,RoleId,DataView,DataAdd,DataUpdate,DataStatus)
	SELECT MenuId,@RoleId,ISNULL(DataView,0),ISNULL(DataAdd,''),ISNULL(DataUpdate,''),1
	FROM temp_ImportPermission WHERE SessionId=@SessionId
	DELETE FROM temp_ImportPermission WHERE SessionId=@SessionId
	
	DELETE FROM tbl_RolePermission WHERE RoleId=@RoleId
	INSERT INTO tbl_RolePermission(MenuId,RoleId,DataView,DataAdd,DataUpdate,DataStatus,CreatedDate,CreatedBy,ModifiedDate,ModifiedBy)
	SELECT MenuId,RoleId,DataView,DataAdd,DataUpdate,DataStatus,@CreatedDate,@CreatedBy,@ModifiedDate,@ModifiedBy
	FROM #TempUpload
	
	INSERT INTO tbl_ActivityLog(UserId,ActionId,MenuId,CreatedDate)
	VALUES(@CreatedBy,'Permission Modified',@MenuId,@CreatedDate);
	INSERT INTO #Temp(AlertMessage)VALUES('success');
	select * from #Temp;
END

GO
/****** Object:  StoredProcedure [dbo].[USP_RolesGetActive]    Script Date: 07-Jan-25 9:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_RolesGetActive]

AS BEGIN
	SELECT R.RoleId,R.RoleName,R.DataStatus,DS.DataStatusName,R.CreatedDate,R.CreatedBy,R.ModifiedDate,R.ModifiedBy 
	FROM tbl_RoleMaster R
	INNER JOIN tbl_DataStatusMaster DS ON R.DataStatus=DS.DataStatusId 
	WHERE R.DataStatus=1
	ORDER BY ModifiedDate DESC,CreatedDate DESC
END



GO
/****** Object:  StoredProcedure [dbo].[USP_RolesGetAll]    Script Date: 07-Jan-25 9:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_RolesGetAll]

AS BEGIN
	SELECT R.RoleId,R.RoleName,R.DataStatus,DS.DataStatusName,R.CreatedDate,R.CreatedBy,R.ModifiedDate,R.ModifiedBy 
	FROM tbl_RoleMaster R
	INNER JOIN tbl_DataStatusMaster DS ON R.DataStatus=DS.DataStatusId
	--ORDER BY R.ModifiedDate DESC,R.CreatedDate DESC
END



GO
/****** Object:  StoredProcedure [dbo].[USP_RolesGetById]    Script Date: 07-Jan-25 9:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_RolesGetById]
@RoleId bigint
AS BEGIN
	SELECT R.RoleId,R.RoleName,R.DataStatus,DS.DataStatusName,R.CreatedDate,R.CreatedBy,R.ModifiedDate,R.ModifiedBy 
	FROM tbl_RoleMaster R
	INNER JOIN tbl_DataStatusMaster DS ON R.DataStatus=DS.DataStatusId 
	where RoleId=@RoleId
END
GO
/****** Object:  StoredProcedure [dbo].[USP_RolesPermissionGetByMenu]    Script Date: 07-Jan-25 9:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[USP_RolesPermissionGetByMenu]
@MenuURL varchar(100),
@SystemId bigint,
@RoleId bigint

AS BEGIN
	
	CREATE table #Temp (MenuId bigint,ParentId bigint,MenuName varchar(100),MenuURL varchar(100),RoleId bigint,DataView Smallint,DataAdd Smallint,DataUpdate smallint,DataStatus smallint,CreatedDate datetime,CreatedBy int,ModifiedDate datetime,ModifiedBy int)
	if(@RoleId=0)
	BEGIN
		IF(@SystemId=0)
		BEGIN
			INSERT INTO #Temp(MenuId,ParentId,MenuName,MenuURL,RoleId,DataView,DataAdd,DataUpdate,DataStatus,CreatedDate,CreatedBy,ModifiedDate,ModifiedBy)
			SELECT RP.MenuId,ParentId,MenuName,MenuURL,@RoleId,1,1,1,RP.DataStatus,
			RP.CreatedDate,RP.CreatedBy,RP.ModifiedDate,RP.ModifiedBy
			FROM tbl_MenuMaster RP
			WHERE MenuURL=@MenuURL
			ORDER BY RP.OrderBy
		END
		ELSE
		BEGIN
			INSERT INTO #Temp(MenuId,ParentId,MenuName,MenuURL,RoleId,DataView,DataAdd,DataUpdate,DataStatus,CreatedDate,CreatedBy,ModifiedDate,ModifiedBy)
			SELECT RP.MenuId,ParentId,MenuName,MenuURL,@RoleId,1,1,1,RP.DataStatus,
			RP.CreatedDate,RP.CreatedBy,RP.ModifiedDate,RP.ModifiedBy
			FROM tbl_MenuMaster RP
			WHERE RP.MenuURL=@MenuURL 
			ORDER BY RP.OrderBy
		END
	END
	ELSE
	BEGIN
		IF(@SystemId=0)
		BEGIN
			INSERT INTO #Temp(MenuId,ParentId,MenuName,MenuURL,RoleId,DataView,DataAdd,DataUpdate,DataStatus,CreatedDate,CreatedBy,ModifiedDate,ModifiedBy)
			SELECT RP.MenuId,ParentId,MenuName,MenuURL,RP.RoleId,RP.DataView,RP.DataAdd,RP.DataUpdate,RP.DataStatus,
			RP.CreatedDate,RP.CreatedBy,RP.ModifiedDate,RP.ModifiedBy
			FROM tbl_RolePermission RP INNER JOIN tbl_MenuMaster MM ON RP.MenuId=MM.MenuId AND MM.DataStatus=1
			WHERE RP.RoleId=@RoleId 
			ORDER BY MM.OrderBy
		END
		ELSE
		BEGIN
			INSERT INTO #Temp(MenuId,ParentId,MenuName,MenuURL,RoleId,DataView,DataAdd,DataUpdate,DataStatus,CreatedDate,CreatedBy,ModifiedDate,ModifiedBy)
			SELECT RP.MenuId,ParentId,MenuName,MenuURL,RP.RoleId,RP.DataView,RP.DataAdd,RP.DataUpdate,RP.DataStatus,
			RP.CreatedDate,RP.CreatedBy,RP.ModifiedDate,RP.ModifiedBy
			FROM tbl_RolePermission RP INNER JOIN tbl_MenuMaster MM ON RP.MenuId=MM.MenuId AND MM.DataStatus=1
			WHERE RP.RoleId=@RoleId 
			ORDER BY MM.OrderBy
		END
	END

	SELECT * FROM #Temp 
	WHERE MenuURL=@MenuURL AND RoleId=@RoleId
END

--GO
--EXEC USP_RolesPermissionGetByMenu
--@MenuURL='#PopUpProjectConfig',
--@SystemId=0,
--@RoleId=1
GO
/****** Object:  StoredProcedure [dbo].[USP_RolesPermissionGetByMenuId]    Script Date: 07-Jan-25 9:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[USP_RolesPermissionGetByMenuId]
@MenuId bigint,
@RoleId bigint

AS BEGIN
	
	CREATE table #Temp (MenuId bigint,ParentId bigint,MenuName varchar(100),RoleId bigint,DataView Smallint,DataAdd Smallint,DataUpdate smallint,DataStatus smallint,CreatedDate datetime,CreatedBy int,ModifiedDate datetime,ModifiedBy int)
	if(@RoleId=0)
	BEGIN
		INSERT INTO #Temp(MenuId,ParentId,MenuName,RoleId,DataView,DataAdd,DataUpdate,DataStatus,CreatedDate,CreatedBy,ModifiedDate,ModifiedBy)
		SELECT RP.MenuId,ParentId,MenuName,@RoleId,1,1,1,RP.DataStatus,
		RP.CreatedDate,RP.CreatedBy,RP.ModifiedDate,RP.ModifiedBy
		FROM tbl_MenuMaster RP
		WHERE RP.MenuId=@MenuId
		ORDER BY RP.MenuId
	END
	ELSE
	BEGIN
		

		INSERT INTO #Temp(MenuId,ParentId,MenuName,RoleId,DataView,DataAdd,DataUpdate,DataStatus,CreatedDate,CreatedBy,ModifiedDate,ModifiedBy)
		SELECT RP.MenuId,ParentId,MenuName,RP.RoleId,RP.DataView,RP.DataAdd,RP.DataUpdate,RP.DataStatus,
		RP.CreatedDate,RP.CreatedBy,RP.ModifiedDate,RP.ModifiedBy
		FROM tbl_RolePermission RP INNER JOIN tbl_MenuMaster MM ON RP.MenuId=MM.MenuId AND MM.DataStatus=1
		WHERE RP.RoleId=@RoleId
		ORDER BY RP.MenuId
	END

	SELECT * FROM #Temp 
	WHERE MenuId=@MenuId AND RoleId=@RoleId
END

--GO
--EXEC USP_RolesPersmissionGetByRoleId
--@RoleId=1
GO
/****** Object:  StoredProcedure [dbo].[USP_RolesPermissionGetByRoleId]    Script Date: 07-Jan-25 9:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_RolesPermissionGetByRoleId]
@RoleId bigint
AS BEGIN

	CREATE table #Temp (MenuId bigint,ParentId bigint,MenuName varchar(100),RoleId bigint,DataView Smallint,DataAdd Smallint,
	DataUpdate smallint,OrderBy Smallint,ChildCount int default 0,DataStatus smallint,CreatedDate datetime,CreatedBy int,ModifiedDate datetime,ModifiedBy int)

	INSERT INTO #Temp(MenuId,MenuName,ParentId,RoleId,DataView,DataAdd,DataUpdate,OrderBy,DataStatus,CreatedDate,CreatedBy,ModifiedDate,ModifiedBy)
	SELECT M.MenuId,M.MenuName,M.ParentId,@RoleId,ISNULL(R.DataView,0),ISNULL(R.DataAdd,0),ISNULL(R.DataUpdate,0),M.OrderBy,M.DataStatus,M.CreatedDate,M.CreatedBy,M.ModifiedDate,M.ModifiedBy
    FROM tbl_MenuMaster M
	LEFT JOIN  tbl_RolePermission R ON M.MenuId=R.MenuId AND R.RoleId=@RoleId
	WHERE M.DataStatus=1
	ORDER BY OrderBy

	UPDATE T SET T.ChildCount=V.ChildCount FROM #Temp T INNER JOIN 
	(
		SELECT ParentId,COUNT(1) as ChildCount 
		FROM #Temp WHERE ParentId IN (SELECT MenuId FROM #Temp WHERE ParentId=0)
		GROUP BY ParentId
	) V ON T.MenuId=V.ParentId

	SELECT * FROM #Temp ORDER BY OrderBy
END
--GO 
--EXEC USP_RolesPersmissionGetByRoleId
--@RoleId=1
GO
/****** Object:  StoredProcedure [dbo].[USP_ShiftGetByDateTime]    Script Date: 07-Jan-25 9:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_ShiftGetByDateTime] 
@ShiftDateTime DateTime
AS
BEGIN
	DECLARE @ShiftDate DATE
	DECLARE @ShiftDateTimeValue varchar(20)
	SET @ShiftDateTimeValue=CONVERT(varchar,@ShiftDateTime,13)
	SET @ShiftDateTime=CONVERT(DATETIME,@ShiftDateTimeValue)
	SET @ShiftDate=CONVERT(DATE,@ShiftDateTime)
	CREATE TABLE #temp(ShiftId	smallint,StartTimmng DateTime,EndTimming DateTime,DataStatus smallint,CreatedDate datetime,CreatedBy bigint,ModifiedDate datetime,ModifiedBy bigint)
	INSERT INTO #temp(ShiftId,StartTimmng,EndTimming,DataStatus,CreatedDate,CreatedBy,ModifiedDate,ModifiedBy)
	Select ShiftId,CONVERT(datetime,(CONVERT(varchar,@ShiftDate)+' '+StartTimmng)),
	CONVERT(datetime,(CONVERT(varchar,@ShiftDate)+' '+EndTimming)),DataStatus,CreatedDate,CreatedBy,ModifiedDate,ModifiedBy
	from tbl_ShiftTimining

	SELECT * FROM tbl_ShiftTimining WHERE ShiftId IN 
	(
		SELECT ShiftId FROM #temp
		WHERE @ShiftDateTime BETWEEN StartTimmng AND EndTimming
	)
	
END
--GO
--EXEC USP_ShiftGetByDateTime
--@ShiftDateTime='17-Nov-2021 07:59:59.101'


GO
/****** Object:  StoredProcedure [dbo].[USP_ShiftStatusByDate]    Script Date: 07-Jan-25 9:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_ShiftStatusByDate]
@TDate VARCHAR(20)
AS BEGIN
	SELECT 'CashUp Transaction Detail' AS ReportName,SD.ShiftDate,ISNULL(SUM(PF.TransactionAmount),0) AS FloatDeclare,
	ISNULL(SUM(PM.TransactionAmount),0) AS MidDeclare,
	ISNULL(SUM(PE.TransactionAmount),0) AS EndDeclare,
	ISNULL(SUM(LT.TransactionAmount),0)+ISNULL(SUM(LE.TransactionAmount),0)+ISNULL(SUM(LEx.TransactionAmount),0) AS SystemDeclare,
	(ISNULL(SUM(PM.TransactionAmount),0)+ISNULL(SUM(PE.TransactionAmount),0))-
	(ISNULL(SUM(PF.TransactionAmount),0)+ISNULL(SUM(LT.TransactionAmount),0)+ISNULL(SUM(LE.TransactionAmount),0)+ISNULL(SUM(LEx.TransactionAmount),0))
	 AS DifferenceAmount
	FROM tbl_ShiftStatusDetail SD 
	LEFT JOIN tbl_FloatProcessTransactions PF ON SD.ShiftDate=PF.TransactionDate AND PF.FloatTransactionTypeId=3
	LEFT JOIN tbl_FloatProcessTransactions PM ON SD.ShiftDate=PM.TransactionDate AND PM.FloatTransactionTypeId=4
	LEFT JOIN tbl_FloatProcessTransactions PE ON SD.ShiftDate=PE.TransactionDate AND PE.FloatTransactionTypeId=5
	LEFT JOIN tbl_LaneTransaction LT ON SD.ShiftDate=CONVERT(DATE,LT.TransactionDateTime)
	LEFT JOIN tbl_LaneTransactionEntry LE ON SD.ShiftDate=CONVERT(DATE,LE.TransactionDateTime)
    LEFT JOIN tbl_LaneTransactionEntry LEx ON SD.ShiftDate=CONVERT(DATE,LEx.TransactionDateTime)
	LEFT JOIN tbl_PlazaConfiguration P ON SD.PlazaId=P.PlazaId
	LEFT JOIN tbl_ShiftTimining S ON S.ShiftId=SD.ShiftId
	WHERE CONVERT(DATE,SD.ShiftDate)=CONVERT(DATE,@TDate)
	GROUP BY SD.ShiftDate
END
--GO 
--EXEC USP_ShiftStatusByDate
--@TDate='09-Aug-2024'
GO
/****** Object:  StoredProcedure [dbo].[USP_ShiftStatusGetAll]    Script Date: 07-Jan-25 9:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_ShiftStatusGetAll]
AS BEGIN
	SELECT SD.ShiftStatusId,SD.PlazaId,P.PlazaName,SD.ShiftId,S.StartTimmng,S.EndTimming,SD.ShiftDate,SD.ShiftStatus,
	SD.LaneTransactionCount,SD.DataStatus,SD.CreatedDate,SD.CreatedBy,
	SD.ModifiedDate,SD.ModifiedBy, 
	ISNULL(SUM(PF.TransactionAmount),0) AS FloatDeclare,
	ISNULL(SUM(PM.TransactionAmount),0) AS MidDeclare,
	ISNULL(SUM(PE.TransactionAmount),0) AS EndDeclare,
	ISNULL(SUM(LE.TransactionAmount),0)+ISNULL(SUM(LEx.TransactionAmount),0) AS SystemDeclare,
	(ISNULL(SUM(PF.TransactionAmount),0)+ISNULL(SUM(LE.TransactionAmount),0)+ISNULL(SUM(LEx.TransactionAmount),0))-
	(ISNULL(SUM(PM.TransactionAmount),0)+ISNULL(SUM(PE.TransactionAmount),0)) AS DifferenceAmount
	FROM tbl_ShiftStatusDetail SD 
	LEFT JOIN tbl_FloatProcessTransactions PF ON SD.ShiftId=PF.ShiftId AND SD.ShiftDate=PF.TransactionDate AND PF.FloatTransactionTypeId=3
	LEFT JOIN tbl_FloatProcessTransactions PM ON SD.ShiftId=PM.ShiftId AND SD.ShiftDate=PM.TransactionDate AND PM.FloatTransactionTypeId=4
	LEFT JOIN tbl_FloatProcessTransactions PE ON SD.ShiftId=PE.ShiftId AND SD.ShiftDate=PE.TransactionDate AND PE.FloatTransactionTypeId=5
	LEFT JOIN tbl_LaneTransactionEntry LE ON SD.ShiftId=LE.ShiftId AND SD.ShiftDate=CONVERT(DATE,LE.TransactionDateTime)
    LEFT JOIN tbl_LaneTransactionEntry LEx ON SD.ShiftId=LEx.ShiftId AND SD.ShiftDate=CONVERT(DATE,LEx.TransactionDateTime)
	LEFT JOIN tbl_PlazaConfiguration P ON SD.PlazaId=P.PlazaId
	LEFT JOIN tbl_ShiftTimining S ON S.ShiftId=SD.ShiftId
	--WHERE SD.ShiftStatus=1
	GROUP BY SD.ShiftStatusId,SD.PlazaId,P.PlazaName,SD.ShiftId,S.StartTimmng,S.EndTimming,SD.ShiftDate,SD.ShiftStatus,
	SD.LaneTransactionCount,SD.DataStatus,SD.CreatedDate,SD.CreatedBy,
	SD.ModifiedDate,SD.ModifiedBy
END
GO
/****** Object:  StoredProcedure [dbo].[USP_ShiftStatusGetClose]    Script Date: 07-Jan-25 9:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_ShiftStatusGetClose]
AS BEGIN
	SELECT SD.ShiftStatusId,SD.PlazaId,P.PlazaName,SD.ShiftId,S.StartTimmng,S.EndTimming,SD.ShiftDate,SD.ShiftStatus,
	SD.LaneTransactionCount,SD.DataStatus,SD.CreatedDate,SD.CreatedBy,
	SD.ModifiedDate,SD.ModifiedBy, 
	ISNULL(SUM(PF.TransactionAmount),0) AS FloatDeclare,
	ISNULL(SUM(PM.TransactionAmount),0) AS MidDeclare,
	ISNULL(SUM(PE.TransactionAmount),0) AS EndDeclare,
	ISNULL(SUM(LT.TransactionAmount),0)+ISNULL(SUM(LE.TransactionAmount),0)+ISNULL(SUM(LEx.TransactionAmount),0) AS SystemDeclare,
	(ISNULL(SUM(PM.TransactionAmount),0)+ISNULL(SUM(PE.TransactionAmount),0))-
	(ISNULL(SUM(PF.TransactionAmount),0)+ISNULL(SUM(LT.TransactionAmount),0)+ISNULL(SUM(LE.TransactionAmount),0)+ISNULL(SUM(LEx.TransactionAmount),0))
	 AS DifferenceAmount
	FROM tbl_ShiftStatusDetail SD 
	LEFT JOIN tbl_FloatProcessTransactions PF ON SD.ShiftId=PF.ShiftId AND SD.ShiftDate=PF.TransactionDate AND PF.FloatTransactionTypeId=3
	LEFT JOIN tbl_FloatProcessTransactions PM ON SD.ShiftId=PM.ShiftId AND SD.ShiftDate=PM.TransactionDate AND PM.FloatTransactionTypeId=4
	LEFT JOIN tbl_FloatProcessTransactions PE ON SD.ShiftId=PE.ShiftId AND SD.ShiftDate=PE.TransactionDate AND PE.FloatTransactionTypeId=5
	LEFT JOIN tbl_LaneTransaction LT ON SD.ShiftId=LT.ShiftId AND SD.ShiftDate=CONVERT(DATE,LT.TransactionDateTime)
	LEFT JOIN tbl_LaneTransactionEntry LE ON SD.ShiftId=LE.ShiftId AND SD.ShiftDate=CONVERT(DATE,LE.TransactionDateTime)
    LEFT JOIN tbl_LaneTransactionEntry LEx ON SD.ShiftId=LEx.ShiftId AND SD.ShiftDate=CONVERT(DATE,LEx.TransactionDateTime)
	LEFT JOIN tbl_PlazaConfiguration P ON SD.PlazaId=P.PlazaId
	LEFT JOIN tbl_ShiftTimining S ON S.ShiftId=SD.ShiftId
	WHERE SD.ShiftStatus=0
	GROUP BY SD.ShiftStatusId,SD.PlazaId,P.PlazaName,SD.ShiftId,S.StartTimmng,S.EndTimming,SD.ShiftDate,SD.ShiftStatus,
	SD.LaneTransactionCount,SD.DataStatus,SD.CreatedDate,SD.CreatedBy,
	SD.ModifiedDate,SD.ModifiedBy
END
GO
/****** Object:  StoredProcedure [dbo].[USP_ShiftStatusGetOpen]    Script Date: 07-Jan-25 9:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_ShiftStatusGetOpen]
AS BEGIN
	SELECT SD.ShiftStatusId,SD.PlazaId,P.PlazaName,SD.ShiftId,S.StartTimmng,S.EndTimming,SD.ShiftDate,SD.ShiftStatus,
	SD.LaneTransactionCount,SD.DataStatus,SD.CreatedDate,SD.CreatedBy,
	SD.ModifiedDate,SD.ModifiedBy, 
	ISNULL(SUM(PF.TransactionAmount),0) AS FloatDeclare,
	ISNULL(SUM(PM.TransactionAmount),0) AS MidDeclare,
	ISNULL(SUM(PE.TransactionAmount),0) AS EndDeclare,
	ISNULL(SUM(LT.TransactionAmount),0)+ISNULL(SUM(LE.TransactionAmount),0)+ISNULL(SUM(LEx.TransactionAmount),0) AS SystemDeclare,
	(ISNULL(SUM(PM.TransactionAmount),0)+ISNULL(SUM(PE.TransactionAmount),0))-
	(ISNULL(SUM(PF.TransactionAmount),0)+ISNULL(SUM(LT.TransactionAmount),0)+ISNULL(SUM(LE.TransactionAmount),0)+ISNULL(SUM(LEx.TransactionAmount),0))
	 AS DifferenceAmount
	FROM tbl_ShiftStatusDetail SD 
	LEFT JOIN tbl_FloatProcessTransactions PF ON SD.ShiftId=PF.ShiftId AND SD.ShiftDate=PF.TransactionDate AND PF.FloatTransactionTypeId=3
	LEFT JOIN tbl_FloatProcessTransactions PM ON SD.ShiftId=PM.ShiftId AND SD.ShiftDate=PM.TransactionDate AND PM.FloatTransactionTypeId=4
	LEFT JOIN tbl_FloatProcessTransactions PE ON SD.ShiftId=PE.ShiftId AND SD.ShiftDate=PE.TransactionDate AND PE.FloatTransactionTypeId=5
	LEFT JOIN tbl_LaneTransaction LT ON SD.ShiftId=LT.ShiftId AND SD.ShiftDate=CONVERT(DATE,LT.TransactionDateTime)
	LEFT JOIN tbl_LaneTransactionEntry LE ON SD.ShiftId=LE.ShiftId AND SD.ShiftDate=CONVERT(DATE,LE.TransactionDateTime)
    LEFT JOIN tbl_LaneTransactionEntry LEx ON SD.ShiftId=LEx.ShiftId AND SD.ShiftDate=CONVERT(DATE,LEx.TransactionDateTime)
	LEFT JOIN tbl_PlazaConfiguration P ON SD.PlazaId=P.PlazaId
	LEFT JOIN tbl_ShiftTimining S ON S.ShiftId=SD.ShiftId
	WHERE SD.ShiftStatus=1
	GROUP BY SD.ShiftStatusId,SD.PlazaId,P.PlazaName,SD.ShiftId,S.StartTimmng,S.EndTimming,SD.ShiftDate,SD.ShiftStatus,
	SD.LaneTransactionCount,SD.DataStatus,SD.CreatedDate,SD.CreatedBy,
	SD.ModifiedDate,SD.ModifiedBy
END
GO
/****** Object:  StoredProcedure [dbo].[USP_ShiftTiminingGetActive]    Script Date: 07-Jan-25 9:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_ShiftTiminingGetActive]
AS BEGIN
	SELECT S.ShiftId,'Shift-'+CONVERT(varchar(30),S.ShiftId) AS ShiftNumber,S.StartTimmng,S.EndTimming,S.DataStatus,DS.DataStatusName,S.CreatedDate,S.CreatedBy,S.ModifiedDate,S.ModifiedBy  
	FROM tbl_ShiftTimining S INNER JOIN tbl_DataStatusMaster DS ON S.DataStatus=DS.DataStatusId
	WHERE S.DataStatus=1
END
GO
/****** Object:  StoredProcedure [dbo].[USP_ShiftTiminingGetAll]    Script Date: 07-Jan-25 9:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_ShiftTiminingGetAll]
AS BEGIN
	SELECT S.ShiftId,'Shift-'+CONVERT(varchar(30),S.ShiftId) AS ShiftNumber,S.StartTimmng,S.EndTimming,S.DataStatus,DS.DataStatusName,S.CreatedDate,S.CreatedBy,S.ModifiedDate,S.ModifiedBy  
	FROM tbl_ShiftTimining S INNER JOIN tbl_DataStatusMaster DS ON S.DataStatus=DS.DataStatusId
END
GO
/****** Object:  StoredProcedure [dbo].[USP_ShiftTiminingGetById]    Script Date: 07-Jan-25 9:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_ShiftTiminingGetById]
@ShiftId smallint
AS BEGIN
	SELECT S.ShiftId,'Shift-'+CONVERT(varchar(30),S.ShiftId) AS ShiftNumber,S.StartTimmng,S.EndTimming,S.DataStatus,DS.DataStatusName,S.CreatedDate,S.CreatedBy,S.ModifiedDate,S.ModifiedBy  
	FROM tbl_ShiftTimining S INNER JOIN tbl_DataStatusMaster DS ON S.DataStatus=DS.DataStatusId WHERE ShiftId=@ShiftId
END
GO
/****** Object:  StoredProcedure [dbo].[USP_SystemIntegratorGetActive]    Script Date: 07-Jan-25 9:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_SystemIntegratorGetActive]
AS BEGIN
	SELECT S.SystemIntegratorId,S.Name,S.Address,S.MobileNumber,
	S.EmailId,S.LoginId,S.Password,S.DataStatus,S.CreatedDate,
	S.CreatedBy,S.ModifiedDate,S.ModifiedBy,DS.DataStatusName FROM tbl_SystemIntegratorConfiguration S
	INNER JOIN tbl_DataStatusMaster DS ON S.DataStatus=DS.DataStatusId
	WHERE S.DataStatus=1
END
GO
/****** Object:  StoredProcedure [dbo].[USP_SystemIntegratorGetAll]    Script Date: 07-Jan-25 9:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_SystemIntegratorGetAll]
AS BEGIN
	SELECT S.SystemIntegratorId,S.Name,S.Address,S.MobileNumber,
	S.EmailId,S.LoginId,S.Password,S.DataStatus,S.CreatedDate,
	S.CreatedBy,S.ModifiedDate,S.ModifiedBy,DS.DataStatusName FROM tbl_SystemIntegratorConfiguration S
	INNER JOIN tbl_DataStatusMaster DS ON S.DataStatus=DS.DataStatusId
END
GO
/****** Object:  StoredProcedure [dbo].[USP_SystemIntegratorGetbyId]    Script Date: 07-Jan-25 9:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_SystemIntegratorGetbyId]
@SystemIntegratorId smallint
AS BEGIN
	SELECT S.SystemIntegratorId,S.Name,S.Address,S.MobileNumber,
	S.EmailId,S.LoginId,S.Password,S.DataStatus,S.CreatedDate,
	S.CreatedBy,S.ModifiedDate,S.ModifiedBy,DS.DataStatusName FROM tbl_SystemIntegratorConfiguration S
	INNER JOIN tbl_DataStatusMaster DS ON S.DataStatus=DS.DataStatusId WHERE SystemIntegratorId=@SystemIntegratorId;
END
GO
/****** Object:  StoredProcedure [dbo].[USP_SystemIntegratorInsertUpdate]    Script Date: 07-Jan-25 9:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_SystemIntegratorInsertUpdate] 
@SystemIntegratorId smallint,
@Name varchar(100),
@Address varchar (100),
@MobileNumber varchar (15),
@EmailId varchar (100),
@LoginId varchar (255),
@Password varchar (255),
@DataStatus smallint,
@CreatedDate DateTime,
@CreatedBy bigint,
@ModifiedDate DateTime,
@ModifiedBy bigint

AS
BEGIN
	DECLARE @MenuId smallint=3;
	DECLARE @CVal nvarchar(4000)
	DECLARE @PVal nvarchar(4000)
	CREATE TABLE #Temp(AlertMessage varchar(100))
	DECLARE @cnt int
	BEGIN TRY 
	SELECT @MenuId=MenuId FROM tbl_MenuMaster WHERE MenuName ='System Integrator'
	IF EXISTS(SELECT SystemIntegratorId FROM tbl_SystemIntegratorConfiguration where Name=@Name AND SystemIntegratorId<>@SystemIntegratorId)
	BEGIN
		INSERT INTO #Temp(AlertMessage)
		VALUES('System Integrator Name already exists')
	END
	IF EXISTS(SELECT SystemIntegratorId FROM tbl_SystemIntegratorConfiguration where MobileNumber=@MobileNumber AND SystemIntegratorId<>@SystemIntegratorId)
	BEGIN
		INSERT INTO #Temp(AlertMessage)
		VALUES('System Integrator Mobile number already exists')
	END
	IF EXISTS(SELECT SystemIntegratorId FROM tbl_SystemIntegratorConfiguration where EmailId=@EmailId AND SystemIntegratorId<>@SystemIntegratorId)
	BEGIN
		INSERT INTO #Temp(AlertMessage)
		VALUES('System Integrator Email already exists')
	END
	IF EXISTS(SELECT SystemIntegratorId FROM tbl_SystemIntegratorConfiguration where LoginId=@LoginId AND SystemIntegratorId<>@SystemIntegratorId)
	BEGIN
		INSERT INTO #Temp(AlertMessage)
		VALUES('System Integrator login id already exists')
	END
	IF EXISTS(SELECT SystemIntegratorId FROM tbl_SystemIntegratorConfiguration where Password=@Password AND SystemIntegratorId<>@SystemIntegratorId)
	BEGIN
		INSERT INTO #Temp(AlertMessage)
		VALUES('System Integrator login passwrod already exists')
	END
	SELECT @cnt=COUNT(AlertMessage)  FROM #Temp
	IF(@cnt=0)
		BEGIN
			IF(@SystemIntegratorId=0)
			BEGIN
				insert into tbl_SystemIntegratorConfiguration(Name,Address,MobileNumber,EmailId,LoginId,Password,DataStatus,CreatedDate,CreatedBy)
				values(@Name,@Address,@MobileNumber,@EmailId,@LoginId,@Password,@DataStatus,@CreatedDate,@CreatedBy);
				SELECT @SystemIntegratorId=@@IDENTITY

				SET @CVal=(SELECT * FROM tbl_SystemIntegratorConfiguration WHERE SystemIntegratorId=@SystemIntegratorId FOR JSON AUTO, WITHOUT_ARRAY_WRAPPER)		
				
				INSERT INTO tbl_ActivityLog(UserId,CurrentColumn,ActionId,MenuId,CreatedDate)
				VALUES(@CreatedBy,@CVal,'Insert',@MenuId,@CreatedDate);
				
				INSERT INTO #Temp(AlertMessage)VALUES('success');
			END
			ELSE
			BEGIN
				
				SET @PVal=(SELECT * FROM tbl_SystemIntegratorConfiguration WHERE SystemIntegratorId=@SystemIntegratorId FOR JSON AUTO, WITHOUT_ARRAY_WRAPPER)	
				
				UPDATE tbl_SystemIntegratorConfiguration SET Name=@Name,
				Address=@Address,MobileNumber=@MobileNumber,EmailId=@EmailId,
				DataStatus=@DataStatus,ModifiedDate=@ModifiedDate,ModifiedBy=@ModifiedBy,
				LoginId=@LoginId,Password=@Password
				WHERE SystemIntegratorId=@SystemIntegratorId
				
				SET @CVal=(SELECT * FROM tbl_SystemIntegratorConfiguration WHERE SystemIntegratorId=@SystemIntegratorId FOR JSON AUTO, WITHOUT_ARRAY_WRAPPER)		

				INSERT INTO tbl_ActivityLog(UserId,PrevColumn,CurrentColumn,ActionId,MenuId,CreatedDate)
				VALUES(@ModifiedBy,@PVal,@CVal,'Update',@MenuId,@ModifiedDate);

				INSERT INTO #Temp(AlertMessage)VALUES('success');
			END
		END
		END TRY  
	BEGIN CATCH  
		INSERT INTO #Temp(AlertMessage)VALUES('failed');
		EXECUTE USP_ErrorInfoInsert;  
	END CATCH  
		select * from #Temp;
END


GO
/****** Object:  StoredProcedure [dbo].[USP_SystemSettingGet]    Script Date: 07-Jan-25 9:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[USP_SystemSettingGet]

AS BEGIN
	SELECT S.DefaultPlazaId,ISNULL(P.PlazaName,'') AS DefaultPlazaName,S.AllotmentDays,S.IsAccessControl,
	S.FasTagPenalty,S.FasTagPenaltyMultiply,S.CashReturn,S.CashReturnDiscount,S.MonthlyPassTrips,
	S.LoginAccess,S.ExemptAccess,S.FleetAccess,S.TollFareonSubClass,S.AutoFasTagProcess,S.OpeningBalance,S.ClosingBalance,S.DataStatus,S.CreatedDate,
	S.CreatedBy,S.ModifiedDate,S.ModifiedBy 
	FROM tbl_SystemSetting S LEFT JOIN tbl_PlazaConfiguration P ON S.DefaultPlazaId=P.PlazaId
END
GO
/****** Object:  StoredProcedure [dbo].[USP_SystemSettingInsertUpdate]    Script Date: 07-Jan-25 9:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[USP_SystemSettingInsertUpdate]
@DefaultPlazaId smallint,
@AllotmentDays smallint,
@IsAccessControl bit,
@LoginAccess bit,
@ExemptAccess bit,
@FleetAccess bit,
@TollFareonSubClass bit,
@AutoFasTagProcess bit,
@FasTagPenalty bit,
@FasTagPenaltyMultiply smallint,
@CashReturn bit,
@CashReturnDiscount smallint,
@OpeningBalance decimal(18,2),
@MonthlyPassTrips smallint,
@DataStatus smallint,
@CreatedDate datetime,
@CreatedBy bigint,
@ModifiedDate datetime,
@ModifiedBy bigint
AS BEGIN
	DECLARE  @DataCount smallint
	DECLARE @CVal nvarchar(4000)
	DECLARE @PVal nvarchar(4000)
	DECLARE @MenuId smallint=0;
	CREATE TABLE #Temp(AlertMessage varchar(100))
	BEGIN TRY  
		SELECT @MenuId=MenuId FROM tbl_MenuMaster WHERE MenuName ='System Setting'
		SELECT @DataCount=COUNT(1) FROM tbl_SystemSetting

		IF(@DataCount=0)
		BEGIN
			INSERT INTO tbl_SystemSetting(DefaultPlazaId,IsAccessControl,AllotmentDays,FasTagPenalty,FasTagPenaltyMultiply,CashReturn,CashReturnDiscount,
			LoginAccess,ExemptAccess,FleetAccess,TollFareonSubClass,AutoFasTagProcess,OpeningBalance,ClosingBalance,MonthlyPassTrips,DataStatus,CreatedDate,CreatedBy)
			VALUES(@DefaultPlazaId,@IsAccessControl,@AllotmentDays,@FasTagPenalty,@FasTagPenaltyMultiply,@CashReturn,@CashReturnDiscount,
			@LoginAccess,@ExemptAccess,@FleetAccess,@TollFareonSubClass,@AutoFasTagProcess,@OpeningBalance,0,@MonthlyPassTrips,@DataStatus,@CreatedDate,@CreatedBy);
			SET @CVal=(SELECT * FROM tbl_SystemSetting  FOR JSON AUTO, WITHOUT_ARRAY_WRAPPER)		
				
			INSERT INTO tbl_ActivityLog(UserId,CurrentColumn,ActionId,MenuId,CreatedDate)
			VALUES(@CreatedBy,@CVal,'Insert',@MenuId,@CreatedDate);
				
			INSERT INTO #Temp(AlertMessage)VALUES('success');
		END
		ELSE
		BEGIN
			IF EXISTS(SELECT ClosingBalance FROM tbl_SystemSetting where OpeningBalance=0)
			BEGIN
				SET @PVal=(SELECT * FROM tbl_SystemSetting  FOR JSON AUTO, WITHOUT_ARRAY_WRAPPER)
				UPDATE tbl_SystemSetting SET DefaultPlazaId=@DefaultPlazaId,IsAccessControl=@IsAccessControl,AllotmentDays=@AllotmentDays,
				FasTagPenalty=@FasTagPenalty,FasTagPenaltyMultiply=@FasTagPenaltyMultiply,CashReturn=@CashReturn,CashReturnDiscount=@CashReturnDiscount,
				LoginAccess=@LoginAccess,ExemptAccess=@ExemptAccess,FleetAccess=@FleetAccess,OpeningBalance=@OpeningBalance,
				MonthlyPassTrips=@MonthlyPassTrips,
				DataStatus=@DataStatus,ModifiedDate=@ModifiedDate,ModifiedBy=@ModifiedBy,TollFareonSubClass=@TollFareonSubClass,
				AutoFasTagProcess=@AutoFasTagProcess
				SET @CVal=(SELECT * FROM tbl_SystemSetting  FOR JSON AUTO, WITHOUT_ARRAY_WRAPPER)	
				INSERT INTO tbl_ActivityLog(UserId,PrevColumn,CurrentColumn,ActionId,MenuId,CreatedDate)
				VALUES(@ModifiedBy,@PVal,@CVal,'Update',@MenuId,@ModifiedDate);

				INSERT INTO #Temp(AlertMessage)VALUES('success');
			END
			ELSE
			BEGIN
				SET @PVal=(SELECT * FROM tbl_SystemSetting  FOR JSON AUTO, WITHOUT_ARRAY_WRAPPER)
				UPDATE tbl_SystemSetting SET DefaultPlazaId=@DefaultPlazaId,IsAccessControl=@IsAccessControl,AllotmentDays=@AllotmentDays,
				FasTagPenalty=@FasTagPenalty,FasTagPenaltyMultiply=@FasTagPenaltyMultiply,CashReturn=@CashReturn,CashReturnDiscount=@CashReturnDiscount,
				LoginAccess=@LoginAccess,ExemptAccess=@ExemptAccess,FleetAccess=@FleetAccess,DataStatus=@DataStatus,
				MonthlyPassTrips=@MonthlyPassTrips,
				ModifiedDate=@ModifiedDate,ModifiedBy=@ModifiedBy,TollFareonSubClass=@TollFareonSubClass,
				AutoFasTagProcess=@AutoFasTagProcess
				SET @CVal=(SELECT * FROM tbl_SystemSetting  FOR JSON AUTO, WITHOUT_ARRAY_WRAPPER)	
				INSERT INTO tbl_ActivityLog(UserId,PrevColumn,CurrentColumn,ActionId,MenuId,CreatedDate)
				VALUES(@ModifiedBy,@PVal,@CVal,'Update',@MenuId,@ModifiedDate);

				INSERT INTO #Temp(AlertMessage)VALUES('success');
			END
		END

	END TRY  
	BEGIN CATCH  
		INSERT INTO #Temp(AlertMessage)VALUES('failed');
		EXECUTE USP_ErrorInfoInsert;  
	END CATCH  
		select * from #Temp;
END
GO
/****** Object:  StoredProcedure [dbo].[USP_SystemVehicleClassGetActive]    Script Date: 07-Jan-25 9:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_SystemVehicleClassGetActive]
AS BEGIN
	SELECT S.SystemVehicleClassId,S.SystemVehicleClassName,S.SystemVehicleClassDescription,S.SystemSubClassIds,S.PermissibleWeight,
	S.AvcVehicleClassId,CASE S.AvcVehicleClassId WHEN 0 THEN '' ELSE S.SystemVehicleClassName END AS AvcVehicleClassName,
	S.DataStatus,S.CreatedDate,S.CreatedBy,S.ModifiedDate,S.ModifiedBy,DS.DataStatusName,
	STRING_AGG (ISNULL(F.FasTagVehicleClassName,'N/A'), ',') SystemSubClassNames
	FROM tbl_SystemVehicleClass S 
	LEFT JOIN tbl_DataStatusMaster DS ON S.DataStatus=DS.DataStatusId
	CROSS APPLY dbo.fnc_CommaSeparated(S.SystemSubClassIds) V 
	LEFT JOIN tbl_FasTagVehicleClass F ON V.DataValue=F.FasTagVehicleClassId
	WHERE S.DataStatus=1
	GROUP BY S.AvcVehicleClassId,S.SystemVehicleClassId,
	S.SystemVehicleClassName,S.SystemVehicleClassDescription,S.SystemSubClassIds,S.PermissibleWeight,
	S.DataStatus,S.CreatedDate,S.CreatedBy,S.ModifiedDate,S.ModifiedBy,DS.DataStatusName
	ORDER BY S.SystemVehicleClassId
END
--GO
--EXEC USP_SystemVehicleClassGetActive
GO
/****** Object:  StoredProcedure [dbo].[USP_SystemVehicleClassGetAll]    Script Date: 07-Jan-25 9:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_SystemVehicleClassGetAll]
AS BEGIN
	SELECT S.SystemVehicleClassId,S.SystemVehicleClassName,S.SystemVehicleClassDescription,S.SystemSubClassIds,S.PermissibleWeight,
	S.AvcVehicleClassId,CASE S.AvcVehicleClassId WHEN 0 THEN '' ELSE S.SystemVehicleClassName END AS AvcVehicleClassName,
	S.DataStatus,S.CreatedDate,S.CreatedBy,S.ModifiedDate,S.ModifiedBy,DS.DataStatusName,
	STRING_AGG (ISNULL(F.FasTagVehicleClassName,'N/A'), ',') SystemSubClassNames
	FROM tbl_SystemVehicleClass S 
	LEFT JOIN tbl_DataStatusMaster DS ON S.DataStatus=DS.DataStatusId
	CROSS APPLY dbo.fnc_CommaSeparated(S.SystemSubClassIds) V 
	LEFT JOIN tbl_FasTagVehicleClass F ON V.DataValue=F.FasTagVehicleClassId
	GROUP BY S.AvcVehicleClassId,S.SystemVehicleClassId,
	S.SystemVehicleClassName,S.SystemVehicleClassDescription,S.SystemSubClassIds,S.PermissibleWeight,
	S.DataStatus,S.CreatedDate,S.CreatedBy,S.ModifiedDate,S.ModifiedBy,DS.DataStatusName
	ORDER BY S.SystemVehicleClassId
END
--GO
--EXEC USP_SystemVehicleClassGetAll
GO
/****** Object:  StoredProcedure [dbo].[USP_SystemVehicleClassGetById]    Script Date: 07-Jan-25 9:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_SystemVehicleClassGetById]
@SystemVehicleClassId smallint
AS BEGIN
	SELECT S.SystemVehicleClassId,S.SystemVehicleClassName,S.SystemVehicleClassDescription,S.SystemSubClassIds,S.PermissibleWeight,
	S.AvcVehicleClassId,CASE S.AvcVehicleClassId WHEN 0 THEN '' ELSE S.SystemVehicleClassName END AS AvcVehicleClassName,
	S.DataStatus,S.CreatedDate,S.CreatedBy,S.ModifiedDate,S.ModifiedBy,DS.DataStatusName,
	STRING_AGG (ISNULL(F.FasTagVehicleClassName,'N/A'), ',') SystemSubClassNames
	FROM tbl_SystemVehicleClass S 
	LEFT JOIN tbl_DataStatusMaster DS ON S.DataStatus=DS.DataStatusId
	CROSS APPLY dbo.fnc_CommaSeparated(S.SystemSubClassIds) V 
	LEFT JOIN tbl_FasTagVehicleClass F ON V.DataValue=F.FasTagVehicleClassId
	WHERE S.SystemVehicleClassId=@SystemVehicleClassId
	GROUP BY S.AvcVehicleClassId,S.SystemVehicleClassId,
	S.SystemVehicleClassName,S.SystemVehicleClassDescription,S.SystemSubClassIds,S.PermissibleWeight,
	S.DataStatus,S.CreatedDate,S.CreatedBy,S.ModifiedDate,S.ModifiedBy,DS.DataStatusName
	
END
--GO
--EXEC USP_SystemVehicleClassGetById
--@SystemVehicleClassId=18
GO
/****** Object:  StoredProcedure [dbo].[USP_SystemVehicleClassInsertUpdate]    Script Date: 07-Jan-25 9:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_SystemVehicleClassInsertUpdate] 
@SystemVehicleClassId smallint,
@AvcVehicleClassId smallint,
@SystemVehicleClassName varchar(100),
@SystemVehicleClassDescription varchar(100),
@PermissibleWeight decimal(18,3),
@SystemSubClassIds varchar(4000),
@DataStatus smallint,
@CreatedDate DateTime,
@CreatedBy bigint,
@ModifiedDate DateTime,
@ModifiedBy bigint

AS
BEGIN
	DECLARE @MenuId smallint=3;
	DECLARE @CVal nvarchar(4000)
	DECLARE @PVal nvarchar(4000)
	CREATE TABLE #Temp(AlertMessage varchar(100),AlertData varchar(8000))
	DECLARE @cnt int
	BEGIN TRY 
	SELECT @MenuId=MenuId FROM tbl_MenuMaster WHERE MenuName ='System Class'
	IF EXISTS(SELECT SystemVehicleClassId FROM tbl_SystemVehicleClass where SystemVehicleClassName=@SystemVehicleClassName AND SystemVehicleClassId<>@SystemVehicleClassId)
	BEGIN
		INSERT INTO #Temp(AlertMessage)
		VALUES('System Vehicle Class Name already exists')
	END
	--IF EXISTS(SELECT FasTagVehicleClassId FROM tbl_SystemVehicleSubClass WHERE FasTagVehicleClassId 
	--IN (SELECT DataValue from fnc_CommaSeparated(@SystemSubClassIds))
	----AND SystemVehicleClassId<>@SystemVehicleClassId
	--)
	--BEGIN
	--	INSERT INTO #Temp(AlertMessage)
	--	VALUES('System Vehicle Sub Class already exists with another class')
	--END
	SELECT @cnt=COUNT(AlertMessage)  FROM #Temp
	IF(@cnt=0)
		BEGIN
			IF NOT EXISTS(SELECT SystemVehicleClassId FROM tbl_SystemVehicleClass WHERE SystemVehicleClassId=@SystemVehicleClassId)
			BEGIN
				insert into tbl_SystemVehicleClass(SystemVehicleClassId,AvcVehicleClassId,SystemVehicleClassName,SystemVehicleClassDescription,PermissibleWeight,SystemSubClassIds,DataStatus,CreatedDate,CreatedBy)
				values(@SystemVehicleClassId,@AvcVehicleClassId,@SystemVehicleClassName,@SystemVehicleClassDescription,@PermissibleWeight,@SystemSubClassIds,@DataStatus,@CreatedDate,@CreatedBy);
				SELECT @SystemVehicleClassId=@@IDENTITY
				
				INSERT INTO tbl_SystemVehicleSubClass(SystemVehicleClassId,SystemVehicleSubClassId)
				SELECT @SystemVehicleClassId,DataValue from fnc_CommaSeparated(@SystemSubClassIds)

				SET @CVal=(SELECT * FROM tbl_SystemVehicleClass WHERE SystemVehicleClassId=@SystemVehicleClassId FOR JSON AUTO, WITHOUT_ARRAY_WRAPPER)		
				
				INSERT INTO tbl_ActivityLog(UserId,CurrentColumn,ActionId,MenuId,CreatedDate)
				VALUES(@CreatedBy,@CVal,'Insert',@MenuId,@CreatedDate);
				
				INSERT INTO #Temp(AlertMessage,AlertData)VALUES('success',@CVal);
			END
			ELSE
			BEGIN
				
				SET @PVal=(SELECT * FROM tbl_SystemVehicleClass WHERE SystemVehicleClassId=@SystemVehicleClassId FOR JSON AUTO, WITHOUT_ARRAY_WRAPPER)	
				
				UPDATE tbl_SystemVehicleClass SET SystemVehicleClassName=@SystemVehicleClassName,
				AvcVehicleClassId=@AvcVehicleClassId,
				SystemSubClassIds=@SystemSubClassIds,SystemVehicleClassDescription=@SystemVehicleClassDescription,
				PermissibleWeight=@PermissibleWeight,DataStatus=@DataStatus,ModifiedDate=@ModifiedDate,ModifiedBy=@ModifiedBy
				WHERE SystemVehicleClassId=@SystemVehicleClassId
				DELETE tbl_SystemVehicleSubClass WHERE SystemVehicleClassId=@SystemVehicleClassId
				INSERT INTO tbl_SystemVehicleSubClass(SystemVehicleClassId,SystemVehicleSubClassId)
				SELECT @SystemVehicleClassId,DataValue from fnc_CommaSeparated(@SystemSubClassIds)
				SET @CVal=(SELECT * FROM tbl_SystemVehicleClass WHERE SystemVehicleClassId=@SystemVehicleClassId FOR JSON AUTO, WITHOUT_ARRAY_WRAPPER)		

				INSERT INTO tbl_ActivityLog(UserId,PrevColumn,CurrentColumn,ActionId,MenuId,CreatedDate)
				VALUES(@ModifiedBy,@PVal,@CVal,'Update',@MenuId,@ModifiedDate);

				INSERT INTO #Temp(AlertMessage,AlertData)VALUES('success',@CVal);
			END
		END
		END TRY  
	BEGIN CATCH  
		INSERT INTO #Temp(AlertMessage)VALUES('failed');
		EXECUTE USP_ErrorInfoInsert;  
	END CATCH  
		select * from #Temp;
END


GO
/****** Object:  StoredProcedure [dbo].[USP_SystemVehicleSubClassGetActive]    Script Date: 07-Jan-25 9:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_SystemVehicleSubClassGetActive]
AS BEGIN
	SELECT S.SystemVehicleClassId,S.SystemVehicleClassName,S.SystemVehicleClassDescription,
	S.PermissibleWeight,SC.SystemVehicleSubClassId,F.FasTagVehicleClassName AS SystemVehicleSubClassNames,
	SC.DataStatus,SC.CreatedDate,SC.CreatedBy,SC.ModifiedDate,SC.ModifiedBy
	FROM tbl_SystemVehicleSubClass SC 
	INNER JOIN tbl_SystemVehicleClass S ON SC.SystemVehicleClassId=S.SystemVehicleClassId
	INNER JOIN tbl_FasTagVehicleClass F ON SC.SystemVehicleSubClassId=F.FasTagVehicleClassId
	WHERE SC.DataStatus=1;
END
--GO 
--EXEC USP_SystemVehicleSubClassGetActive
GO
/****** Object:  StoredProcedure [dbo].[usp_TEST]    Script Date: 07-Jan-25 9:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_TEST]
@StartDateTime datetime,
@EndDateTime datetime
AS BEGIN
	SET NOCOUNT ON 

	CREATE TABLE #tempAvcData (TotalCount int , VehicleClassName varchar(50))
	CREATE TABLE #tempAvcCountTable(VehicleClassId int,VehicleClassName varchar(100))
	CREATE TABLE #tempAvcPercentageTable(VehicleClassId int,VehicleClassName varchar(100))
	CREATE TABLE #tempClassDetails(RowNumber smallint,VehicleClassId smallint,VehicleClassName varchar(50))
	
	INSERT INTO #tempClassDetails(RowNumber,VehicleClassId,VehicleClassName) VALUES(0,0,'No Class')
	INSERT INTO #tempClassDetails(VehicleClassId,VehicleClassName,RowNumber)
	Select SystemVehicleSubClassId,FasTagVehicleClassName,ROW_NUMBER() OVER(ORDER BY SystemVehicleSubClassId asc)AS Row          
	FROM tbl_SystemVehicleSubClass S 
	INNER JOIN tbl_FasTagVehicleClass F ON S.SystemVehicleSubClassId = F.FasTagVehicleClassId 
	ORDER BY SystemVehicleSubClassId asc  

	
	DECLARE @count int=0   
	DECLARE @Index  int=0
	DECLARE @AvcClassId INT
	DECLARE @ColumnName varchar(max)
	DECLARE @SumColumnName varchar(max)
	DECLARE @SumofColumnName varchar(max)
	DECLARE @PerColumnName varchar(max)
	DECLARE @CommaSepratedColumnName varchar(max)
	DECLARE @ClassNameWithPercentage VARCHAR(max)
	
	DECLARE @sqlQuery AS VARCHAR(MAX)
	
	select @count=count(1) from #tempClassDetails      
	
	WHILE @Index < @count  
	BEGIN
		SELECT @ColumnName = VehicleClassName FROM #tempClassDetails WHERE RowNumber = @Index;
		EXEC('ALTER TABLE #tempAvcCountTable ADD [' + @ColumnName + '] FLOAT(2)');
		EXEC('ALTER TABLE #tempAvcPercentageTable ADD [' + @ColumnName + '] FLOAT(2)');
		
		SET @SumColumnName = ISNULL(@SumColumnName, '') + ',sum([' + @ColumnName + ']) ';
		SET @PerColumnName = ISNULL(@PerColumnName, '') + ',isnull(cast(NULLIF(cast([' + @ColumnName + '] as decimal(10,2)),0) / NULLIF(cast(Total as decimal(10,2)),0) * 100 as decimal(10,2)), 0) ';
		SET @CommaSepratedColumnName = ISNULL(@CommaSepratedColumnName, '') + ',[' + @ColumnName + '] ';
		SET @SumofColumnName = ISNULL(@SumofColumnName, '') + '+[' + @ColumnName + '] ';
		SET @Index += 1;
	END
	Set @CommaSepratedColumnName=substring(@CommaSepratedColumnName,2,len(@CommaSepratedColumnName))
	Set @SumColumnName=substring(@SumColumnName,2,len(@SumColumnName))
	set @SumofColumnName =  substring(@SumofColumnName,2,len(@SumofColumnName))
	SET @PerColumnName = Substring(@PerColumnName, 2, Len(@PerColumnName))
	
	ALTER TABLE #tempAvcCountTable ADD Total int DEFAULT 0
	ALTER TABLE #tempAvcPercentageTable ADD Total decimal(10,2) DEFAULT 0
	--[Accurecy(%)]

	DECLARE @ClassName varchar(max)
	SET @Index=0
	WHILE(@Index < @count )
      BEGIN
		SELECT 
		@AvcClassId = VehicleClassId,
		@ColumnName = '[' + VehicleClassName + ']',
		@ClassName = '''' + VehicleClassName + '''',
		@ClassNameWithPercentage = '''' + VehicleClassName + '%''' 
		FROM   #tempClassDetails(nolock)
		WHERE  RowNumber = @Index

		TRUNCATE TABLE #tempAvcData
		Insert INTO #tempAvcData    
		Select isnull(d.TotalCount,0) TotalCount,c.VehicleClassName
		from #tempClassDetails c (nolock)
		left join           
		(
			Select VehicleClassName, sum(TotalCount)TotalCount from 
			(
				Select count(1) TotalCount,b.VehicleClassName from tbl_LaneTransaction a(nolock)       
				inner join #tempClassDetails b(nolock)  on b.VehicleClassId = a.VehicleSubClassId AND isnull(VehicleAvcClassId,0)=@AvcClassId     
				AND (a.transactiondatetime between @StartDateTime and @EndDateTime)
				AND Transactionstatus=1 
				group by b.VehicleClassName
			 )y  
			 group by VehicleClassName
		 )d     
		on c.VehicleClassName = d.VehicleClassName 
		exec ('insert into #tempAvcCountTable (VehicleClassId,VehicleClassName,' + @CommaSepratedColumnName+') 
		SELECT  '+@AvcClassId+','+@ClassName+',' + @CommaSepratedColumnName+' FROM (SELECT TotalCount, VehicleClassName FROM #tempavcdata) #tempavcdata 
		PIVOT (MAX(TotalCount) FOR VehicleClassName IN (' + @CommaSepratedColumnName + ')) Result;')
		
		SET @sqlQuery = 'UPDATE #tempAvcCountTable SET Total = ROUND(' + @SumofColumnName + ', 1) WHERE VehicleClassId = ' + CAST(@AvcClassId AS NVARCHAR(10));
		exec(@sqlQuery) 
		SET @sqlQuery ='Insert into #tempAvcPercentageTable(VehicleClassId,VehicleClassName,'+@CommaSepratedColumnName+')
		Select '+cast(@AvcClassId as varchar(20))+','+@ClassName+','+@PerColumnName+'  
		from  #tempAvcCountTable(nolock) where VehicleClassName ='+@ClassName+''
		exec(@sqlQuery) 
		
		set @sqlQuery='update #tempAvcPercentageTable set Total = (Select '+@ColumnName+' from #tempAvcPercentageTable(nolock) 
		where VehicleClassId = '+cast(@AvcClassId as NVARCHAR(10))+' and VehicleClassName ='+@ClassName+') 
		where VehicleClassName='+@ClassName+''         
		exec(@sqlQuery) 
		SET @Index+=1
	  END

	  set @sqlQuery =         
		'Insert into #tempAvcCountTable(VehicleClassId,VehicleClassName,'+@CommaSepratedColumnName+')         
		Select -1,''Total'' as Total,'+@SumColumnName+'  from  #tempAvcCountTable(nolock) where Right(VehicleClassName,1) !=''%'''        
		exec(@sqlQuery)  

		SET @sqlQuery = 'UPDATE #tempAvcCountTable SET Total = ROUND(' + @SumofColumnName + ', 1) WHERE VehicleClassId = -1';
		exec(@sqlQuery) 

		SET @sqlQuery =         
		'Insert into #tempAvcPercentageTable(VehicleClassId,VehicleClassName,'+@CommaSepratedColumnName+')         
		Select -1,''Total'' as Total,'+@PerColumnName+'  from  #tempAvcCountTable(nolock) where VehicleClassName=''Total'''        
		exec(@sqlQuery) 
		

		UPDATE #tempAvcPercentageTable SET Total = 
		(
			SELECT ISNULL(ROUND(CAST(SUM(Total) AS FLOAT) / NULLIF(CAST(COUNT(1) AS FLOAT), 0), 2), 0) AS AverageTotal 
			FROM #tempAvcPercentageTable WHERE VehicleClassId <> -1
		) WHERE VehicleClassId = -1
	  
	  SELECT * FROM #tempAvcCountTable
	  SELECT * FROM #tempAvcPercentageTable
	
	

END
--GO
--EXEC usp_TEST
--@StartDateTime='20-Aug-2024 00:00:00',
--@EndDateTime='05-Sep-2024 00:00:00'
GO
/****** Object:  StoredProcedure [dbo].[USP_TollFareConfigurationGetById]    Script Date: 07-Jan-25 9:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_TollFareConfigurationGetById]
@TollFareId bigint
AS BEGIN
	IF(@TollFareId=0)
	BEGIN
		SELECT 0 TollFareId,0 JourneyId,VC.SystemVehicleClassId,VC.SystemVehicleClassName,0 TollFare,0 ReturnFare,0 FasTagPenalty,
		0 OverweightPenalty,0 MonthlyPass,'' JourneyName,0 AS DistrictRegisteredFare
		FROM tbl_SystemVehicleClass VC
		WHERE VC.DataStatus=1
	END
	ELSE
	BEGIN
		SELECT FC.TollFareId,FC.JourneyId,FC.SystemVehicleClassId,FC.TollFare,FC.ReturnFare,
		FC.FasTagPenalty,FC.OverweightPenalty,FC.MonthlyPass,FC.DistrictRegisteredFare,
		VC.SystemVehicleClassName,JM.JourneyName
		FROM tbl_TollFareConfiguration FC
		LEFT JOIN tbl_JourneyMaster JM ON FC.JourneyId=JM.JourneyId
		LEFT JOIN tbl_SystemVehicleClass VC ON FC.SystemVehicleClassId=VC.SystemVehicleClassId AND VC.DataStatus=1
		WHERE FC.TollFareId=@TollFareId
	END
END
--GO
--EXEC USP_TollFareConfigurationGetById
--@TollFareId =0
GO
/****** Object:  StoredProcedure [dbo].[USP_TollFareGetByEffectedFrom]    Script Date: 07-Jan-25 9:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_TollFareGetByEffectedFrom]
@EffectedFrom date
AS BEGIN
	DECLARE @AEffectiveDate date
	DECLARE @TollFareId bigint
	DECLARE @TollFareonSubClass bit
	DECLARE @IsAccessControl bit
	DECLARE @DefaultPlazaId smallint

	SELECT @TollFareonSubClass=TollFareonSubClass,@DefaultPlazaId=DefaultPlazaId,@IsAccessControl=IsAccessControl FROM tbl_SystemSetting

	CREATE TABLE #tempTollFareClass(SystemVehicleClassId smallint,SystemVehicleClassName varchar(255),SubVehicleClassId smallint DEFAULT 0,
	SubVehicleClassName varchar(255) DEFAULT '',TollFareId bigint DEFAULT 0,TollFare decimal(18,2) DEFAULT 0,ReturnFare decimal(18,2) DEFAULT 0,
	FasTagPenalty decimal(18,2) DEFAULT 0,OverweightPenalty decimal(18,2) DEFAULT 0,MonthlyPass decimal(18,2) DEFAULT 0,
	DistrictRegisteredFare decimal(18,2) DEFAULT 0,
	JourneyId bigint default 0,JourneyName varchar(255) DEFAULT 'Not Required')

	SET @TollFareonSubClass=ISNULL(@TollFareonSubClass,0)
	
	SELECT @AEffectiveDate=MAX(EffectedFrom) FROM tbl_TollFareMaster WHERE EffectedFrom<=@EffectedFrom and DataStatus=1
	IF(@AEffectiveDate IS NULL)
	BEGIN
		SELECT @AEffectiveDate=MIN(EffectedFrom) FROM tbl_TollFareMaster WHERE EffectedFrom>@EffectedFrom and DataStatus=1
	END
	
	IF(@TollFareonSubClass=1)
	BEGIN
		INSERT INTO #tempTollFareClass(SystemVehicleClassId,SystemVehicleClassName,SubVehicleClassId,SubVehicleClassName)
		SELECT S.SystemVehicleClassId,S.SystemVehicleClassName,F.FasTagVehicleClassId,F.FasTagVehicleClassName
		FROM tbl_SystemVehicleClass S INNER JOIN tbl_DataStatusMaster DS ON S.DataStatus=DS.DataStatusId
		CROSS APPLY dbo.fnc_CommaSeparated(S.SystemSubClassIds) V 
		INNER JOIN tbl_FasTagVehicleClass F ON V.DataValue=F.FasTagVehicleClassId
		WHERE S.DataStatus=1 AND F.DataStatus=1
		GROUP BY S.SystemVehicleClassId,S.SystemVehicleClassName,F.FasTagVehicleClassId,F.FasTagVehicleClassName
	END
	ELSE
	BEGIN
		INSERT INTO #tempTollFareClass(SystemVehicleClassId,SystemVehicleClassName,SubVehicleClassId,SubVehicleClassName)
		SELECT S.SystemVehicleClassId,S.SystemVehicleClassName,0,dbo.fnc_CommaSubSeparated(S.SystemSubClassIds)
		FROM tbl_SystemVehicleClass S INNER JOIN tbl_DataStatusMaster DS ON S.DataStatus=DS.DataStatusId
		WHERE S.DataStatus=1 

		
	END

	
	SELECT @TollFareId=TollFareId FROM tbl_TollFareMaster WHERE EffectedFrom=@AEffectiveDate

	SET @TollFareId=ISNULL(@TollFareId,0);
	
	UPDATE T SET T.TollFareId=V.TollFareId,T.JourneyId=V.JourneyId,T.TollFare=V.TollFare,T.ReturnFare=V.ReturnFare,T.FasTagPenalty=V.FasTagPenalty,
	T.OverweightPenalty=V.OverweightPenalty,T.MonthlyPass=V.MonthlyPass,
	T.DistrictRegisteredFare=V.DistrictRegisteredFare FROM #tempTollFareClass T INNER JOIN 
	(
		SELECT FC.TollFareId,FC.JourneyId,FC.SystemVehicleClassId,FC.SubVehicleClassId,FC.TollFare,FC.ReturnFare,
		FC.FasTagPenalty,FC.OverweightPenalty,FC.MonthlyPass,JM.JourneyName,FC.DistrictRegisteredFare
		FROM tbl_TollFareConfiguration FC
		LEFT JOIN tbl_JourneyMaster JM ON FC.JourneyId=JM.JourneyId
		WHERE FC.TollFareId=@TollFareId
	) V ON T.SystemVehicleClassId=V.SystemVehicleClassId AND T.SubVehicleClassId=V.SubVehicleClassId

	if(@IsAccessControl=0)
	BEGIN
		UPDATE #tempTollFareClass SET JourneyName=(SELECT PlazaName FROM tbl_PlazaConfiguration where PlazaId=@DefaultPlazaId)
	END
	if (@TollFareId=0)
	BEGIN
		SELECT 0 AS TollFareId,GETDATE() EffectedFrom,1 AS DataStatus
	END
	ELSE
	BEGIN
		SELECT * FROM tbl_TollFareMaster where TollFareId=@TollFareId
	END
	SELECT * FROM #tempTollFareClass 
	
END

--GO
--EXEC USP_TollFareGetByEffectedFrom
--@EffectedFrom ='20-May-2024'
GO
/****** Object:  StoredProcedure [dbo].[USP_TollFareGetDefault]    Script Date: 07-Jan-25 9:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_TollFareGetDefault]

AS BEGIN
	SELECT 0 AS TollFareId,CONVERT(DATE,GETDATE()) AS EffectedFrom,1 AS DataStatus,GETDATE() AS CreatedDate,0 AS CreatedBy,GETDATE() AS ModifiedDate,0 AS ModifiedBy
END
GO
/****** Object:  StoredProcedure [dbo].[USP_TollFareSetup]    Script Date: 07-Jan-25 9:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_TollFareSetup] 
@TollFare NVARCHAR(MAX),
@EffectedFrom Date,
@DataStatus smallint,
@CreatedDate DateTime,
@CreatedBy bigint,
@ModifiedDate DateTime,
@ModifiedBy bigint
AS
BEGIN
	DECLARE @TollFareId bigint =0
	DECLARE @MenuId smallint=15;
	DECLARE @PVal varchar(4000)
	DECLARE @CVal varchar(4000)
	DECLARE @cnt int=0
	CREATE TABLE #Temp(AlertMessage varchar(100),AlertData varchar(8000))
	BEGIN TRY
		IF(CONVERT(DATE,GETDATE())>=@EffectedFrom)
		BEGIN
			INSERT INTO #Temp(AlertMessage)
			VALUES('Effeted date must be greater than future date')
		END
		ELSE
		BEGIN
			SELECT @MenuId=MenuId FROM tbl_MenuMaster WHERE MenuName ='Toll Fare'
			SELECT @TollFareId=TollFareId FROM tbl_TollFareMaster WHERE EffectedFrom=@EffectedFrom
			SET @TollFareId =ISNULL(@TollFareId,0)
			DELETE FROM tbl_TollFareConfiguration WHERE TollFareId=@TollFareId
			IF(@TollFareId=0)
			BEGIN
				INSERT INTO tbl_TollFareMaster(EffectedFrom,DataStatus,CreatedDate,CreatedBy)
				VALUES(@EffectedFrom,@DataStatus,@CreatedDate,@CreatedBy)
				SELECT @TollFareId=@@IDENTITY

				SET @CVal=(SELECT * FROM tbl_TollFareMaster WHERE TollFareId=@TollFareId FOR JSON AUTO, WITHOUT_ARRAY_WRAPPER)		
			
				INSERT INTO tbl_TollFareConfiguration(TollFareId,JourneyId,SystemVehicleClassId,SubVehicleClassId,TollFare,ReturnFare,DistrictRegisteredFare,FasTagPenalty,OverweightPenalty,MonthlyPass)
				SELECT @TollFareId,JourneyId,SystemVehicleClassId,SubVehicleClassId,TollFare,ReturnFare,DistrictRegisteredFare,FasTagPenalty,OverweightPenalty,MonthlyPass
				FROM OPENJSON(@TollFare) 
				WITH (
					TollFareId bigint,
					TollFare decimal(18, 2),
					ReturnFare decimal(18, 2),
					FasTagPenalty decimal(18, 2),
					OverweightPenalty decimal(18, 2),
					MonthlyPass decimal(18, 2),
					DistrictRegisteredFare decimal(18, 2),
					SystemVehicleClassId smallint,
					SubVehicleClassId smallint,
					JourneyId smallint
				);
			
				INSERT INTO tbl_ActivityLog(UserId,CurrentColumn,ActionId,MenuId,CreatedDate)
				VALUES(@CreatedBy,@CVal,'Insert',@MenuId,@CreatedDate);

				INSERT INTO #Temp(AlertMessage,AlertData)VALUES('success',@CVal);
			END
			ELSE
			BEGIN
				SET @PVal=(SELECT * FROM tbl_TollFareMaster WHERE TollFareId=@TollFareId FOR JSON AUTO, WITHOUT_ARRAY_WRAPPER)	
				
				UPDATE tbl_TollFareMaster SET EffectedFrom=@EffectedFrom,
				DataStatus=@DataStatus,ModifiedDate=@ModifiedDate,ModifiedBy=@ModifiedBy
				WHERE TollFareId=@TollFareId
			
				
			
				INSERT INTO tbl_TollFareConfiguration(TollFareId,JourneyId,SystemVehicleClassId,SubVehicleClassId,TollFare,ReturnFare,DistrictRegisteredFare,FasTagPenalty,OverweightPenalty,MonthlyPass)
				SELECT @TollFareId,JourneyId,SystemVehicleClassId,SubVehicleClassId,TollFare,ReturnFare,DistrictRegisteredFare,FasTagPenalty,OverweightPenalty,MonthlyPass
				FROM OPENJSON(@TollFare) 
				WITH (
					TollFareId bigint,
					TollFare decimal(18, 2),
					ReturnFare decimal(18, 2),
					FasTagPenalty decimal(18, 2),
					OverweightPenalty decimal(18, 2),
					MonthlyPass decimal(18, 2),
					DistrictRegisteredFare decimal(18, 2),
					SystemVehicleClassId smallint,
					SubVehicleClassId smallint,
					JourneyId smallint
				);
				
				SET @CVal=(SELECT * FROM tbl_TollFareMaster WHERE TollFareId=@TollFareId FOR JSON AUTO, WITHOUT_ARRAY_WRAPPER)	
				
					
				INSERT INTO tbl_ActivityLog(UserId,PrevColumn,CurrentColumn,ActionId,MenuId,CreatedDate)
				VALUES(@ModifiedBy,@PVal,@CVal,'Update',@MenuId,@ModifiedDate);

				INSERT INTO #Temp(AlertMessage,AlertData)VALUES('success',@CVal);
			END


			
			
			

			

		
			
		END
	END TRY  
	BEGIN CATCH  
		INSERT INTO #Temp(AlertMessage)VALUES('failed');
		EXECUTE usp_ErrorInfoInsert;  
	END CATCH  
	select * from #Temp;	
END

GO
/****** Object:  StoredProcedure [dbo].[USP_TrafficTransactionDetailReport]    Script Date: 07-Jan-25 9:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_TrafficTransactionDetailReport]
@TDate VARCHAR(20)
AS BEGIN
	
	CREATE TABLE #tempClassDetails(RowNumber smallint,VehicleClassId smallint,VehicleClassName varchar(50))
	INSERT INTO #tempClassDetails(VehicleClassId,VehicleClassName,RowNumber)
	Select SystemVehicleSubClassId,FasTagVehicleClassName,ROW_NUMBER() OVER(ORDER BY SystemVehicleSubClassId asc)AS Row          
	FROM tbl_SystemVehicleSubClass S 
	INNER JOIN tbl_FasTagVehicleClass F ON S.SystemVehicleSubClassId = F.FasTagVehicleClassId 
	ORDER BY SystemVehicleSubClassId asc

	CREATE TABLE #tempData (ReportName varchar(50),MOP varchar(50))
	

	DECLARE @count int=0   
	DECLARE @Index  int=1


	
	DECLARE 
	@ColumnName NVARCHAR(MAX), 
	@sql NVARCHAR(MAX), 
	@Scolumns NVARCHAR(MAX) , 
	@Totcolumns NVARCHAR(MAX),
	@NColumnName NVARCHAR(MAX);

	select @count=count(1) from #tempClassDetails      
	WHILE @Index <= @count  
	BEGIN
		SELECT @ColumnName = VehicleClassName FROM #tempClassDetails WHERE RowNumber = @Index;
		EXEC('ALTER TABLE #tempData ADD [' + @ColumnName + '] int');
		SET @Index += 1;
	END
	ALTER TABLE #tempData ADD Total int DEFAULT 0, TrafficAverage decimal(10,2) DEFAULT 0
	

	SET @ColumnName = 
	(
		SELECT DISTINCT '' + QUOTENAME(VehicleClassName) + ',' 
		FROM #tempClassDetails 
		FOR XML PATH('')
	);

	SET @NColumnName = 
	(
		SELECT DISTINCT 'ISNULL(' + QUOTENAME(VehicleClassName) + ', 0),' 
		FROM #tempClassDetails 
		FOR XML PATH('')
	);

	SET @Scolumns = 
	(
		SELECT DISTINCT 'ISNULL(' + QUOTENAME(VehicleClassName) + ', 0)+' 
		FROM #tempClassDetails 
		FOR XML PATH('')
	);

	SET @Totcolumns = 
	(
		SELECT DISTINCT 'SUM(ISNULL(' + QUOTENAME(VehicleClassName) + ', 0)),' 
		FROM #tempClassDetails 
		FOR XML PATH('')
	);



	SET @ColumnName = LEFT(@ColumnName, LEN(@ColumnName) - 1);
	SET @Scolumns = LEFT(@Scolumns, LEN(@Scolumns) - 1);
	SET @Totcolumns = LEFT(@Totcolumns, LEN(@Totcolumns) - 1);
	SET @NColumnName = LEFT(@NColumnName, LEN(@NColumnName) - 1);
	SET @sql = '
	INSERT INTO #tempData(ReportName,MOP,' + @ColumnName + ',Total)
	SELECT 
		ReportName,MOP, ' + @NColumnName + ', Total
	FROM 
		(
			SELECT 
				''Traffic Transaction Detail'' AS ReportName,
				ETM.TransactionTypeName AS MOP, 
				SVC.SystemVehicleClassName,
				COUNT(LT.VehicleClassId) AS [Count]
			FROM 
				tbl_TransactionTypeMaster ETM
			CROSS JOIN tbl_SystemVehicleClass SVC
			LEFT JOIN tbl_LaneTransaction LT ON LT.TransactionTypeId = ETM.TransactionTypeId AND LT.VehicleClassId = SVC.SystemVehicleClassId
			AND CONVERT(date,LT.TransactionDateTime)=CONVERT(date,''' + @TDate + ''') AND LT.TransactionTypeId<>3
			WHERE ETM.DataStatus=1 AND ETM.TransactionTypeId <> 4
			GROUP BY 
				ETM.TransactionTypeName, SVC.SystemVehicleClassName
		) AS SourceTable
	PIVOT 
		(
			SUM([Count]) FOR SystemVehicleClassName IN (' + @ColumnName + ')
		) AS PivotTable
	CROSS APPLY (
		SELECT SUM(cnt) AS Total
		FROM (VALUES (' + @Scolumns + ')) AS X(cnt)
	) AS TotalColumns'
		
		EXEC sp_executesql @sql;
		EXEC('INSERT INTO #tempData(MOP,' + @ColumnName + ',Total) SELECT ''Total'','+@Totcolumns+',SUM(Total) FROM #tempData')

		

		UPDATE #tempData 
		SET TrafficAverage = ISNULL((Total / 
		(SELECT NULLIF(Total, 0) FROM #tempData WHERE MOP = 'Total'))*100,0);

		EXEC('SELECT ReportName,MOP,'+@ColumnName+',Total,TrafficAverage AS [Traffic Average] FROM #tempData')
END

--GO 
--EXEC USP_TrafficTransactionDetailReport
--@TDate='29-Aug-2024'
GO
/****** Object:  StoredProcedure [dbo].[USP_TransactionTypeGetActive]    Script Date: 07-Jan-25 9:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_TransactionTypeGetActive]
AS BEGIN
	SELECT T.TransactionTypeId,T.TransactionTypeName,T.ReviewRequired,T.DataStatus,T.CreatedDate,T.CreatedBy,T.ModifiedDate,T.ModifiedBy,DS.DataStatusName 
	FROM tbl_TransactionTypeMaster T 
	INNER JOIN tbl_DataStatusMaster DS ON T.DataStatus=DS.DataStatusId
	WHERE T.DataStatus=1
END
GO
/****** Object:  StoredProcedure [dbo].[USP_TransactionTypeGetAll]    Script Date: 07-Jan-25 9:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_TransactionTypeGetAll]
AS BEGIN
	SELECT T.TransactionTypeId,T.TransactionTypeName,T.ReviewRequired,T.DataStatus,T.CreatedDate,T.CreatedBy,T.ModifiedDate,T.ModifiedBy,DS.DataStatusName 
	FROM tbl_TransactionTypeMaster T 
INNER JOIN tbl_DataStatusMaster DS ON T.DataStatus=DS.DataStatusId
END
GO
/****** Object:  StoredProcedure [dbo].[USP_TransactionTypeUpdate]    Script Date: 07-Jan-25 9:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[USP_TransactionTypeUpdate] 
@SessionId varchar(20),
@CreatedDate DateTime,
@CreatedBy bigint,
@ModifiedDate DateTime,
@ModifiedBy bigint
AS
BEGIN
	DECLARE @Datacnt int
	DECLARE @MenuId smallint=0;
	DECLARE @cnt int
	DECLARE @PositionCount int
	DECLARE @ActionId varchar(100)
	CREATE TABLE #Temp(AlertMessage varchar(100))
	BEGIN TRY  
		
		SELECT @MenuId=MenuId FROM tbl_MenuMaster WHERE MenuName ='Transaction Type'
		
		UPDATE T SET T.ReviewRequired=V.ReviewRequired,T.DataStatus=V.DataStatus 
		FROM tbl_TransactionTypeMaster T INNER JOIN
		(
			SELECT TransactionTypeId,ReviewRequired,DataStatus
			FROM temp_TransactionTypeMaster
		    WHERE SessionId=@SessionId
		) V ON T.TransactionTypeId=V.TransactionTypeId
		
		DELETE FROM temp_TransactionTypeMaster WHERE SessionId=@SessionId

		INSERT INTO tbl_ActivityLog(UserId,ActionId,MenuId,CreatedDate)
		VALUES(@CreatedBy,'Update',@MenuId,@CreatedDate);
		
		INSERT INTO #Temp(AlertMessage)VALUES('success');
	
	END TRY  
	BEGIN CATCH  
		INSERT INTO #Temp(AlertMessage)VALUES('failed');
		EXECUTE USP_ErrorInfoInsert;  
	END CATCH  
		select * from #Temp;
END
--GO
--EXEC USP_EquipmentConfigInsertUpdate
--@SessionId ='MN7VD8TUAI',
--@SystemId=6,
--@CreatedDate ='26-Jul-2022 11:30:00',
--@CreatedBy =0,
--@ModifiedDate='26-Jul-2022 11:30:00',
--@ModifiedBy =0
GO
/****** Object:  StoredProcedure [dbo].[USP_UserforLaneGetAll]    Script Date: 07-Jan-25 9:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_UserforLaneGetAll]
AS BEGIN
	SELECT U.UserId,U.LoginId,U.LoginPassword,U.FirstName,U.LastName,U.EmailId,
	U.MobileNumber,U.AccountExpiredDate,U.RoleId,ISNULL(R.RoleName,'N/A') RoleName,
	U.DataStatus,U.CreatedDate,U.CreatedBy,U.ModifiedDate,U.ModifiedBy,P.PlazaId,P.PlazaName,
	U.UserProfileImage,U.UserTypeId,UT.UserTypeName,DS.DataStatusName
	FROM tbl_UserMaster U 
	left JOIN tbl_UserTypeMaster UT ON U.UserTypeId=UT.UserTypeId
	left JOIN tbl_DataStatusMaster DS ON U.DataStatus=DS.DataStatusId
	left Join tbl_RoleMaster R ON U.RoleId=R.RoleId 
	left Join tbl_PlazaConfiguration P ON U.PlazaId=P.PlazaId
	WHERE U.UserTypeId IN (4,5) AND U.DataStatus=1
END



GO
/****** Object:  StoredProcedure [dbo].[USP_UserGetAll]    Script Date: 07-Jan-25 9:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_UserGetAll]

AS BEGIN
	SELECT U.UserId,U.LoginId,U.LoginPassword,U.FirstName,U.LastName,U.EmailId,
	U.MobileNumber,U.AccountExpiredDate,U.RoleId,ISNULL(R.RoleName,'N/A') RoleName,
	U.DataStatus,U.CreatedDate,U.CreatedBy,U.ModifiedDate,U.ModifiedBy,P.PlazaId,P.PlazaName,
	U.UserProfileImage,U.UserTypeId,UT.UserTypeName,DS.DataStatusName
	FROM tbl_UserMaster U 
	left JOIN tbl_UserTypeMaster UT ON U.UserTypeId=UT.UserTypeId
	left JOIN tbl_DataStatusMaster DS ON U.DataStatus=DS.DataStatusId
	left Join tbl_RoleMaster R ON U.RoleId=R.RoleId 
	left Join tbl_PlazaConfiguration P ON U.PlazaId=P.PlazaId
END



GO
/****** Object:  StoredProcedure [dbo].[USP_UserGetbyId]    Script Date: 07-Jan-25 9:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_UserGetbyId]
@UserId bigint
AS BEGIN
	SELECT U.UserId,U.LoginId,U.LoginPassword,U.FirstName,U.LastName,U.EmailId,
	U.MobileNumber,U.AccountExpiredDate,U.RoleId,ISNULL(R.RoleName,'N/A') RoleName,
	U.DataStatus,U.CreatedDate,U.CreatedBy,U.ModifiedDate,U.ModifiedBy,P.PlazaId,P.PlazaName,
	U.UserProfileImage,U.UserTypeId,UT.UserTypeName,DS.DataStatusName
	FROM tbl_UserMaster U 
	left JOIN tbl_UserTypeMaster UT ON U.UserTypeId=UT.UserTypeId
	left JOIN tbl_DataStatusMaster DS ON U.DataStatus=DS.DataStatusId
	left Join tbl_RoleMaster R ON U.RoleId=R.RoleId 
	left Join tbl_PlazaConfiguration P ON U.PlazaId=P.PlazaId
	WHERE U.UserId=@UserId
	
END
--GO
--EXEC USP_UserGetbyId
--@UserId=1




GO
/****** Object:  StoredProcedure [dbo].[USP_UserGetBySystemUserTypeId]    Script Date: 07-Jan-25 9:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_UserGetBySystemUserTypeId]
@UserTypeId smallint,
@SystemId smallint
AS BEGIN
	SELECT U.UserId,U.LoginId,U.LoginPassword,U.FirstName,U.LastName,U.EmailId,
	U.MobileNumber,U.AccountExpiredDate,U.RoleId,ISNULL(R.RoleName,'N/A') RoleName,
	U.DataStatus,U.CreatedDate,U.CreatedBy,U.ModifiedDate,U.ModifiedBy,P.PlazaId,P.PlazaName,
	U.UserProfileImage,U.UserTypeId,UT.UserTypeName,DS.DataStatusName
	FROM tbl_UserMaster U 
	left JOIN tbl_UserTypeMaster UT ON U.UserTypeId=UT.UserTypeId
	left JOIN tbl_DataStatusMaster DS ON U.DataStatus=DS.DataStatusId
	left Join tbl_RoleMaster R ON U.RoleId=R.RoleId 
	left Join tbl_PlazaConfiguration P ON U.PlazaId=P.PlazaId
	WHERE R.RoleId IN 
	(
		SELECT RoleId FROM tbl_RolePermission
		WHERE MenuId IN 
		(
			SELECT MenuId FROM tbl_MenuMaster --WHERE SystemId=@SystemId
		) AND (DataAdd=1 OR DataUpdate=1)
	)
	
END
--GO
--EXEC USP_UserGetBySystemUserTypeId
--@UserTypeId=3,
--@SystemId=6



GO
/****** Object:  StoredProcedure [dbo].[USP_UserGetByUserTypeId]    Script Date: 07-Jan-25 9:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_UserGetByUserTypeId]
@UserTypeId smallint
AS BEGIN
	SELECT U.UserId,U.LoginId,U.LoginPassword,U.FirstName,U.LastName,U.EmailId,
	U.MobileNumber,U.AccountExpiredDate,U.RoleId,ISNULL(R.RoleName,'N/A') RoleName,
	U.DataStatus,U.CreatedDate,U.CreatedBy,U.ModifiedDate,U.ModifiedBy,P.PlazaId,P.PlazaName,
	U.UserProfileImage,U.UserTypeId,UT.UserTypeName,DS.DataStatusName
	FROM tbl_UserMaster U 
	left JOIN tbl_UserTypeMaster UT ON U.UserTypeId=UT.UserTypeId
	left JOIN tbl_DataStatusMaster DS ON U.DataStatus=DS.DataStatusId
	left Join tbl_RoleMaster R ON U.RoleId=R.RoleId 
	left Join tbl_PlazaConfiguration P ON U.PlazaId=P.PlazaId
	WHERE U.UserTypeId=@UserTypeId
	
END



GO
/****** Object:  StoredProcedure [dbo].[USP_UserInsertUpdate]    Script Date: 07-Jan-25 9:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_UserInsertUpdate] 
@UserId bigint,
@LoginId varchar (40),
@LoginPassword varchar (200),
@FirstName varchar (40),
@LastName varchar (40),
@EmailId varchar (50),
@MobileNumber varchar (30),
@AccountExpiredDate Date,
@PlazaId smallint,
@UserTypeId smallint,
@RoleId int,
@DataStatus smallint,
@CreatedDate DateTime,
@CreatedBy bigint,
@ModifiedDate DateTime,
@ModifiedBy bigint
AS
BEGIN
	DECLARE @PVal varchar(4000)
	DECLARE @CVal varchar(4000)
	DECLARE @MenuId smallint=10;
	CREATE TABLE #Temp(AlertMessage varchar(100),AlertData varchar(8000))
	DECLARE @cnt int
	BEGIN TRY
	SELECT @MenuId=MenuId FROM tbl_MenuMaster WHERE MenuName ='Users'
	IF EXISTS(SELECT UserId FROM tbl_UserMaster where MobileNumber=@MobileNumber AND UserId<>@UserId)
		BEGIN
			INSERT INTO #Temp(AlertMessage)
			VALUES('Mobile number already exists')
		END
	IF EXISTS(SELECT UserId FROM tbl_UserMaster where EmailId=@EmailId AND UserId<>@UserId)
		BEGIN
			INSERT INTO #Temp(AlertMessage)
			VALUES('Email id already exists')
		END
	IF EXISTS(SELECT UserId FROM tbl_UserMaster where LoginId=@LoginId  AND UserId<>@UserId)
		BEGIN
			INSERT INTO #Temp(AlertMessage)
			VALUES('Login id already exists')
		END
	SELECT @cnt=COUNT(AlertMessage)  FROM #Temp
	IF(@cnt=0)
		BEGIN
			IF(@UserId=0)
			BEGIN
				insert into tbl_UserMaster(LoginId,PlazaId,LoginPassword,FirstName,LastName,EmailId,MobileNumber,AccountExpiredDate,RoleId,UserTypeId,DataStatus,CreatedDate,CreatedBy)
				values(@LoginId,@PlazaId,@LoginPassword,@FirstName,@LastName,@EmailId,@MobileNumber,@AccountExpiredDate,@RoleId,@UserTypeId,@DataStatus,@CreatedDate,@CreatedBy);
				SELECT @UserId=@@IDENTITY
				
				SET @CVal=(SELECT * FROM tbl_UserMaster WHERE UserId=@UserId FOR JSON AUTO, WITHOUT_ARRAY_WRAPPER)		
				
				INSERT INTO tbl_ActivityLog(UserId,CurrentColumn,ActionId,MenuId,CreatedDate)
				VALUES(@CreatedBy,@CVal,'Insert',@MenuId,@CreatedDate);
				
				--INSERT INTO #Temp(AlertMessage)VALUES('User added successfully.');
				INSERT INTO #Temp(AlertMessage,AlertData)VALUES('success',@CVal);
			END
			ELSE
			BEGIN
				SET @PVal=(SELECT * FROM tbl_UserMaster WHERE UserId=@UserId FOR JSON AUTO, WITHOUT_ARRAY_WRAPPER)	

				UPDATE tbl_UserMaster SET DataStatus=@DataStatus,ModifiedDate=@ModifiedDate,ModifiedBy=@ModifiedBy,
				PlazaId=@PlazaId,UserTypeId=@UserTypeId,FirstName=@FirstName,LastName=@LastName,EmailId=@EmailId,MobileNumber=@MobileNumber,
				AccountExpiredDate=@AccountExpiredDate,RoleId=@RoleId,LoginPassword=@LoginPassword,LoginId=@LoginId
				WHERE UserId=@UserId

				SET @CVal=(SELECT * FROM tbl_UserMaster WHERE UserId=@UserId FOR JSON AUTO, WITHOUT_ARRAY_WRAPPER)		

				INSERT INTO tbl_ActivityLog(UserId,PrevColumn,CurrentColumn,ActionId,MenuId,CreatedDate)
				VALUES(@ModifiedBy,@PVal,@CVal,'Update',@MenuId,@ModifiedDate);

				--INSERT INTO #Temp(AlertMessage)VALUES('User updated successfully.');
				INSERT INTO #Temp(AlertMessage,AlertData)VALUES('success',@CVal);

			END
		END
	END TRY  
	BEGIN CATCH  
		INSERT INTO #Temp(AlertMessage)VALUES('failed');
		EXECUTE USP_ErrorInfoInsert;  
	END CATCH  
	
		select * from #Temp;
END

--Go 
--Exec [USP_UserInsertUpdate]
--@UserId =1005,
--@LoginId ='harshit',
--@LoginPassword ='KoIhaCzGbewnfVXVZ9iTjQ==',
--@FirstName ='"Harshit fgvfgf',
--@LastName ='Gautam',
--@EmailId ='h@gmail.com',
--@MobileNumber ='9873213219',
--@AccountExpiredDate ='31-Mar-2022 00:00:00',
--@UserTypeId =3,
--@RoleId =1,
--@DataStatus =1,
--@UserId =0,
--@CDateTime ='24-Feb-2022 00:00:00'


GO
/****** Object:  StoredProcedure [dbo].[USP_UserLoginActivityLog]    Script Date: 07-Jan-25 9:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_UserLoginActivityLog]
    @UserId BIGINT,
    @IPAddress NVARCHAR(50),
    @LocalIPAddress NVARCHAR(50),
    @ResultMessage NVARCHAR(100) OUTPUT
AS
BEGIN
    
    IF EXISTS (SELECT 1 FROM tbl_UserActivityLog WHERE UserId = @UserId AND ActivityType = 1)
    BEGIN
        SET @ResultMessage = 'User is already logged in from another IP or machine';
        RETURN;
    END

    -- Step 2: Allow login if no active session exists
    INSERT INTO tbl_UserActivityLog (UserId, ActivityType, LocalIPAddress, IPAddress, LoginDateTime)
    VALUES (@UserId, 1, @LocalIPAddress, @IPAddress, GETDATE());

    SET @ResultMessage = 'Login successful';
END;
GO
/****** Object:  StoredProcedure [dbo].[USP_UserLogout]    Script Date: 07-Jan-25 9:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_UserLogout]
    @UserId BIGINT,
    @ResultMessage NVARCHAR(100) OUTPUT
AS
BEGIN
   
    IF NOT EXISTS (SELECT 1 FROM tbl_UserActivityLog WHERE UserId = @UserId AND ActivityType = 1)
    BEGIN
        SET @ResultMessage = 'No active session found for the user';
        RETURN;
    END

   
    UPDATE tbl_UserActivityLog
    SET ActivityType = 0, LogoutDateTime = GETDATE()
    WHERE UserId = @UserId AND ActivityType = 1;

    SET @ResultMessage = 'Logout successful';
END;


GO
/****** Object:  StoredProcedure [dbo].[USP_UserProfileChange]    Script Date: 07-Jan-25 9:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_UserProfileChange]
@UserId bigint,
@UserProfileImage varchar(255)
AS BEGIN
	DECLARE @MenuId int
	CREATE TABLE #Temp(AlertMessage varchar(100))
	SELECT @MenuId=MenuId FROM tbl_MenuMaster WHERE MenuName ='Users'
	BEGIN TRY
		UPDATE tbl_UserMaster SET UserProfileImage=@UserProfileImage
		WHERE UserId=@UserId
		INSERT INTO tbl_ActivityLog(UserId,PrevColumn,CurrentColumn,ActionId,MenuId,CreatedDate)
		VALUES(@UserId,'','','Profile Image Chnage',@MenuId,GETDATE());
		INSERT INTO #Temp(AlertMessage)VALUES('success');
	END TRY  
	BEGIN CATCH  
		INSERT INTO #Temp(AlertMessage)VALUES('failed');
		EXECUTE USP_ErrorInfoInsert;  
	END CATCH  
	
		select * from #Temp;
END
GO
/****** Object:  StoredProcedure [dbo].[USP_UsersGetByLoginId]    Script Date: 07-Jan-25 9:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_UsersGetByLoginId]
@LoginId varchar(100)
AS BEGIN
	SELECT U.UserId,U.LoginId,U.LoginPassword,U.FirstName,U.LastName,U.EmailId,
	U.MobileNumber,U.AccountExpiredDate,U.RoleId,ISNULL(R.RoleName,'N/A') RoleName,
	U.DataStatus,U.CreatedDate,U.CreatedBy,U.ModifiedDate,U.ModifiedBy,P.PlazaId,P.PlazaName,
	U.UserProfileImage,U.UserTypeId,UT.UserTypeName,DS.DataStatusName
	FROM tbl_UserMaster U 
	left JOIN tbl_UserTypeMaster UT ON U.UserTypeId=UT.UserTypeId
	left JOIN tbl_DataStatusMaster DS ON U.DataStatus=DS.DataStatusId
	left Join tbl_RoleMaster R ON U.RoleId=R.RoleId 
	left Join tbl_PlazaConfiguration P ON U.PlazaId=P.PlazaId
	WHERE U.LoginId=@LoginId
	
END



GO
/****** Object:  StoredProcedure [dbo].[USP_UserUpdatePassword]    Script Date: 07-Jan-25 9:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_UserUpdatePassword] 
@UserId bigint,
@LoginPassword varchar (200),
@CDateTime DateTime,
@CreatedBy bigint
AS
BEGIN
	DECLARE @MenuId smallint=10;
	CREATE TABLE #Temp(AlertMessage varchar(100))
	DECLARE @cnt int
	BEGIN TRY  
		UPDATE tbl_UserMaster SET ModifiedDate=@CDateTime,ModifiedBy=@UserId,LoginPassword=@LoginPassword
			WHERE UserId=@UserId
			INSERT INTO tbl_ActivityLog(UserId,CurrentColumn,PrevColumn,ActionId,MenuId,CreatedDate)
			VALUES(@CreatedBy,'','','Update Password',@MenuId,@CDateTime);
			INSERT INTO #Temp(AlertMessage)VALUES('Password chnaged successfully.');	
	END TRY  
	BEGIN CATCH  
		INSERT INTO #Temp(AlertMessage)VALUES('failed');
		EXECUTE USP_ErrorInfoInsert;  
	END CATCH  
	
		select * from #Temp;
END

--Go 
--Exec [USP_UserInsertUpdate]
--@UserId =1005,
--@LoginId ='harshit',
--@LoginPassword ='KoIhaCzGbewnfVXVZ9iTjQ==',
--@FirstName ='"Harshit fgvfgf',
--@LastName ='Gautam',
--@EmailId ='h@gmail.com',
--@MobileNumber ='9873213219',
--@AccountExpiredDate ='31-Mar-2022 00:00:00',
--@UserTypeId =3,
--@RoleId =1,
--@DataStatus =1,
--@UserId =0,
--@CDateTime ='24-Feb-2022 00:00:00'


GO
/****** Object:  StoredProcedure [dbo].[USP_WimTransactionAxleDetailsInsert]    Script Date: 07-Jan-25 9:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_WimTransactionAxleDetailsInsert]
@LaneId smallint,
@TransactionId bigint,
@AxleNumber smallint,
@AxleWeight decimal(18,3),
@Speed decimal(18,2),
@AxleDistance decimal(18,2)
AS BEGIN
	CREATE TABLE #Temp(AlertMessage varchar(100))
	BEGIN TRY
		INSERT INTO tbl_WimTransactionAxleDetails(LaneId,TransactionId,AxleNumber,AxleWeight,Speed,AxleDistance)
		VALUES(@LaneId,@TransactionId,@AxleNumber,@AxleWeight,@Speed,@AxleDistance)
		INSERT INTO #Temp(AlertMessage)VALUES('success');
	END TRY  
	BEGIN CATCH  
		INSERT INTO #Temp(AlertMessage)VALUES('failed');
		EXECUTE usp_ErrorInfoInsert;  
	END CATCH  
	SELECT * FROM #Temp
END
GO
/****** Object:  StoredProcedure [dbo].[USP_WimTransactionInsert]    Script Date: 07-Jan-25 9:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_WimTransactionInsert]
@LaneId smallint,
@TransactionId bigint,
@TotalWeight decimal(18,3),
@AxleCount smallint,
@IsReverseDirection bit ,
@TransactionDateTime datetime2(6)
AS BEGIN
	CREATE TABLE #Temp(AlertMessage varchar(100))
	BEGIN TRY
		INSERT INTO tbl_WimTransaction(LaneId,TransactionId,TotalWeight,AxleCount,IsReverseDirection,TransactionDateTime)
		VALUES(@LaneId,@TransactionId,@TotalWeight,@AxleCount,@IsReverseDirection,@TransactionDateTime)
		INSERT INTO #Temp(AlertMessage)VALUES('success');
	END TRY  
	BEGIN CATCH  
		INSERT INTO #Temp(AlertMessage)VALUES('failed');
		EXECUTE usp_ErrorInfoInsert;  
	END CATCH  
	SELECT * FROM #Temp
END
GO
