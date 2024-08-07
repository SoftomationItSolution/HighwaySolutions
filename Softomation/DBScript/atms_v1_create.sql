USE [ATMSv1]
GO
/****** Object:  StoredProcedure [dbo].[USP_WeatherOpenAPIInsert]    Script Date: 14-06-2024 15:14:42 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_WeatherOpenAPIInsert]
GO
/****** Object:  StoredProcedure [dbo].[USP_WeatherEventsGetByHours]    Script Date: 14-06-2024 15:14:42 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_WeatherEventsGetByHours]
GO
/****** Object:  StoredProcedure [dbo].[USP_WeatherEventsGetByFilter]    Script Date: 14-06-2024 15:14:42 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_WeatherEventsGetByFilter]
GO
/****** Object:  StoredProcedure [dbo].[USP_WeatherEventInsert]    Script Date: 14-06-2024 15:14:42 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_WeatherEventInsert]
GO
/****** Object:  StoredProcedure [dbo].[USP_VSDSPendingReviewEventsGetByHours]    Script Date: 14-06-2024 15:14:42 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_VSDSPendingReviewEventsGetByHours]
GO
/****** Object:  StoredProcedure [dbo].[USP_VSDSEventsGetByHours]    Script Date: 14-06-2024 15:14:42 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_VSDSEventsGetByHours]
GO
/****** Object:  StoredProcedure [dbo].[USP_VSDSEventsGetByFilter]    Script Date: 14-06-2024 15:14:42 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_VSDSEventsGetByFilter]
GO
/****** Object:  StoredProcedure [dbo].[USP_VSDSEventReviewUpdate]    Script Date: 14-06-2024 15:14:42 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_VSDSEventReviewUpdate]
GO
/****** Object:  StoredProcedure [dbo].[USP_VMSMessageHistoryInsert]    Script Date: 14-06-2024 15:14:42 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_VMSMessageHistoryInsert]
GO
/****** Object:  StoredProcedure [dbo].[USP_VMSMessageHistoryGetByHours]    Script Date: 14-06-2024 15:14:42 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_VMSMessageHistoryGetByHours]
GO
/****** Object:  StoredProcedure [dbo].[USP_VMSMessageHistoryGetByFilter]    Script Date: 14-06-2024 15:14:42 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_VMSMessageHistoryGetByFilter]
GO
/****** Object:  StoredProcedure [dbo].[USP_VMSMessageHistoryGetAll]    Script Date: 14-06-2024 15:14:42 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_VMSMessageHistoryGetAll]
GO
/****** Object:  StoredProcedure [dbo].[USP_VMSMessageDetailsInsertUpdate]    Script Date: 14-06-2024 15:14:42 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_VMSMessageDetailsInsertUpdate]
GO
/****** Object:  StoredProcedure [dbo].[USP_VMSMessageDetailsGetById]    Script Date: 14-06-2024 15:14:42 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_VMSMessageDetailsGetById]
GO
/****** Object:  StoredProcedure [dbo].[USP_VMSMessageDetailsGetByFilter]    Script Date: 14-06-2024 15:14:42 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_VMSMessageDetailsGetByFilter]
GO
/****** Object:  StoredProcedure [dbo].[USP_VMSMessageDetailsGetAll]    Script Date: 14-06-2024 15:14:42 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_VMSMessageDetailsGetAll]
GO
/****** Object:  StoredProcedure [dbo].[USP_VIDSSummeryReport]    Script Date: 14-06-2024 15:14:42 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_VIDSSummeryReport]
GO
/****** Object:  StoredProcedure [dbo].[USP_VIDSPositionReport]    Script Date: 14-06-2024 15:14:42 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_VIDSPositionReport]
GO
/****** Object:  StoredProcedure [dbo].[USP_VIDSPendingReviewEventsGetByHours]    Script Date: 14-06-2024 15:14:42 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_VIDSPendingReviewEventsGetByHours]
GO
/****** Object:  StoredProcedure [dbo].[USP_VIDSLocationReport]    Script Date: 14-06-2024 15:14:42 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_VIDSLocationReport]
GO
/****** Object:  StoredProcedure [dbo].[USP_VIDSEventsReviewedGetByHours]    Script Date: 14-06-2024 15:14:42 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_VIDSEventsReviewedGetByHours]
GO
/****** Object:  StoredProcedure [dbo].[USP_VIDSEventsInsert]    Script Date: 14-06-2024 15:14:42 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_VIDSEventsInsert]
GO
/****** Object:  StoredProcedure [dbo].[USP_VIDSEventsHistory]    Script Date: 14-06-2024 15:14:42 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_VIDSEventsHistory]
GO
/****** Object:  StoredProcedure [dbo].[USP_VIDSEventsGetByHours]    Script Date: 14-06-2024 15:14:42 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_VIDSEventsGetByHours]
GO
/****** Object:  StoredProcedure [dbo].[USP_VIDSEventsGetByFilter]    Script Date: 14-06-2024 15:14:42 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_VIDSEventsGetByFilter]
GO
/****** Object:  StoredProcedure [dbo].[USP_VIDSEventReviewUpdate]    Script Date: 14-06-2024 15:14:42 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_VIDSEventReviewUpdate]
GO
/****** Object:  StoredProcedure [dbo].[USP_VIDSEventReport]    Script Date: 14-06-2024 15:14:42 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_VIDSEventReport]
GO
/****** Object:  StoredProcedure [dbo].[USP_VehicleClassInsertUpdate]    Script Date: 14-06-2024 15:14:42 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_VehicleClassInsertUpdate]
GO
/****** Object:  StoredProcedure [dbo].[USP_VehicleClassGetByIds]    Script Date: 14-06-2024 15:14:42 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_VehicleClassGetByIds]
GO
/****** Object:  StoredProcedure [dbo].[USP_VehicleClassGetById]    Script Date: 14-06-2024 15:14:42 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_VehicleClassGetById]
GO
/****** Object:  StoredProcedure [dbo].[USP_VehicleClassGetAll]    Script Date: 14-06-2024 15:14:42 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_VehicleClassGetAll]
GO
/****** Object:  StoredProcedure [dbo].[USP_UserUpdatePassword]    Script Date: 14-06-2024 15:14:42 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_UserUpdatePassword]
GO
/****** Object:  StoredProcedure [dbo].[USP_UsersGetByLoginId]    Script Date: 14-06-2024 15:14:42 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_UsersGetByLoginId]
GO
/****** Object:  StoredProcedure [dbo].[USP_UserProfileChange]    Script Date: 14-06-2024 15:14:42 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_UserProfileChange]
GO
/****** Object:  StoredProcedure [dbo].[USP_UserInsertUpdate]    Script Date: 14-06-2024 15:14:42 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_UserInsertUpdate]
GO
/****** Object:  StoredProcedure [dbo].[USP_UserGetByUserTypeId]    Script Date: 14-06-2024 15:14:42 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_UserGetByUserTypeId]
GO
/****** Object:  StoredProcedure [dbo].[USP_UserGetBySystemUserTypeId]    Script Date: 14-06-2024 15:14:42 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_UserGetBySystemUserTypeId]
GO
/****** Object:  StoredProcedure [dbo].[USP_UserGetbyId]    Script Date: 14-06-2024 15:14:42 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_UserGetbyId]
GO
/****** Object:  StoredProcedure [dbo].[USP_UserGetAll]    Script Date: 14-06-2024 15:14:42 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_UserGetAll]
GO
/****** Object:  StoredProcedure [dbo].[USP_SystemUpdate]    Script Date: 14-06-2024 15:14:42 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_SystemUpdate]
GO
/****** Object:  StoredProcedure [dbo].[USP_SystemSettingInsertUpdate]    Script Date: 14-06-2024 15:14:42 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_SystemSettingInsertUpdate]
GO
/****** Object:  StoredProcedure [dbo].[USP_SystemSettingGet]    Script Date: 14-06-2024 15:14:42 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_SystemSettingGet]
GO
/****** Object:  StoredProcedure [dbo].[USP_SystemGetByName]    Script Date: 14-06-2024 15:14:42 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_SystemGetByName]
GO
/****** Object:  StoredProcedure [dbo].[USP_SystemGetById]    Script Date: 14-06-2024 15:14:42 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_SystemGetById]
GO
/****** Object:  StoredProcedure [dbo].[USP_SystemGetAll]    Script Date: 14-06-2024 15:14:42 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_SystemGetAll]
GO
/****** Object:  StoredProcedure [dbo].[USP_RolesPersmissionGetByRoleId]    Script Date: 14-06-2024 15:14:42 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_RolesPersmissionGetByRoleId]
GO
/****** Object:  StoredProcedure [dbo].[USP_RolesPersmissionGetByMenuId]    Script Date: 14-06-2024 15:14:42 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_RolesPersmissionGetByMenuId]
GO
/****** Object:  StoredProcedure [dbo].[USP_RolesPersmissionGetByMenu]    Script Date: 14-06-2024 15:14:42 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_RolesPersmissionGetByMenu]
GO
/****** Object:  StoredProcedure [dbo].[USP_RolesGetById]    Script Date: 14-06-2024 15:14:42 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_RolesGetById]
GO
/****** Object:  StoredProcedure [dbo].[USP_RolesGetAll]    Script Date: 14-06-2024 15:14:42 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_RolesGetAll]
GO
/****** Object:  StoredProcedure [dbo].[USP_RolePermissionInsertUpdate]    Script Date: 14-06-2024 15:14:42 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_RolePermissionInsertUpdate]
GO
/****** Object:  StoredProcedure [dbo].[USP_RoleInsertUpdate]    Script Date: 14-06-2024 15:14:42 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_RoleInsertUpdate]
GO
/****** Object:  StoredProcedure [dbo].[USP_ReportMasterGetByName]    Script Date: 14-06-2024 15:14:42 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_ReportMasterGetByName]
GO
/****** Object:  StoredProcedure [dbo].[USP_ReportMasterGetByIds]    Script Date: 14-06-2024 15:14:42 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_ReportMasterGetByIds]
GO
/****** Object:  StoredProcedure [dbo].[USP_ReportMasterGetById]    Script Date: 14-06-2024 15:14:42 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_ReportMasterGetById]
GO
/****** Object:  StoredProcedure [dbo].[USP_ReportMasterGetAll]    Script Date: 14-06-2024 15:14:42 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_ReportMasterGetAll]
GO
/****** Object:  StoredProcedure [dbo].[USP_ReportDataGetBySystemId]    Script Date: 14-06-2024 15:14:42 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_ReportDataGetBySystemId]
GO
/****** Object:  StoredProcedure [dbo].[USP_PackageInsertUpdate]    Script Date: 14-06-2024 15:14:42 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_PackageInsertUpdate]
GO
/****** Object:  StoredProcedure [dbo].[USP_PackageGetById]    Script Date: 14-06-2024 15:14:42 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_PackageGetById]
GO
/****** Object:  StoredProcedure [dbo].[USP_PackageGetAll]    Script Date: 14-06-2024 15:14:42 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_PackageGetAll]
GO
/****** Object:  StoredProcedure [dbo].[USP_MenuGetByRoleId]    Script Date: 14-06-2024 15:14:42 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_MenuGetByRoleId]
GO
/****** Object:  StoredProcedure [dbo].[USP_MenuGetAll]    Script Date: 14-06-2024 15:14:42 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_MenuGetAll]
GO
/****** Object:  StoredProcedure [dbo].[USP_MasterDataGetBySystemId]    Script Date: 14-06-2024 15:14:42 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_MasterDataGetBySystemId]
GO
/****** Object:  StoredProcedure [dbo].[USP_LogingActivityUpdate]    Script Date: 14-06-2024 15:14:42 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_LogingActivityUpdate]
GO
/****** Object:  StoredProcedure [dbo].[USP_LogingActivityInsert]    Script Date: 14-06-2024 15:14:42 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_LogingActivityInsert]
GO
/****** Object:  StoredProcedure [dbo].[USP_LaneConfigInsertUpdate]    Script Date: 14-06-2024 15:14:42 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_LaneConfigInsertUpdate]
GO
/****** Object:  StoredProcedure [dbo].[USP_LaneConfigGetAll]    Script Date: 14-06-2024 15:14:42 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_LaneConfigGetAll]
GO
/****** Object:  StoredProcedure [dbo].[USP_IncidentStatusMasterGetAll]    Script Date: 14-06-2024 15:14:42 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_IncidentStatusMasterGetAll]
GO
/****** Object:  StoredProcedure [dbo].[USP_IncidentSourceGetAll]    Script Date: 14-06-2024 15:14:42 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_IncidentSourceGetAll]
GO
/****** Object:  StoredProcedure [dbo].[USP_IncidentGetPending]    Script Date: 14-06-2024 15:14:42 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_IncidentGetPending]
GO
/****** Object:  StoredProcedure [dbo].[USP_IncidentGetInProgress]    Script Date: 14-06-2024 15:14:42 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_IncidentGetInProgress]
GO
/****** Object:  StoredProcedure [dbo].[USP_IncidentGetClose]    Script Date: 14-06-2024 15:14:42 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_IncidentGetClose]
GO
/****** Object:  StoredProcedure [dbo].[USP_IncidentGetByFilter]    Script Date: 14-06-2024 15:14:42 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_IncidentGetByFilter]
GO
/****** Object:  StoredProcedure [dbo].[USP_IncidentDetailsUpdate]    Script Date: 14-06-2024 15:14:42 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_IncidentDetailsUpdate]
GO
/****** Object:  StoredProcedure [dbo].[USP_IncidentDetailsInsert]    Script Date: 14-06-2024 15:14:42 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_IncidentDetailsInsert]
GO
/****** Object:  StoredProcedure [dbo].[USP_IncidentDetailsGetById]    Script Date: 14-06-2024 15:14:42 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_IncidentDetailsGetById]
GO
/****** Object:  StoredProcedure [dbo].[USP_IncidentCategoryMasterGetAll]    Script Date: 14-06-2024 15:14:42 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_IncidentCategoryMasterGetAll]
GO
/****** Object:  StoredProcedure [dbo].[USP_IncidentActionInsert]    Script Date: 14-06-2024 15:14:42 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_IncidentActionInsert]
GO
/****** Object:  StoredProcedure [dbo].[USP_IncidentActionHistorGetById]    Script Date: 14-06-2024 15:14:42 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_IncidentActionHistorGetById]
GO
/****** Object:  StoredProcedure [dbo].[USP_FUN_TBL_DATA]    Script Date: 14-06-2024 15:14:42 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_FUN_TBL_DATA]
GO
/****** Object:  StoredProcedure [dbo].[USP_EventsTypeUpdate]    Script Date: 14-06-2024 15:14:42 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_EventsTypeUpdate]
GO
/****** Object:  StoredProcedure [dbo].[USP_EventsTypeMasterGetBySystemId]    Script Date: 14-06-2024 15:14:42 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_EventsTypeMasterGetBySystemId]
GO
/****** Object:  StoredProcedure [dbo].[USP_EventsTypeMasterGetAll]    Script Date: 14-06-2024 15:14:42 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_EventsTypeMasterGetAll]
GO
/****** Object:  StoredProcedure [dbo].[USP_ErrorInfoInsert]    Script Date: 14-06-2024 15:14:42 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_ErrorInfoInsert]
GO
/****** Object:  StoredProcedure [dbo].[USP_EquipmentTypeMasterGetAll]    Script Date: 14-06-2024 15:14:42 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_EquipmentTypeMasterGetAll]
GO
/****** Object:  StoredProcedure [dbo].[USP_EquipmentDetailsInsertUpdate]    Script Date: 14-06-2024 15:14:42 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_EquipmentDetailsInsertUpdate]
GO
/****** Object:  StoredProcedure [dbo].[USP_EquipmentDetailsGetBySystemId]    Script Date: 14-06-2024 15:14:42 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_EquipmentDetailsGetBySystemId]
GO
/****** Object:  StoredProcedure [dbo].[USP_EquipmentDetailsGetByIds]    Script Date: 14-06-2024 15:14:42 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_EquipmentDetailsGetByIds]
GO
/****** Object:  StoredProcedure [dbo].[USP_EquipmentDetailsGetById]    Script Date: 14-06-2024 15:14:42 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_EquipmentDetailsGetById]
GO
/****** Object:  StoredProcedure [dbo].[USP_EquipmentDetailsGetByFilter]    Script Date: 14-06-2024 15:14:42 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_EquipmentDetailsGetByFilter]
GO
/****** Object:  StoredProcedure [dbo].[USP_EquipmentDetailsGetByEquipmentTypeId]    Script Date: 14-06-2024 15:14:42 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_EquipmentDetailsGetByEquipmentTypeId]
GO
/****** Object:  StoredProcedure [dbo].[USP_EquipmentDetailsGetAll]    Script Date: 14-06-2024 15:14:42 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_EquipmentDetailsGetAll]
GO
/****** Object:  StoredProcedure [dbo].[USP_EquipmentConfigInsertUpdate]    Script Date: 14-06-2024 15:14:42 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_EquipmentConfigInsertUpdate]
GO
/****** Object:  StoredProcedure [dbo].[USP_EquipmentConfigGetBySystemId]    Script Date: 14-06-2024 15:14:42 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_EquipmentConfigGetBySystemId]
GO
/****** Object:  StoredProcedure [dbo].[USP_EquipmentConfigGetActive]    Script Date: 14-06-2024 15:14:42 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_EquipmentConfigGetActive]
GO
/****** Object:  StoredProcedure [dbo].[USP_ECBSummeryReport]    Script Date: 14-06-2024 15:14:42 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_ECBSummeryReport]
GO
/****** Object:  StoredProcedure [dbo].[USP_ECBLocationReport]    Script Date: 14-06-2024 15:14:42 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_ECBLocationReport]
GO
/****** Object:  StoredProcedure [dbo].[USP_ECBEventsGetByHours]    Script Date: 14-06-2024 15:14:42 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_ECBEventsGetByHours]
GO
/****** Object:  StoredProcedure [dbo].[USP_ECBEventsGetByFilter]    Script Date: 14-06-2024 15:14:42 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_ECBEventsGetByFilter]
GO
/****** Object:  StoredProcedure [dbo].[USP_ECBEventReport]    Script Date: 14-06-2024 15:14:42 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_ECBEventReport]
GO
/****** Object:  StoredProcedure [dbo].[USP_ECBCallEventsInsert]    Script Date: 14-06-2024 15:14:42 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_ECBCallEventsInsert]
GO
/****** Object:  StoredProcedure [dbo].[USP_DashboardVSDSData]    Script Date: 14-06-2024 15:14:42 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_DashboardVSDSData]
GO
/****** Object:  StoredProcedure [dbo].[USP_DashboardVIDSData]    Script Date: 14-06-2024 15:14:42 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_DashboardVIDSData]
GO
/****** Object:  StoredProcedure [dbo].[USP_DashboardEquipmentDetailsGetAll]    Script Date: 14-06-2024 15:14:42 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_DashboardEquipmentDetailsGetAll]
GO
/****** Object:  StoredProcedure [dbo].[USP_DashboardATCCData]    Script Date: 14-06-2024 15:14:42 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_DashboardATCCData]
GO
/****** Object:  StoredProcedure [dbo].[USP_ControlRoomInsertUpdate]    Script Date: 14-06-2024 15:14:42 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_ControlRoomInsertUpdate]
GO
/****** Object:  StoredProcedure [dbo].[USP_ControlRoomGetById]    Script Date: 14-06-2024 15:14:42 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_ControlRoomGetById]
GO
/****** Object:  StoredProcedure [dbo].[USP_ControlRoomGetAll]    Script Date: 14-06-2024 15:14:42 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_ControlRoomGetAll]
GO
/****** Object:  StoredProcedure [dbo].[USP_ATCCSummeryReport]    Script Date: 14-06-2024 15:14:42 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_ATCCSummeryReport]
GO
/****** Object:  StoredProcedure [dbo].[USP_ATCCPositionReport]    Script Date: 14-06-2024 15:14:42 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_ATCCPositionReport]
GO
/****** Object:  StoredProcedure [dbo].[USP_ATCCPendingReviewEventsGetByHours]    Script Date: 14-06-2024 15:14:42 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_ATCCPendingReviewEventsGetByHours]
GO
/****** Object:  StoredProcedure [dbo].[USP_ATCCLocationReport]    Script Date: 14-06-2024 15:14:42 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_ATCCLocationReport]
GO
/****** Object:  StoredProcedure [dbo].[USP_ATCCEventsReviewedGetByHours]    Script Date: 14-06-2024 15:14:42 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_ATCCEventsReviewedGetByHours]
GO
/****** Object:  StoredProcedure [dbo].[USP_ATCCEventsReviewedGetByFilter]    Script Date: 14-06-2024 15:14:42 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_ATCCEventsReviewedGetByFilter]
GO
/****** Object:  StoredProcedure [dbo].[USP_ATCCEventsInsert]    Script Date: 14-06-2024 15:14:42 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_ATCCEventsInsert]
GO
/****** Object:  StoredProcedure [dbo].[USP_ATCCEventsGetByHours]    Script Date: 14-06-2024 15:14:42 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_ATCCEventsGetByHours]
GO
/****** Object:  StoredProcedure [dbo].[USP_ATCCEventsGetByFilter]    Script Date: 14-06-2024 15:14:42 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_ATCCEventsGetByFilter]
GO
/****** Object:  StoredProcedure [dbo].[USP_ATCCEventReviewUpdate]    Script Date: 14-06-2024 15:14:42 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_ATCCEventReviewUpdate]
GO
/****** Object:  StoredProcedure [dbo].[USP_ATCCClassReport]    Script Date: 14-06-2024 15:14:42 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_ATCCClassReport]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_WeatherEventHistory]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_WeatherEventHistory] DROP CONSTRAINT IF EXISTS [DF__tbl_Weath__DataS__0CFADF99]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_VSDSSectionSpeedHistory]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_VSDSSectionSpeedHistory] DROP CONSTRAINT IF EXISTS [DF__tbl_VSDSS__SendS__5C02A283]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_VSDSSectionSpeedHistory]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_VSDSSectionSpeedHistory] DROP CONSTRAINT IF EXISTS [DF__tbl_VSDSS__Creat__5B0E7E4A]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_VSDSEventsHistory]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_VSDSEventsHistory] DROP CONSTRAINT IF EXISTS [DF__tbl_VSDSE__Media__2DD1C37F]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_VSDSEventsHistory]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_VSDSEventsHistory] DROP CONSTRAINT IF EXISTS [DF__tbl_VSDSE__DataS__2CDD9F46]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_VSDSEventsHistory]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_VSDSEventsHistory] DROP CONSTRAINT IF EXISTS [DF__tbl_VSDSE__Creat__2BE97B0D]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_VSDSEventsHistory]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_VSDSEventsHistory] DROP CONSTRAINT IF EXISTS [DF__tbl_VSDSE__IsCha__2AF556D4]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_VSDSEventsHistory]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_VSDSEventsHistory] DROP CONSTRAINT IF EXISTS [DF__tbl_VSDSE__IsRev__2A01329B]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_VSDSEventsHistory]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_VSDSEventsHistory] DROP CONSTRAINT IF EXISTS [DF__tbl_VSDSE__IsRev__290D0E62]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_VSDSEventsHistory]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_VSDSEventsHistory] DROP CONSTRAINT IF EXISTS [DF__tbl_VSDSE__IsRev__2818EA29]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_VSDSEventsHistory]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_VSDSEventsHistory] DROP CONSTRAINT IF EXISTS [DF__tbl_VSDSE__IsRev__2724C5F0]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_VSDSEventsHistory]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_VSDSEventsHistory] DROP CONSTRAINT IF EXISTS [DF__tbl_VSDSE__Revie__2630A1B7]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_VSDSEventsHistory]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_VSDSEventsHistory] DROP CONSTRAINT IF EXISTS [DF__tbl_VSDSE__IsRev__1E8F7FEF]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_VSDSEventsHistory]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_VSDSEventsHistory] DROP CONSTRAINT IF EXISTS [DF__tbl_VSDSE__IsRev__253C7D7E]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_VSDSEventsHistory]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_VSDSEventsHistory] DROP CONSTRAINT IF EXISTS [DF__tbl_VSDSE__IsWro__24485945]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_VSDSEventsHistory]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_VSDSEventsHistory] DROP CONSTRAINT IF EXISTS [DF__tbl_VSDSE__IsSta__2354350C]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_VSDSEventsHistory]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_VSDSEventsHistory] DROP CONSTRAINT IF EXISTS [DF__tbl_VSDSE__IsFau__226010D3]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_VSDSEventsHistory]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_VSDSEventsHistory] DROP CONSTRAINT IF EXISTS [DF__tbl_VSDSE__IsPla__216BEC9A]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_VSDSEventsHistory]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_VSDSEventsHistory] DROP CONSTRAINT IF EXISTS [DF__tbl_VSDSE__Vehic__2077C861]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_VSDSEventsHistory]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_VSDSEventsHistory] DROP CONSTRAINT IF EXISTS [DF__tbl_VSDSE__Event__1F83A428]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_VMSMessageDetails]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_VMSMessageDetails] DROP CONSTRAINT IF EXISTS [DF__tbl_VMSMe__Media__2CA8951C]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_VMSMessageDetails]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_VMSMessageDetails] DROP CONSTRAINT IF EXISTS [DF__tbl_VMSMe__DataS__2BB470E3]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_VMSMessageDetails]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_VMSMessageDetails] DROP CONSTRAINT IF EXISTS [DF__tbl_VMSMe__Modif__2AC04CAA]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_VMSMessageDetails]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_VMSMessageDetails] DROP CONSTRAINT IF EXISTS [DF__tbl_VMSMe__Modif__29CC2871]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_VMSMessageDetails]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_VMSMessageDetails] DROP CONSTRAINT IF EXISTS [DF__tbl_VMSMe__Creat__28D80438]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_VMSMessageDetails]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_VMSMessageDetails] DROP CONSTRAINT IF EXISTS [DF__tbl_VMSMe__Creat__27E3DFFF]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_VMSMessageDetails]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_VMSMessageDetails] DROP CONSTRAINT IF EXISTS [DF__tbl_VMSMe__DataS__26EFBBC6]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_VMSMessageDetails]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_VMSMessageDetails] DROP CONSTRAINT IF EXISTS [DF__tbl_VMSMe__Displ__25FB978D]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_VIDSEventsHistory]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_VIDSEventsHistory] DROP CONSTRAINT IF EXISTS [DF__tbl_VIDSE__Media__2BD46C74]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_VIDSEventsHistory]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_VIDSEventsHistory] DROP CONSTRAINT IF EXISTS [DF__tbl_VIDSE__DataS__2AE0483B]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_VIDSEventsHistory]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_VIDSEventsHistory] DROP CONSTRAINT IF EXISTS [DF__tbl_VIDSE__Syste__29EC2402]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_VIDSEventsHistory]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_VIDSEventsHistory] DROP CONSTRAINT IF EXISTS [DF__tbl_VIDSE__Creat__28F7FFC9]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_VIDSEventsHistory]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_VIDSEventsHistory] DROP CONSTRAINT IF EXISTS [DF__tbl_VIDSE__Revie__2803DB90]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_VIDSEventsHistory]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_VIDSEventsHistory] DROP CONSTRAINT IF EXISTS [DF__tbl_VIDSE__Revie__270FB757]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_VIDSEventsHistory]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_VIDSEventsHistory] DROP CONSTRAINT IF EXISTS [DF__tbl_VIDSE__Revie__261B931E]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_VIDSEventsHistory]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_VIDSEventsHistory] DROP CONSTRAINT IF EXISTS [DF__tbl_VIDSE__Revie__25276EE5]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_VIDSEventsHistory]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_VIDSEventsHistory] DROP CONSTRAINT IF EXISTS [DF__tbl_VIDSE__Revie__24334AAC]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_VIDSEventsHistory]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_VIDSEventsHistory] DROP CONSTRAINT IF EXISTS [DF__tbl_VIDSE__IsRev__233F2673]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_VIDSEventsHistory]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_VIDSEventsHistory] DROP CONSTRAINT IF EXISTS [DF__tbl_VIDSE__Chall__224B023A]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_VIDSEventsHistory]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_VIDSEventsHistory] DROP CONSTRAINT IF EXISTS [DF__tbl_VIDSE__Chall__2156DE01]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_VIDSEventsHistory]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_VIDSEventsHistory] DROP CONSTRAINT IF EXISTS [DF__tbl_VIDSE__IsCha__2062B9C8]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_VIDSEventsHistory]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_VIDSEventsHistory] DROP CONSTRAINT IF EXISTS [DF__tbl_VIDSE__Incid__1F6E958F]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_VIDSEventsHistory]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_VIDSEventsHistory] DROP CONSTRAINT IF EXISTS [DF__tbl_VIDSE__Direc__1E7A7156]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_VehicleClass]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_VehicleClass] DROP CONSTRAINT IF EXISTS [DF__tbl_Vehic__Modif__57E7F8DC]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_VehicleClass]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_VehicleClass] DROP CONSTRAINT IF EXISTS [DF__tbl_Vehic__Modif__56F3D4A3]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_VehicleClass]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_VehicleClass] DROP CONSTRAINT IF EXISTS [DF__tbl_Vehic__Creat__55FFB06A]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_VehicleClass]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_VehicleClass] DROP CONSTRAINT IF EXISTS [DF__tbl_Vehic__Creat__550B8C31]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_VehicleClass]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_VehicleClass] DROP CONSTRAINT IF EXISTS [DF__tbl_Vehic__DataS__541767F8]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_VehicleClass]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_VehicleClass] DROP CONSTRAINT IF EXISTS [DF__tbl_Vehic__Allow__532343BF]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_UserMaster]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_UserMaster] DROP CONSTRAINT IF EXISTS [DF__tbl_UserM__Modif__33008CF0]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_UserMaster]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_UserMaster] DROP CONSTRAINT IF EXISTS [DF__tbl_UserM__Modif__320C68B7]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_UserMaster]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_UserMaster] DROP CONSTRAINT IF EXISTS [DF__tbl_UserM__Creat__3118447E]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_UserMaster]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_UserMaster] DROP CONSTRAINT IF EXISTS [DF__tbl_UserM__Creat__30242045]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_UserMaster]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_UserMaster] DROP CONSTRAINT IF EXISTS [DF__tbl_UserM__DataS__2F2FFC0C]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_SystemSetting]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_SystemSetting] DROP CONSTRAINT IF EXISTS [DF__tbl_Syste__Modif__2DF1BF10]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_SystemSetting]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_SystemSetting] DROP CONSTRAINT IF EXISTS [DF__tbl_Syste__Modif__2CFD9AD7]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_SystemSetting]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_SystemSetting] DROP CONSTRAINT IF EXISTS [DF__tbl_Syste__Creat__2C09769E]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_SystemSetting]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_SystemSetting] DROP CONSTRAINT IF EXISTS [DF__tbl_Syste__Creat__2B155265]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_SystemSetting]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_SystemSetting] DROP CONSTRAINT IF EXISTS [DF__tbl_Syste__DataS__2A212E2C]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_SystemSetting]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_SystemSetting] DROP CONSTRAINT IF EXISTS [DF__tbl_Syste__Weath__2838E5BA]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_SystemSetting]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_SystemSetting] DROP CONSTRAINT IF EXISTS [DF__tbl_Syste__IsWea__292D09F3]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_SystemMaster]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_SystemMaster] DROP CONSTRAINT IF EXISTS [DF__tbl_Syste__Modif__297722B6]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_SystemMaster]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_SystemMaster] DROP CONSTRAINT IF EXISTS [DF__tbl_Syste__Modif__2882FE7D]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_SystemMaster]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_SystemMaster] DROP CONSTRAINT IF EXISTS [DF__tbl_Syste__Creat__278EDA44]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_SystemMaster]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_SystemMaster] DROP CONSTRAINT IF EXISTS [DF__tbl_Syste__Creat__269AB60B]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_SystemMaster]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_SystemMaster] DROP CONSTRAINT IF EXISTS [DF__tbl_Syste__DataS__25A691D2]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_SystemMaster]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_SystemMaster] DROP CONSTRAINT IF EXISTS [DF__tbl_Syste__DashB__24B26D99]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_RolePermission]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_RolePermission] DROP CONSTRAINT IF EXISTS [DF__tbl_RoleP__Modif__23BE4960]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_RolePermission]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_RolePermission] DROP CONSTRAINT IF EXISTS [DF__tbl_RoleP__Modif__22CA2527]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_RolePermission]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_RolePermission] DROP CONSTRAINT IF EXISTS [DF__tbl_RoleP__Creat__21D600EE]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_RolePermission]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_RolePermission] DROP CONSTRAINT IF EXISTS [DF__tbl_RoleP__Creat__20E1DCB5]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_RolePermission]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_RolePermission] DROP CONSTRAINT IF EXISTS [DF__tbl_RoleP__DataS__1FEDB87C]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_RolePermission]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_RolePermission] DROP CONSTRAINT IF EXISTS [DF__tbl_RoleP__DataU__1EF99443]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_RolePermission]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_RolePermission] DROP CONSTRAINT IF EXISTS [DF__tbl_RoleP__DataA__1E05700A]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_RolePermission]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_RolePermission] DROP CONSTRAINT IF EXISTS [DF__tbl_RoleP__DataV__1D114BD1]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_RoleMaster]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_RoleMaster] DROP CONSTRAINT IF EXISTS [DF__tbl_RoleM__Modif__1C1D2798]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_RoleMaster]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_RoleMaster] DROP CONSTRAINT IF EXISTS [DF__tbl_RoleM__Modif__1B29035F]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_RoleMaster]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_RoleMaster] DROP CONSTRAINT IF EXISTS [DF__tbl_RoleM__Creat__1A34DF26]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_RoleMaster]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_RoleMaster] DROP CONSTRAINT IF EXISTS [DF__tbl_RoleM__Creat__1940BAED]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_RoleMaster]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_RoleMaster] DROP CONSTRAINT IF EXISTS [DF__tbl_RoleM__DataS__184C96B4]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_ReportMasterBKP]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_ReportMasterBKP] DROP CONSTRAINT IF EXISTS [DF__tbl_Repor__Modif__1758727B]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_ReportMasterBKP]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_ReportMasterBKP] DROP CONSTRAINT IF EXISTS [DF__tbl_Repor__Modif__16644E42]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_ReportMasterBKP]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_ReportMasterBKP] DROP CONSTRAINT IF EXISTS [DF__tbl_Repor__Creat__15702A09]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_ReportMasterBKP]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_ReportMasterBKP] DROP CONSTRAINT IF EXISTS [DF__tbl_Repor__Creat__147C05D0]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_ReportMasterBKP]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_ReportMasterBKP] DROP CONSTRAINT IF EXISTS [DF__tbl_Repor__DataS__1387E197]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_ReportMasterBKP]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_ReportMasterBKP] DROP CONSTRAINT IF EXISTS [DF__tbl_Repor__Order__1293BD5E]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_ReportMasterBKP]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_ReportMasterBKP] DROP CONSTRAINT IF EXISTS [DF__tbl_Repor__Paren__119F9925]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_ReportMaster]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_ReportMaster] DROP CONSTRAINT IF EXISTS [DF__tbl_Repor__Modif__4F52B2DB]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_ReportMaster]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_ReportMaster] DROP CONSTRAINT IF EXISTS [DF__tbl_Repor__Modif__4E5E8EA2]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_ReportMaster]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_ReportMaster] DROP CONSTRAINT IF EXISTS [DF__tbl_Repor__Creat__4D6A6A69]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_ReportMaster]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_ReportMaster] DROP CONSTRAINT IF EXISTS [DF__tbl_Repor__Creat__4C764630]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_ReportMaster]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_ReportMaster] DROP CONSTRAINT IF EXISTS [DF__tbl_Repor__DataS__4B8221F7]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_ReportMaster]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_ReportMaster] DROP CONSTRAINT IF EXISTS [DF__tbl_Repor__Order__4A8DFDBE]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_ReportMaster]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_ReportMaster] DROP CONSTRAINT IF EXISTS [DF__tbl_Repor__Paren__4999D985]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_PackageDetails]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_PackageDetails] DROP CONSTRAINT IF EXISTS [DF__tbl_Packa__Modif__4E3E9311]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_PackageDetails]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_PackageDetails] DROP CONSTRAINT IF EXISTS [DF__tbl_Packa__Modif__4D4A6ED8]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_PackageDetails]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_PackageDetails] DROP CONSTRAINT IF EXISTS [DF__tbl_Packa__Creat__4C564A9F]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_PackageDetails]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_PackageDetails] DROP CONSTRAINT IF EXISTS [DF__tbl_Packa__Creat__4B622666]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_PackageDetails]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_PackageDetails] DROP CONSTRAINT IF EXISTS [DF__tbl_Packa__DataS__4A6E022D]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_MenuMaster]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_MenuMaster] DROP CONSTRAINT IF EXISTS [DF__tbl_MenuM__Modif__7246E95D]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_MenuMaster]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_MenuMaster] DROP CONSTRAINT IF EXISTS [DF__tbl_MenuM__Modif__7152C524]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_MenuMaster]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_MenuMaster] DROP CONSTRAINT IF EXISTS [DF__tbl_MenuM__Creat__705EA0EB]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_MenuMaster]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_MenuMaster] DROP CONSTRAINT IF EXISTS [DF__tbl_MenuM__Creat__6F6A7CB2]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_MenuMaster]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_MenuMaster] DROP CONSTRAINT IF EXISTS [DF__tbl_MenuM__DataS__6E765879]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_LogingActivity]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_LogingActivity] DROP CONSTRAINT IF EXISTS [DF__tbl_Login__Creat__025D5595]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_LogingActivity]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_LogingActivity] DROP CONSTRAINT IF EXISTS [DF__tbl_Login__Login__0169315C]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_LaneConfig]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_LaneConfig] DROP CONSTRAINT IF EXISTS [DF__tbl_VSDSL__Modif__3C54ED00]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_LaneConfig]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_LaneConfig] DROP CONSTRAINT IF EXISTS [DF__tbl_VSDSL__Modif__3B60C8C7]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_LaneConfig]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_LaneConfig] DROP CONSTRAINT IF EXISTS [DF__tbl_VSDSL__Creat__3A6CA48E]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_LaneConfig]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_LaneConfig] DROP CONSTRAINT IF EXISTS [DF__tbl_VSDSL__Creat__39788055]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_LaneConfig]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_LaneConfig] DROP CONSTRAINT IF EXISTS [DF__tbl_VSDSL__DataS__38845C1C]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_LaneConfig]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_LaneConfig] DROP CONSTRAINT IF EXISTS [DF__tbl_VSDSL__Allow__379037E3]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_IncidentSubCategory]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_IncidentSubCategory] DROP CONSTRAINT IF EXISTS [DF__tbl_Incid__Modif__00750D23]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_IncidentSubCategory]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_IncidentSubCategory] DROP CONSTRAINT IF EXISTS [DF__tbl_Incid__Modif__7F80E8EA]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_IncidentSubCategory]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_IncidentSubCategory] DROP CONSTRAINT IF EXISTS [DF__tbl_Incid__Creat__7E8CC4B1]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_IncidentSubCategory]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_IncidentSubCategory] DROP CONSTRAINT IF EXISTS [DF__tbl_Incid__Creat__7D98A078]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_IncidentSubCategory]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_IncidentSubCategory] DROP CONSTRAINT IF EXISTS [DF__tbl_Incid__DataS__7CA47C3F]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_IncidentStatusMaster]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_IncidentStatusMaster] DROP CONSTRAINT IF EXISTS [DF__tbl_Incid__Modif__7BB05806]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_IncidentStatusMaster]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_IncidentStatusMaster] DROP CONSTRAINT IF EXISTS [DF__tbl_Incid__Modif__7ABC33CD]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_IncidentStatusMaster]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_IncidentStatusMaster] DROP CONSTRAINT IF EXISTS [DF__tbl_Incid__Creat__79C80F94]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_IncidentStatusMaster]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_IncidentStatusMaster] DROP CONSTRAINT IF EXISTS [DF__tbl_Incid__Creat__78D3EB5B]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_IncidentStatusMaster]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_IncidentStatusMaster] DROP CONSTRAINT IF EXISTS [DF__tbl_Incid__DataS__77DFC722]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_IncidentStatusMaster]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_IncidentStatusMaster] DROP CONSTRAINT IF EXISTS [DF__tbl_Incid__Proce__76EBA2E9]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_IncidentSourceMaster]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_IncidentSourceMaster] DROP CONSTRAINT IF EXISTS [DF__tbl_Incid__Modif__75F77EB0]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_IncidentSourceMaster]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_IncidentSourceMaster] DROP CONSTRAINT IF EXISTS [DF__tbl_Incid__Modif__75035A77]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_IncidentSourceMaster]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_IncidentSourceMaster] DROP CONSTRAINT IF EXISTS [DF__tbl_Incid__Creat__740F363E]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_IncidentSourceMaster]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_IncidentSourceMaster] DROP CONSTRAINT IF EXISTS [DF__tbl_Incid__Creat__731B1205]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_IncidentDetailsHistory]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_IncidentDetailsHistory] DROP CONSTRAINT IF EXISTS [DF__tbl_Incid__Media__7226EDCC]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_IncidentDetailsHistory]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_IncidentDetailsHistory] DROP CONSTRAINT IF EXISTS [DF__tbl_Incid__DataS__7132C993]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_IncidentDetailsHistory]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_IncidentDetailsHistory] DROP CONSTRAINT IF EXISTS [DF__tbl_Incid__Modif__703EA55A]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_IncidentDetailsHistory]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_IncidentDetailsHistory] DROP CONSTRAINT IF EXISTS [DF__tbl_Incid__Modif__6F4A8121]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_IncidentDetailsHistory]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_IncidentDetailsHistory] DROP CONSTRAINT IF EXISTS [DF__tbl_Incid__Creat__6E565CE8]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_IncidentDetailsHistory]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_IncidentDetailsHistory] DROP CONSTRAINT IF EXISTS [DF__tbl_Incid__Creat__6D6238AF]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_IncidentCheckListMaster]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_IncidentCheckListMaster] DROP CONSTRAINT IF EXISTS [DF__tbl_Incid__Modif__6C6E1476]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_IncidentCheckListMaster]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_IncidentCheckListMaster] DROP CONSTRAINT IF EXISTS [DF__tbl_Incid__Modif__6B79F03D]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_IncidentCheckListMaster]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_IncidentCheckListMaster] DROP CONSTRAINT IF EXISTS [DF__tbl_Incid__Creat__6A85CC04]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_IncidentCheckListMaster]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_IncidentCheckListMaster] DROP CONSTRAINT IF EXISTS [DF__tbl_Incid__Creat__6991A7CB]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_IncidentCheckListMaster]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_IncidentCheckListMaster] DROP CONSTRAINT IF EXISTS [DF__tbl_Incid__DataS__689D8392]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_IncidentCheckListMaster]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_IncidentCheckListMaster] DROP CONSTRAINT IF EXISTS [DF__tbl_Incid__IsAut__67A95F59]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_IncidentCheckListMaster]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_IncidentCheckListMaster] DROP CONSTRAINT IF EXISTS [DF__tbl_Incid__Categ__66B53B20]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_IncidentCheckList]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_IncidentCheckList] DROP CONSTRAINT IF EXISTS [DF__tbl_Incid__Modif__65C116E7]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_IncidentCheckList]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_IncidentCheckList] DROP CONSTRAINT IF EXISTS [DF__tbl_Incid__Modif__64CCF2AE]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_IncidentCheckList]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_IncidentCheckList] DROP CONSTRAINT IF EXISTS [DF__tbl_Incid__Creat__63D8CE75]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_IncidentCheckList]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_IncidentCheckList] DROP CONSTRAINT IF EXISTS [DF__tbl_Incid__Creat__62E4AA3C]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_IncidentCheckList]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_IncidentCheckList] DROP CONSTRAINT IF EXISTS [DF__tbl_Incid__DataS__61F08603]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_IncidentCheckList]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_IncidentCheckList] DROP CONSTRAINT IF EXISTS [DF__tbl_Incid__IsAut__60FC61CA]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_IncidentCategoryMaster]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_IncidentCategoryMaster] DROP CONSTRAINT IF EXISTS [DF__tbl_Incid__Modif__60083D91]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_IncidentCategoryMaster]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_IncidentCategoryMaster] DROP CONSTRAINT IF EXISTS [DF__tbl_Incid__Modif__5F141958]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_IncidentCategoryMaster]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_IncidentCategoryMaster] DROP CONSTRAINT IF EXISTS [DF__tbl_Incid__Creat__5E1FF51F]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_IncidentCategoryMaster]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_IncidentCategoryMaster] DROP CONSTRAINT IF EXISTS [DF__tbl_Incid__Creat__5D2BD0E6]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_IncidentCategoryMaster]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_IncidentCategoryMaster] DROP CONSTRAINT IF EXISTS [DF__tbl_Incid__DataS__5C37ACAD]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_IncidentCategoryMaster]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_IncidentCategoryMaster] DROP CONSTRAINT IF EXISTS [DF__tbl_Incid__Order__5B438874]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_IncidentActionHistory]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_IncidentActionHistory] DROP CONSTRAINT IF EXISTS [DF__tbl_Incid__Media__5A4F643B]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_IncidentActionHistory]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_IncidentActionHistory] DROP CONSTRAINT IF EXISTS [DF__tbl_Incid__DataS__595B4002]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_EventsTypeMaster]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_EventsTypeMaster] DROP CONSTRAINT IF EXISTS [DF__tbl_Event__Modif__05AEC38C]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_EventsTypeMaster]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_EventsTypeMaster] DROP CONSTRAINT IF EXISTS [DF__tbl_Event__Modif__04BA9F53]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_EventsTypeMaster]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_EventsTypeMaster] DROP CONSTRAINT IF EXISTS [DF__tbl_Event__Creat__03C67B1A]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_EventsTypeMaster]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_EventsTypeMaster] DROP CONSTRAINT IF EXISTS [DF__tbl_Event__Creat__02D256E1]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_EventsTypeMaster]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_EventsTypeMaster] DROP CONSTRAINT IF EXISTS [DF__tbl_Event__DataS__01DE32A8]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_EventsTypeMaster]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_EventsTypeMaster] DROP CONSTRAINT IF EXISTS [DF__tbl_Event__Syste__00EA0E6F]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_EventsTypeMaster]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_EventsTypeMaster] DROP CONSTRAINT IF EXISTS [DF__tbl_Event__Maxim__7FF5EA36]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_EventsTypeMaster]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_EventsTypeMaster] DROP CONSTRAINT IF EXISTS [DF__tbl_Event__Minim__7F01C5FD]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_EventsTypeMaster]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_EventsTypeMaster] DROP CONSTRAINT IF EXISTS [DF__tbl_Event__Chall__7E0DA1C4]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_EventsTypeMaster]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_EventsTypeMaster] DROP CONSTRAINT IF EXISTS [DF__tbl_Event__Revie__7D197D8B]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_EventsTypeMaster]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_EventsTypeMaster] DROP CONSTRAINT IF EXISTS [DF__tbl_Event__Event__7C255952]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_ErrorInfo]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_ErrorInfo] DROP CONSTRAINT IF EXISTS [DF__tbl_Error__Creat__4FD1D5C8]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_ErrorInfo]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_ErrorInfo] DROP CONSTRAINT IF EXISTS [DF__tbl_Error__Error__4EDDB18F]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_ErrorInfo]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_ErrorInfo] DROP CONSTRAINT IF EXISTS [DF__tbl_Error__Error__4DE98D56]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_ErrorInfo]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_ErrorInfo] DROP CONSTRAINT IF EXISTS [DF__tbl_Error__Error__4CF5691D]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_ErrorInfo]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_ErrorInfo] DROP CONSTRAINT IF EXISTS [DF__tbl_Error__Error__4C0144E4]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_ErrorInfo]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_ErrorInfo] DROP CONSTRAINT IF EXISTS [DF__tbl_Error__Error__4B0D20AB]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_ErrorInfo]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_ErrorInfo] DROP CONSTRAINT IF EXISTS [DF__tbl_Error__Error__4A18FC72]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_EquipmentTypeMaster]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_EquipmentTypeMaster] DROP CONSTRAINT IF EXISTS [DF__tbl_Equip__Modif__7B313519]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_EquipmentTypeMaster]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_EquipmentTypeMaster] DROP CONSTRAINT IF EXISTS [DF__tbl_Equip__Modif__7A3D10E0]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_EquipmentTypeMaster]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_EquipmentTypeMaster] DROP CONSTRAINT IF EXISTS [DF__tbl_Equip__Creat__7948ECA7]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_EquipmentTypeMaster]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_EquipmentTypeMaster] DROP CONSTRAINT IF EXISTS [DF__tbl_Equip__Creat__7854C86E]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_EquipmentTypeMaster]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_EquipmentTypeMaster] DROP CONSTRAINT IF EXISTS [DF__tbl_Equip__DataS__7760A435]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_EquipmentTypeMaster]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_EquipmentTypeMaster] DROP CONSTRAINT IF EXISTS [DF__tbl_Equip__Equip__766C7FFC]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_EquipmentPositionTypeMaster]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_EquipmentPositionTypeMaster] DROP CONSTRAINT IF EXISTS [DF__tbl_Equip__Modif__691284DE]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_EquipmentPositionTypeMaster]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_EquipmentPositionTypeMaster] DROP CONSTRAINT IF EXISTS [DF__tbl_Equip__Modif__681E60A5]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_EquipmentPositionTypeMaster]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_EquipmentPositionTypeMaster] DROP CONSTRAINT IF EXISTS [DF__tbl_Equip__Creat__672A3C6C]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_EquipmentPositionTypeMaster]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_EquipmentPositionTypeMaster] DROP CONSTRAINT IF EXISTS [DF__tbl_Equip__Creat__66361833]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_EquipmentPositionTypeMaster]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_EquipmentPositionTypeMaster] DROP CONSTRAINT IF EXISTS [DF__tbl_Equip__DataS__6541F3FA]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_EquipmentDetails]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_EquipmentDetails] DROP CONSTRAINT IF EXISTS [DF__tbl_Equip__Modif__3592E0D8]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_EquipmentDetails]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_EquipmentDetails] DROP CONSTRAINT IF EXISTS [DF__tbl_Equip__Modif__349EBC9F]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_EquipmentDetails]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_EquipmentDetails] DROP CONSTRAINT IF EXISTS [DF__tbl_Equip__Creat__33AA9866]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_EquipmentDetails]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_EquipmentDetails] DROP CONSTRAINT IF EXISTS [DF__tbl_Equip__Creat__32B6742D]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_EquipmentDetails]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_EquipmentDetails] DROP CONSTRAINT IF EXISTS [DF__tbl_Equip__DataS__31C24FF4]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_EquipmentDetails]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_EquipmentDetails] DROP CONSTRAINT IF EXISTS [DF__tbl_Equip__OnLin__30CE2BBB]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_EquipmentConfig]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_EquipmentConfig] DROP CONSTRAINT IF EXISTS [DF__tbl_Equip__Modif__0307610B]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_EquipmentConfig]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_EquipmentConfig] DROP CONSTRAINT IF EXISTS [DF__tbl_Equip__Modif__02133CD2]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_EquipmentConfig]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_EquipmentConfig] DROP CONSTRAINT IF EXISTS [DF__tbl_Equip__Creat__011F1899]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_EquipmentConfig]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_EquipmentConfig] DROP CONSTRAINT IF EXISTS [DF__tbl_Equip__Creat__002AF460]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_EquipmentConfig]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_EquipmentConfig] DROP CONSTRAINT IF EXISTS [DF__tbl_Equip__DataS__7F36D027]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_EquipmentConfig]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_EquipmentConfig] DROP CONSTRAINT IF EXISTS [DF__tbl_Equip__Order__7E42ABEE]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_EquipmentConfig]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_EquipmentConfig] DROP CONSTRAINT IF EXISTS [DF__tbl_Equip__Exten__7A721B0A]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_EquipmentConfig]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_EquipmentConfig] DROP CONSTRAINT IF EXISTS [DF__tbl_Equip__LaneN__7D4E87B5]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_EquipmentConfig]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_EquipmentConfig] DROP CONSTRAINT IF EXISTS [DF__tbl_Equip__Posit__7C5A637C]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_EquipmentConfig]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_EquipmentConfig] DROP CONSTRAINT IF EXISTS [DF__tbl_Equip__Paren__7B663F43]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_ECBCallEventsHistory]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_ECBCallEventsHistory] DROP CONSTRAINT IF EXISTS [DF__tbl_ECBCa__Media__16D94F8E]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_ECBCallEventsHistory]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_ECBCallEventsHistory] DROP CONSTRAINT IF EXISTS [DF__tbl_ECBCa__DataS__15E52B55]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_ECBCallEventsHistory]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_ECBCallEventsHistory] DROP CONSTRAINT IF EXISTS [DF__tbl_ECBCa__Creat__14F1071C]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_ECBCallEventsHistory]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_ECBCallEventsHistory] DROP CONSTRAINT IF EXISTS [DF__tbl_ECBCa__Opera__13FCE2E3]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_ControlRoomMaster]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_ControlRoomMaster] DROP CONSTRAINT IF EXISTS [DF__tbl_Contr__Modif__4885B9BB]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_ControlRoomMaster]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_ControlRoomMaster] DROP CONSTRAINT IF EXISTS [DF__tbl_Contr__Modif__47919582]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_ControlRoomMaster]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_ControlRoomMaster] DROP CONSTRAINT IF EXISTS [DF__tbl_Contr__Creat__469D7149]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_ControlRoomMaster]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_ControlRoomMaster] DROP CONSTRAINT IF EXISTS [DF__tbl_Contr__Creat__45A94D10]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_ControlRoomMaster]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_ControlRoomMaster] DROP CONSTRAINT IF EXISTS [DF__tbl_Contr__DataS__44B528D7]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_ATCCEventsHistory]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_ATCCEventsHistory] DROP CONSTRAINT IF EXISTS [DF__tbl_ATCCE__Media__09E968C4]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_ATCCEventsHistory]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_ATCCEventsHistory] DROP CONSTRAINT IF EXISTS [DF__tbl_ATCCE__DataS__08F5448B]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_ATCCEventsHistory]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_ATCCEventsHistory] DROP CONSTRAINT IF EXISTS [DF__tbl_ATCCE__Creat__08012052]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_ATCCEventsHistory]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_ATCCEventsHistory] DROP CONSTRAINT IF EXISTS [DF__tbl_ATCCE__IsRev__070CFC19]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_ATCCEventsHistory]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_ATCCEventsHistory] DROP CONSTRAINT IF EXISTS [DF__tbl_ATCCE__IsWro__0618D7E0]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_ATCCEventsHistory]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_ATCCEventsHistory] DROP CONSTRAINT IF EXISTS [DF__tbl_ATCCE__Vehic__0524B3A7]
GO
/****** Object:  Table [dbo].[temp_SystemMaster]    Script Date: 14-06-2024 15:14:42 ******/
DROP TABLE IF EXISTS [dbo].[temp_SystemMaster]
GO
/****** Object:  Table [dbo].[temp_LaneConfig]    Script Date: 14-06-2024 15:14:42 ******/
DROP TABLE IF EXISTS [dbo].[temp_LaneConfig]
GO
/****** Object:  Table [dbo].[temp_ImportPermission]    Script Date: 14-06-2024 15:14:42 ******/
DROP TABLE IF EXISTS [dbo].[temp_ImportPermission]
GO
/****** Object:  Table [dbo].[temp_EventsTypeMaster]    Script Date: 14-06-2024 15:14:42 ******/
DROP TABLE IF EXISTS [dbo].[temp_EventsTypeMaster]
GO
/****** Object:  Table [dbo].[temp_EquipmentConfig]    Script Date: 14-06-2024 15:14:42 ******/
DROP TABLE IF EXISTS [dbo].[temp_EquipmentConfig]
GO
/****** Object:  Table [dbo].[tbl_WeatherOpenAPI]    Script Date: 14-06-2024 15:14:42 ******/
DROP TABLE IF EXISTS [dbo].[tbl_WeatherOpenAPI]
GO
/****** Object:  Table [dbo].[tbl_WeatherEventHistory]    Script Date: 14-06-2024 15:14:42 ******/
DROP TABLE IF EXISTS [dbo].[tbl_WeatherEventHistory]
GO
/****** Object:  Table [dbo].[tbl_VSDSSectionSpeedHistory]    Script Date: 14-06-2024 15:14:42 ******/
DROP TABLE IF EXISTS [dbo].[tbl_VSDSSectionSpeedHistory]
GO
/****** Object:  Table [dbo].[tbl_VSDSEventsHistory]    Script Date: 14-06-2024 15:14:42 ******/
DROP TABLE IF EXISTS [dbo].[tbl_VSDSEventsHistory]
GO
/****** Object:  Table [dbo].[tbl_VMSMessageHistory]    Script Date: 14-06-2024 15:14:42 ******/
DROP TABLE IF EXISTS [dbo].[tbl_VMSMessageHistory]
GO
/****** Object:  Table [dbo].[tbl_VMSMessageDetails]    Script Date: 14-06-2024 15:14:42 ******/
DROP TABLE IF EXISTS [dbo].[tbl_VMSMessageDetails]
GO
/****** Object:  Table [dbo].[tbl_VIDSEventsHistory]    Script Date: 14-06-2024 15:14:42 ******/
DROP TABLE IF EXISTS [dbo].[tbl_VIDSEventsHistory]
GO
/****** Object:  Table [dbo].[tbl_VehicleClass]    Script Date: 14-06-2024 15:14:42 ******/
DROP TABLE IF EXISTS [dbo].[tbl_VehicleClass]
GO
/****** Object:  Table [dbo].[tbl_UserMaster]    Script Date: 14-06-2024 15:14:42 ******/
DROP TABLE IF EXISTS [dbo].[tbl_UserMaster]
GO
/****** Object:  Table [dbo].[tbl_SystemSetting]    Script Date: 14-06-2024 15:14:42 ******/
DROP TABLE IF EXISTS [dbo].[tbl_SystemSetting]
GO
/****** Object:  Table [dbo].[tbl_SystemMaster]    Script Date: 14-06-2024 15:14:42 ******/
DROP TABLE IF EXISTS [dbo].[tbl_SystemMaster]
GO
/****** Object:  Table [dbo].[tbl_RolePermission]    Script Date: 14-06-2024 15:14:42 ******/
DROP TABLE IF EXISTS [dbo].[tbl_RolePermission]
GO
/****** Object:  Table [dbo].[tbl_RoleMaster]    Script Date: 14-06-2024 15:14:42 ******/
DROP TABLE IF EXISTS [dbo].[tbl_RoleMaster]
GO
/****** Object:  Table [dbo].[tbl_ReportMasterBKP]    Script Date: 14-06-2024 15:14:42 ******/
DROP TABLE IF EXISTS [dbo].[tbl_ReportMasterBKP]
GO
/****** Object:  Table [dbo].[tbl_ReportMaster]    Script Date: 14-06-2024 15:14:42 ******/
DROP TABLE IF EXISTS [dbo].[tbl_ReportMaster]
GO
/****** Object:  Table [dbo].[tbl_PackageDetails]    Script Date: 14-06-2024 15:14:42 ******/
DROP TABLE IF EXISTS [dbo].[tbl_PackageDetails]
GO
/****** Object:  Table [dbo].[tbl_MenuMaster]    Script Date: 14-06-2024 15:14:42 ******/
DROP TABLE IF EXISTS [dbo].[tbl_MenuMaster]
GO
/****** Object:  Table [dbo].[tbl_LogingActivity]    Script Date: 14-06-2024 15:14:42 ******/
DROP TABLE IF EXISTS [dbo].[tbl_LogingActivity]
GO
/****** Object:  Table [dbo].[tbl_LaneConfig]    Script Date: 14-06-2024 15:14:42 ******/
DROP TABLE IF EXISTS [dbo].[tbl_LaneConfig]
GO
/****** Object:  Table [dbo].[tbl_IncidentSubCategory]    Script Date: 14-06-2024 15:14:42 ******/
DROP TABLE IF EXISTS [dbo].[tbl_IncidentSubCategory]
GO
/****** Object:  Table [dbo].[tbl_IncidentStatusMaster]    Script Date: 14-06-2024 15:14:42 ******/
DROP TABLE IF EXISTS [dbo].[tbl_IncidentStatusMaster]
GO
/****** Object:  Table [dbo].[tbl_IncidentSourceMaster]    Script Date: 14-06-2024 15:14:42 ******/
DROP TABLE IF EXISTS [dbo].[tbl_IncidentSourceMaster]
GO
/****** Object:  Table [dbo].[tbl_IncidentDetailsHistory]    Script Date: 14-06-2024 15:14:42 ******/
DROP TABLE IF EXISTS [dbo].[tbl_IncidentDetailsHistory]
GO
/****** Object:  Table [dbo].[tbl_IncidentCheckListMaster]    Script Date: 14-06-2024 15:14:42 ******/
DROP TABLE IF EXISTS [dbo].[tbl_IncidentCheckListMaster]
GO
/****** Object:  Table [dbo].[tbl_IncidentCheckList]    Script Date: 14-06-2024 15:14:42 ******/
DROP TABLE IF EXISTS [dbo].[tbl_IncidentCheckList]
GO
/****** Object:  Table [dbo].[tbl_IncidentCategoryMaster]    Script Date: 14-06-2024 15:14:42 ******/
DROP TABLE IF EXISTS [dbo].[tbl_IncidentCategoryMaster]
GO
/****** Object:  Table [dbo].[tbl_IncidentActionHistory]    Script Date: 14-06-2024 15:14:42 ******/
DROP TABLE IF EXISTS [dbo].[tbl_IncidentActionHistory]
GO
/****** Object:  Table [dbo].[tbl_EventsTypeMaster]    Script Date: 14-06-2024 15:14:42 ******/
DROP TABLE IF EXISTS [dbo].[tbl_EventsTypeMaster]
GO
/****** Object:  Table [dbo].[tbl_ErrorInfo]    Script Date: 14-06-2024 15:14:42 ******/
DROP TABLE IF EXISTS [dbo].[tbl_ErrorInfo]
GO
/****** Object:  Table [dbo].[tbl_EquipmentTypeMaster]    Script Date: 14-06-2024 15:14:42 ******/
DROP TABLE IF EXISTS [dbo].[tbl_EquipmentTypeMaster]
GO
/****** Object:  Table [dbo].[tbl_EquipmentPositionTypeMaster]    Script Date: 14-06-2024 15:14:42 ******/
DROP TABLE IF EXISTS [dbo].[tbl_EquipmentPositionTypeMaster]
GO
/****** Object:  Table [dbo].[tbl_EquipmentDetails]    Script Date: 14-06-2024 15:14:42 ******/
DROP TABLE IF EXISTS [dbo].[tbl_EquipmentDetails]
GO
/****** Object:  Table [dbo].[tbl_EquipmentConfig]    Script Date: 14-06-2024 15:14:42 ******/
DROP TABLE IF EXISTS [dbo].[tbl_EquipmentConfig]
GO
/****** Object:  Table [dbo].[tbl_ECBCallEventsHistory]    Script Date: 14-06-2024 15:14:42 ******/
DROP TABLE IF EXISTS [dbo].[tbl_ECBCallEventsHistory]
GO
/****** Object:  Table [dbo].[tbl_ControlRoomMaster]    Script Date: 14-06-2024 15:14:42 ******/
DROP TABLE IF EXISTS [dbo].[tbl_ControlRoomMaster]
GO
/****** Object:  Table [dbo].[tbl_ATCCEventsHistory]    Script Date: 14-06-2024 15:14:42 ******/
DROP TABLE IF EXISTS [dbo].[tbl_ATCCEventsHistory]
GO
/****** Object:  Table [dbo].[tbl_ActivityLog]    Script Date: 14-06-2024 15:14:42 ******/
DROP TABLE IF EXISTS [dbo].[tbl_ActivityLog]
GO
/****** Object:  UserDefinedFunction [dbo].[SplitString]    Script Date: 14-06-2024 15:14:42 ******/
DROP FUNCTION IF EXISTS [dbo].[SplitString]
GO
/****** Object:  UserDefinedFunction [dbo].[GetDateDiffInHRMMSS]    Script Date: 14-06-2024 15:14:42 ******/
DROP FUNCTION IF EXISTS [dbo].[GetDateDiffInHRMMSS]
GO
/****** Object:  UserDefinedFunction [dbo].[fnc_ValueSplit]    Script Date: 14-06-2024 15:14:42 ******/
DROP FUNCTION IF EXISTS [dbo].[fnc_ValueSplit]
GO
/****** Object:  UserDefinedFunction [dbo].[fnc_Get24HourList]    Script Date: 14-06-2024 15:14:42 ******/
DROP FUNCTION IF EXISTS [dbo].[fnc_Get24HourList]
GO
/****** Object:  UserDefinedFunction [dbo].[fnc_Get24HourDate]    Script Date: 14-06-2024 15:14:42 ******/
DROP FUNCTION IF EXISTS [dbo].[fnc_Get24HourDate]
GO
/****** Object:  UserDefinedFunction [dbo].[fnc_CommaSeparated]    Script Date: 14-06-2024 15:14:42 ******/
DROP FUNCTION IF EXISTS [dbo].[fnc_CommaSeparated]
GO
/****** Object:  UserDefinedFunction [dbo].[fnc_CommaSeparated]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnc_CommaSeparated]
(
	-- Add the parameters for the function here
	@List	varchar(8000)
)
RETURNS 
@TempList TABLE
	(
		Id  int identity(1,1),
		DataValue varchar(1000)
	)
AS
BEGIN
	-- Fill the table variable with the rows for your result set
	DECLARE @ID varchar(50), @Pos Varchar(50)

	SET @List = LTRIM(RTRIM(@List))+ ','
	SET @Pos = CHARINDEX(',', @List, 1)

	IF REPLACE(@List, ',', '') <> ''
	BEGIN
		WHILE @Pos > 0
		BEGIN
			SET @ID = LTRIM(RTRIM(LEFT(@List, @Pos - 1)))
			IF @ID <> ''
			BEGIN
				INSERT INTO @TempList (DataValue) VALUES (CAST(@ID AS varchar(50))) --Use Appropriate conversion
			END
			SET @List = RIGHT(@List, LEN(@List) - @Pos)
			SET @Pos = CHARINDEX(',', @List, 1)

		END
	END	
	RETURN 
END

GO
/****** Object:  UserDefinedFunction [dbo].[fnc_Get24HourDate]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnc_Get24HourDate]
(
@EndDateTime DATETIME
)
RETURNS 
@TempList TABLE
	(
		StartDateTime DATETIME,
		EndDateTime DATETIME
	)
AS
BEGIN
	DECLARE @StartDateTime DATETIME;
	DECLARE @MM smallint;
	SET @MM =FORMAT(@EndDateTime,'mm')
	IF(@MM>0)
	BEGIN
		SET @EndDateTime=DATEADD(HOUR,1,@EndDateTime)
		SET @EndDateTime= CONVERT(DATETIME,FORMAT(@EndDateTime,'dd-MMM-yyyy HH')+':00:00')
	END
	SET @StartDateTime=DATEADD(DAY,-1,@EndDateTime)
	INSERT INTO @TempList (StartDateTime,EndDateTime) VALUES (@StartDateTime,@EndDateTime) 
RETURN 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fnc_Get24HourList]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnc_Get24HourList]
(
@StartDateTime DATETIME,
@EndDateTime DATETIME,
@interval smallint
)
RETURNS 
@TempList TABLE
	(
		StartDateTime DATETIME,EndDateTime DATETIME
	)
AS
BEGIN
	INSERT INTO @TempList (StartDateTime)
	SELECT  TOP (DATEDIFF(HOUR, @StartDateTime, @EndDateTime) + @interval) DATETIME = DATEADD(HOUR, ROW_NUMBER() OVER(ORDER BY a.object_id) - @interval, @StartDateTime)
	FROM   sys.all_objects a CROSS JOIN sys.all_objects b
	DELETE FROM @TempList  WHERE StartDateTime=@StartDateTime
	UPDATE @TempList SET EndDateTime=DATEADD(HOUR,@interval,StartDateTime)
RETURN 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fnc_ValueSplit]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnc_ValueSplit]
(
	@List	varchar(8000)
)
RETURNS 
@TempList TABLE
	(
		Id  int identity(1,1),
		Value varchar(1000)
	)
AS
BEGIN
	-- Fill the table variable with the rows for your result set
	DECLARE @ID varchar(50), @Pos Varchar(50)

	SET @List = LTRIM(RTRIM(@List))+ ','
	SET @Pos = CHARINDEX(',', @List, 1)

	IF REPLACE(@List, ',', '') <> ''
	BEGIN
		WHILE @Pos > 0
		BEGIN
			SET @ID = LTRIM(RTRIM(LEFT(@List, @Pos - 1)))
			IF @ID <> ''
			BEGIN
				INSERT INTO @TempList (Value) VALUES (CAST(@ID AS varchar(50))) --Use Appropriate conversion
			END
			SET @List = RIGHT(@List, LEN(@List) - @Pos)
			SET @Pos = CHARINDEX(',', @List, 1)

		END
	END	
	RETURN 
END

GO
/****** Object:  UserDefinedFunction [dbo].[GetDateDiffInHRMMSS]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[GetDateDiffInHRMMSS](@startDate DATETIME, @endDate DATETIME)
RETURNS VARCHAR(10)
AS BEGIN
    DECLARE @seconds INT = DATEDIFF(s, @startDate, @endDate)
    DECLARE @difference VARCHAR(10) =
    FORMAT(@seconds / 3600, '00') + ':' +
    FORMAT(@seconds % 3600 / 60, '00') + ':' +
    FORMAT(@seconds % 60, '00')
    RETURN @difference
END
GO
/****** Object:  UserDefinedFunction [dbo].[SplitString]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[SplitString] ( @StringToSplit VARCHAR(MAX) )
RETURNS
 @returnList TABLE ([Name] [nvarchar] (500))
AS
BEGIN

 DECLARE @name NVARCHAR(255)
 DECLARE @pos INT

 WHILE CHARINDEX(',', @stringToSplit) > 0
 BEGIN
  SELECT @pos  = CHARINDEX(',', @stringToSplit)  
  SELECT @name = SUBSTRING(@stringToSplit, 1, @pos-1)

  INSERT INTO @returnList 
  SELECT @name

  SELECT @stringToSplit = SUBSTRING(@stringToSplit, @pos+1, LEN(@stringToSplit)-@pos)
 END

 INSERT INTO @returnList
 SELECT @stringToSplit

 RETURN
END
GO
/****** Object:  Table [dbo].[tbl_ActivityLog]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_ActivityLog](
	[ActivityId] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [bigint] NULL,
	[PrevColumn] [nvarchar](4000) NULL,
	[CurrentColumn] [nvarchar](4000) NULL,
	[ActionId] [varchar](50) NULL,
	[MenuId] [varchar](50) NULL,
	[CreatedDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_ATCCEventsHistory]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_ATCCEventsHistory](
	[TransactionId] [varchar](30) NULL,
	[EquipmentId] [bigint] NULL,
	[EventId] [varchar](255) NULL,
	[LaneNumber] [smallint] NULL,
	[EventDate] [datetime2](4) NULL,
	[VehicleClassId] [smallint] NULL,
	[VehicleImageUrl] [varchar](255) NULL,
	[VehicleVideoUrl] [varchar](255) NULL,
	[CameraSpeed] [decimal](18, 2) NULL,
	[ClassConfidencelevel] [decimal](18, 4) NULL,
	[VehicleColor] [varchar](30) NULL,
	[VehicleDirectionId] [bit] NULL,
	[IsWrongDirection] [bit] NULL,
	[IsReviewedRequired] [bit] NULL,
	[ReviewedStatus] [bit] NULL,
	[ReviewedVehicleClassId] [smallint] NULL,
	[ReviewedById] [bigint] NULL,
	[ReviewedDateTime] [datetime] NULL,
	[ReviewedRemark] [varchar](255) NULL,
	[CreatedDate] [datetime] NULL,
	[SystemProviderId] [smallint] NULL,
	[DataSendStatus] [bit] NULL,
	[MediaSendStatus] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_ControlRoomMaster]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_ControlRoomMaster](
	[ControlRoomId] [smallint] IDENTITY(1,1) NOT NULL,
	[ControlRoomName] [varchar](100) NULL,
	[ChainageNumber] [decimal](16, 3) NULL,
	[Latitude] [decimal](12, 9) NULL,
	[Longitude] [decimal](12, 9) NULL,
	[DirectionId] [smallint] NULL,
	[DataStatus] [smallint] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [bigint] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [bigint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_ECBCallEventsHistory]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_ECBCallEventsHistory](
	[CallerId] [bigint] NULL,
	[CalleeId] [bigint] NULL,
	[CallerNumber] [varchar](20) NULL,
	[CalleeNumber] [varchar](20) NULL,
	[EventId] [varchar](255) NULL,
	[StartDateTime] [datetime] NULL,
	[EndDateTime] [datetime] NULL,
	[CallDuration] [smallint] NULL,
	[CallStatusId] [smallint] NULL,
	[CallTypeId] [smallint] NULL,
	[RecordingFileName] [varchar](255) NULL,
	[OperatorId] [bigint] NULL,
	[IncidentId] [varchar](255) NULL,
	[IncidentStatusId] [smallint] NULL,
	[CreatedDate] [datetime] NULL,
	[SystemProviderId] [smallint] NULL,
	[DataSendStatus] [bit] NULL,
	[MediaSendStatus] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_EquipmentConfig]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_EquipmentConfig](
	[SystemId] [smallint] NULL,
	[EquipmentTypeId] [smallint] NULL,
	[EquipmentId] [bigint] NULL,
	[ParentId] [bigint] NULL,
	[PositionId] [smallint] NULL,
	[LaneNumberId] [smallint] NULL,
	[Extension] [bigint] NULL,
	[OrderBy] [smallint] NULL,
	[DataStatus] [smallint] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [bigint] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [bigint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_EquipmentDetails]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_EquipmentDetails](
	[EquipmentId] [bigint] IDENTITY(1,1) NOT NULL,
	[PackageId] [smallint] NOT NULL,
	[EquipmentTypeId] [smallint] NULL,
	[SystemId] [smallint] NULL,
	[EquipmentName] [varchar](100) NULL,
	[DirectionId] [smallint] NULL,
	[ProtocolTypeId] [smallint] NULL,
	[IpAddress] [varchar](20) NULL,
	[PortNumber] [int] NULL,
	[LoginId] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[ChainageNumber] [decimal](16, 3) NULL,
	[Latitude] [decimal](12, 9) NULL,
	[Longitude] [decimal](12, 9) NULL,
	[MacAddress] [varchar](100) NULL,
	[ModelNumber] [varchar](100) NULL,
	[SerialNumber] [varchar](100) NULL,
	[ManufacturerDetail] [varchar](100) NULL,
	[VendorDetail] [varchar](100) NULL,
	[ManufacturerDate] [date] NULL,
	[PurchageDate] [date] NULL,
	[WarrantyExpireDate] [date] NULL,
	[OnLineStatus] [bit] NULL,
	[DataStatus] [smallint] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [bigint] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [bigint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_EquipmentPositionTypeMaster]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_EquipmentPositionTypeMaster](
	[EquipmentPositionId] [smallint] IDENTITY(1,1) NOT NULL,
	[EquipmentPositionName] [varchar](20) NULL,
	[EquipmentPositionColor] [varchar](50) NULL,
	[DataStatus] [smallint] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [bigint] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [bigint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_EquipmentTypeMaster]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_EquipmentTypeMaster](
	[EquipmentTypeId] [int] IDENTITY(1,1) NOT NULL,
	[EquipmentTypeName] [varchar](100) NULL,
	[EquipmentCategoryTypeId] [smallint] NULL,
	[EquipmentConnectionTypeId] [smallint] NULL,
	[EquipmentIconName] [varchar](100) NULL,
	[EquipmentLevel] [smallint] NULL,
	[EquipmentColor] [varchar](50) NULL,
	[DataStatus] [smallint] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [bigint] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [bigint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_ErrorInfo]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_ErrorInfo](
	[ErrorNumber] [bigint] NULL,
	[ErrorSeverity] [bigint] NULL,
	[ErrorState] [bigint] NULL,
	[ErrorProcedure] [varchar](max) NULL,
	[ErrorLine] [bigint] NULL,
	[ErrorMessage] [varchar](max) NULL,
	[CreatedDate] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_EventsTypeMaster]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_EventsTypeMaster](
	[EventTypeId] [smallint] IDENTITY(0,1) NOT NULL,
	[EventTypeName] [varchar](100) NULL,
	[EventsRequired] [bit] NULL,
	[ReviewRequired] [bit] NULL,
	[ChallanTypeId] [smallint] NULL,
	[MinimumValue] [decimal](18, 6) NULL,
	[MaximumValue] [decimal](18, 6) NULL,
	[EventsColor] [varchar](50) NULL,
	[SystemId] [smallint] NULL,
	[DataStatus] [smallint] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [bigint] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [bigint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_IncidentActionHistory]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_IncidentActionHistory](
	[IncidentId] [varchar](255) NULL,
	[ActionImagePath] [varchar](255) NULL,
	[ActionVideoPath] [varchar](255) NULL,
	[ActionAudioPath] [varchar](255) NULL,
	[AssignedToId] [bigint] NULL,
	[ActionTakenById] [bigint] NULL,
	[ActionTakenRemark] [varchar](255) NULL,
	[ActionTakenDateTime] [datetime] NULL,
	[ActionStatusId] [smallint] NULL,
	[DataSendStatus] [bit] NULL,
	[MediaSendStatus] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_IncidentCategoryMaster]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_IncidentCategoryMaster](
	[IncidentCategoryId] [smallint] IDENTITY(1,1) NOT NULL,
	[IncidentCategoryName] [varchar](100) NULL,
	[IncidentCategoryIcon] [varchar](100) NULL,
	[PriorityId] [smallint] NULL,
	[OrderBy] [smallint] NULL,
	[DataStatus] [smallint] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [bigint] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [bigint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_IncidentCheckList]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_IncidentCheckList](
	[IncidentCheckListId] [bigint] IDENTITY(1,1) NOT NULL,
	[CategoryId] [int] NULL,
	[CheckListMasterId] [smallint] NULL,
	[IsAutoProcess] [bit] NULL,
	[StepsProofId] [smallint] NULL,
	[OrderBy] [smallint] NULL,
	[DataStatus] [smallint] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [bigint] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [bigint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_IncidentCheckListMaster]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_IncidentCheckListMaster](
	[CheckListMasterId] [smallint] IDENTITY(1,1) NOT NULL,
	[CategoryId] [smallint] NULL,
	[StepsName] [varchar](100) NULL,
	[IsAutoProcess] [bit] NULL,
	[StepsProofId] [smallint] NULL,
	[DataStatus] [smallint] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [bigint] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [bigint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_IncidentDetailsHistory]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_IncidentDetailsHistory](
	[IncidentId] [varchar](255) NULL,
	[IncidentCategoryId] [smallint] NULL,
	[PriorityId] [smallint] NULL,
	[IncidentDescription] [varchar](500) NULL,
	[IncidentImagePath] [varchar](255) NULL,
	[IncidentVideoPath] [varchar](255) NULL,
	[IncidentAudioPath] [varchar](255) NULL,
	[DirectionId] [int] NULL,
	[ChainageNumber] [decimal](16, 3) NULL,
	[Latitude] [decimal](8, 6) NULL,
	[Longitude] [decimal](9, 6) NULL,
	[VehiclePlateNumber] [varchar](20) NULL,
	[VehicleClassId] [smallint] NULL,
	[SourceSystemId] [int] NULL,
	[EquipmentId] [bigint] NULL,
	[NearByPTZId] [int] NULL,
	[IncidentGeneratedByTypeId] [smallint] NULL,
	[IncidentGeneratedById] [bigint] NULL,
	[AssignedToId] [bigint] NULL,
	[IncidentCloseImagePath] [varchar](255) NULL,
	[IncidentStatusId] [smallint] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [bigint] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [bigint] NULL,
	[DataSendStatus] [bit] NULL,
	[MediaSendStatus] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_IncidentSourceMaster]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_IncidentSourceMaster](
	[SourceId] [int] IDENTITY(1,1) NOT NULL,
	[SourceName] [varchar](100) NOT NULL,
	[ReferenceNo] [varchar](100) NULL,
	[DataStatus] [int] NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_IncidentStatusMaster]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_IncidentStatusMaster](
	[IncidentStatusId] [smallint] IDENTITY(1,1) NOT NULL,
	[IncidentStatusName] [varchar](100) NOT NULL,
	[IncidentStatusIcon] [varchar](100) NULL,
	[IncidentStatusColorCode] [varchar](100) NULL,
	[ProcessPercentage] [decimal](5, 2) NULL,
	[DataStatus] [smallint] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [bigint] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [bigint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_IncidentSubCategory]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_IncidentSubCategory](
	[EntryId] [smallint] IDENTITY(1,1) NOT NULL,
	[CategoryId] [smallint] NULL,
	[SubCategoryName] [varchar](100) NULL,
	[DataStatus] [smallint] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [bigint] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [bigint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_LaneConfig]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_LaneConfig](
	[LaneNumber] [smallint] NULL,
	[AllowedClassIds] [varchar](20) NULL,
	[AllowedSpeed] [decimal](10, 2) NULL,
	[DataStatus] [smallint] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [bigint] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [bigint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_LogingActivity]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_LogingActivity](
	[LogingActivityId] [bigint] IDENTITY(1,1) NOT NULL,
	[LoginId] [varchar](50) NULL,
	[UserTypeId] [varchar](50) NULL,
	[LoginStatusId] [smallint] NULL,
	[IpAddress] [varchar](100) NULL,
	[LoginDateTime] [datetime] NULL,
	[LogoutDateTime] [datetime] NULL,
	[CreatedDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_MenuMaster]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_MenuMaster](
	[MenuId] [int] IDENTITY(1,1) NOT NULL,
	[MenuName] [varchar](40) NULL,
	[MenuURL] [varchar](100) NULL,
	[MenuIcon] [varchar](100) NULL,
	[MennuAccess] [smallint] NULL,
	[OderBy] [smallint] NULL,
	[ParentId] [bigint] NULL,
	[SystemId] [smallint] NULL,
	[DataStatus] [smallint] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [bigint] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [bigint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_PackageDetails]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_PackageDetails](
	[PackageId] [smallint] IDENTITY(1,1) NOT NULL,
	[ControlRoomId] [smallint] NULL,
	[PackageName] [varchar](50) NULL,
	[StartChainageNumber] [decimal](16, 3) NULL,
	[EndChainageNumber] [decimal](16, 3) NULL,
	[StartLatitude] [decimal](12, 9) NULL,
	[StartLongitude] [decimal](12, 9) NULL,
	[EndLatitude] [decimal](12, 9) NULL,
	[EndLongitude] [decimal](12, 9) NULL,
	[DataStatus] [smallint] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [bigint] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [bigint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_ReportMaster]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_ReportMaster](
	[ReportId] [smallint] IDENTITY(1,1) NOT NULL,
	[ReportName] [varchar](100) NULL,
	[ParentId] [smallint] NULL,
	[OrderBy] [smallint] NULL,
	[DataStatus] [smallint] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [bigint] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [bigint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_ReportMasterBKP]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_ReportMasterBKP](
	[ReportId] [smallint] IDENTITY(1,1) NOT NULL,
	[ReportName] [varchar](100) NULL,
	[ParentId] [smallint] NULL,
	[OrderBy] [smallint] NULL,
	[DataStatus] [smallint] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [bigint] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [bigint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_RoleMaster]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_RoleMaster](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [varchar](100) NULL,
	[DataStatus] [smallint] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [bigint] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [bigint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_RolePermission]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_RolePermission](
	[RoleId] [bigint] NULL,
	[MenuId] [bigint] NULL,
	[DataView] [smallint] NULL,
	[DataAdd] [smallint] NULL,
	[DataUpdate] [smallint] NULL,
	[DataStatus] [smallint] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [bigint] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [bigint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_SystemMaster]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_SystemMaster](
	[SystemId] [smallint] IDENTITY(1,1) NOT NULL,
	[SystemName] [varchar](20) NULL,
	[SystemDescription] [varchar](50) NULL,
	[AppPort] [smallint] NULL,
	[ApiPort] [smallint] NULL,
	[SystemImage] [varchar](50) NULL,
	[SystemIcon] [varchar](50) NULL,
	[DashBoard] [bit] NULL,
	[ReportIds] [nvarchar](4000) NULL,
	[DataStatus] [smallint] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [bigint] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [bigint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_SystemSetting]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_SystemSetting](
	[TotalLane] [smallint] NULL,
	[IsATCCIndependently] [bit] NULL,
	[ATCCByVSDS] [bit] NULL,
	[ATCCByVIDS] [bit] NULL,
	[TrafficCount] [smallint] NULL,
	[TrafficByTime] [smallint] NULL,
	[RestrictedVehiclesIds] [varchar](255) NULL,
	[DefaultControlRoomId] [smallint] NULL,
	[IsWeatherOnline] [bit] NULL,
	[WeatherAPI] [varchar](255) NULL,
	[WeatherAPIHitPerMinite] [smallint] NULL,
	[DataStatus] [smallint] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [bigint] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [bigint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_UserMaster]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_UserMaster](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[LoginId] [varchar](20) NULL,
	[LoginPassword] [varchar](100) NULL,
	[FirstName] [varchar](20) NULL,
	[LastName] [varchar](20) NULL,
	[EmailId] [varchar](50) NULL,
	[MobileNumber] [varchar](15) NULL,
	[AccountExpiredDate] [date] NULL,
	[RoleId] [int] NULL,
	[UserTypeId] [int] NULL,
	[UserProfileImage] [varchar](255) NULL,
	[DataStatus] [smallint] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [bigint] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [bigint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_VehicleClass]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_VehicleClass](
	[VehicleClassId] [smallint] IDENTITY(0,1) NOT NULL,
	[VehicleClassName] [varchar](20) NULL,
	[VehicleClassIcon] [varchar](50) NULL,
	[VehicleClassColor] [varchar](50) NULL,
	[AllowedSpeed] [decimal](10, 2) NULL,
	[DataStatus] [smallint] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [bigint] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [bigint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_VIDSEventsHistory]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_VIDSEventsHistory](
	[TransactionId] [varchar](30) NULL,
	[EquipmentId] [bigint] NULL,
	[EventId] [varchar](255) NULL,
	[DirectionId] [smallint] NULL,
	[EventTypeId] [smallint] NULL,
	[EventStartDate] [datetime2](4) NULL,
	[EventEndDate] [datetime2](4) NULL,
	[EventDuration] [int] NULL,
	[LaneNumber] [smallint] NULL,
	[VehicleSpeed] [smallint] NULL,
	[VehicleClassId] [smallint] NULL,
	[PlateNumber] [varchar](50) NULL,
	[PlateImageUrl] [varchar](255) NULL,
	[EventImageUrl] [varchar](255) NULL,
	[EventVideoUrl] [varchar](255) NULL,
	[IncidentStatusId] [smallint] NULL,
	[IsChallanRequired] [bit] NULL,
	[ChallanTypeId] [smallint] NULL,
	[ChallanStatusId] [smallint] NULL,
	[ChallanRemark] [varchar](255) NULL,
	[IsReviewedRequired] [bit] NULL,
	[ReviewedStatus] [bit] NULL,
	[ReviewedEventTypeId] [smallint] NULL,
	[ReviewedPlateNumber] [varchar](50) NULL,
	[ReviewedVehicleClassId] [smallint] NULL,
	[ReviewedById] [bigint] NULL,
	[ReviewedDateTime] [datetime] NULL,
	[ReviewedRemark] [varchar](255) NULL,
	[CreatedDate] [datetime] NULL,
	[SystemProviderId] [smallint] NULL,
	[DataSendStatus] [bit] NULL,
	[MediaSendStatus] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_VMSMessageDetails]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_VMSMessageDetails](
	[MessageId] [bigint] IDENTITY(1,1) NOT NULL,
	[EquipmentIds] [varchar](4000) NULL,
	[MessageTypeId] [smallint] NULL,
	[DisplayTimout] [smallint] NULL,
	[ValidTillDate] [date] NULL,
	[MediaPath] [varchar](255) NULL,
	[MessageDetails] [nvarchar](4000) NULL,
	[DataStatus] [smallint] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [bigint] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [bigint] NULL,
	[DataSendStatus] [bit] NULL,
	[MediaSendStatus] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_VMSMessageHistory]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_VMSMessageHistory](
	[MessageId] [bigint] NOT NULL,
	[EquipmentId] [bigint] NULL,
	[MessageTypeId] [smallint] NULL,
	[DisplayTimout] [smallint] NULL,
	[ValidTillDate] [date] NULL,
	[MediaPath] [varchar](255) NULL,
	[MessageDetails] [nvarchar](4000) NULL,
	[PlayDateTime] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_VSDSEventsHistory]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_VSDSEventsHistory](
	[TransactionId] [varchar](30) NULL,
	[EquipmentId] [bigint] NULL,
	[LaneNumber] [smallint] NULL,
	[EventID] [varchar](255) NULL,
	[EventTypeId] [smallint] NULL,
	[EventDate] [datetime2](4) NULL,
	[PlateNumber] [varchar](50) NULL,
	[VehicleClassId] [smallint] NULL,
	[PlateImageUrl] [varchar](255) NULL,
	[VehicleImageUrl] [varchar](255) NULL,
	[VehicleVideoUrl] [varchar](255) NULL,
	[CameraSpeed] [decimal](18, 2) NULL,
	[RadarSpeed] [decimal](18, 2) NULL,
	[AllowedSpeed] [decimal](10, 2) NULL,
	[OcrConfidencelevel] [decimal](18, 4) NULL,
	[ClassConfidencelevel] [decimal](18, 4) NULL,
	[PlateFontColor] [varchar](30) NULL,
	[PlateBackColor] [varchar](30) NULL,
	[VehicleColor] [varchar](30) NULL,
	[VehicleDirectionId] [bit] NULL,
	[IsPlateVisible] [bit] NULL,
	[IsFaultyPlate] [bit] NULL,
	[IsStandardPlate] [bit] NULL,
	[IsWrongDirection] [bit] NULL,
	[IsReviewedRequired] [bit] NULL,
	[IsRestiredVehicle] [bit] NULL,
	[ReviewedStatus] [bit] NULL,
	[ReviewedVehicleClassId] [smallint] NULL,
	[ReviewedPlateNumber] [varchar](50) NULL,
	[IsReviewedPlateVisible] [bit] NULL,
	[IsReviewedFaultyPlate] [bit] NULL,
	[IsReviewedStandardPlate] [bit] NULL,
	[IsReviewedWrongDirection] [bit] NULL,
	[ReviewedBy] [bigint] NULL,
	[ReviewedDateTime] [datetime] NULL,
	[ReviewedRemark] [varchar](255) NULL,
	[IsChallanRequired] [bit] NULL,
	[ChallanTypeId] [smallint] NULL,
	[ChallanStatusId] [smallint] NULL,
	[ChallanRemark] [varchar](255) NULL,
	[CreatedDate] [datetime] NULL,
	[SystemProviderId] [smallint] NULL,
	[DataSendStatus] [bit] NULL,
	[MediaSendStatus] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_VSDSSectionSpeedHistory]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_VSDSSectionSpeedHistory](
	[SourceTransactionId] [varchar](30) NULL,
	[DestinationTransactionId] [varchar](30) NULL,
	[DistanceCovered] [decimal](18, 3) NULL,
	[TravelTime] [int] NULL,
	[CalculatedSpeed] [decimal](18, 2) NULL,
	[AllowedSpeed] [decimal](10, 2) NULL,
	[ChallanRequired] [bit] NULL,
	[ChallanTypeId] [smallint] NULL,
	[ChallanStatusId] [smallint] NULL,
	[CreatedDate] [datetime] NULL,
	[SendStatus] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_WeatherEventHistory]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_WeatherEventHistory](
	[EquipmentId] [bigint] NULL,
	[EventDateTime] [datetime] NULL,
	[AirTemperature] [decimal](18, 2) NULL,
	[SurfaceTemperature] [decimal](18, 2) NULL,
	[Humidity] [decimal](18, 2) NULL,
	[Visibility] [decimal](18, 2) NULL,
	[WindDirection] [decimal](18, 2) NULL,
	[WindSpeed] [decimal](18, 2) NULL,
	[AirQuality] [decimal](18, 2) NULL,
	[RainMeasurement] [decimal](18, 2) NULL,
	[WeatherDescription] [varchar](100) NULL,
	[DataSendStatus] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_WeatherOpenAPI]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_WeatherOpenAPI](
	[EquipmentId] [bigint] NULL,
	[ReceivedDateTime] [datetime] NULL,
	[APIDateTime] [datetime] NULL,
	[WeatherMain] [varchar](100) NULL,
	[WeatherDescription] [varchar](100) NULL,
	[Temperature] [decimal](18, 2) NULL,
	[MinTemperature] [decimal](18, 2) NULL,
	[MaxTemperature] [decimal](18, 2) NULL,
	[Pressure] [bigint] NULL,
	[Humidity] [bigint] NULL,
	[Visibility] [bigint] NULL,
	[WindSpeed] [decimal](18, 2) NULL,
	[WindDegree] [decimal](18, 2) NULL,
	[Clouds] [smallint] NULL,
	[GetDateTime] [bigint] NULL,
	[Sunrise] [bigint] NULL,
	[Sunset] [bigint] NULL,
	[CityName] [varchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[temp_EquipmentConfig]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[temp_EquipmentConfig](
	[SystemId] [smallint] NULL,
	[EquipmentTypeId] [smallint] NULL,
	[EquipmentId] [bigint] NULL,
	[ParentId] [bigint] NULL,
	[PositionId] [smallint] NULL,
	[LaneNumberId] [smallint] NULL,
	[Extension] [bigint] NULL,
	[SessionId] [varchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[temp_EventsTypeMaster]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[temp_EventsTypeMaster](
	[EventTypeId] [smallint] NOT NULL,
	[EventsRequired] [bit] NULL,
	[ReviewRequired] [bit] NULL,
	[ChallanTypeId] [smallint] NULL,
	[MinimumValue] [decimal](18, 6) NULL,
	[MaximumValue] [decimal](18, 6) NULL,
	[SessionId] [varchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[temp_ImportPermission]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[temp_ImportPermission](
	[MenuId] [smallint] NULL,
	[DataView] [smallint] NULL,
	[DataAdd] [smallint] NULL,
	[DataUpdate] [smallint] NULL,
	[SessionId] [varchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[temp_LaneConfig]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[temp_LaneConfig](
	[LaneNumber] [smallint] NULL,
	[AllowedClassIds] [varchar](20) NULL,
	[AllowedSpeed] [decimal](10, 2) NULL,
	[DataStatus] [smallint] NULL,
	[SessionId] [varchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[temp_SystemMaster]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[temp_SystemMaster](
	[SystemId] [smallint] NULL,
	[DataStatus] [smallint] NULL,
	[DashBoard] [bit] NULL,
	[ReportIds] [nvarchar](4000) NULL,
	[SessionId] [nvarchar](4000) NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tbl_ATCCEventsHistory] ADD  DEFAULT ((0)) FOR [VehicleDirectionId]
GO
ALTER TABLE [dbo].[tbl_ATCCEventsHistory] ADD  DEFAULT ((0)) FOR [IsWrongDirection]
GO
ALTER TABLE [dbo].[tbl_ATCCEventsHistory] ADD  DEFAULT ((0)) FOR [IsReviewedRequired]
GO
ALTER TABLE [dbo].[tbl_ATCCEventsHistory] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[tbl_ATCCEventsHistory] ADD  DEFAULT ((0)) FOR [DataSendStatus]
GO
ALTER TABLE [dbo].[tbl_ATCCEventsHistory] ADD  DEFAULT ((0)) FOR [MediaSendStatus]
GO
ALTER TABLE [dbo].[tbl_ControlRoomMaster] ADD  DEFAULT ((1)) FOR [DataStatus]
GO
ALTER TABLE [dbo].[tbl_ControlRoomMaster] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[tbl_ControlRoomMaster] ADD  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[tbl_ControlRoomMaster] ADD  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[tbl_ControlRoomMaster] ADD  DEFAULT ((0)) FOR [ModifiedBy]
GO
ALTER TABLE [dbo].[tbl_ECBCallEventsHistory] ADD  DEFAULT ((0)) FOR [OperatorId]
GO
ALTER TABLE [dbo].[tbl_ECBCallEventsHistory] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[tbl_ECBCallEventsHistory] ADD  DEFAULT ((0)) FOR [DataSendStatus]
GO
ALTER TABLE [dbo].[tbl_ECBCallEventsHistory] ADD  DEFAULT ((0)) FOR [MediaSendStatus]
GO
ALTER TABLE [dbo].[tbl_EquipmentConfig] ADD  DEFAULT ((0)) FOR [ParentId]
GO
ALTER TABLE [dbo].[tbl_EquipmentConfig] ADD  DEFAULT ((0)) FOR [PositionId]
GO
ALTER TABLE [dbo].[tbl_EquipmentConfig] ADD  DEFAULT ((0)) FOR [LaneNumberId]
GO
ALTER TABLE [dbo].[tbl_EquipmentConfig] ADD  DEFAULT ((0)) FOR [Extension]
GO
ALTER TABLE [dbo].[tbl_EquipmentConfig] ADD  DEFAULT ((0)) FOR [OrderBy]
GO
ALTER TABLE [dbo].[tbl_EquipmentConfig] ADD  DEFAULT ((1)) FOR [DataStatus]
GO
ALTER TABLE [dbo].[tbl_EquipmentConfig] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[tbl_EquipmentConfig] ADD  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[tbl_EquipmentConfig] ADD  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[tbl_EquipmentConfig] ADD  DEFAULT ((0)) FOR [ModifiedBy]
GO
ALTER TABLE [dbo].[tbl_EquipmentDetails] ADD  DEFAULT ((0)) FOR [OnLineStatus]
GO
ALTER TABLE [dbo].[tbl_EquipmentDetails] ADD  DEFAULT ((1)) FOR [DataStatus]
GO
ALTER TABLE [dbo].[tbl_EquipmentDetails] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[tbl_EquipmentDetails] ADD  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[tbl_EquipmentDetails] ADD  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[tbl_EquipmentDetails] ADD  DEFAULT ((0)) FOR [ModifiedBy]
GO
ALTER TABLE [dbo].[tbl_EquipmentPositionTypeMaster] ADD  DEFAULT ((1)) FOR [DataStatus]
GO
ALTER TABLE [dbo].[tbl_EquipmentPositionTypeMaster] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[tbl_EquipmentPositionTypeMaster] ADD  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[tbl_EquipmentPositionTypeMaster] ADD  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[tbl_EquipmentPositionTypeMaster] ADD  DEFAULT ((0)) FOR [ModifiedBy]
GO
ALTER TABLE [dbo].[tbl_EquipmentTypeMaster] ADD  DEFAULT ((0)) FOR [EquipmentLevel]
GO
ALTER TABLE [dbo].[tbl_EquipmentTypeMaster] ADD  DEFAULT ((1)) FOR [DataStatus]
GO
ALTER TABLE [dbo].[tbl_EquipmentTypeMaster] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[tbl_EquipmentTypeMaster] ADD  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[tbl_EquipmentTypeMaster] ADD  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[tbl_EquipmentTypeMaster] ADD  DEFAULT ((0)) FOR [ModifiedBy]
GO
ALTER TABLE [dbo].[tbl_ErrorInfo] ADD  DEFAULT ((0)) FOR [ErrorNumber]
GO
ALTER TABLE [dbo].[tbl_ErrorInfo] ADD  DEFAULT ((0)) FOR [ErrorSeverity]
GO
ALTER TABLE [dbo].[tbl_ErrorInfo] ADD  DEFAULT ((0)) FOR [ErrorState]
GO
ALTER TABLE [dbo].[tbl_ErrorInfo] ADD  DEFAULT ('') FOR [ErrorProcedure]
GO
ALTER TABLE [dbo].[tbl_ErrorInfo] ADD  DEFAULT ((0)) FOR [ErrorLine]
GO
ALTER TABLE [dbo].[tbl_ErrorInfo] ADD  DEFAULT ('') FOR [ErrorMessage]
GO
ALTER TABLE [dbo].[tbl_ErrorInfo] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[tbl_EventsTypeMaster] ADD  DEFAULT ((1)) FOR [EventsRequired]
GO
ALTER TABLE [dbo].[tbl_EventsTypeMaster] ADD  DEFAULT ((0)) FOR [ReviewRequired]
GO
ALTER TABLE [dbo].[tbl_EventsTypeMaster] ADD  DEFAULT ((0)) FOR [ChallanTypeId]
GO
ALTER TABLE [dbo].[tbl_EventsTypeMaster] ADD  DEFAULT ((0)) FOR [MinimumValue]
GO
ALTER TABLE [dbo].[tbl_EventsTypeMaster] ADD  DEFAULT ((0)) FOR [MaximumValue]
GO
ALTER TABLE [dbo].[tbl_EventsTypeMaster] ADD  DEFAULT ((0)) FOR [SystemId]
GO
ALTER TABLE [dbo].[tbl_EventsTypeMaster] ADD  DEFAULT ((1)) FOR [DataStatus]
GO
ALTER TABLE [dbo].[tbl_EventsTypeMaster] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[tbl_EventsTypeMaster] ADD  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[tbl_EventsTypeMaster] ADD  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[tbl_EventsTypeMaster] ADD  DEFAULT ((0)) FOR [ModifiedBy]
GO
ALTER TABLE [dbo].[tbl_IncidentActionHistory] ADD  DEFAULT ((0)) FOR [DataSendStatus]
GO
ALTER TABLE [dbo].[tbl_IncidentActionHistory] ADD  DEFAULT ((0)) FOR [MediaSendStatus]
GO
ALTER TABLE [dbo].[tbl_IncidentCategoryMaster] ADD  DEFAULT ((0)) FOR [OrderBy]
GO
ALTER TABLE [dbo].[tbl_IncidentCategoryMaster] ADD  DEFAULT ((1)) FOR [DataStatus]
GO
ALTER TABLE [dbo].[tbl_IncidentCategoryMaster] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[tbl_IncidentCategoryMaster] ADD  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[tbl_IncidentCategoryMaster] ADD  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[tbl_IncidentCategoryMaster] ADD  DEFAULT ((0)) FOR [ModifiedBy]
GO
ALTER TABLE [dbo].[tbl_IncidentCheckList] ADD  DEFAULT ((0)) FOR [IsAutoProcess]
GO
ALTER TABLE [dbo].[tbl_IncidentCheckList] ADD  DEFAULT ((1)) FOR [DataStatus]
GO
ALTER TABLE [dbo].[tbl_IncidentCheckList] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[tbl_IncidentCheckList] ADD  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[tbl_IncidentCheckList] ADD  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[tbl_IncidentCheckList] ADD  DEFAULT ((0)) FOR [ModifiedBy]
GO
ALTER TABLE [dbo].[tbl_IncidentCheckListMaster] ADD  DEFAULT ((0)) FOR [CategoryId]
GO
ALTER TABLE [dbo].[tbl_IncidentCheckListMaster] ADD  DEFAULT ((0)) FOR [IsAutoProcess]
GO
ALTER TABLE [dbo].[tbl_IncidentCheckListMaster] ADD  DEFAULT ((1)) FOR [DataStatus]
GO
ALTER TABLE [dbo].[tbl_IncidentCheckListMaster] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[tbl_IncidentCheckListMaster] ADD  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[tbl_IncidentCheckListMaster] ADD  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[tbl_IncidentCheckListMaster] ADD  DEFAULT ((0)) FOR [ModifiedBy]
GO
ALTER TABLE [dbo].[tbl_IncidentDetailsHistory] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[tbl_IncidentDetailsHistory] ADD  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[tbl_IncidentDetailsHistory] ADD  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[tbl_IncidentDetailsHistory] ADD  DEFAULT ((0)) FOR [ModifiedBy]
GO
ALTER TABLE [dbo].[tbl_IncidentDetailsHistory] ADD  DEFAULT ((0)) FOR [DataSendStatus]
GO
ALTER TABLE [dbo].[tbl_IncidentDetailsHistory] ADD  DEFAULT ((0)) FOR [MediaSendStatus]
GO
ALTER TABLE [dbo].[tbl_IncidentSourceMaster] ADD  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[tbl_IncidentSourceMaster] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[tbl_IncidentSourceMaster] ADD  DEFAULT ((0)) FOR [ModifiedBy]
GO
ALTER TABLE [dbo].[tbl_IncidentSourceMaster] ADD  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[tbl_IncidentStatusMaster] ADD  DEFAULT ((0)) FOR [ProcessPercentage]
GO
ALTER TABLE [dbo].[tbl_IncidentStatusMaster] ADD  DEFAULT ((1)) FOR [DataStatus]
GO
ALTER TABLE [dbo].[tbl_IncidentStatusMaster] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[tbl_IncidentStatusMaster] ADD  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[tbl_IncidentStatusMaster] ADD  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[tbl_IncidentStatusMaster] ADD  DEFAULT ((0)) FOR [ModifiedBy]
GO
ALTER TABLE [dbo].[tbl_IncidentSubCategory] ADD  DEFAULT ((1)) FOR [DataStatus]
GO
ALTER TABLE [dbo].[tbl_IncidentSubCategory] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[tbl_IncidentSubCategory] ADD  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[tbl_IncidentSubCategory] ADD  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[tbl_IncidentSubCategory] ADD  DEFAULT ((0)) FOR [ModifiedBy]
GO
ALTER TABLE [dbo].[tbl_LaneConfig] ADD  DEFAULT ((0)) FOR [AllowedSpeed]
GO
ALTER TABLE [dbo].[tbl_LaneConfig] ADD  DEFAULT ((1)) FOR [DataStatus]
GO
ALTER TABLE [dbo].[tbl_LaneConfig] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[tbl_LaneConfig] ADD  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[tbl_LaneConfig] ADD  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[tbl_LaneConfig] ADD  DEFAULT ((0)) FOR [ModifiedBy]
GO
ALTER TABLE [dbo].[tbl_LogingActivity] ADD  DEFAULT (getdate()) FOR [LoginDateTime]
GO
ALTER TABLE [dbo].[tbl_LogingActivity] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[tbl_MenuMaster] ADD  DEFAULT ((1)) FOR [DataStatus]
GO
ALTER TABLE [dbo].[tbl_MenuMaster] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[tbl_MenuMaster] ADD  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[tbl_MenuMaster] ADD  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[tbl_MenuMaster] ADD  DEFAULT ((0)) FOR [ModifiedBy]
GO
ALTER TABLE [dbo].[tbl_PackageDetails] ADD  DEFAULT ((1)) FOR [DataStatus]
GO
ALTER TABLE [dbo].[tbl_PackageDetails] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[tbl_PackageDetails] ADD  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[tbl_PackageDetails] ADD  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[tbl_PackageDetails] ADD  DEFAULT ((0)) FOR [ModifiedBy]
GO
ALTER TABLE [dbo].[tbl_ReportMaster] ADD  DEFAULT ((0)) FOR [ParentId]
GO
ALTER TABLE [dbo].[tbl_ReportMaster] ADD  DEFAULT ((0)) FOR [OrderBy]
GO
ALTER TABLE [dbo].[tbl_ReportMaster] ADD  DEFAULT ((1)) FOR [DataStatus]
GO
ALTER TABLE [dbo].[tbl_ReportMaster] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[tbl_ReportMaster] ADD  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[tbl_ReportMaster] ADD  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[tbl_ReportMaster] ADD  DEFAULT ((0)) FOR [ModifiedBy]
GO
ALTER TABLE [dbo].[tbl_ReportMasterBKP] ADD  DEFAULT ((0)) FOR [ParentId]
GO
ALTER TABLE [dbo].[tbl_ReportMasterBKP] ADD  DEFAULT ((0)) FOR [OrderBy]
GO
ALTER TABLE [dbo].[tbl_ReportMasterBKP] ADD  DEFAULT ((1)) FOR [DataStatus]
GO
ALTER TABLE [dbo].[tbl_ReportMasterBKP] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[tbl_ReportMasterBKP] ADD  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[tbl_ReportMasterBKP] ADD  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[tbl_ReportMasterBKP] ADD  DEFAULT ((0)) FOR [ModifiedBy]
GO
ALTER TABLE [dbo].[tbl_RoleMaster] ADD  DEFAULT ((1)) FOR [DataStatus]
GO
ALTER TABLE [dbo].[tbl_RoleMaster] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[tbl_RoleMaster] ADD  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[tbl_RoleMaster] ADD  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[tbl_RoleMaster] ADD  DEFAULT ((0)) FOR [ModifiedBy]
GO
ALTER TABLE [dbo].[tbl_RolePermission] ADD  DEFAULT ((1)) FOR [DataView]
GO
ALTER TABLE [dbo].[tbl_RolePermission] ADD  DEFAULT ((1)) FOR [DataAdd]
GO
ALTER TABLE [dbo].[tbl_RolePermission] ADD  DEFAULT ((1)) FOR [DataUpdate]
GO
ALTER TABLE [dbo].[tbl_RolePermission] ADD  DEFAULT ((1)) FOR [DataStatus]
GO
ALTER TABLE [dbo].[tbl_RolePermission] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[tbl_RolePermission] ADD  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[tbl_RolePermission] ADD  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[tbl_RolePermission] ADD  DEFAULT ((0)) FOR [ModifiedBy]
GO
ALTER TABLE [dbo].[tbl_SystemMaster] ADD  DEFAULT ((1)) FOR [DashBoard]
GO
ALTER TABLE [dbo].[tbl_SystemMaster] ADD  DEFAULT ((1)) FOR [DataStatus]
GO
ALTER TABLE [dbo].[tbl_SystemMaster] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[tbl_SystemMaster] ADD  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[tbl_SystemMaster] ADD  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[tbl_SystemMaster] ADD  DEFAULT ((0)) FOR [ModifiedBy]
GO
ALTER TABLE [dbo].[tbl_SystemSetting] ADD  DEFAULT ((1)) FOR [IsWeatherOnline]
GO
ALTER TABLE [dbo].[tbl_SystemSetting] ADD  DEFAULT ((15)) FOR [WeatherAPIHitPerMinite]
GO
ALTER TABLE [dbo].[tbl_SystemSetting] ADD  DEFAULT ((1)) FOR [DataStatus]
GO
ALTER TABLE [dbo].[tbl_SystemSetting] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[tbl_SystemSetting] ADD  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[tbl_SystemSetting] ADD  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[tbl_SystemSetting] ADD  DEFAULT ((0)) FOR [ModifiedBy]
GO
ALTER TABLE [dbo].[tbl_UserMaster] ADD  DEFAULT ((1)) FOR [DataStatus]
GO
ALTER TABLE [dbo].[tbl_UserMaster] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[tbl_UserMaster] ADD  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[tbl_UserMaster] ADD  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[tbl_UserMaster] ADD  DEFAULT ((0)) FOR [ModifiedBy]
GO
ALTER TABLE [dbo].[tbl_VehicleClass] ADD  DEFAULT ((0)) FOR [AllowedSpeed]
GO
ALTER TABLE [dbo].[tbl_VehicleClass] ADD  DEFAULT ((1)) FOR [DataStatus]
GO
ALTER TABLE [dbo].[tbl_VehicleClass] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[tbl_VehicleClass] ADD  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[tbl_VehicleClass] ADD  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[tbl_VehicleClass] ADD  DEFAULT ((0)) FOR [ModifiedBy]
GO
ALTER TABLE [dbo].[tbl_VIDSEventsHistory] ADD  DEFAULT ((0)) FOR [DirectionId]
GO
ALTER TABLE [dbo].[tbl_VIDSEventsHistory] ADD  DEFAULT ((0)) FOR [IncidentStatusId]
GO
ALTER TABLE [dbo].[tbl_VIDSEventsHistory] ADD  DEFAULT ((0)) FOR [IsChallanRequired]
GO
ALTER TABLE [dbo].[tbl_VIDSEventsHistory] ADD  DEFAULT ((0)) FOR [ChallanTypeId]
GO
ALTER TABLE [dbo].[tbl_VIDSEventsHistory] ADD  DEFAULT ((0)) FOR [ChallanStatusId]
GO
ALTER TABLE [dbo].[tbl_VIDSEventsHistory] ADD  DEFAULT ((0)) FOR [IsReviewedRequired]
GO
ALTER TABLE [dbo].[tbl_VIDSEventsHistory] ADD  DEFAULT ((0)) FOR [ReviewedStatus]
GO
ALTER TABLE [dbo].[tbl_VIDSEventsHistory] ADD  DEFAULT ((0)) FOR [ReviewedEventTypeId]
GO
ALTER TABLE [dbo].[tbl_VIDSEventsHistory] ADD  DEFAULT ((0)) FOR [ReviewedPlateNumber]
GO
ALTER TABLE [dbo].[tbl_VIDSEventsHistory] ADD  DEFAULT ((0)) FOR [ReviewedVehicleClassId]
GO
ALTER TABLE [dbo].[tbl_VIDSEventsHistory] ADD  DEFAULT ((0)) FOR [ReviewedById]
GO
ALTER TABLE [dbo].[tbl_VIDSEventsHistory] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[tbl_VIDSEventsHistory] ADD  DEFAULT ((0)) FOR [SystemProviderId]
GO
ALTER TABLE [dbo].[tbl_VIDSEventsHistory] ADD  DEFAULT ((0)) FOR [DataSendStatus]
GO
ALTER TABLE [dbo].[tbl_VIDSEventsHistory] ADD  DEFAULT ((0)) FOR [MediaSendStatus]
GO
ALTER TABLE [dbo].[tbl_VMSMessageDetails] ADD  DEFAULT ((10)) FOR [DisplayTimout]
GO
ALTER TABLE [dbo].[tbl_VMSMessageDetails] ADD  DEFAULT ((1)) FOR [DataStatus]
GO
ALTER TABLE [dbo].[tbl_VMSMessageDetails] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[tbl_VMSMessageDetails] ADD  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[tbl_VMSMessageDetails] ADD  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[tbl_VMSMessageDetails] ADD  DEFAULT ((0)) FOR [ModifiedBy]
GO
ALTER TABLE [dbo].[tbl_VMSMessageDetails] ADD  DEFAULT ((0)) FOR [DataSendStatus]
GO
ALTER TABLE [dbo].[tbl_VMSMessageDetails] ADD  DEFAULT ((0)) FOR [MediaSendStatus]
GO
ALTER TABLE [dbo].[tbl_VSDSEventsHistory] ADD  DEFAULT ((-1)) FOR [EventTypeId]
GO
ALTER TABLE [dbo].[tbl_VSDSEventsHistory] ADD  DEFAULT ((0)) FOR [VehicleDirectionId]
GO
ALTER TABLE [dbo].[tbl_VSDSEventsHistory] ADD  DEFAULT ((0)) FOR [IsPlateVisible]
GO
ALTER TABLE [dbo].[tbl_VSDSEventsHistory] ADD  DEFAULT ((0)) FOR [IsFaultyPlate]
GO
ALTER TABLE [dbo].[tbl_VSDSEventsHistory] ADD  DEFAULT ((0)) FOR [IsStandardPlate]
GO
ALTER TABLE [dbo].[tbl_VSDSEventsHistory] ADD  DEFAULT ((0)) FOR [IsWrongDirection]
GO
ALTER TABLE [dbo].[tbl_VSDSEventsHistory] ADD  DEFAULT ((0)) FOR [IsReviewedRequired]
GO
ALTER TABLE [dbo].[tbl_VSDSEventsHistory] ADD  DEFAULT ((0)) FOR [IsRestiredVehicle]
GO
ALTER TABLE [dbo].[tbl_VSDSEventsHistory] ADD  DEFAULT ((0)) FOR [ReviewedStatus]
GO
ALTER TABLE [dbo].[tbl_VSDSEventsHistory] ADD  DEFAULT ((0)) FOR [IsReviewedPlateVisible]
GO
ALTER TABLE [dbo].[tbl_VSDSEventsHistory] ADD  DEFAULT ((0)) FOR [IsReviewedFaultyPlate]
GO
ALTER TABLE [dbo].[tbl_VSDSEventsHistory] ADD  DEFAULT ((0)) FOR [IsReviewedStandardPlate]
GO
ALTER TABLE [dbo].[tbl_VSDSEventsHistory] ADD  DEFAULT ((0)) FOR [IsReviewedWrongDirection]
GO
ALTER TABLE [dbo].[tbl_VSDSEventsHistory] ADD  DEFAULT ((0)) FOR [IsChallanRequired]
GO
ALTER TABLE [dbo].[tbl_VSDSEventsHistory] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[tbl_VSDSEventsHistory] ADD  DEFAULT ((0)) FOR [DataSendStatus]
GO
ALTER TABLE [dbo].[tbl_VSDSEventsHistory] ADD  DEFAULT ((0)) FOR [MediaSendStatus]
GO
ALTER TABLE [dbo].[tbl_VSDSSectionSpeedHistory] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[tbl_VSDSSectionSpeedHistory] ADD  DEFAULT ((0)) FOR [SendStatus]
GO
ALTER TABLE [dbo].[tbl_WeatherEventHistory] ADD  DEFAULT ((0)) FOR [DataSendStatus]
GO
/****** Object:  StoredProcedure [dbo].[USP_ATCCClassReport]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_ATCCClassReport]
@FilterQuery varchar(4000)
AS BEGIN
	DECLARE @VehicleClassCount bigint
	CREATE TABLE #MainData(ChainageNumber varchar(50),EquipmentId bigint,EventDate DateTime,DirectionId Smallint,EquipmentPositionId smallint,
	EquipmentPositionName varchar(20),LaneNumber Smallint,VehicleClassId smallint,VehicleClassName varchar(50),EventImageUrl varchar(255),EventVideoUrl varchar(255))

	CREATE TABLE #TempVehicle(VehicleClassId smallint,VehicleClassName varchar(20),VehicleClassCount bigint default 0,
	VehicleClassPer float default 0,VehicleClassColor varchar(100))

	CREATE TABLE #ChainageNumberMaster(ChainageNumber varchar(20),VehicleCount bigint default 0,
	VehiclePer float default 0,VehicleColor varchar(100))

	CREATE TABLE #EquipmentPositionTypeMaster(EquipmentPositionId smallint,EquipmentPositionName varchar(20),VehicleCount bigint default 0,
	VehiclePer float default 0,VehicleColor varchar(100))

	EXEC('INSERT INTO #MainData(ChainageNumber,EquipmentId,EventDate,DirectionId,EquipmentPositionId,EquipmentPositionName,LaneNumber,VehicleClassId,VehicleClassName,EventImageUrl,EventVideoUrl) 
	SELECT ED.ChainageNumber,H.EquipmentId,H.EventDate,ED.DirectionId,EC.PositionId,PM.EquipmentPositionName,H.LaneNumber,H.VehicleClassId,VC.VehicleClassName,H.VehicleImageUrl,H.VehicleVideoUrl 
	FROM tbl_ATCCEventsHistory H 
	LEFT JOIN tbl_EquipmentDetails ED ON H.EquipmentId=ED.EquipmentId
	LEFT JOIN tbl_EquipmentConfig EC ON H.EquipmentId=EC.EquipmentId
	LEFT JOIN tbl_EquipmentPositionTypeMaster PM ON EC.PositionId=PM.EquipmentPositionId
	LEFT JOIN tbl_PackageDetails PD ON ED.PackageId=PD.PackageId
	LEFT JOIN tbl_ControlRoomMaster CR ON PD.ControlRoomId=CR.ControlRoomId
	LEFT JOIN tbl_VehicleClass VC ON H.VehicleClassId=VC.VehicleClassId '+@FilterQuery+' ORDER BY EventDate DESC')


	INSERT INTO #TempVehicle(VehicleClassId,VehicleClassName,VehicleClassColor)
	SELECT VehicleClassId,VehicleClassName,VehicleClassColor FROM tbl_VehicleClass(nolock) WHERE DataStatus=1 AND VehicleClassId>0

	INSERT INTO #EquipmentPositionTypeMaster(EquipmentPositionName)
	SELECT DISTINCT EquipmentPositionName FROM #MainData

	UPDATE T SET T.VehicleClassCount=V.CNT FROM #TempVehicle T INNER JOIN 
	(
		SELECT VehicleClassId,COUNT(VehicleClassId) AS CNT 
		FROM #MainData
		GROUP BY VehicleClassId
	) V ON T.VehicleClassId=V.VehicleClassId

	SET @VehicleClassCount=0;
	SELECT @VehicleClassCount=SUM(VehicleClassCount) FROM #TempVehicle
		
	IF(@VehicleClassCount>0)
		UPDATE #TempVehicle SET VehicleClassPer=(CONVERT(FLOAT,VehicleClassCount)/CONVERT(FLOAT,@VehicleClassCount))*100 
		WHERE VehicleClassCount<>0

	INSERT INTO #TempVehicle(VehicleClassId,VehicleClassName,VehicleClassCount,VehicleClassPer,VehicleClassColor)
	SELECT 0,'Total',SUM(VehicleClassCount),SUM(VehicleClassPer),'#011b40' FROM #TempVehicle

	SELECT VehicleClassId,VehicleClassName,VehicleClassCount,FORMAT(VehicleClassPer, 'N2') AS VehicleClassPer,VehicleClassColor FROM #TempVehicle
	SELECT EquipmentPositionId,EquipmentPositionName,VehicleCount,FORMAT(VehiclePer, 'N2') AS VehiclePer,VehicleColor  FROM #EquipmentPositionTypeMaster
	SELECT * FROM #MainData

END
--GO
--EXEC USP_ATCCClassReport
--@FilterQuery='WHERE H.EventDate>= CONVERT(DATETIME,''01-Oct-2023 00:00:00'') AND H.EventDate<= CONVERT(DATETIME,''01-Nov-2023 12:45:27'')'
GO
/****** Object:  StoredProcedure [dbo].[USP_ATCCEventReviewUpdate]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_ATCCEventReviewUpdate]
@TransactionId varchar(30),
@ReviewedVehicleClassId smallint,
@ReviewedById bigint,
@ReviewedDateTime datetime
AS
BEGIN
	DECLARE @MenuId smallint=3;
	DECLARE @CVal nvarchar(4000)
	DECLARE @PVal nvarchar(4000)
	CREATE TABLE #Temp(AlertMessage varchar(100))
	DECLARE @cnt int
	BEGIN TRY 
	SELECT @MenuId=MenuId FROM tbl_MenuMaster WHERE MenuURL ='ATCCValidation'
	IF EXISTS(SELECT EquipmentId FROM tbl_ATCCEventsHistory where TransactionId=@TransactionId and ReviewedStatus=1)
	BEGIN
		INSERT INTO #Temp(AlertMessage)
		VALUES('Event already reviewed!')
	END
	SELECT @cnt=COUNT(AlertMessage)  FROM #Temp
	IF(@cnt=0)
		BEGIN

			SET @PVal=(SELECT VehicleClassId
			FROM tbl_ATCCEventsHistory WHERE TransactionId=@TransactionId FOR JSON AUTO, WITHOUT_ARRAY_WRAPPER)	

			UPDATE tbl_ATCCEventsHistory SET ReviewedVehicleClassId=@ReviewedVehicleClassId,ReviewedById=@ReviewedById,
			ReviewedDateTime=@ReviewedDateTime,ReviewedStatus=1
			WHERE TransactionId=@TransactionId

			SET @CVal=(SELECT ReviewedVehicleClassId
			FROM tbl_ATCCEventsHistory WHERE TransactionId=@TransactionId FOR JSON AUTO, WITHOUT_ARRAY_WRAPPER)	
				
			INSERT INTO tbl_ActivityLog(UserId,PrevColumn,CurrentColumn,ActionId,MenuId,CreatedDate)
			VALUES(@ReviewedById,@PVal,@CVal,'Update',@MenuId,@ReviewedDateTime);
			INSERT INTO #Temp(AlertMessage)
		   VALUES('success')	
		END
		END TRY  
	BEGIN CATCH  
		INSERT INTO #Temp(AlertMessage)VALUES('failed');
		EXECUTE USP_ErrorInfoInsert;  
	END CATCH  
		select * from #Temp;
END
GO
/****** Object:  StoredProcedure [dbo].[USP_ATCCEventsGetByFilter]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[USP_ATCCEventsGetByFilter]
@FilterQuery varchar(4000)
AS
	BEGIN
		EXEC('SELECT H.TransactionId,H.EquipmentId,ED.ChainageNumber,ED.DirectionId,EC.PositionId,PD.PackageId,PD.PackageName,H.VehicleColor,
	CR.ControlRoomId,CR.ControlRoomName,H.EventID,H.EventDate,ED.Longitude,ED.Latitude,H.LaneNumber,H.VehicleClassId,VC.VehicleClassName,
	H.VehicleImageUrl,H.VehicleVideoUrl,H.CreatedDate,H.DataSendStatus,H.MediaSendStatus,ClassConfidencelevel,VehicleDirectionId,IsWrongDirection 
	FROM tbl_ATCCEventsHistory H 
	LEFT JOIN tbl_EquipmentDetails ED ON H.EquipmentId=ED.EquipmentId
	LEFT JOIN tbl_EquipmentConfig EC ON H.EquipmentId=EC.EquipmentId
	LEFT JOIN tbl_PackageDetails PD ON ED.PackageId=PD.PackageId
	LEFT JOIN tbl_ControlRoomMaster CR ON PD.ControlRoomId=CR.ControlRoomId
	LEFT JOIN tbl_VehicleClass VC ON H.VehicleClassId=VC.VehicleClassId '+@FilterQuery+' ORDER BY EventDate DESC')
	END
GO
/****** Object:  StoredProcedure [dbo].[USP_ATCCEventsGetByHours]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_ATCCEventsGetByHours]
@Hours smallint=0
AS BEGIN
	 DECLARE @MinDate DateTime
	IF(@Hours=0)
	BEGIN
		SELECT @MinDate=MIN(EventDate) FROM tbl_ATCCEventsHistory 
		SET @MinDate=ISNULL(@MinDate,GETDATE())
	END
	ELSE
	BEGIN
		SELECT @MinDate=MAX(EventDate) FROM tbl_ATCCEventsHistory 
		SET @MinDate=ISNULL(@MinDate,GETDATE())
		SET @MinDate=DATEADD(HOUR,-1*@Hours,@MinDate)
	END

	SELECT H.TransactionId,H.EquipmentId,ED.ChainageNumber,ED.DirectionId,EC.PositionId,PD.PackageId,PD.PackageName,H.VehicleColor,
	CR.ControlRoomId,CR.ControlRoomName,H.EventID,H.EventDate,ED.Longitude,ED.Latitude,H.LaneNumber,H.VehicleClassId,VC.VehicleClassName,
	H.VehicleImageUrl,H.VehicleVideoUrl,H.CreatedDate,H.DataSendStatus,H.MediaSendStatus,ClassConfidencelevel,VehicleDirectionId,IsWrongDirection 
	FROM tbl_ATCCEventsHistory H 
	LEFT JOIN tbl_EquipmentDetails ED ON H.EquipmentId=ED.EquipmentId
	LEFT JOIN tbl_EquipmentConfig EC ON H.EquipmentId=EC.EquipmentId
	LEFT JOIN tbl_PackageDetails PD ON ED.PackageId=PD.PackageId
	LEFT JOIN tbl_ControlRoomMaster CR ON PD.ControlRoomId=CR.ControlRoomId
	LEFT JOIN tbl_VehicleClass VC ON H.VehicleClassId=VC.VehicleClassId
	WHERE EventDate>=@MinDate
	ORDER BY EventDate DESC
END
--GO
--EXEC USP_ATCCEventsGetByHours
GO
/****** Object:  StoredProcedure [dbo].[USP_ATCCEventsInsert]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_ATCCEventsInsert]
@TransactionId varchar(30),
@EquipmentId bigint,
@EventId varchar(255),
@LaneNumber smallint,
@EventDate datetime2(4),
@VehicleClassId smallint,
@VehicleImageUrl varchar(255),
@VehicleVideoUrl varchar(255),
@ClassConfidencelevel decimal(18,2),
@VehicleColor varchar(30),
@VehicleDirectionId smallint,
@IsWrongDirection smallint,
@IsReviewedRequired bit,
@SystemProviderId smallint
AS BEGIN
	CREATE TABLE #Temp(AlertMessage varchar(100))
	BEGIN TRY
		INSERT INTO tbl_ATCCEventsHistory(TransactionId,EquipmentId,EventId,LaneNumber,EventDate,VehicleClassId,VehicleImageUrl,VehicleVideoUrl,
		ClassConfidencelevel,VehicleColor,VehicleDirectionId,IsWrongDirection,IsReviewedRequired,SystemProviderId)
		VALUES(@TransactionId,@EquipmentId,@EventId,@LaneNumber,@EventDate,@VehicleClassId,@VehicleImageUrl,@VehicleVideoUrl,
		@ClassConfidencelevel,@VehicleColor,@VehicleDirectionId,@IsWrongDirection,@IsReviewedRequired,@SystemProviderId)
		INSERT INTO #Temp(AlertMessage)VALUES('success');
	END TRY  
	BEGIN CATCH  
		INSERT INTO #Temp(AlertMessage)VALUES('failed');
		EXECUTE USP_ErrorInfoInsert;  
	END CATCH  
		select * from #Temp;
END
GO
/****** Object:  StoredProcedure [dbo].[USP_ATCCEventsReviewedGetByFilter]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[USP_ATCCEventsReviewedGetByFilter]
@FilterQuery varchar(4000)
AS
	BEGIN
		EXEC('SELECT H.TransactionId,H.EquipmentId,ED.ChainageNumber,ED.DirectionId,EC.PositionId,PD.PackageId,PD.PackageName,H.VehicleColor,
	CR.ControlRoomId,CR.ControlRoomName,H.EventID,H.EventDate,ED.Longitude,ED.Latitude,H.LaneNumber,H.VehicleClassId,VC.VehicleClassName,
	H.VehicleImageUrl,H.VehicleVideoUrl,H.CreatedDate,H.DataSendStatus,H.MediaSendStatus,ClassConfidencelevel,VehicleDirectionId,
	IsWrongDirection,H.ReviewedVehicleClassId,RVC.VehicleClassName AS ReviewedVehicleClassName,H.ReviewedById,RUM.LoginId AS ReviewedByLoginId,
	H.ReviewedDateTime
	FROM tbl_ATCCEventsHistory H 
	LEFT JOIN tbl_EquipmentDetails ED ON H.EquipmentId=ED.EquipmentId
	LEFT JOIN tbl_EquipmentConfig EC ON H.EquipmentId=EC.EquipmentId
	LEFT JOIN tbl_PackageDetails PD ON ED.PackageId=PD.PackageId
	LEFT JOIN tbl_ControlRoomMaster CR ON PD.ControlRoomId=CR.ControlRoomId
	LEFT JOIN tbl_VehicleClass VC ON H.VehicleClassId=VC.VehicleClassId
	LEFT JOIN tbl_VehicleClass RVC ON H.ReviewedVehicleClassId=RVC.VehicleClassId
	LEFT JOIN tbl_UserMaster RUM ON H.ReviewedById=RUM.UserId '+@FilterQuery+' ORDER BY EventDate DESC')
	END
GO
/****** Object:  StoredProcedure [dbo].[USP_ATCCEventsReviewedGetByHours]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_ATCCEventsReviewedGetByHours]
@Hours smallint=0
AS BEGIN
	 DECLARE @MinDate DateTime
	IF(@Hours=0)
	BEGIN
		SELECT @MinDate=MIN(EventDate) FROM tbl_ATCCEventsHistory where ReviewedStatus=1
		SET @MinDate=ISNULL(@MinDate,GETDATE())
	END
	ELSE
	BEGIN
		SELECT @MinDate=MAX(EventDate) FROM tbl_ATCCEventsHistory where ReviewedStatus=1
		SET @MinDate=ISNULL(@MinDate,GETDATE())
		SET @MinDate=DATEADD(HOUR,-1*@Hours,@MinDate)
	END
	SELECT H.TransactionId,H.EquipmentId,ED.ChainageNumber,ED.DirectionId,EC.PositionId,PD.PackageId,PD.PackageName,H.VehicleColor,
	CR.ControlRoomId,CR.ControlRoomName,H.EventID,H.EventDate,ED.Longitude,ED.Latitude,H.LaneNumber,H.VehicleClassId,VC.VehicleClassName,
	H.VehicleImageUrl,H.VehicleVideoUrl,H.CreatedDate,H.DataSendStatus,H.MediaSendStatus,ClassConfidencelevel,VehicleDirectionId,
	IsWrongDirection,H.ReviewedVehicleClassId,RVC.VehicleClassName AS ReviewedVehicleClassName,H.ReviewedById,RUM.LoginId AS ReviewedByLoginId,
	H.ReviewedDateTime
	FROM tbl_ATCCEventsHistory H 
	LEFT JOIN tbl_EquipmentDetails ED ON H.EquipmentId=ED.EquipmentId
	LEFT JOIN tbl_EquipmentConfig EC ON H.EquipmentId=EC.EquipmentId
	LEFT JOIN tbl_PackageDetails PD ON ED.PackageId=PD.PackageId
	LEFT JOIN tbl_ControlRoomMaster CR ON PD.ControlRoomId=CR.ControlRoomId
	LEFT JOIN tbl_VehicleClass VC ON H.VehicleClassId=VC.VehicleClassId
	LEFT JOIN tbl_VehicleClass RVC ON H.ReviewedVehicleClassId=RVC.VehicleClassId
	LEFT JOIN tbl_UserMaster RUM ON H.ReviewedById=RUM.UserId
	WHERE ReviewedDateTime>=@MinDate AND ReviewedStatus=1
	ORDER BY EventDate DESC
	SELECT @MinDate
END
GO
/****** Object:  StoredProcedure [dbo].[USP_ATCCLocationReport]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_ATCCLocationReport]
@FilterQuery varchar(4000)
AS BEGIN
	DECLARE @VehicleClassCount bigint
	CREATE TABLE #MainData(ChainageNumber varchar(50),EquipmentId bigint,EventDate DateTime,DirectionId Smallint,EquipmentPositionId smallint,
	EquipmentPositionName varchar(20),LaneNumber Smallint,VehicleClassId smallint,VehicleClassName varchar(50),EventImageUrl varchar(255),EventVideoUrl varchar(255))

	CREATE TABLE #ChainageNumberMaster(ChainageNumber varchar(20),VehicleCount bigint default 0,
	VehiclePer float default 0,VehicleColor varchar(100))

	CREATE TABLE #EquipmentPositionTypeMaster(EquipmentPositionId smallint,EquipmentPositionName varchar(20),VehicleCount bigint default 0,
	VehiclePer float default 0,VehicleColor varchar(100))

	EXEC('INSERT INTO #MainData(ChainageNumber,EquipmentId,EventDate,DirectionId,EquipmentPositionId,EquipmentPositionName,LaneNumber,VehicleClassId,VehicleClassName,EventImageUrl,EventVideoUrl) 
	SELECT ED.ChainageNumber,H.EquipmentId,H.EventDate,ED.DirectionId,EC.PositionId,PM.EquipmentPositionName,H.LaneNumber,H.VehicleClassId,VC.VehicleClassName,H.VehicleImageUrl,H.VehicleVideoUrl 
	FROM tbl_ATCCEventsHistory H 
	LEFT JOIN tbl_EquipmentDetails ED ON H.EquipmentId=ED.EquipmentId
	LEFT JOIN tbl_EquipmentConfig EC ON H.EquipmentId=EC.EquipmentId
	LEFT JOIN tbl_EquipmentPositionTypeMaster PM ON EC.PositionId=PM.EquipmentPositionId
	LEFT JOIN tbl_PackageDetails PD ON ED.PackageId=PD.PackageId
	LEFT JOIN tbl_ControlRoomMaster CR ON PD.ControlRoomId=CR.ControlRoomId
	LEFT JOIN tbl_VehicleClass VC ON H.VehicleClassId=VC.VehicleClassId '+@FilterQuery+' ORDER BY EventDate DESC')


	INSERT INTO #ChainageNumberMaster(ChainageNumber)
	SELECT DISTINCT ChainageNumber FROM #MainData

	INSERT INTO #EquipmentPositionTypeMaster(EquipmentPositionName)
	SELECT DISTINCT EquipmentPositionName FROM #MainData


	UPDATE T SET T.VehicleCount=V.CNT,VehicleColor='#' +  CONVERT(VARCHAR(max), CRYPT_GEN_RANDOM(3), 2) 
	FROM #ChainageNumberMaster T INNER JOIN 
	(
		SELECT ChainageNumber,COUNT(EquipmentPositionId) AS CNT 
		FROM #MainData
		GROUP BY ChainageNumber
	) V ON T.ChainageNumber=V.ChainageNumber

	SET @VehicleClassCount=0;
	SELECT @VehicleClassCount=SUM(VehicleCount) FROM #ChainageNumberMaster
	IF(@VehicleClassCount>0)
		UPDATE #ChainageNumberMaster SET VehiclePer=(CONVERT(FLOAT,VehicleCount)/CONVERT(FLOAT,@VehicleClassCount))*100 
	
	INSERT INTO #ChainageNumberMaster(ChainageNumber,VehicleCount,VehiclePer,VehicleColor)
	SELECT 'Total',SUM(VehicleCount),SUM(VehiclePer),'#011b40' FROM #ChainageNumberMaster


	SELECT ChainageNumber,VehicleCount,FORMAT(VehiclePer, 'N2') AS VehiclePer,VehicleColor FROM #ChainageNumberMaster
	SELECT EquipmentPositionId,EquipmentPositionName,VehicleCount,FORMAT(VehiclePer, 'N2') AS VehiclePer,VehicleColor  FROM #EquipmentPositionTypeMaster
	SELECT * FROM #MainData

END
--GO
--EXEC USP_ATCCLocationReport
--@FilterQuery='WHERE H.EventDate>= CONVERT(DATETIME,''01-Oct-2023 00:00:00'') AND H.EventDate<= CONVERT(DATETIME,''01-Nov-2023 12:45:27'')'
GO
/****** Object:  StoredProcedure [dbo].[USP_ATCCPendingReviewEventsGetByHours]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_ATCCPendingReviewEventsGetByHours]
@Hours smallint=0
AS BEGIN
	 DECLARE @MinDate DateTime
	IF(@Hours=0)
	BEGIN
		SELECT @MinDate=MIN(EventDate) FROM tbl_ATCCEventsHistory 
		WHERE IsReviewedRequired=1 AND ReviewedStatus=0
		SET @MinDate=ISNULL(@MinDate,GETDATE())
	END
	ELSE
	BEGIN
		SELECT @MinDate=MAX(EventDate) 
		FROM tbl_ATCCEventsHistory WHERE IsReviewedRequired=1 AND ReviewedStatus=0
		SET @MinDate=ISNULL(@MinDate,GETDATE())
		SET @MinDate=DATEADD(HOUR,-1*@Hours,@MinDate)
	END

	SELECT H.TransactionId,H.EquipmentId,ED.ChainageNumber,ED.DirectionId,EC.PositionId,PD.PackageId,PD.PackageName,H.VehicleColor,
	CR.ControlRoomId,CR.ControlRoomName,H.EventID,H.EventDate,ED.Longitude,ED.Latitude,H.LaneNumber,H.VehicleClassId,VC.VehicleClassName,
	H.VehicleImageUrl,H.VehicleVideoUrl,H.CreatedDate,H.DataSendStatus,H.MediaSendStatus,ClassConfidencelevel,VehicleDirectionId,IsWrongDirection  
	FROM tbl_ATCCEventsHistory H 
	LEFT JOIN tbl_EquipmentDetails ED ON H.EquipmentId=ED.EquipmentId
	LEFT JOIN tbl_EquipmentConfig EC ON H.EquipmentId=EC.EquipmentId
	LEFT JOIN tbl_PackageDetails PD ON ED.PackageId=PD.PackageId
	LEFT JOIN tbl_ControlRoomMaster CR ON PD.ControlRoomId=CR.ControlRoomId
	LEFT JOIN tbl_VehicleClass VC ON H.VehicleClassId=VC.VehicleClassId
	WHERE EventDate>=@MinDate AND H.IsReviewedRequired=1 AND H.ReviewedStatus=0
	ORDER BY EventDate DESC
END
GO
/****** Object:  StoredProcedure [dbo].[USP_ATCCPositionReport]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_ATCCPositionReport]
@FilterQuery varchar(4000)
AS BEGIN
	DECLARE @VehicleClassCount bigint
	CREATE TABLE #MainData(ChainageNumber varchar(50),EquipmentId bigint,EventDate DateTime,DirectionId Smallint,EquipmentPositionId smallint,
	EquipmentPositionName varchar(20),LaneNumber Smallint,VehicleClassId smallint,VehicleClassName varchar(50),EventImageUrl varchar(255),EventVideoUrl varchar(255))

	CREATE TABLE #TempVehicle(VehicleClassId smallint,VehicleClassName varchar(20),VehicleClassCount bigint default 0,
	VehicleClassPer float default 0,VehicleClassColor varchar(100))

	CREATE TABLE #ChainageNumberMaster(ChainageNumber varchar(20),VehicleCount bigint default 0,
	VehiclePer float default 0,VehicleColor varchar(100))

	CREATE TABLE #EquipmentPositionTypeMaster(EquipmentPositionId smallint,EquipmentPositionName varchar(20),VehicleCount bigint default 0,
	VehiclePer float default 0,VehicleColor varchar(100))

	EXEC('INSERT INTO #MainData(ChainageNumber,EquipmentId,EventDate,DirectionId,EquipmentPositionId,EquipmentPositionName,LaneNumber,VehicleClassId,VehicleClassName,EventImageUrl,EventVideoUrl) 
	SELECT ED.ChainageNumber,H.EquipmentId,H.EventDate,ED.DirectionId,EC.PositionId,PM.EquipmentPositionName,H.LaneNumber,H.VehicleClassId,VC.VehicleClassName,H.VehicleImageUrl,H.VehicleVideoUrl 
	FROM tbl_ATCCEventsHistory H 
	LEFT JOIN tbl_EquipmentDetails ED ON H.EquipmentId=ED.EquipmentId
	LEFT JOIN tbl_EquipmentConfig EC ON H.EquipmentId=EC.EquipmentId
	LEFT JOIN tbl_EquipmentPositionTypeMaster PM ON EC.PositionId=PM.EquipmentPositionId
	LEFT JOIN tbl_PackageDetails PD ON ED.PackageId=PD.PackageId
	LEFT JOIN tbl_ControlRoomMaster CR ON PD.ControlRoomId=CR.ControlRoomId
	LEFT JOIN tbl_VehicleClass VC ON H.VehicleClassId=VC.VehicleClassId '+@FilterQuery+' ORDER BY EventDate DESC')


	INSERT INTO #EquipmentPositionTypeMaster(EquipmentPositionId,EquipmentPositionName,VehicleColor)
	SELECT EquipmentPositionId,EquipmentPositionName,EquipmentPositionColor FROM tbl_EquipmentConfig C 
	INNER JOIN tbl_EquipmentPositionTypeMaster M 
	ON PositionId=EquipmentPositionId
	WHERE SystemId=2


	UPDATE T SET T.VehicleCount=V.CNT FROM #EquipmentPositionTypeMaster T INNER JOIN 
	(
		SELECT EquipmentPositionId,COUNT(EquipmentPositionId) AS CNT 
		FROM #MainData
		GROUP BY EquipmentPositionId
	) V ON T.EquipmentPositionId=V.EquipmentPositionId

	SET @VehicleClassCount=0;

	SELECT @VehicleClassCount=SUM(VehicleCount) FROM #EquipmentPositionTypeMaster
		
	IF(@VehicleClassCount>0)
		UPDATE #EquipmentPositionTypeMaster SET VehiclePer=(CONVERT(FLOAT,VehicleCount)/CONVERT(FLOAT,@VehicleClassCount))*100 
		WHERE EquipmentPositionId<>0
		
	INSERT INTO #EquipmentPositionTypeMaster(EquipmentPositionId,EquipmentPositionName,VehicleCount,VehiclePer,VehicleColor)
	SELECT 0,'Total',SUM(VehicleCount),SUM(VehiclePer),'#011b40' FROM #EquipmentPositionTypeMaster

	

	SELECT EquipmentPositionId,EquipmentPositionName,VehicleCount,FORMAT(VehiclePer, 'N2') AS VehiclePer,VehicleColor FROM #EquipmentPositionTypeMaster
	SELECT * FROM #MainData

END
--GO
--EXEC USP_ATCCPositionReport
--@FilterQuery='WHERE H.EventDate>= CONVERT(DATETIME,''01-Oct-2023 00:00:00'') AND H.EventDate<= CONVERT(DATETIME,''01-Nov-2023 12:45:27'')'
GO
/****** Object:  StoredProcedure [dbo].[USP_ATCCSummeryReport]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_ATCCSummeryReport]
@FilterQuery varchar(4000)
AS BEGIN
	DECLARE @VehicleClassCount bigint
	CREATE TABLE #MainData(ChainageNumber varchar(50),EquipmentId bigint,EventDate DateTime,DirectionId Smallint,EquipmentPositionId smallint,
	LaneNumber Smallint,VehicleClassId smallint,EventImageUrl varchar(255),EventVideoUrl varchar(255))
	
	EXEC('INSERT INTO #MainData(ChainageNumber,EquipmentId,EventDate,DirectionId,EquipmentPositionId,LaneNumber,VehicleClassId,EventImageUrl,EventVideoUrl) 
	SELECT ED.ChainageNumber,H.EquipmentId,H.EventDate,ED.DirectionId,EC.PositionId,H.LaneNumber,H.VehicleClassId,H.VehicleImageUrl,H.VehicleVideoUrl 
	FROM tbl_ATCCEventsHistory H 
	LEFT JOIN tbl_EquipmentDetails ED ON H.EquipmentId=ED.EquipmentId
	LEFT JOIN tbl_EquipmentConfig EC ON H.EquipmentId=EC.EquipmentId
	LEFT JOIN tbl_PackageDetails PD ON ED.PackageId=PD.PackageId
	LEFT JOIN tbl_ControlRoomMaster CR ON PD.ControlRoomId=CR.ControlRoomId
	LEFT JOIN tbl_VehicleClass VC ON H.VehicleClassId=VC.VehicleClassId '+@FilterQuery+' ORDER BY EventDate DESC')


	CREATE TABLE #TempVehicle(VehicleClassId smallint,VehicleClassName varchar(20),VehicleClassCount bigint default 0,
	VehicleClassPer float default 0,VehicleClassColor varchar(100))

	CREATE TABLE #EquipmentPositionTypeMaster(EquipmentPositionId smallint,EquipmentPositionName varchar(20),VehicleCount bigint default 0,
	VehiclePer float default 0,VehicleColor varchar(100))

	CREATE TABLE #ChainageNumberMaster(ChainageNumber varchar(20),VehicleCount bigint default 0,
	VehiclePer float default 0,VehicleColor varchar(100))


	INSERT INTO #TempVehicle(VehicleClassId,VehicleClassName,VehicleClassColor)
	SELECT VehicleClassId,VehicleClassName,VehicleClassColor FROM tbl_VehicleClass(nolock) WHERE DataStatus=1 AND VehicleClassId>0

	UPDATE T SET T.VehicleClassCount=V.CNT FROM #TempVehicle T INNER JOIN 
	(
		SELECT VehicleClassId,COUNT(VehicleClassId) AS CNT 
		FROM #MainData
		GROUP BY VehicleClassId
	) V ON T.VehicleClassId=V.VehicleClassId

	SET @VehicleClassCount=0;
	SELECT @VehicleClassCount=SUM(VehicleClassCount) FROM #TempVehicle
		
	IF(@VehicleClassCount>0)
		UPDATE #TempVehicle SET VehicleClassPer=(CONVERT(FLOAT,VehicleClassCount)/CONVERT(FLOAT,@VehicleClassCount))*100 
		WHERE VehicleClassCount<>0
		
	INSERT INTO #TempVehicle(VehicleClassId,VehicleClassName,VehicleClassCount,VehicleClassPer,VehicleClassColor)
	SELECT 0,'Total',SUM(VehicleClassCount),SUM(VehicleClassPer),'#011b40' FROM #TempVehicle
	

		
	INSERT INTO #EquipmentPositionTypeMaster(EquipmentPositionId,EquipmentPositionName,VehicleColor)
	SELECT EquipmentPositionId,EquipmentPositionName,EquipmentPositionColor FROM tbl_EquipmentConfig C INNER JOIN tbl_EquipmentPositionTypeMaster M 
	ON PositionId=EquipmentPositionId
	WHERE SystemId=2


	UPDATE T SET T.VehicleCount=V.CNT FROM #EquipmentPositionTypeMaster T INNER JOIN 
	(
		SELECT EquipmentPositionId,COUNT(EquipmentPositionId) AS CNT 
		FROM #MainData
		GROUP BY EquipmentPositionId
	) V ON T.EquipmentPositionId=V.EquipmentPositionId

	SET @VehicleClassCount=0;

	SELECT @VehicleClassCount=SUM(VehicleCount) FROM #EquipmentPositionTypeMaster
		
	IF(@VehicleClassCount>0)
		UPDATE #EquipmentPositionTypeMaster SET VehiclePer=(CONVERT(FLOAT,VehicleCount)/CONVERT(FLOAT,@VehicleClassCount))*100 
		WHERE EquipmentPositionId<>0
		
	INSERT INTO #EquipmentPositionTypeMaster(EquipmentPositionId,EquipmentPositionName,VehicleCount,VehiclePer,VehicleColor)
	SELECT 0,'Total',SUM(VehicleCount),SUM(VehiclePer),'#011b40' FROM #EquipmentPositionTypeMaster
	
	INSERT INTO #ChainageNumberMaster(ChainageNumber)
	SELECT  DISTINCT ChainageNumber
	FROM tbl_EquipmentDetails WHERE SystemId=2

	UPDATE T SET T.VehicleCount=V.CNT,VehicleColor='#' +  CONVERT(VARCHAR(max), CRYPT_GEN_RANDOM(3), 2) 
	FROM #ChainageNumberMaster T INNER JOIN 
	(
		SELECT ChainageNumber,COUNT(EquipmentPositionId) AS CNT 
		FROM #MainData
		GROUP BY ChainageNumber
	) V ON T.ChainageNumber=V.ChainageNumber

	SET @VehicleClassCount=0;
	SELECT @VehicleClassCount=SUM(VehicleCount) FROM #ChainageNumberMaster
	IF(@VehicleClassCount>0)
		UPDATE #ChainageNumberMaster SET VehiclePer=(CONVERT(FLOAT,VehicleCount)/CONVERT(FLOAT,@VehicleClassCount))*100 
	
	INSERT INTO #ChainageNumberMaster(ChainageNumber,VehicleCount,VehiclePer,VehicleColor)
	SELECT 'Total',SUM(VehicleCount),SUM(VehiclePer),'#011b40' FROM #ChainageNumberMaster


	SELECT VehicleClassId,VehicleClassName,VehicleClassCount,FORMAT(VehicleClassPer, 'N2') AS VehicleClassPer,VehicleClassColor FROM #TempVehicle
	SELECT EquipmentPositionId,EquipmentPositionName,VehicleCount,FORMAT(VehiclePer, 'N2') AS VehiclePer,VehicleColor  FROM #EquipmentPositionTypeMaster
	SELECT ChainageNumber,VehicleCount,FORMAT(VehiclePer, 'N2') AS VehiclePer,VehicleColor FROM #ChainageNumberMaster
	SELECT * FROM #MainData
END
--GO
--EXEC USP_ATCCSummeryReport
--@FilterQuery='WHERE H.EventDate>= CONVERT(DATETIME,''01-Oct-2023 00:00:00'') AND H.EventDate<= CONVERT(DATETIME,''01-Nov-2023 12:45:27'')'
GO
/****** Object:  StoredProcedure [dbo].[USP_ControlRoomGetAll]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_ControlRoomGetAll]
AS BEGIN
	SELECT * FROM tbl_ControlRoomMaster
END
GO
/****** Object:  StoredProcedure [dbo].[USP_ControlRoomGetById]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_ControlRoomGetById]
@ControlRoomId bigint
AS BEGIN
	SELECT * FROM tbl_ControlRoomMaster
	WHERE ControlRoomId=@ControlRoomId
END
GO
/****** Object:  StoredProcedure [dbo].[USP_ControlRoomInsertUpdate]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_ControlRoomInsertUpdate] 
@ControlRoomId bigint,
@ControlRoomName varchar(200),
@ChainageNumber decimal(16, 3),
@Latitude decimal(12, 9),
@Longitude decimal(12, 9),
@DirectionId smallint,
@DataStatus smallint,
@UserId bigint,
@CDateTime DateTime

AS
BEGIN
	DECLARE @MenuId smallint=3;
	DECLARE @CVal nvarchar(4000)
	DECLARE @PVal nvarchar(4000)
	CREATE TABLE #Temp(AlertMessage varchar(100))
	DECLARE @cnt int
	BEGIN TRY 
	SELECT @MenuId=MenuId FROM tbl_MenuMaster WHERE MenuName ='Control Room'
	IF EXISTS(SELECT ControlRoomId FROM tbl_ControlRoomMaster where ControlRoomName=@ControlRoomName and ControlRoomId<>@ControlRoomId)
		BEGIN
			INSERT INTO #Temp(AlertMessage)
			VALUES('Control room name already exists!')
		END
	
	IF EXISTS(SELECT ControlRoomId FROM tbl_ControlRoomMaster where ChainageNumber=@ChainageNumber and ControlRoomId<>@ControlRoomId)
		BEGIN
			INSERT INTO #Temp(AlertMessage)
			VALUES('Chainage Number name already exists!')
		END

	IF EXISTS(SELECT ControlRoomId FROM tbl_ControlRoomMaster where Latitude=@Latitude and Longitude=@Longitude and ControlRoomId<>@ControlRoomId)
		BEGIN
			INSERT INTO #Temp(AlertMessage)
			VALUES('Control Coordinates name already exists!')
		END
	SELECT @cnt=COUNT(AlertMessage)  FROM #Temp
	IF(@cnt=0)
		BEGIN
			IF(@ControlRoomId=0)
			BEGIN
				insert into tbl_ControlRoomMaster(ControlRoomName,ChainageNumber,Latitude,Longitude,DirectionId,DataStatus,CreatedDate,CreatedBy)
				values(@ControlRoomName,@ChainageNumber,@Latitude,@Longitude,@DirectionId,@DataStatus,@CDateTime,@UserId);
				SELECT @ControlRoomId=@@IDENTITY

				SET @CVal=(SELECT * FROM tbl_ControlRoomMaster WHERE ControlRoomId=@ControlRoomId FOR JSON AUTO, WITHOUT_ARRAY_WRAPPER)		
				
				INSERT INTO tbl_ActivityLog(UserId,CurrentColumn,ActionId,MenuId,CreatedDate)
				VALUES(@UserId,@CVal,'Insert',@MenuId,@CDateTime);
				
				INSERT INTO #Temp(AlertMessage)VALUES('success');
			END
			ELSE
			BEGIN
				
				SET @PVal=(SELECT * FROM tbl_ControlRoomMaster WHERE ControlRoomId=@ControlRoomId FOR JSON AUTO, WITHOUT_ARRAY_WRAPPER)	
				
				UPDATE tbl_ControlRoomMaster SET ControlRoomName=@ControlRoomName,
				ChainageNumber=@ChainageNumber,Latitude=@Latitude,Longitude=@Longitude,DirectionId=@DirectionId,
				DataStatus=@DataStatus,ModifiedDate=@CDateTime,ModifiedBy=@UserId
				WHERE ControlRoomId=@ControlRoomId
				
				SET @CVal=(SELECT * FROM tbl_ControlRoomMaster WHERE ControlRoomId=@ControlRoomId FOR JSON AUTO, WITHOUT_ARRAY_WRAPPER)		

				INSERT INTO tbl_ActivityLog(UserId,PrevColumn,CurrentColumn,ActionId,MenuId,CreatedDate)
				VALUES(@UserId,@PVal,@CVal,'Update',@MenuId,@CDateTime);

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
/****** Object:  StoredProcedure [dbo].[USP_DashboardATCCData]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_DashboardATCCData]
AS BEGIN
	DECLARE @StartEventDate Datetime,@EndEventDate Datetime;
	DECLARE @EventDate Datetime;
	DECLARE @IsATCCIndependently bit;
	DECLARE @ATCCByVSDS bit;
    DECLARE @ATCCByVIDS bit;
    DECLARE @TotalLane smallint;
	SELECT @EventDate=MAX(EventDate) FROM tbl_ATCCEventsHistory (nolock);
	SET @EventDate=ISNULL(@EventDate,GETDATE())
	SELECT @StartEventDate=StartDateTime,@EndEventDate=EndDateTime FROM fnc_Get24HourDate(@EventDate)

	CREATE TABLE #TempDir(DirectionId bigint)
	
	CREATE TABLE #TempVehicle(VehicleClassId smallint,VehicleClassName varchar(20),VehicleClassIcon varchar(50),AllowedSpeed Decimal(18,2))
	
	CREATE TABLE #TempLaneConfig(LaneNumber smallint,AllowedClassIds varchar(20),AllowedSpeed decimal(10, 2))



	CREATE TABLE #EquipmentDetails(EquipmentId bigint,ChainageNumber decimal(16,3),IpAddress varchar(30),EquipmentTypeName varchar(30),
	EquipmentName varchar(50),LaneNumber smallint,DirectionId smallint,Latitude varchar(50),Longitude varchar(50))
	
	CREATE TABLE #MasterTrafficeCount(StartDateTime dateTime,EndDateTime dateTime,EventDate Date, SlotStartTime char(2),SlotEndTime char(2), 
	EventCount bigint DEFAULT 0,DirectionId smallint,ChainageNumber decimal(16,3),VehicleClassId smallint,LaneNumber smallint)

	CREATE TABLE #HourlyIncident(StartDateTime dateTime,EndDateTime dateTime,EventDate Date, SlotStartTime char(2),SlotEndTime char(2))


	CREATE TABLE #MainData(ChainageNumber varchar(50),EquipmentIP varchar(50),TransactionId bigint,EventDate DateTime,DirectionId Smallint,
	LaneNumber Smallint,VehicleClassId smallint,VehicleClassName varchar(50),EventImageUrl varchar(255),EventVideoUrl varchar(255),
	Latitude varchar(50),Longitude varchar(50))

	CREATE TABLE #EventTypeDetails(EventTypeId smallint,EventTypeName varchar(50),EquipmentIP varchar(30),EquipmentTypeName varchar(30),
	EquipmentName varchar(50),EventCount int default 0,LastUpdated DateTime,DirectionId smallint,ChainageNumber varchar(50),Latitude varchar(50),
	Longitude varchar(50)) 

	CREATE TABLE #TempChainageNumber(ChainageNumber decimal(16,3))


	CREATE TABLE #TempHourTraffic(StartDateTime dateTime,EndDateTime dateTime,EventDate Date, SlotStartTime char(2),SlotEndTime char(2),ChainageNumber decimal(16,3),LEventCount bigint default 0,REventCount bigint default 0,EventCount bigint default 0)
	CREATE TABLE #TempLocationTraffice(ChainageNumber decimal(16,3),LEventCount bigint default 0,REventCount bigint default 0,EventCount bigint default 0)
	CREATE TABLE #TempClassWiseTraffice(ChainageNumber decimal(16,3),VehicleClassId smallint,VehicleClassName varchar(50),VehicleClassIcon varchar(50),LEventCount bigint default 0,REventCount bigint default 0,EventCount bigint default 0)
	CREATE TABLE #TempLaneWiseTraffice(ChainageNumber decimal(16,3),LaneNumber smallint,LEventCount bigint default 0,REventCount bigint default 0,EventCount bigint default 0)
	CREATE TABLE #TempLaneClassWiseTraffice(ChainageNumber decimal(16,3),VehicleClassId smallint,VehicleClassName varchar(50),VehicleClassIcon varchar(50),LaneNumber smallint,LEventCount bigint default 0,REventCount bigint default 0,EventCount bigint default 0)


	INSERT INTO #TempDir(DirectionId) VALUES(1)
	INSERT INTO #TempDir(DirectionId) VALUES(2)
	
	INSERT INTO #TempLaneConfig(LaneNumber,AllowedClassIds,AllowedSpeed)
	SELECT LaneNumber,AllowedClassIds,AllowedSpeed FROM tbl_LaneConfig WHERE DataStatus=1

	INSERT INTO #TempVehicle(VehicleClassId,VehicleClassName,VehicleClassIcon,AllowedSpeed)
	SELECT VehicleClassId,VehicleClassName,VehicleClassIcon,AllowedSpeed FROM tbl_VehicleClass(nolock)
	WHERE DataStatus=1 

	SELECT @IsATCCIndependently=IsATCCIndependently,@ATCCByVSDS=ATCCByVSDS,@ATCCByVIDS=ATCCByVIDS,@TotalLane=TotalLane FROM tbl_SystemSetting

	IF(@IsATCCIndependently=1)
	BEGIN
		INSERT INTO #EquipmentDetails(EquipmentId,ChainageNumber,IpAddress,EquipmentTypeName,EquipmentName,LaneNumber,DirectionId,Latitude,Longitude)
		SELECT D.EquipmentId,ChainageNumber,IpAddress,T.EquipmentTypeName,D.EquipmentName,0 AS LaneNumber,DirectionId,Latitude,Longitude
		FROM tbl_EquipmentDetails(nolock) D 
		INNER JOIN tbl_EquipmentTypeMaster(nolock) T ON D.EquipmentTypeId=T.EquipmentTypeId
		WHERE D.DataStatus=1 AND D.SystemId=2
	END
	ELSE 
	BEGIN
		IF(@ATCCByVSDS=1 AND @ATCCByVIDS=1)
		BEGIN
			INSERT INTO #EquipmentDetails(EquipmentId,ChainageNumber,IpAddress,EquipmentTypeName,EquipmentName,LaneNumber,DirectionId,Latitude,Longitude)
			SELECT D.EquipmentId,ChainageNumber,IpAddress,T.EquipmentTypeName,D.EquipmentName,0 AS LaneNumber,DirectionId,Latitude,Longitude
			FROM tbl_EquipmentDetails(nolock) D 
			INNER JOIN tbl_EquipmentTypeMaster(nolock) T ON D.EquipmentTypeId=T.EquipmentTypeId
			WHERE D.DataStatus=1 AND D.SystemId IN (8,6)
		END
		ELSE IF (@ATCCByVIDS=1)
		BEGIN
			INSERT INTO #EquipmentDetails(EquipmentId,ChainageNumber,IpAddress,EquipmentTypeName,EquipmentName,LaneNumber,DirectionId,Latitude,Longitude)
			SELECT D.EquipmentId,ChainageNumber,IpAddress,T.EquipmentTypeName,D.EquipmentName,0 AS LaneNumber,DirectionId,Latitude,Longitude
			FROM tbl_EquipmentDetails(nolock) D 
			INNER JOIN tbl_EquipmentTypeMaster(nolock) T ON D.EquipmentTypeId=T.EquipmentTypeId
			WHERE D.DataStatus=1 AND D.SystemId IN (6)
		END
		ELSE IF (@ATCCByVSDS=1)
		BEGIN
			INSERT INTO #EquipmentDetails(EquipmentId,ChainageNumber,IpAddress,EquipmentTypeName,EquipmentName,LaneNumber,DirectionId,Latitude,Longitude)
			SELECT D.EquipmentId,ChainageNumber,IpAddress,T.EquipmentTypeName,D.EquipmentName,0 AS LaneNumber,DirectionId,Latitude,Longitude
			FROM tbl_EquipmentDetails(nolock) D 
			INNER JOIN tbl_EquipmentTypeMaster(nolock) T ON D.EquipmentTypeId=T.EquipmentTypeId
			WHERE D.DataStatus=1 AND D.SystemId IN (8)
		END
	END
	
	INSERT INTO #HourlyIncident(StartDateTime,EndDateTime)
	SELECT * FROM fnc_Get24HourList(@StartEventDate,@EndEventDate,1)
	
	
	UPDATE #HourlyIncident SET EventDate=StartDateTime,SlotStartTime=FORMAT(StartDateTime,'HH'),SlotEndTime=FORMAT(EndDateTime,'HH')

	INSERT INTO #MainData(ChainageNumber,EquipmentIP,DirectionId,LaneNumber,TransactionId,VehicleClassId,VehicleClassName,EventDate,EventImageUrl,EventVideoUrl)
	SELECT D.ChainageNumber,D.IpAddress,D.DirectionId,H.LaneNumber,H.TransactionId,H.VehicleClassId,V.VehicleClassName,H.EventDate,H.VehicleImageUrl,H.VehicleVideoUrl
	from tbl_ATCCEventsHistory(nolock) H 
	INNER JOIN #EquipmentDetails D ON H.EquipmentId=D.EquipmentId
	LEFT JOIN #TempVehicle V ON H.VehicleClassId=V.VehicleClassId
	WHERE CONVERT(DATE,EventDate) >= CONVERT(DATE,@StartEventDate) 
	AND CONVERT(DATE,EventDate) <= CONVERT(DATE,@EndEventDate)
	ORDER BY EventDate DESC;
	
	INSERT INTO #TempChainageNumber(ChainageNumber)
	SELECT DISTINCT ChainageNumber FROM #EquipmentDetails
	

	INSERT INTO #MasterTrafficeCount(StartDateTime,EndDateTime,EventDate,SlotStartTime,SlotEndTime,DirectionId,ChainageNumber,VehicleClassId,LaneNumber)
	SELECT StartDateTime,EndDateTime,EventDate,SlotStartTime,SlotEndTime,DirectionId,ChainageNumber,VehicleClassId,LaneNumber 
	FROM #HourlyIncident T 
	INNER JOIN #TempChainageNumber ON 1=1
	INNER JOIN #TempVehicle ON 1=1
	INNER JOIN #TempLaneConfig ON 1=1
	INNER JOIN #TempDir D ON 1=1 where ISNULL(T.EndDateTime,'')<>''


	INSERT INTO #TempHourTraffic(StartDateTime,EndDateTime,EventDate,SlotStartTime,SlotEndTime,ChainageNumber)
	SELECT StartDateTime,EndDateTime,EventDate,SlotStartTime,SlotEndTime,ChainageNumber 
	FROM #HourlyIncident T 
	INNER JOIN #TempChainageNumber ON 1=1
	where ISNULL(T.EndDateTime,'')<>''
	
	UPDATE T SET T.LEventCount=V.VehicleCount FROM #TempHourTraffic T INNER JOIN
	(
		SELECT T.StartDateTime,T.EndDateTime,D.ChainageNumber,COUNT(D.VehicleClassId) AS VehicleCount
		FROM #MainData D INNER JOIN #TempHourTraffic T ON D.ChainageNumber=T.ChainageNumber 
		AND D.EventDate>=T.StartDateTime AND D.EventDate<T.EndDateTime
		WHERE D.DirectionId=1
		GROUP BY T.StartDateTime,T.EndDateTime,D.ChainageNumber
	) V ON T.ChainageNumber=V.ChainageNumber 
	AND T.StartDateTime=V.StartDateTime AND T.EndDateTime=V.EndDateTime
	
	UPDATE T SET T.REventCount=V.VehicleCount FROM #TempHourTraffic T INNER JOIN
	(
		SELECT T.StartDateTime,T.EndDateTime,D.ChainageNumber,COUNT(D.VehicleClassId) AS VehicleCount
		FROM #MainData D INNER JOIN #TempHourTraffic T ON D.ChainageNumber=T.ChainageNumber 
		AND D.EventDate>=T.StartDateTime AND D.EventDate<T.EndDateTime
		WHERE D.DirectionId=2
		GROUP BY T.StartDateTime,T.EndDateTime,D.ChainageNumber
	) V ON T.ChainageNumber=V.ChainageNumber 
	AND T.StartDateTime=V.StartDateTime AND T.EndDateTime=V.EndDateTime

	UPDATE #TempHourTraffic SET EventCount=LEventCount+REventCount;


	INSERT INTO #TempLocationTraffice(ChainageNumber)
	SELECT ChainageNumber FROM #TempChainageNumber 

	UPDATE T SET T.LEventCount=V.VehicleCount FROM #TempLocationTraffice T INNER JOIN
	(
		SELECT ChainageNumber,COUNT(1) AS VehicleCount FROM #MainData
		WHERE DirectionId=2
		GROUP BY ChainageNumber
	) V ON T.ChainageNumber=V.ChainageNumber 
	UPDATE T SET T.REventCount=V.VehicleCount FROM #TempLocationTraffice T INNER JOIN
	(
		SELECT ChainageNumber,COUNT(1) AS VehicleCount FROM #MainData
		WHERE DirectionId=2
		GROUP BY ChainageNumber
	) V ON T.ChainageNumber=V.ChainageNumber 

	UPDATE #TempLocationTraffice SET EventCount=LEventCount+REventCount;
	
	INSERT INTO #TempClassWiseTraffice(ChainageNumber,VehicleClassId,VehicleClassName,VehicleClassIcon)
	SELECT ChainageNumber,VehicleClassId,VehicleClassName,VehicleClassIcon FROM #TempChainageNumber 
	INNER JOIN #TempVehicle ON 1=1

	UPDATE T SET T.LEventCount=V.VehicleCount FROM #TempClassWiseTraffice T INNER JOIN
	(
		SELECT ChainageNumber,VehicleClassId,COUNT(1) AS VehicleCount FROM #MainData
		WHERE DirectionId=1
		GROUP BY ChainageNumber,VehicleClassId
	) V ON T.ChainageNumber=V.ChainageNumber AND T.VehicleClassId=V.VehicleClassId

	UPDATE T SET T.REventCount=V.VehicleCount FROM #TempClassWiseTraffice T INNER JOIN
	(
		SELECT ChainageNumber,VehicleClassId,COUNT(1) AS VehicleCount FROM #MainData
		WHERE DirectionId=2
		GROUP BY ChainageNumber,VehicleClassId
	) V ON T.ChainageNumber=V.ChainageNumber AND T.VehicleClassId=V.VehicleClassId
	UPDATE T SET T.LEventCount=V.LEventCount,T.REventCount=V.REventCount,VehicleClassName='Total' FROM #TempClassWiseTraffice T 
	INNER JOIN 
	(
		SELECT SUM(LEventCount) LEventCount,SUM(REventCount) REventCount,0 VehicleClassId FROM #TempClassWiseTraffice  
		WHERE VehicleClassId<>0
	) V ON T.VehicleClassId=V.VehicleClassId


	UPDATE #TempClassWiseTraffice SET EventCount=LEventCount+REventCount;

	INSERT INTO #TempLaneWiseTraffice(ChainageNumber,LaneNumber)
	SELECT ChainageNumber,LaneNumber FROM #TempChainageNumber 
	INNER JOIN #TempLaneConfig ON 1=1

	UPDATE T SET T.LEventCount=V.VehicleCount FROM #TempLaneWiseTraffice T INNER JOIN
	(
		SELECT ChainageNumber,LaneNumber,COUNT(1) AS VehicleCount FROM #MainData
		WHERE DirectionId=1
		GROUP BY ChainageNumber,LaneNumber
	) V ON T.ChainageNumber=V.ChainageNumber AND T.LaneNumber=V.LaneNumber

	UPDATE T SET T.REventCount=V.VehicleCount FROM #TempLaneWiseTraffice T INNER JOIN
	(
		SELECT ChainageNumber,LaneNumber,COUNT(1) AS VehicleCount FROM #MainData
		WHERE DirectionId=2
		GROUP BY ChainageNumber,LaneNumber
	) V ON T.ChainageNumber=V.ChainageNumber AND T.LaneNumber=V.LaneNumber

	UPDATE #TempLaneWiseTraffice SET EventCount=LEventCount+REventCount;


	INSERT INTO #TempLaneClassWiseTraffice(ChainageNumber,VehicleClassId,VehicleClassName,VehicleClassIcon,LaneNumber)
	SELECT ChainageNumber,VehicleClassId,VehicleClassName,VehicleClassIcon,LaneNumber FROM #TempChainageNumber 
	INNER JOIN #TempVehicle ON 1=1
	INNER JOIN #TempLaneConfig ON 1=1

	UPDATE T SET T.LEventCount=V.VehicleCount FROM #TempLaneClassWiseTraffice T INNER JOIN
	(
		SELECT ChainageNumber,VehicleClassId,LaneNumber,COUNT(1) AS VehicleCount FROM #MainData
		WHERE DirectionId=1
		GROUP BY ChainageNumber,VehicleClassId,LaneNumber
	) V ON T.ChainageNumber=V.ChainageNumber AND T.VehicleClassId=V.VehicleClassId AND T.LaneNumber=V.LaneNumber

	UPDATE T SET T.REventCount=V.VehicleCount FROM #TempLaneClassWiseTraffice T INNER JOIN
	(
		SELECT ChainageNumber,VehicleClassId,LaneNumber,COUNT(1) AS VehicleCount FROM #MainData
		WHERE DirectionId=2
		GROUP BY ChainageNumber,VehicleClassId,LaneNumber
	) V ON T.ChainageNumber=V.ChainageNumber AND T.VehicleClassId=V.VehicleClassId AND T.LaneNumber=V.LaneNumber

	UPDATE #TempLaneClassWiseTraffice SET EventCount=LEventCount+REventCount;


	SELECT StartDateTime,EndDateTime,EventDate,SlotStartTime,SlotEndTime,ChainageNumber,LEventCount,REventCount,EventCount 
	FROM #TempHourTraffic
	SELECT ChainageNumber,LEventCount,REventCount,EventCount FROM #TempLocationTraffice
	SELECT ChainageNumber,VehicleClassId,VehicleClassName,VehicleClassIcon,LEventCount,REventCount,EventCount FROM #TempClassWiseTraffice
	SELECT ChainageNumber,LaneNumber,LEventCount,REventCount,EventCount FROM #TempLaneWiseTraffice
	SELECT ChainageNumber,VehicleClassId,VehicleClassName,VehicleClassIcon,LaneNumber,LEventCount,REventCount,EventCount FROM #TempLaneClassWiseTraffice
	
END
--Go
--EXEC USP_DashboardATCCData
GO
/****** Object:  StoredProcedure [dbo].[USP_DashboardEquipmentDetailsGetAll]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_DashboardEquipmentDetailsGetAll]
AS BEGIN
	DECLARE @DefaultControlRoomId smallint
	SELECT @DefaultControlRoomId=DefaultControlRoomId FROM tbl_SystemSetting;
	SET @DefaultControlRoomId=ISNULL(@DefaultControlRoomId,0);
	IF(@DefaultControlRoomId=0)
	BEGIN
		SELECT ED.EquipmentId,ED.PackageId,ED.EquipmentTypeId,ED.SystemId,ED.EquipmentName,ED.DirectionId,
		ED.ProtocolTypeId,ED.IpAddress,ED.PortNumber,ED.LoginId,ED.[Password],ED.ChainageNumber,ED.Latitude,
		ED.Longitude,ED.MacAddress,ED.ModelNumber,ED.SerialNumber,ED.ManufacturerDetail,ED.VendorDetail,ED.ManufacturerDate,
		ED.PurchageDate,ED.WarrantyExpireDate,ED.OnLineStatus,ED.DataStatus,ED.CreatedDate,ED.CreatedBy,
		ED.ModifiedDate,ED.ModifiedBy,CR.ControlRoomId,CR.ControlRoomName,PD.PackageName,ET.EquipmentTypeName,ET.EquipmentIconName,
		ET.EquipmentCategoryTypeId,ET.EquipmentConnectionTypeId,SM.SystemName,SM.SystemDescription 
		FROM tbl_EquipmentDetails ED 
		INNER JOIN tbl_PackageDetails PD ON ED.PackageId=PD.PackageId AND PD.DataStatus=1
		INNER JOIN tbl_ControlRoomMaster CR ON PD.ControlRoomId=CR.ControlRoomId AND CR.DataStatus=1
		INNER JOIN tbl_EquipmentTypeMaster ET ON ED.EquipmentTypeId=ET.EquipmentTypeId AND ET.DataStatus=1
		INNER JOIN tbl_SystemMaster SM ON ED.SystemId=SM.SystemId AND SM.DataStatus=1
		WHERE ED.DataStatus=1 AND ED.EquipmentTypeId IN (1,2,4,8,25,26,32)
	END
	ELSE
	BEGIN
		SELECT ED.EquipmentId,ED.PackageId,ED.EquipmentTypeId,ED.SystemId,ED.EquipmentName,ED.DirectionId,
		ED.ProtocolTypeId,ED.IpAddress,ED.PortNumber,ED.LoginId,ED.[Password],ED.ChainageNumber,ED.Latitude,
		ED.Longitude,ED.MacAddress,ED.ModelNumber,ED.SerialNumber,ED.ManufacturerDetail,ED.VendorDetail,ED.ManufacturerDate,
		ED.PurchageDate,ED.WarrantyExpireDate,ED.OnLineStatus,ED.DataStatus,ED.CreatedDate,ED.CreatedBy,
		ED.ModifiedDate,ED.ModifiedBy,CR.ControlRoomId,CR.ControlRoomName,PD.PackageName,ET.EquipmentTypeName,ET.EquipmentIconName,
		ET.EquipmentCategoryTypeId,ET.EquipmentConnectionTypeId,SM.SystemName,SM.SystemDescription 
		FROM tbl_EquipmentDetails ED 
		INNER JOIN tbl_PackageDetails PD ON ED.PackageId=PD.PackageId AND PD.DataStatus=1
		INNER JOIN tbl_ControlRoomMaster CR ON PD.ControlRoomId=CR.ControlRoomId AND CR.DataStatus=1
		INNER JOIN tbl_EquipmentTypeMaster ET ON ED.EquipmentTypeId=ET.EquipmentTypeId AND ET.DataStatus=1
		INNER JOIN tbl_SystemMaster SM ON ED.SystemId=SM.SystemId AND SM.DataStatus=1
		WHERE ED.DataStatus=1 AND ED.EquipmentTypeId IN (1,2,4,8,25,26,32) AND CR.ControlRoomId=@DefaultControlRoomId
	END

	SELECT * FROM tbl_EquipmentTypeMaster WHERE EquipmentTypeId IN (1,2,4,8,25,32)
END
GO
/****** Object:  StoredProcedure [dbo].[USP_DashboardVIDSData]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[USP_DashboardVIDSData]
AS BEGIN
    DECLARE @StartEventDate Datetime,@EndEventDate Datetime;
	DECLARE @EventDate Datetime;
	SELECT @EventDate=MAX(EventStartDate) FROM tbl_VIDSEventsHistory (nolock);
	SET @EventDate=ISNULL(@EventDate,GETDATE())
	SELECT @StartEventDate=StartDateTime,@EndEventDate=EndDateTime FROM fnc_Get24HourDate(@EventDate);
	CREATE TABLE #EventType(EventTypeId smallint,EventTypeName varchar(50)) 
	CREATE TABLE #TempDir(DirectionId bigint)
	CREATE TABLE #TempChainageNumber(ChainageNumber decimal(16,3))
	CREATE TABLE #TempVehicle(VehicleClassId smallint,VehicleClassName varchar(20),VehicleClassIcon varchar(50),AllowedSpeed Decimal(18,2))
	
	CREATE TABLE #EquipmentDetails(EquipmentId bigint,ChainageNumber decimal(16,3),IpAddress varchar(30),EquipmentTypeName varchar(30),
	EquipmentName varchar(50),LaneNumber smallint,DirectionId smallint,Latitude varchar(50),Longitude varchar(50))
	CREATE TABLE #HourlyIncident(StartDateTime dateTime,EndDateTime dateTime,EventDate Date, SlotStartTime char(2),SlotEndTime char(2))
	


	CREATE TABLE #MainData(ChainageNumber varchar(50),EventTypeId smallint,EventTypeName varchar(50),EquipmentIP varchar(50),
	TransactionId bigint,EventStartDate DateTime,DirectionId Smallint,LaneNumber Smallint,VehicleClassId smallint,VehicleClassName varchar(50),
	EventImageUrl varchar(255),EventVideoUrl varchar(255),Latitude varchar(50),Longitude varchar(50))
	
	
	

	CREATE TABLE #TempHourEvent(StartDateTime dateTime,EndDateTime dateTime,EventDate Date, SlotStartTime char(2),SlotEndTime char(2),ChainageNumber decimal(16,3),LEventCount bigint default 0,REventCount bigint default 0,EventCount bigint default 0)
	CREATE TABLE #TempLocationEvent(ChainageNumber decimal(16,3),LEventCount bigint default 0,REventCount bigint default 0,EventCount bigint default 0)
	CREATE TABLE #TempLocationEventWiseEvent(ChainageNumber varchar(50),EventTypeId smallint,EventTypeName varchar(50),LEventCount bigint default 0,REventCount bigint default 0,EventCount bigint default 0) 
	CREATE TABLE #TempEventWiseEvent(EventTypeId smallint,EventTypeName varchar(50),LEventCount bigint default 0,REventCount bigint default 0,EventCount bigint default 0) 


	INSERT INTO #TempDir(DirectionId) VALUES(1)
	INSERT INTO #TempDir(DirectionId) VALUES(2)

	INSERT INTO #EventType(EventTypeId,EventTypeName)
	SELECT EventTypeId,EventTypeName FROM tbl_EventsTypeMaster(nolock) where SystemId=6 AND EventsRequired=1 AND DataStatus=1

	INSERT INTO #TempVehicle(VehicleClassId,VehicleClassName,VehicleClassIcon,AllowedSpeed)
	SELECT VehicleClassId,VehicleClassName,VehicleClassIcon,AllowedSpeed FROM tbl_VehicleClass(nolock)
	WHERE DataStatus=1

	INSERT INTO #EquipmentDetails(EquipmentId,ChainageNumber,IpAddress,EquipmentTypeName,EquipmentName,LaneNumber,DirectionId,Latitude,Longitude)
	SELECT D.EquipmentId,ChainageNumber,IpAddress,T.EquipmentTypeName,D.EquipmentName,0 AS LaneNumber,DirectionId,Latitude,Longitude
	FROM tbl_EquipmentDetails(nolock) D 
	INNER JOIN tbl_EquipmentTypeMaster(nolock) T ON D.EquipmentTypeId=T.EquipmentTypeId
	WHERE D.DataStatus=1 AND D.SystemId=6

	INSERT INTO #MainData(ChainageNumber,EquipmentIP,DirectionId,LaneNumber,EventTypeId,EventTypeName,TransactionId,VehicleClassId,VehicleClassName,EventStartDate,EventImageUrl,EventVideoUrl)
	SELECT D.ChainageNumber,D.IpAddress,D.DirectionId,H.LaneNumber,H.EventTypeId,I.EventTypeName,TransactionId,H.VehicleClassId,V.VehicleClassName,H.EventStartDate,H.EventImageUrl,H.EventVideoUrl
	from tbl_VIDSEventsHistory(nolock) H 
	INNER JOIN #EquipmentDetails D ON H.EquipmentId=D.EquipmentId
	INNER JOIN #EventType I ON H.EventTypeId=I.EventTypeId
	LEFT JOIN #TempVehicle V ON H.VehicleClassId=V.VehicleClassId
	WHERE CONVERT(DATE,EventStartDate) >= CONVERT(DATE,@StartEventDate) 
	AND CONVERT(DATE,EventStartDate) <= CONVERT(DATE,@EndEventDate)
	ORDER BY EventStartDate DESC;

	INSERT INTO #TempChainageNumber(ChainageNumber)
	SELECT DISTINCT ChainageNumber FROM #MainData
	
	

	INSERT INTO #HourlyIncident(StartDateTime,EndDateTime)
	SELECT * FROM fnc_Get24HourList(@StartEventDate,@EndEventDate,1)
	
	UPDATE #HourlyIncident SET EventDate=StartDateTime,SlotStartTime=FORMAT(StartDateTime,'HH'),SlotEndTime=FORMAT(EndDateTime,'HH')
	
	INSERT INTO #TempHourEvent(StartDateTime,EndDateTime,EventDate,SlotStartTime,SlotEndTime)
	SELECT StartDateTime,EndDateTime,EventDate,SlotStartTime,SlotEndTime FROM #HourlyIncident T 
	--INNER JOIN #TempChainageNumber ON 1=1
	where ISNULL(T.EndDateTime,'')<>''

	UPDATE T SET T.LEventCount=V.EventCount  FROM #TempHourEvent T INNER JOIN 
	(
		SELECT CONVERT(DATE,EventStartDate) AS EventDate,FORMAT(DATEPART(HH,EventStartDate),'00') AS SlotStartTime,
		COUNT(1)AS EventCount
		FROM #MainData
		WHERE DirectionId=1
		GROUP BY CONVERT(DATE,EventStartDate),FORMAT(DATEPART(HH,EventStartDate),'00')
	) V ON T.SlotStartTime=V.SlotStartTime AND T.EventDate=V.EventDate 

	UPDATE T SET T.REventCount=V.EventCount  FROM #TempHourEvent T INNER JOIN 
	(
		SELECT CONVERT(DATE,EventStartDate) AS EventDate,FORMAT(DATEPART(HH,EventStartDate),'00') AS SlotStartTime,
		COUNT(1)AS EventCount 
		FROM #MainData
		WHERE DirectionId=2
		GROUP BY CONVERT(DATE,EventStartDate),FORMAT(DATEPART(HH,EventStartDate),'00')
	) V ON T.SlotStartTime=V.SlotStartTime AND T.EventDate=V.EventDate
	
	UPDATE #TempHourEvent SET EventCount=LEventCount+REventCount;
	

	INSERT INTO #TempLocationEvent(ChainageNumber)
	SELECT ChainageNumber FROM #TempChainageNumber 

	UPDATE T SET T.LEventCount=V.VehicleCount FROM #TempLocationEvent T INNER JOIN
	(
		SELECT ChainageNumber,EventTypeId,COUNT(1) AS VehicleCount FROM #MainData
		WHERE DirectionId=1
		GROUP BY ChainageNumber,EventTypeId
	) V ON T.ChainageNumber=V.ChainageNumber 
	
	UPDATE T SET T.REventCount=V.VehicleCount FROM #TempLocationEvent T INNER JOIN
	(
		SELECT ChainageNumber,EventTypeId,COUNT(1) AS VehicleCount FROM #MainData
		WHERE DirectionId=2
		GROUP BY ChainageNumber,EventTypeId
	) V ON T.ChainageNumber=V.ChainageNumber 

	UPDATE #TempLocationEvent SET EventCount=LEventCount+REventCount;



	INSERT INTO #TempLocationEventWiseEvent(EventTypeId,EventTypeName,ChainageNumber)
	SELECT I.EventTypeId,EventTypeName,ChainageNumber
	FROM #EventType I 
	INNER JOIN #TempChainageNumber D ON 1=1
	

	UPDATE T SET T.LEventCount=V.EventCount FROM #TempLocationEventWiseEvent T INNER JOIN 
	(
		SELECT COUNT(1) AS EventCount,EventTypeId,ChainageNumber FROM #MainData
		WHERE DirectionId=1
		GROUP BY EventTypeId,EquipmentIP,ChainageNumber 
	) V ON T.ChainageNumber=V.ChainageNumber AND T.EventTypeId=V.EventTypeId 
	

	UPDATE T SET T.REventCount=V.EventCount FROM #TempLocationEventWiseEvent T INNER JOIN 
	(
		SELECT COUNT(1) AS EventCount,EventTypeId,ChainageNumber FROM #MainData
		WHERE DirectionId=2
		GROUP BY EventTypeId,EquipmentIP,ChainageNumber 
	) V ON T.ChainageNumber=V.ChainageNumber AND T.EventTypeId=V.EventTypeId 
	
	
	UPDATE #TempLocationEventWiseEvent SET EventCount=LEventCount+REventCount



	INSERT INTO #TempEventWiseEvent(EventTypeId,EventTypeName)
	SELECT I.EventTypeId,EventTypeName
	FROM #EventType I 
	

	UPDATE T SET T.LEventCount=V.EventCount FROM #TempEventWiseEvent T INNER JOIN 
	(
		SELECT COUNT(1) AS EventCount,EventTypeId FROM #MainData
		WHERE DirectionId=1
		GROUP BY EventTypeId,EquipmentIP 
	) V ON T.EventTypeId=V.EventTypeId 

	UPDATE T SET T.REventCount=V.EventCount FROM #TempEventWiseEvent T INNER JOIN 
	(
		SELECT COUNT(1) AS EventCount,EventTypeId FROM #MainData
		WHERE DirectionId=2
		GROUP BY EventTypeId,EquipmentIP 
	) V ON T.EventTypeId=V.EventTypeId  
	
	UPDATE #TempEventWiseEvent SET EventCount=LEventCount+REventCount

	
	SELECT * FROM #TempHourEvent;
	SELECT * FROM #TempLocationEvent;
	SELECT * FROM #TempEventWiseEvent; 
	SELECT * FROM #TempLocationEventWiseEvent; 
END
--GO 
--EXEC USP_DashboardVIDSData
GO
/****** Object:  StoredProcedure [dbo].[USP_DashboardVSDSData]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_DashboardVSDSData]
AS BEGIN
	DECLARE @StartEventDate Datetime,@EndEventDate Datetime;
	DECLARE @EventDate Datetime;
	SELECT @EventDate=MAX(EventDate) FROM tbl_VSDSEventsHistory (nolock);
	SET @EventDate=ISNULL(@EventDate,GETDATE())
	SELECT @StartEventDate=StartDateTime,@EndEventDate=EndDateTime FROM fnc_Get24HourDate(@EventDate)
	--SELECT @EventDate,@StartEventDate,@EndEventDate
	CREATE TABLE #EventType(ChallanTypeId smallint,ChallanTypeName varchar(50)) 
	CREATE TABLE #TempDir(DirectionId bigint)
	CREATE TABLE #TempVehicle(VehicleClassId smallint,VehicleClassName varchar(20),VehicleClassIcon varchar(50),AllowedSpeed Decimal(18,2))
	CREATE TABLE #TempLocation(LocationId smallint,LocationName varchar(100),Latitude Decimal(8,6),Longitude Decimal(9,6),ChainageNumber varchar(50))
	CREATE TABLE #DeviceDetails(LocationId bigint,DeviceId bigint,DeviceIP varchar(30),DeviceType varchar(30),DeviceName varchar(50),LaneNumber smallint,DirectionId smallint)

	CREATE TABLE #TempHourlyViolation(EventDate Date, SlotStartTime char(2),SlotEndTime char(2), ViolationCount bigint DEFAULT 0, VehicleCount bigint DEFAULT 0,LocationId bigint,DirectionId smallint)

	CREATE TABLE #TempHousList(EventDate Date, SlotStartTime char(2),SlotEndTime char(2))
	
	CREATE TABLE #MainData(LocationId int,LocationName varchar(100),LaneNumber smallint,DeviceIP varchar(50),
	TransactionId bigint,EventDate DateTime,DirectionId Smallint,PlateNumber varchar(50),VehicleClassId smallint,
	VehicleClassName varchar(50),PlateImageUrl varchar(255),VehicleImageUrl varchar(255),VehicleVideoUrl varchar(255),
	CapturedSpeed decimal(18,2),ChallanRequired bit,ChallanTypeId smallint)
	
	CREATE TABLE #EventTypeDetails(ChallanTypeId smallint,ChallanTypeName varchar(50),LocationId int,LocationName varchar(50),
	DeviceIP varchar(30),DeviceType varchar(30),DeviceName varchar(50),EventCount int default 0,LastUpdated DateTime,
	DirectionId smallint,ChainageNumber varchar(50),Latitude varchar(50),Longitude varchar(50),VehicleClassId smallint,
	VehicleClassName varchar(50)) 

	SELECT @EventDate=MAX(EventDate) FROM tbl_VSDSEventsHistory (nolock)
	
	INSERT INTO #EventType(ChallanTypeId,ChallanTypeName)
	VALUES(0,'None')

	INSERT INTO #EventType(ChallanTypeId,ChallanTypeName)
	VALUES(1,'OverSpeed')

	INSERT INTO #EventType(ChallanTypeId,ChallanTypeName)
	VALUES(2,'Lane Over Speed')

	INSERT INTO #EventType(ChallanTypeId,ChallanTypeName)
	VALUES(3,'Wrong Lane')

	INSERT INTO #EventType(ChallanTypeId,ChallanTypeName)
	VALUES(4,'OverSpeed & Wrong Lane')

	INSERT INTO #EventType(ChallanTypeId,ChallanTypeName)
	VALUES(5,'Section Speed')
	
	INSERT INTO #TempDir(DirectionId) VALUES(1)
	INSERT INTO #TempDir(DirectionId) VALUES(2)
	
	--INSERT INTO #TempHousList(EventDate,SlotStartTime,SlotEndTime)VALUES(@EventDate,'00','01')
	--INSERT INTO #TempHousList(EventDate,SlotStartTime,SlotEndTime)VALUES(@EventDate,'01','02')
	--INSERT INTO #TempHousList(EventDate,SlotStartTime,SlotEndTime)VALUES(@EventDate,'02','03')
	--INSERT INTO #TempHousList(EventDate,SlotStartTime,SlotEndTime)VALUES(@EventDate,'03','04')
	--INSERT INTO #TempHousList(EventDate,SlotStartTime,SlotEndTime)VALUES(@EventDate,'04','05')
	--INSERT INTO #TempHousList(EventDate,SlotStartTime,SlotEndTime)VALUES(@EventDate,'05','06')
	--INSERT INTO #TempHousList(EventDate,SlotStartTime,SlotEndTime)VALUES(@EventDate,'06','07')
	--INSERT INTO #TempHousList(EventDate,SlotStartTime,SlotEndTime)VALUES(@EventDate,'07','08')
	--INSERT INTO #TempHousList(EventDate,SlotStartTime,SlotEndTime)VALUES(@EventDate,'08','09')
	--INSERT INTO #TempHousList(EventDate,SlotStartTime,SlotEndTime)VALUES(@EventDate,'09','10')
	--INSERT INTO #TempHousList(EventDate,SlotStartTime,SlotEndTime)VALUES(@EventDate,'10','11')
	--INSERT INTO #TempHousList(EventDate,SlotStartTime,SlotEndTime)VALUES(@EventDate,'11','12')
	--INSERT INTO #TempHousList(EventDate,SlotStartTime,SlotEndTime)VALUES(@EventDate,'12','13')
	--INSERT INTO #TempHousList(EventDate,SlotStartTime,SlotEndTime)VALUES(@EventDate,'13','14')
	--INSERT INTO #TempHousList(EventDate,SlotStartTime,SlotEndTime)VALUES(@EventDate,'14','15')
	--INSERT INTO #TempHousList(EventDate,SlotStartTime,SlotEndTime)VALUES(@EventDate,'15','16')
	--INSERT INTO #TempHousList(EventDate,SlotStartTime,SlotEndTime)VALUES(@EventDate,'16','17')
	--INSERT INTO #TempHousList(EventDate,SlotStartTime,SlotEndTime)VALUES(@EventDate,'17','18')
	--INSERT INTO #TempHousList(EventDate,SlotStartTime,SlotEndTime)VALUES(@EventDate,'18','19')
	--INSERT INTO #TempHousList(EventDate,SlotStartTime,SlotEndTime)VALUES(@EventDate,'19','20')
	--INSERT INTO #TempHousList(EventDate,SlotStartTime,SlotEndTime)VALUES(@EventDate,'20','21')
	--INSERT INTO #TempHousList(EventDate,SlotStartTime,SlotEndTime)VALUES(@EventDate,'21','22')
	--INSERT INTO #TempHousList(EventDate,SlotStartTime,SlotEndTime)VALUES(@EventDate,'22','23')
	--INSERT INTO #TempHousList(EventDate,SlotStartTime,SlotEndTime)VALUES(@EventDate,'23','00')
	INSERT INTO #DeviceDetails(LocationId,DeviceId,DeviceIP,DeviceType,DeviceName,LaneNumber,DirectionId)
	SELECT LocationId,D.EntryId,IpAddress,T.DeviceTypeName,D.DeviceName,LaneNumber,DirectionId
	FROM tbl_DeviceDetails(nolock) D 
	INNER JOIN tbl_DeviceTypeMaster(nolock) T ON D.DeviceTypeId=T.EntryId
	WHERE D.DataStatus=1
	
	INSERT INTO #TempVehicle(VehicleClassId,VehicleClassName,VehicleClassIcon,AllowedSpeed)
	SELECT VehicleClassId,VehicleClassName,VehicleClassIcon,AllowedSpeed FROM tbl_VehicleClassDetails(nolock)
	WHERE DataStatus=1
	INSERT INTO #TempLocation(LocationId,LocationName,Latitude,Longitude,ChainageNumber)
	SELECT EntryId,LocationName,Latitude,Longitude,ChainageNumber FROM tbl_LocationDetails(nolock)
	WHERE DataStatus=1
	
	INSERT INTO #MainData(LocationId,LocationName,LaneNumber,DeviceIP,TransactionId,EventDate,DirectionId,
	VehicleClassId,VehicleClassName,PlateImageUrl,VehicleImageUrl,PlateNumber,CapturedSpeed,ChallanRequired,ChallanTypeId)
	SELECT H.LocationId,L.LocationName,H.LaneNumber,H.DeviceIP,H.TransactionId,H.EventDate,H.DirectionId,
	H.VehicleClassId,ISNULL(V.VehicleClassName,'Undefined'),H.PlateImageUrl,H.VehicleImageUrl,H.PlateNumber,H.CapturedSpeed,ChallanRequired,H.ChallanTypeId
	from tbl_VSDSEventsHistory(nolock) H 
	LEFT JOIN #TempLocation L ON H.LocationId=L.LocationId
	LEFT JOIN #TempVehicle V ON H.VehicleClassId=V.VehicleClassId
	--WHERE CONVERT(DATE,EventDate)=@EventDate
	WHERE CONVERT(DATE,EventDate) >= CONVERT(DATE,@StartEventDate) 
	AND CONVERT(DATE,EventDate) <= CONVERT(DATE,@EndEventDate)
	ORDER BY EventDate DESC

	INSERT INTO #EventTypeDetails(ChallanTypeId,ChallanTypeName,LocationId,LocationName,DeviceIP,DeviceType,DeviceName,
	DirectionId,ChainageNumber,Latitude,Longitude,VehicleClassId,VehicleClassName,LastUpdated)
	SELECT I.ChallanTypeId,ChallanTypeName,D.LocationId,L.LocationName,DeviceIP,DeviceType,DeviceName,DirectionId,ChainageNumber,
	Latitude,Longitude,VehicleClassId,VehicleClassName,@EventDate
	FROM #EventType I 
	INNER JOIN tbl_VehicleClassDetails V ON 1=1 AND V.DataStatus=1
	INNER JOIN #DeviceDetails D ON 1=1
	INNER JOIN #TempLocation L ON D.LocationId=L.LocationId

	UPDATE T SET T.EventCount=V.EventCount FROM #EventTypeDetails T INNER JOIN 
	(
		SELECT COUNT(VehicleClassId) EventCount,VehicleClassId,LocationId,DirectionId,DeviceIP,ChallanTypeId 
		FROM #MainData 
		WHERE CONVERT(DATE,EventDate)=CONVERT(DATE,@EventDate) AND ChallanTypeId<>0
		GROUP BY VehicleClassId,LocationId,DirectionId,DeviceIP,ChallanTypeId
	) V ON T.VehicleClassId=V.VehicleClassId 
	AND T.LocationId=V.LocationId 
	AND T.DirectionId=V.DirectionId
	AND T.DeviceIP=V.DeviceIP
	AND T.ChallanTypeId=V.ChallanTypeId
	
	CREATE TABLE #HourlyIncident(StartDateTime dateTime,EndDateTime dateTime,EventDate Date, SlotStartTime char(2),SlotEndTime char(2))
	INSERT INTO #HourlyIncident(StartDateTime,EndDateTime)
	SELECT * FROM fnc_Get24HourList(@StartEventDate,@EndEventDate,1)
	UPDATE #HourlyIncident SET EventDate=StartDateTime,SlotStartTime=FORMAT(StartDateTime,'HH'),SlotEndTime=FORMAT(EndDateTime,'HH')

	INSERT INTO #TempHourlyViolation(EventDate,SlotStartTime,SlotEndTime,LocationId,DirectionId)
	SELECT EventDate,SlotStartTime,SlotEndTime,LocationId,DirectionId FROM #HourlyIncident T   
	INNER JOIN #TempLocation L ON 1=1
	INNER JOIN #TempDir D ON 1=1 where ISNULL(T.EndDateTime,'')<>''

	UPDATE T SET T.ViolationCount=V.ViolationCount FROM #TempHourlyViolation T INNER JOIN (
	SELECT CONVERT(DATE,EventDate) AS EventDate, FORMAT(DATEPART(HH,EventDate),'00') AS SlotStartTime,LocationId,DirectionId,COUNT(1)AS ViolationCount 
	FROM #MainData WHERE ChallanTypeId<>0
	GROUP BY  CONVERT(DATE,EventDate),FORMAT(DATEPART(HH,EventDate),'00'),LocationId,DirectionId
	) V ON t.DirectionId=V.DirectionId AND T.LocationId=V.LocationId AND T.SlotStartTime=V.SlotStartTime
	and T.EventDate=V.EventDate;

	UPDATE T SET T.VehicleCount=V.VehicleCount FROM #TempHourlyViolation T INNER JOIN (
	SELECT CONVERT(DATE,EventDate) AS EventDate,FORMAT(DATEPART(HH,EventDate),'00') AS SlotStartTime,LocationId,DirectionId,COUNT(1)AS VehicleCount 
	FROM #MainData 
	GROUP BY CONVERT(DATE,EventDate), FORMAT(DATEPART(HH,EventDate),'00'),LocationId,DirectionId
	) V ON t.DirectionId=V.DirectionId AND T.LocationId=V.LocationId AND T.SlotStartTime=V.SlotStartTime
	and T.EventDate=V.EventDate;

	SELECT r.* FROM (SELECT r.*, ROW_NUMBER() OVER(PARTITION BY r.DeviceIP ORDER BY r.EventDate DESC) rn FROM #MainData r ) r
	WHERE r.rn <= 10 ORDER BY r.EventDate DESC;
	SELECT * FROM #EventTypeDetails --1
	SELECT * FROM #TempHourlyViolation   --2

	--SELECT * FROM #EventTypeDetails WHERE EventCount<>0
	--SELECT * FROM #TempHourlyViolation WHERE VehicleCount<>0
	--SELECT FORMAT(DATEPART(HH,EventDate),'00') AS SlotStartTime,LocationId,DirectionId,COUNT(1)AS VehicleCount 
	--FROM #MainData 
	--GROUP BY FORMAT(DATEPART(HH,EventDate),'00'),LocationId,DirectionId
END
--GO
--EXEC USP_DashBoardData
GO
/****** Object:  StoredProcedure [dbo].[USP_ECBCallEventsInsert]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_ECBCallEventsInsert]
@CallerId bigint,
@CalleeId bigint,
@CallerNumber varchar(20),
@CalleeNumber varchar(20),
@EventId varchar(255),
@StartDateTime datetime,
@EndDateTime datetime,
@CallDuration smallint,
@CallStatusId smallint,
@CallTypeId smallint,
@RecordingFileName varchar(255),
@SystemProviderId smallint
AS BEGIN
	CREATE TABLE #Temp(AlertMessage varchar(100))
	BEGIN TRY
		DECLARE @CNT bigint
		SELECT @CNT=COUNT(1) FROM tbl_ECBCallEventsHistory WHERE EventId=@EventId
		IF(@CNT=0)
		BEGIN
			INSERT INTO tbl_ECBCallEventsHistory(CallerId,CalleeId,CallerNumber,CalleeNumber,EventId,StartDateTime,EndDateTime,CallDuration,CallStatusId,
			CallTypeId,RecordingFileName,SystemProviderId)
			VALUES(@CallerId,@CalleeId,@CallerNumber,@CalleeNumber,@EventId,@StartDateTime,@EndDateTime,@CallDuration,@CallStatusId,@CallTypeId,@RecordingFileName,@SystemProviderId)	
		END
		ELSE
		BEGIN
			UPDATE tbl_ECBCallEventsHistory SET EndDateTime=@EndDateTime,CallDuration=@CallDuration,CallStatusId=@CallStatusId,
			RecordingFileName=@RecordingFileName WHERE EventId=@EventId
		END
		INSERT INTO #Temp(AlertMessage)VALUES('success');
	END TRY  
	BEGIN CATCH  
		INSERT INTO #Temp(AlertMessage)VALUES('failed');
		EXECUTE USP_ErrorInfoInsert;  
	END CATCH  
		select * from #Temp;
END
GO
/****** Object:  StoredProcedure [dbo].[USP_ECBEventReport]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_ECBEventReport]
@FilterQuery varchar(4000)
AS BEGIN
	DECLARE @CallCount bigint
CREATE TABLE #MainData(CallerNumber varchar(20),CalleeNumber varchar(20),StartDateTime DateTime,EndDateTime DateTime,CallTypeId smallint,
	CallerChainageNumber varchar(50),CallerDirectionId Smallint,CalleeChainageNumber varchar(50),CalleeDirectionId Smallint,
	CallerTypeId smallint,CalleeTypeId smallint,CallDuration bigint)

	CREATE TABLE #ChainageNumberMaster(ChainageNumber varchar(20),CallCount bigint default 0,CallCountPer float default 0,CallTypeColor varchar(100))
	
	CREATE TABLE #CallTypeMaster(CallTypeId smallint,CallTypeName varchar(20),CallCount bigint default 0,CallCountPer float default 0,
	CallTypeColor varchar(100))
	
	EXEC('INSERT INTO #MainData(CallerNumber,CalleeNumber,StartDateTime,EndDateTime,CallTypeId,
	CallerChainageNumber,CalleeChainageNumber,CallerDirectionId,CalleeDirectionId,CallerTypeId,CalleeTypeId,CallDuration) 
	SELECT H.CallerNumber,H.CalleeNumber,H.StartDateTime,H.EndDateTime,H.CallTypeId,
	CallerED.ChainageNumber AS CallerChainageNumber,CalleeED.ChainageNumber AS CalleeChainageNumber,
	CallerED.DirectionId AS CallerDirectionId,CalleeED.DirectionId AS CalleeDirectionId,
	CallerED.EquipmentTypeId,CalleeED.EquipmentTypeId,H.CallDuration
	FROM tbl_ECBCallEventsHistory H 
	LEFT JOIN tbl_EquipmentConfig CallerEC ON H.CallerNumber=CallerEC.Extension
	LEFT JOIN tbl_EquipmentConfig CalleeEC ON H.CalleeNumber=CalleeEC.Extension
	LEFT JOIN tbl_EquipmentDetails CallerED ON CallerEC.EquipmentId=CallerED.EquipmentId 
	LEFT JOIN tbl_EquipmentDetails CalleeED ON CalleeEC.EquipmentId=CalleeED.EquipmentId
	LEFT JOIN tbl_PackageDetails CallerPD ON CallerED.PackageId=CallerPD.PackageId
	LEFT JOIN tbl_PackageDetails CalleePD ON CalleeED.PackageId=CalleePD.PackageId
	LEFT JOIN tbl_ControlRoomMaster CallerCR ON CallerPD.ControlRoomId=CallerCR.ControlRoomId
	LEFT JOIN tbl_ControlRoomMaster CalleeCR ON CalleePD.ControlRoomId=CalleeCR.ControlRoomId '+@FilterQuery+' ')


	INSERT INTO #CallTypeMaster(CallTypeId,CallTypeName,CallTypeColor)
	SELECT EventTypeId,EventTypeName,EventsColor FROM tbl_EventsTypeMaster(nolock) WHERE DataStatus=1 AND SystemId=3


	UPDATE T SET T.CallCount=V.CNT FROM #CallTypeMaster T INNER JOIN 
	(
		SELECT CallTypeId,COUNT(CallTypeId) AS CNT 
		FROM #MainData
		GROUP BY CallTypeId
	) V ON T.CallTypeId=V.CallTypeId

	SET @CallCount=0;
	SELECT @CallCount=SUM(CallCount) FROM #CallTypeMaster
		
	IF(@CallCount>0)
		UPDATE #CallTypeMaster SET CallCountPer=(CONVERT(FLOAT,CallCount)/CONVERT(FLOAT,@CallCount))*100 
		WHERE CallTypeId<>0
		
	INSERT INTO #CallTypeMaster(CallTypeId,CallTypeName,CallCount,CallCountPer,CallTypeColor)
	SELECT 0,'Total',SUM(CallCount),SUM(CallCountPer),'#011b40' FROM #CallTypeMaster


	SELECT CallTypeId,CallTypeName,CallCount,FORMAT(CallCountPer, 'N2') AS CallCountPer,CallTypeColor 
	FROM #CallTypeMaster
	SELECT * FROM #MainData

END
--GO
--EXEC USP_ECBEventReport
--@FilterQuery='WHERE H.StartDateTime>= CONVERT(DATETIME,''01-Oct-2023 00:00:00'') AND H.StartDateTime<= CONVERT(DATETIME,''04-Nov-2023 12:45:27'')'
GO
/****** Object:  StoredProcedure [dbo].[USP_ECBEventsGetByFilter]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[USP_ECBEventsGetByFilter]
@FilterQuery varchar(4000)
AS
	BEGIN
		EXEC('SELECT H.CallerId,H.CalleeId,H.CallerNumber,H.CalleeNumber,H.EventId,H.StartDateTime,H.EndDateTime,H.CallDuration,
	H.CallStatusId,H.CallTypeId,H.RecordingFileName,H.OperatorId,H.IncidentId,H.IncidentStatusId,H.CreatedDate,
	H.DataSendStatus,H.MediaSendStatus,
	CallerED.ChainageNumber AS CallerChainageNumber,CalleeED.ChainageNumber AS CalleeChainageNumber,
	CallerED.DirectionId AS CallerDirectionId,CalleeED.DirectionId AS CalleeDirectionId,
	CallerED.Longitude AS CallerLongitude,CalleeED.Longitude AS CalleeLongitude,
	CallerED.Latitude AS CallerLatitude,CalleeED.Latitude AS CalleeLatitude,
	CallerPD.PackageId AS CallerPackageId,CalleePD.PackageId AS CalleePackageId,
	CallerPD.PackageName AS CallerPackageName,CalleePD.PackageName AS CalleePackageName,
	CallerCR.ControlRoomId AS CallerControlRoomId,CalleeCR.ControlRoomId AS CalleeControlRoomId,
	CallerCR.ControlRoomName AS CallerControlRoomName,CalleeCR.ControlRoomName AS CalleeControlRoomName
	FROM tbl_ECBCallEventsHistory H 
	LEFT JOIN tbl_EquipmentConfig CallerEC ON H.CallerNumber=CallerEC.Extension
	LEFT JOIN tbl_EquipmentConfig CalleeEC ON H.CalleeNumber=CalleeEC.Extension
	LEFT JOIN tbl_EquipmentDetails CallerED ON CallerEC.EquipmentId=CallerED.EquipmentId 
	LEFT JOIN tbl_EquipmentDetails CalleeED ON CalleeEC.EquipmentId=CalleeED.EquipmentId
	LEFT JOIN tbl_PackageDetails CallerPD ON CallerED.PackageId=CallerPD.PackageId
	LEFT JOIN tbl_PackageDetails CalleePD ON CalleeED.PackageId=CalleePD.PackageId
	LEFT JOIN tbl_ControlRoomMaster CallerCR ON CallerPD.ControlRoomId=CallerCR.ControlRoomId
	LEFT JOIN tbl_ControlRoomMaster CalleeCR ON CalleePD.ControlRoomId=CalleeCR.ControlRoomId '+@FilterQuery+' ORDER BY StartDateTime DESC')
	END
GO
/****** Object:  StoredProcedure [dbo].[USP_ECBEventsGetByHours]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_ECBEventsGetByHours]
@Hours smallint=0
AS BEGIN
	 DECLARE @MinDate DateTime
	IF(@Hours=0)
	BEGIN
		SELECT @MinDate=MIN(StartDateTime) FROM tbl_ECBCallEventsHistory 
		SET @MinDate=ISNULL(@MinDate,GETDATE())
	END
	ELSE
	BEGIN
		SELECT @MinDate=MAX(StartDateTime) FROM tbl_ECBCallEventsHistory 
		SET @MinDate=ISNULL(@MinDate,GETDATE())
		SET @MinDate=DATEADD(HOUR,-1*@Hours,@MinDate)
	END

	SELECT H.CallerId,H.CalleeId,H.CallerNumber,H.CalleeNumber,H.EventId,H.StartDateTime,H.EndDateTime,H.CallDuration,
	H.CallStatusId,H.CallTypeId,H.RecordingFileName,H.OperatorId,H.IncidentId,H.IncidentStatusId,H.CreatedDate,
	H.DataSendStatus,H.MediaSendStatus,
	CallerED.ChainageNumber AS CallerChainageNumber,CalleeED.ChainageNumber AS CalleeChainageNumber,
	CallerED.DirectionId AS CallerDirectionId,CalleeED.DirectionId AS CalleeDirectionId,
	CallerED.Longitude AS CallerLongitude,CalleeED.Longitude AS CalleeLongitude,
	CallerED.Latitude AS CallerLatitude,CalleeED.Latitude AS CalleeLatitude,
	CallerPD.PackageId AS CallerPackageId,CalleePD.PackageId AS CalleePackageId,
	CallerPD.PackageName AS CallerPackageName,CalleePD.PackageName AS CalleePackageName,
	CallerCR.ControlRoomId AS CallerControlRoomId,CalleeCR.ControlRoomId AS CalleeControlRoomId,
	CallerCR.ControlRoomName AS CallerControlRoomName,CalleeCR.ControlRoomName AS CalleeControlRoomName
	FROM tbl_ECBCallEventsHistory H 
	LEFT JOIN tbl_EquipmentConfig CallerEC ON H.CallerNumber=CallerEC.Extension
	LEFT JOIN tbl_EquipmentConfig CalleeEC ON H.CalleeNumber=CalleeEC.Extension
	LEFT JOIN tbl_EquipmentDetails CallerED ON CallerEC.EquipmentId=CallerED.EquipmentId 
	LEFT JOIN tbl_EquipmentDetails CalleeED ON CalleeEC.EquipmentId=CalleeED.EquipmentId
	LEFT JOIN tbl_PackageDetails CallerPD ON CallerED.PackageId=CallerPD.PackageId
	LEFT JOIN tbl_PackageDetails CalleePD ON CalleeED.PackageId=CalleePD.PackageId
	LEFT JOIN tbl_ControlRoomMaster CallerCR ON CallerPD.ControlRoomId=CallerCR.ControlRoomId
	LEFT JOIN tbl_ControlRoomMaster CalleeCR ON CalleePD.ControlRoomId=CalleeCR.ControlRoomId
	WHERE H.StartDateTime>=@MinDate
	ORDER BY H.StartDateTime DESC
END
--GO
--EXEC USP_ECBEventsGetByHours
GO
/****** Object:  StoredProcedure [dbo].[USP_ECBLocationReport]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_ECBLocationReport]
@FilterQuery varchar(4000)
AS BEGIN
	DECLARE @CallCount bigint
CREATE TABLE #MainData(CallerNumber varchar(20),CalleeNumber varchar(20),StartDateTime DateTime,EndDateTime DateTime,CallTypeId smallint,
	CallerChainageNumber varchar(50),CallerDirectionId Smallint,CalleeChainageNumber varchar(50),CalleeDirectionId Smallint,
	CallerTypeId smallint,CalleeTypeId smallint,CallDuration bigint)

	CREATE TABLE #ChainageNumberMaster(ChainageNumber varchar(20),CallCount bigint default 0,CallCountPer float default 0,CallTypeColor varchar(100))
	
	EXEC('INSERT INTO #MainData(CallerNumber,CalleeNumber,StartDateTime,EndDateTime,CallTypeId,
	CallerChainageNumber,CalleeChainageNumber,CallerDirectionId,CalleeDirectionId,CallerTypeId,CalleeTypeId,CallDuration) 
	SELECT H.CallerNumber,H.CalleeNumber,H.StartDateTime,H.EndDateTime,H.CallTypeId,
	CallerED.ChainageNumber AS CallerChainageNumber,CalleeED.ChainageNumber AS CalleeChainageNumber,
	CallerED.DirectionId AS CallerDirectionId,CalleeED.DirectionId AS CalleeDirectionId,
	CallerED.EquipmentTypeId,CalleeED.EquipmentTypeId,H.CallDuration
	FROM tbl_ECBCallEventsHistory H 
	LEFT JOIN tbl_EquipmentConfig CallerEC ON H.CallerNumber=CallerEC.Extension
	LEFT JOIN tbl_EquipmentConfig CalleeEC ON H.CalleeNumber=CalleeEC.Extension
	LEFT JOIN tbl_EquipmentDetails CallerED ON CallerEC.EquipmentId=CallerED.EquipmentId 
	LEFT JOIN tbl_EquipmentDetails CalleeED ON CalleeEC.EquipmentId=CalleeED.EquipmentId
	LEFT JOIN tbl_PackageDetails CallerPD ON CallerED.PackageId=CallerPD.PackageId
	LEFT JOIN tbl_PackageDetails CalleePD ON CalleeED.PackageId=CalleePD.PackageId
	LEFT JOIN tbl_ControlRoomMaster CallerCR ON CallerPD.ControlRoomId=CallerCR.ControlRoomId
	LEFT JOIN tbl_ControlRoomMaster CalleeCR ON CalleePD.ControlRoomId=CalleeCR.ControlRoomId '+@FilterQuery+' ')


	INSERT INTO #ChainageNumberMaster(ChainageNumber)
	SELECT DISTINCT CallerChainageNumber FROM #MainData

	UPDATE T SET T.CallCount=V.CNT
	FROM #ChainageNumberMaster T INNER JOIN 
	(
		SELECT CallerChainageNumber,COUNT(CallerChainageNumber) AS CNT 
		FROM #MainData
		WHERE CallerTypeId=2
		GROUP BY CallerChainageNumber
	) V ON T.ChainageNumber=V.CallerChainageNumber


	UPDATE T SET T.CallCount=T.CallCount+V.CNT,CallTypeColor='#' +  CONVERT(VARCHAR(max), CRYPT_GEN_RANDOM(3), 2) 
	FROM #ChainageNumberMaster T INNER JOIN 
	(
		SELECT CalleeChainageNumber,COUNT(CalleeChainageNumber) AS CNT 
		FROM #MainData
		WHERE CalleeTypeId=2
		GROUP BY CalleeChainageNumber
	) V ON T.ChainageNumber=V.CalleeChainageNumber

	SET @CallCount=0;
	SELECT @CallCount=SUM(CallCount) FROM #ChainageNumberMaster
	IF(@CallCount>0)
		UPDATE #ChainageNumberMaster SET CallCountPer=(CONVERT(FLOAT,CallCount)/CONVERT(FLOAT,@CallCount))*100 
	
	INSERT INTO #ChainageNumberMaster(ChainageNumber,CallCount,CallCountPer,CallTypeColor)
	SELECT 'Total',SUM(CallCount),SUM(CallCountPer),'#011b40' FROM #ChainageNumberMaster


	SELECT ChainageNumber,CallCount,FORMAT(CallCountPer, 'N2') AS VehiclePer,CallTypeColor FROM #ChainageNumberMaster
	SELECT * FROM #MainData

END
--GO
--EXEC USP_ECBLocationReport
--@FilterQuery='WHERE H.StartDateTime>= CONVERT(DATETIME,''01-Oct-2023 00:00:00'') AND H.StartDateTime<= CONVERT(DATETIME,''04-Nov-2023 12:45:27'')'
GO
/****** Object:  StoredProcedure [dbo].[USP_ECBSummeryReport]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_ECBSummeryReport]
@FilterQuery varchar(4000)
AS BEGIN
	DECLARE @CallCount bigint
	CREATE TABLE #MainData(CallerNumber varchar(20),CalleeNumber varchar(20),StartDateTime DateTime,EndDateTime DateTime,CallTypeId smallint,
	CallerChainageNumber varchar(50),CallerDirectionId Smallint,CalleeChainageNumber varchar(50),CalleeDirectionId Smallint,
	CallerTypeId smallint,CalleeTypeId smallint)
	
	EXEC('INSERT INTO #MainData(CallerNumber,CalleeNumber,StartDateTime,EndDateTime,CallTypeId,
	CallerChainageNumber,CalleeChainageNumber,CallerDirectionId,CalleeDirectionId,CallerTypeId,CalleeTypeId) 
	SELECT H.CallerNumber,H.CalleeNumber,H.StartDateTime,H.EndDateTime,H.CallTypeId,
	CallerED.ChainageNumber AS CallerChainageNumber,CalleeED.ChainageNumber AS CalleeChainageNumber,
	CallerED.DirectionId AS CallerDirectionId,CalleeED.DirectionId AS CalleeDirectionId,
	CallerED.EquipmentTypeId,CalleeED.EquipmentTypeId
	FROM tbl_ECBCallEventsHistory H 
	LEFT JOIN tbl_EquipmentConfig CallerEC ON H.CallerNumber=CallerEC.Extension
	LEFT JOIN tbl_EquipmentConfig CalleeEC ON H.CalleeNumber=CalleeEC.Extension
	LEFT JOIN tbl_EquipmentDetails CallerED ON CallerEC.EquipmentId=CallerED.EquipmentId 
	LEFT JOIN tbl_EquipmentDetails CalleeED ON CalleeEC.EquipmentId=CalleeED.EquipmentId
	LEFT JOIN tbl_PackageDetails CallerPD ON CallerED.PackageId=CallerPD.PackageId
	LEFT JOIN tbl_PackageDetails CalleePD ON CalleeED.PackageId=CalleePD.PackageId
	LEFT JOIN tbl_ControlRoomMaster CallerCR ON CallerPD.ControlRoomId=CallerCR.ControlRoomId
	LEFT JOIN tbl_ControlRoomMaster CalleeCR ON CalleePD.ControlRoomId=CalleeCR.ControlRoomId '+@FilterQuery+' ')
	
	CREATE TABLE #CallTypeMaster(CallTypeId smallint,CallTypeName varchar(20),CallCount bigint default 0,CallCountPer float default 0,
	CallTypeColor varchar(100))

	CREATE TABLE #ChainageNumberMaster(ChainageNumber varchar(20),CallCount bigint default 0,CallCountPer float default 0,CallTypeColor varchar(100))


	INSERT INTO #CallTypeMaster(CallTypeId,CallTypeName,CallTypeColor)
	SELECT EventTypeId,EventTypeName,EventsColor FROM tbl_EventsTypeMaster(nolock) WHERE DataStatus=1 AND SystemId=3

	UPDATE T SET T.CallCount=V.CNT FROM #CallTypeMaster T INNER JOIN 
	(
		SELECT CallTypeId,COUNT(CallTypeId) AS CNT 
		FROM #MainData
		GROUP BY CallTypeId
	) V ON T.CallTypeId=V.CallTypeId

	SET @CallCount=0;
	SELECT @CallCount=SUM(CallCount) FROM #CallTypeMaster
		
	IF(@CallCount>0)
		UPDATE #CallTypeMaster SET CallCountPer=(CONVERT(FLOAT,CallCount)/CONVERT(FLOAT,@CallCount))*100 
		WHERE CallTypeId<>0
		
	INSERT INTO #CallTypeMaster(CallTypeId,CallTypeName,CallCount,CallCountPer,CallTypeColor)
	SELECT 0,'Total',SUM(CallCount),SUM(CallCountPer),'#011b40' FROM #CallTypeMaster
	
	
	INSERT INTO #ChainageNumberMaster(ChainageNumber)
	SELECT  DISTINCT ChainageNumber
	FROM tbl_EquipmentDetails WHERE EquipmentTypeId IN (2,12)



	UPDATE #ChainageNumberMaster SET CallTypeColor='#' +  CONVERT(VARCHAR(max), CRYPT_GEN_RANDOM(3), 2) 
	
	UPDATE T SET T.CallCount=V.CNT
	FROM #ChainageNumberMaster T INNER JOIN 
	(
		SELECT CallerChainageNumber,COUNT(CallerChainageNumber) AS CNT 
		FROM #MainData
		WHERE CallerTypeId=2
		GROUP BY CallerChainageNumber
	) V ON T.ChainageNumber=V.CallerChainageNumber


	UPDATE T SET T.CallCount=T.CallCount+V.CNT,CallTypeColor='#' +  CONVERT(VARCHAR(max), CRYPT_GEN_RANDOM(3), 2) 
	FROM #ChainageNumberMaster T INNER JOIN 
	(
		SELECT CalleeChainageNumber,COUNT(CalleeChainageNumber) AS CNT 
		FROM #MainData
		WHERE CalleeTypeId=2
		GROUP BY CalleeChainageNumber
	) V ON T.ChainageNumber=V.CalleeChainageNumber

	SET @CallCount=0;
	SELECT @CallCount=SUM(CallCount) FROM #ChainageNumberMaster
	IF(@CallCount>0)
		UPDATE #ChainageNumberMaster SET CallCountPer=(CONVERT(FLOAT,CallCount)/CONVERT(FLOAT,@CallCount))*100 
	
	INSERT INTO #ChainageNumberMaster(ChainageNumber,CallCount,CallCountPer,CallTypeColor)
	SELECT 'Total',SUM(CallCount),SUM(CallCountPer),'#011b40' FROM #ChainageNumberMaster


	SELECT CallTypeId,CallTypeName,CallCount,FORMAT(CallCountPer, 'N2') AS CallCountPer,CallTypeColor 
	FROM #CallTypeMaster
	SELECT ChainageNumber,CallCount,FORMAT(CallCountPer, 'N2') AS CallCountPer,CallTypeColor FROM #ChainageNumberMaster
	SELECT * FROM #MainData
END
--GO
--EXEC USP_ECBSummeryReport
--@FilterQuery='WHERE H.StartDateTime>= CONVERT(DATETIME,''01-Oct-2023 00:00:00'') AND H.StartDateTime<= CONVERT(DATETIME,''04-Nov-2023 12:45:27'')'
GO
/****** Object:  StoredProcedure [dbo].[USP_EquipmentConfigGetActive]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[USP_EquipmentConfigGetActive]
AS BEGIN
	SELECT C.SystemId,C.EquipmentId,C.EquipmentTypeId,M.EquipmentTypeName,ChainageNumber,EquipmentName,IpAddress,ParentId,PositionId,
	C.LaneNumberId,E.DirectionId,C.Extension 
	FROM tbl_EquipmentConfig C 
	INNER JOIN tbl_EquipmentDetails E ON C.EquipmentId=E.EquipmentId
	INNER JOIN tbl_EquipmentTypeMaster M ON C.EquipmentTypeId=M.EquipmentTypeId
	WHERE M.DataStatus=1 ORDER BY OrderBy
END
--GO
--EXEC USP_EquipmentConfigGetBySystemId
--@SystemId=8
GO
/****** Object:  StoredProcedure [dbo].[USP_EquipmentConfigGetBySystemId]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[USP_EquipmentConfigGetBySystemId]
@SystemId smallint
AS BEGIN
	SELECT C.SystemId,C.EquipmentId,C.EquipmentTypeId,M.EquipmentTypeName,ChainageNumber,EquipmentName,IpAddress,ParentId,PositionId,
	C.LaneNumberId,E.DirectionId,C.Extension 
	FROM tbl_EquipmentConfig C 
	INNER JOIN tbl_EquipmentDetails E ON C.EquipmentId=E.EquipmentId
	INNER JOIN tbl_EquipmentTypeMaster M ON C.EquipmentTypeId=M.EquipmentTypeId
	WHERE C.SystemId=@SystemId ORDER BY OrderBy
END
--GO
--EXEC USP_EquipmentConfigGetBySystemId
--@SystemId=3
GO
/****** Object:  StoredProcedure [dbo].[USP_EquipmentConfigInsertUpdate]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_EquipmentConfigInsertUpdate] 
@SessionId varchar(20),
@SystemId smallint,
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
	DECLARE @LaneCount int
	DECLARE @ExtensionCount int
	DECLARE @ActionId varchar(100)
	CREATE TABLE #Temp(AlertMessage varchar(100))
	BEGIN TRY  
		SELECT @MenuId=MenuId FROM tbl_MenuMaster WHERE MenuName ='Equipment Config' AND SystemId=@SystemId
		SELECT @ActionId=SystemName FROM tbl_SystemMaster WHERE SystemId=@SystemId
		CREATE TABLE #EquipmentConfig(id bigint identity,SystemId smallint,EquipmentTypeId smallint,EquipmentId bigint,
		ParentId bigint,PositionId smallint,LaneNumberId smallint,Extension bigint,SessionId varchar(10),ChildCount smallint default 0,LaneChildCount smallint default 0)

		INSERT INTO #EquipmentConfig(SystemId,EquipmentTypeId,EquipmentId,ParentId,PositionId,LaneNumberId,Extension,SessionId)
		SELECT SystemId,EquipmentTypeId,EquipmentId,ParentId,PositionId,LaneNumberId,Extension,SessionId FROM temp_EquipmentConfig
		WHERE SessionId=@SessionId

		DELETE FROM temp_EquipmentConfig WHERE SessionId=@SessionId
		UPDATE T SET T.ChildCount=V.ChildCount FROM #EquipmentConfig T 
		INNER JOIN
		(
			SELECT T.EquipmentId,COUNT(V.EquipmentId) AS ChildCount FROM #EquipmentConfig T
			LEFT JOIN #EquipmentConfig V ON T.EquipmentId=V.ParentId
			WHERE T.EquipmentTypeId=28
			GROUP BY T.EquipmentId
		) V ON T.EquipmentId=V.EquipmentId

		SELECT @PositionCount=PositionCount FROM 
		(
			SELECT ParentId,PositionId,Count(1) PositionCount FROM #EquipmentConfig
			WHERE ParentId<>0 AND PositionId<>0
			GROUP BY ParentId,PositionId
		)T

		SELECT @LaneCount=LaneCount FROM 
		(
			SELECT ParentId,EquipmentTypeId,LaneNumberId,Count(1) LaneCount FROM #EquipmentConfig
			WHERE ParentId<>0 AND LaneNumberId<>0
			GROUP BY ParentId,EquipmentTypeId,LaneNumberId
		)T
		
		SELECT  @ExtensionCount=COUNT(1)  FROM 
		(
			SELECT a.*,Row_Number() OVER (PARTITION BY Extension ORDER BY Extension) AS r
			FROM   #EquipmentConfig AS a WHERE Extension<>0
		)AS b 
		WHERE   r > 1;
		
		--SELECT a.*,Row_Number() OVER (PARTITION BY Extension ORDER BY Extension) AS r
		--	FROM   #EquipmentConfig AS a WHERE Extension<>0

		IF EXISTS(SELECT 1 FROM #EquipmentConfig WHERE EquipmentTypeId=28 AND ChildCount=0)
		BEGIN
			INSERT INTO #Temp(AlertMessage)
			VALUES('Media converter must connected with equipment!')
		END
		IF EXISTS(SELECT 1 FROM #EquipmentConfig WHERE EquipmentTypeId IN (25) AND PositionId=0)
		BEGIN
			INSERT INTO #Temp(AlertMessage)
			VALUES('Equipment postion is required!')
		END

		IF EXISTS(SELECT 1 FROM #EquipmentConfig WHERE EquipmentTypeId IN (7,26) AND LaneNumberId=0)
		BEGIN
			INSERT INTO #Temp(AlertMessage)
			VALUES('Equipment lane is required!')
		END

		IF (ISNULL(@PositionCount,0)>1)
		BEGIN
			INSERT INTO #Temp(AlertMessage)
			VALUES('Equipment postion is must be unique!')
		END
		IF (ISNULL(@LaneCount,0)>1)
		BEGIN
			INSERT INTO #Temp(AlertMessage)
			VALUES('Equipment lane is must be unique!')
		END

		IF (ISNULL(@ExtensionCount,0)>0)
		BEGIN
			INSERT INTO #Temp(AlertMessage)
			VALUES('Equipment Extension is must be unique!')
		END

		SELECT @cnt=COUNT(AlertMessage)  FROM #Temp
			IF(@cnt=0)
			BEGIN
				IF EXISTS(SELECT 1 FROM tbl_EquipmentConfig WHERE SystemId=@SystemId)
				BEGIN
					SET @ActionId=@ActionId+'- Modified'
					DELETE FROM tbl_EquipmentConfig WHERE SystemId=@SystemId
				END
				ELSE 
				BEGIN
					SET @ActionId=@ActionId+'- Created'
				END
		
				INSERT INTO tbl_EquipmentConfig(SystemId,EquipmentTypeId,EquipmentId,ParentId,PositionId,LaneNumberId,Extension,OrderBy,CreatedDate,CreatedBy,ModifiedDate,ModifiedBy)
				SELECT SystemId,EquipmentTypeId,EquipmentId,ParentId,PositionId,LaneNumberId,Extension,id,@CreatedDate,@CreatedBy,@ModifiedDate,@ModifiedBy 
				FROM #EquipmentConfig
				ORDER BY id

				INSERT INTO tbl_ActivityLog(UserId,ActionId,MenuId,CreatedDate)
				VALUES(@CreatedBy,@ActionId,@MenuId,@CreatedDate);
		
				INSERT INTO #Temp(AlertMessage)VALUES('success');
			END
	END TRY  
	BEGIN CATCH  
		INSERT INTO #Temp(AlertMessage)VALUES('failed');
		EXECUTE USP_ErrorInfoInsert;  
	END CATCH  
		select * from #Temp;
END
--GO
--EXEC USP_EquipmentConfigInsertUpdate
--@SessionId ='CFDTZSR5F4',
--@SystemId=6,
--@CreatedDate ='26-Jul-2022 11:30:00',
--@CreatedBy =0,
--@ModifiedDate='26-Jul-2022 11:30:00',
--@ModifiedBy =0
GO
/****** Object:  StoredProcedure [dbo].[USP_EquipmentDetailsGetAll]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_EquipmentDetailsGetAll]
AS BEGIN
	SELECT ED.EquipmentId,ED.PackageId,ED.EquipmentTypeId,ED.SystemId,ED.EquipmentName,ED.DirectionId,
	ED.ProtocolTypeId,ED.IpAddress,ED.PortNumber,ED.LoginId,ED.[Password],ED.ChainageNumber,ED.Latitude,
	ED.Longitude,ED.MacAddress,ED.ModelNumber,ED.SerialNumber,ED.ManufacturerDetail,ED.VendorDetail,ED.ManufacturerDate,
	ED.PurchageDate,ED.WarrantyExpireDate,ED.OnLineStatus,ED.DataStatus,ED.CreatedDate,ED.CreatedBy,
	ED.ModifiedDate,ED.ModifiedBy,CR.ControlRoomId,CR.ControlRoomName,PD.PackageName,ET.EquipmentTypeName,ET.EquipmentIconName,
	ET.EquipmentCategoryTypeId,ET.EquipmentConnectionTypeId,SM.SystemName,SM.SystemDescription 
	FROM tbl_EquipmentDetails ED 
	INNER JOIN tbl_PackageDetails PD ON ED.PackageId=PD.PackageId AND PD.DataStatus=1
	INNER JOIN tbl_ControlRoomMaster CR ON PD.ControlRoomId=CR.ControlRoomId AND CR.DataStatus=1
	INNER JOIN tbl_EquipmentTypeMaster ET ON ED.EquipmentTypeId=ET.EquipmentTypeId AND ET.DataStatus=1
	INNER JOIN tbl_SystemMaster SM ON ED.SystemId=SM.SystemId --AND SM.DataStatus=1
END
GO
/****** Object:  StoredProcedure [dbo].[USP_EquipmentDetailsGetByEquipmentTypeId]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_EquipmentDetailsGetByEquipmentTypeId]
@EquipmentTypeId smallint
AS BEGIN
	SELECT ED.EquipmentId,ED.PackageId,ED.EquipmentTypeId,ED.SystemId,ED.EquipmentName,ED.DirectionId,
	ED.ProtocolTypeId,ED.IpAddress,ED.PortNumber,ED.LoginId,ED.[Password],ED.ChainageNumber,ED.Latitude,
	ED.Longitude,ED.MacAddress,ED.ModelNumber,ED.SerialNumber,ED.ManufacturerDetail,ED.VendorDetail,ED.ManufacturerDate,
	ED.PurchageDate,ED.WarrantyExpireDate,ED.OnLineStatus,ED.DataStatus,ED.CreatedDate,ED.CreatedBy,
	ED.ModifiedDate,ED.ModifiedBy,CR.ControlRoomId,CR.ControlRoomName,PD.PackageName,ET.EquipmentTypeName,ET.EquipmentIconName,
	ET.EquipmentCategoryTypeId,ET.EquipmentConnectionTypeId,SM.SystemName,SM.SystemDescription 
	FROM tbl_EquipmentDetails ED 
	INNER JOIN tbl_PackageDetails PD ON ED.PackageId=PD.PackageId
	INNER JOIN tbl_ControlRoomMaster CR ON PD.ControlRoomId=CR.ControlRoomId
	INNER JOIN tbl_EquipmentTypeMaster ET ON ED.EquipmentTypeId=ET.EquipmentTypeId
	INNER JOIN tbl_SystemMaster SM ON ED.SystemId=SM.SystemId
	WHERE ED.EquipmentTypeId=@EquipmentTypeId AND ED.DataStatus=1
END

GO
/****** Object:  StoredProcedure [dbo].[USP_EquipmentDetailsGetByFilter]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_EquipmentDetailsGetByFilter]
@FilterQuery varchar(4000)
AS BEGIN
	if(@FilterQuery='')
	BEGIN
		SELECT ED.EquipmentId,ED.PackageId,ED.EquipmentTypeId,ED.SystemId,ED.EquipmentName,ED.DirectionId,
		ED.ProtocolTypeId,ED.IpAddress,ED.PortNumber,ED.LoginId,ED.[Password],ED.ChainageNumber,ED.Latitude,
		ED.Longitude,ED.MacAddress,ED.ModelNumber,ED.SerialNumber,ED.ManufacturerDetail,ED.VendorDetail,ED.ManufacturerDate,
		ED.PurchageDate,ED.WarrantyExpireDate,ED.OnLineStatus,ED.DataStatus,ED.CreatedDate,ED.CreatedBy,
		ED.ModifiedDate,ED.ModifiedBy,CR.ControlRoomId,CR.ControlRoomName,PD.PackageName,ET.EquipmentTypeName,ET.EquipmentIconName,
		ET.EquipmentCategoryTypeId,ET.EquipmentConnectionTypeId,SM.SystemName,SM.SystemDescription 
		FROM tbl_EquipmentDetails ED 
		INNER JOIN tbl_PackageDetails PD ON ED.PackageId=PD.PackageId AND PD.DataStatus=1
		INNER JOIN tbl_ControlRoomMaster CR ON PD.ControlRoomId=CR.ControlRoomId AND CR.DataStatus=1
		INNER JOIN tbl_EquipmentTypeMaster ET ON ED.EquipmentTypeId=ET.EquipmentTypeId AND ET.DataStatus=1
		INNER JOIN tbl_SystemMaster SM ON ED.SystemId=SM.SystemId AND SM.DataStatus=1
	END
	ELSE
	BEGIN
		EXEC('SELECT ED.EquipmentId,ED.PackageId,ED.EquipmentTypeId,ED.SystemId,ED.EquipmentName,ED.DirectionId,
		ED.ProtocolTypeId,ED.IpAddress,ED.PortNumber,ED.LoginId,ED.[Password],ED.ChainageNumber,ED.Latitude,
		ED.Longitude,ED.MacAddress,ED.ModelNumber,ED.SerialNumber,ED.ManufacturerDetail,ED.VendorDetail,ED.ManufacturerDate,
		ED.PurchageDate,ED.WarrantyExpireDate,ED.OnLineStatus,ED.DataStatus,ED.CreatedDate,ED.CreatedBy,
		ED.ModifiedDate,ED.ModifiedBy,CR.ControlRoomId,CR.ControlRoomName,PD.PackageName,ET.EquipmentTypeName,ET.EquipmentIconName,
		ET.EquipmentCategoryTypeId,ET.EquipmentConnectionTypeId,SM.SystemName,SM.SystemDescription 
		FROM tbl_EquipmentDetails ED 
		INNER JOIN tbl_PackageDetails PD ON ED.PackageId=PD.PackageId AND PD.DataStatus=1
		INNER JOIN tbl_ControlRoomMaster CR ON PD.ControlRoomId=CR.ControlRoomId AND CR.DataStatus=1
		INNER JOIN tbl_EquipmentTypeMaster ET ON ED.EquipmentTypeId=ET.EquipmentTypeId AND ET.DataStatus=1
		INNER JOIN tbl_SystemMaster SM ON ED.SystemId=SM.SystemId AND SM.DataStatus=1
			'+@FilterQuery+' ')
	END
END
GO
/****** Object:  StoredProcedure [dbo].[USP_EquipmentDetailsGetById]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_EquipmentDetailsGetById]
@EquipmentId bigint
AS BEGIN
	SELECT ED.EquipmentId,ED.PackageId,ED.EquipmentTypeId,ED.SystemId,ED.EquipmentName,ED.DirectionId,
	ED.ProtocolTypeId,ED.IpAddress,ED.PortNumber,ED.LoginId,ED.[Password],ED.ChainageNumber,ED.Latitude,
	ED.Longitude,ED.MacAddress,ED.ModelNumber,ED.SerialNumber,ED.ManufacturerDetail,ED.VendorDetail,ED.ManufacturerDate,
	ED.PurchageDate,ED.WarrantyExpireDate,ED.OnLineStatus,ED.DataStatus,ED.CreatedDate,ED.CreatedBy,
	ED.ModifiedDate,ED.ModifiedBy,CR.ControlRoomId,CR.ControlRoomName,PD.PackageName,ET.EquipmentTypeName,ET.EquipmentIconName,
	ET.EquipmentCategoryTypeId,ET.EquipmentConnectionTypeId,SM.SystemName,SM.SystemDescription 
	FROM tbl_EquipmentDetails ED 
	INNER JOIN tbl_PackageDetails PD ON ED.PackageId=PD.PackageId
	INNER JOIN tbl_ControlRoomMaster CR ON PD.ControlRoomId=CR.ControlRoomId
	INNER JOIN tbl_EquipmentTypeMaster ET ON ED.EquipmentTypeId=ET.EquipmentTypeId
	INNER JOIN tbl_SystemMaster SM ON ED.SystemId=SM.SystemId
	WHERE ED.EquipmentId=@EquipmentId
END
GO
/****** Object:  StoredProcedure [dbo].[USP_EquipmentDetailsGetByIds]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_EquipmentDetailsGetByIds]
@EquipmentIds varchar(4000)
AS BEGIN
	SELECT ED.EquipmentId,ED.PackageId,ED.EquipmentTypeId,ED.SystemId,ED.EquipmentName,ED.DirectionId,
	ED.ProtocolTypeId,ED.IpAddress,ED.PortNumber,ED.LoginId,ED.[Password],ED.ChainageNumber,ED.Latitude,
	ED.Longitude,ED.MacAddress,ED.ModelNumber,ED.SerialNumber,ED.ManufacturerDetail,ED.VendorDetail,ED.ManufacturerDate,
	ED.PurchageDate,ED.WarrantyExpireDate,ED.OnLineStatus,ED.DataStatus,ED.CreatedDate,ED.CreatedBy,
	ED.ModifiedDate,ED.ModifiedBy,CR.ControlRoomId,CR.ControlRoomName,PD.PackageName,ET.EquipmentTypeName,ET.EquipmentIconName,
	ET.EquipmentCategoryTypeId,ET.EquipmentConnectionTypeId,SM.SystemName,SM.SystemDescription 
	FROM tbl_EquipmentDetails ED 
	INNER JOIN tbl_PackageDetails PD ON ED.PackageId=PD.PackageId
	INNER JOIN tbl_ControlRoomMaster CR ON PD.ControlRoomId=CR.ControlRoomId
	INNER JOIN tbl_EquipmentTypeMaster ET ON ED.EquipmentTypeId=ET.EquipmentTypeId
	INNER JOIN tbl_SystemMaster SM ON ED.SystemId=SM.SystemId
	WHERE ED.EquipmentId IN (SELECT DataValue from fnc_CommaSeparated(@EquipmentIds)) AND ED.DataStatus=1
END

GO
/****** Object:  StoredProcedure [dbo].[USP_EquipmentDetailsGetBySystemId]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_EquipmentDetailsGetBySystemId]
@SystemId smallint
AS BEGIN
	SELECT ED.EquipmentId,ED.PackageId,ED.EquipmentTypeId,ED.SystemId,ED.EquipmentName,ED.DirectionId,
	ED.ProtocolTypeId,ED.IpAddress,ED.PortNumber,ED.LoginId,ED.[Password],ED.ChainageNumber,ED.Latitude,
	ED.Longitude,ED.MacAddress,ED.ModelNumber,ED.SerialNumber,ED.ManufacturerDetail,ED.VendorDetail,ED.ManufacturerDate,
	ED.PurchageDate,ED.WarrantyExpireDate,ED.OnLineStatus,ED.DataStatus,ED.CreatedDate,ED.CreatedBy,
	ED.ModifiedDate,ED.ModifiedBy,CR.ControlRoomId,CR.ControlRoomName,PD.PackageName,ET.EquipmentTypeName,ET.EquipmentIconName,
	ET.EquipmentCategoryTypeId,ET.EquipmentConnectionTypeId,SM.SystemName,SM.SystemDescription 
	FROM tbl_EquipmentDetails ED 
	INNER JOIN tbl_PackageDetails PD ON ED.PackageId=PD.PackageId
	INNER JOIN tbl_ControlRoomMaster CR ON PD.ControlRoomId=CR.ControlRoomId
	INNER JOIN tbl_EquipmentTypeMaster ET ON ED.EquipmentTypeId=ET.EquipmentTypeId
	INNER JOIN tbl_SystemMaster SM ON ED.SystemId=SM.SystemId
	WHERE ED.SystemId=@SystemId AND ED.DataStatus=1
END

GO
/****** Object:  StoredProcedure [dbo].[USP_EquipmentDetailsInsertUpdate]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_EquipmentDetailsInsertUpdate] 
@EquipmentId bigint,
@PackageId smallint,
@SystemId smallint,
@EquipmentTypeId smallint,
@ProtocolTypeId smallint,
@EquipmentName varchar(100),
@DirectionId smallint,
@IpAddress varchar(20),	     
@PortNumber int,
@LoginId varchar(50),	     
@Password varchar(50),
@ChainageNumber decimal(16,3),  
@Latitude decimal(12, 9),
@Longitude	decimal(12, 9) ,  
@MacAddress varchar(100),	     
@ModelNumber varchar(100),	     
@SerialNumber varchar(100),	     
@ManufacturerDetail varchar(100),	     
@VendorDetail varchar(100),	     
@ManufacturerDate date,
@PurchageDate date,
@WarrantyExpireDate date, 
@DataStatus smallint,
@UserId bigint,
@CDateTime DateTime

AS
BEGIN
	DECLARE @MenuId smallint=4;
	DECLARE @CVal nvarchar(4000)
	DECLARE @PVal nvarchar(4000)
	CREATE TABLE #Temp(AlertMessage varchar(100))
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
	IF EXISTS(SELECT EquipmentId FROM tbl_EquipmentDetails where IpAddress=@IpAddress AND PortNumber=@PortNumber 
	AND EquipmentId<>@EquipmentId AND PortNumber<>0)
		BEGIN
			INSERT INTO #Temp(AlertMessage)
			VALUES('Ip Address and Port already exists!')
		END
	
	SELECT @cnt=COUNT(AlertMessage)  FROM #Temp
	IF(@cnt=0)
		BEGIN
			IF(@EquipmentId=0)
			BEGIN
				insert into tbl_EquipmentDetails(SystemId,PackageId,EquipmentTypeId,ProtocolTypeId,EquipmentName,DirectionId,IpAddress,PortNumber,
				LoginId,Password,ChainageNumber,Latitude,Longitude,MacAddress,
				ModelNumber,SerialNumber,ManufacturerDetail,VendorDetail,ManufacturerDate,
				PurchageDate,WarrantyExpireDate,DataStatus,CreatedDate,CreatedBy)
				values(@SystemId,@PackageId,@EquipmentTypeId,@ProtocolTypeId,@EquipmentName,@DirectionId,@IpAddress,@PortNumber,
				@LoginId,@Password,@ChainageNumber,@Latitude,@Longitude,@MacAddress,
				@ModelNumber,@SerialNumber,@ManufacturerDetail,@VendorDetail,@ManufacturerDate,
				@PurchageDate,@WarrantyExpireDate,@DataStatus,@CDateTime,@UserId);
				SELECT @EquipmentId=@@IDENTITY

				SET @CVal=(SELECT * FROM tbl_EquipmentDetails WHERE EquipmentId=@EquipmentId FOR JSON AUTO, WITHOUT_ARRAY_WRAPPER)		
				
				INSERT INTO tbl_ActivityLog(UserId,CurrentColumn,ActionId,MenuId,CreatedDate)
				VALUES(@UserId,@CVal,'Insert',@MenuId,@CDateTime);
				
				INSERT INTO #Temp(AlertMessage)VALUES('success');
			END
			ELSE
			BEGIN
				
				SET @PVal=(SELECT * FROM tbl_EquipmentDetails WHERE EquipmentId=@EquipmentId FOR JSON AUTO, WITHOUT_ARRAY_WRAPPER)	
				
				UPDATE tbl_EquipmentDetails SET 
				PackageId=@PackageId,EquipmentTypeId=@EquipmentTypeId,EquipmentName=@EquipmentName,ProtocolTypeId=@ProtocolTypeId,
				DirectionId=@DirectionId,IpAddress=@IpAddress,PortNumber=@PortNumber,
				LoginId=@LoginId,Password=@Password,ChainageNumber=@ChainageNumber,
				Latitude=@Latitude,Longitude=@Longitude,MacAddress=@MacAddress,
				ModelNumber=@ModelNumber,SerialNumber=@SerialNumber,ManufacturerDetail=@ManufacturerDetail,
				VendorDetail=@VendorDetail,ManufacturerDate=@ManufacturerDate,
				PurchageDate=@PurchageDate,WarrantyExpireDate=@WarrantyExpireDate,
				DataStatus=@DataStatus,ModifiedDate=@CDateTime,ModifiedBy=@UserId,SystemId=@SystemId
				WHERE EquipmentId=@EquipmentId
				
				SET @CVal=(SELECT * FROM tbl_EquipmentDetails WHERE EquipmentId=@EquipmentId FOR JSON AUTO, WITHOUT_ARRAY_WRAPPER)		

				INSERT INTO tbl_ActivityLog(UserId,PrevColumn,CurrentColumn,ActionId,MenuId,CreatedDate)
				VALUES(@UserId,@PVal,@CVal,'Update',@MenuId,@CDateTime);

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
/****** Object:  StoredProcedure [dbo].[USP_EquipmentTypeMasterGetAll]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_EquipmentTypeMasterGetAll]
AS BEGIN
	SELECT * FROM tbl_EquipmentTypeMaster ORDER BY EquipmentLevel
END
GO
/****** Object:  StoredProcedure [dbo].[USP_ErrorInfoInsert]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_ErrorInfoInsert]

AS  INSERT INTO tbl_ErrorInfo(ErrorNumber,ErrorSeverity,ErrorState,ErrorProcedure,ErrorLine,ErrorMessage)
	SELECT ERROR_NUMBER() AS ErrorNumber,ERROR_SEVERITY() AS ErrorSeverity,ERROR_STATE() AS ErrorState,
	ERROR_PROCEDURE() AS ErrorProcedure,ERROR_LINE() AS ErrorLine ,ERROR_MESSAGE() AS ErrorMessage;  
GO
/****** Object:  StoredProcedure [dbo].[USP_EventsTypeMasterGetAll]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_EventsTypeMasterGetAll]
AS BEGIN
	SELECT * FROM tbl_EventsTypeMaster
END
GO
/****** Object:  StoredProcedure [dbo].[USP_EventsTypeMasterGetBySystemId]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_EventsTypeMasterGetBySystemId]
@SystemId smallint
AS BEGIN
	SELECT * FROM tbl_EventsTypeMaster
	WHERE SystemId IN (@SystemId,0) 
END
GO
/****** Object:  StoredProcedure [dbo].[USP_EventsTypeUpdate]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_EventsTypeUpdate] 
@SessionId varchar(20),
@SystemId smallint,
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
		
		SELECT @MenuId=MenuId FROM tbl_MenuMaster WHERE MenuName ='Event Config' AND SystemId=@SystemId
		SELECT @ActionId=SystemName FROM tbl_SystemMaster WHERE SystemId=@SystemId
		
		SET @ActionId=@ActionId+'- Modified'
		
		UPDATE T SET T.EventsRequired=V.EventsRequired,T.ReviewRequired=V.ReviewRequired,T.ChallanTypeId=V.ChallanTypeId,
		T.MinimumValue=V.MinimumValue,T.MaximumValue=V.MaximumValue
		FROM tbl_EventsTypeMaster T INNER JOIN
		(
			SELECT EventTypeId,EventsRequired,ReviewRequired,ChallanTypeId,MinimumValue,MaximumValue,@SystemId AS SystemId 
			FROM temp_EventsTypeMaster
		    WHERE SessionId=@SessionId
		) V ON T.EventTypeId=V.EventTypeId AND T.SystemId=V.SystemId
		
		DELETE FROM temp_EventsTypeMaster WHERE SessionId=@SessionId

		INSERT INTO tbl_ActivityLog(UserId,ActionId,MenuId,CreatedDate)
		VALUES(@CreatedBy,@ActionId,@MenuId,@CreatedDate);
		
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
/****** Object:  StoredProcedure [dbo].[USP_FUN_TBL_DATA]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_FUN_TBL_DATA]
AS
BEGIN
	SELECT MessageId,EquipmentIds,MessageTypeId,DisplayTimout,ValidTillDate,MediaPath,MessageDetails,DataStatus,CreatedDate,
		CreatedBy,ModifiedDate,ModifiedBy,DataSendStatus,MediaSendStatus FROM tbl_VMSMessageDetails T CROSS APPLY 
		dbo.fnc_ValueSplit(T.EquipmentIds) V
END
GO
/****** Object:  StoredProcedure [dbo].[USP_IncidentActionHistorGetById]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_IncidentActionHistorGetById]
@IncidentId varchar(255)
AS BEGIN
	SELECT IncidentId,ActionImagePath,ActionVideoPath,ActionAudioPath,ActionTakenById,ActionTakenRemark,
	ActionTakenDateTime,ActionStatusId,DataSendStatus,MediaSendStatus,ISNULL(UM.LoginId,'SuperAdmin') as ActionTakenByName,
	ISM.IncidentStatusName AS ActionStatusName,ISM.IncidentStatusIcon AS ActionStatusIcon,
	ISM.IncidentStatusColorCode AS ActionStatusColorCode,ID.AssignedToId,ISNULL(AM.LoginId,'SuperAdmin') as AssignedToName
	FROM tbl_IncidentActionHistory ID
	LEFT JOIN tbl_IncidentStatusMaster ISM ON ID.ActionStatusId=ISM.IncidentStatusId
    LEFT JOIN tbl_UserMaster UM ON ID.ActionTakenById=UM.UserId
	LEFT JOIN tbl_UserMaster AM ON ID.AssignedToId=AM.UserId
	WHERE IncidentId=@IncidentId
	ORDER BY ActionTakenDateTime
END
GO
/****** Object:  StoredProcedure [dbo].[USP_IncidentActionInsert]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_IncidentActionInsert]
@IncidentId varchar(255),
@ActionImagePath varchar(255),
@ActionVideoPath varchar(255),
@ActionAudioPath varchar(255),
@AssignedToId bigint,
@ActionTakenById bigint,
@ActionTakenRemark varchar(255),
@ActionTakenDateTime Datetime,
@ActionStatusId smallint

AS BEGIN
DECLARE @MenuId smallint=26;
DECLARE @IncidentStatusName varchar(100)
CREATE TABLE #Temp(AlertMessage varchar(100))
BEGIN TRY
	SELECT @MenuId=MenuId FROM tbl_MenuMaster WHERE MenuURL ='pendigIncident'
	SELECT @IncidentStatusName=IncidentStatusName FROM tbl_IncidentStatusMaster WHERE IncidentStatusId=@ActionStatusId
	INSERT INTO tbl_IncidentActionHistory(IncidentId,ActionImagePath,ActionVideoPath,ActionAudioPath,AssignedToId,ActionTakenById,ActionTakenRemark,ActionTakenDateTime,ActionStatusId)
	VALUES(@IncidentId,@ActionImagePath,@ActionVideoPath,@ActionAudioPath,@AssignedToId,@ActionTakenById,@ActionTakenRemark,@ActionTakenDateTime,@ActionStatusId)
	if(@ActionTakenById IN (4,5,9))
	BEGIN
		UPDATE tbl_IncidentDetailsHistory SET IncidentStatusId=@ActionStatusId,AssignedToId=@AssignedToId
		WHERE IncidentId=@IncidentId
	END
	ELSE
	BEGIN
		UPDATE tbl_IncidentDetailsHistory SET IncidentStatusId=@ActionStatusId
		WHERE IncidentId=@IncidentId
	END

	INSERT INTO tbl_ActivityLog(UserId,ActionId,MenuId,CreatedDate)
	VALUES(@ActionTakenById,@IncidentStatusName,@MenuId,@ActionTakenDateTime);
	
	INSERT INTO #Temp(AlertMessage)VALUES('success');
END TRY  
	BEGIN CATCH  
		INSERT INTO #Temp(AlertMessage)VALUES('failed');
		EXECUTE USP_ErrorInfoInsert;  
	END CATCH  
		select * from #Temp;
END
GO
/****** Object:  StoredProcedure [dbo].[USP_IncidentCategoryMasterGetAll]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_IncidentCategoryMasterGetAll]
AS BEGIN
	SELECT * FROM tbl_IncidentCategoryMaster
	ORDER BY OrderBy
END
GO
/****** Object:  StoredProcedure [dbo].[USP_IncidentDetailsGetById]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_IncidentDetailsGetById]
@IncidentId varchar(255)
AS BEGIN
	SELECT ID.IncidentId,ID.IncidentCategoryId,ICM.IncidentCategoryName,ID.PriorityId,ID.IncidentDescription,ID.IncidentImagePath,ID.IncidentVideoPath,ID.IncidentAudioPath,
	ID.DirectionId,ID.ChainageNumber,ID.Latitude,ID.Longitude,ID.VehiclePlateNumber,ID.VehicleClassId,VC.VehicleClassName,ID.SourceSystemId,SM.SystemName AS SourceSystemName,
	ID.EquipmentId,ED.EquipmentName,ID.NearByPTZId,ID.IncidentGeneratedByTypeId,ID.IncidentGeneratedById,ISNULL(IG.LoginId,'SuperAdmin') as IncidentGeneratedByName,
	ID.AssignedToId,ISNULL(AM.LoginId,'SuperAdmin') as AssignedToName,ISM.ProcessPercentage,ID.DataSendStatus,ID.MediaSendStatus,ID.IncidentCloseImagePath,ID.IncidentStatusId,ISM.IncidentStatusName,
	ISM.IncidentStatusIcon,	ISM.IncidentStatusColorCode,ID.CreatedDate,ID.CreatedBy,ID.ModifiedDate,ID.ModifiedBy
	FROM tbl_IncidentDetailsHistory ID
	LEFT JOIN tbl_IncidentStatusMaster ISM ON ID.IncidentStatusId=ISM.IncidentStatusId
	LEFT JOIN tbl_IncidentCategoryMaster ICM ON ID.IncidentCategoryId=ICM.IncidentCategoryId
	LEFT JOIN tbl_VehicleClass VC ON ID.VehicleClassId=VC.VehicleClassId
	LEFT JOIN tbl_EquipmentDetails ED ON ID.EquipmentId=ED.EquipmentId
	LEFT JOIN tbl_UserMaster IG ON ID.IncidentGeneratedById=IG.UserId
	LEFT JOIN tbl_UserMaster AM ON ID.AssignedToId=AM.UserId
	LEFT JOIN tbl_SystemMaster SM ON ID.SourceSystemId=SM.SystemId
	WHERE IncidentId=@IncidentId
END
GO
/****** Object:  StoredProcedure [dbo].[USP_IncidentDetailsInsert]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_IncidentDetailsInsert] 
@IncidentId	varchar(255),
@IncidentCategoryId smallint,
@PriorityId smallint,
@IncidentDescription varchar(500),
@IncidentImagePath varchar(255),
@IncidentVideoPath varchar(255),
@IncidentAudioPath varchar(255),
@DirectionId int,
@ChainageNumber decimal(16,3),
@Latitude decimal(8,6),
@Longitude decimal(9,6),
@VehiclePlateNumber varchar(20),
@VehicleClassId smallint,
@SourceSystemId	int,
@EquipmentId bigint,
@IncidentGeneratedByTypeId smallint,
@IncidentGeneratedById bigint,
@AssignedToId bigint,
@IncidentStatusId smallint,
@CreatedDate datetime,
@CreatedBy bigint

AS
BEGIN
	DECLARE @MenuId smallint=26;
	DECLARE @CVal nvarchar(4000)
	DECLARE @PVal nvarchar(4000)
	DECLARE @NearByPTZId bigint =0
	CREATE TABLE #Temp(AlertMessage varchar(100))
	BEGIN TRY 
		SELECT @MenuId=MenuId FROM tbl_MenuMaster WHERE MenuName ='IMS'
		if(@IncidentId='')
		BEGIN
			SELECT @IncidentId=ReferenceNo FROM tbl_IncidentSourceMaster where SourceId=@SourceSystemId
			SET @IncidentId=ISNULL(@IncidentId,'')+FORMAT(GETDATE(),'yyyyMMddHHmmssffff')
		END

		CREATE TABLE #temPTZ(EquipmentId bigint,ChainageNumber decimal(16,3),DifChainageNumber decimal(16,3))

		INSERT INTO #temPTZ(EquipmentId,ChainageNumber)
		SELECT EquipmentId,ChainageNumber FROM tbl_EquipmentDetails where EquipmentTypeId=1
		UPDATE #temPTZ SET DifChainageNumber =ABS(ChainageNumber-@ChainageNumber)
		SELECT TOP 1 @NearByPTZId=EquipmentId FROM #temPTZ  ORDER BY DifChainageNumber
		insert into tbl_IncidentDetailsHistory(IncidentId,IncidentCategoryId,PriorityId,IncidentDescription,IncidentImagePath,IncidentVideoPath,
		IncidentAudioPath,DirectionId,ChainageNumber,Latitude,Longitude,VehiclePlateNumber,VehicleClassId,SourceSystemId,EquipmentId,
		NearByPTZId,IncidentGeneratedByTypeId,IncidentGeneratedById,AssignedToId,IncidentStatusId,CreatedDate,CreatedBy)
		values(@IncidentId,@IncidentCategoryId,@PriorityId,@IncidentDescription,@IncidentImagePath,@IncidentVideoPath,@IncidentAudioPath,
		@DirectionId,@ChainageNumber,@Latitude,@Longitude,@VehiclePlateNumber,@VehicleClassId,@SourceSystemId,@EquipmentId,@NearByPTZId,
		@IncidentGeneratedByTypeId,@IncidentGeneratedById,@AssignedToId,@IncidentStatusId,@CreatedDate,@CreatedBy);
		
		INSERT INTO tbl_IncidentActionHistory(IncidentId,ActionImagePath,ActionVideoPath,ActionAudioPath,ActionTakenById,
		ActionTakenRemark,ActionTakenDateTime,ActionStatusId)

		VALUES(@IncidentId,@IncidentImagePath,@IncidentVideoPath,@IncidentAudioPath,@IncidentGeneratedById,'New incident created',@CreatedDate,1)
		IF(@IncidentStatusId>1 AND @AssignedToId>0)
		BEGIN
			SET @IncidentDescription=''
		    SELECT @IncidentDescription=IncidentStatusName FROM tbl_IncidentStatusMaster WHERE IncidentStatusId=@IncidentStatusId
			if(ISNULL(@IncidentDescription,'')<>'')
				SET @IncidentDescription='Incident '+@IncidentDescription
			else
				SET @IncidentDescription=''
			INSERT INTO tbl_IncidentActionHistory(IncidentId,ActionImagePath,ActionVideoPath,ActionAudioPath,ActionTakenById,
			ActionTakenRemark,ActionTakenDateTime,ActionStatusId)
			VALUES(@IncidentId,@IncidentImagePath,@IncidentVideoPath,@IncidentAudioPath,@IncidentStatusId,@IncidentDescription,@CreatedDate,@IncidentStatusId)
		END
		SET @CVal=(SELECT * FROM tbl_IncidentDetailsHistory WHERE IncidentId=@IncidentId FOR JSON AUTO, WITHOUT_ARRAY_WRAPPER)		
		INSERT INTO tbl_ActivityLog(UserId,CurrentColumn,ActionId,MenuId,CreatedDate)
		VALUES(@CreatedBy,@CVal,'Insert',@MenuId,@CreatedDate);
		INSERT INTO #Temp(AlertMessage)VALUES('success');
	END TRY  
	BEGIN CATCH  
		INSERT INTO #Temp(AlertMessage)VALUES('failed');
		EXECUTE USP_ErrorInfoInsert;  
	END CATCH  
		select * from #Temp;
END


GO
/****** Object:  StoredProcedure [dbo].[USP_IncidentDetailsUpdate]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_IncidentDetailsUpdate] 
@IncidentId	varchar(255),
@IncidentCategoryId smallint,
@PriorityId smallint,
@IncidentDescription varchar(500),
@IncidentImagePath varchar(255),
@IncidentVideoPath varchar(255),
@IncidentAudioPath varchar(255),
@DirectionId int,
@ChainageNumber decimal(16,3),
@Latitude decimal(8,6),
@Longitude decimal(9,6),
@VehiclePlateNumber varchar(20),
@VehicleClassId smallint,
@SourceSystemId	int,
@EquipmentId bigint,
@IncidentGeneratedByTypeId smallint,
@IncidentGeneratedById bigint,
@AssignedToId bigint,
@IncidentStatusId smallint,
@ModifiedDate datetime,
@ModifiedBy bigint

AS
BEGIN
	DECLARE @MenuId smallint=26;
	DECLARE @CVal nvarchar(4000)
	DECLARE @PVal nvarchar(4000)
	
	DECLARE @NearByPTZId bigint =0
	CREATE TABLE #Temp(AlertMessage varchar(100))
	BEGIN TRY  
		SET @CVal=(SELECT * FROM tbl_IncidentDetailsHistory WHERE IncidentId=@IncidentId FOR JSON AUTO, WITHOUT_ARRAY_WRAPPER)	
		
		
		CREATE TABLE #temPTZ(EquipmentId bigint,ChainageNumber decimal(16,3),DifChainageNumber decimal(16,3))

		INSERT INTO #temPTZ(EquipmentId,ChainageNumber)
		SELECT EquipmentId,ChainageNumber FROM tbl_EquipmentDetails where EquipmentTypeId=1
		UPDATE #temPTZ SET DifChainageNumber =ABS(ChainageNumber-@ChainageNumber)
		SELECT TOP 1 @NearByPTZId=EquipmentId FROM #temPTZ  ORDER BY DifChainageNumber
		
		UPDATE tbl_IncidentDetailsHistory SET 
		IncidentCategoryId=@IncidentCategoryId,PriorityId=@PriorityId,IncidentDescription=@IncidentDescription,
		IncidentImagePath=@IncidentImagePath,DirectionId=@DirectionId,ChainageNumber=@ChainageNumber,Latitude=@Latitude,
		Longitude=@Longitude,VehiclePlateNumber=@VehiclePlateNumber,VehicleClassId=@VehicleClassId,SourceSystemId=@SourceSystemId,
		EquipmentId=@EquipmentId,AssignedToId=@AssignedToId,ModifiedDate=@ModifiedDate,ModifiedBy=@ModifiedBy,NearByPTZId=@NearByPTZId
		WHERE IncidentId=@IncidentId
		SET @PVal=(SELECT * FROM tbl_IncidentDetailsHistory WHERE IncidentId=@IncidentId FOR JSON AUTO, WITHOUT_ARRAY_WRAPPER)
		
		INSERT INTO tbl_IncidentActionHistory(IncidentId,ActionImagePath,ActionVideoPath,ActionAudioPath,ActionTakenById,
		ActionTakenRemark,ActionTakenDateTime,ActionStatusId)
		VALUES(@IncidentId,@IncidentImagePath,@IncidentVideoPath,@IncidentAudioPath,@IncidentGeneratedById,'Incident modified',@ModifiedDate,8)
		IF(@IncidentStatusId>1 AND @AssignedToId>0)
		BEGIN
			SET @IncidentDescription=''
		    SELECT @IncidentDescription=IncidentStatusName FROM tbl_IncidentStatusMaster WHERE IncidentStatusId=@IncidentStatusId
			if(ISNULL(@IncidentDescription,'')<>'')
				SET @IncidentDescription='Incident '+@IncidentDescription
			else
				SET @IncidentDescription=''
			INSERT INTO tbl_IncidentActionHistory(IncidentId,ActionImagePath,ActionVideoPath,ActionAudioPath,ActionTakenById,
			ActionTakenRemark,ActionTakenDateTime,ActionStatusId)
			VALUES(@IncidentId,@IncidentImagePath,@IncidentVideoPath,@IncidentAudioPath,@IncidentStatusId,@IncidentDescription,@ModifiedDate,@IncidentStatusId)
		END
			
		INSERT INTO tbl_ActivityLog(UserId,PrevColumn,CurrentColumn,ActionId,MenuId,CreatedDate)
		VALUES(@ModifiedBy,@PVal,@CVal,'Update',@MenuId,@ModifiedDate);
		INSERT INTO #Temp(AlertMessage)VALUES('success');
	END TRY  
	BEGIN CATCH  
		INSERT INTO #Temp(AlertMessage)VALUES('failed');
		EXECUTE USP_ErrorInfoInsert;  
	END CATCH  
		select * from #Temp;
END


GO
/****** Object:  StoredProcedure [dbo].[USP_IncidentGetByFilter]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_IncidentGetByFilter]
@FilterQuery varchar(4000)
AS BEGIN
	EXEC('SELECT ID.IncidentId,CR.ControlRoomId,CR.ControlRoomName,PD.PackageId,PD.PackageName,ID.IncidentCategoryId,ICM.IncidentCategoryName,ID.PriorityId,ID.IncidentDescription,ID.IncidentImagePath,ID.IncidentVideoPath,ID.IncidentAudioPath,
	ID.DirectionId,ID.ChainageNumber,ID.Latitude,ID.Longitude,ID.VehiclePlateNumber,ID.VehicleClassId,VC.VehicleClassName,ID.SourceSystemId,SM.SystemName AS SourceSystemName,
	ID.EquipmentId,ED.EquipmentName,ID.NearByPTZId,ID.IncidentGeneratedByTypeId,ID.IncidentGeneratedById,IG.LoginId as IncidentGeneratedByName,
	ID.AssignedToId,AM.LoginId as AssignedToName,ISM.ProcessPercentage,ID.DataSendStatus,ID.MediaSendStatus,ID.IncidentCloseImagePath,ID.IncidentStatusId,ISM.IncidentStatusName,
	ISM.IncidentStatusIcon,	ISM.IncidentStatusColorCode,ID.CreatedDate,ID.CreatedBy,ID.ModifiedDate,ID.ModifiedBy
	FROM tbl_IncidentDetailsHistory ID
	LEFT JOIN tbl_PackageDetails PD ON ID.ChainageNumber>=PD.StartChainageNumber AND ID.ChainageNumber<=PD.EndChainageNumber
	LEFT JOIN tbl_ControlRoomMaster CR ON PD.ControlRoomId=CR.ControlRoomId
	LEFT JOIN tbl_IncidentStatusMaster ISM ON ID.IncidentStatusId=ISM.IncidentStatusId
	LEFT JOIN tbl_IncidentCategoryMaster ICM ON ID.IncidentCategoryId=ICM.IncidentCategoryId
	LEFT JOIN tbl_VehicleClass VC ON ID.VehicleClassId=VC.VehicleClassId
	LEFT JOIN tbl_EquipmentDetails ED ON ID.EquipmentId=ED.EquipmentId
	LEFT JOIN tbl_UserMaster IG ON ID.IncidentGeneratedById=IG.UserId
	LEFT JOIN tbl_UserMaster AM ON ID.AssignedToId=AM.UserId
	LEFT JOIN tbl_SystemMaster SM ON ID.SourceSystemId=SM.SystemId
			'+@FilterQuery+' ')
END
GO
/****** Object:  StoredProcedure [dbo].[USP_IncidentGetClose]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_IncidentGetClose]
@Hours smallint
AS BEGIN
    DECLARE @MinDate DateTime
	IF(@Hours=0)
	BEGIN
		SELECT @MinDate=MIN(CreatedDate) FROM tbl_IncidentDetailsHistory WHERE IncidentStatusId IN (6,7)
		SET @MinDate=ISNULL(@MinDate,GETDATE())
	END
	ELSE
	BEGIN
		SELECT @MinDate=MAX(CreatedDate) FROM tbl_IncidentDetailsHistory WHERE IncidentStatusId IN (6,7)
		SET @MinDate=ISNULL(@MinDate,GETDATE())
		SET @MinDate=DATEADD(HOUR,-1*@Hours,@MinDate)
	END
	SELECT ID.IncidentId,CR.ControlRoomId,CR.ControlRoomName,PD.PackageId,PD.PackageName,ID.IncidentCategoryId,ICM.IncidentCategoryName,ID.PriorityId,ID.IncidentDescription,ID.IncidentImagePath,ID.IncidentVideoPath,ID.IncidentAudioPath,
	ID.DirectionId,ID.ChainageNumber,ID.Latitude,ID.Longitude,ID.VehiclePlateNumber,ID.VehicleClassId,VC.VehicleClassName,ID.SourceSystemId,SM.SystemName AS SourceSystemName,
	ID.EquipmentId,ED.EquipmentName,ID.NearByPTZId,ID.IncidentGeneratedByTypeId,ID.IncidentGeneratedById,IG.LoginId as IncidentGeneratedByName,
	ID.AssignedToId,AM.LoginId as AssignedToName,ISM.ProcessPercentage,ID.DataSendStatus,ID.MediaSendStatus,ID.IncidentCloseImagePath,ID.IncidentStatusId,ISM.IncidentStatusName,
	ISM.IncidentStatusIcon,	ISM.IncidentStatusColorCode,ID.CreatedDate,ID.CreatedBy,ID.ModifiedDate,ID.ModifiedBy
	FROM tbl_IncidentDetailsHistory ID
	LEFT JOIN tbl_PackageDetails PD ON ID.ChainageNumber>=PD.StartChainageNumber AND ID.ChainageNumber<=PD.EndChainageNumber
	LEFT JOIN tbl_ControlRoomMaster CR ON PD.ControlRoomId=CR.ControlRoomId
	LEFT JOIN tbl_IncidentStatusMaster ISM ON ID.IncidentStatusId=ISM.IncidentStatusId
	LEFT JOIN tbl_IncidentCategoryMaster ICM ON ID.IncidentCategoryId=ICM.IncidentCategoryId
	LEFT JOIN tbl_VehicleClass VC ON ID.VehicleClassId=VC.VehicleClassId
	LEFT JOIN tbl_EquipmentDetails ED ON ID.EquipmentId=ED.EquipmentId
	LEFT JOIN tbl_UserMaster IG ON ID.IncidentGeneratedById=IG.UserId
	LEFT JOIN tbl_UserMaster AM ON ID.AssignedToId=AM.UserId
	LEFT JOIN tbl_SystemMaster SM ON ID.SourceSystemId=SM.SystemId
	WHERE ID.IncidentStatusId IN (6,7) AND ID.CreatedDate>=@MinDate
END
GO
/****** Object:  StoredProcedure [dbo].[USP_IncidentGetInProgress]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_IncidentGetInProgress]
@Hours smallint=0
AS BEGIN
    DECLARE @MinDate DateTime
	IF(@Hours=0)
	BEGIN
		SELECT @MinDate=MIN(CreatedDate) FROM tbl_IncidentDetailsHistory WHERE IncidentStatusId NOT IN (1,6,7,8)
		SET @MinDate=ISNULL(@MinDate,GETDATE())
	END
	ELSE
	BEGIN
		SELECT @MinDate=MAX(CreatedDate) FROM tbl_IncidentDetailsHistory WHERE IncidentStatusId NOT IN (1,6,7,8)
		SET @MinDate=ISNULL(@MinDate,GETDATE())
		SET @MinDate=DATEADD(HOUR,-1*@Hours,@MinDate)
	END
	SELECT ID.IncidentId,CR.ControlRoomId,CR.ControlRoomName,PD.PackageId,PD.PackageName,ID.IncidentCategoryId,ICM.IncidentCategoryName,ID.PriorityId,ID.IncidentDescription,ID.IncidentImagePath,ID.IncidentVideoPath,ID.IncidentAudioPath,
	ID.DirectionId,ID.ChainageNumber,ID.Latitude,ID.Longitude,ID.VehiclePlateNumber,ID.VehicleClassId,VC.VehicleClassName,ID.SourceSystemId,SM.SystemName AS SourceSystemName,
	ID.EquipmentId,ED.EquipmentName,ID.NearByPTZId,ID.IncidentGeneratedByTypeId,ID.IncidentGeneratedById,IG.LoginId as IncidentGeneratedByName,
	ID.AssignedToId,AM.LoginId as AssignedToName,ISM.ProcessPercentage,ID.DataSendStatus,ID.MediaSendStatus,ID.IncidentCloseImagePath,ID.IncidentStatusId,ISM.IncidentStatusName,
	ISM.IncidentStatusIcon,	ISM.IncidentStatusColorCode,ID.CreatedDate,ID.CreatedBy,ID.ModifiedDate,ID.ModifiedBy
	FROM tbl_IncidentDetailsHistory ID
	LEFT JOIN tbl_PackageDetails PD ON ID.ChainageNumber>=PD.StartChainageNumber AND ID.ChainageNumber<=PD.EndChainageNumber
	LEFT JOIN tbl_ControlRoomMaster CR ON PD.ControlRoomId=CR.ControlRoomId
	LEFT JOIN tbl_IncidentStatusMaster ISM ON ID.IncidentStatusId=ISM.IncidentStatusId
	LEFT JOIN tbl_IncidentCategoryMaster ICM ON ID.IncidentCategoryId=ICM.IncidentCategoryId
	LEFT JOIN tbl_VehicleClass VC ON ID.VehicleClassId=VC.VehicleClassId
	LEFT JOIN tbl_EquipmentDetails ED ON ID.EquipmentId=ED.EquipmentId
	LEFT JOIN tbl_UserMaster IG ON ID.IncidentGeneratedById=IG.UserId
	LEFT JOIN tbl_UserMaster AM ON ID.AssignedToId=AM.UserId
	LEFT JOIN tbl_SystemMaster SM ON ID.SourceSystemId=SM.SystemId
	WHERE ID.IncidentStatusId NOT IN (1,6,7,8) AND ID.CreatedDate>=@MinDate
END
GO
/****** Object:  StoredProcedure [dbo].[USP_IncidentGetPending]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_IncidentGetPending]
@Hours smallint=0
AS BEGIN
    DECLARE @MinDate DateTime
	IF(@Hours=0)
	BEGIN
		SELECT @MinDate=MIN(CreatedDate) FROM tbl_IncidentDetailsHistory WHERE IncidentStatusId IN (1,8)
		SET @MinDate=ISNULL(@MinDate,GETDATE())
	END
	ELSE
	BEGIN
		SELECT @MinDate=MAX(CreatedDate) FROM tbl_IncidentDetailsHistory WHERE IncidentStatusId IN (1,8)
		SET @MinDate=ISNULL(@MinDate,GETDATE())
		SET @MinDate=DATEADD(HOUR,-1*@Hours,@MinDate)
	END
	SELECT ID.IncidentId,CR.ControlRoomId,CR.ControlRoomName,PD.PackageId,PD.PackageName,ID.IncidentCategoryId,ICM.IncidentCategoryName,ID.PriorityId,ID.IncidentDescription,ID.IncidentImagePath,ID.IncidentVideoPath,ID.IncidentAudioPath,
	ID.DirectionId,ID.ChainageNumber,ID.Latitude,ID.Longitude,ID.VehiclePlateNumber,ID.VehicleClassId,VC.VehicleClassName,ID.SourceSystemId,SM.SystemName AS SourceSystemName,
	ID.EquipmentId,ED.EquipmentName,ID.NearByPTZId,ID.IncidentGeneratedByTypeId,ID.IncidentGeneratedById,IG.LoginId as IncidentGeneratedByName,
	ID.AssignedToId,AM.LoginId as AssignedToName,ISM.ProcessPercentage,ID.DataSendStatus,ID.MediaSendStatus,ID.IncidentCloseImagePath,ID.IncidentStatusId,ISM.IncidentStatusName,
	ISM.IncidentStatusIcon,	ISM.IncidentStatusColorCode,ID.CreatedDate,ID.CreatedBy,ID.ModifiedDate,ID.ModifiedBy
	FROM tbl_IncidentDetailsHistory ID
	LEFT JOIN tbl_PackageDetails PD ON ID.ChainageNumber>=PD.StartChainageNumber AND ID.ChainageNumber<=PD.EndChainageNumber
	LEFT JOIN tbl_ControlRoomMaster CR ON PD.ControlRoomId=CR.ControlRoomId
	LEFT JOIN tbl_IncidentStatusMaster ISM ON ID.IncidentStatusId=ISM.IncidentStatusId
	LEFT JOIN tbl_IncidentCategoryMaster ICM ON ID.IncidentCategoryId=ICM.IncidentCategoryId
	LEFT JOIN tbl_VehicleClass VC ON ID.VehicleClassId=VC.VehicleClassId
	LEFT JOIN tbl_EquipmentDetails ED ON ID.EquipmentId=ED.EquipmentId
	LEFT JOIN tbl_UserMaster IG ON ID.IncidentGeneratedById=IG.UserId
	LEFT JOIN tbl_UserMaster AM ON ID.AssignedToId=AM.UserId
	LEFT JOIN tbl_SystemMaster SM ON ID.SourceSystemId=SM.SystemId
	WHERE ID.IncidentStatusId IN (1,8) AND ID.CreatedDate>=@MinDate
END
--GO
--EXEC USP_IncidentGetPending
GO
/****** Object:  StoredProcedure [dbo].[USP_IncidentSourceGetAll]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_IncidentSourceGetAll]
AS BEGIN
SELECT * FROM tbl_IncidentSourceMaster
END
GO
/****** Object:  StoredProcedure [dbo].[USP_IncidentStatusMasterGetAll]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_IncidentStatusMasterGetAll]
AS BEGIN
SELECT * FROM tbl_IncidentStatusMaster
END
GO
/****** Object:  StoredProcedure [dbo].[USP_LaneConfigGetAll]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_LaneConfigGetAll]
AS BEGIN
	SELECT * FROM tbl_LaneConfig
END
GO
/****** Object:  StoredProcedure [dbo].[USP_LaneConfigInsertUpdate]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[USP_LaneConfigInsertUpdate] 
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
	DECLARE @LaneCount int
	DECLARE @ActionId varchar(100)
	CREATE TABLE #Temp(AlertMessage varchar(100))
	BEGIN TRY  
		SELECT @MenuId=MenuId FROM tbl_MenuMaster WHERE MenuName ='Lane Config' 
		SELECT @cnt=COUNT(1) FROM tbl_LaneConfig	
		IF(@cnt=0)
			SET @ActionId='Created'
		ELSE
			SET @ActionId='Modified'
		
		CREATE TABLE #tempLaneConfig(LaneNumber smallint,AllowedClassIds varchar(20),AllowedSpeed decimal(18,2) ,DataStatus smallint)

		INSERT INTO #tempLaneConfig(LaneNumber,AllowedClassIds,AllowedSpeed,DataStatus)
		SELECT LaneNumber,AllowedClassIds,AllowedSpeed,DataStatus FROM temp_VSDSLaneConfig
		WHERE SessionId=@SessionId

		DELETE FROM temp_VSDSLaneConfig WHERE SessionId=@SessionId

	
		MERGE tbl_LaneConfig AS TARGET
		USING #tempLaneConfig AS SOURCE 
		ON (TARGET.LaneNumber = SOURCE.LaneNumber) 
		WHEN MATCHED AND TARGET.LaneNumber = SOURCE.LaneNumber 
			THEN UPDATE SET TARGET.DataStatus = SOURCE.DataStatus,
			TARGET.AllowedSpeed = SOURCE.AllowedSpeed,
			TARGET.AllowedClassIds = SOURCE.AllowedClassIds,
			TARGET.ModifiedDate = @ModifiedDate,TARGET.ModifiedBy = @ModifiedBy
		WHEN NOT MATCHED BY TARGET 
		THEN 
			
			INSERT (LaneNumber,AllowedClassIds,AllowedSpeed,DataStatus,CreatedDate,CreatedBy) 
			VALUES (SOURCE.LaneNumber,SOURCE.AllowedClassIds,SOURCE.AllowedSpeed,SOURCE.DataStatus,@CreatedDate,@CreatedBy);
			
		
		INSERT INTO tbl_ActivityLog(UserId,ActionId,MenuId,CreatedDate)
		VALUES(@CreatedBy,@ActionId,@MenuId,@CreatedDate);
		
		INSERT INTO #Temp(AlertMessage)VALUES('success');
		
	END TRY  
	BEGIN CATCH  
		INSERT INTO #Temp(AlertMessage)VALUES('failed');
		EXECUTE USP_ErrorInfoInsert;  
	END CATCH  
		select * from #Temp;
END
--GO 
--EXEC USP_VSDSLaneConfigInsertUpdate 
--@SessionId ='GXQK2RIWFQ',
--@CreatedDate ='20-Feb-2013',
--@CreatedBy =0,
--@ModifiedDate ='20-Feb-2013',
--@ModifiedBy =0


GO
/****** Object:  StoredProcedure [dbo].[USP_LogingActivityInsert]    Script Date: 14-06-2024 15:14:42 ******/
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
/****** Object:  StoredProcedure [dbo].[USP_LogingActivityUpdate]    Script Date: 14-06-2024 15:14:42 ******/
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
/****** Object:  StoredProcedure [dbo].[USP_MasterDataGetBySystemId]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_MasterDataGetBySystemId]
@SystemId smallint=0
AS BEGIN

	SELECT SystemId,SystemName FROM tbl_SystemMaster 
	WHERE DataStatus=1 AND SystemName NOT IN ('TMCS','CRS','MRCS')

	SELECT ControlRoomId,ControlRoomName FROM tbl_ControlRoomMaster WHERE DataStatus=1
	
	SELECT PackageId,PackageName,ControlRoomId,StartChainageNumber,EndChainageNumber 
	FROM tbl_PackageDetails WHERE DataStatus=1

	
	
	IF(@SystemId=0)
	BEGIN
		SELECT ChainageNumber,REPLACE(ChainageNumber,'.','+')ChainageName FROM 
		(
			SELECT DISTINCT ChainageNumber FROM tbl_EquipmentDetails
			WHERE DataStatus=1
		) V 
	END
	ELSE
	BEGIN
		SELECT ChainageNumber,REPLACE(ChainageNumber,'.','+')ChainageName FROM 
		(
			SELECT DISTINCT ChainageNumber FROM tbl_EquipmentDetails
			WHERE SystemId=@SystemId AND DataStatus=1
		) V 
	END

	SELECT IncidentCategoryId,IncidentCategoryName
	FROM tbl_IncidentCategoryMaster WHERE DataStatus=1

	SELECT VehicleClassId,VehicleClassName
	FROM tbl_VehicleClass WHERE DataStatus=1 AND VehicleClassId>0
END
GO
/****** Object:  StoredProcedure [dbo].[USP_MenuGetAll]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[USP_MenuGetAll]
AS BEGIN
	SELECT M.MenuId,M.MenuName,M.MenuURL,M.MenuIcon,M.OderBy,M.ParentId,M.SystemId,M.MennuAccess,M.DataStatus,M.CreatedDate,M.CreatedBy,M.ModifiedDate,M.ModifiedBy
    FROM tbl_MenuMaster M
	WHERE M.DataStatus=1
	ORDER BY OderBy
END

--GO
--EXEC USP_UsersGetByLoginId
--@LoginId='admin'

GO
/****** Object:  StoredProcedure [dbo].[USP_MenuGetByRoleId]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[USP_MenuGetByRoleId]
@RoleId bigint
AS BEGIN
	SELECT M.MenuId,M.MenuName,M.MenuURL,M.MenuIcon,M.OderBy,M.ParentId,M.SystemId,M.MennuAccess,M.DataStatus,M.CreatedDate,M.CreatedBy,M.ModifiedDate,M.ModifiedBy
    FROM tbl_MenuMaster M
	WHERE M.DataStatus=1 and M.MenuId IN (SELECT MenuId FROM tbl_RolePermission WHERE RoleId=@RoleId AND DataView=1)
	ORDER BY OderBy
END

--GO
--EXEC USP_MenuGetByRoleId
--@RoleId=1

GO
/****** Object:  StoredProcedure [dbo].[USP_PackageGetAll]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_PackageGetAll]
AS BEGIN
	SELECT PD.PackageId,PD.ControlRoomId,PD.PackageName,PD.StartChainageNumber,PD.EndChainageNumber,PD.StartLatitude,PD.StartLongitude,
	PD.EndLatitude,PD.EndLongitude,PD.DataStatus,PD.CreatedDate,PD.CreatedBy,PD.ModifiedDate,PD.ModifiedBy,CR.ControlRoomName 
	FROM tbl_PackageDetails PD INNER JOIN tbl_ControlRoomMaster CR ON PD.ControlRoomId=CR.ControlRoomId
END
GO
/****** Object:  StoredProcedure [dbo].[USP_PackageGetById]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_PackageGetById]
@PackageId smallint
AS BEGIN
	SELECT PD.PackageId,PD.ControlRoomId,PD.PackageName,PD.StartChainageNumber,PD.EndChainageNumber,PD.StartLatitude,PD.StartLongitude,
	PD.EndLatitude,PD.EndLongitude,PD.DataStatus,PD.CreatedDate,PD.CreatedBy,PD.ModifiedDate,PD.ModifiedBy,CR.ControlRoomName 
	FROM tbl_PackageDetails PD INNER JOIN tbl_ControlRoomMaster CR ON PD.ControlRoomId=CR.ControlRoomId
	WHERE PD.PackageId=@PackageId
END
GO
/****** Object:  StoredProcedure [dbo].[USP_PackageInsertUpdate]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_PackageInsertUpdate] 
@PackageId smallint,
@ControlRoomId smallint,
@PackageName varchar(50),
@StartChainageNumber Decimal(16,3),
@EndChainageNumber	Decimal(16,3),
@StartLatitude decimal(12, 9),
@StartLongitude decimal(12, 9),
@EndLatitude decimal(12, 9),
@EndLongitude decimal(12, 9),
@DataStatus smallint,
@UserId bigint,
@CDateTime DateTime

AS
BEGIN
	DECLARE @MenuId smallint=7;
	DECLARE @CVal nvarchar(4000)
	DECLARE @PVal nvarchar(4000)
	CREATE TABLE #Temp(AlertMessage varchar(100))
	DECLARE @cnt int
	BEGIN TRY 
	SELECT @MenuId=MenuId FROM tbl_MenuMaster WHERE MenuName ='Package'
	IF EXISTS(SELECT PackageId FROM tbl_PackageDetails where PackageName=@PackageName and PackageId<>@PackageId)
		BEGIN
			INSERT INTO #Temp(AlertMessage)
			VALUES('Control room name already exists!')
		END
	SELECT @cnt=COUNT(AlertMessage)  FROM #Temp
	IF(@cnt=0)
		BEGIN
			IF(@PackageId=0)
			BEGIN
				insert into tbl_PackageDetails(ControlRoomId,PackageName,StartChainageNumber,EndChainageNumber,StartLatitude,
				StartLongitude,EndLatitude,EndLongitude,DataStatus,CreatedDate,CreatedBy)
				values(@ControlRoomId,@PackageName,@StartChainageNumber,@EndChainageNumber,@StartLatitude,
				@StartLongitude,@EndLatitude,@EndLongitude,@DataStatus,@CDateTime,@UserId);
				SELECT @PackageId=@@IDENTITY

				SET @CVal=(SELECT * FROM tbl_PackageDetails WHERE PackageId=@PackageId FOR JSON AUTO, WITHOUT_ARRAY_WRAPPER)		
				
				INSERT INTO tbl_ActivityLog(UserId,CurrentColumn,ActionId,MenuId,CreatedDate)
				VALUES(@UserId,@CVal,'Insert',@MenuId,@CDateTime);
				
				INSERT INTO #Temp(AlertMessage)VALUES('success');
			END
			ELSE
			BEGIN
				
				SET @PVal=(SELECT * FROM tbl_PackageDetails WHERE PackageId=@PackageId FOR JSON AUTO, WITHOUT_ARRAY_WRAPPER)	
				
				UPDATE tbl_PackageDetails SET ControlRoomId=@ControlRoomId,PackageName=@PackageName,StartChainageNumber=@StartChainageNumber,
				EndChainageNumber=@EndChainageNumber,StartLatitude=@StartLatitude,StartLongitude=@StartLongitude,EndLatitude=@EndLatitude,
				EndLongitude=@EndLongitude,DataStatus=@DataStatus,ModifiedDate=@CDateTime,ModifiedBy=@UserId
				WHERE PackageId=@PackageId
				
				SET @CVal=(SELECT * FROM tbl_PackageDetails WHERE PackageId=@PackageId FOR JSON AUTO, WITHOUT_ARRAY_WRAPPER)		

				INSERT INTO tbl_ActivityLog(UserId,PrevColumn,CurrentColumn,ActionId,MenuId,CreatedDate)
				VALUES(@UserId,@PVal,@CVal,'Update',@MenuId,@CDateTime);

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
/****** Object:  StoredProcedure [dbo].[USP_ReportDataGetBySystemId]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_ReportDataGetBySystemId]
@SystemId smallint
AS BEGIN
	SELECT * FROM tbl_ReportMaster 
	WHERE ReportId in
	(
		SELECT Value  FROM tbl_SystemMaster T CROSS APPLY dbo.fnc_ValueSplit(T.ReportIds) V
		WHERE SystemId=@SystemId
	)
END
--GO
--EXEC USP_ReportDataGetBySystemId
--@SystemId=2
GO
/****** Object:  StoredProcedure [dbo].[USP_ReportMasterGetAll]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_ReportMasterGetAll]
AS BEGIN
	SELECT * FROM tbl_ReportMaster;
END
GO
/****** Object:  StoredProcedure [dbo].[USP_ReportMasterGetById]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_ReportMasterGetById]
@ReportId smallint
AS BEGIN
	SELECT * FROM tbl_ReportMaster WHERE ReportId=@ReportId;
END
GO
/****** Object:  StoredProcedure [dbo].[USP_ReportMasterGetByIds]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[USP_ReportMasterGetByIds]
(
@ReportIds varchar(4000)
)
AS BEGIN
	SELECT * FROM tbl_ReportMaster WHERE ReportId IN (SELECT DataValue from fnc_CommaSeparated(@ReportIds)) AND DataStatus=1

END

--GO 
--EXEC USP_ReportMasterGetByIds
--@ReportIds='13,14'

GO
/****** Object:  StoredProcedure [dbo].[USP_ReportMasterGetByName]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_ReportMasterGetByName]
@ReportName varchar(100)
AS BEGIN
	SELECT * FROM tbl_ReportMaster WHERE ReportName=@ReportName;
END
GO
/****** Object:  StoredProcedure [dbo].[USP_RoleInsertUpdate]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_RoleInsertUpdate] 
@RoleId bigint,
@RoleName varchar(200),
@DataStatus smallint,
@UserId bigint,
@CDateTime DateTime

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
				values(@RoleName,@DataStatus,@CDateTime,@UserId);
				SELECT @RoleId=@@IDENTITY

				INSERT INTO tbl_RolePermission(RoleId,MenuId,DataView,DataAdd,DataUpdate,DataStatus,CreatedDate,CreatedBy)
				SELECT @RoleId,MenuId,1,0,0,DataStatus,@CDateTime,@UserId FROM tbl_MenuMaster

				SET @CVal=(SELECT * FROM tbl_RoleMaster WHERE RoleId=@RoleId FOR JSON AUTO, WITHOUT_ARRAY_WRAPPER)		
				
				INSERT INTO tbl_ActivityLog(UserId,CurrentColumn,ActionId,MenuId,CreatedDate)
				VALUES(@UserId,@CVal,'Insert',@MenuId,@CDateTime);
				
				INSERT INTO #Temp(AlertMessage)VALUES('success');
			END
			ELSE
			BEGIN
				
				SET @PVal=(SELECT * FROM tbl_RoleMaster WHERE RoleId=@RoleId FOR JSON AUTO, WITHOUT_ARRAY_WRAPPER)	
				UPDATE tbl_RoleMaster SET RoleName=@RoleName,
					DataStatus=@DataStatus,ModifiedDate=@CDateTime,ModifiedBy=@UserId
					WHERE RoleId=@RoleId
					IF NOT EXISTS(SELECT 1 FROM tbl_RolePermission WHERE RoleId=@RoleId)
					BEGIN
						INSERT INTO tbl_RolePermission(RoleId,MenuId,DataView,DataAdd,DataUpdate,DataStatus,CreatedDate,CreatedBy)
					SELECT @RoleId,MenuId,1,0,0,DataStatus,@CDateTime,@UserId FROM tbl_MenuMaster
					END
				

				SET @CVal=(SELECT * FROM tbl_RoleMaster WHERE RoleId=@RoleId FOR JSON AUTO, WITHOUT_ARRAY_WRAPPER)		

				INSERT INTO tbl_ActivityLog(UserId,PrevColumn,CurrentColumn,ActionId,MenuId,CreatedDate)
				VALUES(@UserId,@PVal,@CVal,'Update',@MenuId,@CDateTime);

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
/****** Object:  StoredProcedure [dbo].[USP_RolePermissionInsertUpdate]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_RolePermissionInsertUpdate] 
@SessionId varchar(20),
@RoleId bigint,
@DataStatus smallint,
@UserId bigint,
@CDateTime DateTime
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
	SELECT MenuId,RoleId,DataView,DataAdd,DataUpdate,DataStatus,@CDateTime,@UserId,@CDateTime,@UserId
	FROM #TempUpload
	
	INSERT INTO tbl_ActivityLog(UserId,ActionId,MenuId,CreatedDate)
	VALUES(@UserId,'Permission Modified',@MenuId,@CDateTime);
	INSERT INTO #Temp(AlertMessage)VALUES('success');
	select * from #Temp;
END

GO
/****** Object:  StoredProcedure [dbo].[USP_RolesGetAll]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_RolesGetAll]

AS BEGIN
	SELECT RoleId,RoleName,DataStatus,CreatedDate,CreatedBy,ModifiedDate,ModifiedBy FROM tbl_RoleMaster 
	ORDER BY ModifiedDate DESC,CreatedDate DESC
END



GO
/****** Object:  StoredProcedure [dbo].[USP_RolesGetById]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_RolesGetById]
@RoleId bigint
AS BEGIN
	SELECT RoleId,RoleName,DataStatus,CreatedDate,CreatedBy,ModifiedDate,ModifiedBy	
	FROM tbl_RoleMaster where RoleId=@RoleId
END
GO
/****** Object:  StoredProcedure [dbo].[USP_RolesPersmissionGetByMenu]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[USP_RolesPersmissionGetByMenu]
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
			ORDER BY RP.OderBy
		END
		ELSE
		BEGIN
			INSERT INTO #Temp(MenuId,ParentId,MenuName,MenuURL,RoleId,DataView,DataAdd,DataUpdate,DataStatus,CreatedDate,CreatedBy,ModifiedDate,ModifiedBy)
			SELECT RP.MenuId,ParentId,MenuName,MenuURL,@RoleId,1,1,1,RP.DataStatus,
			RP.CreatedDate,RP.CreatedBy,RP.ModifiedDate,RP.ModifiedBy
			FROM tbl_MenuMaster RP
			WHERE RP.MenuURL=@MenuURL AND SystemId=@SystemId
			ORDER BY RP.OderBy
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
			ORDER BY MM.OderBy
		END
		ELSE
		BEGIN
			INSERT INTO #Temp(MenuId,ParentId,MenuName,MenuURL,RoleId,DataView,DataAdd,DataUpdate,DataStatus,CreatedDate,CreatedBy,ModifiedDate,ModifiedBy)
			SELECT RP.MenuId,ParentId,MenuName,MenuURL,RP.RoleId,RP.DataView,RP.DataAdd,RP.DataUpdate,RP.DataStatus,
			RP.CreatedDate,RP.CreatedBy,RP.ModifiedDate,RP.ModifiedBy
			FROM tbl_RolePermission RP INNER JOIN tbl_MenuMaster MM ON RP.MenuId=MM.MenuId AND MM.DataStatus=1
			WHERE RP.RoleId=@RoleId AND SystemId=@SystemId
			ORDER BY MM.OderBy
		END
	END

	SELECT * FROM #Temp 
	WHERE MenuURL=@MenuURL AND RoleId=@RoleId
END

--GO
--EXEC USP_RolesPersmissionGetByRoleId
--@RoleId=1
GO
/****** Object:  StoredProcedure [dbo].[USP_RolesPersmissionGetByMenuId]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[USP_RolesPersmissionGetByMenuId]
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
/****** Object:  StoredProcedure [dbo].[USP_RolesPersmissionGetByRoleId]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_RolesPersmissionGetByRoleId]
@RoleId bigint
AS BEGIN

	CREATE table #Temp (MenuId bigint,ParentId bigint,MenuName varchar(100),RoleId bigint,DataView Smallint,DataAdd Smallint,
	DataUpdate smallint,OderBy Smallint,DataStatus smallint,CreatedDate datetime,CreatedBy int,ModifiedDate datetime,ModifiedBy int)

	INSERT INTO #Temp(MenuId,ParentId,MenuName,RoleId,DataView,DataAdd,DataUpdate,OderBy,DataStatus,CreatedDate,CreatedBy,ModifiedDate,ModifiedBy)
	SELECT RP.MenuId,ParentId,MenuName,RP.RoleId,RP.DataView,RP.DataAdd,RP.DataUpdate,MM.OderBy,RP.DataStatus,
	RP.CreatedDate,RP.CreatedBy,RP.ModifiedDate,RP.ModifiedBy
	FROM tbl_RolePermission RP INNER JOIN tbl_MenuMaster MM ON RP.MenuId=MM.MenuId AND MM.DataStatus=1
	WHERE RP.RoleId=@RoleId
	ORDER BY MM.OderBy
	INSERT INTO #Temp(MenuId,ParentId,MenuName,RoleId,DataView,DataAdd,DataUpdate,OderBy,DataStatus,CreatedDate,CreatedBy,ModifiedDate,ModifiedBy)
	SELECT MenuId,ParentId,MenuName,@RoleId,0,0,0,OderBy,DataStatus,CreatedDate,CreatedBy,ModifiedDate,ModifiedBy FROM tbl_MenuMaster WHERE MenuId NOT IN (SELECT MenuId FROM #Temp) AND DataStatus=1

	SELECT * FROM #Temp ORDER BY OderBy
	
END
--GO 
--EXEC USP_RolesPersmissionGetByRoleId
--@RoleId=1
GO
/****** Object:  StoredProcedure [dbo].[USP_SystemGetAll]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_SystemGetAll]
AS BEGIN
	SELECT * FROM tbl_SystemMaster
END
GO
/****** Object:  StoredProcedure [dbo].[USP_SystemGetById]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_SystemGetById]
@SystemId smallint
AS BEGIN
	SELECT * FROM tbl_SystemMaster WHERE SystemId=@SystemId
END
GO
/****** Object:  StoredProcedure [dbo].[USP_SystemGetByName]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_SystemGetByName]
@SystemName varchar(100)
AS BEGIN
	SELECT * FROM tbl_SystemMaster WHERE SystemName=@SystemName
END
GO
/****** Object:  StoredProcedure [dbo].[USP_SystemSettingGet]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_SystemSettingGet]
AS BEGIN
 SELECT * FROM tbl_SystemSetting
END
GO
/****** Object:  StoredProcedure [dbo].[USP_SystemSettingInsertUpdate]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_SystemSettingInsertUpdate] 
@TotalLane smallint,
@IsATCCIndependently bit,
@ATCCByVSDS bit,
@ATCCByVIDS bit,
@TrafficCount smallint,
@TrafficByTime smallint,
@RestrictedVehiclesIds varchar(255),
@DefaultControlRoomId smallint,
@IsWeatherOnline bit,
@WeatherAPI varchar(255),
@WeatherAPIHitPerMinite smallint, 
@CreatedDate DateTime,
@CreatedBy bigint,
@ModifiedDate DateTime,
@ModifiedBy bigint
AS
BEGIN
	DECLARE @PVal varchar(4000)
	DECLARE @CVal varchar(4000)
	DECLARE @MenuId smallint=0;
	CREATE TABLE #Temp(AlertMessage varchar(100))
	DECLARE @cnt int
	DECLARE @CLaneCount int
	DECLARE @DLaneCount int
	BEGIN TRY
	SELECT @MenuId=MenuId FROM tbl_MenuMaster WHERE MenuName ='System Setting'
	SELECT @cnt=COUNT(1)  FROM tbl_SystemSetting
	SELECT @CLaneCount=COUNT(1) FROM tbl_LaneConfig
	
	IF(@cnt=0)
	BEGIN
		insert into tbl_SystemSetting(TotalLane,IsATCCIndependently,ATCCByVSDS,ATCCByVIDS,TrafficCount,TrafficByTime,RestrictedVehiclesIds,DefaultControlRoomId,IsWeatherOnline,WeatherAPI,WeatherAPIHitPerMinite,CreatedDate,CreatedBy)
		values(@TotalLane,@IsATCCIndependently,@ATCCByVSDS,@ATCCByVIDS,@TrafficCount,@TrafficByTime,@RestrictedVehiclesIds,@DefaultControlRoomId,@IsWeatherOnline,@WeatherAPI,@WeatherAPIHitPerMinite,@CreatedDate,@CreatedBy);
		SET @CVal=(SELECT * FROM tbl_SystemSetting  FOR JSON AUTO, WITHOUT_ARRAY_WRAPPER)		
		INSERT INTO tbl_ActivityLog(UserId,CurrentColumn,ActionId,MenuId,CreatedDate)
		VALUES(@CreatedBy,@CVal,'Insert',@MenuId,@CreatedDate);
		INSERT INTO #Temp(AlertMessage)VALUES('success');
	END
	ELSE
	BEGIN
		SET @PVal=(SELECT * FROM tbl_SystemSetting  FOR JSON AUTO, WITHOUT_ARRAY_WRAPPER)
		UPDATE tbl_SystemSetting SET ModifiedDate=@ModifiedDate,ModifiedBy=@ModifiedBy,
		TotalLane=@TotalLane,IsATCCIndependently=@IsATCCIndependently,ATCCByVSDS=@ATCCByVSDS,ATCCByVIDS=@ATCCByVIDS,
		TrafficCount=@TrafficCount,TrafficByTime=@TrafficByTime,RestrictedVehiclesIds=@RestrictedVehiclesIds,
		DefaultControlRoomId=@DefaultControlRoomId,IsWeatherOnline=@IsWeatherOnline,WeatherAPI=@WeatherAPI,
		WeatherAPIHitPerMinite=@WeatherAPIHitPerMinite
		SET @CVal=(SELECT * FROM tbl_SystemSetting  FOR JSON AUTO, WITHOUT_ARRAY_WRAPPER)		
		INSERT INTO tbl_ActivityLog(UserId,PrevColumn,CurrentColumn,ActionId,MenuId,CreatedDate)
		VALUES(@ModifiedBy,@PVal,@CVal,'Update',@MenuId,@ModifiedDate);
		INSERT INTO #Temp(AlertMessage)VALUES('success');

	END
	IF(@CLaneCount>@TotalLane)
	BEGIN
		DELETE FROM tbl_LaneConfig WHERE LaneNumber>@TotalLane
	END
	ELSE
	BEGIN
		IF(@CLaneCount<>@TotalLane)
		BEGIN
			DECLARE @Counter INT 
			SET @Counter=1
			WHILE (@Counter <= @TotalLane)
			BEGIN
				IF NOT EXISTS(SELECT LaneNumber FROM tbl_LaneConfig where LaneNumber=@Counter )
				BEGIN
					INSERT INTO tbl_LaneConfig(LaneNumber)
					VALUES(@Counter)
				END
				SET @Counter  = @Counter  + 1
			END
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
/****** Object:  StoredProcedure [dbo].[USP_SystemUpdate]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_SystemUpdate] 
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
	DECLARE @ActionId varchar(100)
	CREATE TABLE #Temp(AlertMessage varchar(100))
	BEGIN TRY  
		
		SELECT @MenuId=MenuId FROM tbl_MenuMaster WHERE MenuName ='System Config'
		SET @ActionId='Modified'
		
		UPDATE T SET T.DataStatus=V.DataStatus,T.DashBoard=V.DashBoard,T.ReportIds=V.ReportIds 
		FROM tbl_SystemMaster T INNER JOIN
		(
			SELECT SystemId,DataStatus,DashBoard,ReportIds
			FROM temp_SystemMaster
		    WHERE SessionId=@SessionId
		) V ON T.SystemId=V.SystemId
		
		DELETE FROM temp_SystemMaster WHERE SessionId=@SessionId
		UPDATE tbl_SystemMaster SET ReportIds='' WHERE DataStatus=0
		INSERT INTO tbl_ActivityLog(UserId,ActionId,MenuId,CreatedDate)
		VALUES(@CreatedBy,@ActionId,@MenuId,@CreatedDate);
		
		INSERT INTO #Temp(AlertMessage)VALUES('success');
	
	END TRY  
	BEGIN CATCH  
		INSERT INTO #Temp(AlertMessage)VALUES('failed');
		EXECUTE USP_ErrorInfoInsert;  
	END CATCH  
		select * from #Temp;
END
GO
/****** Object:  StoredProcedure [dbo].[USP_UserGetAll]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_UserGetAll]

AS BEGIN
	SELECT U.UserId,U.LoginId,U.LoginPassword,U.FirstName,U.LastName,U.EmailId,UserProfileImage,
	U.MobileNumber,U.AccountExpiredDate,U.RoleId,ISNULL(R.RoleName,'N/A') RoleName,UserTypeId,U.DataStatus,U.CreatedDate,U.CreatedBy,U.ModifiedDate,U.ModifiedBy 
	FROM tbl_UserMaster U 
	LEFT Join tbl_RoleMaster R ON U.RoleId=R.RoleId 
	
END



GO
/****** Object:  StoredProcedure [dbo].[USP_UserGetbyId]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_UserGetbyId]
@UserId bigint
AS BEGIN
	SELECT U.UserId,U.LoginId,U.LoginPassword,U.FirstName,U.LastName,U.EmailId,UserProfileImage,
	U.MobileNumber,U.AccountExpiredDate,U.RoleId,ISNULL(R.RoleName,'N/A') RoleName,UserTypeId,U.DataStatus,U.CreatedDate,U.CreatedBy,U.ModifiedDate,U.ModifiedBy 
	FROM tbl_UserMaster U 
	LEFT Join tbl_RoleMaster R ON U.RoleId=R.RoleId 
	WHERE U.UserId=@UserId
	
END



GO
/****** Object:  StoredProcedure [dbo].[USP_UserGetBySystemUserTypeId]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_UserGetBySystemUserTypeId]
@UserTypeId smallint,
@SystemId smallint
AS BEGIN
	SELECT U.UserId,U.LoginId,U.LoginPassword,U.FirstName,U.LastName,U.EmailId,UserProfileImage,
	U.MobileNumber,U.AccountExpiredDate,U.RoleId,ISNULL(R.RoleName,'N/A') RoleName,UserTypeId,U.DataStatus,U.CreatedDate,U.CreatedBy,U.ModifiedDate,U.ModifiedBy 
	FROM tbl_UserMaster U 
	LEFT Join tbl_RoleMaster R ON U.RoleId=R.RoleId 
	WHERE U.UserTypeId=@UserTypeId AND R.RoleId IN 
	(
		SELECT RoleId FROM tbl_RolePermission
		WHERE MenuId IN 
		(
			SELECT MenuId FROM tbl_MenuMaster WHERE SystemId=@SystemId
		) AND (DataAdd=1 OR DataUpdate=1)
	)
	
END
--GO
--EXEC USP_UserGetBySystemUserTypeId
--@UserTypeId=3,
--@SystemId=6



GO
/****** Object:  StoredProcedure [dbo].[USP_UserGetByUserTypeId]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_UserGetByUserTypeId]
@UserTypeId smallint
AS BEGIN
	SELECT U.UserId,U.LoginId,U.LoginPassword,U.FirstName,U.LastName,U.EmailId,UserProfileImage,
	U.MobileNumber,U.AccountExpiredDate,U.RoleId,ISNULL(R.RoleName,'N/A') RoleName,UserTypeId,U.DataStatus,U.CreatedDate,U.CreatedBy,U.ModifiedDate,U.ModifiedBy 
	FROM tbl_UserMaster U 
	LEFT Join tbl_RoleMaster R ON U.RoleId=R.RoleId 
	WHERE U.UserTypeId=@UserTypeId
	
END



GO
/****** Object:  StoredProcedure [dbo].[USP_UserInsertUpdate]    Script Date: 14-06-2024 15:14:42 ******/
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
@UserTypeId smallint,
@RoleId int,
@DataStatus smallint,
@CDateTime DateTime,
@CreatedBy bigint
AS
BEGIN
	DECLARE @PVal varchar(4000)
	DECLARE @CVal varchar(4000)
	DECLARE @MenuId smallint=10;
	CREATE TABLE #Temp(AlertMessage varchar(100))
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
				insert into tbl_UserMaster(LoginId,LoginPassword,FirstName,LastName,EmailId,MobileNumber,AccountExpiredDate,UserTypeId,RoleId,DataStatus,CreatedDate,CreatedBy)
				values(@LoginId,@LoginPassword,@FirstName,@LastName,@EmailId,@MobileNumber,@AccountExpiredDate,@UserTypeId,@RoleId,@DataStatus,@CDateTime,@UserId);
				SELECT @UserId=@@IDENTITY
				
				SET @CVal=(SELECT * FROM tbl_UserMaster WHERE UserId=@UserId FOR JSON AUTO, WITHOUT_ARRAY_WRAPPER)		
				
				INSERT INTO tbl_ActivityLog(UserId,CurrentColumn,ActionId,MenuId,CreatedDate)
				VALUES(@CreatedBy,@CVal,'Insert',@MenuId,@CDateTime);
				
				INSERT INTO #Temp(AlertMessage)VALUES('User added successfully.');
			END
			ELSE
			BEGIN
				SET @PVal=(SELECT * FROM tbl_UserMaster WHERE UserId=@UserId FOR JSON AUTO, WITHOUT_ARRAY_WRAPPER)	

				UPDATE tbl_UserMaster SET DataStatus=@DataStatus,ModifiedDate=@CDateTime,ModifiedBy=@UserId,UserTypeId=@UserTypeId,
				FirstName=@FirstName,LastName=@LastName,EmailId=@EmailId,MobileNumber=@MobileNumber,AccountExpiredDate=@AccountExpiredDate,RoleId=@RoleId,
				LoginPassword=@LoginPassword,LoginId=@LoginId
				WHERE UserId=@UserId

				SET @CVal=(SELECT * FROM tbl_UserMaster WHERE UserId=@UserId FOR JSON AUTO, WITHOUT_ARRAY_WRAPPER)		

				INSERT INTO tbl_ActivityLog(UserId,PrevColumn,CurrentColumn,ActionId,MenuId,CreatedDate)
				VALUES(@CreatedBy,@PVal,@CVal,'Update',@MenuId,@CDateTime);

				INSERT INTO #Temp(AlertMessage)VALUES('User updated successfully.');

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
/****** Object:  StoredProcedure [dbo].[USP_UserProfileChange]    Script Date: 14-06-2024 15:14:42 ******/
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
/****** Object:  StoredProcedure [dbo].[USP_UsersGetByLoginId]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_UsersGetByLoginId]
@LoginId varchar(100)
AS BEGIN
	SELECT U.UserId,U.LoginId,U.LoginPassword,U.FirstName,U.LastName,U.EmailId,UserProfileImage,
	U.MobileNumber,U.AccountExpiredDate,U.RoleId,ISNULL(R.RoleName,'N/A') RoleName,UserTypeId,U.DataStatus,U.CreatedDate,U.CreatedBy,U.ModifiedDate,U.ModifiedBy 
	FROM tbl_UserMaster U 
	LEFT Join tbl_RoleMaster R ON U.RoleId=R.RoleId 
	WHERE U.LoginId=@LoginId
	
END



GO
/****** Object:  StoredProcedure [dbo].[USP_UserUpdatePassword]    Script Date: 14-06-2024 15:14:42 ******/
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
/****** Object:  StoredProcedure [dbo].[USP_VehicleClassGetAll]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_VehicleClassGetAll]
AS BEGIN

	SELECT * FROM tbl_VehicleClass;

END



GO
/****** Object:  StoredProcedure [dbo].[USP_VehicleClassGetById]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_VehicleClassGetById]
@VehicleClassId smallint
AS BEGIN
	SELECT *
	FROM tbl_VehicleClass
	WHERE VehicleClassId=@VehicleClassId
END



GO
/****** Object:  StoredProcedure [dbo].[USP_VehicleClassGetByIds]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[USP_VehicleClassGetByIds]
(
@VehicleClassIds varchar(4000)
)
AS BEGIN
	SELECT * FROM tbl_VehicleClass WHERE VehicleClassId IN (SELECT DataValue from fnc_CommaSeparated(@VehicleClassIds)) AND DataStatus=1
END

--GO 
--EXEC USP_ReportMasterGetByIds
--@ReportIds='13,14'

GO
/****** Object:  StoredProcedure [dbo].[USP_VehicleClassInsertUpdate]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_VehicleClassInsertUpdate] 
@VehicleClassId	smallint,
@VehicleClassName varchar(20),
@AllowedSpeed decimal(5,2),
@DataStatus smallint,
@UserId bigint,
@CDateTime DateTime

AS
BEGIN
	DECLARE @MenuId smallint=8;
	DECLARE @CVal nvarchar(4000)
	DECLARE @PVal nvarchar(4000)
	CREATE TABLE #Temp(AlertMessage varchar(100))
	DECLARE @cnt int
	BEGIN TRY
	SELECT @MenuId=MenuId FROM tbl_MenuMaster WHERE MenuName ='Vehicle Class'
	IF EXISTS(SELECT VehicleClassId FROM tbl_VehicleClass where VehicleClassId=@VehicleClassId and VehicleClassId<>@VehicleClassId)
		BEGIN
			INSERT INTO #Temp(AlertMessage)
			VALUES('Vehicle Class Id already exists!')
		END
	
	IF EXISTS(SELECT VehicleClassId FROM tbl_VehicleClass where VehicleClassName=@VehicleClassName and VehicleClassId<>@VehicleClassId)
		BEGIN
			INSERT INTO #Temp(AlertMessage)
			VALUES('Vehicle Class name already exists!')
		END
	SELECT @cnt=COUNT(AlertMessage)  FROM #Temp
	IF(@cnt=0)
		BEGIN
			IF(@VehicleClassId=0)
			BEGIN
				insert into tbl_VehicleClass(VehicleClassName,AllowedSpeed,DataStatus,CreatedDate,CreatedBy)
				values(@VehicleClassName,@AllowedSpeed,@DataStatus,@CDateTime,@UserId);
				SELECT @VehicleClassId=@@IDENTITY

				SET @CVal=(SELECT * FROM tbl_VehicleClass WHERE VehicleClassId=@VehicleClassId FOR JSON AUTO, WITHOUT_ARRAY_WRAPPER)		
				
				INSERT INTO tbl_ActivityLog(UserId,CurrentColumn,ActionId,MenuId,CreatedDate)
				VALUES(@UserId,@CVal,'Insert',@MenuId,@CDateTime);
				
				INSERT INTO #Temp(AlertMessage)VALUES('success');
			END
			ELSE
			BEGIN
				
				SET @PVal=(SELECT * FROM tbl_VehicleClass WHERE VehicleClassId=@VehicleClassId FOR JSON AUTO, WITHOUT_ARRAY_WRAPPER)	
				
				UPDATE tbl_VehicleClass SET AllowedSpeed=@AllowedSpeed,
				VehicleClassName=@VehicleClassName,DataStatus=@DataStatus,ModifiedDate=@CDateTime,ModifiedBy=@UserId
				WHERE VehicleClassId=@VehicleClassId
				
				SET @CVal=(SELECT * FROM tbl_VehicleClass WHERE VehicleClassId=@VehicleClassId FOR JSON AUTO, WITHOUT_ARRAY_WRAPPER)		

				INSERT INTO tbl_ActivityLog(UserId,PrevColumn,CurrentColumn,ActionId,MenuId,CreatedDate)
				VALUES(@UserId,@PVal,@CVal,'Update',@MenuId,@CDateTime);

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
/****** Object:  StoredProcedure [dbo].[USP_VIDSEventReport]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_VIDSEventReport]
@FilterQuery varchar(4000)
AS BEGIN
	DECLARE @EventCount bigint
	CREATE TABLE #MainData(ChainageNumber varchar(50),EquipmentId bigint,EventStartDate DateTime,DirectionId Smallint,EquipmentPositionId smallint,
	EquipmentPositionName varchar(50),EventTypeId smallint,EventTypeName varchar(50),EventImageUrl varchar(255),EventVideoUrl varchar(255))

	CREATE TABLE #EventType(EventTypeId smallint,EventTypeName varchar(20),EventCount bigint default 0,
	EventPer float default 0,EventColor varchar(100))
	
	CREATE TABLE #EquipmentPositionTypeMaster(EquipmentPositionId smallint,EquipmentPositionName varchar(20),EventCount bigint default 0,
	EventPer float default 0,EventColor varchar(100))

	CREATE TABLE #ChainageNumberMaster(ChainageNumber varchar(20),EventCount bigint default 0,
	EventPer float default 0,EventColor varchar(100))


	EXEC('INSERT INTO #MainData(ChainageNumber,EquipmentId,EventStartDate,DirectionId,EquipmentPositionId,EquipmentPositionName,
	EventTypeId,EventTypeName,EventImageUrl,EventVideoUrl) 
	SELECT ED.ChainageNumber,H.EquipmentId,H.EventStartDate,ED.DirectionId,EC.PositionId,EP.EquipmentPositionName,H.EventTypeId,EM.EventTypeName,
	H.EventImageUrl,H.EventVideoUrl 
	FROM tbl_VIDSEventsHistory H 
	LEFT JOIN tbl_EquipmentDetails ED ON H.EquipmentId=ED.EquipmentId
	LEFT JOIN tbl_EquipmentConfig EC ON H.EquipmentId=EC.EquipmentId
	LEFT JOIN tbl_EquipmentPositionTypeMaster EP ON EC.PositionId=EP.EquipmentPositionId
	LEFT JOIN tbl_PackageDetails PD ON ED.PackageId=PD.PackageId
	LEFT JOIN tbl_ControlRoomMaster CR ON PD.ControlRoomId=CR.ControlRoomId
	LEFT JOIN tbl_EventsTypeMaster EM ON H.EventTypeId=EM.EventTypeId
	LEFT JOIN tbl_VehicleClass VC ON H.VehicleClassId=VC.VehicleClassId
	LEFT JOIN tbl_IncidentStatusMaster ISM ON H.IncidentStatusId=ISM.IncidentStatusId '+@FilterQuery+' ORDER BY EventStartDate DESC')


	INSERT INTO #EventType(EventTypeId,EventTypeName,EventColor)
	SELECT EventTypeId,EventTypeName,EventsColor FROM tbl_EventsTypeMaster(nolock) WHERE DataStatus=1 AND SystemId=6 AND EventsRequired=1
	
	UPDATE T SET T.EventCount=V.CNT FROM #EventType T INNER JOIN 
	(
		SELECT EventTypeId,COUNT(EventTypeId) AS CNT 
		FROM #MainData
		GROUP BY EventTypeId
	) V ON T.EventTypeId=V.EventTypeId

	SET @EventCount=0;
	SELECT @EventCount=SUM(EventCount) FROM #EventType
		
	IF(@EventCount>0)
		UPDATE #EventType SET EventPer=(CONVERT(FLOAT,EventCount)/CONVERT(FLOAT,@EventCount))*100 
		WHERE EventTypeId<>0
		
	INSERT INTO #EventType(EventTypeId,EventTypeName,EventCount,EventPer,EventColor)
	SELECT 0,'Total',SUM(EventCount),SUM(EventPer),'#011b40' FROM #EventType


	INSERT INTO #EquipmentPositionTypeMaster(EquipmentPositionId,EquipmentPositionName,EventColor)
	SELECT DISTINCT EquipmentPositionId,EquipmentPositionName,EquipmentPositionColor FROM tbl_EquipmentConfig C INNER JOIN tbl_EquipmentPositionTypeMaster M 
	ON PositionId=EquipmentPositionId
	WHERE SystemId=6


	UPDATE T SET T.EventCount=V.CNT FROM #EquipmentPositionTypeMaster T INNER JOIN 
	(
		SELECT EquipmentPositionId,COUNT(EquipmentPositionId) AS CNT 
		FROM #MainData
		GROUP BY EquipmentPositionId
	) V ON T.EquipmentPositionId=V.EquipmentPositionId

	SET @EventCount=0;

	SELECT @EventCount=SUM(EventCount) FROM #EquipmentPositionTypeMaster
		
	IF(@EventCount>0)
		UPDATE #EquipmentPositionTypeMaster SET EventPer=(CONVERT(FLOAT,EventCount)/CONVERT(FLOAT,@EventCount))*100 
		WHERE EquipmentPositionId<>0
		
	INSERT INTO #EquipmentPositionTypeMaster(EquipmentPositionId,EquipmentPositionName,EventCount,EventPer,EventColor)
	SELECT 0,'Total',SUM(EventCount),SUM(EventPer),'#011b40' FROM #EquipmentPositionTypeMaster



	SELECT EventTypeId,EventTypeName,EventCount,FORMAT(EventPer, 'N2') AS EventPer,EventColor FROM #EventType
	SELECT EquipmentPositionId,EquipmentPositionName,EventCount,FORMAT(EventPer, 'N2') AS EventPer,EventColor  
	FROM #EquipmentPositionTypeMaster
	SELECT * FROM #MainData

END
--GO
--EXEC USP_VIDSEventReport
--@FilterQuery='WHERE H.EventStartDate>= CONVERT(DATETIME,''01-Oct-2023 00:00:00'') AND H.EventStartDate<= CONVERT(DATETIME,''05-Nov-2023 12:45:27'')'
GO
/****** Object:  StoredProcedure [dbo].[USP_VIDSEventReviewUpdate]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_VIDSEventReviewUpdate]
@TransactionId varchar(30),
@ReviewedEventTypeId smallint,
@ReviewedPlateNumber varchar(20),
@ReviewedVehicleClassId smallint,
@IsChallanRequired bit,
@ReviewedById bigint,
@ReviewedDateTime datetime
AS
BEGIN
	DECLARE @MenuId smallint=3;
	DECLARE @CVal nvarchar(4000)
	DECLARE @PVal nvarchar(4000)
	CREATE TABLE #Temp(AlertMessage varchar(100))
	DECLARE @cnt int
	BEGIN TRY 
	SELECT @MenuId=MenuId FROM tbl_MenuMaster WHERE MenuURL ='vidsValidation'
	IF EXISTS(SELECT EquipmentId FROM tbl_VIDSEventsHistory where TransactionId=@TransactionId and ReviewedStatus=1)
	BEGIN
		INSERT INTO #Temp(AlertMessage)
		VALUES('Event already reviewed!')
	END
	SELECT @cnt=COUNT(AlertMessage)  FROM #Temp
	IF(@cnt=0)
		BEGIN
			DECLARE @ChallanTypeId smallint 
			SELECT @ChallanTypeId=ChallanTypeId FROM tbl_EventsTypeMaster WHERE EventTypeId=@ReviewedEventTypeId
			UPDATE tbl_VIDSEventsHistory SET ReviewedEventTypeId=@ReviewedEventTypeId,ReviewedPlateNumber=@ReviewedPlateNumber,
			ReviewedVehicleClassId=@ReviewedVehicleClassId,ReviewedById=@ReviewedById,ReviewedDateTime=@ReviewedDateTime,
			IsChallanRequired=@IsChallanRequired,ReviewedStatus=1
			,ChallanTypeId=@ChallanTypeId
			WHERE TransactionId=@TransactionId

			SET @CVal=(SELECT EventTypeId,PlateNumber,VehicleClassId,IsChallanRequired,ChallanTypeId 
			FROM tbl_VIDSEventsHistory WHERE TransactionId=@TransactionId FOR JSON AUTO, WITHOUT_ARRAY_WRAPPER)	
			
			SET @PVal=(SELECT ReviewedEventTypeId,ReviewedPlateNumber,ReviewedVehicleClassId,IsChallanRequired,ChallanTypeId 
			FROM tbl_VIDSEventsHistory WHERE TransactionId=@TransactionId FOR JSON AUTO, WITHOUT_ARRAY_WRAPPER)	
				
			INSERT INTO tbl_ActivityLog(UserId,CurrentColumn,ActionId,MenuId,CreatedDate)
			VALUES(@ReviewedById,@CVal,'Insert',@MenuId,@ReviewedDateTime);
			INSERT INTO #Temp(AlertMessage)
		   VALUES('success')
		END
		END TRY  
	BEGIN CATCH  
		INSERT INTO #Temp(AlertMessage)VALUES('failed');
		EXECUTE USP_ErrorInfoInsert;  
	END CATCH  
		select * from #Temp;
END
GO
/****** Object:  StoredProcedure [dbo].[USP_VIDSEventsGetByFilter]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[USP_VIDSEventsGetByFilter]
@FilterQuery varchar(4000)
AS
	BEGIN
		EXEC('SELECT H.TransactionId,H.EquipmentId,ED.ChainageNumber,ED.DirectionId,EC.PositionId,PD.PackageId,PD.PackageName,
	CR.ControlRoomId,CR.ControlRoomName,H.EventID,H.EventTypeId,EM.EventTypeName,H.EventStartDate,H.EventEndDate,
	ED.Longitude,ED.Latitude,
	H.EventDuration,H.LaneNumber,H.VehicleSpeed,H.VehicleClassId,VC.VehicleClassName,H.PlateNumber,H.PlateImageUrl,
	H.EventImageUrl,H.EventVideoUrl,H.IncidentStatusId,ISM.IncidentStatusName,H.CreatedDate,H.DataSendStatus,H.MediaSendStatus 
	FROM tbl_VIDSEventsHistory H 
	LEFT JOIN tbl_EquipmentDetails ED ON H.EquipmentId=ED.EquipmentId
	LEFT JOIN tbl_EquipmentConfig EC ON H.EquipmentId=EC.EquipmentId
	LEFT JOIN tbl_PackageDetails PD ON ED.PackageId=PD.PackageId
	LEFT JOIN tbl_ControlRoomMaster CR ON PD.ControlRoomId=CR.ControlRoomId
	LEFT JOIN tbl_EventsTypeMaster EM ON H.EventTypeId=EM.EventTypeId
	LEFT JOIN tbl_VehicleClass VC ON H.VehicleClassId=VC.VehicleClassId
	LEFT JOIN tbl_IncidentStatusMaster ISM ON H.IncidentStatusId=ISM.IncidentStatusId
			'+@FilterQuery+' ORDER BY EventStartDate DESC')
	END
GO
/****** Object:  StoredProcedure [dbo].[USP_VIDSEventsGetByHours]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_VIDSEventsGetByHours]
@Hours smallint=0
AS BEGIN
	 DECLARE @MinDate DateTime
	IF(@Hours=0)
	BEGIN
		SELECT @MinDate=MIN(EventStartDate) FROM tbl_VIDSEventsHistory 
		SET @MinDate=ISNULL(@MinDate,GETDATE())
	END
	ELSE
	BEGIN
		SELECT @MinDate=MAX(EventStartDate) FROM tbl_VIDSEventsHistory 
		SET @MinDate=ISNULL(@MinDate,GETDATE())
		SET @MinDate=DATEADD(HOUR,-1*@Hours,@MinDate)
	END

	SELECT H.TransactionId,H.EquipmentId,ED.ChainageNumber,ED.DirectionId,EC.PositionId,PD.PackageId,PD.PackageName,
	CR.ControlRoomId,CR.ControlRoomName,H.EventID,H.EventTypeId,EM.EventTypeName,H.EventStartDate,H.EventEndDate,
	ED.Longitude,ED.Latitude,
	H.EventDuration,H.LaneNumber,H.VehicleSpeed,H.VehicleClassId,VC.VehicleClassName,H.PlateNumber,H.PlateImageUrl,
	H.EventImageUrl,H.EventVideoUrl,H.IncidentStatusId,ISM.IncidentStatusName,H.CreatedDate,H.DataSendStatus,H.MediaSendStatus 
	FROM tbl_VIDSEventsHistory H 
	LEFT JOIN tbl_EquipmentDetails ED ON H.EquipmentId=ED.EquipmentId
	LEFT JOIN tbl_EquipmentConfig EC ON H.EquipmentId=EC.EquipmentId
	LEFT JOIN tbl_PackageDetails PD ON ED.PackageId=PD.PackageId
	LEFT JOIN tbl_ControlRoomMaster CR ON PD.ControlRoomId=CR.ControlRoomId
	LEFT JOIN tbl_EventsTypeMaster EM ON H.EventTypeId=EM.EventTypeId
	LEFT JOIN tbl_VehicleClass VC ON H.VehicleClassId=VC.VehicleClassId
	LEFT JOIN tbl_IncidentStatusMaster ISM ON H.IncidentStatusId=ISM.IncidentStatusId
	WHERE EventStartDate>=@MinDate
	ORDER BY EventStartDate DESC
END
GO
/****** Object:  StoredProcedure [dbo].[USP_VIDSEventsHistory]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_VIDSEventsHistory]
AS BEGIN
	SELECT H.TransactionId,H.EquipmentId,ED.ChainageNumber,ED.DirectionId,EC.PositionId,PD.PackageId,PD.PackageName,
	CR.ControlRoomId,CR.ControlRoomName,H.EventID,H.EventTypeId,
	EM.EventTypeName,H.EventStartDate,H.EventEndDate,H.EventDuration,H.LaneNumber,H.VehicleSpeed,H.VehicleClassId,VC.VehicleClassName,
	H.PlateNumber,H.PlateImageUrl,H.EventImageUrl,H.EventVideoUrl,H.IncidentStatusId,ISM.IncidentStatusName,
	H.IsChallanRequired,H.ChallanTypeId,H.ChallanStatusId,H.ChallanRemark,H.IsReviewedRequired,H.ReviewedStatus,H.ReviewedEventTypeId,
	REM.EventTypeName ReviewedEventTypeName,H.ReviewedPlateNumber,H.ReviewedVehicleClassId,RVC.VehicleClassName AS 
	ReviewedVehicleClassName,H.ReviewedById,RUM.LoginId AS ReviewedByLoginId,H.ReviewedDateTime,H.ReviewedRemark,
	H.CreatedDate,H.SystemProviderId,H.DataSendStatus,H.MediaSendStatus 
	FROM tbl_VIDSEventsHistory H 
	LEFT JOIN tbl_EquipmentDetails ED ON H.EquipmentId=ED.EquipmentId
	LEFT JOIN tbl_EquipmentConfig EC ON H.EquipmentId=EC.EquipmentId
	LEFT JOIN tbl_PackageDetails PD ON ED.PackageId=PD.PackageId
	LEFT JOIN tbl_ControlRoomMaster CR ON PD.ControlRoomId=CR.ControlRoomId
	LEFT JOIN tbl_EventsTypeMaster EM ON H.EventTypeId=EM.EventTypeId
	LEFT JOIN tbl_VehicleClass VC ON H.VehicleClassId=VC.VehicleClassId
	LEFT JOIN tbl_IncidentStatusMaster ISM ON H.IncidentStatusId=ISM.IncidentStatusId
	LEFT JOIN tbl_EventsTypeMaster REM ON H.ReviewedEventTypeId=REM.EventTypeId
	LEFT JOIN tbl_VehicleClass RVC ON H.ReviewedVehicleClassId=RVC.VehicleClassId
	LEFT JOIN tbl_UserMaster RUM ON H.ReviewedById=RUM.UserId
END
--GO
--EXEC USP_VIDSEventsHistory
GO
/****** Object:  StoredProcedure [dbo].[USP_VIDSEventsInsert]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_VIDSEventsInsert]
@TransactionId varchar(30),
@EquipmentId bigint,
@EventId varchar(255),
@DirectionId smallint,
@EventTypeId smallint,
@EventStartDate datetime2(4),
@EventEndDate datetime2(4),
@LaneNumber smallint,
@VehicleSpeed decimal(18,2),
@VehicleClassId smallint,
@PlateNumber varchar(20),
@PlateImageUrl varchar(255),
@EventImageUrl varchar(255),
@EventVideoUrl varchar(255),
@IsReviewedRequired bit,
@SystemProviderId smallint
AS BEGIN
	CREATE TABLE #Temp(AlertMessage varchar(100))
	BEGIN TRY
		INSERT INTO tbl_VIDSEventsHistory(TransactionId,EquipmentId,EventId,DirectionId,EventTypeId,EventStartDate,EventEndDate,LaneNumber,
		VehicleSpeed,VehicleClassId,PlateNumber,PlateImageUrl,EventImageUrl,EventVideoUrl,IsReviewedRequired,SystemProviderId)
		VALUES(@TransactionId,@EquipmentId,@EventId,@DirectionId,@EventTypeId,@EventStartDate,@EventEndDate,@LaneNumber,@VehicleSpeed,@VehicleClassId,
		@PlateNumber,@PlateImageUrl,@EventImageUrl,@EventVideoUrl,@IsReviewedRequired,@SystemProviderId)
		INSERT INTO #Temp(AlertMessage)VALUES('success');
	END TRY  
	BEGIN CATCH  
		INSERT INTO #Temp(AlertMessage)VALUES('failed');
		EXECUTE USP_ErrorInfoInsert;  
	END CATCH  
		select * from #Temp;
END
GO
/****** Object:  StoredProcedure [dbo].[USP_VIDSEventsReviewedGetByHours]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_VIDSEventsReviewedGetByHours]
@Hours smallint=0
AS BEGIN
	 DECLARE @MinDate DateTime
	IF(@Hours=0)
	BEGIN
		SELECT @MinDate=MIN(EventStartDate) FROM tbl_VIDSEventsHistory where ReviewedStatus=1
		SET @MinDate=ISNULL(@MinDate,GETDATE())
	END
	ELSE
	BEGIN
		SELECT @MinDate=MAX(EventStartDate) FROM tbl_VIDSEventsHistory where ReviewedStatus=1
		SET @MinDate=ISNULL(@MinDate,GETDATE())
		SET @MinDate=DATEADD(HOUR,-1*@Hours,@MinDate)
	END

	SELECT H.TransactionId,H.EquipmentId,ED.ChainageNumber,ED.DirectionId,EC.PositionId,PD.PackageId,PD.PackageName,
	CR.ControlRoomId,CR.ControlRoomName,H.EventID,H.EventTypeId,EM.EventTypeName,H.EventStartDate,H.EventEndDate,
	ED.Longitude,ED.Latitude,H.EventDuration,H.LaneNumber,H.VehicleSpeed,H.VehicleClassId,VC.VehicleClassName,
	H.PlateNumber,H.PlateImageUrl,H.EventImageUrl,H.EventVideoUrl,H.IncidentStatusId,ISM.IncidentStatusName,
	H.CreatedDate,H.DataSendStatus,H.MediaSendStatus,H.ReviewedEventTypeId,REM.EventTypeName ReviewedEventTypeName,
	H.ReviewedPlateNumber,H.ReviewedVehicleClassId,RVC.VehicleClassName AS ReviewedVehicleClassName,H.ReviewedById,
	RUM.LoginId AS ReviewedByLoginId,H.ReviewedDateTime
	FROM tbl_VIDSEventsHistory H 
	LEFT JOIN tbl_EquipmentDetails ED ON H.EquipmentId=ED.EquipmentId
	LEFT JOIN tbl_EquipmentConfig EC ON H.EquipmentId=EC.EquipmentId
	LEFT JOIN tbl_PackageDetails PD ON ED.PackageId=PD.PackageId
	LEFT JOIN tbl_ControlRoomMaster CR ON PD.ControlRoomId=CR.ControlRoomId
	LEFT JOIN tbl_EventsTypeMaster EM ON H.EventTypeId=EM.EventTypeId
	LEFT JOIN tbl_VehicleClass VC ON H.VehicleClassId=VC.VehicleClassId
	LEFT JOIN tbl_IncidentStatusMaster ISM ON H.IncidentStatusId=ISM.IncidentStatusId
	LEFT JOIN tbl_EventsTypeMaster REM ON H.ReviewedEventTypeId=REM.EventTypeId
	LEFT JOIN tbl_VehicleClass RVC ON H.ReviewedVehicleClassId=RVC.VehicleClassId
	LEFT JOIN tbl_UserMaster RUM ON H.ReviewedById=RUM.UserId
	WHERE EventStartDate>=@MinDate AND ReviewedStatus=1
	ORDER BY EventStartDate DESC
END
GO
/****** Object:  StoredProcedure [dbo].[USP_VIDSLocationReport]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_VIDSLocationReport]
@FilterQuery varchar(4000)
AS BEGIN
	DECLARE @EventCount bigint
	CREATE TABLE #MainData(ChainageNumber varchar(50),EquipmentId bigint,EventStartDate DateTime,DirectionId Smallint,EquipmentPositionId smallint,
	EquipmentPositionName varchar(50),EventTypeId smallint,EventTypeName varchar(50),EventImageUrl varchar(255),EventVideoUrl varchar(255))

	CREATE TABLE #EventType(EventTypeId smallint,EventTypeName varchar(20),EventCount bigint default 0,
	EventPer float default 0,EventColor varchar(100))
	
	CREATE TABLE #EquipmentPositionTypeMaster(EquipmentPositionId smallint,EquipmentPositionName varchar(20),EventCount bigint default 0,
	EventPer float default 0,EventColor varchar(100))

	CREATE TABLE #ChainageNumberMaster(ChainageNumber varchar(20),EventCount bigint default 0,
	EventPer float default 0,EventColor varchar(100))


	EXEC('INSERT INTO #MainData(ChainageNumber,EquipmentId,EventStartDate,DirectionId,EquipmentPositionId,EquipmentPositionName,
	EventTypeId,EventTypeName,EventImageUrl,EventVideoUrl) 
	SELECT ED.ChainageNumber,H.EquipmentId,H.EventStartDate,ED.DirectionId,EC.PositionId,EP.EquipmentPositionName,H.EventTypeId,EM.EventTypeName,
	H.EventImageUrl,H.EventVideoUrl 
	FROM tbl_VIDSEventsHistory H 
	LEFT JOIN tbl_EquipmentDetails ED ON H.EquipmentId=ED.EquipmentId
	LEFT JOIN tbl_EquipmentConfig EC ON H.EquipmentId=EC.EquipmentId
	LEFT JOIN tbl_EquipmentPositionTypeMaster EP ON EC.PositionId=EP.EquipmentPositionId
	LEFT JOIN tbl_PackageDetails PD ON ED.PackageId=PD.PackageId
	LEFT JOIN tbl_ControlRoomMaster CR ON PD.ControlRoomId=CR.ControlRoomId
	LEFT JOIN tbl_EventsTypeMaster EM ON H.EventTypeId=EM.EventTypeId
	LEFT JOIN tbl_VehicleClass VC ON H.VehicleClassId=VC.VehicleClassId
	LEFT JOIN tbl_IncidentStatusMaster ISM ON H.IncidentStatusId=ISM.IncidentStatusId '+@FilterQuery+' ORDER BY EventStartDate DESC')


	INSERT INTO #ChainageNumberMaster(ChainageNumber)
	SELECT  DISTINCT ChainageNumber
	FROM tbl_EquipmentDetails WHERE SystemId=6

	UPDATE #ChainageNumberMaster SET EventColor='#' +  CONVERT(VARCHAR(max), CRYPT_GEN_RANDOM(3), 2)

	UPDATE T SET T.EventCount=V.CNT 
	FROM #ChainageNumberMaster T INNER JOIN 
	(
		SELECT ChainageNumber,COUNT(EquipmentPositionId) AS CNT 
		FROM #MainData
		GROUP BY ChainageNumber
	) V ON T.ChainageNumber=V.ChainageNumber

	SET @EventCount=0;
	SELECT @EventCount=SUM(EventCount) FROM #ChainageNumberMaster
	IF(@EventCount>0)
		UPDATE #ChainageNumberMaster SET EventPer=(CONVERT(FLOAT,EventCount)/CONVERT(FLOAT,@EventCount))*100 
	
	INSERT INTO #ChainageNumberMaster(ChainageNumber,EventCount,EventPer,EventColor)
	SELECT 'Total',SUM(EventCount),SUM(EventPer),'#011b40' FROM #ChainageNumberMaster


	INSERT INTO #EquipmentPositionTypeMaster(EquipmentPositionId,EquipmentPositionName,EventColor)
	SELECT DISTINCT EquipmentPositionId,EquipmentPositionName,EquipmentPositionColor FROM tbl_EquipmentConfig C INNER JOIN tbl_EquipmentPositionTypeMaster M 
	ON PositionId=EquipmentPositionId
	WHERE SystemId=6


	UPDATE T SET T.EventCount=V.CNT FROM #EquipmentPositionTypeMaster T INNER JOIN 
	(
		SELECT EquipmentPositionId,COUNT(EquipmentPositionId) AS CNT 
		FROM #MainData
		GROUP BY EquipmentPositionId
	) V ON T.EquipmentPositionId=V.EquipmentPositionId

	SET @EventCount=0;

	SELECT @EventCount=SUM(EventCount) FROM #EquipmentPositionTypeMaster
		
	IF(@EventCount>0)
		UPDATE #EquipmentPositionTypeMaster SET EventPer=(CONVERT(FLOAT,EventCount)/CONVERT(FLOAT,@EventCount))*100 
		WHERE EquipmentPositionId<>0
		
	INSERT INTO #EquipmentPositionTypeMaster(EquipmentPositionId,EquipmentPositionName,EventCount,EventPer,EventColor)
	SELECT 0,'Total',SUM(EventCount),SUM(EventPer),'#011b40' FROM #EquipmentPositionTypeMaster



	SELECT ChainageNumber,EventCount,FORMAT(EventPer, 'N2') AS EventPer,EventColor FROM #ChainageNumberMaster
	SELECT EquipmentPositionId,EquipmentPositionName,EventCount,FORMAT(EventPer, 'N2') AS EventPer,EventColor  
	FROM #EquipmentPositionTypeMaster
	SELECT * FROM #MainData

END
--GO
--EXEC USP_VIDSLocationReport
--@FilterQuery='WHERE H.EventStartDate>= CONVERT(DATETIME,''01-Oct-2023 00:00:00'') AND H.EventStartDate<= CONVERT(DATETIME,''05-Nov-2023 12:45:27'')'
GO
/****** Object:  StoredProcedure [dbo].[USP_VIDSPendingReviewEventsGetByHours]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_VIDSPendingReviewEventsGetByHours]
@Hours smallint=0
AS BEGIN
	 DECLARE @MinDate DateTime
	IF(@Hours=0)
	BEGIN
		SELECT @MinDate=MIN(EventStartDate) FROM tbl_VIDSEventsHistory 
		WHERE IsReviewedRequired=1 AND ReviewedStatus=0
		SET @MinDate=ISNULL(@MinDate,GETDATE())
	END
	ELSE
	BEGIN
		SELECT @MinDate=MAX(EventStartDate) 
		FROM tbl_VIDSEventsHistory WHERE IsReviewedRequired=1 AND ReviewedStatus=0
		SET @MinDate=ISNULL(@MinDate,GETDATE())
		SET @MinDate=DATEADD(HOUR,-1*@Hours,@MinDate)
	END

	SELECT H.TransactionId,H.EquipmentId,ED.ChainageNumber,ED.DirectionId,EC.PositionId,PD.PackageId,PD.PackageName,
	CR.ControlRoomId,CR.ControlRoomName,H.EventID,H.EventTypeId,EM.EventTypeName,H.EventStartDate,H.EventEndDate,
	ED.Longitude,ED.Latitude,
	H.EventDuration,H.LaneNumber,H.VehicleSpeed,H.VehicleClassId,VC.VehicleClassName,H.PlateNumber,H.PlateImageUrl,
	H.EventImageUrl,H.EventVideoUrl,H.IncidentStatusId,ISM.IncidentStatusName,H.CreatedDate,H.DataSendStatus,H.MediaSendStatus 
	FROM tbl_VIDSEventsHistory H 
	LEFT JOIN tbl_EquipmentDetails ED ON H.EquipmentId=ED.EquipmentId
	LEFT JOIN tbl_EquipmentConfig EC ON H.EquipmentId=EC.EquipmentId
	LEFT JOIN tbl_PackageDetails PD ON ED.PackageId=PD.PackageId
	LEFT JOIN tbl_ControlRoomMaster CR ON PD.ControlRoomId=CR.ControlRoomId
	LEFT JOIN tbl_EventsTypeMaster EM ON H.EventTypeId=EM.EventTypeId
	LEFT JOIN tbl_VehicleClass VC ON H.VehicleClassId=VC.VehicleClassId
	LEFT JOIN tbl_IncidentStatusMaster ISM ON H.IncidentStatusId=ISM.IncidentStatusId
	WHERE EventStartDate>=@MinDate AND H.IsReviewedRequired=1 AND H.ReviewedStatus=0
	ORDER BY EventStartDate DESC
END
GO
/****** Object:  StoredProcedure [dbo].[USP_VIDSPositionReport]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_VIDSPositionReport]
@FilterQuery varchar(4000)
AS BEGIN
	DECLARE @EventCount bigint
	CREATE TABLE #MainData(ChainageNumber varchar(50),EquipmentId bigint,EventStartDate DateTime,DirectionId Smallint,EquipmentPositionId smallint,
	EquipmentPositionName varchar(50),EventTypeId smallint,EventTypeName varchar(50),EventImageUrl varchar(255),EventVideoUrl varchar(255))

	CREATE TABLE #EventType(EventTypeId smallint,EventTypeName varchar(20),EventCount bigint default 0,
	EventPer float default 0,EventColor varchar(100))
	
	CREATE TABLE #EquipmentPositionTypeMaster(EquipmentPositionId smallint,EquipmentPositionName varchar(20),EventCount bigint default 0,
	EventPer float default 0,EventColor varchar(100))

	CREATE TABLE #ChainageNumberMaster(ChainageNumber varchar(20),EventCount bigint default 0,
	EventPer float default 0,EventColor varchar(100))


	EXEC('INSERT INTO #MainData(ChainageNumber,EquipmentId,EventStartDate,DirectionId,EquipmentPositionId,EquipmentPositionName,
	EventTypeId,EventTypeName,EventImageUrl,EventVideoUrl) 
	SELECT ED.ChainageNumber,H.EquipmentId,H.EventStartDate,ED.DirectionId,EC.PositionId,EP.EquipmentPositionName,H.EventTypeId,EM.EventTypeName,
	H.EventImageUrl,H.EventVideoUrl 
	FROM tbl_VIDSEventsHistory H 
	LEFT JOIN tbl_EquipmentDetails ED ON H.EquipmentId=ED.EquipmentId
	LEFT JOIN tbl_EquipmentConfig EC ON H.EquipmentId=EC.EquipmentId
	LEFT JOIN tbl_EquipmentPositionTypeMaster EP ON EC.PositionId=EP.EquipmentPositionId
	LEFT JOIN tbl_PackageDetails PD ON ED.PackageId=PD.PackageId
	LEFT JOIN tbl_ControlRoomMaster CR ON PD.ControlRoomId=CR.ControlRoomId
	LEFT JOIN tbl_EventsTypeMaster EM ON H.EventTypeId=EM.EventTypeId
	LEFT JOIN tbl_VehicleClass VC ON H.VehicleClassId=VC.VehicleClassId
	LEFT JOIN tbl_IncidentStatusMaster ISM ON H.IncidentStatusId=ISM.IncidentStatusId '+@FilterQuery+' ORDER BY EventStartDate DESC')


	INSERT INTO #EquipmentPositionTypeMaster(EquipmentPositionId,EquipmentPositionName,EventColor)
	SELECT DISTINCT EquipmentPositionId,EquipmentPositionName,EquipmentPositionColor FROM tbl_EquipmentConfig C INNER JOIN tbl_EquipmentPositionTypeMaster M 
	ON PositionId=EquipmentPositionId
	WHERE SystemId=6


	UPDATE T SET T.EventCount=V.CNT FROM #EquipmentPositionTypeMaster T INNER JOIN 
	(
		SELECT EquipmentPositionId,COUNT(EquipmentPositionId) AS CNT 
		FROM #MainData
		GROUP BY EquipmentPositionId
	) V ON T.EquipmentPositionId=V.EquipmentPositionId

	SET @EventCount=0;

	SELECT @EventCount=SUM(EventCount) FROM #EquipmentPositionTypeMaster
		
	IF(@EventCount>0)
		UPDATE #EquipmentPositionTypeMaster SET EventPer=(CONVERT(FLOAT,EventCount)/CONVERT(FLOAT,@EventCount))*100 
		WHERE EquipmentPositionId<>0
		
	INSERT INTO #EquipmentPositionTypeMaster(EquipmentPositionId,EquipmentPositionName,EventCount,EventPer,EventColor)
	SELECT 0,'Total',SUM(EventCount),SUM(EventPer),'#011b40' FROM #EquipmentPositionTypeMaster


	SELECT EquipmentPositionId,EquipmentPositionName,EventCount,FORMAT(EventPer, 'N2') AS EventPer,EventColor  
	FROM #EquipmentPositionTypeMaster
	SELECT * FROM #MainData

END
--GO
--EXEC USP_VIDSPositionReport
--@FilterQuery='WHERE H.EventStartDate>= CONVERT(DATETIME,''01-Oct-2023 00:00:00'') AND H.EventStartDate<= CONVERT(DATETIME,''05-Nov-2023 12:45:27'')'
GO
/****** Object:  StoredProcedure [dbo].[USP_VIDSSummeryReport]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_VIDSSummeryReport]
@FilterQuery varchar(4000)
AS BEGIN
	DECLARE @EventCount bigint
	CREATE TABLE #MainData(ChainageNumber varchar(50),EquipmentId bigint,EventStartDate DateTime,DirectionId Smallint,EquipmentPositionId smallint,
	EquipmentPositionName varchar(50),EventTypeId smallint,EventTypeName varchar(50),EventImageUrl varchar(255),EventVideoUrl varchar(255))

	CREATE TABLE #EventType(EventTypeId smallint,EventTypeName varchar(20),EventCount bigint default 0,
	EventPer float default 0,EventColor varchar(100))
	
	CREATE TABLE #EquipmentPositionTypeMaster(EquipmentPositionId smallint,EquipmentPositionName varchar(20),EventCount bigint default 0,
	EventPer float default 0,EventColor varchar(100))

	CREATE TABLE #ChainageNumberMaster(ChainageNumber varchar(20),EventCount bigint default 0,
	EventPer float default 0,EventColor varchar(100))


		EXEC('INSERT INTO #MainData(ChainageNumber,EquipmentId,EventStartDate,DirectionId,EquipmentPositionId,EquipmentPositionName,
	EventTypeId,EventTypeName,EventImageUrl,EventVideoUrl) 
	SELECT ED.ChainageNumber,H.EquipmentId,H.EventStartDate,ED.DirectionId,EC.PositionId,EP.EquipmentPositionName,H.EventTypeId,EM.EventTypeName,
	H.EventImageUrl,H.EventVideoUrl 
	FROM tbl_VIDSEventsHistory H 
	LEFT JOIN tbl_EquipmentDetails ED ON H.EquipmentId=ED.EquipmentId
	LEFT JOIN tbl_EquipmentConfig EC ON H.EquipmentId=EC.EquipmentId
	LEFT JOIN tbl_EquipmentPositionTypeMaster EP ON EC.PositionId=EP.EquipmentPositionId
	LEFT JOIN tbl_PackageDetails PD ON ED.PackageId=PD.PackageId
	LEFT JOIN tbl_ControlRoomMaster CR ON PD.ControlRoomId=CR.ControlRoomId
	LEFT JOIN tbl_EventsTypeMaster EM ON H.EventTypeId=EM.EventTypeId
	LEFT JOIN tbl_VehicleClass VC ON H.VehicleClassId=VC.VehicleClassId
	LEFT JOIN tbl_IncidentStatusMaster ISM ON H.IncidentStatusId=ISM.IncidentStatusId '+@FilterQuery+' ORDER BY EventStartDate DESC')
	

	INSERT INTO #EventType(EventTypeId,EventTypeName,EventColor)
	SELECT EventTypeId,EventTypeName,EventsColor FROM tbl_EventsTypeMaster(nolock) WHERE DataStatus=1 AND SystemId=6 AND EventsRequired=1
	
	UPDATE T SET T.EventCount=V.CNT FROM #EventType T INNER JOIN 
	(
		SELECT EventTypeId,COUNT(EventTypeId) AS CNT 
		FROM #MainData
		GROUP BY EventTypeId
	) V ON T.EventTypeId=V.EventTypeId

	SET @EventCount=0;
	SELECT @EventCount=SUM(EventCount) FROM #EventType
		
	IF(@EventCount>0)
		UPDATE #EventType SET EventPer=(CONVERT(FLOAT,EventCount)/CONVERT(FLOAT,@EventCount))*100 
		WHERE EventTypeId<>0
		
	INSERT INTO #EventType(EventTypeId,EventTypeName,EventCount,EventPer,EventColor)
	SELECT 0,'Total',SUM(EventCount),SUM(EventPer),'#011b40' FROM #EventType
		
	INSERT INTO #EquipmentPositionTypeMaster(EquipmentPositionId,EquipmentPositionName,EventColor)
	SELECT DISTINCT EquipmentPositionId,EquipmentPositionName,EquipmentPositionColor FROM tbl_EquipmentConfig C INNER JOIN tbl_EquipmentPositionTypeMaster M 
	ON PositionId=EquipmentPositionId
	WHERE SystemId=6


	UPDATE T SET T.EventCount=V.CNT FROM #EquipmentPositionTypeMaster T INNER JOIN 
	(
		SELECT EquipmentPositionId,COUNT(EquipmentPositionId) AS CNT 
		FROM #MainData
		GROUP BY EquipmentPositionId
	) V ON T.EquipmentPositionId=V.EquipmentPositionId

	SET @EventCount=0;

	SELECT @EventCount=SUM(EventCount) FROM #EquipmentPositionTypeMaster
		
	IF(@EventCount>0)
		UPDATE #EquipmentPositionTypeMaster SET EventPer=(CONVERT(FLOAT,EventCount)/CONVERT(FLOAT,@EventCount))*100 
		WHERE EquipmentPositionId<>0
		
	INSERT INTO #EquipmentPositionTypeMaster(EquipmentPositionId,EquipmentPositionName,EventCount,EventPer,EventColor)
	SELECT 0,'Total',SUM(EventCount),SUM(EventPer),'#011b40' FROM #EquipmentPositionTypeMaster
	
	INSERT INTO #ChainageNumberMaster(ChainageNumber)
	SELECT  DISTINCT ChainageNumber
	FROM tbl_EquipmentDetails WHERE SystemId=6

	UPDATE #ChainageNumberMaster SET EventColor='#' +  CONVERT(VARCHAR(max), CRYPT_GEN_RANDOM(3), 2)

	UPDATE T SET T.EventCount=V.CNT 
	FROM #ChainageNumberMaster T INNER JOIN 
	(
		SELECT ChainageNumber,COUNT(EquipmentPositionId) AS CNT 
		FROM #MainData
		GROUP BY ChainageNumber
	) V ON T.ChainageNumber=V.ChainageNumber

	SET @EventCount=0;
	SELECT @EventCount=SUM(EventCount) FROM #ChainageNumberMaster
	IF(@EventCount>0)
		UPDATE #ChainageNumberMaster SET EventPer=(CONVERT(FLOAT,EventCount)/CONVERT(FLOAT,@EventCount))*100 
	
	INSERT INTO #ChainageNumberMaster(ChainageNumber,EventCount,EventPer,EventColor)
	SELECT 'Total',SUM(EventCount),SUM(EventPer),'#011b40' FROM #ChainageNumberMaster

	SELECT EventTypeId,EventTypeName,EventCount,FORMAT(EventPer, 'N2') AS EventPer,EventColor FROM #EventType
	SELECT EquipmentPositionId,EquipmentPositionName,EventCount,FORMAT(EventPer, 'N2') AS EventPer,EventColor  
	FROM #EquipmentPositionTypeMaster
	SELECT ChainageNumber,EventCount,FORMAT(EventPer, 'N2') AS EventPer,EventColor FROM #ChainageNumberMaster
	SELECT * FROM #MainData
END
--GO
--EXEC USP_VIDSSummeryReport
--@FilterQuery='WHERE H.EventStartDate>= CONVERT(DATETIME,''01-Oct-2023 00:00:00'') AND H.EventStartDate<= CONVERT(DATETIME,''05-Nov-2023 12:45:27'')'
GO
/****** Object:  StoredProcedure [dbo].[USP_VMSMessageDetailsGetAll]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_VMSMessageDetailsGetAll]
AS BEGIN
	SELECT * from tbl_VMSMessageDetails
END
GO
/****** Object:  StoredProcedure [dbo].[USP_VMSMessageDetailsGetByFilter]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[USP_VMSMessageDetailsGetByFilter]
@FilterQuery varchar(4000)
AS
	BEGIN
		CREATE TABLE #temp(MessageId bigint)

			EXEC('INSERT INTO #temp(MessageId) SELECT MessageId FROM tbl_VMSMessageDetails H CROSS APPLY 
			dbo.fnc_ValueSplit(H.EquipmentIds) V
			LEFT JOIN tbl_EquipmentDetails ED ON V.Value=ED.EquipmentId
			LEFT JOIN tbl_EquipmentConfig EC ON V.Value=EC.EquipmentId
			LEFT JOIN tbl_PackageDetails PD ON ED.PackageId=PD.PackageId
			LEFT JOIN tbl_ControlRoomMaster CR ON PD.ControlRoomId=CR.ControlRoomId '+@FilterQuery+' 
			
			SELECT MessageId,EquipmentIds,MessageTypeId,DisplayTimout,ValidTillDate,MediaPath,MessageDetails,DataStatus,CreatedDate,
		CreatedBy,ModifiedDate,ModifiedBy,DataSendStatus,MediaSendStatus FROM tbl_VMSMessageDetails WHERE MessageId IN (SELECT MessageId FROM #temp)
			')
	END
--GO
--EXEC USP_VMSMessageDetailsGetByFilter
--@FilterQuery='WHERE 1=1  AND ED.ChainageNumber IN (357.7) '
GO
/****** Object:  StoredProcedure [dbo].[USP_VMSMessageDetailsGetById]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_VMSMessageDetailsGetById]
@MessageId bigint
AS BEGIN
	SELECT * from tbl_VMSMessageDetails	WHERE MessageId=@MessageId
END
GO
/****** Object:  StoredProcedure [dbo].[USP_VMSMessageDetailsInsertUpdate]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_VMSMessageDetailsInsertUpdate] 
@MessageId	smallint,
@EquipmentIds varchar(4000),
@MediaPath varchar(255),
@MessageTypeId smallint,
@DisplayTimout smallint,
@ValidTillDate Date,
@MessageDetails nvarchar(4000),
@DataStatus smallint,
@CreatedDate DateTime,
@CreatedBy bigint,
@ModifiedDate DateTime,
@ModifiedBy bigint

AS
BEGIN
	DECLARE @MenuId smallint=8;
	DECLARE @CVal nvarchar(4000)
	DECLARE @PVal nvarchar(4000)
	CREATE TABLE #Temp(AlertMessage varchar(100))
	DECLARE @cnt int
	BEGIN TRY
	SELECT @MenuId=MenuId FROM tbl_MenuMaster WHERE MenuName ='Message Details'
	IF EXISTS(SELECT MessageId FROM tbl_VMSMessageDetails where MessageId=@MessageId and MessageId<>@MessageId)
		BEGIN
			INSERT INTO #Temp(AlertMessage)
			VALUES('Message Id already exists!')
		END
	SELECT @cnt=COUNT(AlertMessage)  FROM #Temp
	IF(@cnt=0)
		BEGIN 
			IF(@MessageId=0)
			BEGIN
				insert into tbl_VMSMessageDetails(EquipmentIds,MessageTypeId,DisplayTimout,ValidTillDate,MediaPath,MessageDetails,DataStatus,CreatedDate,CreatedBy)
				values(@EquipmentIds,@MessageTypeId,@DisplayTimout,@ValidTillDate,@MediaPath,@MessageDetails,@DataStatus,@CreatedDate,@CreatedBy);
				SELECT @MessageId=@@IDENTITY

				SET @CVal=(SELECT * FROM tbl_VMSMessageDetails where MessageId=@MessageId FOR JSON AUTO, WITHOUT_ARRAY_WRAPPER)		
				
				INSERT INTO tbl_ActivityLog(UserId,CurrentColumn,ActionId,MenuId,CreatedDate)
				VALUES(@CreatedBy,@CVal,'Insert',@MenuId,@CreatedDate);
				
				INSERT INTO #Temp(AlertMessage)VALUES('success');
			END
			ELSE
			BEGIN
				
				SET @PVal=(SELECT * FROM tbl_VMSMessageDetails where MessageId=@MessageId FOR JSON AUTO, WITHOUT_ARRAY_WRAPPER)	
				
				UPDATE tbl_VMSMessageDetails SET EquipmentIds=@EquipmentIds,MessageTypeId=@MessageTypeId,DisplayTimout=@DisplayTimout,
				ValidTillDate=@ValidTillDate,MediaPath=@MediaPath,MessageDetails=@MessageDetails,DataStatus=@DataStatus,
				ModifiedDate=@ModifiedDate,ModifiedBy=@ModifiedBy
				WHERE MessageId=@MessageId
				
				SET @CVal=(SELECT * FROM tbl_VMSMessageDetails where MessageId=@MessageId FOR JSON AUTO, WITHOUT_ARRAY_WRAPPER)		

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
/****** Object:  StoredProcedure [dbo].[USP_VMSMessageHistoryGetAll]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_VMSMessageHistoryGetAll]
AS BEGIN
	SELECT MessageId,M.EquipmentId,MessageTypeId,DisplayTimout,ValidTillDate,MediaPath,MessageDetails,PlayDateTime,
	E.EquipmentName,E.ChainageNumber,E.DirectionId,E.IpAddress
	FROM tbl_VMSMessageHistory M INNER JOIN tbl_EquipmentDetails E ON M.EquipmentId=E.EquipmentId
END
GO
/****** Object:  StoredProcedure [dbo].[USP_VMSMessageHistoryGetByFilter]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[USP_VMSMessageHistoryGetByFilter]
@FilterQuery varchar(4000)
AS
	BEGIN
		EXEC('SELECT MessageId,H.EquipmentId,MessageTypeId,DisplayTimout,ValidTillDate,MediaPath,MessageDetails,PlayDateTime,
	ED.EquipmentName,ED.ChainageNumber,ED.DirectionId,ED.IpAddress
	FROM tbl_VMSMessageHistory H 
	LEFT JOIN tbl_EquipmentDetails ED ON H.EquipmentId=ED.EquipmentId
	LEFT JOIN tbl_EquipmentConfig EC ON H.EquipmentId=EC.EquipmentId
	LEFT JOIN tbl_PackageDetails PD ON ED.PackageId=PD.PackageId
	LEFT JOIN tbl_ControlRoomMaster CR ON PD.ControlRoomId=CR.ControlRoomId
			'+@FilterQuery+' ORDER BY PlayDateTime DESC')
	END
GO
/****** Object:  StoredProcedure [dbo].[USP_VMSMessageHistoryGetByHours]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_VMSMessageHistoryGetByHours]
@Hours smallint=0
AS BEGIN
	 DECLARE @MinDate DateTime
	IF(@Hours=0)
	BEGIN
		SELECT @MinDate=MIN(PlayDateTime) FROM tbl_VMSMessageHistory 
		SET @MinDate=ISNULL(@MinDate,GETDATE())
	END
	ELSE
	BEGIN
		SELECT @MinDate=MAX(PlayDateTime) FROM tbl_VMSMessageHistory 
		SET @MinDate=ISNULL(@MinDate,GETDATE())
		SET @MinDate=DATEADD(HOUR,-1*@Hours,@MinDate)
	END

	SELECT MessageId,M.EquipmentId,MessageTypeId,DisplayTimout,ValidTillDate,MediaPath,MessageDetails,PlayDateTime,
	E.EquipmentName,E.ChainageNumber,E.DirectionId,E.IpAddress
	FROM tbl_VMSMessageHistory M INNER JOIN tbl_EquipmentDetails E ON M.EquipmentId=E.EquipmentId
	WHERE PlayDateTime>=@MinDate
	ORDER BY PlayDateTime DESC
END
GO
/****** Object:  StoredProcedure [dbo].[USP_VMSMessageHistoryInsert]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_VMSMessageHistoryInsert] 
@MessageId	smallint,
@EquipmentId bigint,
@MediaPath varchar(255),
@MessageTypeId smallint,
@DisplayTimout smallint,
@ValidTillDate Date,
@MessageDetails nvarchar(4000),
@PlayDateTime DateTime

AS
BEGIN
	CREATE TABLE #Temp(AlertMessage varchar(100))
	BEGIN TRY
			INSERT INTO tbl_VMSMessageHistory(MessageId,EquipmentId,MessageTypeId,DisplayTimout,ValidTillDate,MediaPath,MessageDetails,PlayDateTime)
			values(@MessageId,@EquipmentId,@MessageTypeId,@DisplayTimout,@ValidTillDate,@MediaPath,@MessageDetails,@PlayDateTime);
			INSERT INTO #Temp(AlertMessage)VALUES('success');
	END TRY  
	BEGIN CATCH  
		INSERT INTO #Temp(AlertMessage)VALUES('failed');
		EXECUTE USP_ErrorInfoInsert;  
	END CATCH  
		select * from #Temp;
END


GO
/****** Object:  StoredProcedure [dbo].[USP_VSDSEventReviewUpdate]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_VSDSEventReviewUpdate]
@TransactionId varchar(30),
@ReviewedPlateNumber varchar(20),
@ReviewedVehicleClassId smallint,
@RadarSpeed decimal(18,2),
@LaneNumber smallint,
@IsReviewedPlateVisible bit,
@IsReviewedFaultyPlate bit,
@IsReviewedStandardPlate bit,
@IsReviewedWrongDirection bit,
@ReviewedById bigint,
@ReviewedDateTime datetime
AS
BEGIN
	DECLARE @MenuId smallint=3;
	DECLARE @CVal nvarchar(4000)
	DECLARE @PVal nvarchar(4000)
	CREATE TABLE #Temp(AlertMessage varchar(100))
	DECLARE @cnt int
	BEGIN TRY 
	SELECT @MenuId=MenuId FROM tbl_MenuMaster WHERE MenuURL ='vsdsValidation'
	IF EXISTS(SELECT EquipmentId FROM tbl_VSDSEventsHistory where TransactionId=@TransactionId and ReviewedStatus=1)
	BEGIN
		INSERT INTO #Temp(AlertMessage)
		VALUES('Event already reviewed!')
	END
	SELECT @cnt=COUNT(AlertMessage)  FROM #Temp
	IF(@cnt=0)
		BEGIN
			DECLARE @ChallanTypeId smallint 
			DECLARE @AllowedSpeed decimal(18,2)
			DECLARE @IsChallanRequired bit=1
			DECLARE @IsRestiredVehicle bit=0
			DECLARE @EventTypeId smallint=18
			DECLARE @RestrictedVehiclesIds varchar(4000)
			SELECT @RestrictedVehiclesIds=RestrictedVehiclesIds FROM tbl_SystemSetting

			CREATE TABLE #tempRestiredClass(VehicleClassId smallint)
			CREATE TABLE #tempLaneWiseClass(LaneNumber smallint,AllowedSpeed DECIMAL(18,2),VehicleClassId smallint)
			INSERT INTO #tempLaneWiseClass(LaneNumber,AllowedSpeed,VehicleClassId)
			select f.LaneNumber, f.AllowedSpeed, u.DataValue AS ClassId
			from tbl_VSDSLaneConfig f 
			Cross apply  fnc_CommaSeparated(f.AllowedClassIds) u 
			where f.DataStatus = 1

			INSERT INTO #tempRestiredClass(VehicleClassId)
			select DataValue  FROM fnc_CommaSeparated(@RestrictedVehiclesIds)

			SELECT @AllowedSpeed=AllowedSpeed FROM tbl_VehicleClass WHERE VehicleClassId=@ReviewedVehicleClassId

			IF EXISTS (SELECT VehicleClassId FROM #tempRestiredClass WHERE VehicleClassId=@ReviewedVehicleClassId)
			BEGIN
				SET @IsRestiredVehicle=1	
			END	
			
			IF(@RadarSpeed>@AllowedSpeed)
			BEGIN
				SET @EventTypeId=12
			END
			ELSE
			BEGIN
				SELECT @AllowedSpeed=AllowedSpeed FROM #tempLaneWiseClass WHERE LaneNumber=@LaneNumber
				IF(@RadarSpeed>@AllowedSpeed)
				BEGIN
					SET @EventTypeId=13
				END
				ELSE
				BEGIN
					IF NOT EXISTS (SELECT AllowedSpeed FROM #tempLaneWiseClass WHERE LaneNumber=@LaneNumber AND VehicleClassId=@ReviewedVehicleClassId)
					BEGIN
						SET @EventTypeId=17	
					END	
				END
			END
			IF(@EventTypeId=18 AND @IsReviewedWrongDirection=1)
			BEGIN
				SET @EventTypeId=15
			END
			ELSE IF(@EventTypeId=18 AND @IsRestiredVehicle=1)
			BEGIN
				SET @EventTypeId=14
			END
			SELECT @ChallanTypeId=ChallanTypeId FROM tbl_EventsTypeMaster WHERE EventTypeId=@EventTypeId
			SET @ChallanTypeId=ISNULL(@ChallanTypeId,0)
			IF(@ChallanTypeId=0)
			BEGIN
				SET @IsChallanRequired=0
			END
			SET @PVal=(SELECT IsRestiredVehicle,IsPlateVisible,IsFaultyPlate,IsStandardPlate,IsWrongDirection,PlateNumber,VehicleClassId,IsChallanRequired,ChallanTypeId
			FROM tbl_VSDSEventsHistory WHERE TransactionId=@TransactionId FOR JSON AUTO, WITHOUT_ARRAY_WRAPPER)	

			UPDATE tbl_VSDSEventsHistory SET ReviewedPlateNumber=@ReviewedPlateNumber,
			ReviewedVehicleClassId=@ReviewedVehicleClassId,ReviewedBy=@ReviewedById,ReviewedDateTime=@ReviewedDateTime,
			IsReviewedPlateVisible=@IsReviewedPlateVisible,IsReviewedFaultyPlate=@IsReviewedFaultyPlate,
			IsReviewedStandardPlate=@IsReviewedStandardPlate,IsReviewedWrongDirection=@IsReviewedWrongDirection,ReviewedStatus=1,
			ChallanTypeId=@ChallanTypeId,EventTypeId=@EventTypeId,IsRestiredVehicle=@IsRestiredVehicle
			WHERE TransactionId=@TransactionId

			SET @CVal=(SELECT IsRestiredVehicle,IsReviewedPlateVisible,IsReviewedFaultyPlate,IsReviewedStandardPlate,IsReviewedWrongDirection,ReviewedPlateNumber,ReviewedVehicleClassId,IsChallanRequired,ChallanTypeId 
			FROM tbl_VSDSEventsHistory WHERE TransactionId=@TransactionId FOR JSON AUTO, WITHOUT_ARRAY_WRAPPER)	
				
			INSERT INTO tbl_ActivityLog(UserId,PrevColumn,CurrentColumn,ActionId,MenuId,CreatedDate)
			VALUES(@ReviewedById,@PVal,@CVal,'Update',@MenuId,@ReviewedDateTime);
			INSERT INTO #Temp(AlertMessage)
		   VALUES('success')
		END
		END TRY  
	BEGIN CATCH  
		INSERT INTO #Temp(AlertMessage)VALUES('failed');
		EXECUTE USP_ErrorInfoInsert;  
	END CATCH  
		select * from #Temp;
END
GO
/****** Object:  StoredProcedure [dbo].[USP_VSDSEventsGetByFilter]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_VSDSEventsGetByFilter]
@FilterQuery varchar(4000)
AS
	BEGIN
		EXEC('SELECT H.TransactionId,H.EquipmentId,ED.ChainageNumber,ED.DirectionId,PD.PackageId,PD.PackageName,
	CR.ControlRoomId,CR.ControlRoomName,H.EventID,H.EventTypeId,EM.EventTypeName,H.EventDate,ED.Longitude,ED.Latitude,
	H.PlateNumber,H.LaneNumber,H.VehicleClassId,VC.VehicleClassName,H.PlateImageUrl,H.VehicleImageUrl,H.VehicleVideoUrl,
	H.CameraSpeed,H.RadarSpeed,H.AllowedSpeed,H.OcrConfidencelevel,H.ClassConfidencelevel,H.PlateFontColor,H.PlateBackColor,H.VehicleColor,
	H.VehicleDirectionId,H.IsPlateVisible,H.IsFaultyPlate,H.IsStandardPlate,H.IsWrongDirection,H.CreatedDate,H.DataSendStatus,H.MediaSendStatus 
	FROM tbl_VSDSEventsHistory H 
	LEFT JOIN tbl_EquipmentDetails ED ON H.EquipmentId=ED.EquipmentId
	LEFT JOIN tbl_PackageDetails PD ON ED.PackageId=PD.PackageId
	LEFT JOIN tbl_ControlRoomMaster CR ON PD.ControlRoomId=CR.ControlRoomId
	LEFT JOIN tbl_EventsTypeMaster EM ON H.EventTypeId=EM.EventTypeId
	LEFT JOIN tbl_VehicleClass VC ON H.VehicleClassId=VC.VehicleClassId
			'+@FilterQuery+' ORDER BY EventDate DESC')
	END
GO
/****** Object:  StoredProcedure [dbo].[USP_VSDSEventsGetByHours]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_VSDSEventsGetByHours]
@Hours smallint=0
AS BEGIN
	 DECLARE @MinDate DateTime
	IF(@Hours=0)
	BEGIN
		SELECT @MinDate=MIN(EventDate) FROM tbl_VSDSEventsHistory 
		SET @MinDate=ISNULL(@MinDate,GETDATE())
	END
	ELSE
	BEGIN
		SELECT @MinDate=MAX(EventDate) FROM tbl_VSDSEventsHistory 
		SET @MinDate=ISNULL(@MinDate,GETDATE())
		SET @MinDate=DATEADD(HOUR,-1*@Hours,@MinDate)
	END

	SELECT H.TransactionId,H.EquipmentId,ED.ChainageNumber,ED.DirectionId,PD.PackageId,PD.PackageName,
	CR.ControlRoomId,CR.ControlRoomName,H.EventID,H.EventTypeId,EM.EventTypeName,H.EventDate,ED.Longitude,ED.Latitude,
	H.PlateNumber,H.LaneNumber,H.VehicleClassId,VC.VehicleClassName,H.PlateImageUrl,H.VehicleImageUrl,H.VehicleVideoUrl,
	H.CameraSpeed,H.RadarSpeed,H.AllowedSpeed,H.OcrConfidencelevel,H.ClassConfidencelevel,H.PlateFontColor,H.PlateBackColor,H.VehicleColor,
	H.VehicleDirectionId,H.IsPlateVisible,H.IsFaultyPlate,H.IsStandardPlate,H.IsWrongDirection,H.CreatedDate,H.DataSendStatus,H.MediaSendStatus 
	FROM tbl_VSDSEventsHistory H 
	LEFT JOIN tbl_EquipmentDetails ED ON H.EquipmentId=ED.EquipmentId
	LEFT JOIN tbl_PackageDetails PD ON ED.PackageId=PD.PackageId
	LEFT JOIN tbl_ControlRoomMaster CR ON PD.ControlRoomId=CR.ControlRoomId
	LEFT JOIN tbl_EventsTypeMaster EM ON H.EventTypeId=EM.EventTypeId
	LEFT JOIN tbl_VehicleClass VC ON H.VehicleClassId=VC.VehicleClassId
	WHERE EventDate>=@MinDate
	ORDER BY EventDate DESC
END
GO
/****** Object:  StoredProcedure [dbo].[USP_VSDSPendingReviewEventsGetByHours]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_VSDSPendingReviewEventsGetByHours]
@Hours smallint=0
AS BEGIN
	 DECLARE @MinDate DateTime
	IF(@Hours=0)
	BEGIN
		SELECT @MinDate=MIN(EventDate) FROM tbl_VSDSEventsHistory 
		WHERE IsReviewedRequired=1 AND ReviewedStatus=0
		SET @MinDate=ISNULL(@MinDate,GETDATE())
	END
	ELSE
	BEGIN
		SELECT @MinDate=MAX(EventDate) 
		FROM tbl_VSDSEventsHistory WHERE IsReviewedRequired=1 AND ReviewedStatus=0
		SET @MinDate=ISNULL(@MinDate,GETDATE())
		SET @MinDate=DATEADD(HOUR,-1*@Hours,@MinDate)
	END

	SELECT H.TransactionId,H.EquipmentId,ED.ChainageNumber,ED.DirectionId,PD.PackageId,PD.PackageName,
	CR.ControlRoomId,CR.ControlRoomName,H.EventID,H.EventTypeId,EM.EventTypeName,H.EventDate,ED.Longitude,ED.Latitude,
	H.PlateNumber,H.LaneNumber,H.VehicleClassId,VC.VehicleClassName,H.PlateImageUrl,H.VehicleImageUrl,H.VehicleVideoUrl,
	H.CameraSpeed,H.RadarSpeed,H.AllowedSpeed,H.OcrConfidencelevel,H.ClassConfidencelevel,H.PlateFontColor,H.PlateBackColor,H.VehicleColor,
	H.VehicleDirectionId,H.IsPlateVisible,H.IsFaultyPlate,H.IsStandardPlate,H.IsWrongDirection,H.CreatedDate,H.DataSendStatus,H.MediaSendStatus 
	FROM tbl_VSDSEventsHistory H 
	LEFT JOIN tbl_EquipmentDetails ED ON H.EquipmentId=ED.EquipmentId
	LEFT JOIN tbl_PackageDetails PD ON ED.PackageId=PD.PackageId
	LEFT JOIN tbl_ControlRoomMaster CR ON PD.ControlRoomId=CR.ControlRoomId
	LEFT JOIN tbl_EventsTypeMaster EM ON H.EventTypeId=EM.EventTypeId
	LEFT JOIN tbl_VehicleClass VC ON H.VehicleClassId=VC.VehicleClassId
	WHERE EventDate>=@MinDate AND H.IsReviewedRequired=1 AND H.ReviewedStatus=0
	ORDER BY EventDate DESC
END
GO
/****** Object:  StoredProcedure [dbo].[USP_WeatherEventInsert]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_WeatherEventInsert]
@EquipmentId bigint,
@EventDateTime DateTime,
@AirTemperature Decimal(18,2),
@SurfaceTemperature Decimal(18,2),
@Humidity Decimal(18,2),
@Visibility Decimal(18,2),
@WindDirection Decimal(18,2),
@WindSpeed Decimal(18,2),
@Airquality Decimal(18,2),
@RainMeasurement Decimal(18,2),
@WeatherDescription varchar(100)
AS BEGIN
	CREATE TABLE #Temp(AlertMessage varchar(100))
	BEGIN TRY
		INSERT INTO tbl_WeatherEventHistory(EquipmentId,EventDateTime,AirTemperature,SurfaceTemperature,Humidity,
		Visibility,WindDirection,WindSpeed,Airquality,RainMeasurement,WeatherDescription)
		VALUES(@EquipmentId,@EventDateTime,@AirTemperature,@SurfaceTemperature,@Humidity,
		@Visibility,@WindDirection,@WindSpeed,@Airquality,@RainMeasurement,@WeatherDescription)
		INSERT INTO #Temp(AlertMessage)VALUES('success');
	END TRY  
	BEGIN CATCH  
		INSERT INTO #Temp(AlertMessage)VALUES('failed');
		EXECUTE USP_ErrorInfoInsert;  
	END CATCH  
		select * from #Temp;
END
GO
/****** Object:  StoredProcedure [dbo].[USP_WeatherEventsGetByFilter]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[USP_WeatherEventsGetByFilter]
@FilterQuery varchar(4000)
AS
	BEGIN
		EXEC('SELECT H.EquipmentId,AirTemperature,SurfaceTemperature,Humidity,Visibility,WindDirection,WindSpeed,AirQuality,
		RainMeasurement,WeatherDescription,ED.ChainageNumber,ED.DirectionId,PD.PackageId,PD.PackageName,CR.ControlRoomId,
		CR.ControlRoomName,H.EventDateTime,ED.Longitude,ED.Latitude,H.DataSendStatus
		FROM tbl_WeatherEventHistory H 
		LEFT JOIN tbl_EquipmentDetails ED ON H.EquipmentId=ED.EquipmentId
		LEFT JOIN tbl_PackageDetails PD ON ED.PackageId=PD.PackageId
		LEFT JOIN tbl_ControlRoomMaster CR ON PD.ControlRoomId=CR.ControlRoomId '+@FilterQuery+' ORDER BY EventDateTime DESC')
	END
GO
/****** Object:  StoredProcedure [dbo].[USP_WeatherEventsGetByHours]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_WeatherEventsGetByHours]
@Hours smallint=0
AS BEGIN
	 DECLARE @MinDate DateTime
	IF(@Hours=0)
	BEGIN
		SELECT @MinDate=MIN(EventDateTime) FROM tbl_WeatherEventHistory 
		SET @MinDate=ISNULL(@MinDate,GETDATE())
	END
	ELSE
	BEGIN
		SELECT @MinDate=MAX(EventDateTime) FROM tbl_WeatherEventHistory 
		SET @MinDate=ISNULL(@MinDate,GETDATE())
		SET @MinDate=DATEADD(HOUR,-1*@Hours,@MinDate)
	END

	SELECT H.EquipmentId,AirTemperature,SurfaceTemperature,Humidity,Visibility,WindDirection,WindSpeed,AirQuality,
	RainMeasurement,WeatherDescription,ED.ChainageNumber,ED.DirectionId,PD.PackageId,PD.PackageName,CR.ControlRoomId,CR.ControlRoomName,
	H.EventDateTime,ED.Longitude,ED.Latitude,H.DataSendStatus
	FROM tbl_WeatherEventHistory H 
	LEFT JOIN tbl_EquipmentDetails ED ON H.EquipmentId=ED.EquipmentId
	LEFT JOIN tbl_PackageDetails PD ON ED.PackageId=PD.PackageId
	LEFT JOIN tbl_ControlRoomMaster CR ON PD.ControlRoomId=CR.ControlRoomId
	WHERE EventDateTime>=@MinDate
	ORDER BY EventDateTime DESC
END
--GO
--EXEC USP_ATCCEventsGetByHours
GO
/****** Object:  StoredProcedure [dbo].[USP_WeatherOpenAPIInsert]    Script Date: 14-06-2024 15:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_WeatherOpenAPIInsert]
@EquipmentId bigint,
@ReceivedDateTime datetime,
@APIDateTime datetime,
@WeatherMain varchar(100),
@WeatherDescription varchar(100),
@Temperature Decimal(18,2),
@MinTemperature Decimal(18,2),
@MaxTemperature Decimal(18,2),
@Pressure bigint,
@Humidity bigint,
@Visibility bigint,
@WindSpeed Decimal(18,2),
@WindDegree Decimal(18,2),
@Clouds smallint,
@GetDateTime bigint,
@Sunrise bigint,
@Sunset bigint,
@CityName varchar(100)
AS BEGIN
	CREATE TABLE #Temp(AlertMessage varchar(100))
	BEGIN TRY
		INSERT INTO tbl_WeatherOpenAPI(EquipmentId,ReceivedDateTime,APIDateTime,WeatherMain,WeatherDescription,Temperature,MinTemperature,MaxTemperature,
		Pressure,Humidity,Visibility,WindSpeed,WindDegree,Clouds,GetDateTime,Sunrise,Sunset,CityName)
		VALUES(@EquipmentId,@ReceivedDateTime,@APIDateTime,@WeatherMain,@WeatherDescription,@Temperature,@MinTemperature,@MaxTemperature,
		@Pressure,@Humidity,@Visibility,@WindSpeed,@WindDegree,@Clouds,@GetDateTime,@Sunrise,@Sunset,@CityName)
		INSERT INTO #Temp(AlertMessage)VALUES('success');
	END TRY  
	BEGIN CATCH  
		INSERT INTO #Temp(AlertMessage)VALUES('failed');
		EXECUTE USP_ErrorInfoInsert;  
	END CATCH  
		select * from #Temp;
END
GO
