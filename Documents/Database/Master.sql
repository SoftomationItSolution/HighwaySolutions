USE [ATMSv1]
GO
/****** Object:  StoredProcedure [dbo].[USP_WeatherEventsGetALLByFilter]    Script Date: 04-10-2023 17:45:15 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_WeatherEventsGetALLByFilter]
GO
/****** Object:  StoredProcedure [dbo].[USP_WeatherConfigInsertUpdate]    Script Date: 04-10-2023 17:45:15 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_WeatherConfigInsertUpdate]
GO
/****** Object:  StoredProcedure [dbo].[USP_VSDSPendingReviewEventsGetByHours]    Script Date: 04-10-2023 17:45:15 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_VSDSPendingReviewEventsGetByHours]
GO
/****** Object:  StoredProcedure [dbo].[USP_VSDSEventsGetByHours]    Script Date: 04-10-2023 17:45:15 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_VSDSEventsGetByHours]
GO
/****** Object:  StoredProcedure [dbo].[USP_VSDSEventsGetByFilter]    Script Date: 04-10-2023 17:45:15 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_VSDSEventsGetByFilter]
GO
/****** Object:  StoredProcedure [dbo].[USP_VSDSEventReviewUpdate]    Script Date: 04-10-2023 17:45:15 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_VSDSEventReviewUpdate]
GO
/****** Object:  StoredProcedure [dbo].[USP_VMSMessageDetailsInsertUpdate]    Script Date: 04-10-2023 17:45:15 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_VMSMessageDetailsInsertUpdate]
GO
/****** Object:  StoredProcedure [dbo].[USP_VMSMessageDetailsGetById]    Script Date: 04-10-2023 17:45:15 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_VMSMessageDetailsGetById]
GO
/****** Object:  StoredProcedure [dbo].[USP_VMSMessageDetailsGetAll]    Script Date: 04-10-2023 17:45:15 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_VMSMessageDetailsGetAll]
GO
/****** Object:  StoredProcedure [dbo].[USP_VIDSPendingReviewEventsGetByHours]    Script Date: 04-10-2023 17:45:15 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_VIDSPendingReviewEventsGetByHours]
GO
/****** Object:  StoredProcedure [dbo].[USP_VIDSEventsReviewedGetByHours]    Script Date: 04-10-2023 17:45:15 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_VIDSEventsReviewedGetByHours]
GO
/****** Object:  StoredProcedure [dbo].[USP_VIDSEventsHistory]    Script Date: 04-10-2023 17:45:15 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_VIDSEventsHistory]
GO
/****** Object:  StoredProcedure [dbo].[USP_VIDSEventsGetByHours]    Script Date: 04-10-2023 17:45:15 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_VIDSEventsGetByHours]
GO
/****** Object:  StoredProcedure [dbo].[USP_VIDSEventsGetByFilter]    Script Date: 04-10-2023 17:45:15 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_VIDSEventsGetByFilter]
GO
/****** Object:  StoredProcedure [dbo].[USP_VIDSEventReviewUpdate]    Script Date: 04-10-2023 17:45:15 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_VIDSEventReviewUpdate]
GO
/****** Object:  StoredProcedure [dbo].[USP_VehicleClassInsertUpdate]    Script Date: 04-10-2023 17:45:15 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_VehicleClassInsertUpdate]
GO
/****** Object:  StoredProcedure [dbo].[USP_VehicleClassGetByIds]    Script Date: 04-10-2023 17:45:15 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_VehicleClassGetByIds]
GO
/****** Object:  StoredProcedure [dbo].[USP_VehicleClassGetById]    Script Date: 04-10-2023 17:45:15 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_VehicleClassGetById]
GO
/****** Object:  StoredProcedure [dbo].[USP_VehicleClassGetAll]    Script Date: 04-10-2023 17:45:15 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_VehicleClassGetAll]
GO
/****** Object:  StoredProcedure [dbo].[USP_UserUpdatePassword]    Script Date: 04-10-2023 17:45:15 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_UserUpdatePassword]
GO
/****** Object:  StoredProcedure [dbo].[USP_UsersGetByLoginId]    Script Date: 04-10-2023 17:45:15 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_UsersGetByLoginId]
GO
/****** Object:  StoredProcedure [dbo].[USP_UserProfileChange]    Script Date: 04-10-2023 17:45:15 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_UserProfileChange]
GO
/****** Object:  StoredProcedure [dbo].[USP_UserInsertUpdate]    Script Date: 04-10-2023 17:45:15 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_UserInsertUpdate]
GO
/****** Object:  StoredProcedure [dbo].[USP_UserGetByUserTypeId]    Script Date: 04-10-2023 17:45:15 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_UserGetByUserTypeId]
GO
/****** Object:  StoredProcedure [dbo].[USP_UserGetBySystemUserTypeId]    Script Date: 04-10-2023 17:45:15 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_UserGetBySystemUserTypeId]
GO
/****** Object:  StoredProcedure [dbo].[USP_UserGetbyId]    Script Date: 04-10-2023 17:45:15 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_UserGetbyId]
GO
/****** Object:  StoredProcedure [dbo].[USP_UserGetAll]    Script Date: 04-10-2023 17:45:15 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_UserGetAll]
GO
/****** Object:  StoredProcedure [dbo].[USP_SystemUpdate]    Script Date: 04-10-2023 17:45:15 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_SystemUpdate]
GO
/****** Object:  StoredProcedure [dbo].[USP_SystemSettingInsertUpdate]    Script Date: 04-10-2023 17:45:15 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_SystemSettingInsertUpdate]
GO
/****** Object:  StoredProcedure [dbo].[USP_SystemSettingGet]    Script Date: 04-10-2023 17:45:15 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_SystemSettingGet]
GO
/****** Object:  StoredProcedure [dbo].[USP_SystemGetByName]    Script Date: 04-10-2023 17:45:15 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_SystemGetByName]
GO
/****** Object:  StoredProcedure [dbo].[USP_SystemGetById]    Script Date: 04-10-2023 17:45:15 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_SystemGetById]
GO
/****** Object:  StoredProcedure [dbo].[USP_SystemGetAll]    Script Date: 04-10-2023 17:45:15 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_SystemGetAll]
GO
/****** Object:  StoredProcedure [dbo].[USP_RolesPersmissionGetByRoleId]    Script Date: 04-10-2023 17:45:15 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_RolesPersmissionGetByRoleId]
GO
/****** Object:  StoredProcedure [dbo].[USP_RolesPersmissionGetByMenuId]    Script Date: 04-10-2023 17:45:15 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_RolesPersmissionGetByMenuId]
GO
/****** Object:  StoredProcedure [dbo].[USP_RolesPersmissionGetByMenu]    Script Date: 04-10-2023 17:45:15 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_RolesPersmissionGetByMenu]
GO
/****** Object:  StoredProcedure [dbo].[USP_RolesGetById]    Script Date: 04-10-2023 17:45:15 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_RolesGetById]
GO
/****** Object:  StoredProcedure [dbo].[USP_RolesGetAll]    Script Date: 04-10-2023 17:45:15 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_RolesGetAll]
GO
/****** Object:  StoredProcedure [dbo].[USP_RolePermissionInsertUpdate]    Script Date: 04-10-2023 17:45:15 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_RolePermissionInsertUpdate]
GO
/****** Object:  StoredProcedure [dbo].[USP_RoleInsertUpdate]    Script Date: 04-10-2023 17:45:15 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_RoleInsertUpdate]
GO
/****** Object:  StoredProcedure [dbo].[USP_ReportMasterGetByName]    Script Date: 04-10-2023 17:45:15 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_ReportMasterGetByName]
GO
/****** Object:  StoredProcedure [dbo].[USP_ReportMasterGetByIds]    Script Date: 04-10-2023 17:45:15 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_ReportMasterGetByIds]
GO
/****** Object:  StoredProcedure [dbo].[USP_ReportMasterGetById]    Script Date: 04-10-2023 17:45:15 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_ReportMasterGetById]
GO
/****** Object:  StoredProcedure [dbo].[USP_ReportMasterGetAll]    Script Date: 04-10-2023 17:45:15 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_ReportMasterGetAll]
GO
/****** Object:  StoredProcedure [dbo].[USP_PackageInsertUpdate]    Script Date: 04-10-2023 17:45:15 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_PackageInsertUpdate]
GO
/****** Object:  StoredProcedure [dbo].[USP_PackageGetById]    Script Date: 04-10-2023 17:45:15 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_PackageGetById]
GO
/****** Object:  StoredProcedure [dbo].[USP_PackageGetAll]    Script Date: 04-10-2023 17:45:15 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_PackageGetAll]
GO
/****** Object:  StoredProcedure [dbo].[USP_MenuGetByRoleId]    Script Date: 04-10-2023 17:45:15 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_MenuGetByRoleId]
GO
/****** Object:  StoredProcedure [dbo].[USP_MenuGetAll]    Script Date: 04-10-2023 17:45:15 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_MenuGetAll]
GO
/****** Object:  StoredProcedure [dbo].[USP_MasterDataGetBySystemId]    Script Date: 04-10-2023 17:45:15 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_MasterDataGetBySystemId]
GO
/****** Object:  StoredProcedure [dbo].[USP_LogingActivityUpdate]    Script Date: 04-10-2023 17:45:15 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_LogingActivityUpdate]
GO
/****** Object:  StoredProcedure [dbo].[USP_LogingActivityInsert]    Script Date: 04-10-2023 17:45:15 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_LogingActivityInsert]
GO
/****** Object:  StoredProcedure [dbo].[USP_LaneConfigInsertUpdate]    Script Date: 04-10-2023 17:45:15 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_LaneConfigInsertUpdate]
GO
/****** Object:  StoredProcedure [dbo].[USP_LaneConfigGetAll]    Script Date: 04-10-2023 17:45:15 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_LaneConfigGetAll]
GO
/****** Object:  StoredProcedure [dbo].[USP_IncidentStatusMasterGetAll]    Script Date: 04-10-2023 17:45:15 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_IncidentStatusMasterGetAll]
GO
/****** Object:  StoredProcedure [dbo].[USP_IncidentSourceGetAll]    Script Date: 04-10-2023 17:45:15 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_IncidentSourceGetAll]
GO
/****** Object:  StoredProcedure [dbo].[USP_IncidentGetPending]    Script Date: 04-10-2023 17:45:15 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_IncidentGetPending]
GO
/****** Object:  StoredProcedure [dbo].[USP_IncidentGetInProgress]    Script Date: 04-10-2023 17:45:15 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_IncidentGetInProgress]
GO
/****** Object:  StoredProcedure [dbo].[USP_IncidentGetClose]    Script Date: 04-10-2023 17:45:15 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_IncidentGetClose]
GO
/****** Object:  StoredProcedure [dbo].[USP_IncidentGetByFilter]    Script Date: 04-10-2023 17:45:15 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_IncidentGetByFilter]
GO
/****** Object:  StoredProcedure [dbo].[USP_IncidentDetailsUpdate]    Script Date: 04-10-2023 17:45:15 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_IncidentDetailsUpdate]
GO
/****** Object:  StoredProcedure [dbo].[USP_IncidentDetailsInsert]    Script Date: 04-10-2023 17:45:15 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_IncidentDetailsInsert]
GO
/****** Object:  StoredProcedure [dbo].[USP_IncidentDetailsGetById]    Script Date: 04-10-2023 17:45:15 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_IncidentDetailsGetById]
GO
/****** Object:  StoredProcedure [dbo].[USP_IncidentCategoryMasterGetAll]    Script Date: 04-10-2023 17:45:15 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_IncidentCategoryMasterGetAll]
GO
/****** Object:  StoredProcedure [dbo].[USP_IncidentActionInsert]    Script Date: 04-10-2023 17:45:15 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_IncidentActionInsert]
GO
/****** Object:  StoredProcedure [dbo].[USP_IncidentActionHistorGetById]    Script Date: 04-10-2023 17:45:15 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_IncidentActionHistorGetById]
GO
/****** Object:  StoredProcedure [dbo].[USP_GetWeatherConfig]    Script Date: 04-10-2023 17:45:15 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_GetWeatherConfig]
GO
/****** Object:  StoredProcedure [dbo].[USP_EventsTypeUpdate]    Script Date: 04-10-2023 17:45:15 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_EventsTypeUpdate]
GO
/****** Object:  StoredProcedure [dbo].[USP_EventsTypeMasterGetBySystemId]    Script Date: 04-10-2023 17:45:15 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_EventsTypeMasterGetBySystemId]
GO
/****** Object:  StoredProcedure [dbo].[USP_EventsTypeMasterGetAll]    Script Date: 04-10-2023 17:45:15 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_EventsTypeMasterGetAll]
GO
/****** Object:  StoredProcedure [dbo].[USP_ErrorInfoInsert]    Script Date: 04-10-2023 17:45:15 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_ErrorInfoInsert]
GO
/****** Object:  StoredProcedure [dbo].[USP_EquipmentTypeMasterGetAll]    Script Date: 04-10-2023 17:45:15 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_EquipmentTypeMasterGetAll]
GO
/****** Object:  StoredProcedure [dbo].[USP_EquipmentDetailsInsertUpdate]    Script Date: 04-10-2023 17:45:15 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_EquipmentDetailsInsertUpdate]
GO
/****** Object:  StoredProcedure [dbo].[USP_EquipmentDetailsGetBySystemId]    Script Date: 04-10-2023 17:45:15 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_EquipmentDetailsGetBySystemId]
GO
/****** Object:  StoredProcedure [dbo].[USP_EquipmentDetailsGetByIds]    Script Date: 04-10-2023 17:45:15 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_EquipmentDetailsGetByIds]
GO
/****** Object:  StoredProcedure [dbo].[USP_EquipmentDetailsGetById]    Script Date: 04-10-2023 17:45:15 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_EquipmentDetailsGetById]
GO
/****** Object:  StoredProcedure [dbo].[USP_EquipmentDetailsGetByFilter]    Script Date: 04-10-2023 17:45:15 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_EquipmentDetailsGetByFilter]
GO
/****** Object:  StoredProcedure [dbo].[USP_EquipmentDetailsGetByEquipmentTypeId]    Script Date: 04-10-2023 17:45:15 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_EquipmentDetailsGetByEquipmentTypeId]
GO
/****** Object:  StoredProcedure [dbo].[USP_EquipmentDetailsGetAll]    Script Date: 04-10-2023 17:45:15 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_EquipmentDetailsGetAll]
GO
/****** Object:  StoredProcedure [dbo].[USP_EquipmentConfigInsertUpdate]    Script Date: 04-10-2023 17:45:15 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_EquipmentConfigInsertUpdate]
GO
/****** Object:  StoredProcedure [dbo].[USP_EquipmentConfigGetBySystemId]    Script Date: 04-10-2023 17:45:15 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_EquipmentConfigGetBySystemId]
GO
/****** Object:  StoredProcedure [dbo].[USP_DashboardVSDSData]    Script Date: 04-10-2023 17:45:15 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_DashboardVSDSData]
GO
/****** Object:  StoredProcedure [dbo].[USP_DashboardVIDSData]    Script Date: 04-10-2023 17:45:15 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_DashboardVIDSData]
GO
/****** Object:  StoredProcedure [dbo].[USP_DashboardEquipmentDetailsGetAll]    Script Date: 04-10-2023 17:45:15 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_DashboardEquipmentDetailsGetAll]
GO
/****** Object:  StoredProcedure [dbo].[USP_DashboardATCCData]    Script Date: 04-10-2023 17:45:15 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_DashboardATCCData]
GO
/****** Object:  StoredProcedure [dbo].[USP_ControlRoomInsertUpdate]    Script Date: 04-10-2023 17:45:15 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_ControlRoomInsertUpdate]
GO
/****** Object:  StoredProcedure [dbo].[USP_ControlRoomGetById]    Script Date: 04-10-2023 17:45:15 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_ControlRoomGetById]
GO
/****** Object:  StoredProcedure [dbo].[USP_ControlRoomGetAll]    Script Date: 04-10-2023 17:45:15 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_ControlRoomGetAll]
GO
/****** Object:  StoredProcedure [dbo].[USP_ATCCPendingReviewEventsGetByHours]    Script Date: 04-10-2023 17:45:15 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_ATCCPendingReviewEventsGetByHours]
GO
/****** Object:  StoredProcedure [dbo].[USP_ATCCEventsReviewedGetByHours]    Script Date: 04-10-2023 17:45:15 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_ATCCEventsReviewedGetByHours]
GO
/****** Object:  StoredProcedure [dbo].[USP_ATCCEventsReviewedGetByFilter]    Script Date: 04-10-2023 17:45:15 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_ATCCEventsReviewedGetByFilter]
GO
/****** Object:  StoredProcedure [dbo].[USP_ATCCEventsGetByHours]    Script Date: 04-10-2023 17:45:15 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_ATCCEventsGetByHours]
GO
/****** Object:  StoredProcedure [dbo].[USP_ATCCEventsGetByFilter]    Script Date: 04-10-2023 17:45:15 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_ATCCEventsGetByFilter]
GO
/****** Object:  StoredProcedure [dbo].[USP_ATCCEventReviewUpdate]    Script Date: 04-10-2023 17:45:15 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_ATCCEventReviewUpdate]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_WeatherEventHistory]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_WeatherEventHistory] DROP CONSTRAINT IF EXISTS [DF__tbl_Weath__SendS__63A3C44B]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_WeatherEventHistory]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_WeatherEventHistory] DROP CONSTRAINT IF EXISTS [DF__tbl_Weath__IsAle__62AFA012]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_WeatherConfiguration]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_WeatherConfiguration] DROP CONSTRAINT IF EXISTS [DF__tbl_Weath__SendS__61BB7BD9]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_WeatherConfiguration]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_WeatherConfiguration] DROP CONSTRAINT IF EXISTS [DF__tbl_Weath__Modif__60C757A0]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_WeatherConfiguration]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_WeatherConfiguration] DROP CONSTRAINT IF EXISTS [DF__tbl_Weath__Modif__5FD33367]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_WeatherConfiguration]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_WeatherConfiguration] DROP CONSTRAINT IF EXISTS [DF__tbl_Weath__Creat__5EDF0F2E]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_WeatherConfiguration]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_WeatherConfiguration] DROP CONSTRAINT IF EXISTS [DF__tbl_Weath__Creat__5DEAEAF5]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_WeatherConfiguration]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_WeatherConfiguration] DROP CONSTRAINT IF EXISTS [DF__tbl_Weath__DataS__5CF6C6BC]
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
ALTER TABLE [dbo].[tbl_VIDSEventsHistory] DROP CONSTRAINT IF EXISTS [DF__tbl_VIDSE__Media__46136164]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_VIDSEventsHistory]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_VIDSEventsHistory] DROP CONSTRAINT IF EXISTS [DF__tbl_VIDSE__DataS__451F3D2B]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_VIDSEventsHistory]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_VIDSEventsHistory] DROP CONSTRAINT IF EXISTS [DF__tbl_VIDSE__Syste__442B18F2]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_VIDSEventsHistory]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_VIDSEventsHistory] DROP CONSTRAINT IF EXISTS [DF__tbl_VIDSE__Creat__4336F4B9]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_VIDSEventsHistory]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_VIDSEventsHistory] DROP CONSTRAINT IF EXISTS [DF__tbl_VIDSE__Revie__4242D080]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_VIDSEventsHistory]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_VIDSEventsHistory] DROP CONSTRAINT IF EXISTS [DF__tbl_VIDSE__Revie__414EAC47]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_VIDSEventsHistory]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_VIDSEventsHistory] DROP CONSTRAINT IF EXISTS [DF__tbl_VIDSE__Revie__405A880E]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_VIDSEventsHistory]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_VIDSEventsHistory] DROP CONSTRAINT IF EXISTS [DF__tbl_VIDSE__Revie__3F6663D5]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_VIDSEventsHistory]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_VIDSEventsHistory] DROP CONSTRAINT IF EXISTS [DF__tbl_VIDSE__Revie__3E723F9C]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_VIDSEventsHistory]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_VIDSEventsHistory] DROP CONSTRAINT IF EXISTS [DF__tbl_VIDSE__IsRev__3D7E1B63]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_VIDSEventsHistory]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_VIDSEventsHistory] DROP CONSTRAINT IF EXISTS [DF__tbl_VIDSE__Chall__3C89F72A]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_VIDSEventsHistory]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_VIDSEventsHistory] DROP CONSTRAINT IF EXISTS [DF__tbl_VIDSE__Chall__3B95D2F1]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_VIDSEventsHistory]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_VIDSEventsHistory] DROP CONSTRAINT IF EXISTS [DF__tbl_VIDSE__IsCha__3AA1AEB8]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_VIDSEventsHistory]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_VIDSEventsHistory] DROP CONSTRAINT IF EXISTS [DF__tbl_VIDSE__Incid__39AD8A7F]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_VehicleClass]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_VehicleClass] DROP CONSTRAINT IF EXISTS [DF__tbl_Vehic__Modif__5EAA0504]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_VehicleClass]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_VehicleClass] DROP CONSTRAINT IF EXISTS [DF__tbl_Vehic__Modif__5DB5E0CB]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_VehicleClass]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_VehicleClass] DROP CONSTRAINT IF EXISTS [DF__tbl_Vehic__Creat__5CC1BC92]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_VehicleClass]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_VehicleClass] DROP CONSTRAINT IF EXISTS [DF__tbl_Vehic__Creat__5BCD9859]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_VehicleClass]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_VehicleClass] DROP CONSTRAINT IF EXISTS [DF__tbl_Vehic__DataS__5AD97420]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_VehicleClass]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_VehicleClass] DROP CONSTRAINT IF EXISTS [DF__tbl_Vehic__Allow__59E54FE7]
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
ALTER TABLE [dbo].[tbl_SystemSetting] DROP CONSTRAINT IF EXISTS [DF__tbl_Syste__Modif__55DFB4D9]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_SystemSetting]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_SystemSetting] DROP CONSTRAINT IF EXISTS [DF__tbl_Syste__Modif__54EB90A0]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_SystemSetting]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_SystemSetting] DROP CONSTRAINT IF EXISTS [DF__tbl_Syste__Creat__53F76C67]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_SystemSetting]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_SystemSetting] DROP CONSTRAINT IF EXISTS [DF__tbl_Syste__Creat__5303482E]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_SystemSetting]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_SystemSetting] DROP CONSTRAINT IF EXISTS [DF__tbl_Syste__DataS__520F23F5]
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
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_ReportMaster]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_ReportMaster] DROP CONSTRAINT IF EXISTS [DF__tbl_Repor__Modif__1758727B]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_ReportMaster]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_ReportMaster] DROP CONSTRAINT IF EXISTS [DF__tbl_Repor__Modif__16644E42]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_ReportMaster]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_ReportMaster] DROP CONSTRAINT IF EXISTS [DF__tbl_Repor__Creat__15702A09]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_ReportMaster]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_ReportMaster] DROP CONSTRAINT IF EXISTS [DF__tbl_Repor__Creat__147C05D0]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_ReportMaster]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_ReportMaster] DROP CONSTRAINT IF EXISTS [DF__tbl_Repor__DataS__1387E197]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_ReportMaster]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_ReportMaster] DROP CONSTRAINT IF EXISTS [DF__tbl_Repor__Order__1293BD5E]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_ReportMaster]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_ReportMaster] DROP CONSTRAINT IF EXISTS [DF__tbl_Repor__Paren__119F9925]
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
ALTER TABLE [dbo].[tbl_MenuMaster] DROP CONSTRAINT IF EXISTS [DF__tbl_MenuM__Modif__07220AB2]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_MenuMaster]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_MenuMaster] DROP CONSTRAINT IF EXISTS [DF__tbl_MenuM__Modif__062DE679]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_MenuMaster]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_MenuMaster] DROP CONSTRAINT IF EXISTS [DF__tbl_MenuM__Creat__0539C240]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_MenuMaster]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_MenuMaster] DROP CONSTRAINT IF EXISTS [DF__tbl_MenuM__Creat__04459E07]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_MenuMaster]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_MenuMaster] DROP CONSTRAINT IF EXISTS [DF__tbl_MenuM__DataS__035179CE]
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
ALTER TABLE [dbo].[tbl_EventsTypeMaster] DROP CONSTRAINT IF EXISTS [DF__tbl_Event__Modif__58671BC9]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_EventsTypeMaster]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_EventsTypeMaster] DROP CONSTRAINT IF EXISTS [DF__tbl_Event__Modif__5772F790]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_EventsTypeMaster]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_EventsTypeMaster] DROP CONSTRAINT IF EXISTS [DF__tbl_Event__Creat__567ED357]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_EventsTypeMaster]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_EventsTypeMaster] DROP CONSTRAINT IF EXISTS [DF__tbl_Event__Creat__558AAF1E]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_EventsTypeMaster]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_EventsTypeMaster] DROP CONSTRAINT IF EXISTS [DF__tbl_Event__DataS__54968AE5]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_EventsTypeMaster]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_EventsTypeMaster] DROP CONSTRAINT IF EXISTS [DF__tbl_Event__Syste__53A266AC]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_EventsTypeMaster]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_EventsTypeMaster] DROP CONSTRAINT IF EXISTS [DF__tbl_Event__Chall__52AE4273]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_EventsTypeMaster]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_EventsTypeMaster] DROP CONSTRAINT IF EXISTS [DF__tbl_Event__Revie__51BA1E3A]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_EventsTypeMaster]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_EventsTypeMaster] DROP CONSTRAINT IF EXISTS [DF__tbl_Event__Event__50C5FA01]
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
ALTER TABLE [dbo].[tbl_EquipmentTypeMaster] DROP CONSTRAINT IF EXISTS [DF__tbl_Equip__Modif__4924D839]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_EquipmentTypeMaster]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_EquipmentTypeMaster] DROP CONSTRAINT IF EXISTS [DF__tbl_Equip__Modif__4830B400]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_EquipmentTypeMaster]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_EquipmentTypeMaster] DROP CONSTRAINT IF EXISTS [DF__tbl_Equip__Creat__473C8FC7]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_EquipmentTypeMaster]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_EquipmentTypeMaster] DROP CONSTRAINT IF EXISTS [DF__tbl_Equip__Creat__46486B8E]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_EquipmentTypeMaster]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_EquipmentTypeMaster] DROP CONSTRAINT IF EXISTS [DF__tbl_Equip__DataS__45544755]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_EquipmentTypeMaster]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_EquipmentTypeMaster] DROP CONSTRAINT IF EXISTS [DF__tbl_Equip__Equip__4460231C]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_EquipmentDetails]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_EquipmentDetails] DROP CONSTRAINT IF EXISTS [DF__tbl_Equip__Modif__3B2BBE9D]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_EquipmentDetails]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_EquipmentDetails] DROP CONSTRAINT IF EXISTS [DF__tbl_Equip__Modif__3A379A64]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_EquipmentDetails]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_EquipmentDetails] DROP CONSTRAINT IF EXISTS [DF__tbl_Equip__Creat__3943762B]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_EquipmentDetails]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_EquipmentDetails] DROP CONSTRAINT IF EXISTS [DF__tbl_Equip__Creat__384F51F2]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_EquipmentDetails]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_EquipmentDetails] DROP CONSTRAINT IF EXISTS [DF__tbl_Equip__DataS__375B2DB9]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_EquipmentDetails]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_EquipmentDetails] DROP CONSTRAINT IF EXISTS [DF__tbl_Equip__OnLin__36670980]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_EquipmentConfig]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_EquipmentConfig] DROP CONSTRAINT IF EXISTS [DF__tbl_Equip__Modif__3DB3258D]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_EquipmentConfig]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_EquipmentConfig] DROP CONSTRAINT IF EXISTS [DF__tbl_Equip__Modif__3CBF0154]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_EquipmentConfig]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_EquipmentConfig] DROP CONSTRAINT IF EXISTS [DF__tbl_Equip__Creat__3BCADD1B]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_EquipmentConfig]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_EquipmentConfig] DROP CONSTRAINT IF EXISTS [DF__tbl_Equip__Creat__3AD6B8E2]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_EquipmentConfig]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_EquipmentConfig] DROP CONSTRAINT IF EXISTS [DF__tbl_Equip__DataS__39E294A9]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_EquipmentConfig]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_EquipmentConfig] DROP CONSTRAINT IF EXISTS [DF__tbl_Equip__Order__38EE7070]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_EquipmentConfig]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_EquipmentConfig] DROP CONSTRAINT IF EXISTS [DF__tbl_Equip__LaneN__37FA4C37]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_EquipmentConfig]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_EquipmentConfig] DROP CONSTRAINT IF EXISTS [DF__tbl_Equip__Posit__370627FE]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_EquipmentConfig]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_EquipmentConfig] DROP CONSTRAINT IF EXISTS [DF__tbl_Equip__Paren__361203C5]
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
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_CallEventsDetails]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_CallEventsDetails] DROP CONSTRAINT IF EXISTS [DF__tbl_CallE__Modif__30592A6F]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_CallEventsDetails]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_CallEventsDetails] DROP CONSTRAINT IF EXISTS [DF__tbl_CallE__Modif__2F650636]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_CallEventsDetails]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_CallEventsDetails] DROP CONSTRAINT IF EXISTS [DF__tbl_CallE__Creat__2E70E1FD]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_CallEventsDetails]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_CallEventsDetails] DROP CONSTRAINT IF EXISTS [DF__tbl_CallE__Creat__2D7CBDC4]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_CallEventsDetails]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_CallEventsDetails] DROP CONSTRAINT IF EXISTS [DF__tbl_CallE__DataS__2C88998B]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_CallEventsDetails]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_CallEventsDetails] DROP CONSTRAINT IF EXISTS [DF__tbl_CallE__SendS__2B947552]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_ATCCEventsHistory]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_ATCCEventsHistory] DROP CONSTRAINT IF EXISTS [DF__tbl_ATCCE__Media__01BE3717]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_ATCCEventsHistory]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_ATCCEventsHistory] DROP CONSTRAINT IF EXISTS [DF__tbl_ATCCE__DataS__00CA12DE]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_ATCCEventsHistory]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_ATCCEventsHistory] DROP CONSTRAINT IF EXISTS [DF__tbl_ATCCE__Creat__7FD5EEA5]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_ATCCEventsHistory]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_ATCCEventsHistory] DROP CONSTRAINT IF EXISTS [DF__tbl_ATCCE__IsRev__7EE1CA6C]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_ATCCEventsHistory]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_ATCCEventsHistory] DROP CONSTRAINT IF EXISTS [DF__tbl_ATCCE__IsWro__7DEDA633]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_ATCCEventsHistory]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_ATCCEventsHistory] DROP CONSTRAINT IF EXISTS [DF__tbl_ATCCE__Vehic__7CF981FA]
GO
/****** Object:  Table [dbo].[temp_SystemMaster]    Script Date: 04-10-2023 17:45:15 ******/
DROP TABLE IF EXISTS [dbo].[temp_SystemMaster]
GO
/****** Object:  Table [dbo].[temp_LaneConfig]    Script Date: 04-10-2023 17:45:15 ******/
DROP TABLE IF EXISTS [dbo].[temp_LaneConfig]
GO
/****** Object:  Table [dbo].[temp_ImportPermission]    Script Date: 04-10-2023 17:45:15 ******/
DROP TABLE IF EXISTS [dbo].[temp_ImportPermission]
GO
/****** Object:  Table [dbo].[temp_EventsTypeMaster]    Script Date: 04-10-2023 17:45:15 ******/
DROP TABLE IF EXISTS [dbo].[temp_EventsTypeMaster]
GO
/****** Object:  Table [dbo].[temp_EquipmentConfig]    Script Date: 04-10-2023 17:45:15 ******/
DROP TABLE IF EXISTS [dbo].[temp_EquipmentConfig]
GO
/****** Object:  Table [dbo].[tbl_WeatherEventHistory]    Script Date: 04-10-2023 17:45:15 ******/
DROP TABLE IF EXISTS [dbo].[tbl_WeatherEventHistory]
GO
/****** Object:  Table [dbo].[tbl_WeatherConfiguration]    Script Date: 04-10-2023 17:45:15 ******/
DROP TABLE IF EXISTS [dbo].[tbl_WeatherConfiguration]
GO
/****** Object:  Table [dbo].[tbl_VSDSSectionSpeedHistory]    Script Date: 04-10-2023 17:45:15 ******/
DROP TABLE IF EXISTS [dbo].[tbl_VSDSSectionSpeedHistory]
GO
/****** Object:  Table [dbo].[tbl_VSDSEventsHistory]    Script Date: 04-10-2023 17:45:15 ******/
DROP TABLE IF EXISTS [dbo].[tbl_VSDSEventsHistory]
GO
/****** Object:  Table [dbo].[tbl_VMSMessageHistory]    Script Date: 04-10-2023 17:45:15 ******/
DROP TABLE IF EXISTS [dbo].[tbl_VMSMessageHistory]
GO
/****** Object:  Table [dbo].[tbl_VMSMessageDetails]    Script Date: 04-10-2023 17:45:15 ******/
DROP TABLE IF EXISTS [dbo].[tbl_VMSMessageDetails]
GO
/****** Object:  Table [dbo].[tbl_VIDSEventsHistory]    Script Date: 04-10-2023 17:45:15 ******/
DROP TABLE IF EXISTS [dbo].[tbl_VIDSEventsHistory]
GO
/****** Object:  Table [dbo].[tbl_VehicleClass]    Script Date: 04-10-2023 17:45:15 ******/
DROP TABLE IF EXISTS [dbo].[tbl_VehicleClass]
GO
/****** Object:  Table [dbo].[tbl_UserMaster]    Script Date: 04-10-2023 17:45:15 ******/
DROP TABLE IF EXISTS [dbo].[tbl_UserMaster]
GO
/****** Object:  Table [dbo].[tbl_SystemSetting]    Script Date: 04-10-2023 17:45:15 ******/
DROP TABLE IF EXISTS [dbo].[tbl_SystemSetting]
GO
/****** Object:  Table [dbo].[tbl_SystemMaster]    Script Date: 04-10-2023 17:45:15 ******/
DROP TABLE IF EXISTS [dbo].[tbl_SystemMaster]
GO
/****** Object:  Table [dbo].[tbl_RolePermission]    Script Date: 04-10-2023 17:45:15 ******/
DROP TABLE IF EXISTS [dbo].[tbl_RolePermission]
GO
/****** Object:  Table [dbo].[tbl_RoleMaster]    Script Date: 04-10-2023 17:45:15 ******/
DROP TABLE IF EXISTS [dbo].[tbl_RoleMaster]
GO
/****** Object:  Table [dbo].[tbl_ReportMaster]    Script Date: 04-10-2023 17:45:15 ******/
DROP TABLE IF EXISTS [dbo].[tbl_ReportMaster]
GO
/****** Object:  Table [dbo].[tbl_PackageDetails]    Script Date: 04-10-2023 17:45:15 ******/
DROP TABLE IF EXISTS [dbo].[tbl_PackageDetails]
GO
/****** Object:  Table [dbo].[tbl_MenuMaster]    Script Date: 04-10-2023 17:45:15 ******/
DROP TABLE IF EXISTS [dbo].[tbl_MenuMaster]
GO
/****** Object:  Table [dbo].[tbl_LogingActivity]    Script Date: 04-10-2023 17:45:15 ******/
DROP TABLE IF EXISTS [dbo].[tbl_LogingActivity]
GO
/****** Object:  Table [dbo].[tbl_LaneConfig]    Script Date: 04-10-2023 17:45:15 ******/
DROP TABLE IF EXISTS [dbo].[tbl_LaneConfig]
GO
/****** Object:  Table [dbo].[tbl_IncidentSubCategory]    Script Date: 04-10-2023 17:45:15 ******/
DROP TABLE IF EXISTS [dbo].[tbl_IncidentSubCategory]
GO
/****** Object:  Table [dbo].[tbl_IncidentStatusMaster]    Script Date: 04-10-2023 17:45:15 ******/
DROP TABLE IF EXISTS [dbo].[tbl_IncidentStatusMaster]
GO
/****** Object:  Table [dbo].[tbl_IncidentSourceMaster]    Script Date: 04-10-2023 17:45:15 ******/
DROP TABLE IF EXISTS [dbo].[tbl_IncidentSourceMaster]
GO
/****** Object:  Table [dbo].[tbl_IncidentDetailsHistory]    Script Date: 04-10-2023 17:45:15 ******/
DROP TABLE IF EXISTS [dbo].[tbl_IncidentDetailsHistory]
GO
/****** Object:  Table [dbo].[tbl_IncidentCheckListMaster]    Script Date: 04-10-2023 17:45:15 ******/
DROP TABLE IF EXISTS [dbo].[tbl_IncidentCheckListMaster]
GO
/****** Object:  Table [dbo].[tbl_IncidentCheckList]    Script Date: 04-10-2023 17:45:15 ******/
DROP TABLE IF EXISTS [dbo].[tbl_IncidentCheckList]
GO
/****** Object:  Table [dbo].[tbl_IncidentCategoryMaster]    Script Date: 04-10-2023 17:45:15 ******/
DROP TABLE IF EXISTS [dbo].[tbl_IncidentCategoryMaster]
GO
/****** Object:  Table [dbo].[tbl_IncidentActionHistory]    Script Date: 04-10-2023 17:45:15 ******/
DROP TABLE IF EXISTS [dbo].[tbl_IncidentActionHistory]
GO
/****** Object:  Table [dbo].[tbl_EventsTypeMaster]    Script Date: 04-10-2023 17:45:15 ******/
DROP TABLE IF EXISTS [dbo].[tbl_EventsTypeMaster]
GO
/****** Object:  Table [dbo].[tbl_ErrorInfo]    Script Date: 04-10-2023 17:45:15 ******/
DROP TABLE IF EXISTS [dbo].[tbl_ErrorInfo]
GO
/****** Object:  Table [dbo].[tbl_EquipmentTypeMaster]    Script Date: 04-10-2023 17:45:15 ******/
DROP TABLE IF EXISTS [dbo].[tbl_EquipmentTypeMaster]
GO
/****** Object:  Table [dbo].[tbl_EquipmentDetails]    Script Date: 04-10-2023 17:45:15 ******/
DROP TABLE IF EXISTS [dbo].[tbl_EquipmentDetails]
GO
/****** Object:  Table [dbo].[tbl_EquipmentConfig]    Script Date: 04-10-2023 17:45:15 ******/
DROP TABLE IF EXISTS [dbo].[tbl_EquipmentConfig]
GO
/****** Object:  Table [dbo].[tbl_ControlRoomMaster]    Script Date: 04-10-2023 17:45:15 ******/
DROP TABLE IF EXISTS [dbo].[tbl_ControlRoomMaster]
GO
/****** Object:  Table [dbo].[tbl_CallEventsDetails]    Script Date: 04-10-2023 17:45:15 ******/
DROP TABLE IF EXISTS [dbo].[tbl_CallEventsDetails]
GO
/****** Object:  Table [dbo].[tbl_ATCCEventsHistory]    Script Date: 04-10-2023 17:45:15 ******/
DROP TABLE IF EXISTS [dbo].[tbl_ATCCEventsHistory]
GO
/****** Object:  Table [dbo].[tbl_ActivityLog]    Script Date: 04-10-2023 17:45:15 ******/
DROP TABLE IF EXISTS [dbo].[tbl_ActivityLog]
GO
/****** Object:  Table [dbo].[OdishaEquipmentLocation1]    Script Date: 04-10-2023 17:45:15 ******/
DROP TABLE IF EXISTS [dbo].[OdishaEquipmentLocation1]
GO
/****** Object:  UserDefinedFunction [dbo].[SplitString]    Script Date: 04-10-2023 17:45:15 ******/
DROP FUNCTION IF EXISTS [dbo].[SplitString]
GO
/****** Object:  UserDefinedFunction [dbo].[GetDateDiffInHRMMSS]    Script Date: 04-10-2023 17:45:15 ******/
DROP FUNCTION IF EXISTS [dbo].[GetDateDiffInHRMMSS]
GO
/****** Object:  UserDefinedFunction [dbo].[fnc_ValueSplit]    Script Date: 04-10-2023 17:45:15 ******/
DROP FUNCTION IF EXISTS [dbo].[fnc_ValueSplit]
GO
/****** Object:  UserDefinedFunction [dbo].[fnc_Get24HourList]    Script Date: 04-10-2023 17:45:15 ******/
DROP FUNCTION IF EXISTS [dbo].[fnc_Get24HourList]
GO
/****** Object:  UserDefinedFunction [dbo].[fnc_Get24HourDate]    Script Date: 04-10-2023 17:45:15 ******/
DROP FUNCTION IF EXISTS [dbo].[fnc_Get24HourDate]
GO
/****** Object:  UserDefinedFunction [dbo].[fnc_CommaSeparated]    Script Date: 04-10-2023 17:45:15 ******/
DROP FUNCTION IF EXISTS [dbo].[fnc_CommaSeparated]
GO
/****** Object:  UserDefinedFunction [dbo].[fnc_CommaSeparated]    Script Date: 04-10-2023 17:45:15 ******/
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
/****** Object:  UserDefinedFunction [dbo].[fnc_Get24HourDate]    Script Date: 04-10-2023 17:45:15 ******/
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
/****** Object:  UserDefinedFunction [dbo].[fnc_Get24HourList]    Script Date: 04-10-2023 17:45:15 ******/
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
/****** Object:  UserDefinedFunction [dbo].[fnc_ValueSplit]    Script Date: 04-10-2023 17:45:15 ******/
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
/****** Object:  UserDefinedFunction [dbo].[GetDateDiffInHRMMSS]    Script Date: 04-10-2023 17:45:15 ******/
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
/****** Object:  UserDefinedFunction [dbo].[SplitString]    Script Date: 04-10-2023 17:45:15 ******/
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
/****** Object:  Table [dbo].[OdishaEquipmentLocation1]    Script Date: 04-10-2023 17:45:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OdishaEquipmentLocation1](
	[EquipmentId] [tinyint] NOT NULL,
	[PackageId] [tinyint] NOT NULL,
	[EquipmentTypeId] [tinyint] NOT NULL,
	[SystemId] [tinyint] NOT NULL,
	[EquipmentName] [nvarchar](50) NOT NULL,
	[DirectionId] [tinyint] NOT NULL,
	[ProtocolTypeId] [nvarchar](1) NULL,
	[IpAddress] [nvarchar](50) NOT NULL,
	[PortNumber] [tinyint] NOT NULL,
	[LoginId] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[ChainageNumber] [float] NOT NULL,
	[Latitude] [float] NOT NULL,
	[Longitude] [float] NOT NULL,
	[MacAddress] [nvarchar](1) NULL,
	[ModelNumber] [nvarchar](1) NULL,
	[SerialNumber] [nvarchar](1) NULL,
	[ManufacturerDetail] [nvarchar](1) NULL,
	[VendorDetail] [nvarchar](1) NULL,
	[ManufacturerDate] [nvarchar](1) NULL,
	[PurchageDate] [nvarchar](1) NULL,
	[WarrantyExpireDate] [nvarchar](1) NULL,
	[OnLineStatus] [tinyint] NULL,
	[DataStatus] [tinyint] NULL,
	[CreatedDate] [nvarchar](50) NULL,
	[CreatedBy] [tinyint] NULL,
	[ModifiedDate] [nvarchar](50) NULL,
	[ModifiedBy] [tinyint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_ActivityLog]    Script Date: 04-10-2023 17:45:15 ******/
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
/****** Object:  Table [dbo].[tbl_ATCCEventsHistory]    Script Date: 04-10-2023 17:45:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_ATCCEventsHistory](
	[TransactionId] [varchar](30) NULL,
	[EquipmentId] [bigint] NULL,
	[EventID] [varchar](255) NULL,
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
/****** Object:  Table [dbo].[tbl_CallEventsDetails]    Script Date: 04-10-2023 17:45:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_CallEventsDetails](
	[EventId] [varchar](255) NOT NULL,
	[CallerNumber] [varchar](20) NULL,
	[CalleeNumber] [varchar](20) NULL,
	[CallTypeId] [smallint] NULL,
	[SessionId] [varchar](50) NULL,
	[StartDateTime] [datetime] NULL,
	[EndDateTime] [datetime] NULL,
	[CallDuration] [smallint] NULL,
	[RecordingFileName] [varchar](255) NULL,
	[CallStatusId] [smallint] NULL,
	[CallReceivedBy] [bigint] NULL,
	[IncidentStatusId] [smallint] NULL,
	[SendStatus] [bit] NULL,
	[DataStatus] [smallint] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [bigint] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [bigint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_ControlRoomMaster]    Script Date: 04-10-2023 17:45:15 ******/
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
/****** Object:  Table [dbo].[tbl_EquipmentConfig]    Script Date: 04-10-2023 17:45:15 ******/
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
	[OrderBy] [smallint] NULL,
	[DataStatus] [smallint] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [bigint] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [bigint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_EquipmentDetails]    Script Date: 04-10-2023 17:45:15 ******/
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
	[OnLineStatus] [smallint] NULL,
	[DataStatus] [smallint] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [bigint] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [bigint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_EquipmentTypeMaster]    Script Date: 04-10-2023 17:45:15 ******/
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
	[DataStatus] [smallint] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [bigint] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [bigint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_ErrorInfo]    Script Date: 04-10-2023 17:45:15 ******/
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
/****** Object:  Table [dbo].[tbl_EventsTypeMaster]    Script Date: 04-10-2023 17:45:15 ******/
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
	[SystemId] [smallint] NULL,
	[DataStatus] [smallint] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [bigint] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [bigint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_IncidentActionHistory]    Script Date: 04-10-2023 17:45:15 ******/
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
/****** Object:  Table [dbo].[tbl_IncidentCategoryMaster]    Script Date: 04-10-2023 17:45:15 ******/
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
/****** Object:  Table [dbo].[tbl_IncidentCheckList]    Script Date: 04-10-2023 17:45:15 ******/
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
/****** Object:  Table [dbo].[tbl_IncidentCheckListMaster]    Script Date: 04-10-2023 17:45:15 ******/
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
/****** Object:  Table [dbo].[tbl_IncidentDetailsHistory]    Script Date: 04-10-2023 17:45:15 ******/
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
/****** Object:  Table [dbo].[tbl_IncidentSourceMaster]    Script Date: 04-10-2023 17:45:15 ******/
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
/****** Object:  Table [dbo].[tbl_IncidentStatusMaster]    Script Date: 04-10-2023 17:45:15 ******/
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
/****** Object:  Table [dbo].[tbl_IncidentSubCategory]    Script Date: 04-10-2023 17:45:15 ******/
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
/****** Object:  Table [dbo].[tbl_LaneConfig]    Script Date: 04-10-2023 17:45:15 ******/
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
/****** Object:  Table [dbo].[tbl_LogingActivity]    Script Date: 04-10-2023 17:45:15 ******/
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
/****** Object:  Table [dbo].[tbl_MenuMaster]    Script Date: 04-10-2023 17:45:15 ******/
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
/****** Object:  Table [dbo].[tbl_PackageDetails]    Script Date: 04-10-2023 17:45:15 ******/
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
/****** Object:  Table [dbo].[tbl_ReportMaster]    Script Date: 04-10-2023 17:45:15 ******/
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
/****** Object:  Table [dbo].[tbl_RoleMaster]    Script Date: 04-10-2023 17:45:15 ******/
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
/****** Object:  Table [dbo].[tbl_RolePermission]    Script Date: 04-10-2023 17:45:15 ******/
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
/****** Object:  Table [dbo].[tbl_SystemMaster]    Script Date: 04-10-2023 17:45:15 ******/
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
/****** Object:  Table [dbo].[tbl_SystemSetting]    Script Date: 04-10-2023 17:45:15 ******/
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
	[DataStatus] [smallint] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [bigint] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [bigint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_UserMaster]    Script Date: 04-10-2023 17:45:15 ******/
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
/****** Object:  Table [dbo].[tbl_VehicleClass]    Script Date: 04-10-2023 17:45:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_VehicleClass](
	[VehicleClassId] [smallint] IDENTITY(0,1) NOT NULL,
	[VehicleClassName] [varchar](20) NULL,
	[VehicleClassIcon] [varchar](50) NULL,
	[AllowedSpeed] [decimal](10, 2) NULL,
	[DataStatus] [smallint] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [bigint] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [bigint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_VIDSEventsHistory]    Script Date: 04-10-2023 17:45:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_VIDSEventsHistory](
	[TransactionId] [varchar](30) NULL,
	[EquipmentId] [bigint] NULL,
	[EventID] [varchar](255) NULL,
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
/****** Object:  Table [dbo].[tbl_VMSMessageDetails]    Script Date: 04-10-2023 17:45:15 ******/
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
/****** Object:  Table [dbo].[tbl_VMSMessageHistory]    Script Date: 04-10-2023 17:45:15 ******/
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
	[MessageDetails] [nvarchar](4000) NULL,
	[CreatedDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_VSDSEventsHistory]    Script Date: 04-10-2023 17:45:15 ******/
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
/****** Object:  Table [dbo].[tbl_VSDSSectionSpeedHistory]    Script Date: 04-10-2023 17:45:15 ******/
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
/****** Object:  Table [dbo].[tbl_WeatherConfiguration]    Script Date: 04-10-2023 17:45:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_WeatherConfiguration](
	[WeatherConfigurationId] [bigint] IDENTITY(1,1) NOT NULL,
	[AirTemperatureMin] [decimal](6, 2) NOT NULL,
	[AirTemperatureMax] [decimal](6, 2) NOT NULL,
	[HumidityRH] [decimal](6, 2) NOT NULL,
	[HumidityAH] [decimal](6, 2) NOT NULL,
	[Visibility] [decimal](8, 2) NOT NULL,
	[RoadTemperature] [decimal](6, 2) NOT NULL,
	[WindDirectionValue] [decimal](6, 2) NOT NULL,
	[WindSpeedValue] [decimal](6, 2) NOT NULL,
	[RainValue] [decimal](6, 2) NOT NULL,
	[DataStatus] [smallint] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [bigint] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [bigint] NULL,
	[SendStatus] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_WeatherEventHistory]    Script Date: 04-10-2023 17:45:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_WeatherEventHistory](
	[TransactionId] [varchar](30) NOT NULL,
	[EquipmentId] [bigint] NULL,
	[EventDate] [datetime] NULL,
	[AirTemperature] [decimal](6, 2) NOT NULL,
	[HumidityRH] [decimal](6, 2) NOT NULL,
	[HumidityAH] [decimal](6, 2) NOT NULL,
	[Visibility] [decimal](8, 2) NOT NULL,
	[RoadTemperature] [decimal](6, 2) NOT NULL,
	[WindDirectionValue] [decimal](6, 2) NOT NULL,
	[WindDirection] [varchar](10) NOT NULL,
	[WindSpeedValue] [decimal](6, 2) NOT NULL,
	[WindSpeedMeasurement] [varchar](10) NOT NULL,
	[RainValue] [decimal](6, 2) NOT NULL,
	[RainMeasurement] [varchar](10) NOT NULL,
	[IsAlertRequired] [bit] NULL,
	[SendStatus] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[temp_EquipmentConfig]    Script Date: 04-10-2023 17:45:15 ******/
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
	[SessionId] [varchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[temp_EventsTypeMaster]    Script Date: 04-10-2023 17:45:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[temp_EventsTypeMaster](
	[EventTypeId] [smallint] NOT NULL,
	[EventsRequired] [bit] NULL,
	[ReviewRequired] [bit] NULL,
	[ChallanTypeId] [smallint] NULL,
	[SessionId] [varchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[temp_ImportPermission]    Script Date: 04-10-2023 17:45:15 ******/
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
/****** Object:  Table [dbo].[temp_LaneConfig]    Script Date: 04-10-2023 17:45:15 ******/
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
/****** Object:  Table [dbo].[temp_SystemMaster]    Script Date: 04-10-2023 17:45:15 ******/
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
INSERT [dbo].[OdishaEquipmentLocation1] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (1, 1, 2, 3, N'ECB 1-1', 1, NULL, N'12.16.155.31', 80, N'aiplsys', N'ecbsys#987', 355.5, 19.945352554321289, 85.398429870605469, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, N'34:27.9', 0, N'34:27.9', 0)
GO
INSERT [dbo].[OdishaEquipmentLocation1] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (2, 1, 2, 3, N'ECB 1-2', 2, NULL, N'12.16.155.32', 80, N'aiplsys', N'ecbsys#987', 355.5, 19.944974899291992, 85.3984603881836, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, N'34:27.9', 0, N'34:27.9', 0)
GO
INSERT [dbo].[OdishaEquipmentLocation1] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (3, 1, 28, 3, N'ECB MC-1', 1, NULL, N'12.16.155.28', 80, N'aiplsys', N'ecbsys#987', 355.5, 19.945352554321289, 85.398429870605469, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[OdishaEquipmentLocation1] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (4, 1, 2, 3, N'ECB 2-1', 1, NULL, N'12.16.158.31', 80, N'aiplsys', N'ecbsys#987', 358.60000610351562, 19.957071304321289, 85.424407958984375, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, N'34:27.9', 0, N'34:27.9', 0)
GO
INSERT [dbo].[OdishaEquipmentLocation1] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (5, 1, 2, 3, N'ECB 2-2', 2, NULL, N'12.16.158.32', 80, N'aiplsys', N'ecbsys#987', 358.60000610351562, 19.956876754760742, 85.424552917480469, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, N'34:27.9', 0, N'34:27.9', 0)
GO
INSERT [dbo].[OdishaEquipmentLocation1] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (6, 1, 28, 3, N'ECB MC-2', 1, NULL, N'12.16.158.28', 80, N'aiplsys', N'ecbsys#987', 358.60000610351562, 19.957071304321289, 85.424407958984375, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[OdishaEquipmentLocation1] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (7, 1, 2, 3, N'ECB 3-1', 1, NULL, N'12.16.161.31', 80, N'aiplsys', N'ecbsys#987', 361.10000610351562, 19.971357345581055, 85.441162109375, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, N'34:27.9', 0, N'34:27.9', 0)
GO
INSERT [dbo].[OdishaEquipmentLocation1] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (8, 1, 2, 3, N'ECB 3-2', 2, NULL, N'12.16.161.32', 80, N'aiplsys', N'ecbsys#987', 361.10000610351562, 19.971158981323242, 85.441299438476562, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, N'34:27.9', 0, N'34:27.9', 0)
GO
INSERT [dbo].[OdishaEquipmentLocation1] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (9, 1, 28, 3, N'ECB MC-3', 1, NULL, N'12.16.161.28', 80, N'aiplsys', N'ecbsys#987', 361.10000610351562, 19.971357345581055, 85.441162109375, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[OdishaEquipmentLocation1] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (10, 1, 2, 3, N'ECB 4-1', 1, NULL, N'12.16.164.31', 80, N'aiplsys', N'ecbsys#987', 364, 19.985450744628906, 85.465400695800781, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, N'34:27.9', 0, N'34:27.9', 0)
GO
INSERT [dbo].[OdishaEquipmentLocation1] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (11, 1, 2, 3, N'ECB 4-2', 2, NULL, N'12.16.164.32', 80, N'aiplsys', N'ecbsys#987', 364, 19.985193252563477, 85.465522766113281, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, N'34:27.9', 0, N'34:27.9', 0)
GO
INSERT [dbo].[OdishaEquipmentLocation1] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (12, 1, 28, 3, N'ECB MC-4', 1, NULL, N'12.16.164.28', 80, N'aiplsys', N'ecbsys#987', 364, 19.985450744628906, 85.465400695800781, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[OdishaEquipmentLocation1] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (13, 1, 2, 3, N'ECB 5-1', 1, NULL, N'12.16.166.31', 80, N'aiplsys', N'ecbsys#987', 366.79998779296875, 20.002422332763672, 85.4831771850586, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, N'34:27.9', 0, N'34:27.9', 0)
GO
INSERT [dbo].[OdishaEquipmentLocation1] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (14, 1, 2, 3, N'ECB 5-2', 2, NULL, N'12.16.166.32', 80, N'aiplsys', N'ecbsys#987', 366.79998779296875, 20.002328872680664, 85.483413696289062, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, N'34:27.9', 0, N'34:27.9', 0)
GO
INSERT [dbo].[OdishaEquipmentLocation1] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (15, 1, 28, 3, N'ECB MC-5', 1, NULL, N'12.16.166.28', 80, N'aiplsys', N'ecbsys#987', 366.79998779296875, 20.002422332763672, 85.4831771850586, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[OdishaEquipmentLocation1] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (16, 1, 2, 3, N'ECB 6-1', 1, NULL, N'12.16.169.31', 80, N'aiplsys', N'ecbsys#987', 369.14999389648438, 20.015665054321289, 85.500328063964844, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, N'34:27.9', 0, N'34:27.9', 0)
GO
INSERT [dbo].[OdishaEquipmentLocation1] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (17, 1, 2, 3, N'ECB 6-2', 2, NULL, N'12.16.169.32', 80, N'aiplsys', N'ecbsys#987', 369.14999389648438, 20.015419006347656, 85.500450134277344, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, N'34:27.9', 0, N'34:27.9', 0)
GO
INSERT [dbo].[OdishaEquipmentLocation1] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (18, 1, 28, 3, N'ECB MC-6', 1, NULL, N'12.16.169.28', 80, N'aiplsys', N'ecbsys#987', 369.14999389648438, 20.015665054321289, 85.500328063964844, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[OdishaEquipmentLocation1] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (19, 1, 2, 3, N'ECB 7-1', 1, NULL, N'12.16.172.31', 80, N'aiplsys', N'ecbsys#987', 372.5, 20.036985397338867, 85.522834777832031, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, N'34:27.9', 0, N'34:27.9', 0)
GO
INSERT [dbo].[OdishaEquipmentLocation1] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (20, 1, 2, 3, N'ECB 7-2', 2, NULL, N'12.16.172.32', 80, N'aiplsys', N'ecbsys#987', 372.5, 20.03685188293457, 85.522956848144531, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, N'34:27.9', 0, N'34:27.9', 0)
GO
INSERT [dbo].[OdishaEquipmentLocation1] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (21, 1, 28, 3, N'ECB MC-7', 1, NULL, N'12.16.172.28', 80, N'aiplsys', N'ecbsys#987', 372.5, 20.036985397338867, 85.522834777832031, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[OdishaEquipmentLocation1] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (22, 1, 2, 3, N'ECB 8-1', 1, NULL, N'12.16.174.31', 80, N'aiplsys', N'ecbsys#987', 374.29998779296875, 20.048826217651367, 85.534248352050781, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, N'34:27.9', 0, N'34:27.9', 0)
GO
INSERT [dbo].[OdishaEquipmentLocation1] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (23, 1, 2, 3, N'ECB 8-2', 2, NULL, N'12.16.174.32', 80, N'aiplsys', N'ecbsys#987', 374.29998779296875, 20.048675537109375, 85.534408569335938, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, N'34:27.9', 0, N'34:27.9', 0)
GO
INSERT [dbo].[OdishaEquipmentLocation1] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (24, 1, 28, 3, N'ECB MC-8', 1, NULL, N'12.16.174.28', 80, N'aiplsys', N'ecbsys#987', 374.29998779296875, 20.048826217651367, 85.534248352050781, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[OdishaEquipmentLocation1] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (25, 1, 2, 3, N'ECB 9-1', 1, NULL, N'12.16.177.31', 80, N'aiplsys', N'ecbsys#987', 377.739990234375, 20.073381423950195, 85.55450439453125, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, N'34:27.9', 0, N'34:27.9', 0)
GO
INSERT [dbo].[OdishaEquipmentLocation1] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (26, 1, 2, 3, N'ECB 9-2', 2, NULL, N'12.16.177.32', 80, N'aiplsys', N'ecbsys#987', 377.739990234375, 20.073240280151367, 85.5546875, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, N'34:27.9', 0, N'34:27.9', 0)
GO
INSERT [dbo].[OdishaEquipmentLocation1] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (27, 1, 28, 3, N'ECB MC-9', 1, NULL, N'12.16.177.28', 80, N'aiplsys', N'ecbsys#987', 377.739990234375, 20.073381423950195, 85.55450439453125, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[OdishaEquipmentLocation1] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (28, 1, 2, 3, N'ECB 10-1', 1, NULL, N'12.16.179.31', 80, N'aiplsys', N'ecbsys#987', 379.79000854492188, 20.089458465576172, 85.566719055175781, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, N'34:27.9', 0, N'34:27.9', 0)
GO
INSERT [dbo].[OdishaEquipmentLocation1] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (29, 1, 2, 3, N'ECB 10-2', 2, NULL, N'12.16.179.32', 80, N'aiplsys', N'ecbsys#987', 379.79000854492188, 20.089374542236328, 85.566864013671875, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, N'34:27.9', 0, N'34:27.9', 0)
GO
INSERT [dbo].[OdishaEquipmentLocation1] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (30, 1, 28, 3, N'ECB MC-10', 1, NULL, N'12.16.179.28', 80, N'aiplsys', N'ecbsys#987', 379.79000854492188, 20.089458465576172, 85.566719055175781, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[OdishaEquipmentLocation1] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (31, 1, 2, 3, N'ECB 11-1', 1, NULL, N'12.16.183.31', 80, N'aiplsys', N'ecbsys#987', 383.05999755859375, 20.115041732788086, 85.577079772949219, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, N'34:27.9', 0, N'34:27.9', 0)
GO
INSERT [dbo].[OdishaEquipmentLocation1] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (32, 1, 2, 3, N'ECB 11-2', 2, NULL, N'12.16.183.32', 80, N'aiplsys', N'ecbsys#987', 383.05999755859375, 20.115045547485352, 85.5772933959961, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, N'34:27.9', 0, N'34:27.9', 0)
GO
INSERT [dbo].[OdishaEquipmentLocation1] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (33, 1, 28, 3, N'ECB MC-11', 1, NULL, N'12.16.183.28', 80, N'aiplsys', N'ecbsys#987', 383.05999755859375, 20.115041732788086, 85.577079772949219, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[OdishaEquipmentLocation1] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (34, 1, 2, 3, N'ECB 12-1', 1, NULL, N'12.16.187.31', 80, N'aiplsys', N'ecbsys#987', 387.70001220703125, 20.149215698242188, 85.6010513305664, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, N'34:27.9', 0, N'34:27.9', 0)
GO
INSERT [dbo].[OdishaEquipmentLocation1] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (35, 1, 2, 3, N'ECB 12-2', 2, NULL, N'12.16.187.32', 80, N'aiplsys', N'ecbsys#987', 387.70001220703125, 20.1491641998291, 85.601272583007812, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, N'34:27.9', 0, N'34:27.9', 0)
GO
INSERT [dbo].[OdishaEquipmentLocation1] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (36, 1, 28, 3, N'ECB MC-12', 1, NULL, N'12.16.187.28', 80, N'aiplsys', N'ecbsys#987', 387.70001220703125, 20.149215698242188, 85.6010513305664, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[OdishaEquipmentLocation1] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (37, 1, 2, 3, N'ECB 13-1', 1, NULL, N'12.16.190.31', 80, N'aiplsys', N'ecbsys#987', 390.70001220703125, 20.169586181640625, 85.61907958984375, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, N'34:27.9', 0, N'34:27.9', 0)
GO
INSERT [dbo].[OdishaEquipmentLocation1] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (38, 1, 2, 3, N'ECB 13-2', 2, NULL, N'12.16.190.32', 80, N'aiplsys', N'ecbsys#987', 390.70001220703125, 20.169460296630859, 85.619178771972656, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, N'34:27.9', 0, N'34:27.9', 0)
GO
INSERT [dbo].[OdishaEquipmentLocation1] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (39, 1, 28, 3, N'ECB MC-13', 1, NULL, N'12.16.190.28', 80, N'aiplsys', N'ecbsys#987', 390.70001220703125, 20.169586181640625, 85.61907958984375, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[OdishaEquipmentLocation1] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (40, 1, 2, 3, N'ECB 14-1', 1, NULL, N'12.16.193.31', 80, N'aiplsys', N'ecbsys#987', 393.70001220703125, 20.182796478271484, 85.64312744140625, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, N'34:27.9', 0, N'34:27.9', 0)
GO
INSERT [dbo].[OdishaEquipmentLocation1] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (41, 1, 2, 3, N'ECB 14-2', 2, NULL, N'12.16.193.32', 80, N'aiplsys', N'ecbsys#987', 393.70001220703125, 20.1827392578125, 85.643318176269531, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, N'34:27.9', 0, N'34:27.9', 0)
GO
INSERT [dbo].[OdishaEquipmentLocation1] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (42, 1, 28, 3, N'ECB MC-14', 1, NULL, N'12.16.193.28', 80, N'aiplsys', N'ecbsys#987', 393.70001220703125, 20.182796478271484, 85.64312744140625, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[OdishaEquipmentLocation1] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (43, 1, 2, 3, N'ECB 15-1', 1, NULL, N'12.16.196.31', 80, N'aiplsys', N'ecbsys#987', 396.70001220703125, 20.199689865112305, 85.661827087402344, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, N'34:27.9', 0, N'34:27.9', 0)
GO
INSERT [dbo].[OdishaEquipmentLocation1] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (44, 1, 2, 3, N'ECB 15-2', 2, NULL, N'12.16.196.32', 80, N'aiplsys', N'ecbsys#987', 396.70001220703125, 20.199573516845703, 85.661918640136719, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, N'34:27.9', 0, N'34:27.9', 0)
GO
INSERT [dbo].[OdishaEquipmentLocation1] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (45, 1, 28, 3, N'ECB MC-15', 1, NULL, N'12.16.196.28', 80, N'aiplsys', N'ecbsys#987', 396.70001220703125, 20.199689865112305, 85.661827087402344, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[OdishaEquipmentLocation1] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (46, 1, 2, 3, N'ECB 16-1', 1, NULL, N'12.16.199.31', 80, N'aiplsys', N'ecbsys#987', 399.70001220703125, 20.208751678466797, 85.687507629394531, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, N'34:27.9', 0, N'34:27.9', 0)
GO
INSERT [dbo].[OdishaEquipmentLocation1] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (47, 1, 2, 3, N'ECB 16-2', 2, NULL, N'12.16.199.32', 80, N'aiplsys', N'ecbsys#987', 399.70001220703125, 20.208566665649414, 85.687515258789062, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, N'34:27.9', 0, N'34:27.9', 0)
GO
INSERT [dbo].[OdishaEquipmentLocation1] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (48, 1, 28, 3, N'ECB MC-16', 1, NULL, N'12.16.199.28', 80, N'aiplsys', N'ecbsys#987', 399.70001220703125, 20.208751678466797, 85.687507629394531, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[OdishaEquipmentLocation1] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (49, 1, 2, 3, N'ECB 17-1', 1, NULL, N'12.16.202.31', 80, N'aiplsys', N'ecbsys#987', 402, 20.21452522277832, 85.7099838256836, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, N'34:27.9', 0, N'34:27.9', 0)
GO
INSERT [dbo].[OdishaEquipmentLocation1] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (50, 1, 2, 3, N'ECB 17-2', 2, NULL, N'12.16.202.32', 80, N'aiplsys', N'ecbsys#987', 402, 20.214410781860352, 85.710044860839844, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, N'34:27.9', 0, N'34:27.9', 0)
GO
INSERT [dbo].[OdishaEquipmentLocation1] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (51, 1, 28, 3, N'ECB MC-17', 1, NULL, N'12.16.202.28', 80, N'aiplsys', N'ecbsys#987', 402, 20.21452522277832, 85.7099838256836, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[OdishaEquipmentLocation1] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (52, 1, 2, 3, N'ECB 18-1', 1, NULL, N'12.16.204.31', 80, N'aiplsys', N'ecbsys#987', 404.33999633789062, 20.225492477416992, 85.728706359863281, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, N'34:27.9', 0, N'34:27.9', 0)
GO
INSERT [dbo].[OdishaEquipmentLocation1] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (53, 1, 2, 3, N'ECB 18-2', 2, NULL, N'12.16.204.32', 80, N'aiplsys', N'ecbsys#987', 404.33999633789062, 20.225008010864258, 85.728988647460938, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, N'34:27.9', 0, N'34:27.9', 0)
GO
INSERT [dbo].[OdishaEquipmentLocation1] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (54, 1, 28, 3, N'ECB MC-18', 1, NULL, N'12.16.204.28', 80, N'aiplsys', N'ecbsys#987', 404.33999633789062, 20.225492477416992, 85.728706359863281, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[OdishaEquipmentLocation1] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (55, 1, 2, 3, N'ECB 19-1', 1, NULL, N'12.16.208.31', 80, N'aiplsys', N'ecbsys#987', 408.29998779296875, 20.242761611938477, 85.76275634765625, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, N'34:27.9', 0, N'34:27.9', 0)
GO
INSERT [dbo].[OdishaEquipmentLocation1] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (56, 1, 2, 3, N'ECB 19-2', 2, NULL, N'12.16.208.32', 80, N'aiplsys', N'ecbsys#987', 408.29998779296875, 20.2425594329834, 85.762802124023438, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, N'34:27.9', 0, N'34:27.9', 0)
GO
INSERT [dbo].[OdishaEquipmentLocation1] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (57, 1, 28, 3, N'ECB MC-19', 1, NULL, N'12.16.208.28', 80, N'aiplsys', N'ecbsys#987', 408.29998779296875, 20.242761611938477, 85.76275634765625, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[OdishaEquipmentLocation1] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (58, 1, 2, 3, N'ECB 20-1', 1, NULL, N'12.16.210.31', 80, N'aiplsys', N'ecbsys#987', 410.79998779296875, 20.249370574951172, 85.783561706542969, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, N'34:27.9', 0, N'34:27.9', 0)
GO
INSERT [dbo].[OdishaEquipmentLocation1] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (59, 1, 2, 3, N'ECB 20-2', 2, NULL, N'12.16.210.32', 80, N'aiplsys', N'ecbsys#987', 410.79998779296875, 20.24931526184082, 85.783699035644531, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, N'34:27.9', 0, N'34:27.9', 0)
GO
INSERT [dbo].[OdishaEquipmentLocation1] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (60, 1, 28, 3, N'ECB MC-20', 1, NULL, N'12.16.210.28', 80, N'aiplsys', N'ecbsys#987', 410.79998779296875, 20.249370574951172, 85.783561706542969, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[OdishaEquipmentLocation1] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (61, 1, 32, 2, N'ATCC', 2, NULL, N'12.16.175.2', 80, N'aiplsys', N'atcsys#987', 375.32000732421875, 20.054725646972656, 85.541061401367188, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, N'34:27.9', 0, N'34:27.9', 0)
GO
INSERT [dbo].[OdishaEquipmentLocation1] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (62, 1, 28, 2, N'ATCC MC-1', 1, NULL, N'12.16.175.28', 80, N'aiplsys', N'ecbsys#987', 375.32000732421875, 20.054725646972656, 85.541061401367188, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[OdishaEquipmentLocation1] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (63, 1, 25, 6, N'VIDS', 2, NULL, N'12.16.169.6', 80, N'aiplsys', N'vidsys#987', 369.79998779296875, 20.019426345825195, 85.504791259765625, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, N'34:27.9', 0, N'34:27.9', 0)
GO
INSERT [dbo].[OdishaEquipmentLocation1] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (64, 1, 28, 6, N'VIDS MC-1', 1, NULL, N'12.16.169.28', 80, N'aiplsys', N'ecbsys#987', 369.79998779296875, 20.019426345825195, 85.504791259765625, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[OdishaEquipmentLocation1] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (65, 1, 25, 6, N'VIDS', 2, NULL, N'12.16.183.6', 80, N'aiplsys', N'vidsys#987', 383.20001220703125, 20.117118835449219, 85.577011108398438, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, N'34:27.9', 0, N'34:27.9', 0)
GO
INSERT [dbo].[OdishaEquipmentLocation1] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (66, 1, 28, 6, N'VIDS MC-2', 1, NULL, N'12.16.183.28', 80, N'aiplsys', N'ecbsys#987', 383.20001220703125, 20.117118835449219, 85.577011108398438, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[OdishaEquipmentLocation1] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (67, 1, 25, 6, N'VIDS', 2, NULL, N'12.16.189.6', 80, N'aiplsys', N'vidsys#987', 389.35000610351562, 20.161703109741211, 85.609367370605469, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, N'34:27.9', 0, N'34:27.9', 0)
GO
INSERT [dbo].[OdishaEquipmentLocation1] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (68, 1, 28, 6, N'VIDS MC-3', 1, NULL, N'12.16.189.28', 80, N'aiplsys', N'ecbsys#987', 389.35000610351562, 20.161703109741211, 85.609367370605469, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[OdishaEquipmentLocation1] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (69, 1, 25, 6, N'VIDS', 2, NULL, N'12.16.204.6', 80, N'aiplsys', N'vidsys#987', 404.25, 20.224081039428711, 85.72686767578125, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, N'34:27.9', 0, N'34:27.9', 0)
GO
INSERT [dbo].[OdishaEquipmentLocation1] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (70, 1, 28, 6, N'VIDS MC-4', 1, NULL, N'12.16.204.28', 80, N'aiplsys', N'ecbsys#987', 404.25, 20.224081039428711, 85.72686767578125, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[OdishaEquipmentLocation1] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (71, 1, 25, 6, N'VIDS', 2, NULL, N'12.16.210.6', 80, N'aiplsys', N'vidsys#987', 410.82000732421875, 20.249319076538086, 85.783622741699219, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, N'34:27.9', 0, N'34:27.9', 0)
GO
INSERT [dbo].[OdishaEquipmentLocation1] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (72, 1, 28, 6, N'VIDS MC-5', 1, NULL, N'12.16.210.28', 80, N'aiplsys', N'ecbsys#987', 410.82000732421875, 20.249319076538086, 85.783622741699219, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[OdishaEquipmentLocation1] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (73, 1, 25, 6, N'VIDS', 2, NULL, N'12.16.213.6', 80, N'aiplsys', N'vidsys#987', 413.03500366210938, 20.26701545715332, 85.79217529296875, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, N'34:27.9', 0, N'34:27.9', 0)
GO
INSERT [dbo].[OdishaEquipmentLocation1] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (74, 1, 28, 6, N'VIDS MC-6', 1, NULL, N'12.16.213.28', 80, N'aiplsys', N'ecbsys#987', 413.03500366210938, 20.26701545715332, 85.79217529296875, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[OdishaEquipmentLocation1] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (75, 1, 8, 7, N'VMS', 2, NULL, N'12.16.157.7', 80, N'aiplsys', N'vmsys#987', 357.70001220703125, 19.950590133666992, 85.4172134399414, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, N'34:27.9', 0, N'34:27.9', 0)
GO
INSERT [dbo].[OdishaEquipmentLocation1] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (76, 1, 28, 7, N'VMS MC-1', 2, NULL, N'12.16.157.28', 80, N'aiplsys', N'ecbsys#987', 357.70001220703125, 19.950590133666992, 85.4172134399414, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[OdishaEquipmentLocation1] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (77, 1, 8, 7, N'VMS', 2, NULL, N'12.16.196.7', 80, N'aiplsys', N'vmsys#987', 396.75, 20.200216293334961, 85.662673950195312, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, N'34:27.9', 0, N'34:27.9', 0)
GO
INSERT [dbo].[OdishaEquipmentLocation1] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (78, 1, 28, 7, N'VMS MC-2', 2, NULL, N'12.16.196.28', 80, N'aiplsys', N'ecbsys#987', 396.75, 20.200216293334961, 85.662673950195312, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[OdishaEquipmentLocation1] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (79, 1, 8, 7, N'VMS', 2, NULL, N'12.16.206.7', 80, N'aiplsys', N'vmsys#987', 406.67999267578125, 20.236167907714844, 85.747848510742188, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, N'34:27.9', 0, N'34:27.9', 0)
GO
INSERT [dbo].[OdishaEquipmentLocation1] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (80, 1, 28, 7, N'VMS MC-3', 2, NULL, N'12.16.206.28', 80, N'aiplsys', N'ecbsys#987', 406.67999267578125, 20.236167907714844, 85.747848510742188, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[OdishaEquipmentLocation1] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (81, 1, 8, 7, N'VMS', 2, NULL, N'12.16.210.7', 80, N'aiplsys', N'vmsys#987', 410.79998779296875, 20.249458312988281, 85.78369140625, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, N'34:27.9', 0, N'34:27.9', 0)
GO
INSERT [dbo].[OdishaEquipmentLocation1] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (82, 1, 28, 7, N'VMS MC-4', 2, NULL, N'12.16.210.28', 80, N'aiplsys', N'ecbsys#987', 410.79998779296875, 20.249458312988281, 85.78369140625, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[OdishaEquipmentLocation1] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (83, 1, 1, 5, N'CCTV', 2, NULL, N'12.16.171.5', 80, N'aiplsys', N'ptzsys#987', 371.83999633789062, 20.032810211181641, 85.518508911132812, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, N'34:27.9', 0, N'34:27.9', 0)
GO
INSERT [dbo].[OdishaEquipmentLocation1] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (84, 1, 28, 5, N'CCTV MC-1', 2, NULL, N'12.16.171.28', 80, N'aiplsys', N'ecbsys#987', 371.83999633789062, 20.032810211181641, 85.518508911132812, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[OdishaEquipmentLocation1] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (85, 1, 1, 5, N'CCTV', 2, NULL, N'12.16.177.5', 80, N'aiplsys', N'ptzsys#987', 377.5, 20.071273803710938, 85.5530014038086, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, N'34:27.9', 0, N'34:27.9', 0)
GO
INSERT [dbo].[OdishaEquipmentLocation1] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (86, 1, 28, 5, N'CCTV MC-2', 2, NULL, N'12.16.177.28', 80, N'aiplsys', N'ecbsys#987', 377.5, 20.071273803710938, 85.5530014038086, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[OdishaEquipmentLocation1] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (87, 1, 1, 5, N'CCTV', 2, NULL, N'12.16.195.5', 80, N'aiplsys', N'ptzsys#987', 395.79998779296875, 20.195501327514648, 85.655364990234375, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, N'34:27.9', 0, N'34:27.9', 0)
GO
INSERT [dbo].[OdishaEquipmentLocation1] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (88, 1, 28, 5, N'CCTV MC-3', 2, NULL, N'12.16.195.28', 80, N'aiplsys', N'ecbsys#987', 395.79998779296875, 20.195501327514648, 85.655364990234375, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[OdishaEquipmentLocation1] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (89, 1, 1, 5, N'CCTV', 2, NULL, N'12.16.200.5', 80, N'aiplsys', N'ptzsys#987', 400.10000610351562, 20.20903205871582, 85.692962646484375, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, N'34:27.9', 0, N'34:27.9', 0)
GO
INSERT [dbo].[OdishaEquipmentLocation1] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (90, 1, 28, 5, N'CCTV MC-4', 2, NULL, N'12.16.200.28', 80, N'aiplsys', N'ecbsys#987', 400.10000610351562, 20.20903205871582, 85.692962646484375, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[OdishaEquipmentLocation1] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (91, 1, 1, 5, N'CCTV', 2, NULL, N'12.16.208.5', 80, N'aiplsys', N'ptzsys#987', 408.45001220703125, 20.242971420288086, 85.764083862304688, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, N'34:27.9', 0, N'34:27.9', 0)
GO
INSERT [dbo].[OdishaEquipmentLocation1] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (92, 1, 28, 5, N'CCTV MC-5', 2, NULL, N'12.16.208.28', 80, N'aiplsys', N'ecbsys#987', 408.45001220703125, 20.242971420288086, 85.764083862304688, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[OdishaEquipmentLocation1] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (93, 1, 1, 5, N'CCTV', 2, NULL, N'12.16.210.5', 80, N'aiplsys', N'ptzsys#987', 410, 20.244583129882812, 85.7763671875, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, N'34:27.9', 0, N'34:27.9', 0)
GO
INSERT [dbo].[OdishaEquipmentLocation1] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (94, 1, 28, 5, N'CCTV MC-6', 2, NULL, N'12.16.210.28', 80, N'aiplsys', N'ecbsys#987', 410, 20.244583129882812, 85.7763671875, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[OdishaEquipmentLocation1] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (95, 1, 31, 1, N'MRCS', 1, NULL, N'12.16.175.1', 80, N'aiplsys', N'ptzsys#987', 375.489990234375, 20.05640983581543, 85.542671203613281, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, N'34:27.9', 0, N'34:27.9', 0)
GO
INSERT [dbo].[OdishaEquipmentLocation1] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (96, 1, 4, 9, N'MET', 1, NULL, N'12.16.175.9', 80, N'aiplsys', N'ptzsys#987', 375.489990234375, 20.056392669677734, 85.54266357421875, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, N'34:27.9', 0, N'34:27.9', 0)
GO
SET IDENTITY_INSERT [dbo].[tbl_ActivityLog] ON 
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (1, 0, NULL, N'{"RoleId":2,"RoleName":"Testing","DataStatus":1,"CreatedDate":"2023-06-17T05:16:49.577","CreatedBy":0,"ModifiedDate":"2023-06-17T05:16:49.403","ModifiedBy":0}', N'Insert', N'9', CAST(N'2023-06-17T05:16:49.577' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (2, 0, N'{"RoleId":2,"RoleName":"Testing","DataStatus":1,"CreatedDate":"2023-06-17T05:16:49.577","CreatedBy":0,"ModifiedDate":"2023-06-17T05:16:49.403","ModifiedBy":0}', N'{"RoleId":2,"RoleName":"Testing","DataStatus":2,"CreatedDate":"2023-06-17T05:16:49.577","CreatedBy":0,"ModifiedDate":"2023-06-17T05:24:34.373","ModifiedBy":0}', N'Update', N'9', CAST(N'2023-06-17T05:24:34.373' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (3, 0, N'{"RoleId":2,"RoleName":"Testing","DataStatus":2,"CreatedDate":"2023-06-17T05:16:49.577","CreatedBy":0,"ModifiedDate":"2023-06-17T05:24:34.373","ModifiedBy":0}', N'{"RoleId":2,"RoleName":"Testing","DataStatus":1,"CreatedDate":"2023-06-17T05:16:49.577","CreatedBy":0,"ModifiedDate":"2023-06-17T05:26:10.700","ModifiedBy":0}', N'Update', N'9', CAST(N'2023-06-17T05:26:10.700' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (4, 0, NULL, NULL, N'Permission Modified', N'9', CAST(N'2023-06-17T05:50:25.417' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (5, 0, NULL, NULL, N'Permission Modified', N'9', CAST(N'2023-06-17T05:50:40.283' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (13, 0, N'{"UserId":1,"LoginId":"Admin","LoginPassword":"wTGXfQWcGaBfZJavKzulTQ==","FirstName":"Admin","LastName":"Admin","EmailId":"Admin@gmail.com","MobileNumber":"9982567732","AccountExpiredDate":"2033-06-16","RoleId":1,"UserTypeId":0,"DataStatus":1,"CreatedDate":"2023-06-16T01:10:15.223","CreatedBy":0,"ModifiedDate":"2023-06-17T07:59:25.673","ModifiedBy":1}', N'{"UserId":1,"LoginId":"Admin","LoginPassword":"wTGXfQWcGaBfZJavKzulTQ==","FirstName":"Admin","LastName":"Admin","EmailId":"Admin@gmail.com","MobileNumber":"9982567732","AccountExpiredDate":"2033-06-16","RoleId":1,"UserTypeId":0,"DataStatus":1,"CreatedDate":"2023-06-16T01:10:15.223","CreatedBy":0,"ModifiedDate":"2023-06-17T07:59:55.173","ModifiedBy":1}', N'Update', N'10', CAST(N'2023-06-17T07:59:55.173' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (14, 0, N'{"UserId":1,"LoginId":"Admin","LoginPassword":"wTGXfQWcGaBfZJavKzulTQ==","FirstName":"Admin","LastName":"Admin","EmailId":"Admin@gmail.com","MobileNumber":"9982567732","AccountExpiredDate":"2033-06-16","RoleId":1,"UserTypeId":0,"DataStatus":1,"CreatedDate":"2023-06-16T01:10:15.223","CreatedBy":0,"ModifiedDate":"2023-06-17T07:59:55.173","ModifiedBy":1}', N'{"UserId":1,"LoginId":"Admin","LoginPassword":"wTGXfQWcGaBfZJavKzulTQ==","FirstName":"Admin","LastName":"Admin","EmailId":"Admin@gmail.com","MobileNumber":"9982567732","AccountExpiredDate":"2033-06-16","RoleId":1,"UserTypeId":0,"DataStatus":1,"CreatedDate":"2023-06-16T01:10:15.223","CreatedBy":0,"ModifiedDate":"2023-06-17T08:01:20.507","ModifiedBy":1}', N'Update', N'10', CAST(N'2023-06-17T08:01:20.507' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (15, 0, N'{"UserId":1,"LoginId":"Admin","LoginPassword":"wTGXfQWcGaBfZJavKzulTQ==","FirstName":"Admin","LastName":"Admin","EmailId":"Admin@gmail.com","MobileNumber":"9982567732","AccountExpiredDate":"2033-06-16","RoleId":1,"UserTypeId":0,"DataStatus":1,"CreatedDate":"2023-06-16T01:10:15.223","CreatedBy":0,"ModifiedDate":"2023-06-17T08:01:20.507","ModifiedBy":1}', N'{"UserId":1,"LoginId":"Admin","LoginPassword":"wTGXfQWcGaBfZJavKzulTQ==","FirstName":"Admin","LastName":"Admin","EmailId":"Admin@gmail.com","MobileNumber":"9982567732","AccountExpiredDate":"2033-06-16","RoleId":1,"UserTypeId":0,"DataStatus":1,"CreatedDate":"2023-06-16T01:10:15.223","CreatedBy":0,"ModifiedDate":"2023-06-17T08:01:42.103","ModifiedBy":1}', N'Update', N'10', CAST(N'2023-06-17T08:01:42.103' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (16, 0, N'{"UserId":1,"LoginId":"Admin","LoginPassword":"wTGXfQWcGaBfZJavKzulTQ==","FirstName":"Admin","LastName":"Admin","EmailId":"Admin@gmail.com","MobileNumber":"9982567732","AccountExpiredDate":"2033-06-16","RoleId":1,"UserTypeId":0,"DataStatus":1,"CreatedDate":"2023-06-16T01:10:15.223","CreatedBy":0,"ModifiedDate":"2023-06-17T08:01:42.103","ModifiedBy":1}', N'{"UserId":1,"LoginId":"Admin","LoginPassword":"D8xXdXLEvWnyaacDv4ryUg==","FirstName":"Admin","LastName":"Admin","EmailId":"Admin@gmail.com","MobileNumber":"9982567732","AccountExpiredDate":"2033-06-16","RoleId":1,"UserTypeId":0,"DataStatus":1,"CreatedDate":"2023-06-16T01:10:15.223","CreatedBy":0,"ModifiedDate":"2023-06-17T08:02:54.163","ModifiedBy":1}', N'Update', N'10', CAST(N'2023-06-17T08:02:54.163' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (6, 0, NULL, N'{"ControlRoomId":1,"ControlRoomName":"Control Room 1","DataStatus":1,"CreatedDate":"2023-06-17T06:20:12.823","CreatedBy":0,"ModifiedDate":"2023-06-17T06:20:12.597","ModifiedBy":0}', N'Insert', N'3', CAST(N'2023-06-17T06:20:12.823' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (7, 0, N'{"ControlRoomId":1,"ControlRoomName":"Control Room 1","DataStatus":1,"CreatedDate":"2023-06-17T06:20:12.823","CreatedBy":0,"ModifiedDate":"2023-06-17T06:20:12.597","ModifiedBy":0}', N'{"ControlRoomId":1,"ControlRoomName":"Control Room 1","DataStatus":2,"CreatedDate":"2023-06-17T06:20:12.823","CreatedBy":0,"ModifiedDate":"2023-06-17T06:23:00.153","ModifiedBy":0}', N'Update', N'3', CAST(N'2023-06-17T06:23:00.153' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (8, 0, N'{"ControlRoomId":1,"ControlRoomName":"Control Room 1","DataStatus":2,"CreatedDate":"2023-06-17T06:20:12.823","CreatedBy":0,"ModifiedDate":"2023-06-17T06:23:00.153","ModifiedBy":0}', N'{"ControlRoomId":1,"ControlRoomName":"Control Room 1","DataStatus":1,"CreatedDate":"2023-06-17T06:20:12.823","CreatedBy":0,"ModifiedDate":"2023-06-17T06:23:13.193","ModifiedBy":0}', N'Update', N'3', CAST(N'2023-06-17T06:23:13.193' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (9, 0, N'{"RoleId":1,"RoleName":"Admin","DataStatus":1,"CreatedDate":"2023-06-16T01:15:40.177","CreatedBy":0,"ModifiedDate":"2023-06-16T01:15:40.177","ModifiedBy":0}', N'{"RoleId":1,"RoleName":"Admin","DataStatus":1,"CreatedDate":"2023-06-16T01:15:40.177","CreatedBy":0,"ModifiedDate":"2023-06-17T06:30:15.133","ModifiedBy":0}', N'Update', N'9', CAST(N'2023-06-17T06:30:15.133' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (10, 0, N'{"RoleId":1,"RoleName":"Admin","DataStatus":1,"CreatedDate":"2023-06-16T01:15:40.177","CreatedBy":0,"ModifiedDate":"2023-06-17T06:30:15.133","ModifiedBy":0}', N'{"RoleId":1,"RoleName":"Admin","DataStatus":1,"CreatedDate":"2023-06-16T01:15:40.177","CreatedBy":0,"ModifiedDate":"2023-06-17T06:30:40.920","ModifiedBy":0}', N'Update', N'9', CAST(N'2023-06-17T06:30:40.920' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (11, 0, N'{"UserId":1,"LoginId":"Admin","LoginPassword":"Admin","FirstName":"Admin","LastName":"Admin","EmailId":"Admin@1","MobileNumber":"9982567732","AccountExpiredDate":"2033-06-16","RoleId":1,"UserTypeId":1,"DataStatus":1,"CreatedDate":"2023-06-16T01:10:15.223","CreatedBy":0,"ModifiedDate":"2023-06-16T01:10:15.223","ModifiedBy":0}', N'{"UserId":1,"LoginId":"Admin","LoginPassword":"wTGXfQWcGaBfZJavKzulTQ==","FirstName":"Admin","LastName":"Admin","EmailId":"Admin@gmail.com","MobileNumber":"9982567732","AccountExpiredDate":"2033-06-16","RoleId":1,"UserTypeId":0,"DataStatus":1,"CreatedDate":"2023-06-16T01:10:15.223","CreatedBy":0,"ModifiedDate":"2023-06-17T07:59:23.117","ModifiedBy":1}', N'Update', N'10', CAST(N'2023-06-17T07:59:23.117' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (12, 0, N'{"UserId":1,"LoginId":"Admin","LoginPassword":"wTGXfQWcGaBfZJavKzulTQ==","FirstName":"Admin","LastName":"Admin","EmailId":"Admin@gmail.com","MobileNumber":"9982567732","AccountExpiredDate":"2033-06-16","RoleId":1,"UserTypeId":0,"DataStatus":1,"CreatedDate":"2023-06-16T01:10:15.223","CreatedBy":0,"ModifiedDate":"2023-06-17T07:59:23.117","ModifiedBy":1}', N'{"UserId":1,"LoginId":"Admin","LoginPassword":"wTGXfQWcGaBfZJavKzulTQ==","FirstName":"Admin","LastName":"Admin","EmailId":"Admin@gmail.com","MobileNumber":"9982567732","AccountExpiredDate":"2033-06-16","RoleId":1,"UserTypeId":0,"DataStatus":1,"CreatedDate":"2023-06-16T01:10:15.223","CreatedBy":0,"ModifiedDate":"2023-06-17T07:59:25.673","ModifiedBy":1}', N'Update', N'10', CAST(N'2023-06-17T07:59:25.673' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (17, 0, N'{"UserId":1,"LoginId":"Admin","LoginPassword":"D8xXdXLEvWnyaacDv4ryUg==","FirstName":"Admin","LastName":"Admin","EmailId":"Admin@gmail.com","MobileNumber":"9982567732","AccountExpiredDate":"2033-06-16","RoleId":1,"UserTypeId":0,"DataStatus":1,"CreatedDate":"2023-06-16T01:10:15.223","CreatedBy":0,"ModifiedDate":"2023-06-17T08:02:54.163","ModifiedBy":1}', N'{"UserId":1,"LoginId":"Admin","LoginPassword":"D8xXdXLEvWnyaacDv4ryUg==","FirstName":"Admin","LastName":"Admin","EmailId":"Admin@gmail.com","MobileNumber":"9982567732","AccountExpiredDate":"2033-06-16","RoleId":1,"UserTypeId":0,"DataStatus":1,"CreatedDate":"2023-06-16T01:10:15.223","CreatedBy":0,"ModifiedDate":"2023-06-17T08:03:47.203","ModifiedBy":1}', N'Update', N'10', CAST(N'2023-06-17T08:03:47.203' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (20, 0, NULL, NULL, N'Permission Modified', N'9', CAST(N'2023-06-21T21:04:51.370' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (65, 0, NULL, NULL, N'VIDS- Modified', N'29', CAST(N'2023-07-26T17:13:11.080' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (18, 0, NULL, N'{"ControlRoomId":2,"ControlRoomName":"CR2","DataStatus":1,"CreatedDate":"2023-06-19T23:15:11.700","CreatedBy":0,"ModifiedDate":"2023-06-19T23:15:11.717","ModifiedBy":0}', N'Insert', N'3', CAST(N'2023-06-19T23:15:11.700' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (19, 0, N'{"RoleId":2,"RoleName":"Testing","DataStatus":1,"CreatedDate":"2023-06-17T05:16:49.577","CreatedBy":0,"ModifiedDate":"2023-06-17T05:26:10.700","ModifiedBy":0}', N'{"RoleId":2,"RoleName":"Operator","DataStatus":1,"CreatedDate":"2023-06-17T05:16:49.577","CreatedBy":0,"ModifiedDate":"2023-06-19T23:15:53.770","ModifiedBy":0}', N'Update', N'9', CAST(N'2023-06-19T23:15:53.770' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (21, 0, NULL, NULL, N'Permission Modified', N'9', CAST(N'2023-06-22T00:00:04.770' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (22, 0, NULL, N'{"EquipmentId":48,"PackageId":1,"EquipmentTypeId":1,"EquipmentName":"0","EquipmentDirectionId":2,"EquipmentProtocolTypeId":1,"EquipmentIP":"192.168.1.1","EquipmentPortNumber":80,"EquipmentLoginId":"a","EquipmentPassword":"a","EquipmentChainageNumber":0.000,"EquipmentLatitude":0.000000,"EquipmentLongitude":0.000000,"EquipmentMacAddress":"0","EquipmentModelNumber":"0","EquipmentSerialNumber":"0","EquipmentManufacturer":"0","EquipmentVendorDetail":"0","EquipmentManufacturerDate":"2023-06-22","EquipmentPurchageDate":"2023-06-22","EquipmentWarrantyExpireDate":"2023-06-22","OnLineStatus":0,"DataStatus":1,"CreatedDate":"2023-06-22T08:39:25.650","CreatedBy":0,"ModifiedDate":"2023-06-22T08:39:26.867","ModifiedBy":0}', N'Insert', N'4', CAST(N'2023-06-22T08:39:25.650' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (24, 0, N'{"EquipmentId":48,"PackageId":1,"EquipmentTypeId":1,"SystemId":16,"EquipmentName":"3","EquipmentDirectionId":0,"EquipmentProtocolTypeId":0,"EquipmentIP":"192.168.1.1","EquipmentPortNumber":80,"EquipmentLoginId":"a","EquipmentPassword":"a","EquipmentChainageNumber":2.000,"EquipmentLatitude":0.000000,"EquipmentLongitude":1.000000,"EquipmentMacAddress":"4","EquipmentModelNumber":"5","EquipmentSerialNumber":"6","EquipmentManufacturer":"7","EquipmentVendorDetail":"8","EquipmentManufacturerDate":"2023-06-22","EquipmentPurchageDate":"2023-06-23","EquipmentWarrantyExpireDate":"2023-06-24","OnLineStatus":0,"DataStatus":1,"CreatedDate":"2023-06-22T08:39:25.650","CreatedBy":0,"ModifiedDate":"2023-06-23T23:07:14.947","ModifiedBy":0}', N'{"EquipmentId":48,"PackageId":1,"EquipmentTypeId":1,"SystemId":16,"EquipmentName":"3","EquipmentDirectionId":16,"EquipmentProtocolTypeId":0,"EquipmentIP":"192.168.1.1","EquipmentPortNumber":80,"EquipmentLoginId":"a","EquipmentPassword":"a","EquipmentChainageNumber":2.000,"EquipmentLatitude":0.000000,"EquipmentLongitude":1.000000,"EquipmentMacAddress":"4","EquipmentModelNumber":"5","EquipmentSerialNumber":"6","EquipmentManufacturer":"7","EquipmentVendorDetail":"8","EquipmentManufacturerDate":"2023-06-22","EquipmentPurchageDate":"2023-06-23","EquipmentWarrantyExpireDate":"2023-06-24","OnLineStatus":0,"DataStatus":1,"CreatedDate":"2023-06-22T08:39:25.650","CreatedBy":0,"ModifiedDate":"2023-06-23T23:15:31.503","ModifiedBy":0}', N'Update', N'4', CAST(N'2023-06-23T23:15:31.503' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (30, 0, N'{"ControlRoomId":1,"ControlRoomName":"Control Room 1","DataStatus":1,"CreatedDate":"2023-06-17T06:20:12.823","CreatedBy":0,"ModifiedDate":"2023-06-17T06:23:13.193","ModifiedBy":0}', N'{"ControlRoomId":1,"ControlRoomName":"","DataStatus":1,"CreatedDate":"2023-06-17T06:20:12.823","CreatedBy":0,"ModifiedDate":"2023-06-24T12:59:35.340","ModifiedBy":0}', N'Update', N'3', CAST(N'2023-06-24T12:59:35.340' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (31, 0, N'{"ControlRoomId":1,"ControlRoomName":"","DataStatus":1,"CreatedDate":"2023-06-17T06:20:12.823","CreatedBy":0,"ModifiedDate":"2023-06-24T12:59:35.340","ModifiedBy":0}', N'{"ControlRoomId":1,"ControlRoomName":"","DataStatus":1,"CreatedDate":"2023-06-17T06:20:12.823","CreatedBy":0,"ModifiedDate":"2023-06-24T13:00:00.387","ModifiedBy":0}', N'Update', N'3', CAST(N'2023-06-24T13:00:00.387' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (48, 1, N'', N'', N'Update Password', N'10', CAST(N'2023-06-26T21:33:24.717' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (49, 1, N'', N'', N'Update Password', N'10', CAST(N'2023-06-26T21:33:56.993' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (70, 0, NULL, NULL, N'VIDS- Modified', N'30', CAST(N'2023-07-27T22:20:26.333' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (75, 0, NULL, N'{"EventTypeId":5,"IsChallanRequired":false,"ChallanTypeId":0}', N'Insert', N'32', CAST(N'2023-07-30T15:45:13.260' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (76, 0, NULL, N'{"EventTypeId":5,"IsChallanRequired":false,"ChallanTypeId":0}', N'Insert', N'32', CAST(N'2023-07-30T15:45:20.023' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (78, 0, NULL, N'{"EventTypeId":5,"IsChallanRequired":false,"ChallanTypeId":0}', N'Insert', N'32', CAST(N'2023-08-01T13:25:16.863' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (23, 0, N'{"EquipmentId":48,"PackageId":1,"EquipmentTypeId":1,"SystemId":16,"EquipmentName":"0","EquipmentDirectionId":2,"EquipmentProtocolTypeId":1,"EquipmentIP":"192.168.1.1","EquipmentPortNumber":80,"EquipmentLoginId":"a","EquipmentPassword":"a","EquipmentChainageNumber":0.000,"EquipmentLatitude":0.000000,"EquipmentLongitude":0.000000,"EquipmentMacAddress":"0","EquipmentModelNumber":"0","EquipmentSerialNumber":"0","EquipmentManufacturer":"0","EquipmentVendorDetail":"0","EquipmentManufacturerDate":"2023-06-22","EquipmentPurchageDate":"2023-06-22","EquipmentWarrantyExpireDate":"2023-06-22","OnLineStatus":0,"DataStatus":1,"CreatedDate":"2023-06-22T08:39:25.650","CreatedBy":0,"ModifiedDate":"2023-06-22T08:39:26.867","ModifiedBy":0}', N'{"EquipmentId":48,"PackageId":1,"EquipmentTypeId":1,"SystemId":0,"EquipmentName":"3","EquipmentDirectionId":0,"EquipmentProtocolTypeId":0,"EquipmentIP":"192.168.1.1","EquipmentPortNumber":80,"EquipmentLoginId":"a","EquipmentPassword":"a","EquipmentChainageNumber":2.000,"EquipmentLatitude":0.000000,"EquipmentLongitude":1.000000,"EquipmentMacAddress":"4","EquipmentModelNumber":"5","EquipmentSerialNumber":"6","EquipmentManufacturer":"7","EquipmentVendorDetail":"8","EquipmentManufacturerDate":"2023-06-22","EquipmentPurchageDate":"2023-06-23","EquipmentWarrantyExpireDate":"2023-06-24","OnLineStatus":0,"DataStatus":1,"CreatedDate":"2023-06-22T08:39:25.650","CreatedBy":0,"ModifiedDate":"2023-06-23T23:07:14.947","ModifiedBy":0}', N'Update', N'4', CAST(N'2023-06-23T23:07:14.947' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (25, 0, N'{"EquipmentId":48,"PackageId":1,"EquipmentTypeId":1,"SystemId":16,"EquipmentName":"3","EquipmentDirectionId":16,"EquipmentProtocolTypeId":0,"EquipmentIP":"192.168.1.1","EquipmentPortNumber":80,"EquipmentLoginId":"a","EquipmentPassword":"a","EquipmentChainageNumber":2.000,"EquipmentLatitude":0.000000,"EquipmentLongitude":1.000000,"EquipmentMacAddress":"4","EquipmentModelNumber":"5","EquipmentSerialNumber":"6","EquipmentManufacturer":"7","EquipmentVendorDetail":"8","EquipmentManufacturerDate":"2023-06-22","EquipmentPurchageDate":"2023-06-23","EquipmentWarrantyExpireDate":"2023-06-24","OnLineStatus":0,"DataStatus":1,"CreatedDate":"2023-06-22T08:39:25.650","CreatedBy":0,"ModifiedDate":"2023-06-23T23:15:31.503","ModifiedBy":0}', N'{"EquipmentId":48,"PackageId":1,"EquipmentTypeId":1,"SystemId":16,"EquipmentName":"3","EquipmentDirectionId":16,"EquipmentProtocolTypeId":0,"EquipmentIP":"192.168.1.1","EquipmentPortNumber":80,"EquipmentLoginId":"a","EquipmentPassword":"a","EquipmentChainageNumber":2.000,"EquipmentLatitude":0.000000,"EquipmentLongitude":1.000000,"EquipmentMacAddress":"4","EquipmentModelNumber":"5","EquipmentSerialNumber":"6","EquipmentManufacturer":"7","EquipmentVendorDetail":"8","EquipmentManufacturerDate":"2023-06-22","EquipmentPurchageDate":"2023-06-23","EquipmentWarrantyExpireDate":"2023-06-24","OnLineStatus":0,"DataStatus":1,"CreatedDate":"2023-06-22T08:39:25.650","CreatedBy":0,"ModifiedDate":"2023-06-23T23:30:53.677","ModifiedBy":0}', N'Update', N'4', CAST(N'2023-06-23T23:30:53.677' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (45, 0, N'{"ClassId":2,"VehicleClassId":1,"VehicleClassName":"Motorcycle","VehicleClassIcon":"fa fa-motorcycle","AllowedSpeed":80.00,"DataStatus":1,"CreatedDate":"2022-01-18T12:21:46.273","CreatedBy":0,"ModifiedDate":"2022-09-17T12:16:25.887","ModifiedBy":1}', N'{"ClassId":2,"VehicleClassId":1,"VehicleClassName":"Motorcycle","VehicleClassIcon":"fa fa-motorcycle","AllowedSpeed":80.00,"DataStatus":1,"CreatedDate":"2022-01-18T12:21:46.273","CreatedBy":0,"ModifiedDate":"2023-06-26T21:17:34.287","ModifiedBy":0}', N'Update', N'8', CAST(N'2023-06-26T21:17:34.287' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (79, 0, NULL, N'{"EventTypeId":5,"IsChallanRequired":false,"ChallanTypeId":0}', N'Insert', N'32', CAST(N'2023-08-01T14:21:22.523' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (80, 0, NULL, N'{"EventTypeId":5,"IsChallanRequired":false,"ChallanTypeId":0}', N'Insert', N'32', CAST(N'2023-08-01T14:21:27.500' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (81, 0, NULL, N'{"EventTypeId":5,"IsChallanRequired":false,"ChallanTypeId":0}', N'Insert', N'32', CAST(N'2023-08-01T14:21:32.930' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (82, 0, NULL, N'{"EventTypeId":5,"IsChallanRequired":false,"ChallanTypeId":0}', N'Insert', N'32', CAST(N'2023-08-01T14:21:39.323' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (83, 0, NULL, N'{"EventTypeId":8,"IsChallanRequired":false,"ChallanTypeId":0}', N'Insert', N'32', CAST(N'2023-08-01T14:21:43.813' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (26, 0, N'{"EquipmentId":48,"PackageId":1,"EquipmentTypeId":1,"SystemId":16,"EquipmentName":"3","EquipmentDirectionId":16,"EquipmentProtocolTypeId":0,"EquipmentIP":"192.168.1.1","EquipmentPortNumber":80,"EquipmentLoginId":"a","EquipmentPassword":"a","EquipmentChainageNumber":2.000,"EquipmentLatitude":0.000000,"EquipmentLongitude":1.000000,"EquipmentMacAddress":"4","EquipmentModelNumber":"5","EquipmentSerialNumber":"6","EquipmentManufacturer":"7","EquipmentVendorDetail":"8","EquipmentManufacturerDate":"2023-06-22","EquipmentPurchageDate":"2023-06-23","EquipmentWarrantyExpireDate":"2023-06-24","OnLineStatus":0,"DataStatus":1,"CreatedDate":"2023-06-22T08:39:25.650","CreatedBy":0,"ModifiedDate":"2023-06-23T23:30:53.677","ModifiedBy":0}', N'{"EquipmentId":48,"PackageId":1,"EquipmentTypeId":1,"SystemId":16,"EquipmentName":"3","EquipmentDirectionId":16,"EquipmentProtocolTypeId":0,"EquipmentIP":"192.168.1.1","EquipmentPortNumber":80,"EquipmentLoginId":"a","EquipmentPassword":"a","EquipmentChainageNumber":2.000,"EquipmentLatitude":0.000000,"EquipmentLongitude":1.000000,"EquipmentMacAddress":"4","EquipmentModelNumber":"5","EquipmentSerialNumber":"6","EquipmentManufacturer":"7","EquipmentVendorDetail":"8","EquipmentManufacturerDate":"2023-06-22","EquipmentPurchageDate":"2023-06-23","EquipmentWarrantyExpireDate":"2023-06-24","OnLineStatus":0,"DataStatus":1,"CreatedDate":"2023-06-22T08:39:25.650","CreatedBy":0,"ModifiedDate":"2023-06-23T23:31:04.240","ModifiedBy":0}', N'Update', N'4', CAST(N'2023-06-23T23:31:04.240' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (27, 0, N'{"EquipmentId":48,"PackageId":1,"EquipmentTypeId":1,"SystemId":16,"EquipmentName":"3","EquipmentDirectionId":16,"EquipmentProtocolTypeId":0,"EquipmentIP":"192.168.1.1","EquipmentPortNumber":80,"EquipmentLoginId":"a","EquipmentPassword":"a","EquipmentChainageNumber":2.000,"EquipmentLatitude":0.000000,"EquipmentLongitude":1.000000,"EquipmentMacAddress":"4","EquipmentModelNumber":"5","EquipmentSerialNumber":"6","EquipmentManufacturer":"7","EquipmentVendorDetail":"8","EquipmentManufacturerDate":"2023-06-22","EquipmentPurchageDate":"2023-06-23","EquipmentWarrantyExpireDate":"2023-06-24","OnLineStatus":0,"DataStatus":1,"CreatedDate":"2023-06-22T08:39:25.650","CreatedBy":0,"ModifiedDate":"2023-06-23T23:31:04.240","ModifiedBy":0}', N'{"EquipmentId":48,"PackageId":1,"EquipmentTypeId":1,"SystemId":16,"EquipmentName":"3","EquipmentDirectionId":0,"EquipmentProtocolTypeId":0,"EquipmentIP":"192.168.1.1","EquipmentPortNumber":80,"EquipmentLoginId":"a","EquipmentPassword":"a","EquipmentChainageNumber":2.000,"EquipmentLatitude":0.000000,"EquipmentLongitude":1.000000,"EquipmentMacAddress":"4","EquipmentModelNumber":"5","EquipmentSerialNumber":"6","EquipmentManufacturer":"7","EquipmentVendorDetail":"8","EquipmentManufacturerDate":"2023-06-22","EquipmentPurchageDate":"2023-06-23","EquipmentWarrantyExpireDate":"2023-06-24","OnLineStatus":0,"DataStatus":1,"CreatedDate":"2023-06-22T08:39:25.650","CreatedBy":0,"ModifiedDate":"2023-06-23T23:37:40.670","ModifiedBy":0}', N'Update', N'4', CAST(N'2023-06-23T23:37:40.670' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (32, 0, N'{"ControlRoomId":1,"ControlRoomName":"","DataStatus":1,"CreatedDate":"2023-06-17T06:20:12.823","CreatedBy":0,"ModifiedDate":"2023-06-24T13:00:00.387","ModifiedBy":0}', N'{"ControlRoomId":1,"ControlRoomName":"CR-1","DataStatus":1,"CreatedDate":"2023-06-17T06:20:12.823","CreatedBy":0,"ModifiedDate":"2023-06-24T13:00:28.427","ModifiedBy":0}', N'Update', N'3', CAST(N'2023-06-24T13:00:28.427' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (84, 0, NULL, N'{"EventTypeId":3,"IsChallanRequired":false,"ChallanTypeId":6}', N'Insert', N'32', CAST(N'2023-08-01T14:25:10.517' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (85, 0, NULL, N'{"EventTypeId":3,"IsChallanRequired":false,"ChallanTypeId":6}', N'Insert', N'32', CAST(N'2023-08-01T14:26:17.683' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (86, 0, NULL, N'{"EventTypeId":3,"IsChallanRequired":false,"ChallanTypeId":6}', N'Insert', N'32', CAST(N'2023-08-01T14:26:18.610' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (87, 0, NULL, N'{"EventTypeId":3,"IsChallanRequired":false,"ChallanTypeId":6}', N'Insert', N'32', CAST(N'2023-08-01T14:26:19.347' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (88, 0, NULL, N'{"EventTypeId":3,"IsChallanRequired":false,"ChallanTypeId":6}', N'Insert', N'32', CAST(N'2023-08-01T14:26:19.937' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (89, 0, NULL, N'{"EventTypeId":3,"IsChallanRequired":false,"ChallanTypeId":6}', N'Insert', N'32', CAST(N'2023-08-01T14:26:20.570' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (28, 0, N'{"EquipmentId":48,"PackageId":1,"EquipmentTypeId":1,"SystemId":16,"EquipmentName":"3","EquipmentDirectionId":0,"EquipmentProtocolTypeId":0,"EquipmentIP":"192.168.1.1","EquipmentPortNumber":80,"EquipmentLoginId":"a","EquipmentPassword":"a","EquipmentChainageNumber":2.000,"EquipmentLatitude":0.000000,"EquipmentLongitude":1.000000,"EquipmentMacAddress":"4","EquipmentModelNumber":"5","EquipmentSerialNumber":"6","EquipmentManufacturer":"7","EquipmentVendorDetail":"8","EquipmentManufacturerDate":"2023-06-22","EquipmentPurchageDate":"2023-06-23","EquipmentWarrantyExpireDate":"2023-06-24","OnLineStatus":0,"DataStatus":1,"CreatedDate":"2023-06-22T08:39:25.650","CreatedBy":0,"ModifiedDate":"2023-06-23T23:37:40.670","ModifiedBy":0}', N'{"EquipmentId":48,"PackageId":1,"EquipmentTypeId":1,"SystemId":16,"EquipmentName":"3","EquipmentDirectionId":0,"EquipmentProtocolTypeId":0,"EquipmentIP":"192.168.1.1","EquipmentPortNumber":80,"EquipmentLoginId":"a","EquipmentPassword":"a","EquipmentChainageNumber":2.000,"EquipmentLatitude":0.000000,"EquipmentLongitude":1.000000,"EquipmentMacAddress":"4","EquipmentModelNumber":"5","EquipmentSerialNumber":"6","EquipmentManufacturer":"7","EquipmentVendorDetail":"8","EquipmentManufacturerDate":"2023-06-22","EquipmentPurchageDate":"2023-06-23","EquipmentWarrantyExpireDate":"2023-06-24","OnLineStatus":0,"DataStatus":1,"CreatedDate":"2023-06-22T08:39:25.650","CreatedBy":0,"ModifiedDate":"2023-06-23T23:40:31.680","ModifiedBy":0}', N'Update', N'4', CAST(N'2023-06-23T23:40:31.680' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (29, 0, N'{"EquipmentId":48,"PackageId":1,"EquipmentTypeId":1,"SystemId":16,"EquipmentName":"3","EquipmentDirectionId":0,"EquipmentProtocolTypeId":0,"EquipmentIP":"192.168.1.1","EquipmentPortNumber":80,"EquipmentLoginId":"a","EquipmentPassword":"a","EquipmentChainageNumber":2.000,"EquipmentLatitude":0.000000,"EquipmentLongitude":1.000000,"EquipmentMacAddress":"4","EquipmentModelNumber":"5","EquipmentSerialNumber":"6","EquipmentManufacturer":"7","EquipmentVendorDetail":"8","EquipmentManufacturerDate":"2023-06-22","EquipmentPurchageDate":"2023-06-23","EquipmentWarrantyExpireDate":"2023-06-24","OnLineStatus":0,"DataStatus":1,"CreatedDate":"2023-06-22T08:39:25.650","CreatedBy":0,"ModifiedDate":"2023-06-23T23:40:31.680","ModifiedBy":0}', N'{"EquipmentId":48,"PackageId":1,"EquipmentTypeId":1,"SystemId":16,"EquipmentName":"3","EquipmentDirectionId":0,"EquipmentProtocolTypeId":0,"EquipmentIP":"192.168.1.1","EquipmentPortNumber":80,"EquipmentLoginId":"a","EquipmentPassword":"a","EquipmentChainageNumber":2.000,"EquipmentLatitude":0.000000,"EquipmentLongitude":1.000000,"EquipmentMacAddress":"4","EquipmentModelNumber":"5","EquipmentSerialNumber":"6","EquipmentManufacturer":"7","EquipmentVendorDetail":"8","EquipmentManufacturerDate":"2023-06-22","EquipmentPurchageDate":"2023-06-23","EquipmentWarrantyExpireDate":"2023-06-24","OnLineStatus":0,"DataStatus":1,"CreatedDate":"2023-06-22T08:39:25.650","CreatedBy":0,"ModifiedDate":"2023-06-23T23:53:11.107","ModifiedBy":0}', N'Update', N'4', CAST(N'2023-06-23T23:53:11.107' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (33, 0, N'{"PackageId":1,"ControlRoomId":1,"PackageName":"PKG-1","StartChainageNumber":0.000,"EndChainageNumber":300.000,"DataStatus":1,"CreatedDate":"2023-06-20T15:51:12.060","CreatedBy":0,"ModifiedDate":"2023-06-20T15:51:12.060","ModifiedBy":0}', N'{"PackageId":1,"ControlRoomId":1,"PackageName":"PKG-1","StartChainageNumber":0.000,"EndChainageNumber":100.000,"StartLatitude":0.000000,"StartLongitude":0.000000,"EndLatitude":0.000000,"EndLongitude":0.000000,"DataStatus":1,"CreatedDate":"2023-06-20T15:51:12.060","CreatedBy":0,"ModifiedDate":"2023-06-24T13:01:57.797","ModifiedBy":0}', N'Update', N'7', CAST(N'2023-06-24T13:01:57.797' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (90, 0, NULL, N'{"EventTypeId":1,"IsChallanRequired":false,"ChallanTypeId":5}', N'Insert', N'32', CAST(N'2023-08-01T14:26:32.260' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (94, 0, NULL, NULL, N'Permission Modified', N'9', CAST(N'2023-08-01T17:40:39.860' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (96, 0, NULL, NULL, N'VIDS- Modified', N'17', CAST(N'2023-08-02T20:17:23.423' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (97, 0, N'', N'', N'Profile Image Chnage', N'8', CAST(N'2023-08-02T20:41:25.217' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (98, 0, N'', N'', N'Profile Image Chnage', N'8', CAST(N'2023-08-02T20:42:49.547' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (99, 0, N'', N'', N'Profile Image Chnage', N'8', CAST(N'2023-08-02T20:42:55.370' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (100, 0, N'', N'', N'Profile Image Chnage', N'8', CAST(N'2023-08-02T20:43:15.873' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (101, 0, N'', N'', N'Profile Image Chnage', N'8', CAST(N'2023-08-02T20:43:59.297' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (34, 0, N'{"ControlRoomId":1,"ControlRoomName":"CR-1","DataStatus":1,"CreatedDate":"2023-06-17T06:20:12.823","CreatedBy":0,"ModifiedDate":"2023-06-24T13:00:28.427","ModifiedBy":0}', N'{"ControlRoomId":1,"ControlRoomName":"CR-1","ChainageNumber":0.000,"Latitude":0.000000,"Longitude":0.000000,"DirectionId":1,"DataStatus":1,"CreatedDate":"2023-06-17T06:20:12.823","CreatedBy":0,"ModifiedDate":"2023-06-24T13:59:52.390","ModifiedBy":0}', N'Update', N'3', CAST(N'2023-06-24T13:59:52.390' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (35, 0, N'{"ControlRoomId":1,"ControlRoomName":"CR-1","ChainageNumber":0.000,"Latitude":0.000000,"Longitude":0.000000,"DirectionId":1,"DataStatus":1,"CreatedDate":"2023-06-17T06:20:12.823","CreatedBy":0,"ModifiedDate":"2023-06-24T13:59:52.390","ModifiedBy":0}', N'{"ControlRoomId":1,"ControlRoomName":"CR-1","ChainageNumber":1.000,"Latitude":0.000000,"Longitude":0.000000,"DirectionId":1,"DataStatus":1,"CreatedDate":"2023-06-17T06:20:12.823","CreatedBy":0,"ModifiedDate":"2023-06-24T14:04:37.520","ModifiedBy":0}', N'Update', N'3', CAST(N'2023-06-24T14:04:37.520' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (37, 0, N'{"EquipmentId":48,"PackageId":1,"EquipmentTypeId":1,"SystemId":16,"EquipmentName":"3","DirectionId":1,"ProtocolTypeId":1,"IpAddress":"192.168.1.1","PortNumber":80,"LoginId":"a","Password":"a","ChainageNumber":2.000,"Latitude":0.000000,"Longitude":1.000000,"MacAddress":"4","ModelNumber":"5","SerialNumber":"6","ManufacturerDetail":"7","VendorDetail":"8","ManufacturerDate":"2023-06-28","PurchageDate":"2023-06-30","WarrantyExpireDate":"2023-06-30","OnLineStatus":0,"DataStatus":1,"CreatedDate":"2023-06-22T08:39:25.650","CreatedBy":0,"ModifiedDate":"2023-06-25T14:28:19.750","ModifiedBy":0}', N'{"EquipmentId":48,"PackageId":1,"EquipmentTypeId":1,"SystemId":16,"EquipmentName":"3","DirectionId":1,"ProtocolTypeId":1,"IpAddress":"192.168.1.1","PortNumber":80,"LoginId":"a","Password":"a","ChainageNumber":2.000,"Latitude":0.000000,"Longitude":1.000000,"MacAddress":"4","ModelNumber":"5","SerialNumber":"6","ManufacturerDetail":"7","VendorDetail":"8","ManufacturerDate":"2023-06-28","PurchageDate":"2023-06-30","WarrantyExpireDate":"2023-06-30","OnLineStatus":0,"DataStatus":1,"CreatedDate":"2023-06-22T08:39:25.650","CreatedBy":0,"ModifiedDate":"2023-06-25T15:07:22.443","ModifiedBy":0}', N'Update', N'4', CAST(N'2023-06-25T15:07:22.443' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (41, 0, N'{"UserId":1,"LoginId":"Admin","LoginPassword":"6YMMiIA72\/j63JbMxp7J9RT+xDC1sv3m4V2aNsAcVPg=","FirstName":"Admin","LastName":"Admin","EmailId":"Admin@gmail.com","MobileNumber":"9982567732","AccountExpiredDate":"2033-06-15","RoleId":1,"UserTypeId":1,"DataStatus":1,"CreatedDate":"2023-06-16T01:10:15.223","CreatedBy":0,"ModifiedDate":"2023-06-25T17:35:49.013","ModifiedBy":1}', N'{"UserId":1,"LoginId":"Admin","LoginPassword":"l8jzHjvGnMX3Xcz3lU1JbDpPwrIDNjh50q1T+BNMQOc=","FirstName":"Admin","LastName":"Admin","EmailId":"Admin@gmail.com","MobileNumber":"9982567732","AccountExpiredDate":"2033-06-14","RoleId":1,"UserTypeId":1,"DataStatus":1,"CreatedDate":"2023-06-16T01:10:15.223","CreatedBy":0,"ModifiedDate":"2023-06-26T19:45:46.443","ModifiedBy":1}', N'Update', N'10', CAST(N'2023-06-26T19:45:46.443' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (42, 0, N'{"UserId":1,"LoginId":"Admin","LoginPassword":"l8jzHjvGnMX3Xcz3lU1JbDpPwrIDNjh50q1T+BNMQOc=","FirstName":"Admin","LastName":"Admin","EmailId":"Admin@gmail.com","MobileNumber":"9982567732","AccountExpiredDate":"2033-06-14","RoleId":1,"UserTypeId":1,"DataStatus":1,"CreatedDate":"2023-06-16T01:10:15.223","CreatedBy":0,"ModifiedDate":"2023-06-26T19:45:46.443","ModifiedBy":1}', N'{"UserId":1,"LoginId":"Admin","LoginPassword":"wTGXfQWcGaBfZJavKzulTQ==","FirstName":"Admin","LastName":"Admin","EmailId":"Admin@gmail.com","MobileNumber":"9982567732","AccountExpiredDate":"2033-06-13","RoleId":1,"UserTypeId":1,"DataStatus":1,"CreatedDate":"2023-06-16T01:10:15.223","CreatedBy":0,"ModifiedDate":"2023-06-26T19:49:07.887","ModifiedBy":1}', N'Update', N'10', CAST(N'2023-06-26T19:49:07.887' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (74, 0, NULL, NULL, N'VIDS- Modified', N'30', CAST(N'2023-07-30T15:43:25.077' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (77, 0, NULL, N'{"EventTypeId":3,"IsChallanRequired":true,"ChallanTypeId":6}', N'Insert', N'32', CAST(N'2023-08-01T13:19:07.697' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (102, 0, N'', N'', N'Profile Image Chnage', N'8', CAST(N'2023-08-02T20:44:01.127' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (103, 0, N'', N'', N'Profile Image Chnage', N'8', CAST(N'2023-08-02T20:44:21.073' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (36, 0, N'{"EquipmentId":48,"PackageId":1,"EquipmentTypeId":1,"SystemId":16,"EquipmentName":"3","DirectionId":0,"ProtocolTypeId":0,"IpAddress":"192.168.1.1","PortNumber":80,"LoginId":"a","Password":"a","ChainageNumber":2.000,"Latitude":0.000000,"Longitude":1.000000,"MacAddress":"4","ModelNumber":"5","SerialNumber":"6","ManufacturerDetail":"7","VendorDetail":"8","ManufacturerDate":"2023-06-22","PurchageDate":"2023-06-23","WarrantyExpireDate":"2023-06-24","OnLineStatus":0,"DataStatus":1,"CreatedDate":"2023-06-22T08:39:25.650","CreatedBy":0,"ModifiedDate":"2023-06-23T23:53:11.107","ModifiedBy":0}', N'{"EquipmentId":48,"PackageId":1,"EquipmentTypeId":1,"SystemId":16,"EquipmentName":"3","DirectionId":1,"ProtocolTypeId":1,"IpAddress":"192.168.1.1","PortNumber":80,"LoginId":"a","Password":"a","ChainageNumber":2.000,"Latitude":0.000000,"Longitude":1.000000,"MacAddress":"4","ModelNumber":"5","SerialNumber":"6","ManufacturerDetail":"7","VendorDetail":"8","ManufacturerDate":"2023-06-28","PurchageDate":"2023-06-30","WarrantyExpireDate":"2023-06-30","OnLineStatus":0,"DataStatus":1,"CreatedDate":"2023-06-22T08:39:25.650","CreatedBy":0,"ModifiedDate":"2023-06-25T14:28:19.750","ModifiedBy":0}', N'Update', N'4', CAST(N'2023-06-25T14:28:19.750' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (38, 0, N'{"ClassId":0,"VehicleClassId":0,"VehicleClassName":"Unknown","VehicleClassIcon":"fa fa-times","AllowedSpeed":80.00,"DataStatus":1,"CreatedDate":"2022-01-18T12:21:46.273","CreatedBy":0,"ModifiedDate":"2022-11-03T14:38:08.423","ModifiedBy":1}', N'{"ClassId":0,"VehicleClassId":0,"VehicleClassName":"Unknown1","VehicleClassIcon":"fa fa-times","AllowedSpeed":80.00,"DataStatus":1,"CreatedDate":"2022-01-18T12:21:46.273","CreatedBy":0,"ModifiedDate":"2023-06-25T16:09:50.237","ModifiedBy":0}', N'Update', N'8', CAST(N'2023-06-25T16:09:50.237' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (39, 0, N'{"ClassId":1,"VehicleClassId":0,"VehicleClassName":"Unknown1","VehicleClassIcon":"fa fa-times","AllowedSpeed":80.00,"DataStatus":1,"CreatedDate":"2022-01-18T12:21:46.273","CreatedBy":0,"ModifiedDate":"2023-06-25T16:09:50.237","ModifiedBy":0}', N'{"ClassId":1,"VehicleClassId":0,"VehicleClassName":"Unknown","VehicleClassIcon":"fa fa-times","AllowedSpeed":80.00,"DataStatus":1,"CreatedDate":"2022-01-18T12:21:46.273","CreatedBy":0,"ModifiedDate":"2023-06-25T16:12:56.103","ModifiedBy":0}', N'Update', N'8', CAST(N'2023-06-25T16:12:56.103' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (40, 0, N'{"UserId":1,"LoginId":"Admin","LoginPassword":"D8xXdXLEvWnyaacDv4ryUg==","FirstName":"Admin","LastName":"Admin","EmailId":"Admin@gmail.com","MobileNumber":"9982567732","AccountExpiredDate":"2033-06-16","RoleId":1,"UserTypeId":0,"DataStatus":1,"CreatedDate":"2023-06-16T01:10:15.223","CreatedBy":0,"ModifiedDate":"2023-06-17T08:03:47.203","ModifiedBy":1}', N'{"UserId":1,"LoginId":"Admin","LoginPassword":"6YMMiIA72\/j63JbMxp7J9RT+xDC1sv3m4V2aNsAcVPg=","FirstName":"Admin","LastName":"Admin","EmailId":"Admin@gmail.com","MobileNumber":"9982567732","AccountExpiredDate":"2033-06-15","RoleId":1,"UserTypeId":1,"DataStatus":1,"CreatedDate":"2023-06-16T01:10:15.223","CreatedBy":0,"ModifiedDate":"2023-06-25T17:35:49.013","ModifiedBy":1}', N'Update', N'10', CAST(N'2023-06-25T17:35:49.013' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (43, 0, N'{"UserId":1,"LoginId":"Admin","LoginPassword":"wTGXfQWcGaBfZJavKzulTQ==","FirstName":"Admin","LastName":"Admin","EmailId":"Admin@gmail.com","MobileNumber":"9982567732","AccountExpiredDate":"2033-06-13","RoleId":1,"UserTypeId":1,"DataStatus":1,"CreatedDate":"2023-06-16T01:10:15.223","CreatedBy":0,"ModifiedDate":"2023-06-26T19:49:07.887","ModifiedBy":1}', N'{"UserId":1,"LoginId":"admin","LoginPassword":"wTGXfQWcGaBfZJavKzulTQ==","FirstName":"Admin","LastName":"Admin","EmailId":"Admin@gmail.com","MobileNumber":"9982567732","AccountExpiredDate":"2033-06-12","RoleId":1,"UserTypeId":1,"DataStatus":1,"CreatedDate":"2023-06-16T01:10:15.223","CreatedBy":0,"ModifiedDate":"2023-06-26T19:50:04.510","ModifiedBy":1}', N'Update', N'10', CAST(N'2023-06-26T19:50:04.510' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (104, 0, N'', N'', N'Profile Image Chnage', N'8', CAST(N'2023-08-02T20:44:40.980' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (105, 0, N'', N'', N'Profile Image Chnage', N'8', CAST(N'2023-08-02T20:45:00.110' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (106, 0, N'', N'', N'Profile Image Chnage', N'8', CAST(N'2023-08-02T20:46:32.230' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (107, 1, N'', N'', N'Profile Image Chnage', N'8', CAST(N'2023-08-02T20:47:16.160' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (128, 0, NULL, NULL, N'Modified', N'3', CAST(N'2023-08-05T12:55:45.310' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (44, 0, N'{"UserId":1,"LoginId":"admin","LoginPassword":"wTGXfQWcGaBfZJavKzulTQ==","FirstName":"Admin","LastName":"Admin","EmailId":"Admin@gmail.com","MobileNumber":"9982567732","AccountExpiredDate":"2033-06-12","RoleId":1,"UserTypeId":1,"DataStatus":1,"CreatedDate":"2023-06-16T01:10:15.223","CreatedBy":0,"ModifiedDate":"2023-06-26T19:50:04.510","ModifiedBy":1}', N'{"UserId":1,"LoginId":"admin","LoginPassword":"wTGXfQWcGaBfZJavKzulTQ==","FirstName":"Admin","LastName":"Admin","EmailId":"Admin@gmail.com","MobileNumber":"9982567732","AccountExpiredDate":"2033-06-12","RoleId":1,"UserTypeId":1,"DataStatus":1,"CreatedDate":"2023-06-16T01:10:15.223","CreatedBy":0,"ModifiedDate":"2023-06-26T19:50:04.503","ModifiedBy":1}', N'Update', N'10', CAST(N'2023-06-26T19:50:04.503' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (46, 0, N'{"ClassId":1,"VehicleClassId":0,"VehicleClassName":"Unknown","VehicleClassIcon":"fa fa-times","AllowedSpeed":80.00,"DataStatus":1,"CreatedDate":"2022-01-18T12:21:46.273","CreatedBy":0,"ModifiedDate":"2023-06-25T16:12:56.103","ModifiedBy":0}', N'{"ClassId":1,"VehicleClassId":0,"VehicleClassName":"Unknown","VehicleClassIcon":"fa fa-times","AllowedSpeed":80.00,"DataStatus":1,"CreatedDate":"2022-01-18T12:21:46.273","CreatedBy":0,"ModifiedDate":"2023-06-26T21:19:20.393","ModifiedBy":0}', N'Update', N'8', CAST(N'2023-06-26T21:19:20.393' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (47, 0, N'{"RoleId":1,"RoleName":"Admin","DataStatus":1,"CreatedDate":"2023-06-16T01:15:40.177","CreatedBy":0,"ModifiedDate":"2023-06-17T06:30:40.920","ModifiedBy":0}', N'{"RoleId":1,"RoleName":"Admin","DataStatus":1,"CreatedDate":"2023-06-16T01:15:40.177","CreatedBy":0,"ModifiedDate":"2023-06-26T21:19:25.497","ModifiedBy":0}', N'Update', N'9', CAST(N'2023-06-26T21:19:25.497' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (50, 0, N'{"ControlRoomId":1,"ControlRoomName":"CR-1","ChainageNumber":1.000,"Latitude":0.000000,"Longitude":0.000000,"DirectionId":1,"DataStatus":1,"CreatedDate":"2023-06-17T06:20:12.823","CreatedBy":0,"ModifiedDate":"2023-06-24T14:04:37.520","ModifiedBy":0}', N'{"ControlRoomId":1,"ControlRoomName":"CR-1","ChainageNumber":1.000,"Latitude":0.000000,"Longitude":0.000000,"DirectionId":1,"DataStatus":1,"CreatedDate":"2023-06-17T06:20:12.823","CreatedBy":0,"ModifiedDate":"2023-06-26T23:54:54.003","ModifiedBy":0}', N'Update', N'3', CAST(N'2023-06-26T23:54:54.003' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (51, 0, N'{"ControlRoomId":1,"ControlRoomName":"CR-1","ChainageNumber":1.000,"Latitude":0.000000,"Longitude":0.000000,"DirectionId":1,"DataStatus":1,"CreatedDate":"2023-06-17T06:20:12.823","CreatedBy":0,"ModifiedDate":"2023-06-26T23:54:54.003","ModifiedBy":0}', N'{"ControlRoomId":1,"ControlRoomName":"CR-1","ChainageNumber":1.000,"Latitude":0.000000,"Longitude":10.000000,"DirectionId":1,"DataStatus":1,"CreatedDate":"2023-06-17T06:20:12.823","CreatedBy":0,"ModifiedDate":"2023-06-26T23:55:06.137","ModifiedBy":0}', N'Update', N'3', CAST(N'2023-06-26T23:55:06.137' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (52, 0, N'{"ControlRoomId":1,"ControlRoomName":"CR-1","ChainageNumber":1.000,"Latitude":0.000000,"Longitude":10.000000,"DirectionId":1,"DataStatus":1,"CreatedDate":"2023-06-17T06:20:12.823","CreatedBy":0,"ModifiedDate":"2023-06-26T23:55:06.137","ModifiedBy":0}', N'{"ControlRoomId":1,"ControlRoomName":"CR-1","ChainageNumber":1.000,"Latitude":0.000000,"Longitude":0.000000,"DirectionId":1,"DataStatus":1,"CreatedDate":"2023-06-17T06:20:12.823","CreatedBy":0,"ModifiedDate":"2023-06-26T23:55:16.067","ModifiedBy":0}', N'Update', N'3', CAST(N'2023-06-26T23:55:16.067' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (53, 0, N'{"ControlRoomId":1,"ControlRoomName":"CR-1","ChainageNumber":1.000,"Latitude":0.000000,"Longitude":0.000000,"DirectionId":1,"DataStatus":1,"CreatedDate":"2023-06-17T06:20:12.823","CreatedBy":0,"ModifiedDate":"2023-06-26T23:55:16.067","ModifiedBy":0}', N'{"ControlRoomId":1,"ControlRoomName":"CR-1","ChainageNumber":1.000,"Latitude":0.000000,"Longitude":0.000000,"DirectionId":1,"DataStatus":1,"CreatedDate":"2023-06-17T06:20:12.823","CreatedBy":0,"ModifiedDate":"2023-07-03T23:26:54.767","ModifiedBy":0}', N'Update', N'3', CAST(N'2023-07-03T23:26:54.767' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (66, 0, NULL, NULL, N'VIDS- Created', N'29', CAST(N'2023-07-26T17:13:15.673' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (69, 0, NULL, NULL, N'VIDS- Modified', N'29', CAST(N'2023-07-26T17:14:51.753' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (129, 0, NULL, NULL, N'Modified', N'3', CAST(N'2023-08-05T12:55:56.887' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (131, 0, NULL, NULL, N'Modified', N'3', CAST(N'2023-08-05T12:59:20.257' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (133, 0, NULL, NULL, N'VSDS- Created', N'24', CAST(N'2023-08-06T10:42:35.903' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (134, 0, NULL, NULL, N'VSDS- Created', N'24', CAST(N'2023-08-06T10:48:11.767' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (62, 0, NULL, NULL, N'VIDS- Modified', N'9', CAST(N'2022-07-26T11:30:00.000' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (54, 0, N'{"ControlRoomId":1,"ControlRoomName":"CR-1","ChainageNumber":1.000,"Latitude":0.000000,"Longitude":0.000000,"DirectionId":1,"DataStatus":1,"CreatedDate":"2023-06-17T06:20:12.823","CreatedBy":0,"ModifiedDate":"2023-07-03T23:26:54.767","ModifiedBy":0}', N'{"ControlRoomId":1,"ControlRoomName":"CR-1","ChainageNumber":1.000,"Latitude":0.000000,"Longitude":0.000000,"DirectionId":1,"DataStatus":1,"CreatedDate":"2023-06-17T06:20:12.823","CreatedBy":0,"ModifiedDate":"2023-07-03T23:27:32.387","ModifiedBy":0}', N'Update', N'3', CAST(N'2023-07-03T23:27:32.387' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (55, 0, N'{"ControlRoomId":1,"ControlRoomName":"CR-1","ChainageNumber":1.000,"Latitude":0.000000,"Longitude":0.000000,"DirectionId":1,"DataStatus":1,"CreatedDate":"2023-06-17T06:20:12.823","CreatedBy":0,"ModifiedDate":"2023-07-03T23:27:32.387","ModifiedBy":0}', N'{"ControlRoomId":1,"ControlRoomName":"CR-1","ChainageNumber":1.000,"Latitude":0.000000,"Longitude":0.000000,"DirectionId":1,"DataStatus":1,"CreatedDate":"2023-06-17T06:20:12.823","CreatedBy":0,"ModifiedDate":"2023-07-03T23:28:07.573","ModifiedBy":0}', N'Update', N'3', CAST(N'2023-07-03T23:28:07.573' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (56, 0, N'{"ControlRoomId":1,"ControlRoomName":"CR-1","ChainageNumber":1.000,"Latitude":0.000000,"Longitude":0.000000,"DirectionId":1,"DataStatus":1,"CreatedDate":"2023-06-17T06:20:12.823","CreatedBy":0,"ModifiedDate":"2023-07-03T23:28:07.573","ModifiedBy":0}', N'{"ControlRoomId":1,"ControlRoomName":"CR-1","ChainageNumber":1.000,"Latitude":0.000000,"Longitude":0.000000,"DirectionId":1,"DataStatus":1,"CreatedDate":"2023-06-17T06:20:12.823","CreatedBy":0,"ModifiedDate":"2023-07-03T23:29:20.043","ModifiedBy":0}', N'Update', N'3', CAST(N'2023-07-03T23:29:20.043' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (60, 0, NULL, N'{"IncidentId":"MOBI-202307201545456770","IncidentCategoryId":13,"PriorityId":2,"IncidentDescription":"test333","IncidentImagePath":"\\IMS\\20Jul2023\\IncidentImage\\d04874b0-6d7e-43ab-b05d-95ae8a49645c.png","IncidentVideoPath":"","IncidentAudioPath":"","DirectionId":1,"ChainageNumber":232.900,"Latitude":0.000000,"Longitude":0.000000,"VehiclePlateNumber":"","VehicleClassId":0,"SourceSystemId":7,"EquipmentId":17,"NearByVMSId":0,"NearByPTZId":7,"IncidentGeneratedByTypeId":3,"IncidentGeneratedById":0,"AssignedTo":2,"ProcessPercentage":0.00,"IncidentStatusId":4,"CreatedDate":"2023-07-20T15:43:22.280","CreatedBy":0,"ModifiedDate":"2023-07-20T15:45:45.690","ModifiedBy":0,"DataSendStatus":false,"MediaSendStatus":false}', N'Insert', N'26', CAST(N'2023-07-20T15:43:22.280' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (72, 0, NULL, NULL, N'VIDS- Modified', N'30', CAST(N'2023-07-28T15:35:43.400' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (93, 0, N'{"UserId":3,"LoginId":"user1","LoginPassword":"EbWS3\/EHBvt8Qg7+RlryTg==","FirstName":"User","LastName":"1","EmailId":"abc@g.com","MobileNumber":"128909870909","AccountExpiredDate":"2029-12-26","RoleId":2,"UserTypeId":3,"DataStatus":1,"CreatedDate":"2023-08-01T15:13:37.257","CreatedBy":0,"ModifiedDate":"2023-08-01T15:16:13.847","ModifiedBy":0}', N'{"UserId":3,"LoginId":"user1","LoginPassword":"EbWS3\/EHBvt8Qg7+RlryTg==","FirstName":"User","LastName":"VIDS","EmailId":"abc@g.com","MobileNumber":"128909870909","AccountExpiredDate":"2029-12-25","RoleId":2,"UserTypeId":3,"DataStatus":1,"CreatedDate":"2023-08-01T15:13:37.257","CreatedBy":0,"ModifiedDate":"2023-08-01T15:45:41.280","ModifiedBy":3}', N'Update', N'10', CAST(N'2023-08-01T15:45:41.280' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (108, 0, NULL, N'{"RoleId":3,"RoleName":"","DataStatus":0,"CreatedDate":"2023-08-03T00:10:21.003","CreatedBy":0,"ModifiedDate":"2023-08-03T00:10:21","ModifiedBy":0}', N'Insert', N'7', CAST(N'2023-08-03T00:10:21.003' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (57, 0, NULL, N'{"IncidentId":"TMCS-202307191622512330","IncidentCategoryId":6,"PriorityId":0,"IncidentDescription":"test","IncidentImagePath":"\\IMS\\IncidentImage\\19Jul2023\\c60c1634-1aff-4540-b4cd-5d972bd96d2e.jpeg","IncidentVideoPath":"","IncidentAudioPath":"","DirectionId":1,"ChainageNumber":213.500,"Latitude":0.000000,"Longitude":0.000000,"VehiclePlateNumber":"DL7CS7898","VehicleClassId":1,"SourceSystemId":3,"EquipmentId":7,"NearByVMSId":0,"NearByPTZId":0,"IncidentGeneratedByTypeId":3,"IncidentGeneratedById":0,"ProcessPercentage":0.00,"SendStatus":0,"IncidentStatusId":1,"CreatedDate":"2023-07-19T16:20:29.860","CreatedBy":0,"ModifiedDate":"2023-07-19T16:22:51.250","ModifiedBy":0}', N'Insert', N'26', CAST(N'2023-07-19T16:20:29.860' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (58, 0, NULL, N'{"IncidentId":"VIDS-202307191629333800","IncidentCategoryId":3,"PriorityId":0,"IncidentDescription":"test2","IncidentImagePath":"\\IMS\\IncidentImage\\19Jul2023\\99f8f709-2677-493e-91ea-e68e02299568.png","IncidentVideoPath":"","IncidentAudioPath":"","DirectionId":1,"ChainageNumber":212.300,"Latitude":0.000000,"Longitude":0.000000,"VehiclePlateNumber":"","VehicleClassId":0,"SourceSystemId":4,"EquipmentId":11,"NearByVMSId":0,"NearByPTZId":0,"IncidentGeneratedByTypeId":3,"IncidentGeneratedById":0,"ProcessPercentage":0.00,"SendStatus":0,"IncidentStatusId":1,"CreatedDate":"2023-07-19T16:27:12.007","CreatedBy":0,"ModifiedDate":"2023-07-19T16:29:33.380","ModifiedBy":0}', N'Insert', N'26', CAST(N'2023-07-19T16:27:12.007' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (59, 0, NULL, N'{"IncidentId":"TMCS-202307191622512330","IncidentCategoryId":6,"PriorityId":1,"IncidentDescription":"test","IncidentImagePath":"\\IMS\\19Jul2023\\IncidentImage\\c60c1634-1aff-4540-b4cd-5d972bd96d2e.jpeg","IncidentVideoPath":"","IncidentAudioPath":"","DirectionId":1,"ChainageNumber":213.500,"Latitude":0.000000,"Longitude":0.000000,"VehiclePlateNumber":"DL7CS7898","VehicleClassId":1,"SourceSystemId":3,"EquipmentId":7,"NearByVMSId":0,"NearByPTZId":0,"IncidentGeneratedByTypeId":3,"IncidentGeneratedById":0,"ProcessPercentage":0.00,"IncidentStatusId":1,"CreatedDate":"2023-07-19T16:20:29.860","CreatedBy":0,"ModifiedDate":"2023-07-19T16:22:51.250","ModifiedBy":0,"DataSendStatus":false,"MediaSendStatus":false},{"IncidentId":"TMCS-202307191622512330","IncidentCategoryId":6,"PriorityId":1,"IncidentDescription":"test","IncidentImagePath":"\\IMS\\19Jul2023\\IncidentImage\\c60c1634-1aff-4540-b4cd-5d972bd96d2e.jpeg","IncidentVideoPath":"","IncidentAudioPath":"","DirectionId":1,"ChainageNumber":213.500,"Latitude":0.000000,"Longitude":0.000000,"VehiclePlateNumber":"DL7CS7898","VehicleClassId":1,"SourceSystemId":3,"EquipmentId":7,"NearByVMSId":0,"NearByPTZId":0,"IncidentGeneratedByTypeId":3,"IncidentGeneratedById":0,"AssignedTo":2,"ProcessPercentage":0.00,"IncidentStatusId":4,"CreatedDate":"2023-07-20T13:27:10.990","CreatedBy":0,"ModifiedDate":"2023-07-20T13:29:34.580","ModifiedBy":0,"DataSendStatus":false,"MediaSendStatus":false}', N'Insert', N'26', CAST(N'2023-07-20T13:27:10.990' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (63, 0, NULL, NULL, N'VIDS- Created', N'29', CAST(N'2022-07-26T11:30:00.000' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (64, 0, NULL, NULL, N'VIDS- Created', N'29', CAST(N'2022-07-26T11:30:00.000' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (67, 0, NULL, NULL, N'VIDS- Created', N'29', CAST(N'2022-07-26T11:30:00.000' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (71, 0, NULL, NULL, N'VIDS- Modified', N'30', CAST(N'2023-07-28T15:35:32.613' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (92, 0, NULL, NULL, N'Permission Modified', N'9', CAST(N'2023-08-01T15:45:23.890' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (109, 0, NULL, N'{"TotalLane":4,"IsATCCIndependently":true,"ATCCByVSDS":false,"ATCCByVIDS":false,"trafficCount":500,"trafficByTime":10,"DataStatus":1,"CreatedDate":"2023-08-03T00:13:22.633","CreatedBy":0,"ModifiedDate":"2023-08-03T00:13:22.530","ModifiedBy":0}', N'Insert', N'0', CAST(N'2023-08-03T00:13:22.633' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (68, 0, NULL, NULL, N'VIDS- Created', N'29', CAST(N'2023-07-26T17:14:48.157' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (73, 0, NULL, NULL, N'VIDS- Modified', N'30', CAST(N'2023-07-30T15:40:01.797' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (91, 0, NULL, N'{"UserId":3,"LoginId":"user1","LoginPassword":"EbWS3\/EHBvt8Qg7+RlryTg==","FirstName":"User","LastName":"1","EmailId":"abc@g.com","MobileNumber":"128909870909","AccountExpiredDate":"2029-12-26","RoleId":2,"UserTypeId":3,"DataStatus":1,"CreatedDate":"2023-08-01T15:13:37.257","CreatedBy":0,"ModifiedDate":"2023-08-01T15:16:13.847","ModifiedBy":0}', N'Insert', N'10', CAST(N'2023-08-01T15:13:37.257' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (110, 0, N'{"TotalLane":4,"IsATCCIndependently":true,"ATCCByVSDS":false,"ATCCByVIDS":false,"trafficCount":500,"trafficByTime":10,"DataStatus":1,"CreatedDate":"2023-08-03T00:13:22.633","CreatedBy":0,"ModifiedDate":"2023-08-03T00:13:22.530","ModifiedBy":0}', N'{"TotalLane":4,"IsATCCIndependently":false,"ATCCByVSDS":true,"ATCCByVIDS":true,"trafficCount":10,"trafficByTime":1,"DataStatus":1,"CreatedDate":"2023-08-03T00:13:22.633","CreatedBy":0,"ModifiedDate":"2023-08-03T00:14:03.300","ModifiedBy":0}', N'Update', N'0', CAST(N'2023-08-03T00:14:03.300' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (119, 0, NULL, NULL, N'Permission Modified', N'7', CAST(N'2023-08-03T10:49:36.387' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (121, 0, NULL, NULL, N'VIDS- Modified', N'17', CAST(N'2023-08-03T10:50:04.213' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (122, 0, NULL, NULL, NULL, N'0', CAST(N'2023-08-03T10:50:10.800' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (124, 0, NULL, NULL, N'Accepted', N'26', CAST(N'2023-08-03T11:18:16.777' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (125, 0, NULL, NULL, N'Re-assigned To', N'26', CAST(N'2023-08-03T11:24:12.650' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (126, 0, NULL, NULL, N'Closed', N'26', CAST(N'2023-08-03T11:24:36.693' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (130, 0, NULL, NULL, N'Modified', N'3', CAST(N'2023-08-05T12:57:16.133' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (127, 0, NULL, NULL, N'Modified', N'3', CAST(N'2023-08-05T12:54:26.593' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (132, 0, NULL, NULL, N'Modified', N'3', CAST(N'2023-08-05T13:02:58.543' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (135, 0, NULL, NULL, N'VSDS- Modified', N'24', CAST(N'2023-08-06T10:53:00.980' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (136, 0, NULL, NULL, N'VSDS- Modified', N'24', CAST(N'2023-08-06T10:53:07.603' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (137, 0, NULL, NULL, N'VSDS- Modified', N'24', CAST(N'2023-08-06T10:53:14.270' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (138, 0, NULL, NULL, N'VSDS- Modified', N'24', CAST(N'2023-08-06T10:54:26.340' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (61, 0, NULL, N'{"IncidentId":"TMCS-202307201622512330","IncidentCategoryId":6,"PriorityId":1,"IncidentDescription":"test","IncidentImagePath":"\\IMS\\19Jul2023\\IncidentImage\\c60c1634-1aff-4540-b4cd-5d972bd96d2e.jpeg","IncidentVideoPath":"","IncidentAudioPath":"","DirectionId":1,"ChainageNumber":213.500,"Latitude":0.000000,"Longitude":0.000000,"VehiclePlateNumber":"DL7CS7898","VehicleClassId":1,"SourceSystemId":3,"EquipmentId":7,"NearByVMSId":0,"NearByPTZId":0,"IncidentGeneratedByTypeId":3,"IncidentGeneratedById":0,"AssignedTo":2,"ProcessPercentage":0.00,"IncidentStatusId":4,"CreatedDate":"2023-07-20T13:27:10.990","CreatedBy":0,"ModifiedDate":"2023-07-20T13:29:34.580","ModifiedBy":0,"DataSendStatus":false,"MediaSendStatus":false},{"IncidentId":"TMCS-202307201622512330","IncidentCategoryId":0,"PriorityId":0,"IncidentDescription":"","IncidentImagePath":"","IncidentVideoPath":"","IncidentAudioPath":"","DirectionId":0,"ChainageNumber":0.000,"Latitude":0.000000,"Longitude":0.000000,"VehiclePlateNumber":"","VehicleClassId":0,"SourceSystemId":0,"EquipmentId":0,"NearByVMSId":0,"NearByPTZId":48,"IncidentGeneratedByTypeId":0,"IncidentGeneratedById":0,"AssignedTo":0,"ProcessPercentage":0.00,"IncidentStatusId":0,"CreatedDate":"2023-07-20T18:12:38.370","CreatedBy":0,"ModifiedDate":"2023-07-20T18:15:01.733","ModifiedBy":0,"DataSendStatus":false,"MediaSendStatus":false}', N'Insert', N'26', CAST(N'2023-07-20T18:12:38.370' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (95, 0, N'{"EquipmentId":48,"PackageId":1,"EquipmentTypeId":1,"SystemId":16,"EquipmentName":"3","DirectionId":1,"ProtocolTypeId":1,"IpAddress":"192.168.1.1","PortNumber":80,"LoginId":"a","Password":"a","ChainageNumber":2.000,"Latitude":0.000000,"Longitude":1.000000,"MacAddress":"4","ModelNumber":"5","SerialNumber":"6","ManufacturerDetail":"7","VendorDetail":"8","ManufacturerDate":"2023-06-28","PurchageDate":"2023-06-30","WarrantyExpireDate":"2023-06-30","OnLineStatus":0,"DataStatus":1,"CreatedDate":"2023-06-22T08:39:25.650","CreatedBy":0,"ModifiedDate":"2023-06-25T15:07:22.443","ModifiedBy":0}', N'{"EquipmentId":48,"PackageId":1,"EquipmentTypeId":1,"SystemId":16,"EquipmentName":"3","DirectionId":1,"ProtocolTypeId":1,"IpAddress":"192.168.1.1","PortNumber":80,"LoginId":"a","Password":"a","ChainageNumber":2.000,"Latitude":0.000000,"Longitude":1.000000,"MacAddress":"4","ModelNumber":"5","SerialNumber":"6","ManufacturerDetail":"7","VendorDetail":"8","ManufacturerDate":"2023-06-28","PurchageDate":"2023-06-30","WarrantyExpireDate":"2023-06-30","OnLineStatus":0,"DataStatus":1,"CreatedDate":"2023-06-22T08:39:25.650","CreatedBy":0,"ModifiedDate":"2023-08-02T11:57:46.100","ModifiedBy":0}', N'Update', N'4', CAST(N'2023-08-02T11:57:46.100' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (111, 0, N'{"ControlRoomId":1,"ControlRoomName":"CR-1","ChainageNumber":1.000,"Latitude":0.000000,"Longitude":0.000000,"DirectionId":1,"DataStatus":1,"CreatedDate":"2023-06-17T06:20:12.823","CreatedBy":0,"ModifiedDate":"2023-07-03T23:29:20.043","ModifiedBy":0}', N'{"ControlRoomId":1,"ControlRoomName":"CR-1","ChainageNumber":1.000,"Latitude":0.000000,"Longitude":0.000000,"DirectionId":1,"DataStatus":1,"CreatedDate":"2023-06-17T06:20:12.823","CreatedBy":0,"ModifiedDate":"2023-08-03T10:27:21.667","ModifiedBy":0}', N'Update', N'3', CAST(N'2023-08-03T10:27:21.667' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (112, 0, N'{"ControlRoomId":1,"ControlRoomName":"CR-1","ChainageNumber":1.000,"Latitude":0.000000,"Longitude":0.000000,"DirectionId":1,"DataStatus":1,"CreatedDate":"2023-06-17T06:20:12.823","CreatedBy":0,"ModifiedDate":"2023-08-03T10:27:21.667","ModifiedBy":0}', N'{"ControlRoomId":1,"ControlRoomName":"CR-1","ChainageNumber":1.000,"Latitude":0.000000,"Longitude":0.000000,"DirectionId":1,"DataStatus":1,"CreatedDate":"2023-06-17T06:20:12.823","CreatedBy":0,"ModifiedDate":"2023-08-03T10:30:57.073","ModifiedBy":0}', N'Update', N'3', CAST(N'2023-08-03T10:30:57.073' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (139, 0, NULL, NULL, N'VSDS- Modified', N'24', CAST(N'2023-08-06T10:55:36.163' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (140, 0, NULL, NULL, N'VSDS- Modified', N'24', CAST(N'2023-08-06T10:56:11.453' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (141, 0, NULL, NULL, N'VSDS- Modified', N'24', CAST(N'2023-08-06T10:57:48.603' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (143, 0, N'', N'', N'Profile Image Chnage', N'9', CAST(N'2023-09-08T04:18:32.800' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (142, 0, N'', N'', N'Profile Image Chnage', N'9', CAST(N'2023-08-14T03:50:27.160' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (154, 0, NULL, NULL, N'Modified', N'26', CAST(N'2023-09-09T13:08:12.367' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (155, 0, NULL, NULL, N'Modified', N'26', CAST(N'2023-09-09T13:09:46.637' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (157, 0, NULL, NULL, N'Modified', N'26', CAST(N'2023-09-09T13:11:11.667' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (113, 0, N'{"ControlRoomId":1,"ControlRoomName":"CR-1","ChainageNumber":1.000,"Latitude":0.000000,"Longitude":0.000000,"DirectionId":1,"DataStatus":1,"CreatedDate":"2023-06-17T06:20:12.823","CreatedBy":0,"ModifiedDate":"2023-08-03T10:30:57.073","ModifiedBy":0}', N'{"ControlRoomId":1,"ControlRoomName":"TMC-Main","ChainageNumber":1.000,"Latitude":0.000000,"Longitude":0.000000,"DirectionId":1,"DataStatus":1,"CreatedDate":"2023-06-17T06:20:12.823","CreatedBy":0,"ModifiedDate":"2023-08-03T10:32:33.273","ModifiedBy":0}', N'Update', N'3', CAST(N'2023-08-03T10:32:33.273' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (114, 0, N'{"PackageId":1,"ControlRoomId":1,"PackageName":"PKG-1","StartChainageNumber":0.000,"EndChainageNumber":100.000,"StartLatitude":0.000000,"StartLongitude":0.000000,"EndLatitude":0.000000,"EndLongitude":0.000000,"DataStatus":1,"CreatedDate":"2023-06-20T15:51:12.060","CreatedBy":0,"ModifiedDate":"2023-06-24T13:01:57.797","ModifiedBy":0}', N'{"PackageId":1,"ControlRoomId":1,"PackageName":"PKG-01","StartChainageNumber":0.000,"EndChainageNumber":100.000,"StartLatitude":0.000000,"StartLongitude":0.000000,"EndLatitude":0.000000,"EndLongitude":0.000000,"DataStatus":1,"CreatedDate":"2023-06-20T15:51:12.060","CreatedBy":0,"ModifiedDate":"2023-08-03T10:47:32.820","ModifiedBy":0}', N'Update', N'4', CAST(N'2023-08-03T10:47:32.820' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (116, 0, N'{"ClassId":9,"VehicleClassId":8,"VehicleClassName":"Oversized","VehicleClassIcon":"fas fa-truck-monster","AllowedSpeed":80.00,"DataStatus":1,"CreatedDate":"2022-02-06T19:04:09.470","CreatedBy":0,"ModifiedDate":"2022-09-17T12:16:46.800","ModifiedBy":1}', N'{"ClassId":9,"VehicleClassId":8,"VehicleClassName":"Oversized","VehicleClassIcon":"fas fa-truck-monster","AllowedSpeed":70.00,"DataStatus":1,"CreatedDate":"2022-02-06T19:04:09.470","CreatedBy":0,"ModifiedDate":"2023-08-03T10:48:31.307","ModifiedBy":0}', N'Update', N'6', CAST(N'2023-08-03T10:48:31.307' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (117, 0, N'{"ClassId":9,"VehicleClassId":8,"VehicleClassName":"Oversized","VehicleClassIcon":"fas fa-truck-monster","AllowedSpeed":70.00,"DataStatus":1,"CreatedDate":"2022-02-06T19:04:09.470","CreatedBy":0,"ModifiedDate":"2023-08-03T10:48:31.307","ModifiedBy":0}', N'{"ClassId":9,"VehicleClassId":8,"VehicleClassName":"Oversized","VehicleClassIcon":"fas fa-truck-monster","AllowedSpeed":80.00,"DataStatus":1,"CreatedDate":"2022-02-06T19:04:09.470","CreatedBy":0,"ModifiedDate":"2023-08-03T10:49:07.670","ModifiedBy":0}', N'Update', N'6', CAST(N'2023-08-03T10:49:07.670' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (118, 0, N'{"RoleId":3,"RoleName":"","DataStatus":0,"CreatedDate":"2023-08-03T00:10:21.003","CreatedBy":0,"ModifiedDate":"2023-08-03T00:10:21","ModifiedBy":0}', N'{"RoleId":3,"RoleName":"Test","DataStatus":1,"CreatedDate":"2023-08-03T00:10:21.003","CreatedBy":0,"ModifiedDate":"2023-08-03T10:49:29.317","ModifiedBy":0}', N'Update', N'7', CAST(N'2023-08-03T10:49:29.317' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (120, 0, N'{"UserId":3,"LoginId":"user1","LoginPassword":"EbWS3\/EHBvt8Qg7+RlryTg==","FirstName":"User","LastName":"VIDS","EmailId":"abc@g.com","MobileNumber":"128909870909","AccountExpiredDate":"2029-12-25","RoleId":2,"UserTypeId":3,"DataStatus":1,"CreatedDate":"2023-08-01T15:13:37.257","CreatedBy":0,"ModifiedDate":"2023-08-01T15:45:41.280","ModifiedBy":3}', N'{"UserId":3,"LoginId":"user1","LoginPassword":"EbWS3\/EHBvt8Qg7+RlryTg==","FirstName":"Operator-1","LastName":"VIDS","EmailId":"abc@g.com","MobileNumber":"128909870909","AccountExpiredDate":"2029-12-24","RoleId":2,"UserTypeId":3,"DataStatus":1,"CreatedDate":"2023-08-01T15:13:37.257","CreatedBy":0,"ModifiedDate":"2023-08-03T10:49:58.207","ModifiedBy":3}', N'Update', N'8', CAST(N'2023-08-03T10:49:58.207' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (158, 0, NULL, NULL, N'Modified', N'26', CAST(N'2023-09-09T13:11:25.470' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (159, 0, NULL, NULL, N'Modified', N'26', CAST(N'2023-09-09T13:15:26.853' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (160, 0, NULL, NULL, N'Modified', N'26', CAST(N'2023-09-09T13:15:57.960' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (161, 0, NULL, NULL, N'Modified', N'26', CAST(N'2023-09-09T13:16:21.023' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (162, 0, NULL, NULL, NULL, N'0', CAST(N'2023-09-09T13:24:58.333' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (163, 0, NULL, NULL, NULL, N'0', CAST(N'2023-09-09T13:26:18.970' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (164, 0, NULL, NULL, NULL, N'0', CAST(N'2023-09-09T13:27:09.287' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (165, 0, NULL, NULL, N'VSDS- Modified', N'25', CAST(N'2023-09-09T13:28:44.613' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (175, 0, NULL, NULL, N'Modified', N'26', CAST(N'2023-09-10T13:23:11.573' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (176, 0, NULL, NULL, N'Modified', N'26', CAST(N'2023-09-10T13:23:24.923' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (177, 0, NULL, NULL, N'Modified', N'26', CAST(N'2023-09-10T13:23:52.037' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (178, 0, NULL, NULL, N'Update', N'33', CAST(N'2023-09-23T14:54:44.883' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (181, 0, NULL, N'{"ReviewedVehicleClassId":3,"ReviewedBy":0,"ReviewedDateTime":"2023-09-23T15:12:44.990","ReviewedStatus":true}', N'Update', N'33', CAST(N'2023-09-23T15:12:44.990' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (182, 0, NULL, N'{"ReviewedVehicleClassId":3,"ReviewedBy":0,"ReviewedDateTime":"2023-09-23T15:12:49.780","ReviewedStatus":true}', N'Update', N'33', CAST(N'2023-09-23T15:12:49.780' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (115, 0, N'{"EquipmentId":48,"PackageId":1,"EquipmentTypeId":1,"SystemId":16,"EquipmentName":"3","DirectionId":1,"ProtocolTypeId":1,"IpAddress":"192.168.1.1","PortNumber":80,"LoginId":"a","Password":"a","ChainageNumber":2.000,"Latitude":0.000000,"Longitude":1.000000,"MacAddress":"4","ModelNumber":"5","SerialNumber":"6","ManufacturerDetail":"7","VendorDetail":"8","ManufacturerDate":"2023-06-28","PurchageDate":"2023-06-30","WarrantyExpireDate":"2023-06-30","OnLineStatus":0,"DataStatus":1,"CreatedDate":"2023-06-22T08:39:25.650","CreatedBy":0,"ModifiedDate":"2023-08-02T11:57:46.100","ModifiedBy":0}', N'{"EquipmentId":48,"PackageId":1,"EquipmentTypeId":1,"SystemId":16,"EquipmentName":"PTZ-123","DirectionId":1,"ProtocolTypeId":1,"IpAddress":"192.168.1.1","PortNumber":80,"LoginId":"a","Password":"a","ChainageNumber":2.000,"Latitude":0.000000,"Longitude":1.000000,"MacAddress":"4","ModelNumber":"5","SerialNumber":"6","ManufacturerDetail":"7","VendorDetail":"8","ManufacturerDate":"2023-06-28","PurchageDate":"2023-06-30","WarrantyExpireDate":"2023-06-30","OnLineStatus":0,"DataStatus":1,"CreatedDate":"2023-06-22T08:39:25.650","CreatedBy":0,"ModifiedDate":"2023-08-03T10:48:09.213","ModifiedBy":0}', N'Update', N'5', CAST(N'2023-08-03T10:48:09.213' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (123, 0, N'{"IncidentId":"TMCS-202307191622512330","IncidentCategoryId":6,"PriorityId":1,"IncidentDescription":"test11","IncidentImagePath":"\\IMS\\19Jul2023\\IncidentImage\\c60c1634-1aff-4540-b4cd-5d972bd96d2e.jpeg","IncidentVideoPath":"","IncidentAudioPath":"","DirectionId":1,"ChainageNumber":213.500,"Latitude":0.000000,"Longitude":0.000000,"VehiclePlateNumber":"DL7CS7898","VehicleClassId":1,"SourceSystemId":3,"EquipmentId":7,"NearByPTZId":7,"IncidentGeneratedByTypeId":3,"IncidentGeneratedById":0,"AssignedToId":0,"IncidentStatusId":1,"CreatedDate":"2023-07-19T16:20:29.860","CreatedBy":0,"ModifiedDate":"2023-08-03T11:17:23.920","ModifiedBy":0,"DataSendStatus":false,"MediaSendStatus":false}', N'{"IncidentId":"TMCS-202307191622512330","IncidentCategoryId":6,"PriorityId":1,"IncidentDescription":"test","IncidentImagePath":"\\IMS\\19Jul2023\\IncidentImage\\c60c1634-1aff-4540-b4cd-5d972bd96d2e.jpeg","IncidentVideoPath":"","IncidentAudioPath":"","DirectionId":1,"ChainageNumber":213.500,"Latitude":0.000000,"Longitude":0.000000,"VehiclePlateNumber":"DL7CS7898","VehicleClassId":1,"SourceSystemId":3,"EquipmentId":7,"NearByPTZId":0,"IncidentGeneratedByTypeId":3,"IncidentGeneratedById":0,"IncidentStatusId":1,"CreatedDate":"2023-07-19T16:20:29.860","CreatedBy":0,"ModifiedDate":"2023-07-19T16:22:51.250","ModifiedBy":0,"DataSendStatus":false,"MediaSendStatus":false}', N'Update', N'26', CAST(N'2023-08-03T11:17:23.920' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (147, 0, N'{"TotalLane":4,"IsATCCIndependently":false,"ATCCByVSDS":true,"ATCCByVIDS":true,"trafficCount":10,"trafficByTime":1,"DataStatus":1,"CreatedDate":"2023-08-03T00:13:22.633","CreatedBy":0,"ModifiedDate":"2023-09-08T18:29:33.643","ModifiedBy":0}', N'{"TotalLane":4,"IsATCCIndependently":false,"ATCCByVSDS":true,"ATCCByVIDS":true,"trafficCount":10,"trafficByTime":1,"DataStatus":1,"CreatedDate":"2023-08-03T00:13:22.633","CreatedBy":0,"ModifiedDate":"2023-09-08T18:35:16.440","ModifiedBy":0}', N'Update', N'49', CAST(N'2023-09-08T18:35:16.440' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (148, 0, N'{"TotalLane":4,"IsATCCIndependently":false,"ATCCByVSDS":true,"ATCCByVIDS":true,"trafficCount":10,"trafficByTime":1,"DataStatus":1,"CreatedDate":"2023-08-03T00:13:22.633","CreatedBy":0,"ModifiedDate":"2023-09-08T18:35:16.440","ModifiedBy":0}', N'{"TotalLane":8,"IsATCCIndependently":false,"ATCCByVSDS":true,"ATCCByVIDS":true,"trafficCount":10,"trafficByTime":1,"DataStatus":1,"CreatedDate":"2023-08-03T00:13:22.633","CreatedBy":0,"ModifiedDate":"2023-09-08T18:35:23.613","ModifiedBy":0}', N'Update', N'49', CAST(N'2023-09-08T18:35:23.613' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (170, 0, NULL, NULL, N'VSDS- Modified', N'24', CAST(N'2023-09-09T15:21:05.253' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (171, 0, NULL, NULL, N'VSDS- Modified', N'24', CAST(N'2023-09-09T15:24:00.313' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (172, 0, NULL, NULL, N'VIDS- Modified', N'18', CAST(N'2023-09-09T15:34:38.273' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (183, 0, NULL, N'{"ReviewedVehicleClassId":3,"ReviewedBy":0,"ReviewedDateTime":"2023-09-23T15:12:53.853","ReviewedStatus":true}', N'Update', N'33', CAST(N'2023-09-23T15:12:53.853' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (196, 0, NULL, NULL, N'VIDS- Created', N'20', CAST(N'2023-10-03T18:57:00.120' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (144, 0, N'{"TotalLane":4,"IsATCCIndependently":false,"ATCCByVSDS":true,"ATCCByVIDS":true,"trafficCount":10,"trafficByTime":1,"DataStatus":1,"CreatedDate":"2023-08-03T00:13:22.633","CreatedBy":0,"ModifiedDate":"2023-08-03T00:14:03.300","ModifiedBy":0}', N'{"TotalLane":4,"IsATCCIndependently":false,"ATCCByVSDS":true,"ATCCByVIDS":true,"trafficCount":10,"trafficByTime":1,"DataStatus":1,"CreatedDate":"2023-08-03T00:13:22.633","CreatedBy":0,"ModifiedDate":"2023-09-08T18:29:00.740","ModifiedBy":0}', N'Update', N'49', CAST(N'2023-09-08T18:29:00.740' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (145, 0, N'{"TotalLane":4,"IsATCCIndependently":false,"ATCCByVSDS":true,"ATCCByVIDS":true,"trafficCount":10,"trafficByTime":1,"DataStatus":1,"CreatedDate":"2023-08-03T00:13:22.633","CreatedBy":0,"ModifiedDate":"2023-09-08T18:29:00.740","ModifiedBy":0}', N'{"TotalLane":8,"IsATCCIndependently":false,"ATCCByVSDS":true,"ATCCByVIDS":true,"trafficCount":10,"trafficByTime":1,"DataStatus":1,"CreatedDate":"2023-08-03T00:13:22.633","CreatedBy":0,"ModifiedDate":"2023-09-08T18:29:14.127","ModifiedBy":0}', N'Update', N'49', CAST(N'2023-09-08T18:29:14.127' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (146, 0, N'{"TotalLane":8,"IsATCCIndependently":false,"ATCCByVSDS":true,"ATCCByVIDS":true,"trafficCount":10,"trafficByTime":1,"DataStatus":1,"CreatedDate":"2023-08-03T00:13:22.633","CreatedBy":0,"ModifiedDate":"2023-09-08T18:29:14.127","ModifiedBy":0}', N'{"TotalLane":4,"IsATCCIndependently":false,"ATCCByVSDS":true,"ATCCByVIDS":true,"trafficCount":10,"trafficByTime":1,"DataStatus":1,"CreatedDate":"2023-08-03T00:13:22.633","CreatedBy":0,"ModifiedDate":"2023-09-08T18:29:33.643","ModifiedBy":0}', N'Update', N'49', CAST(N'2023-09-08T18:29:33.643' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (149, 0, N'{"TotalLane":8,"IsATCCIndependently":false,"ATCCByVSDS":true,"ATCCByVIDS":true,"trafficCount":10,"trafficByTime":1,"DataStatus":1,"CreatedDate":"2023-08-03T00:13:22.633","CreatedBy":0,"ModifiedDate":"2023-09-08T18:35:23.613","ModifiedBy":0}', N'{"TotalLane":6,"IsATCCIndependently":false,"ATCCByVSDS":true,"ATCCByVIDS":true,"trafficCount":10,"trafficByTime":1,"DataStatus":1,"CreatedDate":"2023-08-03T00:13:22.633","CreatedBy":0,"ModifiedDate":"2023-09-08T18:35:28.780","ModifiedBy":0}', N'Update', N'49', CAST(N'2023-09-08T18:35:28.780' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (150, 0, N'{"TotalLane":6,"IsATCCIndependently":false,"ATCCByVSDS":true,"ATCCByVIDS":true,"trafficCount":10,"trafficByTime":1,"DataStatus":1,"CreatedDate":"2023-08-03T00:13:22.633","CreatedBy":0,"ModifiedDate":"2023-09-08T18:35:28.780","ModifiedBy":0}', N'{"TotalLane":6,"IsATCCIndependently":false,"ATCCByVSDS":true,"ATCCByVIDS":true,"trafficCount":10,"trafficByTime":1,"DataStatus":1,"CreatedDate":"2023-08-03T00:13:22.633","CreatedBy":0,"ModifiedDate":"2023-09-08T18:35:34.833","ModifiedBy":0}', N'Update', N'49', CAST(N'2023-09-08T18:35:34.833' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (153, 0, NULL, NULL, N'Modified', N'26', CAST(N'2013-02-20T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (156, 0, NULL, NULL, N'Modified', N'26', CAST(N'2013-02-20T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (173, 0, NULL, NULL, N'Modified', N'26', CAST(N'2023-09-10T13:15:06.827' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (174, 0, N'{"TotalLane":4,"IsATCCIndependently":false,"ATCCByVSDS":true,"ATCCByVIDS":true,"TrafficCount":10,"TrafficByTime":1,"RestrictedVehiclesIds":"2,3","DataStatus":1,"CreatedDate":"2023-08-03T00:13:22.633","CreatedBy":0,"ModifiedDate":"2023-09-09T14:58:57.237","ModifiedBy":0}', N'{"TotalLane":4,"IsATCCIndependently":false,"ATCCByVSDS":true,"ATCCByVIDS":true,"TrafficCount":10,"TrafficByTime":1,"RestrictedVehiclesIds":"2,1","DataStatus":1,"CreatedDate":"2023-08-03T00:13:22.633","CreatedBy":0,"ModifiedDate":"2023-09-10T13:23:04.660","ModifiedBy":0}', N'Update', N'49', CAST(N'2023-09-10T13:23:04.660' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (179, 0, NULL, N'{"ReviewedVehicleClassId":3,"ReviewedBy":0,"ReviewedDateTime":"2023-09-23T14:56:21.320","ReviewedStatus":true}', N'Update', N'33', CAST(N'2023-09-23T14:56:21.320' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (197, 0, NULL, NULL, N'ATCC- Created', N'32', CAST(N'2023-10-03T19:09:24.480' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (198, 0, N'{"VehicleClassId":3}', N'{"ReviewedVehicleClassId":3}', N'Update', N'34', CAST(N'2023-10-03T20:26:42.433' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (199, 0, NULL, NULL, N'Insert', N'37', CAST(N'2023-10-04T16:19:54.307' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (201, 0, NULL, NULL, N'Insert', N'37', CAST(N'2023-10-04T16:41:07.740' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (202, 0, NULL, NULL, N'Insert', N'37', CAST(N'2023-10-04T16:42:08.597' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (203, 0, NULL, NULL, N'Insert', N'37', CAST(N'2023-10-04T17:10:31.703' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (204, 0, NULL, NULL, N'Insert', N'37', CAST(N'2023-10-04T17:11:07.353' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (205, 0, NULL, NULL, N'Insert', N'37', CAST(N'2023-10-04T17:12:44.590' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (206, 0, NULL, NULL, N'Insert', N'37', CAST(N'2023-10-04T17:14:39.137' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (207, 0, NULL, NULL, N'Insert', N'37', CAST(N'2023-10-04T17:14:39.137' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (208, 0, NULL, NULL, N'Insert', N'37', CAST(N'2023-10-04T17:14:39.137' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (209, 0, NULL, NULL, N'Insert', N'37', CAST(N'2023-10-04T17:14:39.137' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (151, 0, N'{"TotalLane":6,"IsATCCIndependently":false,"ATCCByVSDS":true,"ATCCByVIDS":true,"trafficCount":10,"trafficByTime":1,"DataStatus":1,"CreatedDate":"2023-08-03T00:13:22.633","CreatedBy":0,"ModifiedDate":"2023-09-08T18:35:34.833","ModifiedBy":0}', N'{"TotalLane":4,"IsATCCIndependently":false,"ATCCByVSDS":true,"ATCCByVIDS":true,"trafficCount":10,"trafficByTime":1,"DataStatus":1,"CreatedDate":"2023-08-03T00:13:22.633","CreatedBy":0,"ModifiedDate":"2023-09-08T19:21:12.387","ModifiedBy":0}', N'Update', N'49', CAST(N'2023-09-08T19:21:12.387' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (152, 0, NULL, NULL, N'Modified', N'26', CAST(N'2023-09-08T19:25:29.497' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (166, 0, NULL, NULL, N'VSDS- Modified', N'25', CAST(N'2023-09-09T13:51:58.330' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (167, 0, N'{"TotalLane":4,"IsATCCIndependently":false,"ATCCByVSDS":true,"ATCCByVIDS":true,"trafficCount":10,"trafficByTime":1,"DataStatus":1,"CreatedDate":"2023-08-03T00:13:22.633","CreatedBy":0,"ModifiedDate":"2023-09-08T19:21:12.387","ModifiedBy":0}', N'{"TotalLane":4,"IsATCCIndependently":false,"ATCCByVSDS":true,"ATCCByVIDS":true,"trafficCount":10,"trafficByTime":1,"DataStatus":1,"CreatedDate":"2023-08-03T00:13:22.633","CreatedBy":0,"ModifiedDate":"2023-09-09T13:52:16.273","ModifiedBy":0}', N'Update', N'49', CAST(N'2023-09-09T13:52:16.273' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (180, 0, NULL, N'{"ReviewedVehicleClassId":3,"ReviewedBy":0,"ReviewedDateTime":"2023-09-23T15:11:38.820","ReviewedStatus":true}', N'Update', N'33', CAST(N'2023-09-23T15:11:38.820' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (186, 0, N'{"TotalLane":4,"IsATCCIndependently":false,"ATCCByVSDS":true,"ATCCByVIDS":true,"TrafficCount":10,"TrafficByTime":1,"RestrictedVehiclesIds":"2,1","DataStatus":1,"CreatedDate":"2023-08-03T00:13:22.633","CreatedBy":0,"ModifiedDate":"2023-09-10T13:23:04.660","ModifiedBy":0}', N'{"WeatherConfigurationId":1,"AirTemperatureMin":100.00,"AirTemperatureMax":10.00,"HumidityRH":10.00,"HumidityAH":10.00,"Visibility":10.00,"RoadTemperature":0.00,"WindDirectionValue":10.00,"WindSpeedValue":10.00,"RainValue":10.00,"DataStatus":1,"CreatedDate":"2023-09-23T00:00:00","CreatedBy":0,"ModifiedDate":"2023-09-23T17:24:12.480","ModifiedBy":0,"SendStatus":false}', N'Update', N'50', CAST(N'2023-09-23T17:24:12.480' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (187, 0, N'{"TotalLane":4,"IsATCCIndependently":false,"ATCCByVSDS":true,"ATCCByVIDS":true,"TrafficCount":10,"TrafficByTime":1,"RestrictedVehiclesIds":"2,1","DataStatus":1,"CreatedDate":"2023-08-03T00:13:22.633","CreatedBy":0,"ModifiedDate":"2023-09-10T13:23:04.660","ModifiedBy":0}', N'{"WeatherConfigurationId":1,"AirTemperatureMin":100.00,"AirTemperatureMax":100.00,"HumidityRH":10.00,"HumidityAH":10.00,"Visibility":10.00,"RoadTemperature":0.00,"WindDirectionValue":10.00,"WindSpeedValue":10.00,"RainValue":10.00,"DataStatus":1,"CreatedDate":"2023-09-23T00:00:00","CreatedBy":0,"ModifiedDate":"2023-09-23T17:24:27.617","ModifiedBy":0,"SendStatus":false}', N'Update', N'50', CAST(N'2023-09-23T17:24:27.617' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (189, 0, N'{"TotalLane":4,"IsATCCIndependently":false,"ATCCByVSDS":true,"ATCCByVIDS":true,"TrafficCount":10,"TrafficByTime":1,"RestrictedVehiclesIds":"2,1","DataStatus":1,"CreatedDate":"2023-08-03T00:13:22.633","CreatedBy":0,"ModifiedDate":"2023-09-10T13:23:04.660","ModifiedBy":0}', N'{"WeatherConfigurationId":1,"AirTemperatureMin":100.00,"AirTemperatureMax":100.00,"HumidityRH":10.00,"HumidityAH":120.00,"Visibility":120.00,"RoadTemperature":0.00,"WindDirectionValue":10.00,"WindSpeedValue":10.00,"RainValue":10.00,"DataStatus":1,"CreatedDate":"2023-09-23T00:00:00","CreatedBy":0,"ModifiedDate":"2023-09-23T17:24:39.427","ModifiedBy":0,"SendStatus":false}', N'Update', N'50', CAST(N'2023-09-23T17:24:39.427' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (190, 0, N'{"TotalLane":4,"IsATCCIndependently":false,"ATCCByVSDS":true,"ATCCByVIDS":true,"TrafficCount":10,"TrafficByTime":1,"RestrictedVehiclesIds":"2,1","DataStatus":1,"CreatedDate":"2023-08-03T00:13:22.633","CreatedBy":0,"ModifiedDate":"2023-09-10T13:23:04.660","ModifiedBy":0}', N'{"WeatherConfigurationId":1,"AirTemperatureMin":100.00,"AirTemperatureMax":100.00,"HumidityRH":102.00,"HumidityAH":120.00,"Visibility":120.00,"RoadTemperature":0.00,"WindDirectionValue":10.00,"WindSpeedValue":10.00,"RainValue":10.00,"DataStatus":1,"CreatedDate":"2023-09-23T00:00:00","CreatedBy":0,"ModifiedDate":"2023-09-23T17:25:30.300","ModifiedBy":0,"SendStatus":false}', N'Update', N'50', CAST(N'2023-09-23T17:25:30.300' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (168, 0, N'{"TotalLane":4,"IsATCCIndependently":false,"ATCCByVSDS":true,"ATCCByVIDS":true,"TrafficCount":10,"TrafficByTime":1,"DataStatus":1,"CreatedDate":"2023-08-03T00:13:22.633","CreatedBy":0,"ModifiedDate":"2023-09-09T13:52:16.273","ModifiedBy":0}', N'{"TotalLane":4,"IsATCCIndependently":false,"ATCCByVSDS":true,"ATCCByVIDS":true,"TrafficCount":10,"TrafficByTime":1,"RestrictedVehiclesIds":"2","DataStatus":1,"CreatedDate":"2023-08-03T00:13:22.633","CreatedBy":0,"ModifiedDate":"2023-09-09T14:58:45.223","ModifiedBy":0}', N'Update', N'49', CAST(N'2023-09-09T14:58:45.223' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (169, 0, N'{"TotalLane":4,"IsATCCIndependently":false,"ATCCByVSDS":true,"ATCCByVIDS":true,"TrafficCount":10,"TrafficByTime":1,"RestrictedVehiclesIds":"2","DataStatus":1,"CreatedDate":"2023-08-03T00:13:22.633","CreatedBy":0,"ModifiedDate":"2023-09-09T14:58:45.223","ModifiedBy":0}', N'{"TotalLane":4,"IsATCCIndependently":false,"ATCCByVSDS":true,"ATCCByVIDS":true,"TrafficCount":10,"TrafficByTime":1,"RestrictedVehiclesIds":"2,3","DataStatus":1,"CreatedDate":"2023-08-03T00:13:22.633","CreatedBy":0,"ModifiedDate":"2023-09-09T14:58:57.237","ModifiedBy":0}', N'Update', N'49', CAST(N'2023-09-09T14:58:57.237' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (194, 0, N'{"TotalLane":4,"IsATCCIndependently":false,"ATCCByVSDS":true,"ATCCByVIDS":true,"TrafficCount":10,"TrafficByTime":1,"RestrictedVehiclesIds":"2,1","DataStatus":1,"CreatedDate":"2023-08-03T00:13:22.633","CreatedBy":0,"ModifiedDate":"2023-09-10T13:23:04.660","ModifiedBy":0}', N'{"TotalLane":4,"IsATCCIndependently":false,"ATCCByVSDS":true,"ATCCByVIDS":true,"TrafficCount":10,"TrafficByTime":1,"RestrictedVehiclesIds":"2,1","DefaultControlRoomId":1,"DataStatus":1,"CreatedDate":"2023-08-03T00:13:22.633","CreatedBy":0,"ModifiedDate":"2023-09-23T18:10:10.693","ModifiedBy":0}', N'Update', N'49', CAST(N'2023-09-23T18:10:10.693' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (195, 0, N'{"TotalLane":4,"IsATCCIndependently":false,"ATCCByVSDS":true,"ATCCByVIDS":true,"TrafficCount":10,"TrafficByTime":1,"RestrictedVehiclesIds":"2,1","DefaultControlRoomId":1,"DataStatus":1,"CreatedDate":"2023-08-03T00:13:22.633","CreatedBy":0,"ModifiedDate":"2023-09-23T18:10:10.693","ModifiedBy":0}', N'{"TotalLane":4,"IsATCCIndependently":true,"ATCCByVSDS":false,"ATCCByVIDS":false,"TrafficCount":10,"TrafficByTime":1,"RestrictedVehiclesIds":"2,1","DefaultControlRoomId":1,"DataStatus":1,"CreatedDate":"2023-08-03T00:13:22.633","CreatedBy":0,"ModifiedDate":"2023-10-01T12:43:29.640","ModifiedBy":0}', N'Update', N'49', CAST(N'2023-10-01T12:43:29.640' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (200, 0, NULL, NULL, N'Insert', N'37', CAST(N'2023-10-04T16:39:34.980' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (210, 0, NULL, N'{"MessageId":6,"EquipmentIds":"49,50","MessageTypeId":2,"DisplayTimout":20,"ValidTillDate":"2023-10-04","MediaPath":"\\VMS\\image\\DC0UD20231004171435831.png","MessageDetails":"<p class=\"ql-align-center\"><strong><em>Welcome<\/em><\/strong><\/p>","DataStatus":1,"CreatedDate":"2023-10-04T17:16:17.123","CreatedBy":0,"ModifiedDate":"2023-10-04T17:16:17.780","ModifiedBy":0,"DataSendStatus":false,"MediaSendStatus":false}', N'Insert', N'37', CAST(N'2023-10-04T17:16:17.123' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (211, 0, NULL, N'{"MessageId":1,"EquipmentIds":"49","MessageTypeId":2,"DisplayTimout":20,"ValidTillDate":"2023-10-04","MediaPath":"\\VMS\\image\\AVTCP20231004173752799.png","MessageDetails":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAAkIAAAFeCAYAAABpW3B9AAAAAXNSR0IArs4c6QAAIABJREFUeF7tnQuYFNWZsL8ZGGa4znCdERAGo8IACihR16z\/v5uQ6GIwxtw1yrpuuIiiMQYVdzXyL7dR4xVBs8aHuF5iNDESjUaSvZAYySrIXY0XBgEZUJgZbgPDzPzPKTxtTdE9faqnqvtU11vP45Mw\/fWpc95zTvXb3zlVX","DataStatus":1,"CreatedDate":"2023-10-04T17:37:54.380","CreatedBy":0,"ModifiedDate":"2023-10-04T17:37:54.390","ModifiedBy":0,"DataSendStatus":false,"MediaSendStatus":false}', N'Insert', N'37', CAST(N'2023-10-04T17:37:54.380' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (184, 0, NULL, N'{"ReviewedVehicleClassId":3,"ReviewedBy":0,"ReviewedDateTime":"2023-09-23T16:58:27.890","ReviewedStatus":true}', N'Update', N'33', CAST(N'2023-09-23T16:58:27.890' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (185, 0, NULL, N'{"ReviewedVehicleClassId":3,"ReviewedBy":0,"ReviewedDateTime":"2023-09-23T16:58:29.593","ReviewedStatus":true}', N'Update', N'33', CAST(N'2023-09-23T16:58:29.593' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (188, 0, N'{"ControlRoomId":1,"ControlRoomName":"TMC-Main","ChainageNumber":1.000,"Latitude":0.000000,"Longitude":0.000000,"DirectionId":1,"DataStatus":1,"CreatedDate":"2023-06-17T06:20:12.823","CreatedBy":0,"ModifiedDate":"2023-08-03T10:32:33.273","ModifiedBy":0}', N'{"ControlRoomId":1,"ControlRoomName":"TMC-Main","ChainageNumber":375.500,"Latitude":20.056864,"Longitude":85.542642,"DirectionId":1,"DataStatus":1,"CreatedDate":"2023-06-17T06:20:12.823","CreatedBy":0,"ModifiedDate":"2023-09-23T17:24:32.697","ModifiedBy":0}', N'Update', N'4', CAST(N'2023-09-23T17:24:32.697' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (191, 0, N'{"ControlRoomId":1,"ControlRoomName":"TMC-Main","ChainageNumber":1.000,"Latitude":0.000000000,"Longitude":0.000000000,"DirectionId":1,"DataStatus":1,"CreatedDate":"2023-06-17T06:20:12.823","CreatedBy":0,"ModifiedDate":"2023-08-03T10:32:33.273","ModifiedBy":0}', N'{"ControlRoomId":1,"ControlRoomName":"TMC-Main","ChainageNumber":375.500,"Latitude":20.056864000,"Longitude":85.542642000,"DirectionId":1,"DataStatus":1,"CreatedDate":"2023-06-17T06:20:12.823","CreatedBy":0,"ModifiedDate":"2023-09-23T17:25:33.510","ModifiedBy":0}', N'Update', N'4', CAST(N'2023-09-23T17:25:33.510' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (192, 0, N'{"ControlRoomId":1,"ControlRoomName":"TMC-Main","ChainageNumber":375.500,"Latitude":20.056864000,"Longitude":85.542642000,"DirectionId":1,"DataStatus":1,"CreatedDate":"2023-06-17T06:20:12.823","CreatedBy":0,"ModifiedDate":"2023-09-23T17:25:33.510","ModifiedBy":0}', N'{"ControlRoomId":1,"ControlRoomName":"TMC-Main","ChainageNumber":375.500,"Latitude":20.056864400,"Longitude":85.542642000,"DirectionId":1,"DataStatus":1,"CreatedDate":"2023-06-17T06:20:12.823","CreatedBy":0,"ModifiedDate":"2023-09-23T17:28:17.893","ModifiedBy":0}', N'Update', N'4', CAST(N'2023-09-23T17:28:17.893' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (193, 0, N'{"PackageId":1,"ControlRoomId":1,"PackageName":"PKG-01","StartChainageNumber":0.000,"EndChainageNumber":100.000,"StartLatitude":0.000000000,"StartLongitude":0.000000000,"EndLatitude":0.000000000,"EndLongitude":0.000000000,"DataStatus":1,"CreatedDate":"2023-06-20T15:51:12.060","CreatedBy":0,"ModifiedDate":"2023-08-03T10:47:32.820","ModifiedBy":0}', N'{"PackageId":1,"ControlRoomId":1,"PackageName":"PKG-01","StartChainageNumber":355.000,"EndChainageNumber":415.000,"StartLatitude":0.000000000,"StartLongitude":0.000000000,"EndLatitude":0.000000000,"EndLongitude":0.000000000,"DataStatus":1,"CreatedDate":"2023-06-20T15:51:12.060","CreatedBy":0,"ModifiedDate":"2023-09-23T17:28:56.223","ModifiedBy":0}', N'Update', N'5', CAST(N'2023-09-23T17:28:56.223' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[tbl_ActivityLog] OFF
GO
INSERT [dbo].[tbl_ATCCEventsHistory] ([TransactionId], [EquipmentId], [EventID], [LaneNumber], [EventDate], [VehicleClassId], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [ClassConfidencelevel], [VehicleColor], [VehicleDirectionId], [IsWrongDirection], [IsReviewedRequired], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'100920231446374560', 42, NULL, 2, CAST(N'2023-09-10T14:46:37.4560000' AS DateTime2), 3, N'VSDS/VehicleImage/9d6ae9fa-dafa-488a-bc20-4ab0154571e9.jpeg', N'', NULL, NULL, NULL, 0, 0, 1, 1, 3, 0, CAST(N'2023-10-03T20:26:42.433' AS DateTime), NULL, CAST(N'2023-09-10T16:26:33.550' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_ATCCEventsHistory] ([TransactionId], [EquipmentId], [EventID], [LaneNumber], [EventDate], [VehicleClassId], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [ClassConfidencelevel], [VehicleColor], [VehicleDirectionId], [IsWrongDirection], [IsReviewedRequired], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'100920231445080410', 42, NULL, 2, CAST(N'2023-09-10T14:45:08.0410000' AS DateTime2), 3, N'VSDS/VehicleImage/085929aa-54a2-4506-b832-9ad4d9197694.jpeg', N'', NULL, NULL, NULL, 0, 0, 1, 0, NULL, NULL, NULL, NULL, CAST(N'2023-09-10T16:26:33.550' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_ATCCEventsHistory] ([TransactionId], [EquipmentId], [EventID], [LaneNumber], [EventDate], [VehicleClassId], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [ClassConfidencelevel], [VehicleColor], [VehicleDirectionId], [IsWrongDirection], [IsReviewedRequired], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'100920231445050590', 42, NULL, 2, CAST(N'2023-09-10T14:45:05.0590000' AS DateTime2), 3, N'VSDS/VehicleImage/4592b6fb-909b-4d73-b4b6-dbd885b2f10b.jpeg', N'', NULL, NULL, NULL, 0, 0, 1, 0, NULL, NULL, NULL, NULL, CAST(N'2023-09-10T16:26:33.550' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_ATCCEventsHistory] ([TransactionId], [EquipmentId], [EventID], [LaneNumber], [EventDate], [VehicleClassId], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [ClassConfidencelevel], [VehicleColor], [VehicleDirectionId], [IsWrongDirection], [IsReviewedRequired], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'100920231444531640', 42, NULL, 2, CAST(N'2023-09-10T14:44:53.1640000' AS DateTime2), 6, N'VSDS/VehicleImage/89ba1336-7dac-4280-8056-65ca1c903589.jpeg', N'', NULL, NULL, NULL, 0, 0, 1, 0, NULL, NULL, NULL, NULL, CAST(N'2023-09-10T16:26:33.550' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_ATCCEventsHistory] ([TransactionId], [EquipmentId], [EventID], [LaneNumber], [EventDate], [VehicleClassId], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [ClassConfidencelevel], [VehicleColor], [VehicleDirectionId], [IsWrongDirection], [IsReviewedRequired], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'100920231444493110', 42, NULL, 2, CAST(N'2023-09-10T14:44:49.3110000' AS DateTime2), 3, N'VSDS/VehicleImage/1e6c4e37-6097-4154-926a-8912badd2e3a.jpeg', N'', NULL, NULL, NULL, 0, 0, 1, 0, NULL, NULL, NULL, NULL, CAST(N'2023-09-10T16:26:33.550' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_ATCCEventsHistory] ([TransactionId], [EquipmentId], [EventID], [LaneNumber], [EventDate], [VehicleClassId], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [ClassConfidencelevel], [VehicleColor], [VehicleDirectionId], [IsWrongDirection], [IsReviewedRequired], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'100920231442309940', 42, NULL, 2, CAST(N'2023-09-10T14:42:30.9940000' AS DateTime2), 6, N'VSDS/VehicleImage/e874e8c0-5e5a-4afe-a53c-fd6e34d1eafb.jpeg', N'', NULL, NULL, NULL, 0, 0, 1, 0, NULL, NULL, NULL, NULL, CAST(N'2023-09-10T16:26:33.550' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_ATCCEventsHistory] ([TransactionId], [EquipmentId], [EventID], [LaneNumber], [EventDate], [VehicleClassId], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [ClassConfidencelevel], [VehicleColor], [VehicleDirectionId], [IsWrongDirection], [IsReviewedRequired], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'100920231440569480', 42, NULL, 2, CAST(N'2023-09-10T14:40:56.9480000' AS DateTime2), 3, N'VSDS/VehicleImage/d404c33f-6bb9-4a36-bb9f-d7ea5257b627.jpeg', N'', NULL, NULL, NULL, 0, 0, 1, 0, NULL, NULL, NULL, NULL, CAST(N'2023-09-10T16:26:33.550' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_ATCCEventsHistory] ([TransactionId], [EquipmentId], [EventID], [LaneNumber], [EventDate], [VehicleClassId], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [ClassConfidencelevel], [VehicleColor], [VehicleDirectionId], [IsWrongDirection], [IsReviewedRequired], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'100920231440362560', 42, NULL, 3, CAST(N'2023-09-10T14:40:36.2560000' AS DateTime2), 3, N'VSDS/VehicleImage/8100590b-8177-4793-a1de-905c329dcc06.jpeg', N'', NULL, NULL, NULL, 0, 0, 1, 0, NULL, NULL, NULL, NULL, CAST(N'2023-09-10T16:26:33.550' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_ATCCEventsHistory] ([TransactionId], [EquipmentId], [EventID], [LaneNumber], [EventDate], [VehicleClassId], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [ClassConfidencelevel], [VehicleColor], [VehicleDirectionId], [IsWrongDirection], [IsReviewedRequired], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'100920231440360920', 42, NULL, 2, CAST(N'2023-09-10T14:40:36.0920000' AS DateTime2), 3, N'VSDS/VehicleImage/a6b03c42-a49c-4d66-abf3-f463bc478245.jpeg', N'', NULL, NULL, NULL, 0, 0, 1, 0, NULL, NULL, NULL, NULL, CAST(N'2023-09-10T16:26:33.550' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_ATCCEventsHistory] ([TransactionId], [EquipmentId], [EventID], [LaneNumber], [EventDate], [VehicleClassId], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [ClassConfidencelevel], [VehicleColor], [VehicleDirectionId], [IsWrongDirection], [IsReviewedRequired], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'100920231440018610', 42, NULL, 2, CAST(N'2023-09-10T14:40:01.8610000' AS DateTime2), 3, N'VSDS/VehicleImage/aa03ad21-830b-4f3b-b2b2-dbfc157170c3.jpeg', N'', NULL, NULL, NULL, 0, 0, 1, 0, NULL, NULL, NULL, NULL, CAST(N'2023-09-10T16:26:33.550' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_ATCCEventsHistory] ([TransactionId], [EquipmentId], [EventID], [LaneNumber], [EventDate], [VehicleClassId], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [ClassConfidencelevel], [VehicleColor], [VehicleDirectionId], [IsWrongDirection], [IsReviewedRequired], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'100920231439554260', 42, NULL, 2, CAST(N'2023-09-10T14:39:55.4260000' AS DateTime2), 3, N'VSDS/VehicleImage/c0c5c0f6-cc96-4a70-ad01-50e853a84426.jpeg', N'', NULL, NULL, NULL, 0, 0, 1, 0, NULL, NULL, NULL, NULL, CAST(N'2023-09-10T16:26:33.550' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_ATCCEventsHistory] ([TransactionId], [EquipmentId], [EventID], [LaneNumber], [EventDate], [VehicleClassId], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [ClassConfidencelevel], [VehicleColor], [VehicleDirectionId], [IsWrongDirection], [IsReviewedRequired], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'100920231439471150', 42, NULL, 2, CAST(N'2023-09-10T14:39:47.1150000' AS DateTime2), 3, N'VSDS/VehicleImage/ffa12fd9-e83b-4859-aa5d-d44669c6fdd7.jpeg', N'', NULL, NULL, NULL, 0, 0, 1, 0, NULL, NULL, NULL, NULL, CAST(N'2023-09-10T16:26:33.550' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_ATCCEventsHistory] ([TransactionId], [EquipmentId], [EventID], [LaneNumber], [EventDate], [VehicleClassId], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [ClassConfidencelevel], [VehicleColor], [VehicleDirectionId], [IsWrongDirection], [IsReviewedRequired], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'100920231439367160', 42, NULL, 2, CAST(N'2023-09-10T14:39:36.7160000' AS DateTime2), 3, N'VSDS/VehicleImage/f456b459-afd2-4f9a-bd20-b70f3dd4ae8d.jpeg', N'', NULL, NULL, NULL, 0, 0, 1, 0, NULL, NULL, NULL, NULL, CAST(N'2023-09-10T16:26:33.550' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_ATCCEventsHistory] ([TransactionId], [EquipmentId], [EventID], [LaneNumber], [EventDate], [VehicleClassId], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [ClassConfidencelevel], [VehicleColor], [VehicleDirectionId], [IsWrongDirection], [IsReviewedRequired], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'100920231439335250', 42, NULL, 2, CAST(N'2023-09-10T14:39:33.5250000' AS DateTime2), 3, N'VSDS/VehicleImage/76625c03-575b-4d48-ae8a-08e7e4373706.jpeg', N'', NULL, NULL, NULL, 0, 0, 1, 0, NULL, NULL, NULL, NULL, CAST(N'2023-09-10T16:26:33.550' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_ATCCEventsHistory] ([TransactionId], [EquipmentId], [EventID], [LaneNumber], [EventDate], [VehicleClassId], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [ClassConfidencelevel], [VehicleColor], [VehicleDirectionId], [IsWrongDirection], [IsReviewedRequired], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'100920231438573990', 42, NULL, 3, CAST(N'2023-09-10T14:38:57.3990000' AS DateTime2), 6, N'VSDS/VehicleImage/bacf41a9-0d83-4f1f-a64d-65f51c2caf20.jpeg', N'', NULL, NULL, NULL, 0, 0, 1, 0, NULL, NULL, NULL, NULL, CAST(N'2023-09-10T16:26:33.550' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_ATCCEventsHistory] ([TransactionId], [EquipmentId], [EventID], [LaneNumber], [EventDate], [VehicleClassId], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [ClassConfidencelevel], [VehicleColor], [VehicleDirectionId], [IsWrongDirection], [IsReviewedRequired], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'100920231438455690', 42, NULL, 2, CAST(N'2023-09-10T14:38:45.5690000' AS DateTime2), 3, N'VSDS/VehicleImage/d9cb84b7-90c0-41cf-9630-92141d635864.jpeg', N'', NULL, NULL, NULL, 0, 0, 1, 0, NULL, NULL, NULL, NULL, CAST(N'2023-09-10T16:26:33.550' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_ATCCEventsHistory] ([TransactionId], [EquipmentId], [EventID], [LaneNumber], [EventDate], [VehicleClassId], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [ClassConfidencelevel], [VehicleColor], [VehicleDirectionId], [IsWrongDirection], [IsReviewedRequired], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'100920231438081440', 42, NULL, 2, CAST(N'2023-09-10T14:38:08.1440000' AS DateTime2), 3, N'VSDS/VehicleImage/1a7bd819-6ea6-4359-a6a8-4fee2a006605.jpeg', N'', NULL, NULL, NULL, 0, 0, 1, 0, NULL, NULL, NULL, NULL, CAST(N'2023-09-10T16:26:33.550' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_ATCCEventsHistory] ([TransactionId], [EquipmentId], [EventID], [LaneNumber], [EventDate], [VehicleClassId], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [ClassConfidencelevel], [VehicleColor], [VehicleDirectionId], [IsWrongDirection], [IsReviewedRequired], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'100920231437357210', 42, NULL, 2, CAST(N'2023-09-10T14:37:35.7210000' AS DateTime2), 3, N'VSDS/VehicleImage/371a34ac-fdb6-4285-b4d2-8b198000cf6d.jpeg', N'', NULL, NULL, NULL, 0, 0, 1, 0, NULL, NULL, NULL, NULL, CAST(N'2023-09-10T16:26:33.550' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_ATCCEventsHistory] ([TransactionId], [EquipmentId], [EventID], [LaneNumber], [EventDate], [VehicleClassId], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [ClassConfidencelevel], [VehicleColor], [VehicleDirectionId], [IsWrongDirection], [IsReviewedRequired], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'100920231437187530', 42, NULL, 2, CAST(N'2023-09-10T14:37:18.7530000' AS DateTime2), 3, N'VSDS/VehicleImage/88855df5-78aa-4088-879f-0fdd434c8416.jpeg', N'', NULL, NULL, NULL, 0, 0, 1, 0, NULL, NULL, NULL, NULL, CAST(N'2023-09-10T16:26:33.550' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_ATCCEventsHistory] ([TransactionId], [EquipmentId], [EventID], [LaneNumber], [EventDate], [VehicleClassId], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [ClassConfidencelevel], [VehicleColor], [VehicleDirectionId], [IsWrongDirection], [IsReviewedRequired], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'100920231437161580', 42, NULL, 2, CAST(N'2023-09-10T14:37:16.1580000' AS DateTime2), 3, N'VSDS/VehicleImage/9ce5d08f-df27-4d6a-a6b4-923293255b0b.jpeg', N'', NULL, NULL, NULL, 0, 0, 1, 0, NULL, NULL, NULL, NULL, CAST(N'2023-09-10T16:26:33.550' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_ATCCEventsHistory] ([TransactionId], [EquipmentId], [EventID], [LaneNumber], [EventDate], [VehicleClassId], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [ClassConfidencelevel], [VehicleColor], [VehicleDirectionId], [IsWrongDirection], [IsReviewedRequired], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'100920231437022690', 42, NULL, 2, CAST(N'2023-09-10T14:37:02.2690000' AS DateTime2), 3, N'VSDS/VehicleImage/4dded688-11f7-4a10-b3f8-cd153c5445a5.jpeg', N'', NULL, NULL, NULL, 0, 0, 1, 0, NULL, NULL, NULL, NULL, CAST(N'2023-09-10T16:26:33.550' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_ATCCEventsHistory] ([TransactionId], [EquipmentId], [EventID], [LaneNumber], [EventDate], [VehicleClassId], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [ClassConfidencelevel], [VehicleColor], [VehicleDirectionId], [IsWrongDirection], [IsReviewedRequired], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'100920231435527980', 42, NULL, 2, CAST(N'2023-09-10T14:35:52.7980000' AS DateTime2), 3, N'VSDS/VehicleImage/e2e0cd95-c5a5-46da-b553-b970583364cc.jpeg', N'', NULL, NULL, NULL, 0, 0, 1, 0, NULL, NULL, NULL, NULL, CAST(N'2023-09-10T16:26:33.550' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_ATCCEventsHistory] ([TransactionId], [EquipmentId], [EventID], [LaneNumber], [EventDate], [VehicleClassId], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [ClassConfidencelevel], [VehicleColor], [VehicleDirectionId], [IsWrongDirection], [IsReviewedRequired], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'100920231435094590', 42, NULL, 2, CAST(N'2023-09-10T14:35:09.4590000' AS DateTime2), 3, N'VSDS/VehicleImage/f27864eb-826c-4fb2-bdf1-7e8066c2379e.jpeg', N'', NULL, NULL, NULL, 0, 0, 1, 0, NULL, NULL, NULL, NULL, CAST(N'2023-09-10T16:26:33.550' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_ATCCEventsHistory] ([TransactionId], [EquipmentId], [EventID], [LaneNumber], [EventDate], [VehicleClassId], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [ClassConfidencelevel], [VehicleColor], [VehicleDirectionId], [IsWrongDirection], [IsReviewedRequired], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'100920231435015260', 42, NULL, 3, CAST(N'2023-09-10T14:35:01.5260000' AS DateTime2), 5, N'VSDS/VehicleImage/e03e9e78-7af9-4905-a9b3-7fcfe806c93e.jpeg', N'', NULL, NULL, NULL, 0, 0, 1, 0, NULL, NULL, NULL, NULL, CAST(N'2023-09-10T16:26:33.550' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_ATCCEventsHistory] ([TransactionId], [EquipmentId], [EventID], [LaneNumber], [EventDate], [VehicleClassId], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [ClassConfidencelevel], [VehicleColor], [VehicleDirectionId], [IsWrongDirection], [IsReviewedRequired], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'100920231434471910', 42, NULL, 2, CAST(N'2023-09-10T14:34:47.1910000' AS DateTime2), 3, N'VSDS/VehicleImage/3ead0a36-39a1-4e8b-8bdb-543f0c0143cd.jpeg', N'', NULL, NULL, NULL, 0, 0, 1, 0, NULL, NULL, NULL, NULL, CAST(N'2023-09-10T16:26:33.550' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_ATCCEventsHistory] ([TransactionId], [EquipmentId], [EventID], [LaneNumber], [EventDate], [VehicleClassId], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [ClassConfidencelevel], [VehicleColor], [VehicleDirectionId], [IsWrongDirection], [IsReviewedRequired], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'100920231434314840', 42, NULL, 2, CAST(N'2023-09-10T14:34:31.4840000' AS DateTime2), 3, N'VSDS/VehicleImage/bdea4f9f-8599-4139-b832-5905a1f07392.jpeg', N'', NULL, NULL, NULL, 0, 0, 1, 0, NULL, NULL, NULL, NULL, CAST(N'2023-09-10T16:26:33.550' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_ATCCEventsHistory] ([TransactionId], [EquipmentId], [EventID], [LaneNumber], [EventDate], [VehicleClassId], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [ClassConfidencelevel], [VehicleColor], [VehicleDirectionId], [IsWrongDirection], [IsReviewedRequired], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'100920231434308820', 42, NULL, 2, CAST(N'2023-09-10T14:34:30.8820000' AS DateTime2), 3, N'VSDS/VehicleImage/419070f3-c1c4-494c-9b24-79942a640b9c.jpeg', N'', NULL, NULL, NULL, 0, 0, 1, 0, NULL, NULL, NULL, NULL, CAST(N'2023-09-10T16:26:33.550' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_ATCCEventsHistory] ([TransactionId], [EquipmentId], [EventID], [LaneNumber], [EventDate], [VehicleClassId], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [ClassConfidencelevel], [VehicleColor], [VehicleDirectionId], [IsWrongDirection], [IsReviewedRequired], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'100920231433127010', 42, NULL, 2, CAST(N'2023-09-10T14:33:12.7010000' AS DateTime2), 5, N'VSDS/VehicleImage/2138e6be-2b7b-4be0-bc83-fc75962d87b6.jpeg', N'', NULL, NULL, NULL, 0, 0, 1, 0, NULL, NULL, NULL, NULL, CAST(N'2023-09-10T16:26:33.550' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_ATCCEventsHistory] ([TransactionId], [EquipmentId], [EventID], [LaneNumber], [EventDate], [VehicleClassId], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [ClassConfidencelevel], [VehicleColor], [VehicleDirectionId], [IsWrongDirection], [IsReviewedRequired], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'100920231433038370', 42, NULL, 2, CAST(N'2023-09-10T14:33:03.8370000' AS DateTime2), 3, N'VSDS/VehicleImage/9faecc14-5990-4592-a2aa-40101963e14f.jpeg', N'', NULL, NULL, NULL, 0, 0, 1, 0, NULL, NULL, NULL, NULL, CAST(N'2023-09-10T16:26:33.550' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_ATCCEventsHistory] ([TransactionId], [EquipmentId], [EventID], [LaneNumber], [EventDate], [VehicleClassId], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [ClassConfidencelevel], [VehicleColor], [VehicleDirectionId], [IsWrongDirection], [IsReviewedRequired], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'100920231432458380', 42, NULL, 2, CAST(N'2023-09-10T14:32:45.8380000' AS DateTime2), 3, N'VSDS/VehicleImage/2386f47e-7f22-40aa-8c46-5ef096f3d0e3.jpeg', N'', NULL, NULL, NULL, 0, 0, 1, 0, NULL, NULL, NULL, NULL, CAST(N'2023-09-10T16:26:33.550' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_ATCCEventsHistory] ([TransactionId], [EquipmentId], [EventID], [LaneNumber], [EventDate], [VehicleClassId], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [ClassConfidencelevel], [VehicleColor], [VehicleDirectionId], [IsWrongDirection], [IsReviewedRequired], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'100920231432324640', 42, NULL, 1, CAST(N'2023-09-10T14:32:32.4640000' AS DateTime2), 3, N'VSDS/VehicleImage/276c4db5-0698-4210-b5ec-fcc61508da34.jpeg', N'', NULL, NULL, NULL, 0, 0, 1, 0, NULL, NULL, NULL, NULL, CAST(N'2023-09-10T16:26:33.550' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_ATCCEventsHistory] ([TransactionId], [EquipmentId], [EventID], [LaneNumber], [EventDate], [VehicleClassId], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [ClassConfidencelevel], [VehicleColor], [VehicleDirectionId], [IsWrongDirection], [IsReviewedRequired], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'100920231432279240', 42, NULL, 2, CAST(N'2023-09-10T14:32:27.9240000' AS DateTime2), 3, N'VSDS/VehicleImage/8c9d3a46-64be-445f-811f-567aff32a2e9.jpeg', N'', NULL, NULL, NULL, 0, 0, 1, 0, NULL, NULL, NULL, NULL, CAST(N'2023-09-10T16:26:33.550' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_ATCCEventsHistory] ([TransactionId], [EquipmentId], [EventID], [LaneNumber], [EventDate], [VehicleClassId], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [ClassConfidencelevel], [VehicleColor], [VehicleDirectionId], [IsWrongDirection], [IsReviewedRequired], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'100920231432214330', 42, NULL, 4, CAST(N'2023-09-10T14:32:21.4330000' AS DateTime2), 1, N'VSDS/VehicleImage/5164fb93-cc12-49bb-b8c1-d4f3d9c3b910.jpeg', N'', NULL, NULL, NULL, 0, 0, 1, 0, NULL, NULL, NULL, NULL, CAST(N'2023-09-10T16:26:33.550' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_ATCCEventsHistory] ([TransactionId], [EquipmentId], [EventID], [LaneNumber], [EventDate], [VehicleClassId], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [ClassConfidencelevel], [VehicleColor], [VehicleDirectionId], [IsWrongDirection], [IsReviewedRequired], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'100920231432125400', 42, NULL, 1, CAST(N'2023-09-10T14:32:12.5400000' AS DateTime2), 3, N'VSDS/VehicleImage/55de0357-9078-48d8-a19b-7df934137b22.jpeg', N'', NULL, NULL, NULL, 0, 0, 1, 0, NULL, NULL, NULL, NULL, CAST(N'2023-09-10T16:26:33.550' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_ATCCEventsHistory] ([TransactionId], [EquipmentId], [EventID], [LaneNumber], [EventDate], [VehicleClassId], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [ClassConfidencelevel], [VehicleColor], [VehicleDirectionId], [IsWrongDirection], [IsReviewedRequired], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'100920231431509230', 42, NULL, 2, CAST(N'2023-09-10T14:31:50.9230000' AS DateTime2), 3, N'VSDS/VehicleImage/d2bcde47-f753-4d63-9ba9-53c87512f927.jpeg', N'', NULL, NULL, NULL, 0, 0, 1, 0, NULL, NULL, NULL, NULL, CAST(N'2023-09-10T16:26:33.550' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_ATCCEventsHistory] ([TransactionId], [EquipmentId], [EventID], [LaneNumber], [EventDate], [VehicleClassId], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [ClassConfidencelevel], [VehicleColor], [VehicleDirectionId], [IsWrongDirection], [IsReviewedRequired], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'100920231431432090', 42, NULL, 3, CAST(N'2023-09-10T14:31:43.2090000' AS DateTime2), 3, N'VSDS/VehicleImage/19dd3f0b-dc5a-4ffa-830e-1cd9188310f8.jpeg', N'', NULL, NULL, NULL, 0, 0, 1, 0, NULL, NULL, NULL, NULL, CAST(N'2023-09-10T16:26:33.550' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_ATCCEventsHistory] ([TransactionId], [EquipmentId], [EventID], [LaneNumber], [EventDate], [VehicleClassId], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [ClassConfidencelevel], [VehicleColor], [VehicleDirectionId], [IsWrongDirection], [IsReviewedRequired], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'100920231431344700', 42, NULL, 3, CAST(N'2023-09-10T14:31:34.4700000' AS DateTime2), 3, N'VSDS/VehicleImage/6a8c3932-f210-45dd-b0dd-e9c8d5ff22f1.jpeg', N'', NULL, NULL, NULL, 0, 0, 1, 0, NULL, NULL, NULL, NULL, CAST(N'2023-09-10T16:26:33.550' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_ATCCEventsHistory] ([TransactionId], [EquipmentId], [EventID], [LaneNumber], [EventDate], [VehicleClassId], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [ClassConfidencelevel], [VehicleColor], [VehicleDirectionId], [IsWrongDirection], [IsReviewedRequired], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'100920231431329580', 42, NULL, 2, CAST(N'2023-09-10T14:31:32.9580000' AS DateTime2), 3, N'VSDS/VehicleImage/e50d4aa0-50f7-4666-aea6-3e31f01d5495.jpeg', N'', NULL, NULL, NULL, 0, 0, 1, 0, NULL, NULL, NULL, NULL, CAST(N'2023-09-10T16:26:33.550' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_ATCCEventsHistory] ([TransactionId], [EquipmentId], [EventID], [LaneNumber], [EventDate], [VehicleClassId], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [ClassConfidencelevel], [VehicleColor], [VehicleDirectionId], [IsWrongDirection], [IsReviewedRequired], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'100920231431295860', 42, NULL, 1, CAST(N'2023-09-10T14:31:29.5860000' AS DateTime2), 3, N'VSDS/VehicleImage/4ecb7000-1ae2-4430-8f00-bf935d4877d2.jpeg', N'', NULL, NULL, NULL, 0, 0, 1, 0, NULL, NULL, NULL, NULL, CAST(N'2023-09-10T16:26:33.550' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_ATCCEventsHistory] ([TransactionId], [EquipmentId], [EventID], [LaneNumber], [EventDate], [VehicleClassId], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [ClassConfidencelevel], [VehicleColor], [VehicleDirectionId], [IsWrongDirection], [IsReviewedRequired], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'100920231431119280', 42, NULL, 2, CAST(N'2023-09-10T14:31:11.9280000' AS DateTime2), 6, N'VSDS/VehicleImage/d67cd502-3d5c-4377-81de-7a49e11dc5a2.jpeg', N'', NULL, NULL, NULL, 0, 0, 1, 0, NULL, NULL, NULL, NULL, CAST(N'2023-09-10T16:26:33.550' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_ATCCEventsHistory] ([TransactionId], [EquipmentId], [EventID], [LaneNumber], [EventDate], [VehicleClassId], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [ClassConfidencelevel], [VehicleColor], [VehicleDirectionId], [IsWrongDirection], [IsReviewedRequired], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'100920231431090020', 42, NULL, 2, CAST(N'2023-09-10T14:31:09.0020000' AS DateTime2), 3, N'VSDS/VehicleImage/99e74b1a-9498-4aea-be72-673948d51748.jpeg', N'', NULL, NULL, NULL, 0, 0, 1, 0, NULL, NULL, NULL, NULL, CAST(N'2023-09-10T16:26:33.550' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_ATCCEventsHistory] ([TransactionId], [EquipmentId], [EventID], [LaneNumber], [EventDate], [VehicleClassId], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [ClassConfidencelevel], [VehicleColor], [VehicleDirectionId], [IsWrongDirection], [IsReviewedRequired], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'100920231431054950', 42, NULL, 2, CAST(N'2023-09-10T14:31:05.4950000' AS DateTime2), 4, N'VSDS/VehicleImage/0527464a-c959-426d-b9a5-3137bc23fdb2.jpeg', N'', NULL, NULL, NULL, 0, 0, 1, 0, NULL, NULL, NULL, NULL, CAST(N'2023-09-10T16:26:33.550' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_ATCCEventsHistory] ([TransactionId], [EquipmentId], [EventID], [LaneNumber], [EventDate], [VehicleClassId], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [ClassConfidencelevel], [VehicleColor], [VehicleDirectionId], [IsWrongDirection], [IsReviewedRequired], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'100920231431000840', 42, NULL, 2, CAST(N'2023-09-10T14:31:00.0840000' AS DateTime2), 3, N'VSDS/VehicleImage/038b39ba-353e-4cec-9ed0-abbc89c8b15b.jpeg', N'', NULL, NULL, NULL, 0, 0, 1, 0, NULL, NULL, NULL, NULL, CAST(N'2023-09-10T16:26:33.550' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_ATCCEventsHistory] ([TransactionId], [EquipmentId], [EventID], [LaneNumber], [EventDate], [VehicleClassId], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [ClassConfidencelevel], [VehicleColor], [VehicleDirectionId], [IsWrongDirection], [IsReviewedRequired], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'100920231431000090', 42, NULL, 2, CAST(N'2023-09-10T14:31:00.0090000' AS DateTime2), 3, N'VSDS/VehicleImage/53908c78-3b6e-41e9-b3d3-145f2bba2bd0.jpeg', N'', NULL, NULL, NULL, 0, 0, 1, 0, NULL, NULL, NULL, NULL, CAST(N'2023-09-10T16:26:33.550' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_ATCCEventsHistory] ([TransactionId], [EquipmentId], [EventID], [LaneNumber], [EventDate], [VehicleClassId], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [ClassConfidencelevel], [VehicleColor], [VehicleDirectionId], [IsWrongDirection], [IsReviewedRequired], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'100920231430515730', 42, NULL, 2, CAST(N'2023-09-10T14:30:51.5730000' AS DateTime2), 3, N'VSDS/VehicleImage/97220c15-1197-4cd6-9b06-bda159af6bb4.jpeg', N'', NULL, NULL, NULL, 0, 0, 1, 0, NULL, NULL, NULL, NULL, CAST(N'2023-09-10T16:26:33.550' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_ATCCEventsHistory] ([TransactionId], [EquipmentId], [EventID], [LaneNumber], [EventDate], [VehicleClassId], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [ClassConfidencelevel], [VehicleColor], [VehicleDirectionId], [IsWrongDirection], [IsReviewedRequired], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'100920231430393840', 42, NULL, 2, CAST(N'2023-09-10T14:30:39.3840000' AS DateTime2), 3, N'VSDS/VehicleImage/08162dab-ced5-4719-9890-9e3651cfb665.jpeg', N'', NULL, NULL, NULL, 0, 0, 1, 0, NULL, NULL, NULL, NULL, CAST(N'2023-09-10T16:26:33.550' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_ATCCEventsHistory] ([TransactionId], [EquipmentId], [EventID], [LaneNumber], [EventDate], [VehicleClassId], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [ClassConfidencelevel], [VehicleColor], [VehicleDirectionId], [IsWrongDirection], [IsReviewedRequired], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'100920231430041530', 42, NULL, 2, CAST(N'2023-09-10T14:30:04.1530000' AS DateTime2), 3, N'VSDS/VehicleImage/967da800-3da0-4ba5-925e-5f3187da49c0.jpeg', N'', NULL, NULL, NULL, 0, 0, 1, 0, NULL, NULL, NULL, NULL, CAST(N'2023-09-10T16:26:33.550' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_ATCCEventsHistory] ([TransactionId], [EquipmentId], [EventID], [LaneNumber], [EventDate], [VehicleClassId], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [ClassConfidencelevel], [VehicleColor], [VehicleDirectionId], [IsWrongDirection], [IsReviewedRequired], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'100920231429470760', 42, NULL, 2, CAST(N'2023-09-10T14:29:47.0760000' AS DateTime2), 3, N'VSDS/VehicleImage/095d0eeb-df99-400f-a3f1-095317f30299.jpeg', N'', NULL, NULL, NULL, 0, 0, 1, 0, NULL, NULL, NULL, NULL, CAST(N'2023-09-10T16:26:33.550' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_ATCCEventsHistory] ([TransactionId], [EquipmentId], [EventID], [LaneNumber], [EventDate], [VehicleClassId], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [ClassConfidencelevel], [VehicleColor], [VehicleDirectionId], [IsWrongDirection], [IsReviewedRequired], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'100120230701310000', 42, NULL, 2, CAST(N'2023-09-10T07:01:31.0760000' AS DateTime2), 3, N'VSDS/VehicleImage/046a318c-26cf-4d91-b029-2d9dd8c4cb40.jpeg', N'VSDS/VehicleVideo/046a318c-26cf-4d91-b029-2d9dd8c4cb40.mp4', NULL, NULL, NULL, 0, 0, 1, 0, NULL, NULL, NULL, NULL, CAST(N'2023-09-10T16:35:30.757' AS DateTime), NULL, 0, 0)
GO
SET IDENTITY_INSERT [dbo].[tbl_ControlRoomMaster] ON 
GO
INSERT [dbo].[tbl_ControlRoomMaster] ([ControlRoomId], [ControlRoomName], [ChainageNumber], [Latitude], [Longitude], [DirectionId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (1, N'TMC-Main', CAST(375.500 AS Decimal(16, 3)), CAST(20.056864400 AS Decimal(12, 9)), CAST(85.542642000 AS Decimal(12, 9)), 1, 1, CAST(N'2023-06-17T06:20:12.823' AS DateTime), 0, CAST(N'2023-09-23T17:28:17.893' AS DateTime), 0)
GO
SET IDENTITY_INSERT [dbo].[tbl_ControlRoomMaster] OFF
GO
INSERT [dbo].[tbl_EquipmentConfig] ([SystemId], [EquipmentTypeId], [EquipmentId], [ParentId], [PositionId], [LaneNumberId], [OrderBy], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (6, 28, 84, 0, 0, 0, 1, 1, CAST(N'2023-10-03T18:57:00.120' AS DateTime), 0, CAST(N'2023-10-03T18:57:00.120' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentConfig] ([SystemId], [EquipmentTypeId], [EquipmentId], [ParentId], [PositionId], [LaneNumberId], [OrderBy], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (6, 25, 43, 84, 1, 0, 2, 1, CAST(N'2023-10-03T18:57:00.120' AS DateTime), 0, CAST(N'2023-10-03T18:57:00.120' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentConfig] ([SystemId], [EquipmentTypeId], [EquipmentId], [ParentId], [PositionId], [LaneNumberId], [OrderBy], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (6, 28, 85, 0, 0, 0, 3, 1, CAST(N'2023-10-03T18:57:00.120' AS DateTime), 0, CAST(N'2023-10-03T18:57:00.120' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentConfig] ([SystemId], [EquipmentTypeId], [EquipmentId], [ParentId], [PositionId], [LaneNumberId], [OrderBy], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (6, 25, 44, 85, 1, 0, 4, 1, CAST(N'2023-10-03T18:57:00.120' AS DateTime), 0, CAST(N'2023-10-03T18:57:00.120' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentConfig] ([SystemId], [EquipmentTypeId], [EquipmentId], [ParentId], [PositionId], [LaneNumberId], [OrderBy], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (6, 28, 86, 0, 0, 0, 5, 1, CAST(N'2023-10-03T18:57:00.120' AS DateTime), 0, CAST(N'2023-10-03T18:57:00.120' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentConfig] ([SystemId], [EquipmentTypeId], [EquipmentId], [ParentId], [PositionId], [LaneNumberId], [OrderBy], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (6, 25, 45, 86, 1, 0, 6, 1, CAST(N'2023-10-03T18:57:00.120' AS DateTime), 0, CAST(N'2023-10-03T18:57:00.120' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentConfig] ([SystemId], [EquipmentTypeId], [EquipmentId], [ParentId], [PositionId], [LaneNumberId], [OrderBy], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (6, 28, 87, 0, 0, 0, 7, 1, CAST(N'2023-10-03T18:57:00.120' AS DateTime), 0, CAST(N'2023-10-03T18:57:00.120' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentConfig] ([SystemId], [EquipmentTypeId], [EquipmentId], [ParentId], [PositionId], [LaneNumberId], [OrderBy], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (6, 25, 46, 87, 2, 0, 8, 1, CAST(N'2023-10-03T18:57:00.120' AS DateTime), 0, CAST(N'2023-10-03T18:57:00.120' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentConfig] ([SystemId], [EquipmentTypeId], [EquipmentId], [ParentId], [PositionId], [LaneNumberId], [OrderBy], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (6, 28, 88, 0, 0, 0, 9, 1, CAST(N'2023-10-03T18:57:00.120' AS DateTime), 0, CAST(N'2023-10-03T18:57:00.120' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentConfig] ([SystemId], [EquipmentTypeId], [EquipmentId], [ParentId], [PositionId], [LaneNumberId], [OrderBy], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (6, 25, 47, 88, 2, 0, 10, 1, CAST(N'2023-10-03T18:57:00.120' AS DateTime), 0, CAST(N'2023-10-03T18:57:00.120' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentConfig] ([SystemId], [EquipmentTypeId], [EquipmentId], [ParentId], [PositionId], [LaneNumberId], [OrderBy], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (6, 28, 89, 0, 0, 0, 11, 1, CAST(N'2023-10-03T18:57:00.120' AS DateTime), 0, CAST(N'2023-10-03T18:57:00.120' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentConfig] ([SystemId], [EquipmentTypeId], [EquipmentId], [ParentId], [PositionId], [LaneNumberId], [OrderBy], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (6, 25, 48, 89, 2, 0, 12, 1, CAST(N'2023-10-03T18:57:00.120' AS DateTime), 0, CAST(N'2023-10-03T18:57:00.120' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentConfig] ([SystemId], [EquipmentTypeId], [EquipmentId], [ParentId], [PositionId], [LaneNumberId], [OrderBy], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (2, 28, 83, 0, 0, 0, 1, 1, CAST(N'2023-10-03T19:09:24.480' AS DateTime), 0, CAST(N'2023-10-03T19:09:24.480' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentConfig] ([SystemId], [EquipmentTypeId], [EquipmentId], [ParentId], [PositionId], [LaneNumberId], [OrderBy], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (2, 32, 42, 83, 1, 0, 2, 1, CAST(N'2023-10-03T19:09:24.480' AS DateTime), 0, CAST(N'2023-10-03T19:09:24.480' AS DateTime), 0)
GO
SET IDENTITY_INSERT [dbo].[tbl_EquipmentDetails] ON 
GO
INSERT [dbo].[tbl_EquipmentDetails] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (2, 1, 2, 3, N'ECB 1-1', 1, NULL, N'12.16.155.31', 80, N'aiplsys', N'ecbsys#987', CAST(355.500 AS Decimal(16, 3)), CAST(19.945352554 AS Decimal(12, 9)), CAST(85.398429871 AS Decimal(12, 9)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2023-09-23T16:34:27.860' AS DateTime), 0, CAST(N'2023-09-23T16:34:27.860' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentDetails] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (3, 1, 2, 3, N'ECB 1-2', 2, NULL, N'12.16.155.32', 80, N'aiplsys', N'ecbsys#987', CAST(355.500 AS Decimal(16, 3)), CAST(19.944974899 AS Decimal(12, 9)), CAST(85.398460388 AS Decimal(12, 9)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2023-09-23T16:34:27.860' AS DateTime), 0, CAST(N'2023-09-23T16:34:27.860' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentDetails] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (4, 1, 2, 3, N'ECB 2-1', 1, NULL, N'12.16.158.31', 80, N'aiplsys', N'ecbsys#987', CAST(358.600 AS Decimal(16, 3)), CAST(19.957071304 AS Decimal(12, 9)), CAST(85.424407959 AS Decimal(12, 9)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2023-09-23T16:34:27.860' AS DateTime), 0, CAST(N'2023-09-23T16:34:27.860' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentDetails] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (5, 1, 2, 3, N'ECB 2-2', 2, NULL, N'12.16.158.32', 80, N'aiplsys', N'ecbsys#987', CAST(358.600 AS Decimal(16, 3)), CAST(19.956876755 AS Decimal(12, 9)), CAST(85.424552917 AS Decimal(12, 9)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2023-09-23T16:34:27.860' AS DateTime), 0, CAST(N'2023-09-23T16:34:27.860' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentDetails] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (6, 1, 2, 3, N'ECB 3-1', 1, NULL, N'12.16.161.31', 80, N'aiplsys', N'ecbsys#987', CAST(361.100 AS Decimal(16, 3)), CAST(19.971357346 AS Decimal(12, 9)), CAST(85.441162109 AS Decimal(12, 9)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2023-09-23T16:34:27.860' AS DateTime), 0, CAST(N'2023-09-23T16:34:27.860' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentDetails] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (7, 1, 2, 3, N'ECB 3-2', 2, NULL, N'12.16.161.32', 80, N'aiplsys', N'ecbsys#987', CAST(361.100 AS Decimal(16, 3)), CAST(19.971158981 AS Decimal(12, 9)), CAST(85.441299438 AS Decimal(12, 9)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2023-09-23T16:34:27.860' AS DateTime), 0, CAST(N'2023-09-23T16:34:27.860' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentDetails] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (8, 1, 2, 3, N'ECB 4-1', 1, NULL, N'12.16.164.31', 80, N'aiplsys', N'ecbsys#987', CAST(364.000 AS Decimal(16, 3)), CAST(19.985450745 AS Decimal(12, 9)), CAST(85.465400696 AS Decimal(12, 9)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2023-09-23T16:34:27.860' AS DateTime), 0, CAST(N'2023-09-23T16:34:27.860' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentDetails] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (9, 1, 2, 3, N'ECB 4-2', 2, NULL, N'12.16.164.32', 80, N'aiplsys', N'ecbsys#987', CAST(364.000 AS Decimal(16, 3)), CAST(19.985193253 AS Decimal(12, 9)), CAST(85.465522766 AS Decimal(12, 9)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2023-09-23T16:34:27.860' AS DateTime), 0, CAST(N'2023-09-23T16:34:27.860' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentDetails] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (10, 1, 2, 3, N'ECB 5-1', 1, NULL, N'12.16.166.31', 80, N'aiplsys', N'ecbsys#987', CAST(366.800 AS Decimal(16, 3)), CAST(20.002422333 AS Decimal(12, 9)), CAST(85.483177185 AS Decimal(12, 9)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2023-09-23T16:34:27.860' AS DateTime), 0, CAST(N'2023-09-23T16:34:27.860' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentDetails] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (11, 1, 2, 3, N'ECB 5-2', 2, NULL, N'12.16.166.32', 80, N'aiplsys', N'ecbsys#987', CAST(366.800 AS Decimal(16, 3)), CAST(20.002328873 AS Decimal(12, 9)), CAST(85.483413696 AS Decimal(12, 9)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2023-09-23T16:34:27.860' AS DateTime), 0, CAST(N'2023-09-23T16:34:27.860' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentDetails] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (12, 1, 2, 3, N'ECB 6-1', 1, NULL, N'12.16.169.31', 80, N'aiplsys', N'ecbsys#987', CAST(369.150 AS Decimal(16, 3)), CAST(20.015665054 AS Decimal(12, 9)), CAST(85.500328064 AS Decimal(12, 9)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2023-09-23T16:34:27.860' AS DateTime), 0, CAST(N'2023-09-23T16:34:27.860' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentDetails] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (13, 1, 2, 3, N'ECB 6-2', 2, NULL, N'12.16.169.32', 80, N'aiplsys', N'ecbsys#987', CAST(369.150 AS Decimal(16, 3)), CAST(20.015419006 AS Decimal(12, 9)), CAST(85.500450134 AS Decimal(12, 9)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2023-09-23T16:34:27.860' AS DateTime), 0, CAST(N'2023-09-23T16:34:27.860' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentDetails] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (14, 1, 2, 3, N'ECB 7-1', 1, NULL, N'12.16.172.31', 80, N'aiplsys', N'ecbsys#987', CAST(372.500 AS Decimal(16, 3)), CAST(20.036985397 AS Decimal(12, 9)), CAST(85.522834778 AS Decimal(12, 9)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2023-09-23T16:34:27.860' AS DateTime), 0, CAST(N'2023-09-23T16:34:27.860' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentDetails] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (15, 1, 2, 3, N'ECB 7-2', 2, NULL, N'12.16.172.32', 80, N'aiplsys', N'ecbsys#987', CAST(372.500 AS Decimal(16, 3)), CAST(20.036851883 AS Decimal(12, 9)), CAST(85.522956848 AS Decimal(12, 9)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2023-09-23T16:34:27.860' AS DateTime), 0, CAST(N'2023-09-23T16:34:27.860' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentDetails] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (16, 1, 2, 3, N'ECB 8-1', 1, NULL, N'12.16.174.31', 80, N'aiplsys', N'ecbsys#987', CAST(374.300 AS Decimal(16, 3)), CAST(20.048826218 AS Decimal(12, 9)), CAST(85.534248352 AS Decimal(12, 9)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2023-09-23T16:34:27.860' AS DateTime), 0, CAST(N'2023-09-23T16:34:27.860' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentDetails] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (17, 1, 2, 3, N'ECB 8-2', 2, NULL, N'12.16.174.32', 80, N'aiplsys', N'ecbsys#987', CAST(374.300 AS Decimal(16, 3)), CAST(20.048675537 AS Decimal(12, 9)), CAST(85.534408569 AS Decimal(12, 9)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2023-09-23T16:34:27.860' AS DateTime), 0, CAST(N'2023-09-23T16:34:27.860' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentDetails] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (18, 1, 2, 3, N'ECB 9-1', 1, NULL, N'12.16.177.31', 80, N'aiplsys', N'ecbsys#987', CAST(377.740 AS Decimal(16, 3)), CAST(20.073381424 AS Decimal(12, 9)), CAST(85.554504395 AS Decimal(12, 9)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2023-09-23T16:34:27.860' AS DateTime), 0, CAST(N'2023-09-23T16:34:27.860' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentDetails] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (19, 1, 2, 3, N'ECB 9-2', 2, NULL, N'12.16.177.32', 80, N'aiplsys', N'ecbsys#987', CAST(377.740 AS Decimal(16, 3)), CAST(20.073240280 AS Decimal(12, 9)), CAST(85.554687500 AS Decimal(12, 9)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2023-09-23T16:34:27.860' AS DateTime), 0, CAST(N'2023-09-23T16:34:27.860' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentDetails] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (20, 1, 2, 3, N'ECB 10-1', 1, NULL, N'12.16.179.31', 80, N'aiplsys', N'ecbsys#987', CAST(379.790 AS Decimal(16, 3)), CAST(20.089458466 AS Decimal(12, 9)), CAST(85.566719055 AS Decimal(12, 9)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2023-09-23T16:34:27.860' AS DateTime), 0, CAST(N'2023-09-23T16:34:27.860' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentDetails] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (21, 1, 2, 3, N'ECB 10-2', 2, NULL, N'12.16.179.32', 80, N'aiplsys', N'ecbsys#987', CAST(379.790 AS Decimal(16, 3)), CAST(20.089374542 AS Decimal(12, 9)), CAST(85.566864014 AS Decimal(12, 9)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2023-09-23T16:34:27.860' AS DateTime), 0, CAST(N'2023-09-23T16:34:27.860' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentDetails] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (22, 1, 2, 3, N'ECB 11-1', 1, NULL, N'12.16.183.31', 80, N'aiplsys', N'ecbsys#987', CAST(383.060 AS Decimal(16, 3)), CAST(20.115041733 AS Decimal(12, 9)), CAST(85.577079773 AS Decimal(12, 9)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2023-09-23T16:34:27.860' AS DateTime), 0, CAST(N'2023-09-23T16:34:27.860' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentDetails] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (23, 1, 2, 3, N'ECB 11-2', 2, NULL, N'12.16.183.32', 80, N'aiplsys', N'ecbsys#987', CAST(383.060 AS Decimal(16, 3)), CAST(20.115045547 AS Decimal(12, 9)), CAST(85.577293396 AS Decimal(12, 9)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2023-09-23T16:34:27.860' AS DateTime), 0, CAST(N'2023-09-23T16:34:27.860' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentDetails] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (24, 1, 2, 3, N'ECB 12-1', 1, NULL, N'12.16.187.31', 80, N'aiplsys', N'ecbsys#987', CAST(387.700 AS Decimal(16, 3)), CAST(20.149215698 AS Decimal(12, 9)), CAST(85.601051331 AS Decimal(12, 9)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2023-09-23T16:34:27.860' AS DateTime), 0, CAST(N'2023-09-23T16:34:27.860' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentDetails] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (25, 1, 2, 3, N'ECB 12-2', 2, NULL, N'12.16.187.32', 80, N'aiplsys', N'ecbsys#987', CAST(387.700 AS Decimal(16, 3)), CAST(20.149164200 AS Decimal(12, 9)), CAST(85.601272583 AS Decimal(12, 9)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2023-09-23T16:34:27.860' AS DateTime), 0, CAST(N'2023-09-23T16:34:27.860' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentDetails] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (26, 1, 2, 3, N'ECB 13-1', 1, NULL, N'12.16.190.31', 80, N'aiplsys', N'ecbsys#987', CAST(390.700 AS Decimal(16, 3)), CAST(20.169586182 AS Decimal(12, 9)), CAST(85.619079590 AS Decimal(12, 9)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2023-09-23T16:34:27.860' AS DateTime), 0, CAST(N'2023-09-23T16:34:27.860' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentDetails] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (27, 1, 2, 3, N'ECB 13-2', 2, NULL, N'12.16.190.32', 80, N'aiplsys', N'ecbsys#987', CAST(390.700 AS Decimal(16, 3)), CAST(20.169460297 AS Decimal(12, 9)), CAST(85.619178772 AS Decimal(12, 9)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2023-09-23T16:34:27.860' AS DateTime), 0, CAST(N'2023-09-23T16:34:27.860' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentDetails] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (28, 1, 2, 3, N'ECB 14-1', 1, NULL, N'12.16.193.31', 80, N'aiplsys', N'ecbsys#987', CAST(393.700 AS Decimal(16, 3)), CAST(20.182796478 AS Decimal(12, 9)), CAST(85.643127441 AS Decimal(12, 9)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2023-09-23T16:34:27.860' AS DateTime), 0, CAST(N'2023-09-23T16:34:27.860' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentDetails] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (29, 1, 2, 3, N'ECB 14-2', 2, NULL, N'12.16.193.32', 80, N'aiplsys', N'ecbsys#987', CAST(393.700 AS Decimal(16, 3)), CAST(20.182739258 AS Decimal(12, 9)), CAST(85.643318176 AS Decimal(12, 9)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2023-09-23T16:34:27.860' AS DateTime), 0, CAST(N'2023-09-23T16:34:27.860' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentDetails] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (30, 1, 2, 3, N'ECB 15-1', 1, NULL, N'12.16.196.31', 80, N'aiplsys', N'ecbsys#987', CAST(396.700 AS Decimal(16, 3)), CAST(20.199689865 AS Decimal(12, 9)), CAST(85.661827087 AS Decimal(12, 9)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2023-09-23T16:34:27.860' AS DateTime), 0, CAST(N'2023-09-23T16:34:27.860' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentDetails] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (31, 1, 2, 3, N'ECB 15-2', 2, NULL, N'12.16.196.32', 80, N'aiplsys', N'ecbsys#987', CAST(396.700 AS Decimal(16, 3)), CAST(20.199573517 AS Decimal(12, 9)), CAST(85.661918640 AS Decimal(12, 9)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2023-09-23T16:34:27.860' AS DateTime), 0, CAST(N'2023-09-23T16:34:27.860' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentDetails] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (32, 1, 2, 3, N'ECB 16-1', 1, NULL, N'12.16.199.31', 80, N'aiplsys', N'ecbsys#987', CAST(399.700 AS Decimal(16, 3)), CAST(20.208751678 AS Decimal(12, 9)), CAST(85.687507629 AS Decimal(12, 9)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2023-09-23T16:34:27.860' AS DateTime), 0, CAST(N'2023-09-23T16:34:27.860' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentDetails] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (33, 1, 2, 3, N'ECB 16-2', 2, NULL, N'12.16.199.32', 80, N'aiplsys', N'ecbsys#987', CAST(399.700 AS Decimal(16, 3)), CAST(20.208566666 AS Decimal(12, 9)), CAST(85.687515259 AS Decimal(12, 9)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2023-09-23T16:34:27.860' AS DateTime), 0, CAST(N'2023-09-23T16:34:27.860' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentDetails] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (34, 1, 2, 3, N'ECB 17-1', 1, NULL, N'12.16.202.31', 80, N'aiplsys', N'ecbsys#987', CAST(402.000 AS Decimal(16, 3)), CAST(20.214525223 AS Decimal(12, 9)), CAST(85.709983826 AS Decimal(12, 9)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2023-09-23T16:34:27.860' AS DateTime), 0, CAST(N'2023-09-23T16:34:27.860' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentDetails] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (35, 1, 2, 3, N'ECB 17-2', 2, NULL, N'12.16.202.32', 80, N'aiplsys', N'ecbsys#987', CAST(402.000 AS Decimal(16, 3)), CAST(20.214410782 AS Decimal(12, 9)), CAST(85.710044861 AS Decimal(12, 9)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2023-09-23T16:34:27.860' AS DateTime), 0, CAST(N'2023-09-23T16:34:27.860' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentDetails] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (36, 1, 2, 3, N'ECB 18-1', 1, NULL, N'12.16.204.31', 80, N'aiplsys', N'ecbsys#987', CAST(404.340 AS Decimal(16, 3)), CAST(20.225492477 AS Decimal(12, 9)), CAST(85.728706360 AS Decimal(12, 9)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2023-09-23T16:34:27.860' AS DateTime), 0, CAST(N'2023-09-23T16:34:27.860' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentDetails] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (37, 1, 2, 3, N'ECB 18-2', 2, NULL, N'12.16.204.32', 80, N'aiplsys', N'ecbsys#987', CAST(404.340 AS Decimal(16, 3)), CAST(20.225008011 AS Decimal(12, 9)), CAST(85.728988647 AS Decimal(12, 9)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2023-09-23T16:34:27.860' AS DateTime), 0, CAST(N'2023-09-23T16:34:27.860' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentDetails] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (38, 1, 2, 3, N'ECB 19-1', 1, NULL, N'12.16.208.31', 80, N'aiplsys', N'ecbsys#987', CAST(408.300 AS Decimal(16, 3)), CAST(20.242761612 AS Decimal(12, 9)), CAST(85.762756348 AS Decimal(12, 9)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2023-09-23T16:34:27.860' AS DateTime), 0, CAST(N'2023-09-23T16:34:27.860' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentDetails] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (39, 1, 2, 3, N'ECB 19-2', 2, NULL, N'12.16.208.32', 80, N'aiplsys', N'ecbsys#987', CAST(408.300 AS Decimal(16, 3)), CAST(20.242559433 AS Decimal(12, 9)), CAST(85.762802124 AS Decimal(12, 9)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2023-09-23T16:34:27.860' AS DateTime), 0, CAST(N'2023-09-23T16:34:27.860' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentDetails] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (40, 1, 2, 3, N'ECB 20-1', 1, NULL, N'12.16.210.31', 80, N'aiplsys', N'ecbsys#987', CAST(410.800 AS Decimal(16, 3)), CAST(20.249370575 AS Decimal(12, 9)), CAST(85.783561707 AS Decimal(12, 9)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2023-09-23T16:34:27.860' AS DateTime), 0, CAST(N'2023-09-23T16:34:27.860' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentDetails] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (41, 1, 2, 3, N'ECB 20-2', 2, NULL, N'12.16.210.32', 80, N'aiplsys', N'ecbsys#987', CAST(410.800 AS Decimal(16, 3)), CAST(20.249315262 AS Decimal(12, 9)), CAST(85.783699036 AS Decimal(12, 9)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2023-09-23T16:34:27.860' AS DateTime), 0, CAST(N'2023-09-23T16:34:27.860' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentDetails] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (42, 1, 32, 2, N'ATCC 1', 2, NULL, N'12.16.175.2', 80, N'aiplsys', N'atcsys#987', CAST(375.320 AS Decimal(16, 3)), CAST(20.054725647 AS Decimal(12, 9)), CAST(85.541061401 AS Decimal(12, 9)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2023-09-23T16:34:27.860' AS DateTime), 0, CAST(N'2023-09-23T16:34:27.860' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentDetails] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (43, 1, 25, 6, N'VIDS 1', 2, NULL, N'12.16.169.6', 80, N'aiplsys', N'vidsys#987', CAST(369.800 AS Decimal(16, 3)), CAST(20.019426346 AS Decimal(12, 9)), CAST(85.504791260 AS Decimal(12, 9)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2023-09-23T16:34:27.860' AS DateTime), 0, CAST(N'2023-09-23T16:34:27.860' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentDetails] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (44, 1, 25, 6, N'VIDS 2', 2, NULL, N'12.16.183.6', 80, N'aiplsys', N'vidsys#987', CAST(383.200 AS Decimal(16, 3)), CAST(20.117118835 AS Decimal(12, 9)), CAST(85.577011108 AS Decimal(12, 9)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2023-09-23T16:34:27.860' AS DateTime), 0, CAST(N'2023-09-23T16:34:27.860' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentDetails] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (45, 1, 25, 6, N'VIDS 3', 2, NULL, N'12.16.189.6', 80, N'aiplsys', N'vidsys#987', CAST(389.350 AS Decimal(16, 3)), CAST(20.161703110 AS Decimal(12, 9)), CAST(85.609367371 AS Decimal(12, 9)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2023-09-23T16:34:27.860' AS DateTime), 0, CAST(N'2023-09-23T16:34:27.860' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentDetails] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (46, 1, 25, 6, N'VIDS 4', 2, NULL, N'12.16.204.6', 80, N'aiplsys', N'vidsys#987', CAST(404.250 AS Decimal(16, 3)), CAST(20.224081039 AS Decimal(12, 9)), CAST(85.726867676 AS Decimal(12, 9)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2023-09-23T16:34:27.860' AS DateTime), 0, CAST(N'2023-09-23T16:34:27.860' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentDetails] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (47, 1, 25, 6, N'VIDS 5', 2, NULL, N'12.16.210.6', 80, N'aiplsys', N'vidsys#987', CAST(410.820 AS Decimal(16, 3)), CAST(20.249319077 AS Decimal(12, 9)), CAST(85.783622742 AS Decimal(12, 9)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2023-09-23T16:34:27.860' AS DateTime), 0, CAST(N'2023-09-23T16:34:27.860' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentDetails] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (48, 1, 25, 6, N'VIDS 6', 2, NULL, N'12.16.213.6', 80, N'aiplsys', N'vidsys#987', CAST(413.035 AS Decimal(16, 3)), CAST(20.267015457 AS Decimal(12, 9)), CAST(85.792175293 AS Decimal(12, 9)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2023-09-23T16:34:27.860' AS DateTime), 0, CAST(N'2023-09-23T16:34:27.860' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentDetails] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (49, 1, 8, 7, N'VMS 1', 2, NULL, N'12.16.157.7', 80, N'aiplsys', N'vmsys#987', CAST(357.700 AS Decimal(16, 3)), CAST(19.950590134 AS Decimal(12, 9)), CAST(85.417213440 AS Decimal(12, 9)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2023-09-23T16:34:27.860' AS DateTime), 0, CAST(N'2023-09-23T16:34:27.860' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentDetails] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (50, 1, 8, 7, N'VMS 2', 2, NULL, N'12.16.196.7', 80, N'aiplsys', N'vmsys#987', CAST(396.750 AS Decimal(16, 3)), CAST(20.200216293 AS Decimal(12, 9)), CAST(85.662673950 AS Decimal(12, 9)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2023-09-23T16:34:27.860' AS DateTime), 0, CAST(N'2023-09-23T16:34:27.860' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentDetails] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (51, 1, 8, 7, N'VMS 3', 2, NULL, N'12.16.206.7', 80, N'aiplsys', N'vmsys#987', CAST(406.680 AS Decimal(16, 3)), CAST(20.236167908 AS Decimal(12, 9)), CAST(85.747848511 AS Decimal(12, 9)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2023-09-23T16:34:27.860' AS DateTime), 0, CAST(N'2023-09-23T16:34:27.860' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentDetails] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (52, 1, 8, 7, N'VMS 4', 2, NULL, N'12.16.210.7', 80, N'aiplsys', N'vmsys#987', CAST(410.800 AS Decimal(16, 3)), CAST(20.249458313 AS Decimal(12, 9)), CAST(85.783691406 AS Decimal(12, 9)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2023-09-23T16:34:27.860' AS DateTime), 0, CAST(N'2023-09-23T16:34:27.860' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentDetails] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (53, 1, 1, 5, N'CCTV 1', 2, NULL, N'12.16.171.5', 80, N'aiplsys', N'ptzsys#987', CAST(371.840 AS Decimal(16, 3)), CAST(20.032810211 AS Decimal(12, 9)), CAST(85.518508911 AS Decimal(12, 9)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2023-09-23T16:34:27.860' AS DateTime), 0, CAST(N'2023-09-23T16:34:27.860' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentDetails] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (54, 1, 1, 5, N'CCTV 2', 2, NULL, N'12.16.177.5', 80, N'aiplsys', N'ptzsys#987', CAST(377.500 AS Decimal(16, 3)), CAST(20.071273804 AS Decimal(12, 9)), CAST(85.553001404 AS Decimal(12, 9)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2023-09-23T16:34:27.860' AS DateTime), 0, CAST(N'2023-09-23T16:34:27.860' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentDetails] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (55, 1, 1, 5, N'CCTV 2', 2, NULL, N'12.16.195.5', 80, N'aiplsys', N'ptzsys#987', CAST(395.800 AS Decimal(16, 3)), CAST(20.195501328 AS Decimal(12, 9)), CAST(85.655364990 AS Decimal(12, 9)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2023-09-23T16:34:27.860' AS DateTime), 0, CAST(N'2023-09-23T16:34:27.860' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentDetails] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (56, 1, 1, 5, N'CCTV 3', 2, NULL, N'12.16.200.5', 80, N'aiplsys', N'ptzsys#987', CAST(400.100 AS Decimal(16, 3)), CAST(20.209032059 AS Decimal(12, 9)), CAST(85.692962646 AS Decimal(12, 9)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2023-09-23T16:34:27.860' AS DateTime), 0, CAST(N'2023-09-23T16:34:27.860' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentDetails] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (57, 1, 1, 5, N'CCTV 4', 2, NULL, N'12.16.208.5', 80, N'aiplsys', N'ptzsys#987', CAST(408.450 AS Decimal(16, 3)), CAST(20.242971420 AS Decimal(12, 9)), CAST(85.764083862 AS Decimal(12, 9)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2023-09-23T16:34:27.860' AS DateTime), 0, CAST(N'2023-09-23T16:34:27.860' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentDetails] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (58, 1, 1, 5, N'CCTV 5', 2, NULL, N'12.16.210.5', 80, N'aiplsys', N'ptzsys#987', CAST(410.000 AS Decimal(16, 3)), CAST(20.244583130 AS Decimal(12, 9)), CAST(85.776367188 AS Decimal(12, 9)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2023-09-23T16:34:27.860' AS DateTime), 0, CAST(N'2023-09-23T16:34:27.860' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentDetails] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (59, 1, 31, 1, N'MRCS 1', 2, NULL, N'12.16.175.1', 80, N'aiplsys', N'ptzsys#987', CAST(375.490 AS Decimal(16, 3)), CAST(20.182695000 AS Decimal(12, 9)), CAST(85.643141000 AS Decimal(12, 9)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2023-09-23T16:34:27.860' AS DateTime), 0, CAST(N'2023-09-23T16:34:27.860' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentDetails] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (60, 1, 4, 9, N'MET 1', 2, NULL, N'12.16.175.9', 80, N'aiplsys', N'ptzsys#987', CAST(375.490 AS Decimal(16, 3)), CAST(20.184065000 AS Decimal(12, 9)), CAST(85.643656000 AS Decimal(12, 9)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2023-09-23T16:34:27.860' AS DateTime), 0, CAST(N'2023-09-23T16:34:27.860' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentDetails] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (63, 1, 28, 3, N'ECB MC-1', 1, NULL, N'12.16.155.28', 80, N'aiplsys', N'ecbsys#987', CAST(355.500 AS Decimal(16, 3)), CAST(19.945352554 AS Decimal(12, 9)), CAST(85.398429871 AS Decimal(12, 9)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2023-10-03T18:47:17.967' AS DateTime), 0, CAST(N'2023-10-03T18:47:17.967' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentDetails] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (64, 1, 28, 3, N'ECB MC-2', 1, NULL, N'12.16.158.28', 80, N'aiplsys', N'ecbsys#987', CAST(358.600 AS Decimal(16, 3)), CAST(19.957071304 AS Decimal(12, 9)), CAST(85.424407959 AS Decimal(12, 9)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2023-10-03T18:47:17.967' AS DateTime), 0, CAST(N'2023-10-03T18:47:17.967' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentDetails] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (65, 1, 28, 3, N'ECB MC-3', 1, NULL, N'12.16.161.28', 80, N'aiplsys', N'ecbsys#987', CAST(361.100 AS Decimal(16, 3)), CAST(19.971357346 AS Decimal(12, 9)), CAST(85.441162109 AS Decimal(12, 9)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2023-10-03T18:47:17.967' AS DateTime), 0, CAST(N'2023-10-03T18:47:17.967' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentDetails] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (66, 1, 28, 3, N'ECB MC-4', 1, NULL, N'12.16.164.28', 80, N'aiplsys', N'ecbsys#987', CAST(364.000 AS Decimal(16, 3)), CAST(19.985450745 AS Decimal(12, 9)), CAST(85.465400696 AS Decimal(12, 9)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2023-10-03T18:47:17.967' AS DateTime), 0, CAST(N'2023-10-03T18:47:17.967' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentDetails] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (67, 1, 28, 3, N'ECB MC-5', 1, NULL, N'12.16.166.28', 80, N'aiplsys', N'ecbsys#987', CAST(366.800 AS Decimal(16, 3)), CAST(20.002422333 AS Decimal(12, 9)), CAST(85.483177185 AS Decimal(12, 9)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2023-10-03T18:47:17.967' AS DateTime), 0, CAST(N'2023-10-03T18:47:17.967' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentDetails] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (68, 1, 28, 3, N'ECB MC-6', 1, NULL, N'12.16.169.28', 80, N'aiplsys', N'ecbsys#987', CAST(369.150 AS Decimal(16, 3)), CAST(20.015665054 AS Decimal(12, 9)), CAST(85.500328064 AS Decimal(12, 9)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2023-10-03T18:47:17.967' AS DateTime), 0, CAST(N'2023-10-03T18:47:17.967' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentDetails] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (69, 1, 28, 3, N'ECB MC-7', 1, NULL, N'12.16.172.28', 80, N'aiplsys', N'ecbsys#987', CAST(372.500 AS Decimal(16, 3)), CAST(20.036985397 AS Decimal(12, 9)), CAST(85.522834778 AS Decimal(12, 9)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2023-10-03T18:47:17.967' AS DateTime), 0, CAST(N'2023-10-03T18:47:17.967' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentDetails] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (70, 1, 28, 3, N'ECB MC-8', 1, NULL, N'12.16.174.28', 80, N'aiplsys', N'ecbsys#987', CAST(374.300 AS Decimal(16, 3)), CAST(20.048826218 AS Decimal(12, 9)), CAST(85.534248352 AS Decimal(12, 9)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2023-10-03T18:47:17.967' AS DateTime), 0, CAST(N'2023-10-03T18:47:17.967' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentDetails] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (71, 1, 28, 3, N'ECB MC-9', 1, NULL, N'12.16.177.28', 80, N'aiplsys', N'ecbsys#987', CAST(377.740 AS Decimal(16, 3)), CAST(20.073381424 AS Decimal(12, 9)), CAST(85.554504395 AS Decimal(12, 9)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2023-10-03T18:47:17.967' AS DateTime), 0, CAST(N'2023-10-03T18:47:17.967' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentDetails] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (72, 1, 28, 3, N'ECB MC-10', 1, NULL, N'12.16.179.28', 80, N'aiplsys', N'ecbsys#987', CAST(379.790 AS Decimal(16, 3)), CAST(20.089458466 AS Decimal(12, 9)), CAST(85.566719055 AS Decimal(12, 9)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2023-10-03T18:47:17.967' AS DateTime), 0, CAST(N'2023-10-03T18:47:17.967' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentDetails] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (73, 1, 28, 3, N'ECB MC-11', 1, NULL, N'12.16.183.28', 80, N'aiplsys', N'ecbsys#987', CAST(383.060 AS Decimal(16, 3)), CAST(20.115041733 AS Decimal(12, 9)), CAST(85.577079773 AS Decimal(12, 9)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2023-10-03T18:47:17.967' AS DateTime), 0, CAST(N'2023-10-03T18:47:17.967' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentDetails] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (74, 1, 28, 3, N'ECB MC-12', 1, NULL, N'12.16.187.28', 80, N'aiplsys', N'ecbsys#987', CAST(387.700 AS Decimal(16, 3)), CAST(20.149215698 AS Decimal(12, 9)), CAST(85.601051331 AS Decimal(12, 9)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2023-10-03T18:47:17.967' AS DateTime), 0, CAST(N'2023-10-03T18:47:17.967' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentDetails] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (75, 1, 28, 3, N'ECB MC-13', 1, NULL, N'12.16.190.28', 80, N'aiplsys', N'ecbsys#987', CAST(390.700 AS Decimal(16, 3)), CAST(20.169586182 AS Decimal(12, 9)), CAST(85.619079590 AS Decimal(12, 9)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2023-10-03T18:47:17.967' AS DateTime), 0, CAST(N'2023-10-03T18:47:17.967' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentDetails] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (76, 1, 28, 3, N'ECB MC-14', 1, NULL, N'12.16.193.28', 80, N'aiplsys', N'ecbsys#987', CAST(393.700 AS Decimal(16, 3)), CAST(20.182796478 AS Decimal(12, 9)), CAST(85.643127441 AS Decimal(12, 9)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2023-10-03T18:47:17.967' AS DateTime), 0, CAST(N'2023-10-03T18:47:17.967' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentDetails] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (77, 1, 28, 3, N'ECB MC-15', 1, NULL, N'12.16.196.28', 80, N'aiplsys', N'ecbsys#987', CAST(396.700 AS Decimal(16, 3)), CAST(20.199689865 AS Decimal(12, 9)), CAST(85.661827087 AS Decimal(12, 9)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2023-10-03T18:47:17.967' AS DateTime), 0, CAST(N'2023-10-03T18:47:17.967' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentDetails] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (78, 1, 28, 3, N'ECB MC-16', 1, NULL, N'12.16.199.28', 80, N'aiplsys', N'ecbsys#987', CAST(399.700 AS Decimal(16, 3)), CAST(20.208751678 AS Decimal(12, 9)), CAST(85.687507629 AS Decimal(12, 9)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2023-10-03T18:47:17.967' AS DateTime), 0, CAST(N'2023-10-03T18:47:17.967' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentDetails] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (79, 1, 28, 3, N'ECB MC-17', 1, NULL, N'12.16.202.28', 80, N'aiplsys', N'ecbsys#987', CAST(402.000 AS Decimal(16, 3)), CAST(20.214525223 AS Decimal(12, 9)), CAST(85.709983826 AS Decimal(12, 9)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2023-10-03T18:47:17.967' AS DateTime), 0, CAST(N'2023-10-03T18:47:17.967' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentDetails] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (80, 1, 28, 3, N'ECB MC-18', 1, NULL, N'12.16.204.28', 80, N'aiplsys', N'ecbsys#987', CAST(404.340 AS Decimal(16, 3)), CAST(20.225492477 AS Decimal(12, 9)), CAST(85.728706360 AS Decimal(12, 9)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2023-10-03T18:47:17.967' AS DateTime), 0, CAST(N'2023-10-03T18:47:17.967' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentDetails] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (81, 1, 28, 3, N'ECB MC-19', 1, NULL, N'12.16.208.28', 80, N'aiplsys', N'ecbsys#987', CAST(408.300 AS Decimal(16, 3)), CAST(20.242761612 AS Decimal(12, 9)), CAST(85.762756348 AS Decimal(12, 9)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2023-10-03T18:47:17.967' AS DateTime), 0, CAST(N'2023-10-03T18:47:17.967' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentDetails] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (82, 1, 28, 3, N'ECB MC-20', 1, NULL, N'12.16.210.28', 80, N'aiplsys', N'ecbsys#987', CAST(410.800 AS Decimal(16, 3)), CAST(20.249370575 AS Decimal(12, 9)), CAST(85.783561707 AS Decimal(12, 9)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2023-10-03T18:47:17.967' AS DateTime), 0, CAST(N'2023-10-03T18:47:17.967' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentDetails] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (83, 1, 28, 2, N'ATCC MC-1', 1, NULL, N'12.16.175.28', 80, N'aiplsys', N'ecbsys#987', CAST(375.320 AS Decimal(16, 3)), CAST(20.054725647 AS Decimal(12, 9)), CAST(85.541061401 AS Decimal(12, 9)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2023-10-03T18:47:17.967' AS DateTime), 0, CAST(N'2023-10-03T18:47:17.967' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentDetails] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (84, 1, 28, 6, N'VIDS MC-1', 1, NULL, N'12.16.169.28', 80, N'aiplsys', N'ecbsys#987', CAST(369.800 AS Decimal(16, 3)), CAST(20.019426346 AS Decimal(12, 9)), CAST(85.504791260 AS Decimal(12, 9)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2023-10-03T18:47:17.967' AS DateTime), 0, CAST(N'2023-10-03T18:47:17.967' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentDetails] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (85, 1, 28, 6, N'VIDS MC-2', 1, NULL, N'12.16.183.28', 80, N'aiplsys', N'ecbsys#987', CAST(383.200 AS Decimal(16, 3)), CAST(20.117118835 AS Decimal(12, 9)), CAST(85.577011108 AS Decimal(12, 9)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2023-10-03T18:47:17.967' AS DateTime), 0, CAST(N'2023-10-03T18:47:17.967' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentDetails] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (86, 1, 28, 6, N'VIDS MC-3', 1, NULL, N'12.16.189.28', 80, N'aiplsys', N'ecbsys#987', CAST(389.350 AS Decimal(16, 3)), CAST(20.161703110 AS Decimal(12, 9)), CAST(85.609367371 AS Decimal(12, 9)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2023-10-03T18:47:17.967' AS DateTime), 0, CAST(N'2023-10-03T18:47:17.967' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentDetails] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (87, 1, 28, 6, N'VIDS MC-4', 1, NULL, N'12.16.204.28', 80, N'aiplsys', N'ecbsys#987', CAST(404.250 AS Decimal(16, 3)), CAST(20.224081039 AS Decimal(12, 9)), CAST(85.726867676 AS Decimal(12, 9)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2023-10-03T18:47:17.967' AS DateTime), 0, CAST(N'2023-10-03T18:47:17.967' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentDetails] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (88, 1, 28, 6, N'VIDS MC-5', 1, NULL, N'12.16.210.28', 80, N'aiplsys', N'ecbsys#987', CAST(410.820 AS Decimal(16, 3)), CAST(20.249319077 AS Decimal(12, 9)), CAST(85.783622742 AS Decimal(12, 9)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2023-10-03T18:47:17.967' AS DateTime), 0, CAST(N'2023-10-03T18:47:17.967' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentDetails] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (89, 1, 28, 6, N'VIDS MC-6', 1, NULL, N'12.16.213.28', 80, N'aiplsys', N'ecbsys#987', CAST(413.035 AS Decimal(16, 3)), CAST(20.267015457 AS Decimal(12, 9)), CAST(85.792175293 AS Decimal(12, 9)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2023-10-03T18:47:17.967' AS DateTime), 0, CAST(N'2023-10-03T18:47:17.967' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentDetails] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (90, 1, 28, 7, N'VMS MC-1', 2, NULL, N'12.16.157.28', 80, N'aiplsys', N'ecbsys#987', CAST(357.700 AS Decimal(16, 3)), CAST(19.950590134 AS Decimal(12, 9)), CAST(85.417213440 AS Decimal(12, 9)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2023-10-03T18:47:17.967' AS DateTime), 0, CAST(N'2023-10-03T18:47:17.967' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentDetails] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (91, 1, 28, 7, N'VMS MC-2', 2, NULL, N'12.16.196.28', 80, N'aiplsys', N'ecbsys#987', CAST(396.750 AS Decimal(16, 3)), CAST(20.200216293 AS Decimal(12, 9)), CAST(85.662673950 AS Decimal(12, 9)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2023-10-03T18:47:17.967' AS DateTime), 0, CAST(N'2023-10-03T18:47:17.967' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentDetails] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (92, 1, 28, 7, N'VMS MC-3', 2, NULL, N'12.16.206.28', 80, N'aiplsys', N'ecbsys#987', CAST(406.680 AS Decimal(16, 3)), CAST(20.236167908 AS Decimal(12, 9)), CAST(85.747848511 AS Decimal(12, 9)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2023-10-03T18:47:17.967' AS DateTime), 0, CAST(N'2023-10-03T18:47:17.967' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentDetails] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (93, 1, 28, 7, N'VMS MC-4', 2, NULL, N'12.16.210.28', 80, N'aiplsys', N'ecbsys#987', CAST(410.800 AS Decimal(16, 3)), CAST(20.249458313 AS Decimal(12, 9)), CAST(85.783691406 AS Decimal(12, 9)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2023-10-03T18:47:17.967' AS DateTime), 0, CAST(N'2023-10-03T18:47:17.967' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentDetails] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (94, 1, 28, 5, N'CCTV MC-1', 2, NULL, N'12.16.171.28', 80, N'aiplsys', N'ecbsys#987', CAST(371.840 AS Decimal(16, 3)), CAST(20.032810211 AS Decimal(12, 9)), CAST(85.518508911 AS Decimal(12, 9)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2023-10-03T18:47:17.967' AS DateTime), 0, CAST(N'2023-10-03T18:47:17.967' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentDetails] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (95, 1, 28, 5, N'CCTV MC-2', 2, NULL, N'12.16.177.28', 80, N'aiplsys', N'ecbsys#987', CAST(377.500 AS Decimal(16, 3)), CAST(20.071273804 AS Decimal(12, 9)), CAST(85.553001404 AS Decimal(12, 9)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2023-10-03T18:47:17.967' AS DateTime), 0, CAST(N'2023-10-03T18:47:17.967' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentDetails] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (96, 1, 28, 5, N'CCTV MC-3', 2, NULL, N'12.16.195.28', 80, N'aiplsys', N'ecbsys#987', CAST(395.800 AS Decimal(16, 3)), CAST(20.195501328 AS Decimal(12, 9)), CAST(85.655364990 AS Decimal(12, 9)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2023-10-03T18:47:17.967' AS DateTime), 0, CAST(N'2023-10-03T18:47:17.967' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentDetails] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (97, 1, 28, 5, N'CCTV MC-4', 2, NULL, N'12.16.200.28', 80, N'aiplsys', N'ecbsys#987', CAST(400.100 AS Decimal(16, 3)), CAST(20.209032059 AS Decimal(12, 9)), CAST(85.692962646 AS Decimal(12, 9)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2023-10-03T18:47:17.967' AS DateTime), 0, CAST(N'2023-10-03T18:47:17.967' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentDetails] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (98, 1, 28, 5, N'CCTV MC-5', 2, NULL, N'12.16.208.28', 80, N'aiplsys', N'ecbsys#987', CAST(408.450 AS Decimal(16, 3)), CAST(20.242971420 AS Decimal(12, 9)), CAST(85.764083862 AS Decimal(12, 9)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2023-10-03T18:47:17.967' AS DateTime), 0, CAST(N'2023-10-03T18:47:17.967' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentDetails] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (99, 1, 28, 5, N'CCTV MC-6', 2, NULL, N'12.16.210.28', 80, N'aiplsys', N'ecbsys#987', CAST(410.000 AS Decimal(16, 3)), CAST(20.244583130 AS Decimal(12, 9)), CAST(85.776367188 AS Decimal(12, 9)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2023-10-03T18:47:17.967' AS DateTime), 0, CAST(N'2023-10-03T18:47:17.967' AS DateTime), 0)
GO
SET IDENTITY_INSERT [dbo].[tbl_EquipmentDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_EquipmentTypeMaster] ON 
GO
INSERT [dbo].[tbl_EquipmentTypeMaster] ([EquipmentTypeId], [EquipmentTypeName], [EquipmentCategoryTypeId], [EquipmentConnectionTypeId], [EquipmentIconName], [EquipmentLevel], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (1, N'PTZ Camera', 1, 1, NULL, 3, 1, CAST(N'2022-01-14T23:13:24.977' AS DateTime), 0, CAST(N'2022-01-14T23:13:24.977' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentTypeMaster] ([EquipmentTypeId], [EquipmentTypeName], [EquipmentCategoryTypeId], [EquipmentConnectionTypeId], [EquipmentIconName], [EquipmentLevel], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (2, N'ECB', 1, 1, NULL, 3, 1, CAST(N'2022-01-14T23:14:14.230' AS DateTime), 0, CAST(N'2022-01-14T23:14:14.230' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentTypeMaster] ([EquipmentTypeId], [EquipmentTypeName], [EquipmentCategoryTypeId], [EquipmentConnectionTypeId], [EquipmentIconName], [EquipmentLevel], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (3, N'LPU', 1, 1, NULL, 2, 1, CAST(N'2022-01-14T23:14:25.050' AS DateTime), 0, CAST(N'2022-01-14T23:14:25.050' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentTypeMaster] ([EquipmentTypeId], [EquipmentTypeName], [EquipmentCategoryTypeId], [EquipmentConnectionTypeId], [EquipmentIconName], [EquipmentLevel], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (4, N'MET', 1, 1, NULL, 3, 1, CAST(N'2022-01-14T23:14:29.773' AS DateTime), 0, CAST(N'2022-01-14T23:14:29.773' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentTypeMaster] ([EquipmentTypeId], [EquipmentTypeName], [EquipmentCategoryTypeId], [EquipmentConnectionTypeId], [EquipmentIconName], [EquipmentLevel], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (5, N'Radar', 1, 1, NULL, 3, 1, CAST(N'2022-01-14T23:14:40.693' AS DateTime), 0, CAST(N'2022-01-14T23:14:40.693' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentTypeMaster] ([EquipmentTypeId], [EquipmentTypeName], [EquipmentCategoryTypeId], [EquipmentConnectionTypeId], [EquipmentIconName], [EquipmentLevel], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (6, N'Sensor', 1, 1, NULL, 3, 0, CAST(N'2022-01-14T23:14:46.063' AS DateTime), 0, CAST(N'2022-01-14T23:14:46.063' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentTypeMaster] ([EquipmentTypeId], [EquipmentTypeName], [EquipmentCategoryTypeId], [EquipmentConnectionTypeId], [EquipmentIconName], [EquipmentLevel], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (7, N'Speed Display', 1, 1, NULL, 3, 1, CAST(N'2022-01-14T23:14:51.997' AS DateTime), 0, CAST(N'2022-01-14T23:14:51.997' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentTypeMaster] ([EquipmentTypeId], [EquipmentTypeName], [EquipmentCategoryTypeId], [EquipmentConnectionTypeId], [EquipmentIconName], [EquipmentLevel], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (8, N'VMS', 1, 1, NULL, 3, 1, CAST(N'2022-01-14T23:14:54.837' AS DateTime), 0, CAST(N'2022-01-14T23:14:54.837' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentTypeMaster] ([EquipmentTypeId], [EquipmentTypeName], [EquipmentCategoryTypeId], [EquipmentConnectionTypeId], [EquipmentIconName], [EquipmentLevel], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (9, N'Light', 1, 3, NULL, 4, 0, CAST(N'2022-01-14T23:15:02.623' AS DateTime), 0, CAST(N'2022-01-14T23:15:02.623' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentTypeMaster] ([EquipmentTypeId], [EquipmentTypeName], [EquipmentCategoryTypeId], [EquipmentConnectionTypeId], [EquipmentIconName], [EquipmentLevel], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (10, N'Blinker', 1, 1, NULL, 4, 0, CAST(N'2022-01-14T23:15:07.100' AS DateTime), 0, CAST(N'2022-01-14T23:15:07.100' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentTypeMaster] ([EquipmentTypeId], [EquipmentTypeName], [EquipmentCategoryTypeId], [EquipmentConnectionTypeId], [EquipmentIconName], [EquipmentLevel], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (11, N'Data Storage', 2, 3, NULL, 2, 0, CAST(N'2022-01-14T23:15:11.313' AS DateTime), 0, CAST(N'2022-01-14T23:15:11.313' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentTypeMaster] ([EquipmentTypeId], [EquipmentTypeName], [EquipmentCategoryTypeId], [EquipmentConnectionTypeId], [EquipmentIconName], [EquipmentLevel], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (12, N'IP Phone', 2, 1, NULL, 2, 0, CAST(N'2022-01-14T23:15:17.223' AS DateTime), 0, CAST(N'2022-01-14T23:15:17.223' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentTypeMaster] ([EquipmentTypeId], [EquipmentTypeName], [EquipmentCategoryTypeId], [EquipmentConnectionTypeId], [EquipmentIconName], [EquipmentLevel], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (13, N'Joy Stick', 2, 1, NULL, 2, 1, CAST(N'2022-01-14T23:15:28.973' AS DateTime), 0, CAST(N'2022-01-14T23:15:28.973' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentTypeMaster] ([EquipmentTypeId], [EquipmentTypeName], [EquipmentCategoryTypeId], [EquipmentConnectionTypeId], [EquipmentIconName], [EquipmentLevel], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (14, N'Server', 2, 1, NULL, 2, 1, CAST(N'2022-01-14T23:15:53.723' AS DateTime), 0, CAST(N'2022-01-14T23:15:53.723' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentTypeMaster] ([EquipmentTypeId], [EquipmentTypeName], [EquipmentCategoryTypeId], [EquipmentConnectionTypeId], [EquipmentIconName], [EquipmentLevel], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (15, N'Video Wall', 2, 1, NULL, 2, 0, CAST(N'2022-01-14T23:15:56.897' AS DateTime), 0, CAST(N'2022-01-14T23:15:56.897' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentTypeMaster] ([EquipmentTypeId], [EquipmentTypeName], [EquipmentCategoryTypeId], [EquipmentConnectionTypeId], [EquipmentIconName], [EquipmentLevel], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (16, N'Work Station', 2, 1, NULL, 3, 1, CAST(N'2022-01-14T23:16:00.003' AS DateTime), 0, CAST(N'2022-01-14T23:16:00.003' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentTypeMaster] ([EquipmentTypeId], [EquipmentTypeName], [EquipmentCategoryTypeId], [EquipmentConnectionTypeId], [EquipmentIconName], [EquipmentLevel], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (17, N'Network Switch', 3, 1, NULL, 1, 1, CAST(N'2022-01-14T23:16:11.100' AS DateTime), 0, CAST(N'2022-01-14T23:16:11.100' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentTypeMaster] ([EquipmentTypeId], [EquipmentTypeName], [EquipmentCategoryTypeId], [EquipmentConnectionTypeId], [EquipmentIconName], [EquipmentLevel], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (18, N'Tablet', 1, 3, NULL, 3, 0, CAST(N'2022-01-14T23:16:23.103' AS DateTime), 0, CAST(N'2022-01-14T23:16:23.103' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentTypeMaster] ([EquipmentTypeId], [EquipmentTypeName], [EquipmentCategoryTypeId], [EquipmentConnectionTypeId], [EquipmentIconName], [EquipmentLevel], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (19, N'UPS', 4, 3, NULL, 1, 0, CAST(N'2022-01-16T21:35:13.517' AS DateTime), 0, CAST(N'2022-01-16T21:35:13.517' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentTypeMaster] ([EquipmentTypeId], [EquipmentTypeName], [EquipmentCategoryTypeId], [EquipmentConnectionTypeId], [EquipmentIconName], [EquipmentLevel], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (20, N'Hooter Alarm with Beacon', 1, 1, NULL, 3, 0, CAST(N'2022-02-04T15:53:10.700' AS DateTime), 0, CAST(N'2022-02-04T15:53:10.700' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentTypeMaster] ([EquipmentTypeId], [EquipmentTypeName], [EquipmentCategoryTypeId], [EquipmentConnectionTypeId], [EquipmentIconName], [EquipmentLevel], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (21, N'GPS Device', 1, 3, NULL, 3, 0, CAST(N'2022-03-19T17:27:59.037' AS DateTime), 0, CAST(N'2022-03-19T17:27:59.037' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentTypeMaster] ([EquipmentTypeId], [EquipmentTypeName], [EquipmentCategoryTypeId], [EquipmentConnectionTypeId], [EquipmentIconName], [EquipmentLevel], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (22, N'Body Cam', 1, 3, NULL, 3, 0, CAST(N'2022-03-19T17:28:27.350' AS DateTime), 0, CAST(N'2022-03-19T17:28:27.350' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentTypeMaster] ([EquipmentTypeId], [EquipmentTypeName], [EquipmentCategoryTypeId], [EquipmentConnectionTypeId], [EquipmentIconName], [EquipmentLevel], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (23, N'Dash Cam', 1, 3, NULL, 3, 0, CAST(N'2022-03-19T17:28:36.553' AS DateTime), 0, CAST(N'2022-03-19T17:28:36.553' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentTypeMaster] ([EquipmentTypeId], [EquipmentTypeName], [EquipmentCategoryTypeId], [EquipmentConnectionTypeId], [EquipmentIconName], [EquipmentLevel], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (24, N'Other', 3, 3, NULL, 4, 1, CAST(N'2022-03-19T17:28:46.037' AS DateTime), 0, CAST(N'2022-03-19T17:28:46.037' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentTypeMaster] ([EquipmentTypeId], [EquipmentTypeName], [EquipmentCategoryTypeId], [EquipmentConnectionTypeId], [EquipmentIconName], [EquipmentLevel], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (25, N'VIDS Camera', 1, 1, NULL, 3, 1, CAST(N'2022-04-16T11:36:34.280' AS DateTime), 0, CAST(N'2022-04-16T11:36:34.280' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentTypeMaster] ([EquipmentTypeId], [EquipmentTypeName], [EquipmentCategoryTypeId], [EquipmentConnectionTypeId], [EquipmentIconName], [EquipmentLevel], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (26, N'ANPR Camera', 1, 1, NULL, 3, 1, CAST(N'2022-04-16T11:36:43.387' AS DateTime), 0, CAST(N'2022-04-16T11:36:43.387' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentTypeMaster] ([EquipmentTypeId], [EquipmentTypeName], [EquipmentCategoryTypeId], [EquipmentConnectionTypeId], [EquipmentIconName], [EquipmentLevel], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (27, N'Motion Detection Camera', 1, 1, NULL, 3, 1, CAST(N'2022-04-16T11:37:43.030' AS DateTime), 0, CAST(N'2022-04-16T11:37:43.030' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentTypeMaster] ([EquipmentTypeId], [EquipmentTypeName], [EquipmentCategoryTypeId], [EquipmentConnectionTypeId], [EquipmentIconName], [EquipmentLevel], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (28, N'Media Converter', 3, 1, NULL, 1, 1, CAST(N'2022-07-21T20:04:01.707' AS DateTime), 0, CAST(N'2022-07-21T20:04:01.707' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentTypeMaster] ([EquipmentTypeId], [EquipmentTypeName], [EquipmentCategoryTypeId], [EquipmentConnectionTypeId], [EquipmentIconName], [EquipmentLevel], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (29, N'Vehicle Front Camera', 1, 1, NULL, 3, 0, CAST(N'2022-07-21T20:04:01.707' AS DateTime), 0, CAST(N'2022-07-21T20:04:01.707' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentTypeMaster] ([EquipmentTypeId], [EquipmentTypeName], [EquipmentCategoryTypeId], [EquipmentConnectionTypeId], [EquipmentIconName], [EquipmentLevel], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (30, N'Vehicle Rear Camera', 1, 1, NULL, 3, 0, CAST(N'2022-07-21T20:04:01.707' AS DateTime), 0, CAST(N'2022-07-21T20:04:01.707' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentTypeMaster] ([EquipmentTypeId], [EquipmentTypeName], [EquipmentCategoryTypeId], [EquipmentConnectionTypeId], [EquipmentIconName], [EquipmentLevel], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (31, N'MRCS', 1, 1, NULL, 1, 1, CAST(N'2023-06-19T23:41:10.913' AS DateTime), 0, CAST(N'2023-06-19T23:41:10.913' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentTypeMaster] ([EquipmentTypeId], [EquipmentTypeName], [EquipmentCategoryTypeId], [EquipmentConnectionTypeId], [EquipmentIconName], [EquipmentLevel], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (32, N'ATCC Camera', 1, 1, NULL, 3, 1, CAST(N'2023-06-19T23:41:44.013' AS DateTime), 0, CAST(N'2023-06-19T23:41:44.013' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentTypeMaster] ([EquipmentTypeId], [EquipmentTypeName], [EquipmentCategoryTypeId], [EquipmentConnectionTypeId], [EquipmentIconName], [EquipmentLevel], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (33, N'Printer', 2, 1, NULL, 1, 1, CAST(N'2023-06-19T23:42:17.457' AS DateTime), 0, CAST(N'2023-06-19T23:42:17.457' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentTypeMaster] ([EquipmentTypeId], [EquipmentTypeName], [EquipmentCategoryTypeId], [EquipmentConnectionTypeId], [EquipmentIconName], [EquipmentLevel], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (34, N'NVR', 2, 1, NULL, 1, 1, CAST(N'2023-06-19T23:42:45.433' AS DateTime), 0, CAST(N'2023-06-19T23:42:45.433' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentTypeMaster] ([EquipmentTypeId], [EquipmentTypeName], [EquipmentCategoryTypeId], [EquipmentConnectionTypeId], [EquipmentIconName], [EquipmentLevel], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (35, N'Firewall/Router', 2, 1, NULL, 0, 1, CAST(N'2023-06-19T23:42:54.540' AS DateTime), 0, CAST(N'2023-06-19T23:42:54.540' AS DateTime), 0)
GO
SET IDENTITY_INSERT [dbo].[tbl_EquipmentTypeMaster] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_EventsTypeMaster] ON 
GO
INSERT [dbo].[tbl_EventsTypeMaster] ([EventTypeId], [EventTypeName], [EventsRequired], [ReviewRequired], [ChallanTypeId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (0, N'False Event', 0, 0, 0, 0, 1, CAST(N'2023-07-26T17:35:03.363' AS DateTime), 0, CAST(N'2023-07-26T17:35:03.363' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EventsTypeMaster] ([EventTypeId], [EventTypeName], [EventsRequired], [ReviewRequired], [ChallanTypeId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (1, N'Stop Vehicle', 1, 1, 5, 6, 1, CAST(N'2023-07-26T17:35:05.083' AS DateTime), 0, CAST(N'2023-07-26T17:35:05.083' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EventsTypeMaster] ([EventTypeId], [EventTypeName], [EventsRequired], [ReviewRequired], [ChallanTypeId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (2, N'Congestion', 1, 0, 0, 6, 1, CAST(N'2023-07-26T17:35:05.083' AS DateTime), 0, CAST(N'2023-07-26T17:35:05.083' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EventsTypeMaster] ([EventTypeId], [EventTypeName], [EventsRequired], [ReviewRequired], [ChallanTypeId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (3, N'Wrong Direction', 1, 1, 6, 6, 1, CAST(N'2023-07-26T17:35:05.083' AS DateTime), 0, CAST(N'2023-07-26T17:35:05.083' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EventsTypeMaster] ([EventTypeId], [EventTypeName], [EventsRequired], [ReviewRequired], [ChallanTypeId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (4, N'Fast Moving', 1, 0, 0, 6, 1, CAST(N'2023-07-26T17:35:05.083' AS DateTime), 0, CAST(N'2023-07-26T17:35:05.083' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EventsTypeMaster] ([EventTypeId], [EventTypeName], [EventsRequired], [ReviewRequired], [ChallanTypeId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (5, N'Slow Moving', 1, 0, 0, 6, 1, CAST(N'2023-07-26T17:35:05.083' AS DateTime), 0, CAST(N'2023-07-26T17:35:05.083' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EventsTypeMaster] ([EventTypeId], [EventTypeName], [EventsRequired], [ReviewRequired], [ChallanTypeId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (6, N'Fog/smoke', 1, 0, 0, 6, 1, CAST(N'2023-07-26T17:35:05.083' AS DateTime), 0, CAST(N'2023-07-26T17:35:05.083' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EventsTypeMaster] ([EventTypeId], [EventTypeName], [EventsRequired], [ReviewRequired], [ChallanTypeId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (7, N'Fire', 1, 0, 0, 6, 1, CAST(N'2023-07-26T17:35:05.083' AS DateTime), 0, CAST(N'2023-07-26T17:35:05.083' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EventsTypeMaster] ([EventTypeId], [EventTypeName], [EventsRequired], [ReviewRequired], [ChallanTypeId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (8, N'Fallen Object', 1, 0, 0, 6, 1, CAST(N'2023-07-26T17:35:05.083' AS DateTime), 0, CAST(N'2023-07-26T17:35:05.083' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EventsTypeMaster] ([EventTypeId], [EventTypeName], [EventsRequired], [ReviewRequired], [ChallanTypeId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (9, N'Human Detected', 1, 0, 0, 6, 1, CAST(N'2023-07-26T17:35:05.083' AS DateTime), 0, CAST(N'2023-07-26T17:35:05.083' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EventsTypeMaster] ([EventTypeId], [EventTypeName], [EventsRequired], [ReviewRequired], [ChallanTypeId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (10, N'Human Crossing Road', 1, 0, 0, 6, 1, CAST(N'2023-07-26T17:35:05.083' AS DateTime), 0, CAST(N'2023-07-26T17:35:05.083' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EventsTypeMaster] ([EventTypeId], [EventTypeName], [EventsRequired], [ReviewRequired], [ChallanTypeId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (11, N'Lane Changed', 1, 1, 3, 6, 1, CAST(N'2023-07-26T17:35:05.083' AS DateTime), 0, CAST(N'2023-07-26T17:35:05.083' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EventsTypeMaster] ([EventTypeId], [EventTypeName], [EventsRequired], [ReviewRequired], [ChallanTypeId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (12, N'Overspeed', 1, 1, 1, 8, 1, CAST(N'2023-09-09T13:20:41.063' AS DateTime), 0, CAST(N'2023-09-09T13:20:41.063' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EventsTypeMaster] ([EventTypeId], [EventTypeName], [EventsRequired], [ReviewRequired], [ChallanTypeId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (13, N'Lane Overspeed', 1, 1, 0, 8, 1, CAST(N'2023-09-09T13:20:47.310' AS DateTime), 0, CAST(N'2023-09-09T13:20:47.310' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EventsTypeMaster] ([EventTypeId], [EventTypeName], [EventsRequired], [ReviewRequired], [ChallanTypeId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (14, N'Restricted Vehicles', 1, 1, 0, 8, 1, CAST(N'2023-09-09T13:20:52.517' AS DateTime), 0, CAST(N'2023-09-09T13:20:52.517' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EventsTypeMaster] ([EventTypeId], [EventTypeName], [EventsRequired], [ReviewRequired], [ChallanTypeId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (15, N'Wrong Direction', 1, 1, 0, 8, 1, CAST(N'2023-09-09T13:21:47.013' AS DateTime), 0, CAST(N'2023-09-09T13:21:47.013' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EventsTypeMaster] ([EventTypeId], [EventTypeName], [EventsRequired], [ReviewRequired], [ChallanTypeId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (16, N'Restricted Vehicles', 1, 0, 0, 6, 1, CAST(N'2023-09-09T13:21:58.383' AS DateTime), 0, CAST(N'2023-09-09T13:21:58.383' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EventsTypeMaster] ([EventTypeId], [EventTypeName], [EventsRequired], [ReviewRequired], [ChallanTypeId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (17, N'Wrong Lane Driving', 1, 1, 0, 8, 1, CAST(N'2023-09-09T13:23:51.777' AS DateTime), 0, CAST(N'2023-09-09T13:23:51.777' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EventsTypeMaster] ([EventTypeId], [EventTypeName], [EventsRequired], [ReviewRequired], [ChallanTypeId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (18, N'ANPR', 1, 0, 0, 8, 1, CAST(N'2023-09-10T12:41:38.817' AS DateTime), 0, CAST(N'2023-09-10T12:41:38.817' AS DateTime), 0)
GO
SET IDENTITY_INSERT [dbo].[tbl_EventsTypeMaster] OFF
GO
INSERT [dbo].[tbl_IncidentActionHistory] ([IncidentId], [ActionImagePath], [ActionVideoPath], [ActionAudioPath], [AssignedToId], [ActionTakenById], [ActionTakenRemark], [ActionTakenDateTime], [ActionStatusId], [DataSendStatus], [MediaSendStatus]) VALUES (N'TMCS-202307191622512330', N'\IMS\19Jul2023\IncidentImage\c60c1634-1aff-4540-b4cd-5d972bd96d2e.jpeg', N'', N'', NULL, 0, N'New incident created', CAST(N'2023-07-20T13:27:10.990' AS DateTime), 1, 0, 0)
GO
INSERT [dbo].[tbl_IncidentActionHistory] ([IncidentId], [ActionImagePath], [ActionVideoPath], [ActionAudioPath], [AssignedToId], [ActionTakenById], [ActionTakenRemark], [ActionTakenDateTime], [ActionStatusId], [DataSendStatus], [MediaSendStatus]) VALUES (N'TMCS-202307191622512330', N'\IMS\19Jul2023\IncidentImage\c60c1634-1aff-4540-b4cd-5d972bd96d2e.jpeg', N'', N'', NULL, 4, N'Incident Assigned', CAST(N'2023-07-20T13:27:10.990' AS DateTime), 4, 0, 0)
GO
INSERT [dbo].[tbl_IncidentActionHistory] ([IncidentId], [ActionImagePath], [ActionVideoPath], [ActionAudioPath], [AssignedToId], [ActionTakenById], [ActionTakenRemark], [ActionTakenDateTime], [ActionStatusId], [DataSendStatus], [MediaSendStatus]) VALUES (N'MOBI-202307201545456770', N'\IMS\20Jul2023\IncidentImage\d04874b0-6d7e-43ab-b05d-95ae8a49645c.png', N'', N'', NULL, 0, N'New incident created', CAST(N'2023-07-20T15:43:22.280' AS DateTime), 1, 0, 0)
GO
INSERT [dbo].[tbl_IncidentActionHistory] ([IncidentId], [ActionImagePath], [ActionVideoPath], [ActionAudioPath], [AssignedToId], [ActionTakenById], [ActionTakenRemark], [ActionTakenDateTime], [ActionStatusId], [DataSendStatus], [MediaSendStatus]) VALUES (N'MOBI-202307201545456770', N'\IMS\20Jul2023\IncidentImage\d04874b0-6d7e-43ab-b05d-95ae8a49645c.png', N'', N'', NULL, 4, N'Incident Assigned', CAST(N'2023-07-20T15:43:22.280' AS DateTime), 4, 0, 0)
GO
INSERT [dbo].[tbl_IncidentActionHistory] ([IncidentId], [ActionImagePath], [ActionVideoPath], [ActionAudioPath], [AssignedToId], [ActionTakenById], [ActionTakenRemark], [ActionTakenDateTime], [ActionStatusId], [DataSendStatus], [MediaSendStatus]) VALUES (N'TMCS-202307201622512330', N'', N'', N'', NULL, 0, N'New incident created', CAST(N'2023-07-20T18:12:38.370' AS DateTime), 1, 0, 0)
GO
INSERT [dbo].[tbl_IncidentActionHistory] ([IncidentId], [ActionImagePath], [ActionVideoPath], [ActionAudioPath], [AssignedToId], [ActionTakenById], [ActionTakenRemark], [ActionTakenDateTime], [ActionStatusId], [DataSendStatus], [MediaSendStatus]) VALUES (N'TMCS-202307201622512330', N'\IMS\20Jul2023\IncidentImage\TMCS-202307201622512330\37d11c5b-9029-4ee2-bbff-90ba06e0c306.jpeg', N'', N'', NULL, 0, N'act', CAST(N'2023-07-20T18:14:08.530' AS DateTime), 2, 0, 0)
GO
INSERT [dbo].[tbl_IncidentActionHistory] ([IncidentId], [ActionImagePath], [ActionVideoPath], [ActionAudioPath], [AssignedToId], [ActionTakenById], [ActionTakenRemark], [ActionTakenDateTime], [ActionStatusId], [DataSendStatus], [MediaSendStatus]) VALUES (N'MOBI-202307201545456770', N'\IMS\21Jul2023\IncidentImage\MOBI-202307201545456770\21abf175-5d82-4ed6-a6ed-cf266bed3bcf.jpeg', N'', N'', NULL, 0, N'supply providid', CAST(N'2023-07-21T11:13:22.490' AS DateTime), 6, 0, 0)
GO
INSERT [dbo].[tbl_IncidentActionHistory] ([IncidentId], [ActionImagePath], [ActionVideoPath], [ActionAudioPath], [AssignedToId], [ActionTakenById], [ActionTakenRemark], [ActionTakenDateTime], [ActionStatusId], [DataSendStatus], [MediaSendStatus]) VALUES (N'MOBI-202307201545456770', N'\IMS\21Jul2023\IncidentImage\MOBI-202307201545456770\7527a66c-8ffa-4b72-8824-1d48d4f90371.jpeg', N'', N'', NULL, 0, N'Not relevent', CAST(N'2023-07-21T11:10:14.770' AS DateTime), 3, 0, 0)
GO
INSERT [dbo].[tbl_IncidentActionHistory] ([IncidentId], [ActionImagePath], [ActionVideoPath], [ActionAudioPath], [AssignedToId], [ActionTakenById], [ActionTakenRemark], [ActionTakenDateTime], [ActionStatusId], [DataSendStatus], [MediaSendStatus]) VALUES (N'MOBI-202307201545456770', N'', N'', N'', 2, 0, N'dddd', CAST(N'2023-07-22T14:33:51.383' AS DateTime), 5, 0, 0)
GO
INSERT [dbo].[tbl_IncidentActionHistory] ([IncidentId], [ActionImagePath], [ActionVideoPath], [ActionAudioPath], [AssignedToId], [ActionTakenById], [ActionTakenRemark], [ActionTakenDateTime], [ActionStatusId], [DataSendStatus], [MediaSendStatus]) VALUES (N'MOBI-202307201545456770', N'\IMS\22Jul2023\IncidentImage\MOBI-202307201545456770\84ec4605-c19a-44eb-9fe0-0fbf805e765b.png', N'', N'', 0, 0, N'cc', CAST(N'2023-07-22T14:42:30.547' AS DateTime), 6, 0, 0)
GO
INSERT [dbo].[tbl_IncidentActionHistory] ([IncidentId], [ActionImagePath], [ActionVideoPath], [ActionAudioPath], [AssignedToId], [ActionTakenById], [ActionTakenRemark], [ActionTakenDateTime], [ActionStatusId], [DataSendStatus], [MediaSendStatus]) VALUES (N'TMCS-202307191622512330', N'\IMS\19Jul2023\IncidentImage\c60c1634-1aff-4540-b4cd-5d972bd96d2e.jpeg', N'', N'', NULL, 0, N'Incident modified', CAST(N'2023-08-03T11:17:23.920' AS DateTime), 8, 0, 0)
GO
INSERT [dbo].[tbl_IncidentActionHistory] ([IncidentId], [ActionImagePath], [ActionVideoPath], [ActionAudioPath], [AssignedToId], [ActionTakenById], [ActionTakenRemark], [ActionTakenDateTime], [ActionStatusId], [DataSendStatus], [MediaSendStatus]) VALUES (N'TMCS-202307201622512330', N'/IMS/03Aug2023/IncidentImage/TMCS-202307201622512330/380f333c-9eb8-40c7-9092-0ade24dd9b92.jpeg', N'', N'', 0, 0, N'test', CAST(N'2023-08-03T11:18:16.777' AS DateTime), 2, 0, 0)
GO
INSERT [dbo].[tbl_IncidentActionHistory] ([IncidentId], [ActionImagePath], [ActionVideoPath], [ActionAudioPath], [AssignedToId], [ActionTakenById], [ActionTakenRemark], [ActionTakenDateTime], [ActionStatusId], [DataSendStatus], [MediaSendStatus]) VALUES (N'MOBI-202307201545456770', N'', N'', N'', 2, 0, N'trest', CAST(N'2023-08-03T11:24:12.650' AS DateTime), 5, 0, 0)
GO
INSERT [dbo].[tbl_IncidentActionHistory] ([IncidentId], [ActionImagePath], [ActionVideoPath], [ActionAudioPath], [AssignedToId], [ActionTakenById], [ActionTakenRemark], [ActionTakenDateTime], [ActionStatusId], [DataSendStatus], [MediaSendStatus]) VALUES (N'MOBI-202307201545456770', N'/IMS/03Aug2023/IncidentImage/MOBI-202307201545456770/f2a055be-a8b3-4a0e-9ed4-025688f171b0.png', N'', N'', 0, 0, N'done', CAST(N'2023-08-03T11:24:36.693' AS DateTime), 6, 0, 0)
GO
SET IDENTITY_INSERT [dbo].[tbl_IncidentCategoryMaster] ON 
GO
INSERT [dbo].[tbl_IncidentCategoryMaster] ([IncidentCategoryId], [IncidentCategoryName], [IncidentCategoryIcon], [PriorityId], [OrderBy], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (1, N'Accident', N'fas fa-car-crash', 1, 1, 1, CAST(N'2022-02-17T13:24:44.210' AS DateTime), 0, CAST(N'2022-02-17T13:24:44.210' AS DateTime), 0)
GO
INSERT [dbo].[tbl_IncidentCategoryMaster] ([IncidentCategoryId], [IncidentCategoryName], [IncidentCategoryIcon], [PriorityId], [OrderBy], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (2, N'Traffic Congestion', N'fas fa-traffic-light', 1, 6, 1, CAST(N'2022-02-17T13:25:01.953' AS DateTime), 0, CAST(N'2022-02-17T13:25:01.953' AS DateTime), 0)
GO
INSERT [dbo].[tbl_IncidentCategoryMaster] ([IncidentCategoryId], [IncidentCategoryName], [IncidentCategoryIcon], [PriorityId], [OrderBy], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (3, N'Animal On Road', N'fas fa-dog', 2, 3, 1, CAST(N'2022-02-17T13:25:13.187' AS DateTime), 0, CAST(N'2022-02-17T13:25:13.187' AS DateTime), 0)
GO
INSERT [dbo].[tbl_IncidentCategoryMaster] ([IncidentCategoryId], [IncidentCategoryName], [IncidentCategoryIcon], [PriorityId], [OrderBy], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (4, N'Traffic Rule Violation', N'fa fa-solid fa-receipt', 2, 7, 1, CAST(N'2022-02-17T13:25:30.090' AS DateTime), 0, CAST(N'2022-02-17T13:25:30.090' AS DateTime), 0)
GO
INSERT [dbo].[tbl_IncidentCategoryMaster] ([IncidentCategoryId], [IncidentCategoryName], [IncidentCategoryIcon], [PriorityId], [OrderBy], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (5, N'Toll Plaza Related', N'fas fa-booth-curtain', 3, 4, 1, CAST(N'2022-02-17T13:25:40.803' AS DateTime), 0, CAST(N'2022-02-17T13:25:40.803' AS DateTime), 0)
GO
INSERT [dbo].[tbl_IncidentCategoryMaster] ([IncidentCategoryId], [IncidentCategoryName], [IncidentCategoryIcon], [PriorityId], [OrderBy], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (6, N'Breakdown', N'fas fa-car-mechanic', 2, 2, 1, CAST(N'2022-02-17T13:26:21.843' AS DateTime), 0, CAST(N'2022-02-17T13:26:21.843' AS DateTime), 0)
GO
INSERT [dbo].[tbl_IncidentCategoryMaster] ([IncidentCategoryId], [IncidentCategoryName], [IncidentCategoryIcon], [PriorityId], [OrderBy], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (7, N'Calamity', N'fas fa-cloud-sun-rain', 3, 8, 1, CAST(N'2022-02-17T13:26:45.010' AS DateTime), 0, CAST(N'2022-02-17T13:26:45.010' AS DateTime), 0)
GO
INSERT [dbo].[tbl_IncidentCategoryMaster] ([IncidentCategoryId], [IncidentCategoryName], [IncidentCategoryIcon], [PriorityId], [OrderBy], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (8, N'General Complaints', N'fa fa-solid fa-comments', 4, 10, 1, CAST(N'2022-02-17T13:26:51.007' AS DateTime), 0, CAST(N'2022-02-17T13:26:51.007' AS DateTime), 0)
GO
INSERT [dbo].[tbl_IncidentCategoryMaster] ([IncidentCategoryId], [IncidentCategoryName], [IncidentCategoryIcon], [PriorityId], [OrderBy], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (9, N'Law & Order', N'fa fa-legal', 1, 5, 1, CAST(N'2022-02-17T13:26:56.210' AS DateTime), 0, CAST(N'2022-02-17T13:26:56.210' AS DateTime), 0)
GO
INSERT [dbo].[tbl_IncidentCategoryMaster] ([IncidentCategoryId], [IncidentCategoryName], [IncidentCategoryIcon], [PriorityId], [OrderBy], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (10, N'Road Condition', N'fa fa-solid fa-road', 4, 9, 1, CAST(N'2022-02-17T13:27:00.693' AS DateTime), 0, CAST(N'2022-02-17T13:27:00.693' AS DateTime), 0)
GO
INSERT [dbo].[tbl_IncidentCategoryMaster] ([IncidentCategoryId], [IncidentCategoryName], [IncidentCategoryIcon], [PriorityId], [OrderBy], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (11, N'Fire', N'fa fa-solid fa-road', 1, 11, 1, CAST(N'2022-07-31T00:34:31.340' AS DateTime), 0, CAST(N'2022-07-31T00:34:31.340' AS DateTime), 0)
GO
INSERT [dbo].[tbl_IncidentCategoryMaster] ([IncidentCategoryId], [IncidentCategoryName], [IncidentCategoryIcon], [PriorityId], [OrderBy], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (12, N'Motion Detection', N'fa fa-solid fa-road', 2, 12, 1, CAST(N'2022-07-31T00:36:45.843' AS DateTime), 0, CAST(N'2022-07-31T00:36:45.843' AS DateTime), 0)
GO
INSERT [dbo].[tbl_IncidentCategoryMaster] ([IncidentCategoryId], [IncidentCategoryName], [IncidentCategoryIcon], [PriorityId], [OrderBy], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (13, N'Emergency Call', N'fas fa-car-crash', 2, 13, 1, CAST(N'2022-08-31T13:41:34.220' AS DateTime), 0, CAST(N'2022-08-31T13:41:34.220' AS DateTime), 0)
GO
INSERT [dbo].[tbl_IncidentCategoryMaster] ([IncidentCategoryId], [IncidentCategoryName], [IncidentCategoryIcon], [PriorityId], [OrderBy], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (14, N'Road Assets', N'fas fa-car-crash', 3, 14, 1, CAST(N'2022-08-31T13:41:34.220' AS DateTime), 0, CAST(N'2022-08-31T13:41:34.220' AS DateTime), 0)
GO
SET IDENTITY_INSERT [dbo].[tbl_IncidentCategoryMaster] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_IncidentCheckListMaster] ON 
GO
INSERT [dbo].[tbl_IncidentCheckListMaster] ([CheckListMasterId], [CategoryId], [StepsName], [IsAutoProcess], [StepsProofId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (1, 0, N'Broadcast to VMS', 1, 0, 1, CAST(N'2022-02-21T14:19:23.817' AS DateTime), 0, CAST(N'2022-02-21T14:19:23.817' AS DateTime), 0)
GO
INSERT [dbo].[tbl_IncidentCheckListMaster] ([CheckListMasterId], [CategoryId], [StepsName], [IsAutoProcess], [StepsProofId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (2, 1, N'Patrolling Camper', 0, 0, 1, CAST(N'2022-02-21T14:23:22.150' AS DateTime), 0, CAST(N'2022-02-21T14:23:22.150' AS DateTime), 0)
GO
INSERT [dbo].[tbl_IncidentCheckListMaster] ([CheckListMasterId], [CategoryId], [StepsName], [IsAutoProcess], [StepsProofId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (3, 1, N'Patrolling Ambulance', 0, 0, 1, CAST(N'2022-02-21T14:47:43.997' AS DateTime), 0, CAST(N'2022-02-21T14:47:43.997' AS DateTime), 0)
GO
INSERT [dbo].[tbl_IncidentCheckListMaster] ([CheckListMasterId], [CategoryId], [StepsName], [IsAutoProcess], [StepsProofId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (4, 1, N'Patrolling Hydra / Recovery', 0, 0, 1, CAST(N'2022-02-21T14:54:16.623' AS DateTime), 0, CAST(N'2022-02-21T14:54:16.623' AS DateTime), 0)
GO
INSERT [dbo].[tbl_IncidentCheckListMaster] ([CheckListMasterId], [CategoryId], [StepsName], [IsAutoProcess], [StepsProofId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (5, 1, N'Ambulance 108', 0, 0, 1, CAST(N'2022-02-21T14:56:15.563' AS DateTime), 0, CAST(N'2022-02-21T14:56:15.563' AS DateTime), 0)
GO
INSERT [dbo].[tbl_IncidentCheckListMaster] ([CheckListMasterId], [CategoryId], [StepsName], [IsAutoProcess], [StepsProofId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (6, 1, N'Police Dial 100 / 112', 0, 0, 1, CAST(N'2022-02-21T14:57:09.770' AS DateTime), 0, CAST(N'2022-02-21T14:57:09.770' AS DateTime), 0)
GO
INSERT [dbo].[tbl_IncidentCheckListMaster] ([CheckListMasterId], [CategoryId], [StepsName], [IsAutoProcess], [StepsProofId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (7, 1, N'District Control Room', 0, 0, 1, CAST(N'2022-02-21T14:57:50.510' AS DateTime), 0, CAST(N'2022-02-21T14:57:50.510' AS DateTime), 0)
GO
INSERT [dbo].[tbl_IncidentCheckListMaster] ([CheckListMasterId], [CategoryId], [StepsName], [IsAutoProcess], [StepsProofId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (8, 1, N'Fire Bridge', 0, 0, 1, CAST(N'2022-02-21T14:23:22.150' AS DateTime), 0, CAST(N'2022-02-21T14:23:22.150' AS DateTime), 0)
GO
INSERT [dbo].[tbl_IncidentCheckListMaster] ([CheckListMasterId], [CategoryId], [StepsName], [IsAutoProcess], [StepsProofId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (9, 1, N'EPC Contractor', 0, 0, 1, CAST(N'2022-02-21T14:47:43.997' AS DateTime), 0, CAST(N'2022-02-21T14:47:43.997' AS DateTime), 0)
GO
INSERT [dbo].[tbl_IncidentCheckListMaster] ([CheckListMasterId], [CategoryId], [StepsName], [IsAutoProcess], [StepsProofId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (10, 0, N'Toll Collection Agency', 0, 0, 1, CAST(N'2022-08-28T23:11:41.120' AS DateTime), 0, CAST(N'2022-08-28T23:11:41.120' AS DateTime), 0)
GO
SET IDENTITY_INSERT [dbo].[tbl_IncidentCheckListMaster] OFF
GO
INSERT [dbo].[tbl_IncidentDetailsHistory] ([IncidentId], [IncidentCategoryId], [PriorityId], [IncidentDescription], [IncidentImagePath], [IncidentVideoPath], [IncidentAudioPath], [DirectionId], [ChainageNumber], [Latitude], [Longitude], [VehiclePlateNumber], [VehicleClassId], [SourceSystemId], [EquipmentId], [NearByPTZId], [IncidentGeneratedByTypeId], [IncidentGeneratedById], [AssignedToId], [IncidentCloseImagePath], [IncidentStatusId], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [DataSendStatus], [MediaSendStatus]) VALUES (N'TMCS-202307191622512330', 6, 1, N'test11', N'\IMS\19Jul2023\IncidentImage\c60c1634-1aff-4540-b4cd-5d972bd96d2e.jpeg', N'', N'', 1, CAST(213.500 AS Decimal(16, 3)), CAST(0.000000 AS Decimal(8, 6)), CAST(0.000000 AS Decimal(9, 6)), N'DL7CS7898', 1, 3, 7, 7, 3, 0, 0, NULL, 1, CAST(N'2023-07-19T16:20:29.860' AS DateTime), 0, CAST(N'2023-08-03T11:17:23.920' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_IncidentDetailsHistory] ([IncidentId], [IncidentCategoryId], [PriorityId], [IncidentDescription], [IncidentImagePath], [IncidentVideoPath], [IncidentAudioPath], [DirectionId], [ChainageNumber], [Latitude], [Longitude], [VehiclePlateNumber], [VehicleClassId], [SourceSystemId], [EquipmentId], [NearByPTZId], [IncidentGeneratedByTypeId], [IncidentGeneratedById], [AssignedToId], [IncidentCloseImagePath], [IncidentStatusId], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [DataSendStatus], [MediaSendStatus]) VALUES (N'VIDS-202307191629333800', 3, 2, N'test2', N'\IMS\19Jul2023\IncidentImage\99f8f709-2677-493e-91ea-e68e02299568.png', N'', N'', 1, CAST(212.300 AS Decimal(16, 3)), CAST(0.000000 AS Decimal(8, 6)), CAST(0.000000 AS Decimal(9, 6)), N'', 0, 4, 11, 0, 3, 0, NULL, NULL, 1, CAST(N'2023-07-19T16:27:12.007' AS DateTime), 0, CAST(N'2023-07-19T16:29:33.380' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_IncidentDetailsHistory] ([IncidentId], [IncidentCategoryId], [PriorityId], [IncidentDescription], [IncidentImagePath], [IncidentVideoPath], [IncidentAudioPath], [DirectionId], [ChainageNumber], [Latitude], [Longitude], [VehiclePlateNumber], [VehicleClassId], [SourceSystemId], [EquipmentId], [NearByPTZId], [IncidentGeneratedByTypeId], [IncidentGeneratedById], [AssignedToId], [IncidentCloseImagePath], [IncidentStatusId], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [DataSendStatus], [MediaSendStatus]) VALUES (N'TMCS-202307201622512330', 6, 1, N'test', N'\IMS\19Jul2023\IncidentImage\c60c1634-1aff-4540-b4cd-5d972bd96d2e.jpeg', N'', N'', 1, CAST(213.500 AS Decimal(16, 3)), CAST(0.000000 AS Decimal(8, 6)), CAST(0.000000 AS Decimal(9, 6)), N'DL7CS7898', 1, 3, 7, 0, 3, 0, 2, NULL, 2, CAST(N'2023-07-20T13:27:10.990' AS DateTime), 0, CAST(N'2023-07-20T13:29:34.580' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_IncidentDetailsHistory] ([IncidentId], [IncidentCategoryId], [PriorityId], [IncidentDescription], [IncidentImagePath], [IncidentVideoPath], [IncidentAudioPath], [DirectionId], [ChainageNumber], [Latitude], [Longitude], [VehiclePlateNumber], [VehicleClassId], [SourceSystemId], [EquipmentId], [NearByPTZId], [IncidentGeneratedByTypeId], [IncidentGeneratedById], [AssignedToId], [IncidentCloseImagePath], [IncidentStatusId], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [DataSendStatus], [MediaSendStatus]) VALUES (N'MOBI-202307201545456770', 13, 2, N'test333', N'\IMS\20Jul2023\IncidentImage\d04874b0-6d7e-43ab-b05d-95ae8a49645c.png', N'', N'', 1, CAST(232.900 AS Decimal(16, 3)), CAST(0.000000 AS Decimal(8, 6)), CAST(0.000000 AS Decimal(9, 6)), N'', 0, 7, 17, 7, 3, 0, 2, NULL, 6, CAST(N'2023-07-20T15:43:22.280' AS DateTime), 0, CAST(N'2023-07-20T15:45:45.690' AS DateTime), 0, 0, 0)
GO
SET IDENTITY_INSERT [dbo].[tbl_IncidentSourceMaster] ON 
GO
INSERT [dbo].[tbl_IncidentSourceMaster] ([SourceId], [SourceName], [ReferenceNo], [DataStatus], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (1, N'Emergency Call-1033', N'ECSS-', 1, 0, CAST(N'2022-07-13T00:00:00.000' AS DateTime), 0, CAST(N'2022-07-13T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[tbl_IncidentSourceMaster] ([SourceId], [SourceName], [ReferenceNo], [DataStatus], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (2, N'Patrolling/Enforcement Vehicle', N'PEVS-', 0, 0, CAST(N'2022-07-13T00:00:00.000' AS DateTime), 0, CAST(N'2022-07-13T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[tbl_IncidentSourceMaster] ([SourceId], [SourceName], [ReferenceNo], [DataStatus], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (3, N'TMCS', N'TMCS-', 1, 0, CAST(N'2022-07-13T00:00:00.000' AS DateTime), 0, CAST(N'2022-07-13T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[tbl_IncidentSourceMaster] ([SourceId], [SourceName], [ReferenceNo], [DataStatus], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (4, N'VIDS', N'VIDS-', 1, 0, CAST(N'2022-07-13T00:00:00.000' AS DateTime), 0, CAST(N'2022-07-13T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[tbl_IncidentSourceMaster] ([SourceId], [SourceName], [ReferenceNo], [DataStatus], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (5, N'VSDS', N'VSDS-', 0, 0, CAST(N'2022-07-13T00:00:00.000' AS DateTime), 0, CAST(N'2022-07-13T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[tbl_IncidentSourceMaster] ([SourceId], [SourceName], [ReferenceNo], [DataStatus], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (6, N'ECB', N'ECBS-', 0, 0, CAST(N'2022-07-13T00:00:00.000' AS DateTime), 0, CAST(N'2022-07-13T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[tbl_IncidentSourceMaster] ([SourceId], [SourceName], [ReferenceNo], [DataStatus], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (7, N'Commuter Mobile', N'MOBI-', 1, 0, CAST(N'2022-07-19T23:28:49.620' AS DateTime), 0, CAST(N'2022-07-19T23:28:49.620' AS DateTime))
GO
INSERT [dbo].[tbl_IncidentSourceMaster] ([SourceId], [SourceName], [ReferenceNo], [DataStatus], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (8, N'Motion Detection', N'MDSS-', 0, 0, CAST(N'2022-07-26T22:24:41.860' AS DateTime), 0, CAST(N'2022-07-26T22:24:41.860' AS DateTime))
GO
INSERT [dbo].[tbl_IncidentSourceMaster] ([SourceId], [SourceName], [ReferenceNo], [DataStatus], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (9, N'ATCC', N'ATCC-', 1, 0, CAST(N'2023-07-06T19:42:25.803' AS DateTime), 0, CAST(N'2023-07-06T19:42:25.803' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[tbl_IncidentSourceMaster] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_IncidentStatusMaster] ON 
GO
INSERT [dbo].[tbl_IncidentStatusMaster] ([IncidentStatusId], [IncidentStatusName], [IncidentStatusIcon], [IncidentStatusColorCode], [ProcessPercentage], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (1, N'Created', N'fa fa-question-circle', N'#EF0610', CAST(10.00 AS Decimal(5, 2)), 1, CAST(N'2022-02-18T19:11:33.617' AS DateTime), 0, CAST(N'2022-02-18T19:11:33.617' AS DateTime), 0)
GO
INSERT [dbo].[tbl_IncidentStatusMaster] ([IncidentStatusId], [IncidentStatusName], [IncidentStatusIcon], [IncidentStatusColorCode], [ProcessPercentage], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (2, N'Accepted', N'fa fa-check-square', N'#EB8811', CAST(30.00 AS Decimal(5, 2)), 1, CAST(N'2022-02-18T19:11:33.617' AS DateTime), 0, CAST(N'2022-02-18T19:11:33.617' AS DateTime), 0)
GO
INSERT [dbo].[tbl_IncidentStatusMaster] ([IncidentStatusId], [IncidentStatusName], [IncidentStatusIcon], [IncidentStatusColorCode], [ProcessPercentage], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (3, N'Rejected', N'fa fa-window-close-o', N'#51060E', CAST(50.00 AS Decimal(5, 2)), 1, CAST(N'2022-02-18T19:11:33.630' AS DateTime), 0, CAST(N'2022-02-18T19:11:33.630' AS DateTime), 0)
GO
INSERT [dbo].[tbl_IncidentStatusMaster] ([IncidentStatusId], [IncidentStatusName], [IncidentStatusIcon], [IncidentStatusColorCode], [ProcessPercentage], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (4, N'Assigned To', N'fa fa-check', N'#BABC36', CAST(50.00 AS Decimal(5, 2)), 1, CAST(N'2022-02-18T19:11:33.630' AS DateTime), 0, CAST(N'2022-02-18T19:11:33.630' AS DateTime), 0)
GO
INSERT [dbo].[tbl_IncidentStatusMaster] ([IncidentStatusId], [IncidentStatusName], [IncidentStatusIcon], [IncidentStatusColorCode], [ProcessPercentage], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (5, N'Re-assigned To', N'fa fa-check-circle-o', N'#95BC36', CAST(50.00 AS Decimal(5, 2)), 1, CAST(N'2023-06-27T12:51:22.510' AS DateTime), 0, CAST(N'2023-06-27T12:51:22.510' AS DateTime), 0)
GO
INSERT [dbo].[tbl_IncidentStatusMaster] ([IncidentStatusId], [IncidentStatusName], [IncidentStatusIcon], [IncidentStatusColorCode], [ProcessPercentage], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (6, N'Closed', N'fa fa-times-circle', N'#3CC933', CAST(100.00 AS Decimal(5, 2)), 1, CAST(N'2023-06-27T12:51:25.110' AS DateTime), 0, CAST(N'2023-06-27T12:51:25.110' AS DateTime), 0)
GO
INSERT [dbo].[tbl_IncidentStatusMaster] ([IncidentStatusId], [IncidentStatusName], [IncidentStatusIcon], [IncidentStatusColorCode], [ProcessPercentage], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (7, N'Auto Closed', N'fa fa-times-circle', N'#1EEB11', CAST(100.00 AS Decimal(5, 2)), 1, CAST(N'2023-07-03T20:56:21.913' AS DateTime), 0, CAST(N'2023-07-03T20:56:21.913' AS DateTime), 0)
GO
INSERT [dbo].[tbl_IncidentStatusMaster] ([IncidentStatusId], [IncidentStatusName], [IncidentStatusIcon], [IncidentStatusColorCode], [ProcessPercentage], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (8, N'Modified', N'fa fa-question-circle', N'#E8464D
', CAST(20.00 AS Decimal(5, 2)), 1, CAST(N'2023-07-20T13:02:41.803' AS DateTime), 0, CAST(N'2023-07-20T13:02:41.803' AS DateTime), 0)
GO
INSERT [dbo].[tbl_IncidentStatusMaster] ([IncidentStatusId], [IncidentStatusName], [IncidentStatusIcon], [IncidentStatusColorCode], [ProcessPercentage], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (9, N'Transfer To', N'fa fa-exchange', N'#EB8811', CAST(30.00 AS Decimal(5, 2)), 1, CAST(N'2023-07-21T13:19:30.187' AS DateTime), 0, CAST(N'2023-07-21T13:19:30.187' AS DateTime), 0)
GO
SET IDENTITY_INSERT [dbo].[tbl_IncidentStatusMaster] OFF
GO
INSERT [dbo].[tbl_LaneConfig] ([LaneNumber], [AllowedClassIds], [AllowedSpeed], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (1, N'3,9', CAST(100.00 AS Decimal(10, 2)), 1, CAST(N'2023-09-08T18:35:16.453' AS DateTime), 0, CAST(N'2023-09-10T13:23:52.037' AS DateTime), 0)
GO
INSERT [dbo].[tbl_LaneConfig] ([LaneNumber], [AllowedClassIds], [AllowedSpeed], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (2, N'3,4,5,6,7,8,9', CAST(80.00 AS Decimal(10, 2)), 1, CAST(N'2023-09-08T18:35:16.457' AS DateTime), 0, CAST(N'2023-09-10T13:23:52.037' AS DateTime), 0)
GO
INSERT [dbo].[tbl_LaneConfig] ([LaneNumber], [AllowedClassIds], [AllowedSpeed], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (3, N'3,4,5,6,7,8,9', CAST(80.00 AS Decimal(10, 2)), 1, CAST(N'2023-09-08T18:35:16.460' AS DateTime), 0, CAST(N'2023-09-10T13:23:52.037' AS DateTime), 0)
GO
INSERT [dbo].[tbl_LaneConfig] ([LaneNumber], [AllowedClassIds], [AllowedSpeed], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (4, N'3,4,5,6,7,8,9', CAST(80.00 AS Decimal(10, 2)), 2, CAST(N'2023-09-08T18:35:16.460' AS DateTime), 0, CAST(N'2023-09-10T13:23:52.037' AS DateTime), 0)
GO
SET IDENTITY_INSERT [dbo].[tbl_LogingActivity] ON 
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (1, NULL, N'0', 1, NULL, CAST(N'2023-06-16T00:27:21.807' AS DateTime), NULL, CAST(N'2023-06-16T00:27:22.547' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (2, NULL, N'0', 1, NULL, CAST(N'2023-06-16T00:48:04.837' AS DateTime), NULL, CAST(N'2023-06-16T00:48:04.837' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (3, NULL, N'0', 1, NULL, CAST(N'2023-06-16T00:48:54.863' AS DateTime), NULL, CAST(N'2023-06-16T00:48:54.863' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (4, NULL, N'0', 1, NULL, CAST(N'2023-06-16T00:49:25.923' AS DateTime), NULL, CAST(N'2023-06-16T00:49:25.923' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (5, NULL, N'0', 1, NULL, CAST(N'2023-06-16T00:50:46.253' AS DateTime), NULL, CAST(N'2023-06-16T00:50:46.253' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (6, NULL, N'0', 1, NULL, CAST(N'2023-06-16T00:58:11.970' AS DateTime), NULL, CAST(N'2023-06-16T00:58:11.970' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (11, NULL, N'0', 1, NULL, CAST(N'2023-06-16T01:09:59.930' AS DateTime), NULL, CAST(N'2023-06-16T01:09:59.930' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (7, NULL, N'0', 1, NULL, CAST(N'2023-06-16T01:03:18.477' AS DateTime), NULL, CAST(N'2023-06-16T01:03:27.047' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (8, NULL, N'0', 0, NULL, NULL, NULL, CAST(N'2023-06-16T01:07:09.010' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (9, NULL, N'0', 0, NULL, NULL, NULL, CAST(N'2023-06-16T01:07:11.887' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (10, NULL, N'0', 1, NULL, CAST(N'2023-06-16T01:07:20.077' AS DateTime), NULL, CAST(N'2023-06-16T01:07:20.077' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (12, NULL, N'0', 1, NULL, CAST(N'2023-06-16T23:22:15.963' AS DateTime), NULL, CAST(N'2023-06-16T23:22:16.040' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (13, NULL, N'0', 1, NULL, CAST(N'2023-06-16T23:53:42.123' AS DateTime), NULL, CAST(N'2023-06-16T23:53:42.147' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (14, NULL, N'0', 0, NULL, NULL, NULL, CAST(N'2023-06-16T23:59:26.857' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (15, NULL, N'0', 0, NULL, NULL, NULL, CAST(N'2023-06-16T23:59:29.090' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (16, NULL, N'0', 0, NULL, NULL, NULL, CAST(N'2023-06-16T23:59:31.580' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (17, NULL, N'0', 0, NULL, NULL, NULL, CAST(N'2023-06-16T23:59:38.720' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (18, NULL, N'0', 1, NULL, CAST(N'2023-06-16T23:59:45.683' AS DateTime), NULL, CAST(N'2023-06-16T23:59:45.683' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (19, NULL, N'0', 1, NULL, CAST(N'2023-06-17T00:03:57.143' AS DateTime), NULL, CAST(N'2023-06-17T00:03:57.143' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (23, NULL, N'0', 1, NULL, CAST(N'2023-06-17T00:19:44.490' AS DateTime), NULL, CAST(N'2023-06-17T00:19:44.523' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (25, NULL, N'0', 1, NULL, CAST(N'2023-06-17T01:32:49.453' AS DateTime), NULL, CAST(N'2023-06-17T01:32:49.453' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (26, NULL, N'0', 1, NULL, CAST(N'2023-06-17T01:54:38.573' AS DateTime), NULL, CAST(N'2023-06-17T01:54:38.597' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (33, NULL, N'0', 1, NULL, CAST(N'2023-06-17T16:23:46.980' AS DateTime), NULL, CAST(N'2023-06-17T16:23:47.060' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (34, NULL, N'0', 1, NULL, CAST(N'2023-06-19T22:42:32.860' AS DateTime), NULL, CAST(N'2023-06-19T22:42:33.287' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (37, NULL, N'0', 0, NULL, NULL, NULL, CAST(N'2023-06-19T23:47:30.310' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (38, NULL, N'0', 0, NULL, NULL, NULL, CAST(N'2023-06-19T23:47:32.113' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (39, NULL, N'0', 1, NULL, CAST(N'2023-06-19T23:47:39.720' AS DateTime), NULL, CAST(N'2023-06-19T23:47:39.720' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (40, NULL, N'0', 1, NULL, CAST(N'2023-06-20T00:21:16.147' AS DateTime), NULL, CAST(N'2023-06-20T00:21:16.147' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (41, NULL, N'0', 1, NULL, CAST(N'2023-06-20T00:54:21.310' AS DateTime), NULL, CAST(N'2023-06-20T00:54:21.337' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (43, NULL, N'0', 1, NULL, CAST(N'2023-06-20T07:03:17.077' AS DateTime), NULL, CAST(N'2023-06-20T07:03:17.077' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (44, NULL, N'0', 1, NULL, CAST(N'2023-06-21T20:19:03.797' AS DateTime), NULL, CAST(N'2023-06-21T20:19:04.013' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (45, NULL, N'0', 1, NULL, CAST(N'2023-06-21T21:39:42.643' AS DateTime), NULL, CAST(N'2023-06-21T21:39:42.673' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (46, NULL, N'0', 1, NULL, CAST(N'2023-06-21T21:40:53.173' AS DateTime), NULL, CAST(N'2023-06-21T21:40:53.240' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (51, NULL, N'0', 1, NULL, CAST(N'2023-06-21T23:59:02.867' AS DateTime), NULL, CAST(N'2023-06-21T23:59:02.867' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (53, NULL, N'0', 1, NULL, CAST(N'2023-06-22T08:09:26.380' AS DateTime), NULL, CAST(N'2023-06-22T08:09:26.430' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (54, NULL, N'0', 1, NULL, CAST(N'2023-06-22T08:38:45.013' AS DateTime), NULL, CAST(N'2023-06-22T08:38:45.037' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (55, NULL, N'0', 1, NULL, CAST(N'2023-06-23T23:02:55.240' AS DateTime), NULL, CAST(N'2023-06-23T23:02:55.273' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (56, NULL, N'0', 1, NULL, CAST(N'2023-06-23T23:59:40.287' AS DateTime), NULL, CAST(N'2023-06-23T23:59:40.287' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (58, NULL, N'0', 1, NULL, CAST(N'2023-06-24T12:14:36.713' AS DateTime), NULL, CAST(N'2023-06-24T12:14:36.713' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (60, NULL, N'0', 1, NULL, CAST(N'2023-06-24T16:12:43.430' AS DateTime), NULL, CAST(N'2023-06-24T16:12:43.583' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (62, NULL, N'0', 1, NULL, CAST(N'2023-06-25T12:01:17.690' AS DateTime), NULL, CAST(N'2023-06-25T12:01:18.133' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (66, NULL, N'0', 1, NULL, CAST(N'2023-06-25T22:00:58.457' AS DateTime), NULL, CAST(N'2023-06-25T22:00:58.457' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (67, NULL, N'0', 1, NULL, CAST(N'2023-06-25T22:21:08.267' AS DateTime), NULL, CAST(N'2023-06-25T22:21:08.267' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (68, NULL, N'0', 1, NULL, CAST(N'2023-06-26T19:44:13.457' AS DateTime), NULL, CAST(N'2023-06-26T19:44:13.487' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (69, NULL, N'1', 1, NULL, CAST(N'2023-06-26T19:50:16.347' AS DateTime), NULL, CAST(N'2023-06-26T19:50:16.347' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (70, NULL, N'1', 1, NULL, CAST(N'2023-06-26T19:51:10.563' AS DateTime), NULL, CAST(N'2023-06-26T19:51:12.173' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (71, NULL, N'1', 1, NULL, CAST(N'2023-06-26T19:51:58.787' AS DateTime), NULL, CAST(N'2023-06-26T19:51:58.787' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (79, NULL, N'1', 0, NULL, NULL, NULL, CAST(N'2023-06-26T22:40:56.470' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (80, NULL, N'0', 1, NULL, CAST(N'2023-06-26T22:41:09.960' AS DateTime), NULL, CAST(N'2023-06-26T22:41:09.960' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (82, NULL, N'0', 1, NULL, CAST(N'2023-06-27T07:35:31.590' AS DateTime), NULL, CAST(N'2023-06-27T07:35:31.590' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (84, NULL, N'0', 1, NULL, CAST(N'2023-06-28T23:23:31.460' AS DateTime), NULL, CAST(N'2023-06-28T23:23:31.460' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (85, NULL, N'0', 1, NULL, CAST(N'2023-07-03T19:11:55.830' AS DateTime), NULL, CAST(N'2023-07-03T19:11:55.863' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (86, NULL, N'0', 1, NULL, CAST(N'2023-07-03T22:27:29.137' AS DateTime), NULL, CAST(N'2023-07-03T22:27:29.167' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (87, NULL, N'0', 1, NULL, CAST(N'2023-07-03T22:37:04.963' AS DateTime), NULL, CAST(N'2023-07-03T22:37:04.967' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (88, NULL, N'0', 1, NULL, CAST(N'2023-07-03T22:38:52.603' AS DateTime), NULL, CAST(N'2023-07-03T22:38:52.603' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (91, NULL, N'0', 1, NULL, CAST(N'2023-07-03T23:29:53.980' AS DateTime), NULL, CAST(N'2023-07-03T23:29:53.980' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (92, NULL, N'0', 1, NULL, CAST(N'2023-07-03T23:54:16.073' AS DateTime), NULL, CAST(N'2023-07-03T23:54:16.097' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (94, NULL, N'0', 1, NULL, CAST(N'2023-07-06T19:31:17.357' AS DateTime), NULL, CAST(N'2023-07-06T19:31:17.387' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (95, NULL, N'0', 1, NULL, CAST(N'2023-07-15T13:46:42.113' AS DateTime), NULL, CAST(N'2023-07-15T13:46:42.657' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (96, NULL, N'0', 1, NULL, CAST(N'2023-07-15T14:10:18.310' AS DateTime), NULL, CAST(N'2023-07-15T14:10:18.320' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (97, NULL, N'0', 1, NULL, CAST(N'2023-07-15T16:30:42.103' AS DateTime), NULL, CAST(N'2023-07-15T16:30:42.127' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (98, NULL, N'0', 1, NULL, CAST(N'2023-07-15T16:30:52.423' AS DateTime), NULL, CAST(N'2023-07-15T16:30:52.423' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (100, NULL, N'0', 1, NULL, CAST(N'2023-07-15T16:31:17.417' AS DateTime), NULL, CAST(N'2023-07-15T16:31:18.073' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (101, NULL, N'0', 1, NULL, CAST(N'2023-07-19T12:52:46.787' AS DateTime), NULL, CAST(N'2023-07-19T12:52:46.867' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (103, NULL, N'0', 1, NULL, CAST(N'2023-07-20T10:14:17.900' AS DateTime), NULL, CAST(N'2023-07-20T10:14:17.900' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (104, NULL, N'0', 1, NULL, CAST(N'2023-07-20T10:14:19.343' AS DateTime), NULL, CAST(N'2023-07-20T10:14:19.343' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (105, NULL, N'0', 1, NULL, CAST(N'2023-07-20T11:55:23.360' AS DateTime), NULL, CAST(N'2023-07-20T11:55:23.363' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (108, NULL, N'0', 1, NULL, CAST(N'2023-07-21T11:07:13.497' AS DateTime), NULL, CAST(N'2023-07-21T11:07:13.877' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (110, NULL, N'0', 1, NULL, CAST(N'2023-07-22T14:25:22.670' AS DateTime), NULL, CAST(N'2023-07-22T14:25:22.720' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (111, NULL, N'0', 1, NULL, CAST(N'2023-07-24T09:45:19.477' AS DateTime), NULL, CAST(N'2023-07-24T09:45:19.740' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (112, NULL, N'0', 1, NULL, CAST(N'2023-07-24T11:26:24.237' AS DateTime), NULL, CAST(N'2023-07-24T11:26:24.237' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (114, NULL, N'0', 1, NULL, CAST(N'2023-07-25T11:35:10.417' AS DateTime), NULL, CAST(N'2023-07-25T11:35:10.797' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (115, NULL, N'0', 1, NULL, CAST(N'2023-07-26T10:39:26.643' AS DateTime), NULL, CAST(N'2023-07-26T10:39:26.687' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (116, NULL, N'0', 1, NULL, CAST(N'2023-07-26T11:20:48.463' AS DateTime), NULL, CAST(N'2023-07-26T11:20:48.500' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (123, NULL, N'0', 1, NULL, CAST(N'2023-07-28T10:23:45.567' AS DateTime), NULL, CAST(N'2023-07-28T10:23:45.613' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (124, NULL, N'0', 1, NULL, CAST(N'2023-07-28T16:25:55.017' AS DateTime), NULL, CAST(N'2023-07-28T16:25:55.060' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (125, NULL, N'0', 1, NULL, CAST(N'2023-07-28T16:53:44.033' AS DateTime), NULL, CAST(N'2023-07-28T16:53:44.070' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (128, NULL, N'0', 1, NULL, CAST(N'2023-07-29T11:40:16.900' AS DateTime), NULL, CAST(N'2023-07-29T11:40:16.900' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (130, NULL, N'0', 1, NULL, CAST(N'2023-07-30T15:25:25.977' AS DateTime), NULL, CAST(N'2023-07-30T15:25:26.007' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (131, NULL, N'0', 1, NULL, CAST(N'2023-08-01T13:18:06.467' AS DateTime), NULL, CAST(N'2023-08-01T13:18:06.513' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (134, NULL, N'0', 1, NULL, CAST(N'2023-08-01T16:35:46.803' AS DateTime), NULL, CAST(N'2023-08-01T16:35:46.853' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (144, NULL, N'1', 1, NULL, CAST(N'2023-08-02T20:46:55.943' AS DateTime), NULL, CAST(N'2023-08-02T20:46:55.943' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (145, NULL, N'0', 1, NULL, CAST(N'2023-08-02T20:52:01.497' AS DateTime), NULL, CAST(N'2023-08-02T20:52:01.497' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (146, NULL, N'0', 1, NULL, CAST(N'2023-08-02T20:53:32.993' AS DateTime), NULL, CAST(N'2023-08-02T20:53:32.993' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (147, NULL, N'1', 0, NULL, NULL, NULL, CAST(N'2023-08-02T20:54:53.223' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (148, NULL, N'1', 1, NULL, CAST(N'2023-08-02T20:54:58.127' AS DateTime), NULL, CAST(N'2023-08-02T20:54:58.127' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (149, NULL, N'0', 1, NULL, CAST(N'2023-08-02T20:57:33.187' AS DateTime), NULL, CAST(N'2023-08-02T20:57:33.187' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (150, NULL, N'0', 1, NULL, CAST(N'2023-08-02T23:44:15.270' AS DateTime), NULL, CAST(N'2023-08-02T23:44:15.273' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (159, NULL, N'0', 0, NULL, NULL, NULL, CAST(N'2023-08-03T13:24:55.507' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (160, NULL, N'0', 0, NULL, NULL, NULL, CAST(N'2023-08-03T13:24:58.267' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (161, NULL, N'0', 0, NULL, NULL, NULL, CAST(N'2023-08-03T13:25:00.187' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (162, NULL, N'0', 1, NULL, CAST(N'2023-08-03T13:25:03.593' AS DateTime), NULL, CAST(N'2023-08-03T13:25:03.593' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (164, NULL, N'0', 1, NULL, CAST(N'2023-08-04T16:55:43.157' AS DateTime), NULL, CAST(N'2023-08-04T16:55:43.473' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (165, NULL, N'0', 1, NULL, CAST(N'2023-08-04T16:57:19.597' AS DateTime), NULL, CAST(N'2023-08-04T16:57:19.597' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (166, NULL, N'0', 1, NULL, CAST(N'2023-08-05T11:42:49.933' AS DateTime), NULL, CAST(N'2023-08-05T11:42:49.967' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (169, NULL, N'0', 1, NULL, CAST(N'2023-08-06T10:14:39.590' AS DateTime), NULL, CAST(N'2023-08-06T10:14:40.160' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (20, NULL, N'0', 0, NULL, NULL, NULL, CAST(N'2023-06-17T00:11:21.150' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (21, NULL, N'0', 0, NULL, NULL, NULL, CAST(N'2023-06-17T00:11:23.430' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (22, NULL, N'0', 1, NULL, CAST(N'2023-06-17T00:11:33.267' AS DateTime), NULL, CAST(N'2023-06-17T00:11:33.267' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (24, NULL, N'0', 1, NULL, CAST(N'2023-06-17T00:38:00.467' AS DateTime), NULL, CAST(N'2023-06-17T00:38:00.467' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (27, NULL, N'0', 1, NULL, CAST(N'2023-06-17T04:19:13.167' AS DateTime), NULL, CAST(N'2023-06-17T04:19:13.170' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (31, NULL, N'0', 1, NULL, CAST(N'2023-06-17T05:56:26.693' AS DateTime), NULL, CAST(N'2023-06-17T05:56:26.720' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (35, NULL, N'0', 1, NULL, CAST(N'2023-06-19T22:42:35.193' AS DateTime), NULL, CAST(N'2023-06-19T22:42:35.193' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (42, NULL, N'0', 1, NULL, CAST(N'2023-06-20T06:16:50.323' AS DateTime), NULL, CAST(N'2023-06-20T06:16:50.410' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (47, NULL, N'0', 0, NULL, NULL, NULL, CAST(N'2023-06-21T21:49:53.847' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (48, NULL, N'0', 1, NULL, CAST(N'2023-06-21T21:50:08.343' AS DateTime), NULL, CAST(N'2023-06-21T21:50:08.343' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (49, NULL, N'0', 1, NULL, CAST(N'2023-06-21T22:46:03.253' AS DateTime), NULL, CAST(N'2023-06-21T22:46:03.290' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (50, NULL, N'0', 1, NULL, CAST(N'2023-06-21T22:46:03.970' AS DateTime), NULL, CAST(N'2023-06-21T22:46:03.970' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (57, NULL, N'0', 1, NULL, CAST(N'2023-06-24T11:10:52.980' AS DateTime), NULL, CAST(N'2023-06-24T11:10:53.010' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (59, NULL, N'0', 1, NULL, CAST(N'2023-06-24T13:50:17.900' AS DateTime), NULL, CAST(N'2023-06-24T13:50:17.920' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (61, NULL, N'0', 1, NULL, CAST(N'2023-06-24T16:42:51.237' AS DateTime), NULL, CAST(N'2023-06-24T16:42:51.237' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (78, NULL, N'1', 1, NULL, CAST(N'2023-06-26T21:32:31.920' AS DateTime), NULL, CAST(N'2023-06-26T21:32:31.920' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (113, NULL, N'0', 1, NULL, CAST(N'2023-07-24T17:20:20.153' AS DateTime), NULL, CAST(N'2023-07-24T17:20:20.157' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (133, NULL, N'0', 1, NULL, CAST(N'2023-08-01T15:27:22.553' AS DateTime), NULL, CAST(N'2023-08-01T15:27:22.593' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (158, NULL, N'0', 1, NULL, CAST(N'2023-08-03T12:33:30.650' AS DateTime), NULL, CAST(N'2023-08-03T12:33:30.650' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (28, NULL, N'0', 1, NULL, CAST(N'2023-06-17T04:20:35.547' AS DateTime), NULL, CAST(N'2023-06-17T04:20:35.547' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (29, NULL, N'0', 1, NULL, CAST(N'2023-06-17T04:21:09.833' AS DateTime), NULL, CAST(N'2023-06-17T04:21:09.833' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (30, NULL, N'0', 1, NULL, CAST(N'2023-06-17T04:23:54.883' AS DateTime), NULL, CAST(N'2023-06-17T04:23:54.883' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (32, NULL, N'0', 1, NULL, CAST(N'2023-06-17T07:16:55.490' AS DateTime), NULL, CAST(N'2023-06-17T07:16:55.490' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (36, NULL, N'0', 1, NULL, CAST(N'2023-06-19T23:08:44.577' AS DateTime), NULL, CAST(N'2023-06-19T23:08:44.607' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (52, NULL, N'0', 1, NULL, CAST(N'2023-06-22T00:26:40.180' AS DateTime), NULL, CAST(N'2023-06-22T00:26:40.227' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (63, NULL, N'0', 1, NULL, CAST(N'2023-06-25T17:34:26.660' AS DateTime), NULL, CAST(N'2023-06-25T17:34:26.683' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (64, NULL, N'0', 1, NULL, CAST(N'2023-06-25T17:36:43.177' AS DateTime), NULL, CAST(N'2023-06-25T17:36:43.177' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (65, NULL, N'0', 1, NULL, CAST(N'2023-06-25T17:46:56.087' AS DateTime), NULL, CAST(N'2023-06-25T17:46:56.087' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (72, NULL, N'1', 1, NULL, CAST(N'2023-06-26T21:07:22.163' AS DateTime), NULL, CAST(N'2023-06-26T21:07:22.163' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (73, NULL, N'0', 1, NULL, CAST(N'2023-06-26T21:18:36.707' AS DateTime), NULL, CAST(N'2023-06-26T21:18:36.733' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (74, NULL, N'1', 0, NULL, NULL, NULL, CAST(N'2023-06-26T21:18:44.360' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (75, NULL, N'1', 0, NULL, NULL, NULL, CAST(N'2023-06-26T21:19:11.213' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (76, NULL, N'1', 1, NULL, CAST(N'2023-06-26T21:19:29.147' AS DateTime), NULL, CAST(N'2023-06-26T21:19:29.147' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (77, NULL, N'1', 1, NULL, CAST(N'2023-06-26T21:22:47.890' AS DateTime), NULL, CAST(N'2023-06-26T21:22:47.890' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (81, NULL, N'0', 1, NULL, CAST(N'2023-06-27T00:04:10.330' AS DateTime), NULL, CAST(N'2023-06-27T00:04:10.330' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (83, NULL, N'0', 1, NULL, CAST(N'2023-06-27T07:49:59.643' AS DateTime), NULL, CAST(N'2023-06-27T07:49:59.643' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (90, NULL, N'0', 1, NULL, CAST(N'2023-07-03T23:24:20.130' AS DateTime), NULL, CAST(N'2023-07-03T23:24:20.207' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (93, NULL, N'0', 1, NULL, CAST(N'2023-07-06T18:55:30.820' AS DateTime), NULL, CAST(N'2023-07-06T18:55:30.857' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (151, NULL, N'0', 1, NULL, CAST(N'2023-08-03T00:01:30.467' AS DateTime), NULL, CAST(N'2023-08-03T00:01:30.490' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (153, NULL, N'0', 1, NULL, CAST(N'2023-08-03T10:15:17.193' AS DateTime), NULL, CAST(N'2023-08-03T10:15:17.233' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (154, NULL, N'0', 1, NULL, CAST(N'2023-08-03T11:39:43.153' AS DateTime), NULL, CAST(N'2023-08-03T11:39:43.153' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (155, NULL, N'0', 0, NULL, NULL, NULL, CAST(N'2023-08-03T11:54:20.060' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (156, NULL, N'0', 1, NULL, CAST(N'2023-08-03T11:54:26.610' AS DateTime), NULL, CAST(N'2023-08-03T11:54:26.610' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (89, NULL, N'0', 1, NULL, CAST(N'2023-07-03T22:44:07.450' AS DateTime), NULL, CAST(N'2023-07-03T22:44:07.450' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (99, NULL, N'0', 1, NULL, CAST(N'2023-07-15T16:30:46.627' AS DateTime), NULL, CAST(N'2023-07-15T16:30:46.627' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (102, NULL, N'0', 1, NULL, CAST(N'2023-07-20T10:03:28.517' AS DateTime), NULL, CAST(N'2023-07-20T10:03:28.577' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (106, NULL, N'0', 1, NULL, CAST(N'2023-07-20T14:57:13.783' AS DateTime), NULL, CAST(N'2023-07-20T14:57:13.893' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (107, NULL, N'0', 1, NULL, CAST(N'2023-07-20T17:29:23.163' AS DateTime), NULL, CAST(N'2023-07-20T17:29:23.167' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (109, NULL, N'0', 1, NULL, CAST(N'2023-07-21T11:07:13.660' AS DateTime), NULL, CAST(N'2023-07-21T11:07:13.877' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (117, NULL, N'0', 0, NULL, NULL, NULL, CAST(N'2023-07-27T09:52:59.170' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (118, NULL, N'0', 0, NULL, NULL, NULL, CAST(N'2023-07-27T09:53:06.910' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (119, NULL, N'0', 0, NULL, NULL, NULL, CAST(N'2023-07-27T09:53:32.437' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (120, NULL, N'0', 1, NULL, CAST(N'2023-07-27T09:53:43.323' AS DateTime), NULL, CAST(N'2023-07-27T09:53:43.323' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (121, NULL, N'0', 1, NULL, CAST(N'2023-07-27T20:08:51.527' AS DateTime), NULL, CAST(N'2023-07-27T20:08:51.560' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (122, NULL, N'0', 1, NULL, CAST(N'2023-07-28T07:15:49.573' AS DateTime), NULL, CAST(N'2023-07-28T07:15:49.897' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (126, NULL, N'0', 1, NULL, CAST(N'2023-07-28T17:25:06.637' AS DateTime), NULL, CAST(N'2023-07-28T17:25:06.670' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (127, NULL, N'0', 1, NULL, CAST(N'2023-07-29T10:32:31.780' AS DateTime), NULL, CAST(N'2023-07-29T10:32:31.813' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (129, NULL, N'0', 1, NULL, CAST(N'2023-07-30T00:02:17.803' AS DateTime), NULL, CAST(N'2023-07-30T00:02:18.183' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (132, NULL, N'0', 1, NULL, CAST(N'2023-08-01T13:22:51.337' AS DateTime), NULL, CAST(N'2023-08-01T13:22:51.397' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (135, NULL, N'0', 0, NULL, NULL, NULL, CAST(N'2023-08-02T10:26:50.903' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (136, NULL, N'0', 0, NULL, NULL, NULL, CAST(N'2023-08-02T10:27:06.697' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (137, NULL, N'0', 0, NULL, NULL, NULL, CAST(N'2023-08-02T10:27:57.317' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (138, NULL, N'0', 1, NULL, CAST(N'2023-08-02T10:28:43.500' AS DateTime), NULL, CAST(N'2023-08-02T10:28:43.500' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (139, NULL, N'0', 1, NULL, CAST(N'2023-08-02T12:46:32.837' AS DateTime), NULL, CAST(N'2023-08-02T12:46:32.907' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (140, NULL, N'0', 1, NULL, CAST(N'2023-08-02T16:23:13.040' AS DateTime), NULL, CAST(N'2023-08-02T16:23:13.043' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (141, NULL, N'0', 1, NULL, CAST(N'2023-08-02T19:05:49.293' AS DateTime), NULL, CAST(N'2023-08-02T19:05:49.327' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (142, NULL, N'0', 1, NULL, CAST(N'2023-08-02T20:16:32.717' AS DateTime), NULL, CAST(N'2023-08-02T20:16:32.753' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (143, NULL, N'0', 1, NULL, CAST(N'2023-08-02T20:19:22.663' AS DateTime), NULL, CAST(N'2023-08-02T20:19:22.663' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (152, NULL, N'0', 1, NULL, CAST(N'2023-08-03T00:06:45.690' AS DateTime), NULL, CAST(N'2023-08-03T00:06:45.730' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (157, NULL, N'0', 1, NULL, CAST(N'2023-08-03T12:18:47.207' AS DateTime), NULL, CAST(N'2023-08-03T12:18:47.207' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (163, NULL, N'0', 1, NULL, CAST(N'2023-08-04T15:30:00.813' AS DateTime), NULL, CAST(N'2023-08-04T15:30:00.843' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (167, NULL, N'0', 1, NULL, CAST(N'2023-08-05T13:02:31.493' AS DateTime), NULL, CAST(N'2023-08-05T13:02:31.573' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (168, NULL, N'0', 1, NULL, CAST(N'2023-08-05T14:35:48.910' AS DateTime), NULL, CAST(N'2023-08-05T14:35:48.910' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (171, NULL, N'0', 1, NULL, CAST(N'2023-08-13T13:33:20.280' AS DateTime), NULL, CAST(N'2023-08-13T13:33:20.280' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (173, NULL, N'0', 1, NULL, CAST(N'2023-08-13T21:16:28.707' AS DateTime), NULL, CAST(N'2023-08-13T21:16:28.743' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (177, NULL, N'0', 1, NULL, CAST(N'2023-08-14T15:44:37.470' AS DateTime), NULL, CAST(N'2023-08-14T15:44:37.470' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (178, NULL, N'0', 1, NULL, CAST(N'2023-08-14T15:45:28.900' AS DateTime), NULL, CAST(N'2023-08-14T15:45:28.900' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (179, NULL, N'0', 1, NULL, CAST(N'2023-08-14T15:46:38.287' AS DateTime), NULL, CAST(N'2023-08-14T15:46:38.347' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (180, NULL, N'0', 1, NULL, CAST(N'2023-08-14T15:49:25.620' AS DateTime), NULL, CAST(N'2023-08-14T15:49:25.620' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (181, NULL, N'0', 1, NULL, CAST(N'2023-08-14T15:50:42.040' AS DateTime), NULL, CAST(N'2023-08-14T15:50:42.040' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (182, NULL, N'0', 1, NULL, CAST(N'2023-08-14T15:51:32.313' AS DateTime), NULL, CAST(N'2023-08-14T15:51:32.313' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (183, NULL, N'0', 1, NULL, CAST(N'2023-08-14T15:53:51.697' AS DateTime), NULL, CAST(N'2023-08-14T15:53:51.697' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (186, NULL, N'0', 1, NULL, CAST(N'2023-09-08T16:16:57.433' AS DateTime), NULL, CAST(N'2023-09-08T16:16:57.473' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (170, NULL, N'0', 1, NULL, CAST(N'2023-08-13T13:33:19.260' AS DateTime), NULL, CAST(N'2023-08-13T13:33:19.323' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (172, NULL, N'0', 1, NULL, CAST(N'2023-08-13T13:39:18.083' AS DateTime), NULL, CAST(N'2023-08-13T13:39:18.083' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (174, NULL, N'0', 1, NULL, CAST(N'2023-08-13T22:07:10.797' AS DateTime), NULL, CAST(N'2023-08-13T22:07:10.797' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (175, NULL, N'0', 1, NULL, CAST(N'2023-08-14T15:40:39.880' AS DateTime), NULL, CAST(N'2023-08-14T15:40:40.260' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (176, NULL, N'0', 1, NULL, CAST(N'2023-08-14T15:42:51.133' AS DateTime), NULL, CAST(N'2023-08-14T15:42:51.133' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (185, NULL, N'0', 1, NULL, CAST(N'2023-08-14T16:19:32.800' AS DateTime), NULL, CAST(N'2023-08-14T16:19:32.800' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (184, NULL, N'0', 1, NULL, CAST(N'2023-08-14T16:18:57.063' AS DateTime), NULL, CAST(N'2023-08-14T16:18:57.097' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (187, NULL, N'0', 1, NULL, CAST(N'2023-09-09T13:05:35.990' AS DateTime), NULL, CAST(N'2023-09-09T13:05:36.290' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (189, NULL, N'0', 1, NULL, CAST(N'2023-09-11T17:00:27.730' AS DateTime), NULL, CAST(N'2023-09-11T17:00:27.763' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (190, NULL, N'0', 1, NULL, CAST(N'2023-09-23T13:45:02.183' AS DateTime), NULL, CAST(N'2023-09-23T13:45:02.197' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (191, NULL, N'0', 1, NULL, CAST(N'2023-09-23T13:47:44.397' AS DateTime), NULL, CAST(N'2023-09-23T13:47:44.397' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (192, NULL, N'0', 1, NULL, CAST(N'2023-09-23T13:48:27.173' AS DateTime), NULL, CAST(N'2023-09-23T13:48:27.173' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (193, NULL, N'0', 1, NULL, CAST(N'2023-09-23T13:50:05.723' AS DateTime), NULL, CAST(N'2023-09-23T13:50:05.723' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (194, NULL, N'0', 1, NULL, CAST(N'2023-09-23T13:51:06.273' AS DateTime), NULL, CAST(N'2023-09-23T13:51:06.273' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (195, NULL, N'0', 1, NULL, CAST(N'2023-09-23T13:52:59.327' AS DateTime), NULL, CAST(N'2023-09-23T13:52:59.327' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (196, NULL, N'0', 1, NULL, CAST(N'2023-09-23T13:53:49.163' AS DateTime), NULL, CAST(N'2023-09-23T13:53:49.163' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (197, NULL, N'0', 1, NULL, CAST(N'2023-09-23T14:26:52.813' AS DateTime), NULL, CAST(N'2023-09-23T14:26:52.813' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (198, NULL, N'0', 1, NULL, CAST(N'2023-09-23T16:44:27.090' AS DateTime), NULL, CAST(N'2023-09-23T16:44:27.090' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (200, NULL, N'0', 1, NULL, CAST(N'2023-09-23T22:17:19.357' AS DateTime), NULL, CAST(N'2023-09-23T22:17:19.357' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (201, NULL, N'1', 0, NULL, NULL, NULL, CAST(N'2023-09-24T00:03:02.907' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (202, NULL, N'1', 1, NULL, CAST(N'2023-09-24T00:03:06.810' AS DateTime), NULL, CAST(N'2023-09-24T00:03:06.810' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (203, NULL, N'1', 0, NULL, NULL, NULL, CAST(N'2023-09-24T00:05:26.700' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (204, NULL, N'1', 0, NULL, NULL, NULL, CAST(N'2023-09-24T00:05:28.687' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (205, NULL, N'1', 1, NULL, CAST(N'2023-09-24T00:05:31.293' AS DateTime), NULL, CAST(N'2023-09-24T00:05:31.293' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (206, NULL, N'0', 0, NULL, NULL, NULL, CAST(N'2023-09-24T00:13:39.907' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (207, NULL, N'0', 0, NULL, NULL, NULL, CAST(N'2023-09-24T00:13:43.277' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (208, NULL, N'0', 0, NULL, NULL, NULL, CAST(N'2023-09-24T00:13:46.860' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (209, NULL, N'0', 0, NULL, NULL, NULL, CAST(N'2023-09-24T00:13:53.000' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (210, NULL, N'0', 0, NULL, NULL, NULL, CAST(N'2023-09-24T00:13:56.670' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (211, NULL, N'0', 0, NULL, NULL, NULL, CAST(N'2023-09-24T00:14:06.957' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (212, NULL, N'0', 0, NULL, NULL, NULL, CAST(N'2023-09-24T00:14:09.763' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (213, NULL, N'0', 1, NULL, CAST(N'2023-09-24T00:14:21.710' AS DateTime), NULL, CAST(N'2023-09-24T00:14:21.710' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (214, NULL, N'0', 1, NULL, CAST(N'2023-09-24T00:21:51.543' AS DateTime), NULL, CAST(N'2023-09-24T00:21:51.543' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (215, NULL, N'0', 1, NULL, CAST(N'2023-09-24T00:21:59.297' AS DateTime), NULL, CAST(N'2023-09-24T00:21:59.297' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (216, NULL, N'0', 1, NULL, CAST(N'2023-09-24T01:38:18.363' AS DateTime), NULL, CAST(N'2023-09-24T01:38:18.487' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (218, NULL, N'0', 1, NULL, CAST(N'2023-09-24T11:01:59.363' AS DateTime), NULL, CAST(N'2023-09-24T11:01:59.690' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (220, NULL, N'0', 1, NULL, CAST(N'2023-09-24T12:38:19.603' AS DateTime), NULL, CAST(N'2023-09-24T12:38:19.603' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (223, NULL, N'1', 1, NULL, CAST(N'2023-09-24T13:07:51.663' AS DateTime), NULL, CAST(N'2023-09-24T13:07:51.663' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (225, NULL, N'0', 1, NULL, CAST(N'2023-09-29T14:45:36.633' AS DateTime), NULL, CAST(N'2023-09-29T14:45:36.673' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (226, NULL, N'0', 1, NULL, CAST(N'2023-10-01T11:58:31.160' AS DateTime), NULL, CAST(N'2023-10-01T11:58:31.200' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (227, NULL, N'0', 1, NULL, CAST(N'2023-10-01T14:46:40.087' AS DateTime), NULL, CAST(N'2023-10-01T14:46:40.113' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (228, NULL, N'0', 1, NULL, CAST(N'2023-10-03T17:20:10.840' AS DateTime), NULL, CAST(N'2023-10-03T17:20:10.883' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (230, NULL, N'0', 1, NULL, CAST(N'2023-10-04T13:16:53.907' AS DateTime), NULL, CAST(N'2023-10-04T13:16:53.943' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (231, NULL, N'0', 1, NULL, CAST(N'2023-10-04T15:08:35.500' AS DateTime), NULL, CAST(N'2023-10-04T15:08:35.560' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (188, NULL, N'0', 1, NULL, CAST(N'2023-09-10T12:23:03.103' AS DateTime), NULL, CAST(N'2023-09-10T12:23:03.167' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (229, NULL, N'0', 1, NULL, CAST(N'2023-10-03T17:38:55.057' AS DateTime), NULL, CAST(N'2023-10-03T17:38:55.057' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (199, NULL, N'0', 1, NULL, CAST(N'2023-09-23T18:12:33.707' AS DateTime), NULL, CAST(N'2023-09-23T18:12:33.707' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (217, NULL, N'0', 1, NULL, CAST(N'2023-09-24T02:41:27.580' AS DateTime), NULL, CAST(N'2023-09-24T02:41:27.603' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (219, NULL, N'0', 1, NULL, CAST(N'2023-09-24T12:17:00.820' AS DateTime), NULL, CAST(N'2023-09-24T12:17:00.847' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (221, NULL, N'1', 0, NULL, NULL, NULL, CAST(N'2023-09-24T13:07:26.340' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (222, NULL, N'1', 1, NULL, CAST(N'2023-09-24T13:07:51.663' AS DateTime), NULL, CAST(N'2023-09-24T13:07:51.663' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (224, NULL, N'0', 1, NULL, CAST(N'2023-09-24T13:08:10.967' AS DateTime), NULL, CAST(N'2023-09-24T13:08:10.967' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([LogingActivityId], [LoginId], [UserTypeId], [LoginStatusId], [IpAddress], [LoginDateTime], [LogoutDateTime], [CreatedDate]) VALUES (232, NULL, N'0', 1, NULL, CAST(N'2023-10-04T17:09:25.430' AS DateTime), NULL, CAST(N'2023-10-04T17:09:25.457' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[tbl_LogingActivity] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_MenuMaster] ON 
GO
INSERT [dbo].[tbl_MenuMaster] ([MenuId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (1, N'Dashboard', N'dashboard', N'dripicons-home', 1, 1, 0, 16, 1, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0)
GO
INSERT [dbo].[tbl_MenuMaster] ([MenuId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (2, N'System Setting', N'#PopUpSystemSetting', N'mdi mdi-cog-sync', 1, 2, 0, 11, 1, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0)
GO
INSERT [dbo].[tbl_MenuMaster] ([MenuId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (3, N'Config', N'#', N'fa fa-cog', 1, 3, 0, 11, 1, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0)
GO
INSERT [dbo].[tbl_MenuMaster] ([MenuId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (4, N'System Config', N'configSystem', N'mdi mdi-cog-sync', 1, 4, 3, 11, 1, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0)
GO
INSERT [dbo].[tbl_MenuMaster] ([MenuId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (5, N'Control Room', N'configControlRoom', N'fa fa-compass', 1, 5, 3, 11, 1, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0)
GO
INSERT [dbo].[tbl_MenuMaster] ([MenuId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (6, N'Package', N'configPackage', N'fa fa-road', 1, 6, 3, 11, 1, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0)
GO
INSERT [dbo].[tbl_MenuMaster] ([MenuId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (7, N'Equipment', N'configEquipment', N'fa fa-laptop', 1, 7, 3, 11, 1, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0)
GO
INSERT [dbo].[tbl_MenuMaster] ([MenuId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (8, N'Vehicle Class', N'configVehicleClass', N'fa fa-taxi', 1, 8, 3, 11, 1, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0)
GO
INSERT [dbo].[tbl_MenuMaster] ([MenuId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (9, N'Lane Config', N'configLaneConfig', N'mdi mdi-highway', 1, 9, 3, 11, 1, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0)
GO
INSERT [dbo].[tbl_MenuMaster] ([MenuId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (10, N'Roles', N'configRole', N'fa fa-universal-access', 1, 10, 3, 11, 1, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0)
GO
INSERT [dbo].[tbl_MenuMaster] ([MenuId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (11, N'Users', N'configUsers', N'fa fa-user', 1, 11, 3, 11, 1, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0)
GO
INSERT [dbo].[tbl_MenuMaster] ([MenuId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (12, N'TMCS', N'tmcs', N'mdi mdi-cctv', 1, 12, 0, 5, 0, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0)
GO
INSERT [dbo].[tbl_MenuMaster] ([MenuId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (13, N'ADAS', N'#', N'mdi mdi-rv-truck', 1, 13, 0, 1, 0, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0)
GO
INSERT [dbo].[tbl_MenuMaster] ([MenuId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (14, N'Equipment Config', N'adasEquipmentConfig', N'mdi mdi-monitor-dashboard', 1, 14, 13, 1, 0, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0)
GO
INSERT [dbo].[tbl_MenuMaster] ([MenuId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (15, N'Vehicle View', N'adasVehicleview', N'mdi mdi-truck-delivery', 1, 15, 13, 1, 0, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0)
GO
INSERT [dbo].[tbl_MenuMaster] ([MenuId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (16, N'ECS', N'#', N'mdi mdi-rv-truck', 1, 16, 0, 3, 0, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0)
GO
INSERT [dbo].[tbl_MenuMaster] ([MenuId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (17, N'Equipment Config', N'ecsEquipmentConfig', N'mdi mdi-monitor-dashboard', 1, 17, 16, 3, 0, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0)
GO
INSERT [dbo].[tbl_MenuMaster] ([MenuId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (18, N'Event History ', N'ecsEventHistroy', N'mdi mdi-database-clock', 1, 18, 16, 3, 0, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0)
GO
INSERT [dbo].[tbl_MenuMaster] ([MenuId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (19, N'VIDS', N'#', N'ti-video-camera', 1, 19, 0, 6, 1, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0)
GO
INSERT [dbo].[tbl_MenuMaster] ([MenuId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (20, N'Equipment Config', N'vidsEquipmentConfig', N'mdi mdi-monitor-dashboard', 1, 20, 19, 6, 1, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0)
GO
INSERT [dbo].[tbl_MenuMaster] ([MenuId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (21, N'Event Config', N'vidsEventConfig', N'mdi mdi-file-cog-outline', 1, 21, 19, 6, 1, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0)
GO
INSERT [dbo].[tbl_MenuMaster] ([MenuId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (22, N'Event History', N'vidsEventHistroy', N'mdi mdi-database-clock', 1, 22, 19, 6, 1, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0)
GO
INSERT [dbo].[tbl_MenuMaster] ([MenuId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (23, N'Un audited', N'vidsValidation', N'mdi mdi-file-clock-outline', 1, 23, 19, 6, 1, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0)
GO
INSERT [dbo].[tbl_MenuMaster] ([MenuId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (24, N'Audited', N'vidsValidated', N'mdi mdi-file-check-outline', 1, 24, 19, 6, 1, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0)
GO
INSERT [dbo].[tbl_MenuMaster] ([MenuId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (25, N'VSDS', N'#', N'mdi mdi-video-box', 1, 25, 0, 8, 1, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0)
GO
INSERT [dbo].[tbl_MenuMaster] ([MenuId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (26, N'Equipment Config', N'vsdsEquipmentConfig', N'mdi mdi-monitor-dashboard', 1, 26, 25, 8, 1, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0)
GO
INSERT [dbo].[tbl_MenuMaster] ([MenuId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (27, N'Event Config', N'vsdsEventConfig', N'mdi mdi-file-cog-outline', 1, 27, 25, 8, 1, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0)
GO
INSERT [dbo].[tbl_MenuMaster] ([MenuId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (28, N'Event History', N'vsdsEventHistroy', N'mdi mdi-database-clock', 1, 28, 25, 8, 1, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0)
GO
INSERT [dbo].[tbl_MenuMaster] ([MenuId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (29, N'Un audited', N'vsdsValidation', N'mdi mdi-file-clock-outline', 1, 29, 25, 8, 1, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0)
GO
INSERT [dbo].[tbl_MenuMaster] ([MenuId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (30, N'Audited', N'vsdsValidated', N'mdi mdi-file-check-outline', 1, 30, 25, 8, 1, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0)
GO
INSERT [dbo].[tbl_MenuMaster] ([MenuId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (31, N'ATCC', N'#', N'mdi mdi-video', 1, 31, 0, 2, 1, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0)
GO
INSERT [dbo].[tbl_MenuMaster] ([MenuId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (32, N'Equipment Config', N'atccEquipmentConfig', N'mdi mdi-monitor-dashboard', 1, 32, 31, 2, 1, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0)
GO
INSERT [dbo].[tbl_MenuMaster] ([MenuId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (33, N'Event History', N'atccEventHistroy', N'mdi mdi-database-clock', 1, 33, 31, 2, 1, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0)
GO
INSERT [dbo].[tbl_MenuMaster] ([MenuId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (34, N'Un audited', N'atccValidation', N'mdi mdi-file-clock-outline', 1, 34, 31, 2, 1, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0)
GO
INSERT [dbo].[tbl_MenuMaster] ([MenuId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (35, N'Audited', N'atccValidated', N'mdi mdi-file-check-outline', 1, 35, 31, 2, 1, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0)
GO
INSERT [dbo].[tbl_MenuMaster] ([MenuId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (36, N'VMS', N'#', N'mdi mdi-message-reply-text', 1, 36, 0, 7, 1, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0)
GO
INSERT [dbo].[tbl_MenuMaster] ([MenuId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (37, N'Message Details', N'vmsMessageDetails', N'mdi mdi-monitor-dashboard', 1, 37, 36, 7, 1, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0)
GO
INSERT [dbo].[tbl_MenuMaster] ([MenuId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (38, N'Message History ', N'vmsMessageHistory ', N'mdi mdi-database-clock', 1, 38, 36, 7, 1, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0)
GO
INSERT [dbo].[tbl_MenuMaster] ([MenuId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (39, N'TTMS', N'ttmsEventHistroy', N'mdi mdi-sort-clock-descending-outline', 1, 39, 0, 12, 0, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0)
GO
INSERT [dbo].[tbl_MenuMaster] ([MenuId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (40, N'E-Challan', N'#', N'mdi mdi-account-cash', 1, 40, 0, 15, 0, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0)
GO
INSERT [dbo].[tbl_MenuMaster] ([MenuId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (41, N'Pending', N'challanPending', N'mdi mdi-circle-slice-1', 1, 41, 40, 15, 0, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0)
GO
INSERT [dbo].[tbl_MenuMaster] ([MenuId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (42, N'Closed', N'challanClosed', N'mdi mdi-circle-slice-7', 1, 42, 40, 14, 0, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0)
GO
INSERT [dbo].[tbl_MenuMaster] ([MenuId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (43, N'In-Progress', N'imsProgress', N'mdi mdi-circle-slice-5', 1, 43, 40, 15, 0, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0)
GO
INSERT [dbo].[tbl_MenuMaster] ([MenuId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (44, N'IMS', N'#', N'fa fa-exclamation-triangle', 1, 44, 0, 10, 1, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0)
GO
INSERT [dbo].[tbl_MenuMaster] ([MenuId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (45, N'Pending', N'imsPending', N'mdi mdi-circle-slice-1', 1, 45, 44, 10, 1, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0)
GO
INSERT [dbo].[tbl_MenuMaster] ([MenuId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (46, N'In-Progress', N'imsProgress', N'mdi mdi-circle-slice-5', 1, 46, 44, 10, 1, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0)
GO
INSERT [dbo].[tbl_MenuMaster] ([MenuId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (47, N'Close', N'imsClosed', N'mdi mdi-circle-slice-7', 1, 47, 44, 10, 1, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0)
GO
INSERT [dbo].[tbl_MenuMaster] ([MenuId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (48, N'Weather', N'met', N'mdi mdi-weather-cloudy-alert', 1, 48, 0, 9, 1, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0)
GO
INSERT [dbo].[tbl_MenuMaster] ([MenuId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (49, N'Event Config', N'metEventConfig', N'mdi mdi-message-reply-text', 1, 49, 48, 9, 1, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0)
GO
INSERT [dbo].[tbl_MenuMaster] ([MenuId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (50, N'Event History ', N'metEventHistory', N'mdi mdi-database-clock', 1, 50, 48, 9, 1, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0)
GO
INSERT [dbo].[tbl_MenuMaster] ([MenuId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (51, N'Reporting', N'rmsReports', N'fa fa-file', 1, 51, 0, 13, 1, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0)
GO
SET IDENTITY_INSERT [dbo].[tbl_MenuMaster] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_PackageDetails] ON 
GO
INSERT [dbo].[tbl_PackageDetails] ([PackageId], [ControlRoomId], [PackageName], [StartChainageNumber], [EndChainageNumber], [StartLatitude], [StartLongitude], [EndLatitude], [EndLongitude], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (1, 1, N'PKG-01', CAST(355.000 AS Decimal(16, 3)), CAST(415.000 AS Decimal(16, 3)), CAST(0.000000000 AS Decimal(12, 9)), CAST(0.000000000 AS Decimal(12, 9)), CAST(0.000000000 AS Decimal(12, 9)), CAST(0.000000000 AS Decimal(12, 9)), 1, CAST(N'2023-06-20T15:51:12.060' AS DateTime), 0, CAST(N'2023-09-23T17:28:56.223' AS DateTime), 0)
GO
SET IDENTITY_INSERT [dbo].[tbl_PackageDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_ReportMaster] ON 
GO
INSERT [dbo].[tbl_ReportMaster] ([ReportId], [ReportName], [ParentId], [OrderBy], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (1, N'Category Wise', 0, 0, 1, CAST(N'2023-06-20T11:26:33.950' AS DateTime), 0, CAST(N'2023-06-20T11:26:33.950' AS DateTime), 0)
GO
INSERT [dbo].[tbl_ReportMaster] ([ReportId], [ReportName], [ParentId], [OrderBy], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (2, N'Closed Incident Detail', 0, 0, 1, CAST(N'2023-06-20T11:26:33.950' AS DateTime), 0, CAST(N'2023-06-20T11:26:33.950' AS DateTime), 0)
GO
INSERT [dbo].[tbl_ReportMaster] ([ReportId], [ReportName], [ParentId], [OrderBy], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (3, N'Daily Count', 0, 0, 1, CAST(N'2023-06-20T11:26:33.950' AS DateTime), 0, CAST(N'2023-06-20T11:26:33.950' AS DateTime), 0)
GO
INSERT [dbo].[tbl_ReportMaster] ([ReportId], [ReportName], [ParentId], [OrderBy], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (4, N'Location Wise', 0, 0, 1, CAST(N'2023-06-20T11:26:33.950' AS DateTime), 0, CAST(N'2023-06-20T11:26:33.950' AS DateTime), 0)
GO
INSERT [dbo].[tbl_ReportMaster] ([ReportId], [ReportName], [ParentId], [OrderBy], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (5, N'Monthly Count', 0, 0, 1, CAST(N'2023-06-20T11:26:33.950' AS DateTime), 0, CAST(N'2023-06-20T11:26:33.950' AS DateTime), 0)
GO
INSERT [dbo].[tbl_ReportMaster] ([ReportId], [ReportName], [ParentId], [OrderBy], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (6, N'Open Incident Detail', 0, 0, 1, CAST(N'2023-06-20T11:26:33.950' AS DateTime), 0, CAST(N'2023-06-20T11:26:33.950' AS DateTime), 0)
GO
INSERT [dbo].[tbl_ReportMaster] ([ReportId], [ReportName], [ParentId], [OrderBy], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (7, N'Summary', 0, 0, 1, CAST(N'2023-06-20T11:26:33.950' AS DateTime), 0, CAST(N'2023-06-20T11:26:33.950' AS DateTime), 0)
GO
INSERT [dbo].[tbl_ReportMaster] ([ReportId], [ReportName], [ParentId], [OrderBy], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (8, N'Yearly Count', 0, 0, 1, CAST(N'2023-06-20T11:26:33.950' AS DateTime), 0, CAST(N'2023-06-20T11:26:33.950' AS DateTime), 0)
GO
INSERT [dbo].[tbl_ReportMaster] ([ReportId], [ReportName], [ParentId], [OrderBy], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (9, N'Challan Status', 0, 0, 1, CAST(N'2023-06-20T11:26:33.950' AS DateTime), 0, CAST(N'2023-06-20T11:26:33.950' AS DateTime), 0)
GO
INSERT [dbo].[tbl_ReportMaster] ([ReportId], [ReportName], [ParentId], [OrderBy], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (10, N'OverSpeed Report', 0, 0, 1, CAST(N'2023-06-20T11:26:33.950' AS DateTime), 0, CAST(N'2023-06-20T11:26:33.950' AS DateTime), 0)
GO
INSERT [dbo].[tbl_ReportMaster] ([ReportId], [ReportName], [ParentId], [OrderBy], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (11, N'Summary', 0, 0, 1, CAST(N'2023-06-20T11:26:33.950' AS DateTime), 0, CAST(N'2023-06-20T11:26:33.950' AS DateTime), 0)
GO
INSERT [dbo].[tbl_ReportMaster] ([ReportId], [ReportName], [ParentId], [OrderBy], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (12, N'Traffic Violation', 0, 0, 1, CAST(N'2023-06-20T11:26:33.950' AS DateTime), 0, CAST(N'2023-06-20T11:26:33.950' AS DateTime), 0)
GO
INSERT [dbo].[tbl_ReportMaster] ([ReportId], [ReportName], [ParentId], [OrderBy], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (13, N'Validated', 0, 0, 1, CAST(N'2023-06-20T11:26:33.950' AS DateTime), 0, CAST(N'2023-06-20T11:26:33.950' AS DateTime), 0)
GO
INSERT [dbo].[tbl_ReportMaster] ([ReportId], [ReportName], [ParentId], [OrderBy], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (14, N'Validation', 0, 0, 1, CAST(N'2023-06-20T11:26:33.950' AS DateTime), 0, CAST(N'2023-06-20T11:26:33.950' AS DateTime), 0)
GO
INSERT [dbo].[tbl_ReportMaster] ([ReportId], [ReportName], [ParentId], [OrderBy], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (15, N'Violation Count Report', 0, 0, 1, CAST(N'2023-06-20T11:26:33.950' AS DateTime), 0, CAST(N'2023-06-20T11:26:33.950' AS DateTime), 0)
GO
INSERT [dbo].[tbl_ReportMaster] ([ReportId], [ReportName], [ParentId], [OrderBy], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (16, N'Classwise Traffic', 0, 0, 1, CAST(N'2023-06-20T11:26:33.950' AS DateTime), 0, CAST(N'2023-06-20T11:26:33.950' AS DateTime), 0)
GO
INSERT [dbo].[tbl_ReportMaster] ([ReportId], [ReportName], [ParentId], [OrderBy], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (17, N'Hourly Traffic', 0, 0, 1, CAST(N'2023-06-20T11:26:33.950' AS DateTime), 0, CAST(N'2023-06-20T11:26:33.950' AS DateTime), 0)
GO
INSERT [dbo].[tbl_ReportMaster] ([ReportId], [ReportName], [ParentId], [OrderBy], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (18, N'Locationwise Traffic', 0, 0, 1, CAST(N'2023-06-20T11:26:33.950' AS DateTime), 0, CAST(N'2023-06-20T11:26:33.950' AS DateTime), 0)
GO
INSERT [dbo].[tbl_ReportMaster] ([ReportId], [ReportName], [ParentId], [OrderBy], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (19, N'Summary', 0, 0, 1, CAST(N'2023-06-20T11:26:33.950' AS DateTime), 0, CAST(N'2023-06-20T11:26:33.950' AS DateTime), 0)
GO
INSERT [dbo].[tbl_ReportMaster] ([ReportId], [ReportName], [ParentId], [OrderBy], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (20, N'Validated', 0, 0, 1, CAST(N'2023-06-20T11:26:33.950' AS DateTime), 0, CAST(N'2023-06-20T11:26:33.950' AS DateTime), 0)
GO
INSERT [dbo].[tbl_ReportMaster] ([ReportId], [ReportName], [ParentId], [OrderBy], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (21, N'Validation', 0, 0, 1, CAST(N'2023-06-20T11:26:33.950' AS DateTime), 0, CAST(N'2023-06-20T11:26:33.950' AS DateTime), 0)
GO
INSERT [dbo].[tbl_ReportMaster] ([ReportId], [ReportName], [ParentId], [OrderBy], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (22, N'Call Counts', 0, 0, 1, CAST(N'2023-06-20T11:26:33.950' AS DateTime), 0, CAST(N'2023-06-20T11:26:33.950' AS DateTime), 0)
GO
INSERT [dbo].[tbl_ReportMaster] ([ReportId], [ReportName], [ParentId], [OrderBy], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (23, N'Call History', 0, 0, 1, CAST(N'2023-06-20T11:26:33.950' AS DateTime), 0, CAST(N'2023-06-20T11:26:33.950' AS DateTime), 0)
GO
INSERT [dbo].[tbl_ReportMaster] ([ReportId], [ReportName], [ParentId], [OrderBy], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (24, N'Summary', 0, 0, 1, CAST(N'2023-06-20T11:26:33.950' AS DateTime), 0, CAST(N'2023-06-20T11:26:33.950' AS DateTime), 0)
GO
INSERT [dbo].[tbl_ReportMaster] ([ReportId], [ReportName], [ParentId], [OrderBy], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (25, N'Close Ticket Status', 0, 0, 1, CAST(N'2023-06-20T11:26:33.950' AS DateTime), 0, CAST(N'2023-06-20T11:26:33.950' AS DateTime), 0)
GO
INSERT [dbo].[tbl_ReportMaster] ([ReportId], [ReportName], [ParentId], [OrderBy], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (26, N'DownTime Staus', 0, 0, 1, CAST(N'2023-06-20T11:26:33.950' AS DateTime), 0, CAST(N'2023-06-20T11:26:33.950' AS DateTime), 0)
GO
INSERT [dbo].[tbl_ReportMaster] ([ReportId], [ReportName], [ParentId], [OrderBy], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (27, N'Open Ticket Status', 0, 0, 1, CAST(N'2023-06-20T11:26:33.950' AS DateTime), 0, CAST(N'2023-06-20T11:26:33.950' AS DateTime), 0)
GO
INSERT [dbo].[tbl_ReportMaster] ([ReportId], [ReportName], [ParentId], [OrderBy], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (28, N'Summary', 0, 0, 1, CAST(N'2023-06-20T11:26:33.950' AS DateTime), 0, CAST(N'2023-06-20T11:26:33.950' AS DateTime), 0)
GO
INSERT [dbo].[tbl_ReportMaster] ([ReportId], [ReportName], [ParentId], [OrderBy], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (29, N'Category Wise', 0, 0, 1, CAST(N'2023-06-20T11:26:33.950' AS DateTime), 0, CAST(N'2023-06-20T11:26:33.950' AS DateTime), 0)
GO
INSERT [dbo].[tbl_ReportMaster] ([ReportId], [ReportName], [ParentId], [OrderBy], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (30, N'Daily Count', 0, 0, 1, CAST(N'2023-06-20T11:26:33.950' AS DateTime), 0, CAST(N'2023-06-20T11:26:33.950' AS DateTime), 0)
GO
INSERT [dbo].[tbl_ReportMaster] ([ReportId], [ReportName], [ParentId], [OrderBy], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (31, N'Location Wise', 0, 0, 1, CAST(N'2023-06-20T11:26:33.950' AS DateTime), 0, CAST(N'2023-06-20T11:26:33.950' AS DateTime), 0)
GO
INSERT [dbo].[tbl_ReportMaster] ([ReportId], [ReportName], [ParentId], [OrderBy], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (32, N'Monthly Count', 0, 0, 1, CAST(N'2023-06-20T11:26:33.950' AS DateTime), 0, CAST(N'2023-06-20T11:26:33.950' AS DateTime), 0)
GO
INSERT [dbo].[tbl_ReportMaster] ([ReportId], [ReportName], [ParentId], [OrderBy], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (33, N'Summary', 0, 0, 1, CAST(N'2023-06-20T11:26:33.950' AS DateTime), 0, CAST(N'2023-06-20T11:26:33.950' AS DateTime), 0)
GO
INSERT [dbo].[tbl_ReportMaster] ([ReportId], [ReportName], [ParentId], [OrderBy], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (34, N'Validated', 0, 0, 1, CAST(N'2023-06-20T11:26:33.950' AS DateTime), 0, CAST(N'2023-06-20T11:26:33.950' AS DateTime), 0)
GO
INSERT [dbo].[tbl_ReportMaster] ([ReportId], [ReportName], [ParentId], [OrderBy], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (35, N'Validation', 0, 0, 1, CAST(N'2023-06-20T11:26:33.950' AS DateTime), 0, CAST(N'2023-06-20T11:26:33.950' AS DateTime), 0)
GO
INSERT [dbo].[tbl_ReportMaster] ([ReportId], [ReportName], [ParentId], [OrderBy], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (36, N'Yearly Count', 0, 0, 1, CAST(N'2023-06-20T11:26:33.950' AS DateTime), 0, CAST(N'2023-06-20T11:26:33.950' AS DateTime), 0)
GO
INSERT [dbo].[tbl_ReportMaster] ([ReportId], [ReportName], [ParentId], [OrderBy], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (37, N'Location Wise', 0, 0, 1, CAST(N'2023-06-20T11:26:33.950' AS DateTime), 0, CAST(N'2023-06-20T11:26:33.950' AS DateTime), 0)
GO
INSERT [dbo].[tbl_ReportMaster] ([ReportId], [ReportName], [ParentId], [OrderBy], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (38, N'Summary', 0, 0, 1, CAST(N'2023-06-20T11:26:33.950' AS DateTime), 0, CAST(N'2023-06-20T11:26:33.950' AS DateTime), 0)
GO
INSERT [dbo].[tbl_ReportMaster] ([ReportId], [ReportName], [ParentId], [OrderBy], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (39, N'Challan Status', 0, 0, 1, CAST(N'2023-06-20T11:26:33.950' AS DateTime), 0, CAST(N'2023-06-20T11:26:33.950' AS DateTime), 0)
GO
INSERT [dbo].[tbl_ReportMaster] ([ReportId], [ReportName], [ParentId], [OrderBy], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (40, N'OverSpeed', 0, 0, 1, CAST(N'2023-06-20T11:26:33.950' AS DateTime), 0, CAST(N'2023-06-20T11:26:33.950' AS DateTime), 0)
GO
INSERT [dbo].[tbl_ReportMaster] ([ReportId], [ReportName], [ParentId], [OrderBy], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (41, N'Summary', 0, 0, 1, CAST(N'2023-06-20T11:26:33.950' AS DateTime), 0, CAST(N'2023-06-20T11:26:33.950' AS DateTime), 0)
GO
INSERT [dbo].[tbl_ReportMaster] ([ReportId], [ReportName], [ParentId], [OrderBy], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (42, N'Traffic Violation', 0, 0, 1, CAST(N'2023-06-20T11:26:33.950' AS DateTime), 0, CAST(N'2023-06-20T11:26:33.950' AS DateTime), 0)
GO
INSERT [dbo].[tbl_ReportMaster] ([ReportId], [ReportName], [ParentId], [OrderBy], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (43, N'Validated', 0, 0, 1, CAST(N'2023-06-20T11:26:33.950' AS DateTime), 0, CAST(N'2023-06-20T11:26:33.950' AS DateTime), 0)
GO
INSERT [dbo].[tbl_ReportMaster] ([ReportId], [ReportName], [ParentId], [OrderBy], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (44, N'Validation', 0, 0, 1, CAST(N'2023-06-20T11:26:33.950' AS DateTime), 0, CAST(N'2023-06-20T11:26:33.950' AS DateTime), 0)
GO
INSERT [dbo].[tbl_ReportMaster] ([ReportId], [ReportName], [ParentId], [OrderBy], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (45, N'Vehicle Class Accuracy', 0, 0, 1, CAST(N'2023-06-20T11:26:33.950' AS DateTime), 0, CAST(N'2023-06-20T11:26:33.950' AS DateTime), 0)
GO
INSERT [dbo].[tbl_ReportMaster] ([ReportId], [ReportName], [ParentId], [OrderBy], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (46, N'Vehicle OCR Accuracy', 0, 0, 1, CAST(N'2023-06-20T11:26:33.950' AS DateTime), 0, CAST(N'2023-06-20T11:26:33.950' AS DateTime), 0)
GO
INSERT [dbo].[tbl_ReportMaster] ([ReportId], [ReportName], [ParentId], [OrderBy], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (47, N'Violation Count', 0, 0, 1, CAST(N'2023-06-20T11:26:33.950' AS DateTime), 0, CAST(N'2023-06-20T11:26:33.950' AS DateTime), 0)
GO
INSERT [dbo].[tbl_ReportMaster] ([ReportId], [ReportName], [ParentId], [OrderBy], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (48, N'Wrong Direction', 0, 0, 1, CAST(N'2023-06-20T11:26:33.950' AS DateTime), 0, CAST(N'2023-06-20T11:26:33.950' AS DateTime), 0)
GO
INSERT [dbo].[tbl_ReportMaster] ([ReportId], [ReportName], [ParentId], [OrderBy], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (49, N'Wrong Lane', 0, 0, 1, CAST(N'2023-06-20T11:26:33.950' AS DateTime), 0, CAST(N'2023-06-20T11:26:33.950' AS DateTime), 0)
GO
INSERT [dbo].[tbl_ReportMaster] ([ReportId], [ReportName], [ParentId], [OrderBy], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (50, N'Location Wise', 0, 0, 1, CAST(N'2023-06-20T11:26:33.950' AS DateTime), 0, CAST(N'2023-06-20T11:26:33.950' AS DateTime), 0)
GO
INSERT [dbo].[tbl_ReportMaster] ([ReportId], [ReportName], [ParentId], [OrderBy], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (51, N'Summary', 0, 0, 1, CAST(N'2023-06-20T11:26:33.950' AS DateTime), 0, CAST(N'2023-06-20T11:26:33.950' AS DateTime), 0)
GO
SET IDENTITY_INSERT [dbo].[tbl_ReportMaster] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_RoleMaster] ON 
GO
INSERT [dbo].[tbl_RoleMaster] ([RoleId], [RoleName], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (1, N'Admin', 1, CAST(N'2023-06-16T01:15:40.177' AS DateTime), 0, CAST(N'2023-06-26T21:19:25.497' AS DateTime), 0)
GO
INSERT [dbo].[tbl_RoleMaster] ([RoleId], [RoleName], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (2, N'Operator', 1, CAST(N'2023-06-17T05:16:49.577' AS DateTime), 0, CAST(N'2023-06-19T23:15:53.770' AS DateTime), 0)
GO
INSERT [dbo].[tbl_RoleMaster] ([RoleId], [RoleName], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (3, N'Test', 1, CAST(N'2023-08-03T00:10:21.003' AS DateTime), 0, CAST(N'2023-08-03T10:49:29.317' AS DateTime), 0)
GO
SET IDENTITY_INSERT [dbo].[tbl_RoleMaster] OFF
GO
INSERT [dbo].[tbl_RolePermission] ([RoleId], [MenuId], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (2, 1, 1, 1, 1, 1, CAST(N'2023-08-01T17:40:39.860' AS DateTime), 0, CAST(N'2023-08-01T17:40:39.860' AS DateTime), 0)
GO
INSERT [dbo].[tbl_RolePermission] ([RoleId], [MenuId], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (2, 2, 1, 1, 1, 1, CAST(N'2023-08-01T17:40:39.860' AS DateTime), 0, CAST(N'2023-08-01T17:40:39.860' AS DateTime), 0)
GO
INSERT [dbo].[tbl_RolePermission] ([RoleId], [MenuId], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (2, 3, 1, 1, 1, 1, CAST(N'2023-08-01T17:40:39.860' AS DateTime), 0, CAST(N'2023-08-01T17:40:39.860' AS DateTime), 0)
GO
INSERT [dbo].[tbl_RolePermission] ([RoleId], [MenuId], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (2, 7, 0, 0, 0, 1, CAST(N'2023-08-01T17:40:39.860' AS DateTime), 0, CAST(N'2023-08-01T17:40:39.860' AS DateTime), 0)
GO
INSERT [dbo].[tbl_RolePermission] ([RoleId], [MenuId], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (2, 4, 0, 0, 0, 1, CAST(N'2023-08-01T17:40:39.860' AS DateTime), 0, CAST(N'2023-08-01T17:40:39.860' AS DateTime), 0)
GO
INSERT [dbo].[tbl_RolePermission] ([RoleId], [MenuId], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (2, 8, 1, 0, 0, 1, CAST(N'2023-08-01T17:40:39.860' AS DateTime), 0, CAST(N'2023-08-01T17:40:39.860' AS DateTime), 0)
GO
INSERT [dbo].[tbl_RolePermission] ([RoleId], [MenuId], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (2, 9, 1, 0, 0, 1, CAST(N'2023-08-01T17:40:39.860' AS DateTime), 0, CAST(N'2023-08-01T17:40:39.860' AS DateTime), 0)
GO
INSERT [dbo].[tbl_RolePermission] ([RoleId], [MenuId], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (2, 10, 1, 0, 0, 1, CAST(N'2023-08-01T17:40:39.860' AS DateTime), 0, CAST(N'2023-08-01T17:40:39.860' AS DateTime), 0)
GO
INSERT [dbo].[tbl_RolePermission] ([RoleId], [MenuId], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (2, 11, 1, 0, 0, 1, CAST(N'2023-08-01T17:40:39.860' AS DateTime), 0, CAST(N'2023-08-01T17:40:39.860' AS DateTime), 0)
GO
INSERT [dbo].[tbl_RolePermission] ([RoleId], [MenuId], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (2, 13, 1, 0, 0, 1, CAST(N'2023-08-01T17:40:39.860' AS DateTime), 0, CAST(N'2023-08-01T17:40:39.860' AS DateTime), 0)
GO
INSERT [dbo].[tbl_RolePermission] ([RoleId], [MenuId], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (2, 16, 1, 0, 0, 1, CAST(N'2023-08-01T17:40:39.860' AS DateTime), 0, CAST(N'2023-08-01T17:40:39.860' AS DateTime), 0)
GO
INSERT [dbo].[tbl_RolePermission] ([RoleId], [MenuId], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (2, 18, 1, 0, 0, 1, CAST(N'2023-08-01T17:40:39.860' AS DateTime), 0, CAST(N'2023-08-01T17:40:39.860' AS DateTime), 0)
GO
INSERT [dbo].[tbl_RolePermission] ([RoleId], [MenuId], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (2, 25, 0, 0, 0, 1, CAST(N'2023-08-01T17:40:39.860' AS DateTime), 0, CAST(N'2023-08-01T17:40:39.860' AS DateTime), 0)
GO
INSERT [dbo].[tbl_RolePermission] ([RoleId], [MenuId], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (2, 26, 0, 0, 0, 1, CAST(N'2023-08-01T17:40:39.860' AS DateTime), 0, CAST(N'2023-08-01T17:40:39.860' AS DateTime), 0)
GO
INSERT [dbo].[tbl_RolePermission] ([RoleId], [MenuId], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (2, 24, 1, 0, 0, 1, CAST(N'2023-08-01T17:40:39.860' AS DateTime), 0, CAST(N'2023-08-01T17:40:39.860' AS DateTime), 0)
GO
INSERT [dbo].[tbl_RolePermission] ([RoleId], [MenuId], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (2, 27, 0, 0, 0, 1, CAST(N'2023-08-01T17:40:39.860' AS DateTime), 0, CAST(N'2023-08-01T17:40:39.860' AS DateTime), 0)
GO
INSERT [dbo].[tbl_RolePermission] ([RoleId], [MenuId], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (1, 1, 1, 1, 0, 1, CAST(N'2023-06-22T00:00:04.770' AS DateTime), 0, CAST(N'2023-06-22T00:00:04.770' AS DateTime), 0)
GO
INSERT [dbo].[tbl_RolePermission] ([RoleId], [MenuId], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (1, 2, 1, 0, 0, 1, CAST(N'2023-06-22T00:00:04.770' AS DateTime), 0, CAST(N'2023-06-22T00:00:04.770' AS DateTime), 0)
GO
INSERT [dbo].[tbl_RolePermission] ([RoleId], [MenuId], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (1, 3, 1, 0, 0, 1, CAST(N'2023-06-22T00:00:04.770' AS DateTime), 0, CAST(N'2023-06-22T00:00:04.770' AS DateTime), 0)
GO
INSERT [dbo].[tbl_RolePermission] ([RoleId], [MenuId], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (1, 4, 1, 0, 0, 1, CAST(N'2023-06-22T00:00:04.770' AS DateTime), 0, CAST(N'2023-06-22T00:00:04.770' AS DateTime), 0)
GO
INSERT [dbo].[tbl_RolePermission] ([RoleId], [MenuId], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (1, 7, 1, 0, 0, 1, CAST(N'2023-06-22T00:00:04.770' AS DateTime), 0, CAST(N'2023-06-22T00:00:04.770' AS DateTime), 0)
GO
INSERT [dbo].[tbl_RolePermission] ([RoleId], [MenuId], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (1, 8, 1, 0, 0, 1, CAST(N'2023-06-22T00:00:04.770' AS DateTime), 0, CAST(N'2023-06-22T00:00:04.770' AS DateTime), 0)
GO
INSERT [dbo].[tbl_RolePermission] ([RoleId], [MenuId], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (1, 9, 1, 0, 0, 1, CAST(N'2023-06-22T00:00:04.770' AS DateTime), 0, CAST(N'2023-06-22T00:00:04.770' AS DateTime), 0)
GO
INSERT [dbo].[tbl_RolePermission] ([RoleId], [MenuId], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (1, 10, 1, 0, 0, 1, CAST(N'2023-06-22T00:00:04.770' AS DateTime), 0, CAST(N'2023-06-22T00:00:04.770' AS DateTime), 0)
GO
INSERT [dbo].[tbl_RolePermission] ([RoleId], [MenuId], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (1, 11, 1, 0, 0, 1, CAST(N'2023-06-22T00:00:04.770' AS DateTime), 0, CAST(N'2023-06-22T00:00:04.770' AS DateTime), 0)
GO
INSERT [dbo].[tbl_RolePermission] ([RoleId], [MenuId], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (1, 13, 1, 0, 0, 1, CAST(N'2023-06-22T00:00:04.770' AS DateTime), 0, CAST(N'2023-06-22T00:00:04.770' AS DateTime), 0)
GO
INSERT [dbo].[tbl_RolePermission] ([RoleId], [MenuId], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (1, 16, 1, 0, 0, 1, CAST(N'2023-06-22T00:00:04.770' AS DateTime), 0, CAST(N'2023-06-22T00:00:04.770' AS DateTime), 0)
GO
INSERT [dbo].[tbl_RolePermission] ([RoleId], [MenuId], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (1, 18, 1, 0, 0, 1, CAST(N'2023-06-22T00:00:04.770' AS DateTime), 0, CAST(N'2023-06-22T00:00:04.770' AS DateTime), 0)
GO
INSERT [dbo].[tbl_RolePermission] ([RoleId], [MenuId], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (1, 19, 1, 0, 0, 1, CAST(N'2023-06-22T00:00:04.770' AS DateTime), 0, CAST(N'2023-06-22T00:00:04.770' AS DateTime), 0)
GO
INSERT [dbo].[tbl_RolePermission] ([RoleId], [MenuId], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (1, 22, 1, 1, 0, 1, CAST(N'2023-06-22T00:00:04.770' AS DateTime), 0, CAST(N'2023-06-22T00:00:04.770' AS DateTime), 0)
GO
INSERT [dbo].[tbl_RolePermission] ([RoleId], [MenuId], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (1, 24, 1, 0, 0, 1, CAST(N'2023-06-22T00:00:04.770' AS DateTime), 0, CAST(N'2023-06-22T00:00:04.770' AS DateTime), 0)
GO
INSERT [dbo].[tbl_RolePermission] ([RoleId], [MenuId], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (2, 28, 1, 1, 1, 1, CAST(N'2023-08-01T17:40:39.860' AS DateTime), 0, CAST(N'2023-08-01T17:40:39.860' AS DateTime), 0)
GO
INSERT [dbo].[tbl_RolePermission] ([RoleId], [MenuId], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (2, 29, 1, 1, 1, 1, CAST(N'2023-08-01T17:40:39.860' AS DateTime), 0, CAST(N'2023-08-01T17:40:39.860' AS DateTime), 0)
GO
INSERT [dbo].[tbl_RolePermission] ([RoleId], [MenuId], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (2, 30, 1, 1, 1, 1, CAST(N'2023-08-01T17:40:39.860' AS DateTime), 0, CAST(N'2023-08-01T17:40:39.860' AS DateTime), 0)
GO
INSERT [dbo].[tbl_RolePermission] ([RoleId], [MenuId], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (2, 31, 1, 1, 1, 1, CAST(N'2023-08-01T17:40:39.860' AS DateTime), 0, CAST(N'2023-08-01T17:40:39.860' AS DateTime), 0)
GO
INSERT [dbo].[tbl_RolePermission] ([RoleId], [MenuId], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (2, 32, 1, 1, 1, 1, CAST(N'2023-08-01T17:40:39.860' AS DateTime), 0, CAST(N'2023-08-01T17:40:39.860' AS DateTime), 0)
GO
INSERT [dbo].[tbl_RolePermission] ([RoleId], [MenuId], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (2, 33, 1, 1, 1, 1, CAST(N'2023-08-01T17:40:39.860' AS DateTime), 0, CAST(N'2023-08-01T17:40:39.860' AS DateTime), 0)
GO
INSERT [dbo].[tbl_RolePermission] ([RoleId], [MenuId], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (3, 1, 1, 0, 0, 1, CAST(N'2023-08-03T10:49:36.387' AS DateTime), 0, CAST(N'2023-08-03T10:49:36.387' AS DateTime), 0)
GO
INSERT [dbo].[tbl_RolePermission] ([RoleId], [MenuId], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (3, 2, 1, 0, 0, 1, CAST(N'2023-08-03T10:49:36.387' AS DateTime), 0, CAST(N'2023-08-03T10:49:36.387' AS DateTime), 0)
GO
INSERT [dbo].[tbl_RolePermission] ([RoleId], [MenuId], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (3, 3, 1, 0, 0, 1, CAST(N'2023-08-03T10:49:36.387' AS DateTime), 0, CAST(N'2023-08-03T10:49:36.387' AS DateTime), 0)
GO
INSERT [dbo].[tbl_RolePermission] ([RoleId], [MenuId], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (3, 4, 1, 0, 0, 1, CAST(N'2023-08-03T10:49:36.387' AS DateTime), 0, CAST(N'2023-08-03T10:49:36.387' AS DateTime), 0)
GO
INSERT [dbo].[tbl_RolePermission] ([RoleId], [MenuId], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (3, 5, 1, 0, 0, 1, CAST(N'2023-08-03T10:49:36.387' AS DateTime), 0, CAST(N'2023-08-03T10:49:36.387' AS DateTime), 0)
GO
INSERT [dbo].[tbl_RolePermission] ([RoleId], [MenuId], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (3, 6, 1, 0, 0, 1, CAST(N'2023-08-03T10:49:36.387' AS DateTime), 0, CAST(N'2023-08-03T10:49:36.387' AS DateTime), 0)
GO
INSERT [dbo].[tbl_RolePermission] ([RoleId], [MenuId], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (3, 7, 1, 0, 0, 1, CAST(N'2023-08-03T10:49:36.387' AS DateTime), 0, CAST(N'2023-08-03T10:49:36.387' AS DateTime), 0)
GO
INSERT [dbo].[tbl_RolePermission] ([RoleId], [MenuId], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (3, 8, 1, 0, 0, 1, CAST(N'2023-08-03T10:49:36.387' AS DateTime), 0, CAST(N'2023-08-03T10:49:36.387' AS DateTime), 0)
GO
INSERT [dbo].[tbl_RolePermission] ([RoleId], [MenuId], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (3, 16, 1, 0, 0, 1, CAST(N'2023-08-03T10:49:36.387' AS DateTime), 0, CAST(N'2023-08-03T10:49:36.387' AS DateTime), 0)
GO
INSERT [dbo].[tbl_RolePermission] ([RoleId], [MenuId], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (3, 17, 1, 0, 0, 1, CAST(N'2023-08-03T10:49:36.387' AS DateTime), 0, CAST(N'2023-08-03T10:49:36.387' AS DateTime), 0)
GO
INSERT [dbo].[tbl_RolePermission] ([RoleId], [MenuId], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (3, 18, 1, 0, 0, 1, CAST(N'2023-08-03T10:49:36.387' AS DateTime), 0, CAST(N'2023-08-03T10:49:36.387' AS DateTime), 0)
GO
INSERT [dbo].[tbl_RolePermission] ([RoleId], [MenuId], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (3, 19, 1, 0, 0, 1, CAST(N'2023-08-03T10:49:36.387' AS DateTime), 0, CAST(N'2023-08-03T10:49:36.387' AS DateTime), 0)
GO
INSERT [dbo].[tbl_RolePermission] ([RoleId], [MenuId], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (3, 20, 1, 0, 0, 1, CAST(N'2023-08-03T10:49:36.387' AS DateTime), 0, CAST(N'2023-08-03T10:49:36.387' AS DateTime), 0)
GO
INSERT [dbo].[tbl_RolePermission] ([RoleId], [MenuId], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (3, 21, 1, 0, 0, 1, CAST(N'2023-08-03T10:49:36.387' AS DateTime), 0, CAST(N'2023-08-03T10:49:36.387' AS DateTime), 0)
GO
INSERT [dbo].[tbl_RolePermission] ([RoleId], [MenuId], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (3, 22, 1, 0, 0, 1, CAST(N'2023-08-03T10:49:36.387' AS DateTime), 0, CAST(N'2023-08-03T10:49:36.387' AS DateTime), 0)
GO
INSERT [dbo].[tbl_RolePermission] ([RoleId], [MenuId], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (3, 23, 1, 0, 0, 1, CAST(N'2023-08-03T10:49:36.387' AS DateTime), 0, CAST(N'2023-08-03T10:49:36.387' AS DateTime), 0)
GO
INSERT [dbo].[tbl_RolePermission] ([RoleId], [MenuId], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (3, 24, 1, 0, 0, 1, CAST(N'2023-08-03T10:49:36.387' AS DateTime), 0, CAST(N'2023-08-03T10:49:36.387' AS DateTime), 0)
GO
INSERT [dbo].[tbl_RolePermission] ([RoleId], [MenuId], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (3, 25, 1, 0, 0, 1, CAST(N'2023-08-03T10:49:36.387' AS DateTime), 0, CAST(N'2023-08-03T10:49:36.387' AS DateTime), 0)
GO
INSERT [dbo].[tbl_RolePermission] ([RoleId], [MenuId], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (3, 26, 1, 0, 0, 1, CAST(N'2023-08-03T10:49:36.387' AS DateTime), 0, CAST(N'2023-08-03T10:49:36.387' AS DateTime), 0)
GO
INSERT [dbo].[tbl_RolePermission] ([RoleId], [MenuId], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (3, 40, 1, 0, 0, 1, CAST(N'2023-08-03T10:49:36.387' AS DateTime), 0, CAST(N'2023-08-03T10:49:36.387' AS DateTime), 0)
GO
INSERT [dbo].[tbl_RolePermission] ([RoleId], [MenuId], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (3, 41, 1, 0, 0, 1, CAST(N'2023-08-03T10:49:36.387' AS DateTime), 0, CAST(N'2023-08-03T10:49:36.387' AS DateTime), 0)
GO
INSERT [dbo].[tbl_RolePermission] ([RoleId], [MenuId], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (3, 42, 1, 0, 0, 1, CAST(N'2023-08-03T10:49:36.387' AS DateTime), 0, CAST(N'2023-08-03T10:49:36.387' AS DateTime), 0)
GO
INSERT [dbo].[tbl_RolePermission] ([RoleId], [MenuId], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (3, 44, 1, 0, 0, 1, CAST(N'2023-08-03T10:49:36.387' AS DateTime), 0, CAST(N'2023-08-03T10:49:36.387' AS DateTime), 0)
GO
SET IDENTITY_INSERT [dbo].[tbl_SystemMaster] ON 
GO
INSERT [dbo].[tbl_SystemMaster] ([SystemId], [SystemName], [SystemDescription], [AppPort], [ApiPort], [SystemImage], [SystemIcon], [DashBoard], [ReportIds], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (1, N'ADAS', N'Advance Driver Advisory System', 3039, 3019, N'ADAS.jpg', N'fas fa-truck-pickup', 0, N'', 0, CAST(N'2022-01-14T23:01:30.817' AS DateTime), 0, CAST(N'2022-01-14T23:01:30.817' AS DateTime), 0)
GO
INSERT [dbo].[tbl_SystemMaster] ([SystemId], [SystemName], [SystemDescription], [AppPort], [ApiPort], [SystemImage], [SystemIcon], [DashBoard], [ReportIds], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (2, N'ATCC', N'Automatic Traffic Counter-cum-Classifier', 3031, 3011, N'ATCC.jpg', N'fas fa-car', 1, N'1,7', 1, CAST(N'2022-01-14T23:01:49.837' AS DateTime), 0, CAST(N'2022-01-14T23:01:49.837' AS DateTime), 0)
GO
INSERT [dbo].[tbl_SystemMaster] ([SystemId], [SystemName], [SystemDescription], [AppPort], [ApiPort], [SystemImage], [SystemIcon], [DashBoard], [ReportIds], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (3, N'ECS', N'Emergency Calling System', 3034, 3014, N'ECS.jpg', N'fas fa-tty', 1, N'1', 1, CAST(N'2022-01-14T23:02:20.130' AS DateTime), 0, CAST(N'2022-01-14T23:02:20.130' AS DateTime), 0)
GO
INSERT [dbo].[tbl_SystemMaster] ([SystemId], [SystemName], [SystemDescription], [AppPort], [ApiPort], [SystemImage], [SystemIcon], [DashBoard], [ReportIds], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (4, N'FMS', N'Facility Monitoring System', 3032, 3012, N'NMS.jpg', N'fas fa-network-wired', 0, N'', 0, CAST(N'2022-01-14T23:03:15.580' AS DateTime), 0, CAST(N'2022-01-14T23:03:15.580' AS DateTime), 0)
GO
INSERT [dbo].[tbl_SystemMaster] ([SystemId], [SystemName], [SystemDescription], [AppPort], [ApiPort], [SystemImage], [SystemIcon], [DashBoard], [ReportIds], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (5, N'TMCS', N'Traffic Monitor Camera System', 3035, 3015, N'TMCS.jpg', N'pi pi-video', 0, N'', 1, CAST(N'2022-01-14T23:05:25.100' AS DateTime), 0, CAST(N'2022-01-14T23:05:25.100' AS DateTime), 0)
GO
INSERT [dbo].[tbl_SystemMaster] ([SystemId], [SystemName], [SystemDescription], [AppPort], [ApiPort], [SystemImage], [SystemIcon], [DashBoard], [ReportIds], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (6, N'VIDS', N'Video Incident Detection System', 3036, 3016, N'VIDS.jpg', N'fas fa-snowplow', 1, N'13,14', 1, CAST(N'2022-01-14T23:05:39.973' AS DateTime), 0, CAST(N'2022-01-14T23:05:39.973' AS DateTime), 0)
GO
INSERT [dbo].[tbl_SystemMaster] ([SystemId], [SystemName], [SystemDescription], [AppPort], [ApiPort], [SystemImage], [SystemIcon], [DashBoard], [ReportIds], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (7, N'VMS', N'Variable Message Sign', 3037, 3017, N'VMS.png', N'fa fa-television', 1, N'', 1, CAST(N'2022-01-14T23:05:56.100' AS DateTime), 0, CAST(N'2022-01-14T23:05:56.100' AS DateTime), 0)
GO
INSERT [dbo].[tbl_SystemMaster] ([SystemId], [SystemName], [SystemDescription], [AppPort], [ApiPort], [SystemImage], [SystemIcon], [DashBoard], [ReportIds], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (8, N'VSDS', N'Vehicle Speed Detection System', 3038, 3018, N'VSDS.jpg', N'fas fa-video', 0, N'', 1, CAST(N'2022-01-14T23:06:14.370' AS DateTime), 0, CAST(N'2022-01-14T23:06:14.370' AS DateTime), 0)
GO
INSERT [dbo].[tbl_SystemMaster] ([SystemId], [SystemName], [SystemDescription], [AppPort], [ApiPort], [SystemImage], [SystemIcon], [DashBoard], [ReportIds], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (9, N'Weather', N'Weather', 3040, 3020, N'MET.jpg', N'fas fa-poo-storm', 1, N'', 1, CAST(N'2022-01-14T23:06:23.450' AS DateTime), 0, CAST(N'2022-01-14T23:06:23.450' AS DateTime), 0)
GO
INSERT [dbo].[tbl_SystemMaster] ([SystemId], [SystemName], [SystemDescription], [AppPort], [ApiPort], [SystemImage], [SystemIcon], [DashBoard], [ReportIds], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (10, N'IMS', N'Incident Management System', 3033, 3013, N'IMS.jpg', N'fas fa-car-crash', 1, N'', 1, CAST(N'2022-01-14T23:33:26.807' AS DateTime), 0, CAST(N'2022-01-14T23:33:26.807' AS DateTime), 0)
GO
INSERT [dbo].[tbl_SystemMaster] ([SystemId], [SystemName], [SystemDescription], [AppPort], [ApiPort], [SystemImage], [SystemIcon], [DashBoard], [ReportIds], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (11, N'Config', N'Configuration', 3021, 3010, N'Config.jpg', N'fa fa-cog', 0, N'', 0, CAST(N'2022-01-25T11:24:28.827' AS DateTime), 0, CAST(N'2022-01-25T11:24:28.827' AS DateTime), 0)
GO
INSERT [dbo].[tbl_SystemMaster] ([SystemId], [SystemName], [SystemDescription], [AppPort], [ApiPort], [SystemImage], [SystemIcon], [DashBoard], [ReportIds], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (12, N'TTMS', N'Time Travel Estimation', 3043, 3023, NULL, N'fas fa-map-marked', 0, N'', 0, CAST(N'2022-03-21T13:07:06.753' AS DateTime), 0, CAST(N'2022-03-21T13:07:06.753' AS DateTime), 0)
GO
INSERT [dbo].[tbl_SystemMaster] ([SystemId], [SystemName], [SystemDescription], [AppPort], [ApiPort], [SystemImage], [SystemIcon], [DashBoard], [ReportIds], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (13, N'RMS', N'Report Management System', 3044, NULL, NULL, N'fa fa-files-o', 0, N'', 0, CAST(N'2022-07-04T11:10:53.793' AS DateTime), 0, CAST(N'2022-07-04T11:10:53.793' AS DateTime), 0)
GO
INSERT [dbo].[tbl_SystemMaster] ([SystemId], [SystemName], [SystemDescription], [AppPort], [ApiPort], [SystemImage], [SystemIcon], [DashBoard], [ReportIds], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (14, N'NMS', N'Network Management System', 8060, NULL, N'NMS.jpg', N'fas fa-solid fa-network-wired', 0, N'', 0, CAST(N'2022-07-04T11:20:55.147' AS DateTime), 0, CAST(N'2022-07-04T11:20:55.147' AS DateTime), 0)
GO
INSERT [dbo].[tbl_SystemMaster] ([SystemId], [SystemName], [SystemDescription], [AppPort], [ApiPort], [SystemImage], [SystemIcon], [DashBoard], [ReportIds], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (15, N'Challan', N'NIC Challan', 3045, 3025, N'NMS.jpg', N'fa fa-address-card', 0, N'', 0, CAST(N'2022-07-21T01:44:46.273' AS DateTime), 0, CAST(N'2022-07-21T01:44:46.273' AS DateTime), 0)
GO
INSERT [dbo].[tbl_SystemMaster] ([SystemId], [SystemName], [SystemDescription], [AppPort], [ApiPort], [SystemImage], [SystemIcon], [DashBoard], [ReportIds], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (16, N'CRS', N'Control Room System', 3031, 3030, NULL, NULL, 0, N'', 1, CAST(N'2023-06-20T10:15:39.893' AS DateTime), 0, CAST(N'2023-06-20T10:15:39.893' AS DateTime), 0)
GO
INSERT [dbo].[tbl_SystemMaster] ([SystemId], [SystemName], [SystemDescription], [AppPort], [ApiPort], [SystemImage], [SystemIcon], [DashBoard], [ReportIds], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (17, N'MRCS', N'Mobile Radio Communication System', NULL, NULL, NULL, NULL, 0, N'', 1, CAST(N'2023-06-20T10:17:21.870' AS DateTime), 0, CAST(N'2023-06-20T10:17:21.870' AS DateTime), 0)
GO
SET IDENTITY_INSERT [dbo].[tbl_SystemMaster] OFF
GO
INSERT [dbo].[tbl_SystemSetting] ([TotalLane], [IsATCCIndependently], [ATCCByVSDS], [ATCCByVIDS], [TrafficCount], [TrafficByTime], [RestrictedVehiclesIds], [DefaultControlRoomId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (4, 1, 0, 0, 10, 1, N'2,1', 1, 1, CAST(N'2023-08-03T00:13:22.633' AS DateTime), 0, CAST(N'2023-10-01T12:43:29.640' AS DateTime), 0)
GO
SET IDENTITY_INSERT [dbo].[tbl_UserMaster] ON 
GO
INSERT [dbo].[tbl_UserMaster] ([UserId], [LoginId], [LoginPassword], [FirstName], [LastName], [EmailId], [MobileNumber], [AccountExpiredDate], [RoleId], [UserTypeId], [UserProfileImage], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (1, N'admin', N'ek4e0KyF2CB1xj3nwprPWg==', N'Admin', N'Admin', N'Admin@gmail.com', N'9982567732', CAST(N'2033-06-12' AS Date), 1, 1, N'\User\ProfileImage\0d6e31fe-bef9-4d04-8ba6-6ad3d016bcc8.png', 1, CAST(N'2023-06-16T01:10:15.223' AS DateTime), 0, CAST(N'2023-06-26T21:33:56.993' AS DateTime), 1)
GO
INSERT [dbo].[tbl_UserMaster] ([UserId], [LoginId], [LoginPassword], [FirstName], [LastName], [EmailId], [MobileNumber], [AccountExpiredDate], [RoleId], [UserTypeId], [UserProfileImage], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (2, N'pt1', N'ek4e0KyF2CB1xj3nwprPWg==', N'Patrolling', N'Team', N'pt1@gmail.com', N'9982567732', CAST(N'2033-06-12' AS Date), 1, 5, NULL, 1, CAST(N'2023-06-16T01:10:15.223' AS DateTime), 0, CAST(N'2023-06-26T21:33:56.993' AS DateTime), 1)
GO
INSERT [dbo].[tbl_UserMaster] ([UserId], [LoginId], [LoginPassword], [FirstName], [LastName], [EmailId], [MobileNumber], [AccountExpiredDate], [RoleId], [UserTypeId], [UserProfileImage], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (3, N'user1', N'EbWS3/EHBvt8Qg7+RlryTg==', N'Operator-1', N'VIDS', N'abc@g.com', N'128909870909', CAST(N'2029-12-24' AS Date), 2, 3, NULL, 1, CAST(N'2023-08-01T15:13:37.257' AS DateTime), 0, CAST(N'2023-08-03T10:49:58.207' AS DateTime), 3)
GO
SET IDENTITY_INSERT [dbo].[tbl_UserMaster] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_VehicleClass] ON 
GO
INSERT [dbo].[tbl_VehicleClass] ([VehicleClassId], [VehicleClassName], [VehicleClassIcon], [AllowedSpeed], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (0, N'Unknown', N'fa fa-times', CAST(80.00 AS Decimal(10, 2)), 1, CAST(N'2022-01-18T12:21:46.273' AS DateTime), 0, CAST(N'2023-06-26T21:19:20.393' AS DateTime), 0)
GO
INSERT [dbo].[tbl_VehicleClass] ([VehicleClassId], [VehicleClassName], [VehicleClassIcon], [AllowedSpeed], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (1, N'Motorcycle', N'fa fa-motorcycle', CAST(80.00 AS Decimal(10, 2)), 1, CAST(N'2022-01-18T12:21:46.273' AS DateTime), 0, CAST(N'2023-06-26T21:17:34.287' AS DateTime), 0)
GO
INSERT [dbo].[tbl_VehicleClass] ([VehicleClassId], [VehicleClassName], [VehicleClassIcon], [AllowedSpeed], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (2, N'Auto', N'fas fa-truck', CAST(80.00 AS Decimal(10, 2)), 1, CAST(N'2022-01-18T12:21:51.963' AS DateTime), 0, CAST(N'2022-09-17T12:16:28.997' AS DateTime), 1)
GO
INSERT [dbo].[tbl_VehicleClass] ([VehicleClassId], [VehicleClassName], [VehicleClassIcon], [AllowedSpeed], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (3, N'Car', N'fa fa-car', CAST(100.00 AS Decimal(10, 2)), 1, CAST(N'2022-01-18T12:21:58.643' AS DateTime), 0, CAST(N'2022-09-17T12:16:19.307' AS DateTime), 1)
GO
INSERT [dbo].[tbl_VehicleClass] ([VehicleClassId], [VehicleClassName], [VehicleClassIcon], [AllowedSpeed], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (4, N'Bus', N'fas fa-bus', CAST(80.00 AS Decimal(10, 2)), 1, CAST(N'2022-02-06T19:03:34.300' AS DateTime), 0, CAST(N'2022-09-17T12:16:33.870' AS DateTime), 1)
GO
INSERT [dbo].[tbl_VehicleClass] ([VehicleClassId], [VehicleClassName], [VehicleClassIcon], [AllowedSpeed], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (5, N'LCV', N'fas fa-truck-pickup', CAST(80.00 AS Decimal(10, 2)), 1, CAST(N'2022-02-06T19:03:42.730' AS DateTime), 0, CAST(N'2022-09-17T12:16:37.463' AS DateTime), 1)
GO
INSERT [dbo].[tbl_VehicleClass] ([VehicleClassId], [VehicleClassName], [VehicleClassIcon], [AllowedSpeed], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (6, N'Truck', N'fas fa-truck', CAST(80.00 AS Decimal(10, 2)), 1, CAST(N'2022-02-06T19:03:48.770' AS DateTime), 0, CAST(N'2022-09-17T12:16:40.487' AS DateTime), 1)
GO
INSERT [dbo].[tbl_VehicleClass] ([VehicleClassId], [VehicleClassName], [VehicleClassIcon], [AllowedSpeed], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (7, N'Tractor', N'fas fa-tractor', CAST(80.00 AS Decimal(10, 2)), 1, CAST(N'2022-02-06T19:03:55.950' AS DateTime), 0, CAST(N'2022-09-17T12:16:43.843' AS DateTime), 1)
GO
INSERT [dbo].[tbl_VehicleClass] ([VehicleClassId], [VehicleClassName], [VehicleClassIcon], [AllowedSpeed], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (8, N'Oversized', N'fas fa-truck-monster', CAST(80.00 AS Decimal(10, 2)), 1, CAST(N'2022-02-06T19:04:09.470' AS DateTime), 0, CAST(N'2023-08-03T10:49:07.670' AS DateTime), 0)
GO
SET IDENTITY_INSERT [dbo].[tbl_VehicleClass] OFF
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720231114058223', 44, N'AL_E001C0250-20230719009751', 5, CAST(N'2023-07-19T11:14:05.8223000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0250-20230719009751.jpeg', NULL, 0, 0, 0, 0, NULL, NULL, 1, 0, N'', 0, 0, CAST(N'2023-08-01T13:25:16.863' AS DateTime), NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720231055455075', 44, N'AL_E001C0250-20230719009052', 5, CAST(N'2023-07-19T10:55:45.5075000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0250-20230719009052.jpeg', NULL, 0, 0, 0, 0, NULL, NULL, 1, 5, N'', 0, 0, CAST(N'2023-08-01T14:21:22.523' AS DateTime), NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720231055341117', 44, N'AL_E001C0250-20230719009049', 5, CAST(N'2023-07-19T10:55:34.1117000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0250-20230719009049.jpeg', NULL, 0, 0, 0, 0, NULL, NULL, 1, 5, N'', 0, 0, CAST(N'2023-08-01T14:21:27.500' AS DateTime), NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720231044237766', 43, N'AL_E001C0040-20230719001310', 5, CAST(N'2023-07-19T10:44:23.7766000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0040-20230719001310.jpeg', NULL, 0, 0, 0, 0, NULL, NULL, 1, 5, N'', 0, 0, CAST(N'2023-08-01T14:21:32.930' AS DateTime), NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720231044149167', 43, N'AL_E001C0040-20230719001308', 3, CAST(N'2023-07-19T10:44:14.9167000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0040-20230719001308.jpeg', NULL, 0, 1, 6, 0, NULL, 1, 1, 3, N'UP32BG1634', 3, 0, CAST(N'2023-08-01T13:19:07.697' AS DateTime), NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720231041461386', 43, N'AL_E001C0050-20230719002505', 5, CAST(N'2023-07-19T10:41:46.1386000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0050-20230719002505.jpeg', NULL, 0, 0, 0, 0, NULL, NULL, 1, 5, N'', 0, 0, CAST(N'2023-08-01T14:21:39.323' AS DateTime), NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720231039295776', 43, N'AL_E001C0050-20230719002470', 8, CAST(N'2023-07-19T10:39:29.5776000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0050-20230719002470.jpeg', NULL, 0, 0, 0, 0, NULL, NULL, 1, 8, N'', 0, 0, CAST(N'2023-08-01T14:21:43.813' AS DateTime), NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720231039244238', 43, N'AL_E001C0040-20230719001269', 8, CAST(N'2023-07-19T10:39:24.4238000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0040-20230719001269.jpeg', NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720231039208237', 43, N'AL_E001C0040-20230719001267', 8, CAST(N'2023-07-19T10:39:20.8237000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0040-20230719001267.jpeg', NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720231035252125', 43, N'AL_E001C0050-20230719002428', 5, CAST(N'2023-07-19T10:35:25.2125000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0050-20230719002428.jpeg', NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720231034565673', 43, N'AL_E001C0040-20230719001253', 5, CAST(N'2023-07-19T10:34:56.5673000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0040-20230719001253.jpeg', NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720231024594365', 46, N'AL_E001C0180-20230719001046', 8, CAST(N'2023-07-19T10:24:59.4365000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0180-20230719001046.jpeg', NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720231016522236', 43, N'AL_E001C0060-20230719006503', 3, CAST(N'2023-07-19T10:16:52.2236000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0060-20230719006503.jpeg', NULL, 0, 0, 6, 0, NULL, 1, 1, 3, N'', 0, 0, CAST(N'2023-08-01T14:25:10.517' AS DateTime), NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720231016237193', 46, N'AL_E001C0230-20230719000053', 3, CAST(N'2023-07-19T10:16:23.7193000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0230-20230719000053.jpeg', NULL, 0, 0, 6, 0, NULL, 1, 1, 3, N'', 0, 0, CAST(N'2023-08-01T14:26:17.683' AS DateTime), NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720231012589260', 44, N'AL_E001C0250-20230719007555', 3, CAST(N'2023-07-19T10:12:58.9260000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0250-20230719007555.jpeg', NULL, 0, 0, 6, 0, NULL, 1, 1, 3, N'', 0, 0, CAST(N'2023-08-01T14:26:18.610' AS DateTime), NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720231010599471', 43, N'AL_E001C0050-20230719002187', 5, CAST(N'2023-07-19T10:10:59.9471000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0050-20230719002187.jpeg', NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720231006518026', 46, N'AL_E001C0220-20230719009439', 3, CAST(N'2023-07-19T10:06:51.8026000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0220-20230719009439.jpeg', NULL, 0, 0, 6, 0, NULL, 1, 1, 3, N'', 0, 0, CAST(N'2023-08-01T14:26:19.347' AS DateTime), NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720231004335071', 46, N'AL_E001C0160-20230719004062', 3, CAST(N'2023-07-19T10:04:33.5071000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0160-20230719004062.jpeg', NULL, 0, 0, 6, 0, NULL, 1, 1, 3, N'', 0, 0, CAST(N'2023-08-01T14:26:19.937' AS DateTime), NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720230957029560', 43, N'AL_E001C0050-20230719001974', 5, CAST(N'2023-07-19T09:57:02.9560000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0050-20230719001974.jpeg', NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720230953082611', 43, N'AL_E001C0040-20230719001077', 5, CAST(N'2023-07-19T09:53:08.2611000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0040-20230719001077.jpeg', NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720230953052693', 43, N'AL_E001C0040-20230719001076', 3, CAST(N'2023-07-19T09:53:05.2693000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0040-20230719001076.jpeg', NULL, 0, 0, 6, 0, NULL, 1, 1, 3, N'', 0, 0, CAST(N'2023-08-01T14:26:20.570' AS DateTime), NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720230950011826', 44, N'AL_E001C0250-20230719006833', 5, CAST(N'2023-07-19T09:50:01.1826000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0250-20230719006833.jpeg', NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720230946042081', 43, N'AL_E001C0060-20230719005181', 8, CAST(N'2023-07-19T09:46:04.2081000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0060-20230719005181.jpeg', NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720230946042081', 43, N'AL_E001C0060-20230719005182', 8, CAST(N'2023-07-19T09:46:04.2081000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0060-20230719005182.jpeg', NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720230935322014', 43, N'AL_E001C0040-20230719000988', 8, CAST(N'2023-07-19T09:35:32.2014000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0040-20230719000988.jpeg', NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720230935291222', 43, N'AL_E001C0040-20230719000987', 8, CAST(N'2023-07-19T09:35:29.1222000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0040-20230719000987.jpeg', NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720230930299858', 44, N'AL_E001C0250-20230719006217', 5, CAST(N'2023-07-19T09:30:29.9858000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0250-20230719006217.jpeg', NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720230924383834', 44, N'AL_E001C0250-20230719006154', 1, CAST(N'2023-07-19T09:24:38.3834000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0250-20230719006154.jpeg', NULL, 0, 1, 0, 0, NULL, 1, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720230914195258', 44, N'AL_E001C0250-20230719005769', 1, CAST(N'2023-07-19T09:14:19.5258000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0250-20230719005769.jpeg', NULL, 0, 1, 0, 0, NULL, 1, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720230855156610', 44, N'AL_E001C0250-20230719004619', 5, CAST(N'2023-07-19T08:55:15.6610000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0250-20230719004619.jpeg', NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720230854163874', 44, N'AL_E001C0250-20230719004656', 1, CAST(N'2023-07-19T08:54:16.3874000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0250-20230719004656.jpeg', NULL, 0, 1, 0, 0, NULL, 1, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720230851138790', 44, N'AL_E001C0250-20230719004532', 1, CAST(N'2023-07-19T08:51:13.8790000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0250-20230719004532.jpeg', NULL, 0, 0, 5, 0, NULL, 1, 1, 1, N'', 0, 0, CAST(N'2023-08-01T14:26:32.260' AS DateTime), NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720230849355905', 46, N'AL_E001C0160-20230719002737', 8, CAST(N'2023-07-19T08:49:35.5905000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0160-20230719002737.jpeg', NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720230847545873', 44, N'AL_E001C0250-20230719004374', 1, CAST(N'2023-07-19T08:47:54.5873000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0250-20230719004374.jpeg', NULL, 0, 1, 0, 0, NULL, 1, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720230837522378', 44, N'AL_E001C0250-20230719004020', 1, CAST(N'2023-07-19T08:37:52.2378000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0250-20230719004020.jpeg', NULL, 0, 1, 0, 0, NULL, 1, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720230833218592', 44, N'AL_E001C0250-20230719003886', 5, CAST(N'2023-07-19T08:33:21.8592000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0250-20230719003886.jpeg', NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720230833090681', 44, N'AL_E001C0250-20230719003867', 5, CAST(N'2023-07-19T08:33:09.0681000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0250-20230719003867.jpeg', NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720230822427333', 44, N'AL_E001C0250-20230719003425', 1, CAST(N'2023-07-19T08:22:42.7333000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0250-20230719003425.jpeg', NULL, 0, 1, 0, 0, NULL, 1, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720230818518634', 44, N'AL_E001C0250-20230719003364', 1, CAST(N'2023-07-19T08:18:51.8634000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0250-20230719003364.jpeg', NULL, 0, 1, 0, 0, NULL, 1, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720230809226490', 44, N'AL_E001C0250-20230719003118', 1, CAST(N'2023-07-19T08:09:22.6490000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0250-20230719003118.jpeg', NULL, 0, 1, 0, 0, NULL, 1, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720230759050423', 43, N'AL_E001C0050-20230719000825', 5, CAST(N'2023-07-19T07:59:05.0423000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0050-20230719000825.jpeg', NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720230758064709', 43, N'AL_E001C0050-20230719000818', 5, CAST(N'2023-07-19T07:58:06.4709000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0050-20230719000818.jpeg', NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720230753070826', 43, N'AL_E001C0050-20230719000802', 5, CAST(N'2023-07-19T07:53:07.0826000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0050-20230719000802.jpeg', NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720230753002683', 43, N'AL_E001C0040-20230719000684', 3, CAST(N'2023-07-19T07:53:00.2683000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0040-20230719000684.jpeg', NULL, 0, 1, 0, 0, NULL, 1, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720230748147526', 44, N'AL_E001C0250-20230719002506', 1, CAST(N'2023-07-19T07:48:14.7526000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0250-20230719002506.jpeg', NULL, 0, 1, 0, 0, NULL, 1, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720230746417609', 43, N'AL_E001C0040-20230719000660', 5, CAST(N'2023-07-19T07:46:41.7609000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0040-20230719000660.jpeg', NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720230745186400', 44, N'AL_E001C0250-20230719002458', 1, CAST(N'2023-07-19T07:45:18.6400000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0250-20230719002458.jpeg', NULL, 0, 1, 0, 0, NULL, 1, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720230724250147', 43, N'AL_E001C0050-20230719000593', 5, CAST(N'2023-07-19T07:24:25.0147000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0050-20230719000593.jpeg', NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720230724181102', 43, N'AL_E001C0060-20230719001689', 5, CAST(N'2023-07-19T07:24:18.1102000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0060-20230719001689.jpeg', NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720230724109969', 43, N'AL_E001C0060-20230719001686', 5, CAST(N'2023-07-19T07:24:10.9969000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0060-20230719001686.jpeg', NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720230724075977', 43, N'AL_E001C0060-20230719001684', 5, CAST(N'2023-07-19T07:24:07.5977000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0060-20230719001684.jpeg', NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720230723563209', 43, N'AL_E001C0060-20230719001679', 5, CAST(N'2023-07-19T07:23:56.3209000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0060-20230719001679.jpeg', NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720230721124402', 44, N'AL_E001C0250-20230719001675', 5, CAST(N'2023-07-19T07:21:12.4402000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0250-20230719001675.jpeg', NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720230721114422', 43, N'AL_E001C0040-20230719000585', 5, CAST(N'2023-07-19T07:21:11.4422000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0040-20230719000585.jpeg', NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720230700251146', 43, N'AL_E001C0050-20230719000481', 5, CAST(N'2023-07-19T07:00:25.1146000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0050-20230719000481.jpeg', NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720230625591748', 43, N'AL_E001C0060-20230719000982', 5, CAST(N'2023-07-19T06:25:59.1748000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0060-20230719000982.jpeg', NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720230611598985', 43, N'AL_E001C0050-20230719000314', 5, CAST(N'2023-07-19T06:11:59.8985000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0050-20230719000314.jpeg', NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720230559031991', 43, N'AL_E001C0050-20230719000258', 5, CAST(N'2023-07-19T05:59:03.1991000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0050-20230719000258.jpeg', NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720230551346965', 44, N'AL_E001C0250-20230719000689', 5, CAST(N'2023-07-19T05:51:34.6965000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0250-20230719000689.jpeg', NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720230529066019', 43, N'AL_E001C0040-20230719000399', 5, CAST(N'2023-07-19T05:29:06.6019000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0040-20230719000399.jpeg', NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720230528336896', 43, N'AL_E001C0040-20230719000394', 5, CAST(N'2023-07-19T05:28:33.6896000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0040-20230719000394.jpeg', NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720230442152745', 44, N'AL_E001C0240-20230719001292', 1, CAST(N'2023-07-19T04:42:15.2745000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0240-20230719001292.jpeg', NULL, 0, 1, 0, 0, NULL, 1, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720230440175755', 43, N'AL_E001C0050-20230719000067', 5, CAST(N'2023-07-19T04:40:17.5755000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0050-20230719000067.jpeg', NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720230430390061', 43, N'AL_E001C0050-20230719000045', 5, CAST(N'2023-07-19T04:30:39.0061000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0050-20230719000045.jpeg', NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720230428406209', 43, N'AL_E001C0060-20230719000064', 5, CAST(N'2023-07-19T04:28:40.6209000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0060-20230719000064.jpeg', NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720230420434318', 43, N'AL_E001C0040-20230719000301', 5, CAST(N'2023-07-19T04:20:43.4318000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0040-20230719000301.jpeg', NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720230419405950', 44, N'AL_E001C0250-20230719000215', 5, CAST(N'2023-07-19T04:19:40.5950000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0250-20230719000215.jpeg', NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720230330471261', 43, N'AL_E001C0040-20230719000211', 5, CAST(N'2023-07-19T03:30:47.1261000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0040-20230719000211.jpeg', NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720230326192552', 43, N'AL_E001C0050-20230719000234', 5, CAST(N'2023-07-19T03:26:19.2552000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0050-20230719000234.jpeg', NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720230322070273', 43, N'AL_E001C0060-20230719001539', 1, CAST(N'2023-07-19T03:22:07.0273000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0060-20230719001539.jpeg', NULL, 0, 1, 0, 0, NULL, 1, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720230312356264', 43, N'AL_E001C0050-20230719000192', 5, CAST(N'2023-07-19T03:12:35.6264000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0050-20230719000192.jpeg', NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720230248422370', 43, N'AL_E001C0050-20230719000117', 5, CAST(N'2023-07-19T02:48:42.2370000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0050-20230719000117.jpeg', NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720230247005037', 43, N'AL_E001C0050-20230719000114', 5, CAST(N'2023-07-19T02:47:00.5037000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0050-20230719000114.jpeg', NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720230246532056', 43, N'AL_E001C0040-20230719000121', 3, CAST(N'2023-07-19T02:46:53.2056000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0040-20230719000121.jpeg', NULL, 0, 1, 0, 0, NULL, 1, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720230223098802', 43, N'AL_E001C0050-20230719000057', 5, CAST(N'2023-07-19T02:23:09.8802000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0050-20230719000057.jpeg', NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720230222591546', 43, N'AL_E001C0060-20230719001111', 5, CAST(N'2023-07-19T02:22:59.1546000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0060-20230719001111.jpeg', NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720230222221775', 43, N'AL_E001C0060-20230719001104', 5, CAST(N'2023-07-19T02:22:22.1775000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0060-20230719001104.jpeg', NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720230206478109', 46, N'AL_E001C0220-20230719001527', 5, CAST(N'2023-07-19T02:06:47.8109000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0220-20230719001527.jpeg', NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720230153136989', 43, N'AL_E001C0050-20230719000031', 5, CAST(N'2023-07-19T01:53:13.6989000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0050-20230719000031.jpeg', NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720230113160638', 43, N'AL_E001C0040-20230719000221', 5, CAST(N'2023-07-19T01:13:16.0638000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0040-20230719000221.jpeg', NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720230105067369', 43, N'AL_E001C0050-20230719000259', 5, CAST(N'2023-07-19T01:05:06.7369000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0050-20230719000259.jpeg', NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720230043575060', 43, N'AL_E001C0050-20230719000181', 5, CAST(N'2023-07-19T00:43:57.5060000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0050-20230719000181.jpeg', NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720230029498933', 43, N'AL_E001C0050-20230719000120', 5, CAST(N'2023-07-19T00:29:49.8933000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0050-20230719000120.jpeg', NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720230028171807', 43, N'AL_E001C0040-20230719000099', 5, CAST(N'2023-07-19T00:28:17.1807000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0040-20230719000099.jpeg', NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720230027372785', 43, N'AL_E001C0040-20230719000093', 5, CAST(N'2023-07-19T00:27:37.2785000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0040-20230719000093.jpeg', NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720230026326344', 43, N'AL_E001C0040-20230719000085', 5, CAST(N'2023-07-19T00:26:32.6344000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0040-20230719000085.jpeg', NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720230017524385', 43, N'AL_E001C0050-20230719000053', 5, CAST(N'2023-07-19T00:17:52.4385000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0050-20230719000053.jpeg', NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720230014140395', 43, N'AL_E001C0040-20230719000032', 5, CAST(N'2023-07-19T00:14:14.0395000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0040-20230719000032.jpeg', NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720230013070541', 46, N'AL_E001C0220-20230719000164', 3, CAST(N'2023-07-19T00:13:07.0541000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0220-20230719000164.jpeg', NULL, 0, 1, 0, 0, NULL, 1, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'180720232343100843', 44, N'AL_E001C0260-20230718018076', 3, CAST(N'2023-07-18T23:43:10.0843000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0260-20230718018076.jpeg', NULL, 0, 1, 0, 0, NULL, 1, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'180720232308011868', 43, N'AL_E001C0050-20230718009181', 5, CAST(N'2023-07-18T23:08:01.1868000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0050-20230718009181.jpeg', NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'180720232258190459', 44, N'AL_E001C0250-20230718025919', 5, CAST(N'2023-07-18T22:58:19.0459000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0250-20230718025919.jpeg', NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'180720232258187691', 44, N'AL_E001C0250-20230718025918', 5, CAST(N'2023-07-18T22:58:18.7691000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0250-20230718025918.jpeg', NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'180720232252550814', 43, N'AL_E001C0050-20230718009141', 5, CAST(N'2023-07-18T22:52:55.0814000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0050-20230718009141.jpeg', NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'180720232249422552', 43, N'AL_E001C0040-20230718003715', 5, CAST(N'2023-07-18T22:49:42.2552000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0040-20230718003715.jpeg', NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'180720232249410521', 43, N'AL_E001C0040-20230718003712', 3, CAST(N'2023-07-18T22:49:41.0521000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0040-20230718003712.jpeg', NULL, 0, 1, 0, 0, NULL, 1, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'180720232248355492', 43, N'AL_E001C0050-20230718009114', 5, CAST(N'2023-07-18T22:48:35.5492000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0050-20230718009114.jpeg', NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'180720232248027080', 43, N'AL_E001C0040-20230718003689', 5, CAST(N'2023-07-18T22:48:02.7080000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0040-20230718003689.jpeg', NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'180720232247305133', 44, N'AL_E001C0250-20230718025731', 5, CAST(N'2023-07-18T22:47:30.5133000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0250-20230718025731.jpeg', NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'180720232206002826', 43, N'AL_E001C0040-20230718003542', 6, CAST(N'2023-07-18T22:06:00.2826000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0040-20230718003542.jpeg', NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
SET IDENTITY_INSERT [dbo].[tbl_VMSMessageDetails] ON 
GO
INSERT [dbo].[tbl_VMSMessageDetails] ([MessageId], [EquipmentIds], [MessageTypeId], [DisplayTimout], [ValidTillDate], [MediaPath], [MessageDetails], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [DataSendStatus], [MediaSendStatus]) VALUES (1, N'49', 2, 20, CAST(N'2023-10-04' AS Date), N'\VMS\image\AVTCP20231004173752799.png', N'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAkIAAAFeCAYAAABpW3B9AAAAAXNSR0IArs4c6QAAIABJREFUeF7tnQuYFNWZsL8ZGGa4znCdERAGo8IACihR16z/v5uQ6GIwxtw1yrpuuIiiMQYVdzXyL7dR4xVBs8aHuF5iNDESjUaSvZAYySrIXY0XBgEZUJgZbgPDzPzPKTxtTdE9faqnqvtU11vP45Mw/fWpc95zTvXb3zlVX', 1, CAST(N'2023-10-04T17:37:54.380' AS DateTime), 0, CAST(N'2023-10-04T17:37:54.390' AS DateTime), 0, 0, 0)
GO
SET IDENTITY_INSERT [dbo].[tbl_VMSMessageDetails] OFF
GO
INSERT [dbo].[tbl_VSDSEventsHistory] ([TransactionId], [EquipmentId], [LaneNumber], [EventID], [EventTypeId], [EventDate], [PlateNumber], [VehicleClassId], [PlateImageUrl], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [RadarSpeed], [AllowedSpeed], [OcrConfidencelevel], [ClassConfidencelevel], [PlateFontColor], [PlateBackColor], [VehicleColor], [VehicleDirectionId], [IsPlateVisible], [IsFaultyPlate], [IsStandardPlate], [IsWrongDirection], [IsReviewedRequired], [IsRestiredVehicle], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedPlateNumber], [IsReviewedPlateVisible], [IsReviewedFaultyPlate], [IsReviewedStandardPlate], [IsReviewedWrongDirection], [ReviewedBy], [ReviewedDateTime], [ReviewedRemark], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'100920231446374560', 42, 2, N'9d6ae9fa-dafa-488a-bc20-4ab0154571e9', 18, CAST(N'2023-09-10T14:46:37.4560000' AS DateTime2), N'UP32NP6618', 3, N'VSDS/PlateImage/9d6ae9fa-dafa-488a-bc20-4ab0154571e9.jpeg', N'VSDS/VehicleImage/9d6ae9fa-dafa-488a-bc20-4ab0154571e9.jpeg', N'', NULL, CAST(89.79 AS Decimal(18, 2)), CAST(100.00 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2023-09-10T16:26:33.550' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_VSDSEventsHistory] ([TransactionId], [EquipmentId], [LaneNumber], [EventID], [EventTypeId], [EventDate], [PlateNumber], [VehicleClassId], [PlateImageUrl], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [RadarSpeed], [AllowedSpeed], [OcrConfidencelevel], [ClassConfidencelevel], [PlateFontColor], [PlateBackColor], [VehicleColor], [VehicleDirectionId], [IsPlateVisible], [IsFaultyPlate], [IsStandardPlate], [IsWrongDirection], [IsReviewedRequired], [IsRestiredVehicle], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedPlateNumber], [IsReviewedPlateVisible], [IsReviewedFaultyPlate], [IsReviewedStandardPlate], [IsReviewedWrongDirection], [ReviewedBy], [ReviewedDateTime], [ReviewedRemark], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'100920231445080410', 42, 2, N'085929aa-54a2-4506-b832-9ad4d9197694', 18, CAST(N'2023-09-10T14:45:08.0410000' AS DateTime2), N'DL4CAH7646', 3, N'VSDS/PlateImage/085929aa-54a2-4506-b832-9ad4d9197694.jpeg', N'VSDS/VehicleImage/085929aa-54a2-4506-b832-9ad4d9197694.jpeg', N'', NULL, CAST(46.04 AS Decimal(18, 2)), CAST(100.00 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2023-09-10T16:26:33.550' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_VSDSEventsHistory] ([TransactionId], [EquipmentId], [LaneNumber], [EventID], [EventTypeId], [EventDate], [PlateNumber], [VehicleClassId], [PlateImageUrl], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [RadarSpeed], [AllowedSpeed], [OcrConfidencelevel], [ClassConfidencelevel], [PlateFontColor], [PlateBackColor], [VehicleColor], [VehicleDirectionId], [IsPlateVisible], [IsFaultyPlate], [IsStandardPlate], [IsWrongDirection], [IsReviewedRequired], [IsRestiredVehicle], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedPlateNumber], [IsReviewedPlateVisible], [IsReviewedFaultyPlate], [IsReviewedStandardPlate], [IsReviewedWrongDirection], [ReviewedBy], [ReviewedDateTime], [ReviewedRemark], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'100920231445050590', 42, 2, N'4592b6fb-909b-4d73-b4b6-dbd885b2f10b', 18, CAST(N'2023-09-10T14:45:05.0590000' AS DateTime2), N'UP32ME7667', 3, N'VSDS/PlateImage/4592b6fb-909b-4d73-b4b6-dbd885b2f10b.jpeg', N'VSDS/VehicleImage/4592b6fb-909b-4d73-b4b6-dbd885b2f10b.jpeg', N'', NULL, CAST(81.71 AS Decimal(18, 2)), CAST(100.00 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2023-09-10T16:26:33.550' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_VSDSEventsHistory] ([TransactionId], [EquipmentId], [LaneNumber], [EventID], [EventTypeId], [EventDate], [PlateNumber], [VehicleClassId], [PlateImageUrl], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [RadarSpeed], [AllowedSpeed], [OcrConfidencelevel], [ClassConfidencelevel], [PlateFontColor], [PlateBackColor], [VehicleColor], [VehicleDirectionId], [IsPlateVisible], [IsFaultyPlate], [IsStandardPlate], [IsWrongDirection], [IsReviewedRequired], [IsRestiredVehicle], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedPlateNumber], [IsReviewedPlateVisible], [IsReviewedFaultyPlate], [IsReviewedStandardPlate], [IsReviewedWrongDirection], [ReviewedBy], [ReviewedDateTime], [ReviewedRemark], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'100920231444531640', 42, 2, N'89ba1336-7dac-4280-8056-65ca1c903589', 18, CAST(N'2023-09-10T14:44:53.1640000' AS DateTime2), N'UP17AT6759', 6, N'VSDS/PlateImage/89ba1336-7dac-4280-8056-65ca1c903589.jpeg', N'VSDS/VehicleImage/89ba1336-7dac-4280-8056-65ca1c903589.jpeg', N'', NULL, CAST(77.64 AS Decimal(18, 2)), CAST(80.00 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2023-09-10T16:26:33.550' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_VSDSEventsHistory] ([TransactionId], [EquipmentId], [LaneNumber], [EventID], [EventTypeId], [EventDate], [PlateNumber], [VehicleClassId], [PlateImageUrl], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [RadarSpeed], [AllowedSpeed], [OcrConfidencelevel], [ClassConfidencelevel], [PlateFontColor], [PlateBackColor], [VehicleColor], [VehicleDirectionId], [IsPlateVisible], [IsFaultyPlate], [IsStandardPlate], [IsWrongDirection], [IsReviewedRequired], [IsRestiredVehicle], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedPlateNumber], [IsReviewedPlateVisible], [IsReviewedFaultyPlate], [IsReviewedStandardPlate], [IsReviewedWrongDirection], [ReviewedBy], [ReviewedDateTime], [ReviewedRemark], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'100920231444493110', 42, 2, N'1e6c4e37-6097-4154-926a-8912badd2e3a', 18, CAST(N'2023-09-10T14:44:49.3110000' AS DateTime2), N'BR01DD2700', 3, N'VSDS/PlateImage/1e6c4e37-6097-4154-926a-8912badd2e3a.jpeg', N'VSDS/VehicleImage/1e6c4e37-6097-4154-926a-8912badd2e3a.jpeg', N'', NULL, CAST(85.26 AS Decimal(18, 2)), CAST(100.00 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2023-09-10T16:26:33.550' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_VSDSEventsHistory] ([TransactionId], [EquipmentId], [LaneNumber], [EventID], [EventTypeId], [EventDate], [PlateNumber], [VehicleClassId], [PlateImageUrl], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [RadarSpeed], [AllowedSpeed], [OcrConfidencelevel], [ClassConfidencelevel], [PlateFontColor], [PlateBackColor], [VehicleColor], [VehicleDirectionId], [IsPlateVisible], [IsFaultyPlate], [IsStandardPlate], [IsWrongDirection], [IsReviewedRequired], [IsRestiredVehicle], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedPlateNumber], [IsReviewedPlateVisible], [IsReviewedFaultyPlate], [IsReviewedStandardPlate], [IsReviewedWrongDirection], [ReviewedBy], [ReviewedDateTime], [ReviewedRemark], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'100920231442309940', 42, 2, N'e874e8c0-5e5a-4afe-a53c-fd6e34d1eafb', 18, CAST(N'2023-09-10T14:42:30.9940000' AS DateTime2), N'UP50BT9443', 6, N'VSDS/PlateImage/e874e8c0-5e5a-4afe-a53c-fd6e34d1eafb.jpeg', N'VSDS/VehicleImage/e874e8c0-5e5a-4afe-a53c-fd6e34d1eafb.jpeg', N'', NULL, CAST(75.81 AS Decimal(18, 2)), CAST(80.00 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2023-09-10T16:26:33.550' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_VSDSEventsHistory] ([TransactionId], [EquipmentId], [LaneNumber], [EventID], [EventTypeId], [EventDate], [PlateNumber], [VehicleClassId], [PlateImageUrl], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [RadarSpeed], [AllowedSpeed], [OcrConfidencelevel], [ClassConfidencelevel], [PlateFontColor], [PlateBackColor], [VehicleColor], [VehicleDirectionId], [IsPlateVisible], [IsFaultyPlate], [IsStandardPlate], [IsWrongDirection], [IsReviewedRequired], [IsRestiredVehicle], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedPlateNumber], [IsReviewedPlateVisible], [IsReviewedFaultyPlate], [IsReviewedStandardPlate], [IsReviewedWrongDirection], [ReviewedBy], [ReviewedDateTime], [ReviewedRemark], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'100920231440569480', 42, 2, N'd404c33f-6bb9-4a36-bb9f-d7ea5257b627', 18, CAST(N'2023-09-10T14:40:56.9480000' AS DateTime2), N'UP32EQ2890', 3, N'VSDS/PlateImage/d404c33f-6bb9-4a36-bb9f-d7ea5257b627.jpeg', N'VSDS/VehicleImage/d404c33f-6bb9-4a36-bb9f-d7ea5257b627.jpeg', N'', NULL, CAST(80.27 AS Decimal(18, 2)), CAST(100.00 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2023-09-10T16:26:33.550' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_VSDSEventsHistory] ([TransactionId], [EquipmentId], [LaneNumber], [EventID], [EventTypeId], [EventDate], [PlateNumber], [VehicleClassId], [PlateImageUrl], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [RadarSpeed], [AllowedSpeed], [OcrConfidencelevel], [ClassConfidencelevel], [PlateFontColor], [PlateBackColor], [VehicleColor], [VehicleDirectionId], [IsPlateVisible], [IsFaultyPlate], [IsStandardPlate], [IsWrongDirection], [IsReviewedRequired], [IsRestiredVehicle], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedPlateNumber], [IsReviewedPlateVisible], [IsReviewedFaultyPlate], [IsReviewedStandardPlate], [IsReviewedWrongDirection], [ReviewedBy], [ReviewedDateTime], [ReviewedRemark], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'100920231440362560', 42, 3, N'8100590b-8177-4793-a1de-905c329dcc06', 18, CAST(N'2023-09-10T14:40:36.2560000' AS DateTime2), N'BR29AX6260', 3, N'VSDS/PlateImage/8100590b-8177-4793-a1de-905c329dcc06.jpeg', N'VSDS/VehicleImage/8100590b-8177-4793-a1de-905c329dcc06.jpeg', N'', NULL, CAST(91.50 AS Decimal(18, 2)), CAST(100.00 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2023-09-10T16:26:33.550' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_VSDSEventsHistory] ([TransactionId], [EquipmentId], [LaneNumber], [EventID], [EventTypeId], [EventDate], [PlateNumber], [VehicleClassId], [PlateImageUrl], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [RadarSpeed], [AllowedSpeed], [OcrConfidencelevel], [ClassConfidencelevel], [PlateFontColor], [PlateBackColor], [VehicleColor], [VehicleDirectionId], [IsPlateVisible], [IsFaultyPlate], [IsStandardPlate], [IsWrongDirection], [IsReviewedRequired], [IsRestiredVehicle], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedPlateNumber], [IsReviewedPlateVisible], [IsReviewedFaultyPlate], [IsReviewedStandardPlate], [IsReviewedWrongDirection], [ReviewedBy], [ReviewedDateTime], [ReviewedRemark], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'100920231440360920', 42, 2, N'a6b03c42-a49c-4d66-abf3-f463bc478245', 18, CAST(N'2023-09-10T14:40:36.0920000' AS DateTime2), N'WB74BB2786', 3, N'VSDS/PlateImage/a6b03c42-a49c-4d66-abf3-f463bc478245.jpeg', N'VSDS/VehicleImage/a6b03c42-a49c-4d66-abf3-f463bc478245.jpeg', N'', NULL, CAST(74.94 AS Decimal(18, 2)), CAST(100.00 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2023-09-10T16:26:33.550' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_VSDSEventsHistory] ([TransactionId], [EquipmentId], [LaneNumber], [EventID], [EventTypeId], [EventDate], [PlateNumber], [VehicleClassId], [PlateImageUrl], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [RadarSpeed], [AllowedSpeed], [OcrConfidencelevel], [ClassConfidencelevel], [PlateFontColor], [PlateBackColor], [VehicleColor], [VehicleDirectionId], [IsPlateVisible], [IsFaultyPlate], [IsStandardPlate], [IsWrongDirection], [IsReviewedRequired], [IsRestiredVehicle], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedPlateNumber], [IsReviewedPlateVisible], [IsReviewedFaultyPlate], [IsReviewedStandardPlate], [IsReviewedWrongDirection], [ReviewedBy], [ReviewedDateTime], [ReviewedRemark], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'100920231440018610', 42, 2, N'aa03ad21-830b-4f3b-b2b2-dbfc157170c3', 18, CAST(N'2023-09-10T14:40:01.8610000' AS DateTime2), N'UP50BU0241', 3, N'VSDS/PlateImage/aa03ad21-830b-4f3b-b2b2-dbfc157170c3.jpeg', N'VSDS/VehicleImage/aa03ad21-830b-4f3b-b2b2-dbfc157170c3.jpeg', N'', NULL, CAST(75.58 AS Decimal(18, 2)), CAST(100.00 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2023-09-10T16:26:33.550' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_VSDSEventsHistory] ([TransactionId], [EquipmentId], [LaneNumber], [EventID], [EventTypeId], [EventDate], [PlateNumber], [VehicleClassId], [PlateImageUrl], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [RadarSpeed], [AllowedSpeed], [OcrConfidencelevel], [ClassConfidencelevel], [PlateFontColor], [PlateBackColor], [VehicleColor], [VehicleDirectionId], [IsPlateVisible], [IsFaultyPlate], [IsStandardPlate], [IsWrongDirection], [IsReviewedRequired], [IsRestiredVehicle], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedPlateNumber], [IsReviewedPlateVisible], [IsReviewedFaultyPlate], [IsReviewedStandardPlate], [IsReviewedWrongDirection], [ReviewedBy], [ReviewedDateTime], [ReviewedRemark], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'100920231439554260', 42, 2, N'c0c5c0f6-cc96-4a70-ad01-50e853a84426', 18, CAST(N'2023-09-10T14:39:55.4260000' AS DateTime2), N'BR01PB6305', 3, N'VSDS/PlateImage/c0c5c0f6-cc96-4a70-ad01-50e853a84426.jpeg', N'VSDS/VehicleImage/c0c5c0f6-cc96-4a70-ad01-50e853a84426.jpeg', N'', NULL, CAST(90.65 AS Decimal(18, 2)), CAST(100.00 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2023-09-10T16:26:33.550' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_VSDSEventsHistory] ([TransactionId], [EquipmentId], [LaneNumber], [EventID], [EventTypeId], [EventDate], [PlateNumber], [VehicleClassId], [PlateImageUrl], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [RadarSpeed], [AllowedSpeed], [OcrConfidencelevel], [ClassConfidencelevel], [PlateFontColor], [PlateBackColor], [VehicleColor], [VehicleDirectionId], [IsPlateVisible], [IsFaultyPlate], [IsStandardPlate], [IsWrongDirection], [IsReviewedRequired], [IsRestiredVehicle], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedPlateNumber], [IsReviewedPlateVisible], [IsReviewedFaultyPlate], [IsReviewedStandardPlate], [IsReviewedWrongDirection], [ReviewedBy], [ReviewedDateTime], [ReviewedRemark], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'100920231439471150', 42, 2, N'ffa12fd9-e83b-4859-aa5d-d44669c6fdd7', 18, CAST(N'2023-09-10T14:39:47.1150000' AS DateTime2), N'CH01CJ1790', 3, N'VSDS/PlateImage/ffa12fd9-e83b-4859-aa5d-d44669c6fdd7.jpeg', N'VSDS/VehicleImage/ffa12fd9-e83b-4859-aa5d-d44669c6fdd7.jpeg', N'', NULL, CAST(72.82 AS Decimal(18, 2)), CAST(100.00 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2023-09-10T16:26:33.550' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_VSDSEventsHistory] ([TransactionId], [EquipmentId], [LaneNumber], [EventID], [EventTypeId], [EventDate], [PlateNumber], [VehicleClassId], [PlateImageUrl], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [RadarSpeed], [AllowedSpeed], [OcrConfidencelevel], [ClassConfidencelevel], [PlateFontColor], [PlateBackColor], [VehicleColor], [VehicleDirectionId], [IsPlateVisible], [IsFaultyPlate], [IsStandardPlate], [IsWrongDirection], [IsReviewedRequired], [IsRestiredVehicle], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedPlateNumber], [IsReviewedPlateVisible], [IsReviewedFaultyPlate], [IsReviewedStandardPlate], [IsReviewedWrongDirection], [ReviewedBy], [ReviewedDateTime], [ReviewedRemark], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'100920231439367160', 42, 2, N'f456b459-afd2-4f9a-bd20-b70f3dd4ae8d', 18, CAST(N'2023-09-10T14:39:36.7160000' AS DateTime2), N'UP32GX5105', 3, N'VSDS/PlateImage/f456b459-afd2-4f9a-bd20-b70f3dd4ae8d.jpeg', N'VSDS/VehicleImage/f456b459-afd2-4f9a-bd20-b70f3dd4ae8d.jpeg', N'', NULL, CAST(96.98 AS Decimal(18, 2)), CAST(100.00 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2023-09-10T16:26:33.550' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_VSDSEventsHistory] ([TransactionId], [EquipmentId], [LaneNumber], [EventID], [EventTypeId], [EventDate], [PlateNumber], [VehicleClassId], [PlateImageUrl], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [RadarSpeed], [AllowedSpeed], [OcrConfidencelevel], [ClassConfidencelevel], [PlateFontColor], [PlateBackColor], [VehicleColor], [VehicleDirectionId], [IsPlateVisible], [IsFaultyPlate], [IsStandardPlate], [IsWrongDirection], [IsReviewedRequired], [IsRestiredVehicle], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedPlateNumber], [IsReviewedPlateVisible], [IsReviewedFaultyPlate], [IsReviewedStandardPlate], [IsReviewedWrongDirection], [ReviewedBy], [ReviewedDateTime], [ReviewedRemark], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'100920231439335250', 42, 2, N'76625c03-575b-4d48-ae8a-08e7e4373706', 18, CAST(N'2023-09-10T14:39:33.5250000' AS DateTime2), N'UP53DV6364', 3, N'VSDS/PlateImage/76625c03-575b-4d48-ae8a-08e7e4373706.jpeg', N'VSDS/VehicleImage/76625c03-575b-4d48-ae8a-08e7e4373706.jpeg', N'', NULL, CAST(47.11 AS Decimal(18, 2)), CAST(100.00 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2023-09-10T16:26:33.550' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_VSDSEventsHistory] ([TransactionId], [EquipmentId], [LaneNumber], [EventID], [EventTypeId], [EventDate], [PlateNumber], [VehicleClassId], [PlateImageUrl], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [RadarSpeed], [AllowedSpeed], [OcrConfidencelevel], [ClassConfidencelevel], [PlateFontColor], [PlateBackColor], [VehicleColor], [VehicleDirectionId], [IsPlateVisible], [IsFaultyPlate], [IsStandardPlate], [IsWrongDirection], [IsReviewedRequired], [IsRestiredVehicle], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedPlateNumber], [IsReviewedPlateVisible], [IsReviewedFaultyPlate], [IsReviewedStandardPlate], [IsReviewedWrongDirection], [ReviewedBy], [ReviewedDateTime], [ReviewedRemark], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'100920231438573990', 42, 3, N'bacf41a9-0d83-4f1f-a64d-65f51c2caf20', 18, CAST(N'2023-09-10T14:38:57.3990000' AS DateTime2), N'NOT FOUND', 6, N'VSDS/PlateImage/bacf41a9-0d83-4f1f-a64d-65f51c2caf20.jpeg', N'VSDS/VehicleImage/bacf41a9-0d83-4f1f-a64d-65f51c2caf20.jpeg', N'', NULL, CAST(40.51 AS Decimal(18, 2)), CAST(80.00 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2023-09-10T16:26:33.550' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_VSDSEventsHistory] ([TransactionId], [EquipmentId], [LaneNumber], [EventID], [EventTypeId], [EventDate], [PlateNumber], [VehicleClassId], [PlateImageUrl], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [RadarSpeed], [AllowedSpeed], [OcrConfidencelevel], [ClassConfidencelevel], [PlateFontColor], [PlateBackColor], [VehicleColor], [VehicleDirectionId], [IsPlateVisible], [IsFaultyPlate], [IsStandardPlate], [IsWrongDirection], [IsReviewedRequired], [IsRestiredVehicle], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedPlateNumber], [IsReviewedPlateVisible], [IsReviewedFaultyPlate], [IsReviewedStandardPlate], [IsReviewedWrongDirection], [ReviewedBy], [ReviewedDateTime], [ReviewedRemark], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'100920231438455690', 42, 2, N'd9cb84b7-90c0-41cf-9630-92141d635864', 18, CAST(N'2023-09-10T14:38:45.5690000' AS DateTime2), N'UP54AR2015', 3, N'VSDS/PlateImage/d9cb84b7-90c0-41cf-9630-92141d635864.jpeg', N'VSDS/VehicleImage/d9cb84b7-90c0-41cf-9630-92141d635864.jpeg', N'', NULL, CAST(73.13 AS Decimal(18, 2)), CAST(100.00 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2023-09-10T16:26:33.550' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_VSDSEventsHistory] ([TransactionId], [EquipmentId], [LaneNumber], [EventID], [EventTypeId], [EventDate], [PlateNumber], [VehicleClassId], [PlateImageUrl], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [RadarSpeed], [AllowedSpeed], [OcrConfidencelevel], [ClassConfidencelevel], [PlateFontColor], [PlateBackColor], [VehicleColor], [VehicleDirectionId], [IsPlateVisible], [IsFaultyPlate], [IsStandardPlate], [IsWrongDirection], [IsReviewedRequired], [IsRestiredVehicle], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedPlateNumber], [IsReviewedPlateVisible], [IsReviewedFaultyPlate], [IsReviewedStandardPlate], [IsReviewedWrongDirection], [ReviewedBy], [ReviewedDateTime], [ReviewedRemark], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'100920231438081440', 42, 2, N'1a7bd819-6ea6-4359-a6a8-4fee2a006605', 18, CAST(N'2023-09-10T14:38:08.1440000' AS DateTime2), N'UP50BS0505', 3, N'VSDS/PlateImage/1a7bd819-6ea6-4359-a6a8-4fee2a006605.jpeg', N'VSDS/VehicleImage/1a7bd819-6ea6-4359-a6a8-4fee2a006605.jpeg', N'', NULL, CAST(90.01 AS Decimal(18, 2)), CAST(100.00 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2023-09-10T16:26:33.550' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_VSDSEventsHistory] ([TransactionId], [EquipmentId], [LaneNumber], [EventID], [EventTypeId], [EventDate], [PlateNumber], [VehicleClassId], [PlateImageUrl], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [RadarSpeed], [AllowedSpeed], [OcrConfidencelevel], [ClassConfidencelevel], [PlateFontColor], [PlateBackColor], [VehicleColor], [VehicleDirectionId], [IsPlateVisible], [IsFaultyPlate], [IsStandardPlate], [IsWrongDirection], [IsReviewedRequired], [IsRestiredVehicle], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedPlateNumber], [IsReviewedPlateVisible], [IsReviewedFaultyPlate], [IsReviewedStandardPlate], [IsReviewedWrongDirection], [ReviewedBy], [ReviewedDateTime], [ReviewedRemark], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'100920231437357210', 42, 2, N'371a34ac-fdb6-4285-b4d2-8b198000cf6d', 18, CAST(N'2023-09-10T14:37:35.7210000' AS DateTime2), N'UP32NS7979', 3, N'VSDS/PlateImage/371a34ac-fdb6-4285-b4d2-8b198000cf6d.jpeg', N'VSDS/VehicleImage/371a34ac-fdb6-4285-b4d2-8b198000cf6d.jpeg', N'', NULL, CAST(99.63 AS Decimal(18, 2)), CAST(100.00 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2023-09-10T16:26:33.550' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_VSDSEventsHistory] ([TransactionId], [EquipmentId], [LaneNumber], [EventID], [EventTypeId], [EventDate], [PlateNumber], [VehicleClassId], [PlateImageUrl], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [RadarSpeed], [AllowedSpeed], [OcrConfidencelevel], [ClassConfidencelevel], [PlateFontColor], [PlateBackColor], [VehicleColor], [VehicleDirectionId], [IsPlateVisible], [IsFaultyPlate], [IsStandardPlate], [IsWrongDirection], [IsReviewedRequired], [IsRestiredVehicle], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedPlateNumber], [IsReviewedPlateVisible], [IsReviewedFaultyPlate], [IsReviewedStandardPlate], [IsReviewedWrongDirection], [ReviewedBy], [ReviewedDateTime], [ReviewedRemark], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'100920231437187530', 42, 2, N'88855df5-78aa-4088-879f-0fdd434c8416', 18, CAST(N'2023-09-10T14:37:18.7530000' AS DateTime2), N'JH02AD8050', 3, N'VSDS/PlateImage/88855df5-78aa-4088-879f-0fdd434c8416.jpeg', N'VSDS/VehicleImage/88855df5-78aa-4088-879f-0fdd434c8416.jpeg', N'', NULL, CAST(99.18 AS Decimal(18, 2)), CAST(100.00 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2023-09-10T16:26:33.550' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_VSDSEventsHistory] ([TransactionId], [EquipmentId], [LaneNumber], [EventID], [EventTypeId], [EventDate], [PlateNumber], [VehicleClassId], [PlateImageUrl], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [RadarSpeed], [AllowedSpeed], [OcrConfidencelevel], [ClassConfidencelevel], [PlateFontColor], [PlateBackColor], [VehicleColor], [VehicleDirectionId], [IsPlateVisible], [IsFaultyPlate], [IsStandardPlate], [IsWrongDirection], [IsReviewedRequired], [IsRestiredVehicle], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedPlateNumber], [IsReviewedPlateVisible], [IsReviewedFaultyPlate], [IsReviewedStandardPlate], [IsReviewedWrongDirection], [ReviewedBy], [ReviewedDateTime], [ReviewedRemark], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'100920231437161580', 42, 2, N'9ce5d08f-df27-4d6a-a6b4-923293255b0b', 18, CAST(N'2023-09-10T14:37:16.1580000' AS DateTime2), N'BR01FU8541', 3, N'VSDS/PlateImage/9ce5d08f-df27-4d6a-a6b4-923293255b0b.jpeg', N'VSDS/VehicleImage/9ce5d08f-df27-4d6a-a6b4-923293255b0b.jpeg', N'', NULL, CAST(82.27 AS Decimal(18, 2)), CAST(100.00 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2023-09-10T16:26:33.550' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_VSDSEventsHistory] ([TransactionId], [EquipmentId], [LaneNumber], [EventID], [EventTypeId], [EventDate], [PlateNumber], [VehicleClassId], [PlateImageUrl], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [RadarSpeed], [AllowedSpeed], [OcrConfidencelevel], [ClassConfidencelevel], [PlateFontColor], [PlateBackColor], [VehicleColor], [VehicleDirectionId], [IsPlateVisible], [IsFaultyPlate], [IsStandardPlate], [IsWrongDirection], [IsReviewedRequired], [IsRestiredVehicle], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedPlateNumber], [IsReviewedPlateVisible], [IsReviewedFaultyPlate], [IsReviewedStandardPlate], [IsReviewedWrongDirection], [ReviewedBy], [ReviewedDateTime], [ReviewedRemark], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'100920231437022690', 42, 2, N'4dded688-11f7-4a10-b3f8-cd153c5445a5', 18, CAST(N'2023-09-10T14:37:02.2690000' AS DateTime2), N'UP32GF1718', 3, N'VSDS/PlateImage/4dded688-11f7-4a10-b3f8-cd153c5445a5.jpeg', N'VSDS/VehicleImage/4dded688-11f7-4a10-b3f8-cd153c5445a5.jpeg', N'', NULL, CAST(89.29 AS Decimal(18, 2)), CAST(100.00 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2023-09-10T16:26:33.550' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_VSDSEventsHistory] ([TransactionId], [EquipmentId], [LaneNumber], [EventID], [EventTypeId], [EventDate], [PlateNumber], [VehicleClassId], [PlateImageUrl], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [RadarSpeed], [AllowedSpeed], [OcrConfidencelevel], [ClassConfidencelevel], [PlateFontColor], [PlateBackColor], [VehicleColor], [VehicleDirectionId], [IsPlateVisible], [IsFaultyPlate], [IsStandardPlate], [IsWrongDirection], [IsReviewedRequired], [IsRestiredVehicle], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedPlateNumber], [IsReviewedPlateVisible], [IsReviewedFaultyPlate], [IsReviewedStandardPlate], [IsReviewedWrongDirection], [ReviewedBy], [ReviewedDateTime], [ReviewedRemark], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'100920231435527980', 42, 2, N'e2e0cd95-c5a5-46da-b553-b970583364cc', 18, CAST(N'2023-09-10T14:35:52.7980000' AS DateTime2), N'UP32MV2409', 3, N'VSDS/PlateImage/e2e0cd95-c5a5-46da-b553-b970583364cc.jpeg', N'VSDS/VehicleImage/e2e0cd95-c5a5-46da-b553-b970583364cc.jpeg', N'', NULL, CAST(71.24 AS Decimal(18, 2)), CAST(100.00 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2023-09-10T16:26:33.550' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_VSDSEventsHistory] ([TransactionId], [EquipmentId], [LaneNumber], [EventID], [EventTypeId], [EventDate], [PlateNumber], [VehicleClassId], [PlateImageUrl], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [RadarSpeed], [AllowedSpeed], [OcrConfidencelevel], [ClassConfidencelevel], [PlateFontColor], [PlateBackColor], [VehicleColor], [VehicleDirectionId], [IsPlateVisible], [IsFaultyPlate], [IsStandardPlate], [IsWrongDirection], [IsReviewedRequired], [IsRestiredVehicle], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedPlateNumber], [IsReviewedPlateVisible], [IsReviewedFaultyPlate], [IsReviewedStandardPlate], [IsReviewedWrongDirection], [ReviewedBy], [ReviewedDateTime], [ReviewedRemark], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'100920231435094590', 42, 2, N'f27864eb-826c-4fb2-bdf1-7e8066c2379e', 18, CAST(N'2023-09-10T14:35:09.4590000' AS DateTime2), N'UP61BC1865', 3, N'VSDS/PlateImage/f27864eb-826c-4fb2-bdf1-7e8066c2379e.jpeg', N'VSDS/VehicleImage/f27864eb-826c-4fb2-bdf1-7e8066c2379e.jpeg', N'', NULL, CAST(82.24 AS Decimal(18, 2)), CAST(100.00 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2023-09-10T16:26:33.550' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_VSDSEventsHistory] ([TransactionId], [EquipmentId], [LaneNumber], [EventID], [EventTypeId], [EventDate], [PlateNumber], [VehicleClassId], [PlateImageUrl], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [RadarSpeed], [AllowedSpeed], [OcrConfidencelevel], [ClassConfidencelevel], [PlateFontColor], [PlateBackColor], [VehicleColor], [VehicleDirectionId], [IsPlateVisible], [IsFaultyPlate], [IsStandardPlate], [IsWrongDirection], [IsReviewedRequired], [IsRestiredVehicle], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedPlateNumber], [IsReviewedPlateVisible], [IsReviewedFaultyPlate], [IsReviewedStandardPlate], [IsReviewedWrongDirection], [ReviewedBy], [ReviewedDateTime], [ReviewedRemark], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'100920231435015260', 42, 3, N'e03e9e78-7af9-4905-a9b3-7fcfe806c93e', 18, CAST(N'2023-09-10T14:35:01.5260000' AS DateTime2), N'UP32MN9342', 5, N'VSDS/PlateImage/e03e9e78-7af9-4905-a9b3-7fcfe806c93e.jpeg', N'VSDS/VehicleImage/e03e9e78-7af9-4905-a9b3-7fcfe806c93e.jpeg', N'', NULL, CAST(71.79 AS Decimal(18, 2)), CAST(80.00 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2023-09-10T16:26:33.550' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_VSDSEventsHistory] ([TransactionId], [EquipmentId], [LaneNumber], [EventID], [EventTypeId], [EventDate], [PlateNumber], [VehicleClassId], [PlateImageUrl], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [RadarSpeed], [AllowedSpeed], [OcrConfidencelevel], [ClassConfidencelevel], [PlateFontColor], [PlateBackColor], [VehicleColor], [VehicleDirectionId], [IsPlateVisible], [IsFaultyPlate], [IsStandardPlate], [IsWrongDirection], [IsReviewedRequired], [IsRestiredVehicle], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedPlateNumber], [IsReviewedPlateVisible], [IsReviewedFaultyPlate], [IsReviewedStandardPlate], [IsReviewedWrongDirection], [ReviewedBy], [ReviewedDateTime], [ReviewedRemark], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'100920231434471910', 42, 2, N'3ead0a36-39a1-4e8b-8bdb-543f0c0143cd', 18, CAST(N'2023-09-10T14:34:47.1910000' AS DateTime2), N'UP32LD2815', 3, N'VSDS/PlateImage/3ead0a36-39a1-4e8b-8bdb-543f0c0143cd.jpeg', N'VSDS/VehicleImage/3ead0a36-39a1-4e8b-8bdb-543f0c0143cd.jpeg', N'', NULL, CAST(83.39 AS Decimal(18, 2)), CAST(100.00 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2023-09-10T16:26:33.550' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_VSDSEventsHistory] ([TransactionId], [EquipmentId], [LaneNumber], [EventID], [EventTypeId], [EventDate], [PlateNumber], [VehicleClassId], [PlateImageUrl], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [RadarSpeed], [AllowedSpeed], [OcrConfidencelevel], [ClassConfidencelevel], [PlateFontColor], [PlateBackColor], [VehicleColor], [VehicleDirectionId], [IsPlateVisible], [IsFaultyPlate], [IsStandardPlate], [IsWrongDirection], [IsReviewedRequired], [IsRestiredVehicle], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedPlateNumber], [IsReviewedPlateVisible], [IsReviewedFaultyPlate], [IsReviewedStandardPlate], [IsReviewedWrongDirection], [ReviewedBy], [ReviewedDateTime], [ReviewedRemark], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'100920231434314840', 42, 2, N'bdea4f9f-8599-4139-b832-5905a1f07392', 18, CAST(N'2023-09-10T14:34:31.4840000' AS DateTime2), N'BR01DT2117', 3, N'VSDS/PlateImage/bdea4f9f-8599-4139-b832-5905a1f07392.jpeg', N'VSDS/VehicleImage/bdea4f9f-8599-4139-b832-5905a1f07392.jpeg', N'', NULL, CAST(79.35 AS Decimal(18, 2)), CAST(100.00 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2023-09-10T16:26:33.550' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_VSDSEventsHistory] ([TransactionId], [EquipmentId], [LaneNumber], [EventID], [EventTypeId], [EventDate], [PlateNumber], [VehicleClassId], [PlateImageUrl], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [RadarSpeed], [AllowedSpeed], [OcrConfidencelevel], [ClassConfidencelevel], [PlateFontColor], [PlateBackColor], [VehicleColor], [VehicleDirectionId], [IsPlateVisible], [IsFaultyPlate], [IsStandardPlate], [IsWrongDirection], [IsReviewedRequired], [IsRestiredVehicle], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedPlateNumber], [IsReviewedPlateVisible], [IsReviewedFaultyPlate], [IsReviewedStandardPlate], [IsReviewedWrongDirection], [ReviewedBy], [ReviewedDateTime], [ReviewedRemark], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'100920231434308820', 42, 2, N'419070f3-c1c4-494c-9b24-79942a640b9c', 12, CAST(N'2023-09-10T14:34:30.8820000' AS DateTime2), N'UP32ET2995', 3, N'VSDS/PlateImage/419070f3-c1c4-494c-9b24-79942a640b9c.jpeg', N'VSDS/VehicleImage/419070f3-c1c4-494c-9b24-79942a640b9c.jpeg', N'', NULL, CAST(122.12 AS Decimal(18, 2)), CAST(100.00 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2023-09-10T16:26:33.550' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_VSDSEventsHistory] ([TransactionId], [EquipmentId], [LaneNumber], [EventID], [EventTypeId], [EventDate], [PlateNumber], [VehicleClassId], [PlateImageUrl], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [RadarSpeed], [AllowedSpeed], [OcrConfidencelevel], [ClassConfidencelevel], [PlateFontColor], [PlateBackColor], [VehicleColor], [VehicleDirectionId], [IsPlateVisible], [IsFaultyPlate], [IsStandardPlate], [IsWrongDirection], [IsReviewedRequired], [IsRestiredVehicle], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedPlateNumber], [IsReviewedPlateVisible], [IsReviewedFaultyPlate], [IsReviewedStandardPlate], [IsReviewedWrongDirection], [ReviewedBy], [ReviewedDateTime], [ReviewedRemark], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'100920231433127010', 42, 2, N'2138e6be-2b7b-4be0-bc83-fc75962d87b6', 18, CAST(N'2023-09-10T14:33:12.7010000' AS DateTime2), N'HR55AP3290', 5, N'VSDS/PlateImage/2138e6be-2b7b-4be0-bc83-fc75962d87b6.jpeg', N'VSDS/VehicleImage/2138e6be-2b7b-4be0-bc83-fc75962d87b6.jpeg', N'', NULL, CAST(63.29 AS Decimal(18, 2)), CAST(80.00 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2023-09-10T16:26:33.550' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_VSDSEventsHistory] ([TransactionId], [EquipmentId], [LaneNumber], [EventID], [EventTypeId], [EventDate], [PlateNumber], [VehicleClassId], [PlateImageUrl], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [RadarSpeed], [AllowedSpeed], [OcrConfidencelevel], [ClassConfidencelevel], [PlateFontColor], [PlateBackColor], [VehicleColor], [VehicleDirectionId], [IsPlateVisible], [IsFaultyPlate], [IsStandardPlate], [IsWrongDirection], [IsReviewedRequired], [IsRestiredVehicle], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedPlateNumber], [IsReviewedPlateVisible], [IsReviewedFaultyPlate], [IsReviewedStandardPlate], [IsReviewedWrongDirection], [ReviewedBy], [ReviewedDateTime], [ReviewedRemark], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'100920231433038370', 42, 2, N'9faecc14-5990-4592-a2aa-40101963e14f', 18, CAST(N'2023-09-10T14:33:03.8370000' AS DateTime2), N'UP60AP2728', 3, N'VSDS/PlateImage/9faecc14-5990-4592-a2aa-40101963e14f.jpeg', N'VSDS/VehicleImage/9faecc14-5990-4592-a2aa-40101963e14f.jpeg', N'', NULL, CAST(78.38 AS Decimal(18, 2)), CAST(100.00 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2023-09-10T16:26:33.550' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_VSDSEventsHistory] ([TransactionId], [EquipmentId], [LaneNumber], [EventID], [EventTypeId], [EventDate], [PlateNumber], [VehicleClassId], [PlateImageUrl], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [RadarSpeed], [AllowedSpeed], [OcrConfidencelevel], [ClassConfidencelevel], [PlateFontColor], [PlateBackColor], [VehicleColor], [VehicleDirectionId], [IsPlateVisible], [IsFaultyPlate], [IsStandardPlate], [IsWrongDirection], [IsReviewedRequired], [IsRestiredVehicle], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedPlateNumber], [IsReviewedPlateVisible], [IsReviewedFaultyPlate], [IsReviewedStandardPlate], [IsReviewedWrongDirection], [ReviewedBy], [ReviewedDateTime], [ReviewedRemark], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'100920231432458380', 42, 2, N'2386f47e-7f22-40aa-8c46-5ef096f3d0e3', 18, CAST(N'2023-09-10T14:32:45.8380000' AS DateTime2), N'UP32ND4915', 3, N'VSDS/PlateImage/2386f47e-7f22-40aa-8c46-5ef096f3d0e3.jpeg', N'VSDS/VehicleImage/2386f47e-7f22-40aa-8c46-5ef096f3d0e3.jpeg', N'', NULL, CAST(77.99 AS Decimal(18, 2)), CAST(100.00 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2023-09-10T16:26:33.550' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_VSDSEventsHistory] ([TransactionId], [EquipmentId], [LaneNumber], [EventID], [EventTypeId], [EventDate], [PlateNumber], [VehicleClassId], [PlateImageUrl], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [RadarSpeed], [AllowedSpeed], [OcrConfidencelevel], [ClassConfidencelevel], [PlateFontColor], [PlateBackColor], [VehicleColor], [VehicleDirectionId], [IsPlateVisible], [IsFaultyPlate], [IsStandardPlate], [IsWrongDirection], [IsReviewedRequired], [IsRestiredVehicle], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedPlateNumber], [IsReviewedPlateVisible], [IsReviewedFaultyPlate], [IsReviewedStandardPlate], [IsReviewedWrongDirection], [ReviewedBy], [ReviewedDateTime], [ReviewedRemark], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'100920231432324640', 42, 1, N'276c4db5-0698-4210-b5ec-fcc61508da34', 18, CAST(N'2023-09-10T14:32:32.4640000' AS DateTime2), N'UP15BE2086', 3, N'VSDS/PlateImage/276c4db5-0698-4210-b5ec-fcc61508da34.jpeg', N'VSDS/VehicleImage/276c4db5-0698-4210-b5ec-fcc61508da34.jpeg', N'', NULL, CAST(99.10 AS Decimal(18, 2)), CAST(100.00 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2023-09-10T16:26:33.550' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_VSDSEventsHistory] ([TransactionId], [EquipmentId], [LaneNumber], [EventID], [EventTypeId], [EventDate], [PlateNumber], [VehicleClassId], [PlateImageUrl], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [RadarSpeed], [AllowedSpeed], [OcrConfidencelevel], [ClassConfidencelevel], [PlateFontColor], [PlateBackColor], [VehicleColor], [VehicleDirectionId], [IsPlateVisible], [IsFaultyPlate], [IsStandardPlate], [IsWrongDirection], [IsReviewedRequired], [IsRestiredVehicle], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedPlateNumber], [IsReviewedPlateVisible], [IsReviewedFaultyPlate], [IsReviewedStandardPlate], [IsReviewedWrongDirection], [ReviewedBy], [ReviewedDateTime], [ReviewedRemark], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'100920231432279240', 42, 2, N'8c9d3a46-64be-445f-811f-567aff32a2e9', 18, CAST(N'2023-09-10T14:32:27.9240000' AS DateTime2), N'UP62BS1008', 3, N'VSDS/PlateImage/8c9d3a46-64be-445f-811f-567aff32a2e9.jpeg', N'VSDS/VehicleImage/8c9d3a46-64be-445f-811f-567aff32a2e9.jpeg', N'', NULL, CAST(95.14 AS Decimal(18, 2)), CAST(100.00 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2023-09-10T16:26:33.550' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_VSDSEventsHistory] ([TransactionId], [EquipmentId], [LaneNumber], [EventID], [EventTypeId], [EventDate], [PlateNumber], [VehicleClassId], [PlateImageUrl], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [RadarSpeed], [AllowedSpeed], [OcrConfidencelevel], [ClassConfidencelevel], [PlateFontColor], [PlateBackColor], [VehicleColor], [VehicleDirectionId], [IsPlateVisible], [IsFaultyPlate], [IsStandardPlate], [IsWrongDirection], [IsReviewedRequired], [IsRestiredVehicle], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedPlateNumber], [IsReviewedPlateVisible], [IsReviewedFaultyPlate], [IsReviewedStandardPlate], [IsReviewedWrongDirection], [ReviewedBy], [ReviewedDateTime], [ReviewedRemark], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'100920231432214330', 42, 4, N'5164fb93-cc12-49bb-b8c1-d4f3d9c3b910', 14, CAST(N'2023-09-10T14:32:21.4330000' AS DateTime2), N'UP54M8976', 1, N'VSDS/PlateImage/5164fb93-cc12-49bb-b8c1-d4f3d9c3b910.jpeg', N'VSDS/VehicleImage/5164fb93-cc12-49bb-b8c1-d4f3d9c3b910.jpeg', N'', NULL, CAST(47.81 AS Decimal(18, 2)), CAST(80.00 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2023-09-10T16:26:33.550' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_VSDSEventsHistory] ([TransactionId], [EquipmentId], [LaneNumber], [EventID], [EventTypeId], [EventDate], [PlateNumber], [VehicleClassId], [PlateImageUrl], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [RadarSpeed], [AllowedSpeed], [OcrConfidencelevel], [ClassConfidencelevel], [PlateFontColor], [PlateBackColor], [VehicleColor], [VehicleDirectionId], [IsPlateVisible], [IsFaultyPlate], [IsStandardPlate], [IsWrongDirection], [IsReviewedRequired], [IsRestiredVehicle], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedPlateNumber], [IsReviewedPlateVisible], [IsReviewedFaultyPlate], [IsReviewedStandardPlate], [IsReviewedWrongDirection], [ReviewedBy], [ReviewedDateTime], [ReviewedRemark], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'100920231432125400', 42, 1, N'55de0357-9078-48d8-a19b-7df934137b22', 18, CAST(N'2023-09-10T14:32:12.5400000' AS DateTime2), N'UP58AC9856', 3, N'VSDS/PlateImage/55de0357-9078-48d8-a19b-7df934137b22.jpeg', N'VSDS/VehicleImage/55de0357-9078-48d8-a19b-7df934137b22.jpeg', N'', NULL, CAST(76.35 AS Decimal(18, 2)), CAST(100.00 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2023-09-10T16:26:33.550' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_VSDSEventsHistory] ([TransactionId], [EquipmentId], [LaneNumber], [EventID], [EventTypeId], [EventDate], [PlateNumber], [VehicleClassId], [PlateImageUrl], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [RadarSpeed], [AllowedSpeed], [OcrConfidencelevel], [ClassConfidencelevel], [PlateFontColor], [PlateBackColor], [VehicleColor], [VehicleDirectionId], [IsPlateVisible], [IsFaultyPlate], [IsStandardPlate], [IsWrongDirection], [IsReviewedRequired], [IsRestiredVehicle], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedPlateNumber], [IsReviewedPlateVisible], [IsReviewedFaultyPlate], [IsReviewedStandardPlate], [IsReviewedWrongDirection], [ReviewedBy], [ReviewedDateTime], [ReviewedRemark], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'100920231431509230', 42, 2, N'd2bcde47-f753-4d63-9ba9-53c87512f927', 18, CAST(N'2023-09-10T14:31:50.9230000' AS DateTime2), N'UP16CS4904', 3, N'VSDS/PlateImage/d2bcde47-f753-4d63-9ba9-53c87512f927.jpeg', N'VSDS/VehicleImage/d2bcde47-f753-4d63-9ba9-53c87512f927.jpeg', N'', NULL, CAST(79.87 AS Decimal(18, 2)), CAST(100.00 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2023-09-10T16:26:33.550' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_VSDSEventsHistory] ([TransactionId], [EquipmentId], [LaneNumber], [EventID], [EventTypeId], [EventDate], [PlateNumber], [VehicleClassId], [PlateImageUrl], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [RadarSpeed], [AllowedSpeed], [OcrConfidencelevel], [ClassConfidencelevel], [PlateFontColor], [PlateBackColor], [VehicleColor], [VehicleDirectionId], [IsPlateVisible], [IsFaultyPlate], [IsStandardPlate], [IsWrongDirection], [IsReviewedRequired], [IsRestiredVehicle], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedPlateNumber], [IsReviewedPlateVisible], [IsReviewedFaultyPlate], [IsReviewedStandardPlate], [IsReviewedWrongDirection], [ReviewedBy], [ReviewedDateTime], [ReviewedRemark], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'100920231431432090', 42, 3, N'19dd3f0b-dc5a-4ffa-830e-1cd9188310f8', 18, CAST(N'2023-09-10T14:31:43.2090000' AS DateTime2), N'UP60AT3772', 3, N'VSDS/PlateImage/19dd3f0b-dc5a-4ffa-830e-1cd9188310f8.jpeg', N'VSDS/VehicleImage/19dd3f0b-dc5a-4ffa-830e-1cd9188310f8.jpeg', N'', NULL, CAST(85.56 AS Decimal(18, 2)), CAST(100.00 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2023-09-10T16:26:33.550' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_VSDSEventsHistory] ([TransactionId], [EquipmentId], [LaneNumber], [EventID], [EventTypeId], [EventDate], [PlateNumber], [VehicleClassId], [PlateImageUrl], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [RadarSpeed], [AllowedSpeed], [OcrConfidencelevel], [ClassConfidencelevel], [PlateFontColor], [PlateBackColor], [VehicleColor], [VehicleDirectionId], [IsPlateVisible], [IsFaultyPlate], [IsStandardPlate], [IsWrongDirection], [IsReviewedRequired], [IsRestiredVehicle], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedPlateNumber], [IsReviewedPlateVisible], [IsReviewedFaultyPlate], [IsReviewedStandardPlate], [IsReviewedWrongDirection], [ReviewedBy], [ReviewedDateTime], [ReviewedRemark], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'100920231431344700', 42, 3, N'6a8c3932-f210-45dd-b0dd-e9c8d5ff22f1', 18, CAST(N'2023-09-10T14:31:34.4700000' AS DateTime2), N'JH10BY2768', 3, N'VSDS/PlateImage/6a8c3932-f210-45dd-b0dd-e9c8d5ff22f1.jpeg', N'VSDS/VehicleImage/6a8c3932-f210-45dd-b0dd-e9c8d5ff22f1.jpeg', N'', NULL, CAST(78.68 AS Decimal(18, 2)), CAST(100.00 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2023-09-10T16:26:33.550' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_VSDSEventsHistory] ([TransactionId], [EquipmentId], [LaneNumber], [EventID], [EventTypeId], [EventDate], [PlateNumber], [VehicleClassId], [PlateImageUrl], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [RadarSpeed], [AllowedSpeed], [OcrConfidencelevel], [ClassConfidencelevel], [PlateFontColor], [PlateBackColor], [VehicleColor], [VehicleDirectionId], [IsPlateVisible], [IsFaultyPlate], [IsStandardPlate], [IsWrongDirection], [IsReviewedRequired], [IsRestiredVehicle], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedPlateNumber], [IsReviewedPlateVisible], [IsReviewedFaultyPlate], [IsReviewedStandardPlate], [IsReviewedWrongDirection], [ReviewedBy], [ReviewedDateTime], [ReviewedRemark], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'100920231431329580', 42, 2, N'e50d4aa0-50f7-4666-aea6-3e31f01d5495', 18, CAST(N'2023-09-10T14:31:32.9580000' AS DateTime2), N'UP32QN2714', 3, N'VSDS/PlateImage/e50d4aa0-50f7-4666-aea6-3e31f01d5495.jpeg', N'VSDS/VehicleImage/e50d4aa0-50f7-4666-aea6-3e31f01d5495.jpeg', N'', NULL, CAST(93.08 AS Decimal(18, 2)), CAST(100.00 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2023-09-10T16:26:33.550' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_VSDSEventsHistory] ([TransactionId], [EquipmentId], [LaneNumber], [EventID], [EventTypeId], [EventDate], [PlateNumber], [VehicleClassId], [PlateImageUrl], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [RadarSpeed], [AllowedSpeed], [OcrConfidencelevel], [ClassConfidencelevel], [PlateFontColor], [PlateBackColor], [VehicleColor], [VehicleDirectionId], [IsPlateVisible], [IsFaultyPlate], [IsStandardPlate], [IsWrongDirection], [IsReviewedRequired], [IsRestiredVehicle], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedPlateNumber], [IsReviewedPlateVisible], [IsReviewedFaultyPlate], [IsReviewedStandardPlate], [IsReviewedWrongDirection], [ReviewedBy], [ReviewedDateTime], [ReviewedRemark], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'100920231431295860', 42, 1, N'4ecb7000-1ae2-4430-8f00-bf935d4877d2', 18, CAST(N'2023-09-10T14:31:29.5860000' AS DateTime2), N'UP60AV0704', 3, N'VSDS/PlateImage/4ecb7000-1ae2-4430-8f00-bf935d4877d2.jpeg', N'VSDS/VehicleImage/4ecb7000-1ae2-4430-8f00-bf935d4877d2.jpeg', N'', NULL, CAST(85.56 AS Decimal(18, 2)), CAST(100.00 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2023-09-10T16:26:33.550' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_VSDSEventsHistory] ([TransactionId], [EquipmentId], [LaneNumber], [EventID], [EventTypeId], [EventDate], [PlateNumber], [VehicleClassId], [PlateImageUrl], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [RadarSpeed], [AllowedSpeed], [OcrConfidencelevel], [ClassConfidencelevel], [PlateFontColor], [PlateBackColor], [VehicleColor], [VehicleDirectionId], [IsPlateVisible], [IsFaultyPlate], [IsStandardPlate], [IsWrongDirection], [IsReviewedRequired], [IsRestiredVehicle], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedPlateNumber], [IsReviewedPlateVisible], [IsReviewedFaultyPlate], [IsReviewedStandardPlate], [IsReviewedWrongDirection], [ReviewedBy], [ReviewedDateTime], [ReviewedRemark], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'100920231431119280', 42, 2, N'd67cd502-3d5c-4377-81de-7a49e11dc5a2', 18, CAST(N'2023-09-10T14:31:11.9280000' AS DateTime2), N'UP21DT0587', 6, N'VSDS/PlateImage/d67cd502-3d5c-4377-81de-7a49e11dc5a2.jpeg', N'VSDS/VehicleImage/d67cd502-3d5c-4377-81de-7a49e11dc5a2.jpeg', N'', NULL, CAST(61.42 AS Decimal(18, 2)), CAST(80.00 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2023-09-10T16:26:33.550' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_VSDSEventsHistory] ([TransactionId], [EquipmentId], [LaneNumber], [EventID], [EventTypeId], [EventDate], [PlateNumber], [VehicleClassId], [PlateImageUrl], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [RadarSpeed], [AllowedSpeed], [OcrConfidencelevel], [ClassConfidencelevel], [PlateFontColor], [PlateBackColor], [VehicleColor], [VehicleDirectionId], [IsPlateVisible], [IsFaultyPlate], [IsStandardPlate], [IsWrongDirection], [IsReviewedRequired], [IsRestiredVehicle], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedPlateNumber], [IsReviewedPlateVisible], [IsReviewedFaultyPlate], [IsReviewedStandardPlate], [IsReviewedWrongDirection], [ReviewedBy], [ReviewedDateTime], [ReviewedRemark], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'100920231431090020', 42, 2, N'99e74b1a-9498-4aea-be72-673948d51748', 18, CAST(N'2023-09-10T14:31:09.0020000' AS DateTime2), N'UP32NK8010', 3, N'VSDS/PlateImage/99e74b1a-9498-4aea-be72-673948d51748.jpeg', N'VSDS/VehicleImage/99e74b1a-9498-4aea-be72-673948d51748.jpeg', N'', NULL, CAST(91.16 AS Decimal(18, 2)), CAST(100.00 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2023-09-10T16:26:33.550' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_VSDSEventsHistory] ([TransactionId], [EquipmentId], [LaneNumber], [EventID], [EventTypeId], [EventDate], [PlateNumber], [VehicleClassId], [PlateImageUrl], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [RadarSpeed], [AllowedSpeed], [OcrConfidencelevel], [ClassConfidencelevel], [PlateFontColor], [PlateBackColor], [VehicleColor], [VehicleDirectionId], [IsPlateVisible], [IsFaultyPlate], [IsStandardPlate], [IsWrongDirection], [IsReviewedRequired], [IsRestiredVehicle], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedPlateNumber], [IsReviewedPlateVisible], [IsReviewedFaultyPlate], [IsReviewedStandardPlate], [IsReviewedWrongDirection], [ReviewedBy], [ReviewedDateTime], [ReviewedRemark], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'100920231431054950', 42, 2, N'0527464a-c959-426d-b9a5-3137bc23fdb2', 12, CAST(N'2023-09-10T14:31:05.4950000' AS DateTime2), N'UP65MT2439', 4, N'VSDS/PlateImage/0527464a-c959-426d-b9a5-3137bc23fdb2.jpeg', N'VSDS/VehicleImage/0527464a-c959-426d-b9a5-3137bc23fdb2.jpeg', N'', NULL, CAST(89.04 AS Decimal(18, 2)), CAST(80.00 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2023-09-10T16:26:33.550' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_VSDSEventsHistory] ([TransactionId], [EquipmentId], [LaneNumber], [EventID], [EventTypeId], [EventDate], [PlateNumber], [VehicleClassId], [PlateImageUrl], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [RadarSpeed], [AllowedSpeed], [OcrConfidencelevel], [ClassConfidencelevel], [PlateFontColor], [PlateBackColor], [VehicleColor], [VehicleDirectionId], [IsPlateVisible], [IsFaultyPlate], [IsStandardPlate], [IsWrongDirection], [IsReviewedRequired], [IsRestiredVehicle], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedPlateNumber], [IsReviewedPlateVisible], [IsReviewedFaultyPlate], [IsReviewedStandardPlate], [IsReviewedWrongDirection], [ReviewedBy], [ReviewedDateTime], [ReviewedRemark], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'100920231431000840', 42, 2, N'038b39ba-353e-4cec-9ed0-abbc89c8b15b', 18, CAST(N'2023-09-10T14:31:00.0840000' AS DateTime2), N'UP41AH9869', 3, N'VSDS/PlateImage/038b39ba-353e-4cec-9ed0-abbc89c8b15b.jpeg', N'VSDS/VehicleImage/038b39ba-353e-4cec-9ed0-abbc89c8b15b.jpeg', N'', NULL, CAST(94.69 AS Decimal(18, 2)), CAST(100.00 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2023-09-10T16:26:33.550' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_VSDSEventsHistory] ([TransactionId], [EquipmentId], [LaneNumber], [EventID], [EventTypeId], [EventDate], [PlateNumber], [VehicleClassId], [PlateImageUrl], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [RadarSpeed], [AllowedSpeed], [OcrConfidencelevel], [ClassConfidencelevel], [PlateFontColor], [PlateBackColor], [VehicleColor], [VehicleDirectionId], [IsPlateVisible], [IsFaultyPlate], [IsStandardPlate], [IsWrongDirection], [IsReviewedRequired], [IsRestiredVehicle], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedPlateNumber], [IsReviewedPlateVisible], [IsReviewedFaultyPlate], [IsReviewedStandardPlate], [IsReviewedWrongDirection], [ReviewedBy], [ReviewedDateTime], [ReviewedRemark], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'100920231431000090', 42, 2, N'53908c78-3b6e-41e9-b3d3-145f2bba2bd0', 18, CAST(N'2023-09-10T14:31:00.0090000' AS DateTime2), N'UP54AV1041', 3, N'VSDS/PlateImage/53908c78-3b6e-41e9-b3d3-145f2bba2bd0.jpeg', N'VSDS/VehicleImage/53908c78-3b6e-41e9-b3d3-145f2bba2bd0.jpeg', N'', NULL, CAST(97.90 AS Decimal(18, 2)), CAST(100.00 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2023-09-10T16:26:33.550' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_VSDSEventsHistory] ([TransactionId], [EquipmentId], [LaneNumber], [EventID], [EventTypeId], [EventDate], [PlateNumber], [VehicleClassId], [PlateImageUrl], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [RadarSpeed], [AllowedSpeed], [OcrConfidencelevel], [ClassConfidencelevel], [PlateFontColor], [PlateBackColor], [VehicleColor], [VehicleDirectionId], [IsPlateVisible], [IsFaultyPlate], [IsStandardPlate], [IsWrongDirection], [IsReviewedRequired], [IsRestiredVehicle], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedPlateNumber], [IsReviewedPlateVisible], [IsReviewedFaultyPlate], [IsReviewedStandardPlate], [IsReviewedWrongDirection], [ReviewedBy], [ReviewedDateTime], [ReviewedRemark], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'100920231430515730', 42, 2, N'97220c15-1197-4cd6-9b06-bda159af6bb4', 18, CAST(N'2023-09-10T14:30:51.5730000' AS DateTime2), N'UP50AH3008', 3, N'VSDS/PlateImage/97220c15-1197-4cd6-9b06-bda159af6bb4.jpeg', N'VSDS/VehicleImage/97220c15-1197-4cd6-9b06-bda159af6bb4.jpeg', N'', NULL, CAST(73.80 AS Decimal(18, 2)), CAST(100.00 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2023-09-10T16:26:33.550' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_VSDSEventsHistory] ([TransactionId], [EquipmentId], [LaneNumber], [EventID], [EventTypeId], [EventDate], [PlateNumber], [VehicleClassId], [PlateImageUrl], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [RadarSpeed], [AllowedSpeed], [OcrConfidencelevel], [ClassConfidencelevel], [PlateFontColor], [PlateBackColor], [VehicleColor], [VehicleDirectionId], [IsPlateVisible], [IsFaultyPlate], [IsStandardPlate], [IsWrongDirection], [IsReviewedRequired], [IsRestiredVehicle], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedPlateNumber], [IsReviewedPlateVisible], [IsReviewedFaultyPlate], [IsReviewedStandardPlate], [IsReviewedWrongDirection], [ReviewedBy], [ReviewedDateTime], [ReviewedRemark], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'100920231430393840', 42, 2, N'08162dab-ced5-4719-9890-9e3651cfb665', 18, CAST(N'2023-09-10T14:30:39.3840000' AS DateTime2), N'UP50CM9022', 3, N'VSDS/PlateImage/08162dab-ced5-4719-9890-9e3651cfb665.jpeg', N'VSDS/VehicleImage/08162dab-ced5-4719-9890-9e3651cfb665.jpeg', N'', NULL, CAST(75.88 AS Decimal(18, 2)), CAST(100.00 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2023-09-10T16:26:33.550' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_VSDSEventsHistory] ([TransactionId], [EquipmentId], [LaneNumber], [EventID], [EventTypeId], [EventDate], [PlateNumber], [VehicleClassId], [PlateImageUrl], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [RadarSpeed], [AllowedSpeed], [OcrConfidencelevel], [ClassConfidencelevel], [PlateFontColor], [PlateBackColor], [VehicleColor], [VehicleDirectionId], [IsPlateVisible], [IsFaultyPlate], [IsStandardPlate], [IsWrongDirection], [IsReviewedRequired], [IsRestiredVehicle], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedPlateNumber], [IsReviewedPlateVisible], [IsReviewedFaultyPlate], [IsReviewedStandardPlate], [IsReviewedWrongDirection], [ReviewedBy], [ReviewedDateTime], [ReviewedRemark], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'100920231430041530', 42, 2, N'967da800-3da0-4ba5-925e-5f3187da49c0', 18, CAST(N'2023-09-10T14:30:04.1530000' AS DateTime2), N'UP32LA3344', 3, N'VSDS/PlateImage/967da800-3da0-4ba5-925e-5f3187da49c0.jpeg', N'VSDS/VehicleImage/967da800-3da0-4ba5-925e-5f3187da49c0.jpeg', N'', NULL, CAST(92.21 AS Decimal(18, 2)), CAST(100.00 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2023-09-10T16:26:33.550' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_VSDSEventsHistory] ([TransactionId], [EquipmentId], [LaneNumber], [EventID], [EventTypeId], [EventDate], [PlateNumber], [VehicleClassId], [PlateImageUrl], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [RadarSpeed], [AllowedSpeed], [OcrConfidencelevel], [ClassConfidencelevel], [PlateFontColor], [PlateBackColor], [VehicleColor], [VehicleDirectionId], [IsPlateVisible], [IsFaultyPlate], [IsStandardPlate], [IsWrongDirection], [IsReviewedRequired], [IsRestiredVehicle], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedPlateNumber], [IsReviewedPlateVisible], [IsReviewedFaultyPlate], [IsReviewedStandardPlate], [IsReviewedWrongDirection], [ReviewedBy], [ReviewedDateTime], [ReviewedRemark], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'100920231429470760', 42, 2, N'095d0eeb-df99-400f-a3f1-095317f30299', 18, CAST(N'2023-09-10T14:29:47.0760000' AS DateTime2), N'UP32NT0392', 3, N'VSDS/PlateImage/095d0eeb-df99-400f-a3f1-095317f30299.jpeg', N'VSDS/VehicleImage/095d0eeb-df99-400f-a3f1-095317f30299.jpeg', N'', NULL, CAST(98.07 AS Decimal(18, 2)), CAST(100.00 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2023-09-10T16:26:33.550' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_VSDSEventsHistory] ([TransactionId], [EquipmentId], [LaneNumber], [EventID], [EventTypeId], [EventDate], [PlateNumber], [VehicleClassId], [PlateImageUrl], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [RadarSpeed], [AllowedSpeed], [OcrConfidencelevel], [ClassConfidencelevel], [PlateFontColor], [PlateBackColor], [VehicleColor], [VehicleDirectionId], [IsPlateVisible], [IsFaultyPlate], [IsStandardPlate], [IsWrongDirection], [IsReviewedRequired], [IsRestiredVehicle], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedPlateNumber], [IsReviewedPlateVisible], [IsReviewedFaultyPlate], [IsReviewedStandardPlate], [IsReviewedWrongDirection], [ReviewedBy], [ReviewedDateTime], [ReviewedRemark], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'100120230701310000', 42, 2, N'046a318c-26cf-4d91-b029-2d9dd8c4cb40', 18, CAST(N'2023-09-10T07:01:31.0760000' AS DateTime2), N'UP45AR4641', 3, N'VSDS/PlateImage/046a318c-26cf-4d91-b029-2d9dd8c4cb40.jpeg', N'VSDS/VehicleImage/046a318c-26cf-4d91-b029-2d9dd8c4cb40.jpeg', N'VSDS/VehicleVideo/046a318c-26cf-4d91-b029-2d9dd8c4cb40.mp4', NULL, CAST(98.07 AS Decimal(18, 2)), CAST(100.00 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2023-09-10T16:35:30.757' AS DateTime), NULL, 0, 0)
GO
SET IDENTITY_INSERT [dbo].[tbl_WeatherConfiguration] ON 
GO
INSERT [dbo].[tbl_WeatherConfiguration] ([WeatherConfigurationId], [AirTemperatureMin], [AirTemperatureMax], [HumidityRH], [HumidityAH], [Visibility], [RoadTemperature], [WindDirectionValue], [WindSpeedValue], [RainValue], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [SendStatus]) VALUES (1, CAST(100.00 AS Decimal(6, 2)), CAST(100.00 AS Decimal(6, 2)), CAST(102.00 AS Decimal(6, 2)), CAST(120.00 AS Decimal(6, 2)), CAST(120.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(6, 2)), CAST(10.00 AS Decimal(6, 2)), CAST(10.00 AS Decimal(6, 2)), CAST(10.00 AS Decimal(6, 2)), 1, CAST(N'2023-09-23T00:00:00.000' AS DateTime), 0, CAST(N'2023-09-23T17:25:30.300' AS DateTime), 0, 0)
GO
SET IDENTITY_INSERT [dbo].[tbl_WeatherConfiguration] OFF
GO
INSERT [dbo].[tbl_WeatherEventHistory] ([TransactionId], [EquipmentId], [EventDate], [AirTemperature], [HumidityRH], [HumidityAH], [Visibility], [RoadTemperature], [WindDirectionValue], [WindDirection], [WindSpeedValue], [WindSpeedMeasurement], [RainValue], [RainMeasurement], [IsAlertRequired], [SendStatus]) VALUES (N'1', 60, CAST(N'2023-09-23T00:00:00.000' AS DateTime), CAST(10.00 AS Decimal(6, 2)), CAST(10.00 AS Decimal(6, 2)), CAST(10.00 AS Decimal(6, 2)), CAST(10.00 AS Decimal(8, 2)), CAST(10.00 AS Decimal(6, 2)), CAST(10.00 AS Decimal(6, 2)), N'10', CAST(10.00 AS Decimal(6, 2)), N'10', CAST(10.00 AS Decimal(6, 2)), N'10', 1, 0)
GO
INSERT [dbo].[temp_ImportPermission] ([MenuId], [DataView], [DataAdd], [DataUpdate], [SessionId]) VALUES (1, 0, 0, 0, N'V1JRGGH4LG')
GO
INSERT [dbo].[temp_ImportPermission] ([MenuId], [DataView], [DataAdd], [DataUpdate], [SessionId]) VALUES (2, 1, 1, 1, N'V1JRGGH4LG')
GO
INSERT [dbo].[temp_ImportPermission] ([MenuId], [DataView], [DataAdd], [DataUpdate], [SessionId]) VALUES (3, 1, 1, 1, N'V1JRGGH4LG')
GO
INSERT [dbo].[temp_ImportPermission] ([MenuId], [DataView], [DataAdd], [DataUpdate], [SessionId]) VALUES (4, 0, 0, 0, N'V1JRGGH4LG')
GO
INSERT [dbo].[temp_ImportPermission] ([MenuId], [DataView], [DataAdd], [DataUpdate], [SessionId]) VALUES (8, 1, 0, 0, N'V1JRGGH4LG')
GO
INSERT [dbo].[temp_ImportPermission] ([MenuId], [DataView], [DataAdd], [DataUpdate], [SessionId]) VALUES (9, 1, 0, 0, N'V1JRGGH4LG')
GO
INSERT [dbo].[temp_ImportPermission] ([MenuId], [DataView], [DataAdd], [DataUpdate], [SessionId]) VALUES (10, 1, 0, 0, N'V1JRGGH4LG')
GO
INSERT [dbo].[temp_ImportPermission] ([MenuId], [DataView], [DataAdd], [DataUpdate], [SessionId]) VALUES (11, 1, 0, 0, N'V1JRGGH4LG')
GO
INSERT [dbo].[temp_ImportPermission] ([MenuId], [DataView], [DataAdd], [DataUpdate], [SessionId]) VALUES (13, 1, 0, 0, N'V1JRGGH4LG')
GO
INSERT [dbo].[temp_ImportPermission] ([MenuId], [DataView], [DataAdd], [DataUpdate], [SessionId]) VALUES (15, 1, 0, 0, N'V1JRGGH4LG')
GO
INSERT [dbo].[temp_ImportPermission] ([MenuId], [DataView], [DataAdd], [DataUpdate], [SessionId]) VALUES (16, 1, 0, 0, N'V1JRGGH4LG')
GO
INSERT [dbo].[temp_ImportPermission] ([MenuId], [DataView], [DataAdd], [DataUpdate], [SessionId]) VALUES (17, 1, 0, 0, N'V1JRGGH4LG')
GO
INSERT [dbo].[temp_ImportPermission] ([MenuId], [DataView], [DataAdd], [DataUpdate], [SessionId]) VALUES (18, 1, 0, 0, N'V1JRGGH4LG')
GO
INSERT [dbo].[temp_ImportPermission] ([MenuId], [DataView], [DataAdd], [DataUpdate], [SessionId]) VALUES (19, 1, 0, 0, N'V1JRGGH4LG')
GO
INSERT [dbo].[temp_ImportPermission] ([MenuId], [DataView], [DataAdd], [DataUpdate], [SessionId]) VALUES (22, 1, 0, 0, N'V1JRGGH4LG')
GO
INSERT [dbo].[temp_ImportPermission] ([MenuId], [DataView], [DataAdd], [DataUpdate], [SessionId]) VALUES (24, 1, 0, 0, N'V1JRGGH4LG')
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
ALTER TABLE [dbo].[tbl_CallEventsDetails] ADD  DEFAULT ((0)) FOR [SendStatus]
GO
ALTER TABLE [dbo].[tbl_CallEventsDetails] ADD  DEFAULT ((1)) FOR [DataStatus]
GO
ALTER TABLE [dbo].[tbl_CallEventsDetails] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[tbl_CallEventsDetails] ADD  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[tbl_CallEventsDetails] ADD  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[tbl_CallEventsDetails] ADD  DEFAULT ((0)) FOR [ModifiedBy]
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
ALTER TABLE [dbo].[tbl_EquipmentConfig] ADD  DEFAULT ((0)) FOR [ParentId]
GO
ALTER TABLE [dbo].[tbl_EquipmentConfig] ADD  DEFAULT ((0)) FOR [PositionId]
GO
ALTER TABLE [dbo].[tbl_EquipmentConfig] ADD  DEFAULT ((0)) FOR [LaneNumberId]
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
ALTER TABLE [dbo].[tbl_WeatherConfiguration] ADD  DEFAULT ((1)) FOR [DataStatus]
GO
ALTER TABLE [dbo].[tbl_WeatherConfiguration] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[tbl_WeatherConfiguration] ADD  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[tbl_WeatherConfiguration] ADD  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[tbl_WeatherConfiguration] ADD  DEFAULT ((0)) FOR [ModifiedBy]
GO
ALTER TABLE [dbo].[tbl_WeatherConfiguration] ADD  DEFAULT ((0)) FOR [SendStatus]
GO
ALTER TABLE [dbo].[tbl_WeatherEventHistory] ADD  DEFAULT ((0)) FOR [IsAlertRequired]
GO
ALTER TABLE [dbo].[tbl_WeatherEventHistory] ADD  DEFAULT ((0)) FOR [SendStatus]
GO
/****** Object:  StoredProcedure [dbo].[USP_ATCCEventReviewUpdate]    Script Date: 04-10-2023 17:45:15 ******/
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
/****** Object:  StoredProcedure [dbo].[USP_ATCCEventsGetByFilter]    Script Date: 04-10-2023 17:45:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[USP_ATCCEventsGetByFilter]
@FilterQuery varchar(4000)
AS
	BEGIN
		EXEC('SELECT H.TransactionId,H.EquipmentId,ED.ChainageNumber,ED.DirectionId,EC.PositionId,PD.PackageId,PD.PackageName,
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
/****** Object:  StoredProcedure [dbo].[USP_ATCCEventsGetByHours]    Script Date: 04-10-2023 17:45:15 ******/
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

	SELECT H.TransactionId,H.EquipmentId,ED.ChainageNumber,ED.DirectionId,EC.PositionId,PD.PackageId,PD.PackageName,
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
/****** Object:  StoredProcedure [dbo].[USP_ATCCEventsReviewedGetByFilter]    Script Date: 04-10-2023 17:45:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[USP_ATCCEventsReviewedGetByFilter]
@FilterQuery varchar(4000)
AS
	BEGIN
		EXEC('SELECT H.TransactionId,H.EquipmentId,ED.ChainageNumber,ED.DirectionId,EC.PositionId,PD.PackageId,PD.PackageName,
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
/****** Object:  StoredProcedure [dbo].[USP_ATCCEventsReviewedGetByHours]    Script Date: 04-10-2023 17:45:15 ******/
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
	SELECT H.TransactionId,H.EquipmentId,ED.ChainageNumber,ED.DirectionId,EC.PositionId,PD.PackageId,PD.PackageName,
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
/****** Object:  StoredProcedure [dbo].[USP_ATCCPendingReviewEventsGetByHours]    Script Date: 04-10-2023 17:45:15 ******/
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

	SELECT H.TransactionId,H.EquipmentId,ED.ChainageNumber,ED.DirectionId,EC.PositionId,PD.PackageId,PD.PackageName,
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
/****** Object:  StoredProcedure [dbo].[USP_ControlRoomGetAll]    Script Date: 04-10-2023 17:45:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_ControlRoomGetAll]
AS BEGIN
	SELECT * FROM tbl_ControlRoomMaster
END
GO
/****** Object:  StoredProcedure [dbo].[USP_ControlRoomGetById]    Script Date: 04-10-2023 17:45:15 ******/
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
/****** Object:  StoredProcedure [dbo].[USP_ControlRoomInsertUpdate]    Script Date: 04-10-2023 17:45:15 ******/
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
/****** Object:  StoredProcedure [dbo].[USP_DashboardATCCData]    Script Date: 04-10-2023 17:45:15 ******/
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
	WHERE DataStatus=1 AND VehicleClassId<>0

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
	SELECT DISTINCT ChainageNumber FROM #MainData


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
	INNER JOIN #TempDir D ON 1=1 where ISNULL(T.EndDateTime,'')<>''
	
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


	SELECT StartDateTime,EndDateTime,EventDate,SlotStartTime,SlotEndTime,ChainageNumber,LEventCount,REventCount,EventCount FROM #TempHourTraffic
	SELECT ChainageNumber,LEventCount,REventCount,EventCount FROM #TempLocationTraffice
	SELECT ChainageNumber,VehicleClassId,VehicleClassName,VehicleClassIcon,LEventCount,REventCount,EventCount FROM #TempClassWiseTraffice
	SELECT ChainageNumber,LaneNumber,LEventCount,REventCount,EventCount FROM #TempLaneWiseTraffice
	SELECT ChainageNumber,VehicleClassId,VehicleClassName,VehicleClassIcon,LaneNumber,LEventCount,REventCount,EventCount FROM #TempLaneClassWiseTraffice
	
END
--GO
--EXEC USP_DashboardATCCData
GO
/****** Object:  StoredProcedure [dbo].[USP_DashboardEquipmentDetailsGetAll]    Script Date: 04-10-2023 17:45:15 ******/
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
END
GO
/****** Object:  StoredProcedure [dbo].[USP_DashboardVIDSData]    Script Date: 04-10-2023 17:45:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[USP_DashboardVIDSData]
AS BEGIN
    DECLARE @StartEventDate Datetime,@EndEventDate Datetime;
	DECLARE @EventDate Datetime;
	SELECT @EventDate=MAX(EventStartDate) FROM tbl_VIDSEventsHistory (nolock);
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
	SELECT EventTypeId,EventTypeName FROM tbl_EventsTypeMaster(nolock) where SystemId=6 

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
/****** Object:  StoredProcedure [dbo].[USP_DashboardVSDSData]    Script Date: 04-10-2023 17:45:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_DashboardVSDSData]
AS BEGIN
	DECLARE @StartEventDate Datetime,@EndEventDate Datetime;
	DECLARE @EventDate Datetime;
	SELECT @EventDate=MAX(EventDate) FROM tbl_VSDSEventsHistory (nolock);
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
	SELECT * FROM fnc_Get24HourList(@StartEventDate,@EndEventDate)
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
/****** Object:  StoredProcedure [dbo].[USP_EquipmentConfigGetBySystemId]    Script Date: 04-10-2023 17:45:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[USP_EquipmentConfigGetBySystemId]
@SystemId smallint
AS BEGIN
	SELECT C.EquipmentId,C.EquipmentTypeId,M.EquipmentTypeName,ChainageNumber,EquipmentName,IpAddress,ParentId,PositionId,C.LaneNumberId,E.DirectionId 
	FROM tbl_EquipmentConfig C 
	INNER JOIN tbl_EquipmentDetails E ON C.EquipmentId=E.EquipmentId
	INNER JOIN tbl_EquipmentTypeMaster M ON C.EquipmentTypeId=M.EquipmentTypeId
	WHERE C.SystemId=@SystemId ORDER BY OrderBy
END
--GO
--EXEC USP_EquipmentConfigGetBySystemId
--@SystemId=8
GO
/****** Object:  StoredProcedure [dbo].[USP_EquipmentConfigInsertUpdate]    Script Date: 04-10-2023 17:45:15 ******/
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
	DECLARE @ActionId varchar(100)
	CREATE TABLE #Temp(AlertMessage varchar(100))
	BEGIN TRY  
		SELECT @MenuId=MenuId FROM tbl_MenuMaster WHERE MenuName ='Equipment Config' AND SystemId=@SystemId
		SELECT @ActionId=SystemName FROM tbl_SystemMaster WHERE SystemId=@SystemId
		CREATE TABLE #EquipmentConfig(id bigint identity,SystemId smallint,EquipmentTypeId smallint,EquipmentId bigint,
		ParentId bigint,PositionId smallint,LaneNumberId smallint,SessionId varchar(10),ChildCount smallint default 0,LaneChildCount smallint default 0)

		INSERT INTO #EquipmentConfig(SystemId,EquipmentTypeId,EquipmentId,ParentId,PositionId,LaneNumberId,SessionId)
		SELECT SystemId,EquipmentTypeId,EquipmentId,ParentId,PositionId,LaneNumberId,SessionId FROM temp_EquipmentConfig
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
		
				INSERT INTO tbl_EquipmentConfig(SystemId,EquipmentTypeId,EquipmentId,ParentId,PositionId,LaneNumberId,OrderBy,CreatedDate,CreatedBy,ModifiedDate,ModifiedBy)
				SELECT SystemId,EquipmentTypeId,EquipmentId,ParentId,PositionId,LaneNumberId,id,@CreatedDate,@CreatedBy,@ModifiedDate,@ModifiedBy 
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
--@SessionId ='MN7VD8TUAI',
--@SystemId=6,
--@CreatedDate ='26-Jul-2022 11:30:00',
--@CreatedBy =0,
--@ModifiedDate='26-Jul-2022 11:30:00',
--@ModifiedBy =0
GO
/****** Object:  StoredProcedure [dbo].[USP_EquipmentDetailsGetAll]    Script Date: 04-10-2023 17:45:15 ******/
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
	INNER JOIN tbl_SystemMaster SM ON ED.SystemId=SM.SystemId AND SM.DataStatus=1
END
GO
/****** Object:  StoredProcedure [dbo].[USP_EquipmentDetailsGetByEquipmentTypeId]    Script Date: 04-10-2023 17:45:15 ******/
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
/****** Object:  StoredProcedure [dbo].[USP_EquipmentDetailsGetByFilter]    Script Date: 04-10-2023 17:45:15 ******/
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
/****** Object:  StoredProcedure [dbo].[USP_EquipmentDetailsGetById]    Script Date: 04-10-2023 17:45:15 ******/
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
/****** Object:  StoredProcedure [dbo].[USP_EquipmentDetailsGetByIds]    Script Date: 04-10-2023 17:45:15 ******/
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
/****** Object:  StoredProcedure [dbo].[USP_EquipmentDetailsGetBySystemId]    Script Date: 04-10-2023 17:45:15 ******/
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
/****** Object:  StoredProcedure [dbo].[USP_EquipmentDetailsInsertUpdate]    Script Date: 04-10-2023 17:45:15 ******/
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
/****** Object:  StoredProcedure [dbo].[USP_EquipmentTypeMasterGetAll]    Script Date: 04-10-2023 17:45:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_EquipmentTypeMasterGetAll]
AS BEGIN
	SELECT * FROM tbl_EquipmentTypeMaster ORDER BY EquipmentLevel
END
GO
/****** Object:  StoredProcedure [dbo].[USP_ErrorInfoInsert]    Script Date: 04-10-2023 17:45:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_ErrorInfoInsert]

AS  INSERT INTO tbl_ErrorInfo(ErrorNumber,ErrorSeverity,ErrorState,ErrorProcedure,ErrorLine,ErrorMessage)
	SELECT ERROR_NUMBER() AS ErrorNumber,ERROR_SEVERITY() AS ErrorSeverity,ERROR_STATE() AS ErrorState,
	ERROR_PROCEDURE() AS ErrorProcedure,ERROR_LINE() AS ErrorLine ,ERROR_MESSAGE() AS ErrorMessage;  
GO
/****** Object:  StoredProcedure [dbo].[USP_EventsTypeMasterGetAll]    Script Date: 04-10-2023 17:45:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_EventsTypeMasterGetAll]
AS BEGIN
	SELECT * FROM tbl_EventsTypeMaster
END
GO
/****** Object:  StoredProcedure [dbo].[USP_EventsTypeMasterGetBySystemId]    Script Date: 04-10-2023 17:45:15 ******/
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
/****** Object:  StoredProcedure [dbo].[USP_EventsTypeUpdate]    Script Date: 04-10-2023 17:45:15 ******/
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
		
		UPDATE T SET T.EventsRequired=V.EventsRequired,T.ReviewRequired=V.ReviewRequired,T.ChallanTypeId=V.ChallanTypeId 
		FROM tbl_EventsTypeMaster T INNER JOIN
		(
			SELECT EventTypeId,EventsRequired,ReviewRequired,ChallanTypeId,@SystemId AS SystemId 
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
/****** Object:  StoredProcedure [dbo].[USP_GetWeatherConfig]    Script Date: 04-10-2023 17:45:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_GetWeatherConfig]
AS BEGIN
 SELECT * FROM tbl_WeatherConfiguration
END
GO
/****** Object:  StoredProcedure [dbo].[USP_IncidentActionHistorGetById]    Script Date: 04-10-2023 17:45:15 ******/
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
/****** Object:  StoredProcedure [dbo].[USP_IncidentActionInsert]    Script Date: 04-10-2023 17:45:15 ******/
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
/****** Object:  StoredProcedure [dbo].[USP_IncidentCategoryMasterGetAll]    Script Date: 04-10-2023 17:45:15 ******/
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
/****** Object:  StoredProcedure [dbo].[USP_IncidentDetailsGetById]    Script Date: 04-10-2023 17:45:15 ******/
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
/****** Object:  StoredProcedure [dbo].[USP_IncidentDetailsInsert]    Script Date: 04-10-2023 17:45:15 ******/
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
/****** Object:  StoredProcedure [dbo].[USP_IncidentDetailsUpdate]    Script Date: 04-10-2023 17:45:15 ******/
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
/****** Object:  StoredProcedure [dbo].[USP_IncidentGetByFilter]    Script Date: 04-10-2023 17:45:15 ******/
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
/****** Object:  StoredProcedure [dbo].[USP_IncidentGetClose]    Script Date: 04-10-2023 17:45:15 ******/
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
/****** Object:  StoredProcedure [dbo].[USP_IncidentGetInProgress]    Script Date: 04-10-2023 17:45:15 ******/
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
/****** Object:  StoredProcedure [dbo].[USP_IncidentGetPending]    Script Date: 04-10-2023 17:45:15 ******/
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
/****** Object:  StoredProcedure [dbo].[USP_IncidentSourceGetAll]    Script Date: 04-10-2023 17:45:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_IncidentSourceGetAll]
AS BEGIN
SELECT * FROM tbl_IncidentSourceMaster
END
GO
/****** Object:  StoredProcedure [dbo].[USP_IncidentStatusMasterGetAll]    Script Date: 04-10-2023 17:45:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_IncidentStatusMasterGetAll]
AS BEGIN
SELECT * FROM tbl_IncidentStatusMaster
END
GO
/****** Object:  StoredProcedure [dbo].[USP_LaneConfigGetAll]    Script Date: 04-10-2023 17:45:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_LaneConfigGetAll]
AS BEGIN
	SELECT * FROM tbl_LaneConfig
END
GO
/****** Object:  StoredProcedure [dbo].[USP_LaneConfigInsertUpdate]    Script Date: 04-10-2023 17:45:15 ******/
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
/****** Object:  StoredProcedure [dbo].[USP_LogingActivityInsert]    Script Date: 04-10-2023 17:45:15 ******/
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
/****** Object:  StoredProcedure [dbo].[USP_LogingActivityUpdate]    Script Date: 04-10-2023 17:45:15 ******/
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
/****** Object:  StoredProcedure [dbo].[USP_MasterDataGetBySystemId]    Script Date: 04-10-2023 17:45:15 ******/
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
END
GO
/****** Object:  StoredProcedure [dbo].[USP_MenuGetAll]    Script Date: 04-10-2023 17:45:15 ******/
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
/****** Object:  StoredProcedure [dbo].[USP_MenuGetByRoleId]    Script Date: 04-10-2023 17:45:15 ******/
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
/****** Object:  StoredProcedure [dbo].[USP_PackageGetAll]    Script Date: 04-10-2023 17:45:15 ******/
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
/****** Object:  StoredProcedure [dbo].[USP_PackageGetById]    Script Date: 04-10-2023 17:45:15 ******/
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
/****** Object:  StoredProcedure [dbo].[USP_PackageInsertUpdate]    Script Date: 04-10-2023 17:45:15 ******/
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
/****** Object:  StoredProcedure [dbo].[USP_ReportMasterGetAll]    Script Date: 04-10-2023 17:45:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_ReportMasterGetAll]
AS BEGIN
	SELECT * FROM tbl_ReportMaster;
END
GO
/****** Object:  StoredProcedure [dbo].[USP_ReportMasterGetById]    Script Date: 04-10-2023 17:45:15 ******/
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
/****** Object:  StoredProcedure [dbo].[USP_ReportMasterGetByIds]    Script Date: 04-10-2023 17:45:15 ******/
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
/****** Object:  StoredProcedure [dbo].[USP_ReportMasterGetByName]    Script Date: 04-10-2023 17:45:15 ******/
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
/****** Object:  StoredProcedure [dbo].[USP_RoleInsertUpdate]    Script Date: 04-10-2023 17:45:15 ******/
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
/****** Object:  StoredProcedure [dbo].[USP_RolePermissionInsertUpdate]    Script Date: 04-10-2023 17:45:15 ******/
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
/****** Object:  StoredProcedure [dbo].[USP_RolesGetAll]    Script Date: 04-10-2023 17:45:15 ******/
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
/****** Object:  StoredProcedure [dbo].[USP_RolesGetById]    Script Date: 04-10-2023 17:45:15 ******/
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
/****** Object:  StoredProcedure [dbo].[USP_RolesPersmissionGetByMenu]    Script Date: 04-10-2023 17:45:15 ******/
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
/****** Object:  StoredProcedure [dbo].[USP_RolesPersmissionGetByMenuId]    Script Date: 04-10-2023 17:45:15 ******/
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
/****** Object:  StoredProcedure [dbo].[USP_RolesPersmissionGetByRoleId]    Script Date: 04-10-2023 17:45:15 ******/
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
/****** Object:  StoredProcedure [dbo].[USP_SystemGetAll]    Script Date: 04-10-2023 17:45:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_SystemGetAll]
AS BEGIN
	SELECT * FROM tbl_SystemMaster
END
GO
/****** Object:  StoredProcedure [dbo].[USP_SystemGetById]    Script Date: 04-10-2023 17:45:15 ******/
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
/****** Object:  StoredProcedure [dbo].[USP_SystemGetByName]    Script Date: 04-10-2023 17:45:15 ******/
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
/****** Object:  StoredProcedure [dbo].[USP_SystemSettingGet]    Script Date: 04-10-2023 17:45:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_SystemSettingGet]
AS BEGIN
 SELECT * FROM tbl_SystemSetting
END
GO
/****** Object:  StoredProcedure [dbo].[USP_SystemSettingInsertUpdate]    Script Date: 04-10-2023 17:45:15 ******/
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
@CDateTime DateTime,
@UserId bigint
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
		insert into tbl_SystemSetting(TotalLane,IsATCCIndependently,ATCCByVSDS,ATCCByVIDS,TrafficCount,TrafficByTime,RestrictedVehiclesIds,DefaultControlRoomId,CreatedDate,CreatedBy)
		values(@TotalLane,@IsATCCIndependently,@ATCCByVSDS,@ATCCByVIDS,@TrafficCount,@TrafficByTime,@RestrictedVehiclesIds,@DefaultControlRoomId,@CDateTime,@UserId);
		SET @CVal=(SELECT * FROM tbl_SystemSetting  FOR JSON AUTO, WITHOUT_ARRAY_WRAPPER)		
		INSERT INTO tbl_ActivityLog(UserId,CurrentColumn,ActionId,MenuId,CreatedDate)
		VALUES(@UserId,@CVal,'Insert',@MenuId,@CDateTime);
		INSERT INTO #Temp(AlertMessage)VALUES('success');
	END
	ELSE
	BEGIN
		SET @PVal=(SELECT * FROM tbl_SystemSetting  FOR JSON AUTO, WITHOUT_ARRAY_WRAPPER)
		UPDATE tbl_SystemSetting SET ModifiedDate=@CDateTime,ModifiedBy=@UserId,
		TotalLane=@TotalLane,IsATCCIndependently=@IsATCCIndependently,ATCCByVSDS=@ATCCByVSDS,ATCCByVIDS=@ATCCByVIDS,
		TrafficCount=@TrafficCount,TrafficByTime=@TrafficByTime,RestrictedVehiclesIds=@RestrictedVehiclesIds,
		DefaultControlRoomId=@DefaultControlRoomId
		SET @CVal=(SELECT * FROM tbl_SystemSetting  FOR JSON AUTO, WITHOUT_ARRAY_WRAPPER)		
		INSERT INTO tbl_ActivityLog(UserId,PrevColumn,CurrentColumn,ActionId,MenuId,CreatedDate)
		VALUES(@UserId,@PVal,@CVal,'Update',@MenuId,@CDateTime);
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
/****** Object:  StoredProcedure [dbo].[USP_SystemUpdate]    Script Date: 04-10-2023 17:45:15 ******/
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
/****** Object:  StoredProcedure [dbo].[USP_UserGetAll]    Script Date: 04-10-2023 17:45:15 ******/
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
/****** Object:  StoredProcedure [dbo].[USP_UserGetbyId]    Script Date: 04-10-2023 17:45:15 ******/
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
/****** Object:  StoredProcedure [dbo].[USP_UserGetBySystemUserTypeId]    Script Date: 04-10-2023 17:45:15 ******/
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
/****** Object:  StoredProcedure [dbo].[USP_UserGetByUserTypeId]    Script Date: 04-10-2023 17:45:15 ******/
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
/****** Object:  StoredProcedure [dbo].[USP_UserInsertUpdate]    Script Date: 04-10-2023 17:45:15 ******/
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
/****** Object:  StoredProcedure [dbo].[USP_UserProfileChange]    Script Date: 04-10-2023 17:45:15 ******/
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
/****** Object:  StoredProcedure [dbo].[USP_UsersGetByLoginId]    Script Date: 04-10-2023 17:45:15 ******/
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
/****** Object:  StoredProcedure [dbo].[USP_UserUpdatePassword]    Script Date: 04-10-2023 17:45:15 ******/
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
/****** Object:  StoredProcedure [dbo].[USP_VehicleClassGetAll]    Script Date: 04-10-2023 17:45:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_VehicleClassGetAll]
AS BEGIN

	SELECT * FROM tbl_VehicleClass;

END



GO
/****** Object:  StoredProcedure [dbo].[USP_VehicleClassGetById]    Script Date: 04-10-2023 17:45:15 ******/
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
/****** Object:  StoredProcedure [dbo].[USP_VehicleClassGetByIds]    Script Date: 04-10-2023 17:45:15 ******/
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
/****** Object:  StoredProcedure [dbo].[USP_VehicleClassInsertUpdate]    Script Date: 04-10-2023 17:45:15 ******/
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
/****** Object:  StoredProcedure [dbo].[USP_VIDSEventReviewUpdate]    Script Date: 04-10-2023 17:45:15 ******/
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
/****** Object:  StoredProcedure [dbo].[USP_VIDSEventsGetByFilter]    Script Date: 04-10-2023 17:45:15 ******/
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
/****** Object:  StoredProcedure [dbo].[USP_VIDSEventsGetByHours]    Script Date: 04-10-2023 17:45:15 ******/
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
/****** Object:  StoredProcedure [dbo].[USP_VIDSEventsHistory]    Script Date: 04-10-2023 17:45:15 ******/
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
/****** Object:  StoredProcedure [dbo].[USP_VIDSEventsReviewedGetByHours]    Script Date: 04-10-2023 17:45:15 ******/
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
/****** Object:  StoredProcedure [dbo].[USP_VIDSPendingReviewEventsGetByHours]    Script Date: 04-10-2023 17:45:15 ******/
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
/****** Object:  StoredProcedure [dbo].[USP_VMSMessageDetailsGetAll]    Script Date: 04-10-2023 17:45:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_VMSMessageDetailsGetAll]
AS BEGIN
	SELECT * from tbl_VMSMessageDetails
END
GO
/****** Object:  StoredProcedure [dbo].[USP_VMSMessageDetailsGetById]    Script Date: 04-10-2023 17:45:15 ******/
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
/****** Object:  StoredProcedure [dbo].[USP_VMSMessageDetailsInsertUpdate]    Script Date: 04-10-2023 17:45:15 ******/
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
/****** Object:  StoredProcedure [dbo].[USP_VSDSEventReviewUpdate]    Script Date: 04-10-2023 17:45:15 ******/
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
/****** Object:  StoredProcedure [dbo].[USP_VSDSEventsGetByFilter]    Script Date: 04-10-2023 17:45:15 ******/
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
/****** Object:  StoredProcedure [dbo].[USP_VSDSEventsGetByHours]    Script Date: 04-10-2023 17:45:15 ******/
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
/****** Object:  StoredProcedure [dbo].[USP_VSDSPendingReviewEventsGetByHours]    Script Date: 04-10-2023 17:45:15 ******/
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
/****** Object:  StoredProcedure [dbo].[USP_WeatherConfigInsertUpdate]    Script Date: 04-10-2023 17:45:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_WeatherConfigInsertUpdate] 
@WeatherConfigurationId smallint,
@AirTemperatureMin decimal(6,2),
@AirTemperatureMax decimal(6,2),
@HumidityRH decimal(6,2),
@HumidityAH decimal(6,2),
@Visibility decimal(6,2),
@RoadTemperature decimal(6,2),
@WindDirectionValue decimal(6,2),
@WindSpeedValue decimal(6,2),
@RainValue decimal(6,2),
@CDateTime DateTime,
@UserId bigint
AS
BEGIN
	DECLARE @PVal varchar(4000)
	DECLARE @CVal varchar(4000)
	DECLARE @MenuId smallint=50;
	CREATE TABLE #Temp(AlertMessage varchar(100));
	BEGIN TRY
		SET @PVal=(SELECT * FROM tbl_SystemSetting  FOR JSON AUTO, WITHOUT_ARRAY_WRAPPER)
		UPDATE tbl_WeatherConfiguration SET ModifiedDate=@CDateTime,ModifiedBy=@UserId,
		AirTemperatureMin=@AirTemperatureMin,AirTemperatureMax=@AirTemperatureMax,HumidityRH=@HumidityRH,HumidityAH=@HumidityAH,
		Visibility=@Visibility,RoadTemperature=@RoadTemperature,WindDirectionValue=@WindDirectionValue,WindSpeedValue=@WindSpeedValue,
		RainValue=@RainValue where WeatherConfigurationId=@WeatherConfigurationId;
		SET @CVal=(SELECT * FROM tbl_WeatherConfiguration  FOR JSON AUTO, WITHOUT_ARRAY_WRAPPER);		
		
		INSERT INTO tbl_ActivityLog(UserId,PrevColumn,CurrentColumn,ActionId,MenuId,CreatedDate)
		VALUES(@UserId,@PVal,@CVal,'Update',@MenuId,@CDateTime);
		INSERT INTO #Temp(AlertMessage)VALUES('success');
	END TRY  
	BEGIN CATCH  
		INSERT INTO #Temp(AlertMessage)VALUES('failed');
		EXECUTE USP_ErrorInfoInsert;  
	END CATCH  
	
		select * from #Temp;
END



GO
/****** Object:  StoredProcedure [dbo].[USP_WeatherEventsGetALLByFilter]    Script Date: 04-10-2023 17:45:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_WeatherEventsGetALLByFilter]
@FilterQuery varchar(4000)
AS
	BEGIN
		EXEC('SELECT ED.EquipmentName,ED.ChainageNumber,ED.DirectionId,EC.PositionId,PD.PackageId,PD.PackageName,
	CR.ControlRoomId,CR.ControlRoomName,H.EventDate,ED.Longitude,ED.Latitude,H.*
	FROM tbl_WeatherEventHistory H 
	LEFT JOIN tbl_EquipmentDetails ED ON H.EquipmentId=ED.EquipmentId
	LEFT JOIN tbl_EquipmentConfig EC ON H.EquipmentId=EC.EquipmentId
	LEFT JOIN tbl_PackageDetails PD ON ED.PackageId=PD.PackageId
	LEFT JOIN tbl_ControlRoomMaster CR ON PD.ControlRoomId=CR.ControlRoomId
			'+@FilterQuery+' ORDER BY H.EventDate DESC')
	END

	
	
GO
