/****** Object:  StoredProcedure [dbo].[USP_VIDSPendingReviewEventsGetByHours]    Script Date: 31-07-2023 16:26:11 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_VIDSPendingReviewEventsGetByHours]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_VIDSPendingReviewEventsGetByHours]
GO
/****** Object:  StoredProcedure [dbo].[USP_VIDSEventsHistory]    Script Date: 31-07-2023 16:26:11 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_VIDSEventsHistory]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_VIDSEventsHistory]
GO
/****** Object:  StoredProcedure [dbo].[USP_VIDSEventsGetByHours]    Script Date: 31-07-2023 16:26:11 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_VIDSEventsGetByHours]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_VIDSEventsGetByHours]
GO
/****** Object:  StoredProcedure [dbo].[USP_VIDSEventsGetByFilter]    Script Date: 31-07-2023 16:26:11 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_VIDSEventsGetByFilter]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_VIDSEventsGetByFilter]
GO
/****** Object:  StoredProcedure [dbo].[USP_VIDSEventReviewUpdate]    Script Date: 31-07-2023 16:26:11 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_VIDSEventReviewUpdate]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_VIDSEventReviewUpdate]
GO
/****** Object:  StoredProcedure [dbo].[USP_VehicleClassInsertUpdate]    Script Date: 31-07-2023 16:26:11 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_VehicleClassInsertUpdate]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_VehicleClassInsertUpdate]
GO
/****** Object:  StoredProcedure [dbo].[USP_VehicleClassGetById]    Script Date: 31-07-2023 16:26:11 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_VehicleClassGetById]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_VehicleClassGetById]
GO
/****** Object:  StoredProcedure [dbo].[USP_VehicleClassGetAll]    Script Date: 31-07-2023 16:26:11 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_VehicleClassGetAll]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_VehicleClassGetAll]
GO
/****** Object:  StoredProcedure [dbo].[USP_UserUpdatePassword]    Script Date: 31-07-2023 16:26:11 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_UserUpdatePassword]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_UserUpdatePassword]
GO
/****** Object:  StoredProcedure [dbo].[USP_UsersGetByLoginId]    Script Date: 31-07-2023 16:26:11 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_UsersGetByLoginId]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_UsersGetByLoginId]
GO
/****** Object:  StoredProcedure [dbo].[USP_UserInsertUpdate]    Script Date: 31-07-2023 16:26:11 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_UserInsertUpdate]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_UserInsertUpdate]
GO
/****** Object:  StoredProcedure [dbo].[USP_UserGetByUserTypeId]    Script Date: 31-07-2023 16:26:11 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_UserGetByUserTypeId]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_UserGetByUserTypeId]
GO
/****** Object:  StoredProcedure [dbo].[USP_UserGetbyId]    Script Date: 31-07-2023 16:26:11 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_UserGetbyId]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_UserGetbyId]
GO
/****** Object:  StoredProcedure [dbo].[USP_UserGetAll]    Script Date: 31-07-2023 16:26:11 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_UserGetAll]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_UserGetAll]
GO
/****** Object:  StoredProcedure [dbo].[USP_SystemGetByName]    Script Date: 31-07-2023 16:26:11 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_SystemGetByName]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_SystemGetByName]
GO
/****** Object:  StoredProcedure [dbo].[USP_SystemGetById]    Script Date: 31-07-2023 16:26:11 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_SystemGetById]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_SystemGetById]
GO
/****** Object:  StoredProcedure [dbo].[USP_SystemGetAll]    Script Date: 31-07-2023 16:26:11 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_SystemGetAll]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_SystemGetAll]
GO
/****** Object:  StoredProcedure [dbo].[USP_RolesPersmissionGetByRoleId]    Script Date: 31-07-2023 16:26:11 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_RolesPersmissionGetByRoleId]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_RolesPersmissionGetByRoleId]
GO
/****** Object:  StoredProcedure [dbo].[USP_RolesPersmissionGetByMenuId]    Script Date: 31-07-2023 16:26:11 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_RolesPersmissionGetByMenuId]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_RolesPersmissionGetByMenuId]
GO
/****** Object:  StoredProcedure [dbo].[USP_RolesPersmissionGetByMenu]    Script Date: 31-07-2023 16:26:11 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_RolesPersmissionGetByMenu]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_RolesPersmissionGetByMenu]
GO
/****** Object:  StoredProcedure [dbo].[USP_RolesGetById]    Script Date: 31-07-2023 16:26:11 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_RolesGetById]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_RolesGetById]
GO
/****** Object:  StoredProcedure [dbo].[USP_RolesGetAll]    Script Date: 31-07-2023 16:26:11 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_RolesGetAll]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_RolesGetAll]
GO
/****** Object:  StoredProcedure [dbo].[USP_RolePermissionInsertUpdate]    Script Date: 31-07-2023 16:26:11 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_RolePermissionInsertUpdate]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_RolePermissionInsertUpdate]
GO
/****** Object:  StoredProcedure [dbo].[USP_RoleInsertUpdate]    Script Date: 31-07-2023 16:26:11 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_RoleInsertUpdate]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_RoleInsertUpdate]
GO
/****** Object:  StoredProcedure [dbo].[USP_PackageInsertUpdate]    Script Date: 31-07-2023 16:26:11 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_PackageInsertUpdate]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_PackageInsertUpdate]
GO
/****** Object:  StoredProcedure [dbo].[USP_PackageGetById]    Script Date: 31-07-2023 16:26:11 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_PackageGetById]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_PackageGetById]
GO
/****** Object:  StoredProcedure [dbo].[USP_PackageGetAll]    Script Date: 31-07-2023 16:26:11 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_PackageGetAll]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_PackageGetAll]
GO
/****** Object:  StoredProcedure [dbo].[USP_MenuGetByRoleId]    Script Date: 31-07-2023 16:26:11 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_MenuGetByRoleId]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_MenuGetByRoleId]
GO
/****** Object:  StoredProcedure [dbo].[USP_MenuGetAll]    Script Date: 31-07-2023 16:26:11 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_MenuGetAll]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_MenuGetAll]
GO
/****** Object:  StoredProcedure [dbo].[USP_MasterDataGetBySystemId]    Script Date: 31-07-2023 16:26:11 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_MasterDataGetBySystemId]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_MasterDataGetBySystemId]
GO
/****** Object:  StoredProcedure [dbo].[USP_LogingActivityUpdate]    Script Date: 31-07-2023 16:26:11 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_LogingActivityUpdate]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_LogingActivityUpdate]
GO
/****** Object:  StoredProcedure [dbo].[USP_LogingActivityInsert]    Script Date: 31-07-2023 16:26:11 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_LogingActivityInsert]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_LogingActivityInsert]
GO
/****** Object:  StoredProcedure [dbo].[USP_IncidentStatusMasterGetAll]    Script Date: 31-07-2023 16:26:11 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_IncidentStatusMasterGetAll]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_IncidentStatusMasterGetAll]
GO
/****** Object:  StoredProcedure [dbo].[USP_IncidentSourceGetAll]    Script Date: 31-07-2023 16:26:11 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_IncidentSourceGetAll]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_IncidentSourceGetAll]
GO
/****** Object:  StoredProcedure [dbo].[USP_IncidentGetPending]    Script Date: 31-07-2023 16:26:11 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_IncidentGetPending]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_IncidentGetPending]
GO
/****** Object:  StoredProcedure [dbo].[USP_IncidentGetInProgress]    Script Date: 31-07-2023 16:26:11 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_IncidentGetInProgress]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_IncidentGetInProgress]
GO
/****** Object:  StoredProcedure [dbo].[USP_IncidentGetClose]    Script Date: 31-07-2023 16:26:11 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_IncidentGetClose]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_IncidentGetClose]
GO
/****** Object:  StoredProcedure [dbo].[USP_IncidentDetailsUpdate]    Script Date: 31-07-2023 16:26:11 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_IncidentDetailsUpdate]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_IncidentDetailsUpdate]
GO
/****** Object:  StoredProcedure [dbo].[USP_IncidentDetailsInsert]    Script Date: 31-07-2023 16:26:11 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_IncidentDetailsInsert]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_IncidentDetailsInsert]
GO
/****** Object:  StoredProcedure [dbo].[USP_IncidentDetailsGetById]    Script Date: 31-07-2023 16:26:11 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_IncidentDetailsGetById]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_IncidentDetailsGetById]
GO
/****** Object:  StoredProcedure [dbo].[USP_IncidentCategoryMasterGetAll]    Script Date: 31-07-2023 16:26:11 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_IncidentCategoryMasterGetAll]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_IncidentCategoryMasterGetAll]
GO
/****** Object:  StoredProcedure [dbo].[USP_IncidentActionInsert]    Script Date: 31-07-2023 16:26:11 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_IncidentActionInsert]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_IncidentActionInsert]
GO
/****** Object:  StoredProcedure [dbo].[USP_IncidentActionHistorGetById]    Script Date: 31-07-2023 16:26:11 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_IncidentActionHistorGetById]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_IncidentActionHistorGetById]
GO
/****** Object:  StoredProcedure [dbo].[USP_EventsTypeUpdate]    Script Date: 31-07-2023 16:26:11 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_EventsTypeUpdate]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_EventsTypeUpdate]
GO
/****** Object:  StoredProcedure [dbo].[USP_EventsTypeMasterGetBySystemId]    Script Date: 31-07-2023 16:26:11 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_EventsTypeMasterGetBySystemId]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_EventsTypeMasterGetBySystemId]
GO
/****** Object:  StoredProcedure [dbo].[USP_EventsTypeMasterGetAll]    Script Date: 31-07-2023 16:26:11 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_EventsTypeMasterGetAll]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_EventsTypeMasterGetAll]
GO
/****** Object:  StoredProcedure [dbo].[USP_ErrorInfoInsert]    Script Date: 31-07-2023 16:26:11 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_ErrorInfoInsert]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_ErrorInfoInsert]
GO
/****** Object:  StoredProcedure [dbo].[USP_EquipmentTypeMasterGetAll]    Script Date: 31-07-2023 16:26:11 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_EquipmentTypeMasterGetAll]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_EquipmentTypeMasterGetAll]
GO
/****** Object:  StoredProcedure [dbo].[USP_EquipmentDetailsInsertUpdate]    Script Date: 31-07-2023 16:26:11 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_EquipmentDetailsInsertUpdate]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_EquipmentDetailsInsertUpdate]
GO
/****** Object:  StoredProcedure [dbo].[USP_EquipmentDetailsGetBySystemId]    Script Date: 31-07-2023 16:26:11 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_EquipmentDetailsGetBySystemId]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_EquipmentDetailsGetBySystemId]
GO
/****** Object:  StoredProcedure [dbo].[USP_EquipmentDetailsGetById]    Script Date: 31-07-2023 16:26:11 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_EquipmentDetailsGetById]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_EquipmentDetailsGetById]
GO
/****** Object:  StoredProcedure [dbo].[USP_EquipmentDetailsGetAll]    Script Date: 31-07-2023 16:26:11 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_EquipmentDetailsGetAll]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_EquipmentDetailsGetAll]
GO
/****** Object:  StoredProcedure [dbo].[USP_EquipmentConfigInsertUpdate]    Script Date: 31-07-2023 16:26:11 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_EquipmentConfigInsertUpdate]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_EquipmentConfigInsertUpdate]
GO
/****** Object:  StoredProcedure [dbo].[USP_EquipmentConfigGetBySystemId]    Script Date: 31-07-2023 16:26:11 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_EquipmentConfigGetBySystemId]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_EquipmentConfigGetBySystemId]
GO
/****** Object:  StoredProcedure [dbo].[USP_ControlRoomInsertUpdate]    Script Date: 31-07-2023 16:26:11 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_ControlRoomInsertUpdate]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_ControlRoomInsertUpdate]
GO
/****** Object:  StoredProcedure [dbo].[USP_ControlRoomGetById]    Script Date: 31-07-2023 16:26:11 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_ControlRoomGetById]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_ControlRoomGetById]
GO
/****** Object:  StoredProcedure [dbo].[USP_ControlRoomGetAll]    Script Date: 31-07-2023 16:26:11 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_ControlRoomGetAll]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_ControlRoomGetAll]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Weath__SendS__6A50C1DA]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_WeatherEventHistory] DROP CONSTRAINT [DF__tbl_Weath__SendS__6A50C1DA]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Weath__IsAle__695C9DA1]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_WeatherEventHistory] DROP CONSTRAINT [DF__tbl_Weath__IsAle__695C9DA1]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Weath__SendS__6C390A4C]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_WeatherConfiguration] DROP CONSTRAINT [DF__tbl_Weath__SendS__6C390A4C]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Weath__Modif__70FDBF69]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_WeatherConfiguration] DROP CONSTRAINT [DF__tbl_Weath__Modif__70FDBF69]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Weath__Modif__70099B30]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_WeatherConfiguration] DROP CONSTRAINT [DF__tbl_Weath__Modif__70099B30]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Weath__Creat__6F1576F7]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_WeatherConfiguration] DROP CONSTRAINT [DF__tbl_Weath__Creat__6F1576F7]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Weath__Creat__6E2152BE]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_WeatherConfiguration] DROP CONSTRAINT [DF__tbl_Weath__Creat__6E2152BE]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Weath__DataS__6D2D2E85]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_WeatherConfiguration] DROP CONSTRAINT [DF__tbl_Weath__DataS__6D2D2E85]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_VSDSS__SendS__60C757A0]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_VSDSSectionSpeedHistory] DROP CONSTRAINT [DF__tbl_VSDSS__SendS__60C757A0]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_VSDSS__Creat__5FD33367]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_VSDSSectionSpeedHistory] DROP CONSTRAINT [DF__tbl_VSDSS__Creat__5FD33367]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_VSDSE__Media__004002F9]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_VSDSEventHistory] DROP CONSTRAINT [DF__tbl_VSDSE__Media__004002F9]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_VSDSE__DataS__7F4BDEC0]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_VSDSEventHistory] DROP CONSTRAINT [DF__tbl_VSDSE__DataS__7F4BDEC0]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_VSDSE__Creat__7E57BA87]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_VSDSEventHistory] DROP CONSTRAINT [DF__tbl_VSDSE__Creat__7E57BA87]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_VSDSE__IsCha__7D63964E]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_VSDSEventHistory] DROP CONSTRAINT [DF__tbl_VSDSE__IsCha__7D63964E]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_VSDSE__Revie__7C6F7215]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_VSDSEventHistory] DROP CONSTRAINT [DF__tbl_VSDSE__Revie__7C6F7215]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_VSDSE__Revie__7B7B4DDC]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_VSDSEventHistory] DROP CONSTRAINT [DF__tbl_VSDSE__Revie__7B7B4DDC]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_VSDSE__Revie__7A8729A3]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_VSDSEventHistory] DROP CONSTRAINT [DF__tbl_VSDSE__Revie__7A8729A3]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_VSDSE__IsRev__7993056A]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_VSDSEventHistory] DROP CONSTRAINT [DF__tbl_VSDSE__IsRev__7993056A]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_VSDSE__IsWro__789EE131]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_VSDSEventHistory] DROP CONSTRAINT [DF__tbl_VSDSE__IsWro__789EE131]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_VSDSE__IsSta__77AABCF8]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_VSDSEventHistory] DROP CONSTRAINT [DF__tbl_VSDSE__IsSta__77AABCF8]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_VSDSE__IsFau__76B698BF]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_VSDSEventHistory] DROP CONSTRAINT [DF__tbl_VSDSE__IsFau__76B698BF]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_VSDSE__IsPla__75C27486]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_VSDSEventHistory] DROP CONSTRAINT [DF__tbl_VSDSE__IsPla__75C27486]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_VSDSE__Vehic__74CE504D]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_VSDSEventHistory] DROP CONSTRAINT [DF__tbl_VSDSE__Vehic__74CE504D]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_VMSMe__Media__5649C92D]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_VMSMessageDetails] DROP CONSTRAINT [DF__tbl_VMSMe__Media__5649C92D]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_VMSMe__DataS__5555A4F4]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_VMSMessageDetails] DROP CONSTRAINT [DF__tbl_VMSMe__DataS__5555A4F4]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_VMSMe__Modif__5C02A283]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_VMSMessageDetails] DROP CONSTRAINT [DF__tbl_VMSMe__Modif__5C02A283]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_VMSMe__Modif__5B0E7E4A]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_VMSMessageDetails] DROP CONSTRAINT [DF__tbl_VMSMe__Modif__5B0E7E4A]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_VMSMe__Creat__5A1A5A11]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_VMSMessageDetails] DROP CONSTRAINT [DF__tbl_VMSMe__Creat__5A1A5A11]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_VMSMe__Creat__592635D8]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_VMSMessageDetails] DROP CONSTRAINT [DF__tbl_VMSMe__Creat__592635D8]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_VMSMe__DataS__5832119F]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_VMSMessageDetails] DROP CONSTRAINT [DF__tbl_VMSMe__DataS__5832119F]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_VMSMe__Displ__573DED66]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_VMSMessageDetails] DROP CONSTRAINT [DF__tbl_VMSMe__Displ__573DED66]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_VIDSE__Media__08A03ED0]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_VIDSEventsHistory] DROP CONSTRAINT [DF__tbl_VIDSE__Media__08A03ED0]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_VIDSE__DataS__07AC1A97]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_VIDSEventsHistory] DROP CONSTRAINT [DF__tbl_VIDSE__DataS__07AC1A97]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_VIDSE__Syste__06B7F65E]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_VIDSEventsHistory] DROP CONSTRAINT [DF__tbl_VIDSE__Syste__06B7F65E]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_VIDSE__Creat__05C3D225]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_VIDSEventsHistory] DROP CONSTRAINT [DF__tbl_VIDSE__Creat__05C3D225]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_VIDSE__Revie__04CFADEC]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_VIDSEventsHistory] DROP CONSTRAINT [DF__tbl_VIDSE__Revie__04CFADEC]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_VIDSE__Revie__03DB89B3]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_VIDSEventsHistory] DROP CONSTRAINT [DF__tbl_VIDSE__Revie__03DB89B3]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_VIDSE__Revie__02E7657A]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_VIDSEventsHistory] DROP CONSTRAINT [DF__tbl_VIDSE__Revie__02E7657A]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_VIDSE__Revie__01F34141]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_VIDSEventsHistory] DROP CONSTRAINT [DF__tbl_VIDSE__Revie__01F34141]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_VIDSE__Revie__00FF1D08]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_VIDSEventsHistory] DROP CONSTRAINT [DF__tbl_VIDSE__Revie__00FF1D08]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_VIDSE__IsRev__000AF8CF]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_VIDSEventsHistory] DROP CONSTRAINT [DF__tbl_VIDSE__IsRev__000AF8CF]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_VIDSE__Chall__7F16D496]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_VIDSEventsHistory] DROP CONSTRAINT [DF__tbl_VIDSE__Chall__7F16D496]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_VIDSE__Chall__7E22B05D]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_VIDSEventsHistory] DROP CONSTRAINT [DF__tbl_VIDSE__Chall__7E22B05D]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_VIDSE__IsCha__7D2E8C24]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_VIDSEventsHistory] DROP CONSTRAINT [DF__tbl_VIDSE__IsCha__7D2E8C24]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_VIDSE__Incid__7C3A67EB]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_VIDSEventsHistory] DROP CONSTRAINT [DF__tbl_VIDSE__Incid__7C3A67EB]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Vehic__Modif__65F62111]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_VehicleClass] DROP CONSTRAINT [DF__tbl_Vehic__Modif__65F62111]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Vehic__Modif__6501FCD8]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_VehicleClass] DROP CONSTRAINT [DF__tbl_Vehic__Modif__6501FCD8]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Vehic__Creat__640DD89F]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_VehicleClass] DROP CONSTRAINT [DF__tbl_Vehic__Creat__640DD89F]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Vehic__Creat__6319B466]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_VehicleClass] DROP CONSTRAINT [DF__tbl_Vehic__Creat__6319B466]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Vehic__DataS__6225902D]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_VehicleClass] DROP CONSTRAINT [DF__tbl_Vehic__DataS__6225902D]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Vehic__Allow__61316BF4]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_VehicleClass] DROP CONSTRAINT [DF__tbl_Vehic__Allow__61316BF4]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_UserM__Modif__48CFD27E]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_UserMaster] DROP CONSTRAINT [DF__tbl_UserM__Modif__48CFD27E]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_UserM__Modif__47DBAE45]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_UserMaster] DROP CONSTRAINT [DF__tbl_UserM__Modif__47DBAE45]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_UserM__Creat__46E78A0C]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_UserMaster] DROP CONSTRAINT [DF__tbl_UserM__Creat__46E78A0C]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_UserM__Creat__45F365D3]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_UserMaster] DROP CONSTRAINT [DF__tbl_UserM__Creat__45F365D3]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_UserM__DataS__44FF419A]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_UserMaster] DROP CONSTRAINT [DF__tbl_UserM__DataS__44FF419A]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Syste__Modif__336AA144]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_SystemMaster] DROP CONSTRAINT [DF__tbl_Syste__Modif__336AA144]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Syste__Modif__32767D0B]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_SystemMaster] DROP CONSTRAINT [DF__tbl_Syste__Modif__32767D0B]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Syste__Creat__318258D2]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_SystemMaster] DROP CONSTRAINT [DF__tbl_Syste__Creat__318258D2]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Syste__Creat__308E3499]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_SystemMaster] DROP CONSTRAINT [DF__tbl_Syste__Creat__308E3499]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Syste__DataS__2F9A1060]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_SystemMaster] DROP CONSTRAINT [DF__tbl_Syste__DataS__2F9A1060]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Syste__DashB__2EA5EC27]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_SystemMaster] DROP CONSTRAINT [DF__tbl_Syste__DashB__2EA5EC27]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_RoleP__Modif__5441852A]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_RolePermission] DROP CONSTRAINT [DF__tbl_RoleP__Modif__5441852A]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_RoleP__Modif__534D60F1]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_RolePermission] DROP CONSTRAINT [DF__tbl_RoleP__Modif__534D60F1]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_RoleP__Creat__52593CB8]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_RolePermission] DROP CONSTRAINT [DF__tbl_RoleP__Creat__52593CB8]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_RoleP__Creat__5165187F]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_RolePermission] DROP CONSTRAINT [DF__tbl_RoleP__Creat__5165187F]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_RoleP__DataS__5070F446]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_RolePermission] DROP CONSTRAINT [DF__tbl_RoleP__DataS__5070F446]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_RoleP__DataU__4F7CD00D]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_RolePermission] DROP CONSTRAINT [DF__tbl_RoleP__DataU__4F7CD00D]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_RoleP__DataA__4E88ABD4]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_RolePermission] DROP CONSTRAINT [DF__tbl_RoleP__DataA__4E88ABD4]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_RoleP__DataV__4D94879B]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_RolePermission] DROP CONSTRAINT [DF__tbl_RoleP__DataV__4D94879B]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_RoleM__Modif__440B1D61]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_RoleMaster] DROP CONSTRAINT [DF__tbl_RoleM__Modif__440B1D61]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_RoleM__Modif__4316F928]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_RoleMaster] DROP CONSTRAINT [DF__tbl_RoleM__Modif__4316F928]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_RoleM__Creat__4222D4EF]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_RoleMaster] DROP CONSTRAINT [DF__tbl_RoleM__Creat__4222D4EF]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_RoleM__Creat__412EB0B6]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_RoleMaster] DROP CONSTRAINT [DF__tbl_RoleM__Creat__412EB0B6]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_RoleM__DataS__403A8C7D]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_RoleMaster] DROP CONSTRAINT [DF__tbl_RoleM__DataS__403A8C7D]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Repor__Modif__2610A626]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_ReportMaster] DROP CONSTRAINT [DF__tbl_Repor__Modif__2610A626]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Repor__Modif__251C81ED]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_ReportMaster] DROP CONSTRAINT [DF__tbl_Repor__Modif__251C81ED]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Repor__Creat__24285DB4]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_ReportMaster] DROP CONSTRAINT [DF__tbl_Repor__Creat__24285DB4]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Repor__Creat__2334397B]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_ReportMaster] DROP CONSTRAINT [DF__tbl_Repor__Creat__2334397B]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Repor__DataS__22401542]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_ReportMaster] DROP CONSTRAINT [DF__tbl_Repor__DataS__22401542]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Repor__Order__214BF109]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_ReportMaster] DROP CONSTRAINT [DF__tbl_Repor__Order__214BF109]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Repor__Paren__2057CCD0]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_ReportMaster] DROP CONSTRAINT [DF__tbl_Repor__Paren__2057CCD0]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Packa__Modif__3EDC53F0]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_PackageDetails] DROP CONSTRAINT [DF__tbl_Packa__Modif__3EDC53F0]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Packa__Modif__3DE82FB7]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_PackageDetails] DROP CONSTRAINT [DF__tbl_Packa__Modif__3DE82FB7]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Packa__Creat__3CF40B7E]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_PackageDetails] DROP CONSTRAINT [DF__tbl_Packa__Creat__3CF40B7E]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Packa__Creat__3BFFE745]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_PackageDetails] DROP CONSTRAINT [DF__tbl_Packa__Creat__3BFFE745]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Packa__DataS__3B0BC30C]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_PackageDetails] DROP CONSTRAINT [DF__tbl_Packa__DataS__3B0BC30C]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_MenuM__Modif__3F466844]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_MenuMaster] DROP CONSTRAINT [DF__tbl_MenuM__Modif__3F466844]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_MenuM__Modif__3E52440B]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_MenuMaster] DROP CONSTRAINT [DF__tbl_MenuM__Modif__3E52440B]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_MenuM__Creat__3D5E1FD2]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_MenuMaster] DROP CONSTRAINT [DF__tbl_MenuM__Creat__3D5E1FD2]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_MenuM__Creat__3C69FB99]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_MenuMaster] DROP CONSTRAINT [DF__tbl_MenuM__Creat__3C69FB99]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_MenuM__DataS__3B75D760]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_MenuMaster] DROP CONSTRAINT [DF__tbl_MenuM__DataS__3B75D760]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Login__Creat__3A81B327]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_LogingActivity] DROP CONSTRAINT [DF__tbl_Login__Creat__3A81B327]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Login__Login__398D8EEE]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_LogingActivity] DROP CONSTRAINT [DF__tbl_Login__Login__398D8EEE]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Incid__Modif__1C5231C2]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_IncidentSubCategory] DROP CONSTRAINT [DF__tbl_Incid__Modif__1C5231C2]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Incid__Modif__1B5E0D89]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_IncidentSubCategory] DROP CONSTRAINT [DF__tbl_Incid__Modif__1B5E0D89]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Incid__Creat__1A69E950]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_IncidentSubCategory] DROP CONSTRAINT [DF__tbl_Incid__Creat__1A69E950]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Incid__Creat__1975C517]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_IncidentSubCategory] DROP CONSTRAINT [DF__tbl_Incid__Creat__1975C517]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Incid__DataS__1881A0DE]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_IncidentSubCategory] DROP CONSTRAINT [DF__tbl_Incid__DataS__1881A0DE]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Incid__Modif__39788055]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_IncidentStatusMaster] DROP CONSTRAINT [DF__tbl_Incid__Modif__39788055]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Incid__Modif__38845C1C]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_IncidentStatusMaster] DROP CONSTRAINT [DF__tbl_Incid__Modif__38845C1C]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Incid__Creat__379037E3]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_IncidentStatusMaster] DROP CONSTRAINT [DF__tbl_Incid__Creat__379037E3]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Incid__Creat__369C13AA]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_IncidentStatusMaster] DROP CONSTRAINT [DF__tbl_Incid__Creat__369C13AA]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Incid__DataS__35A7EF71]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_IncidentStatusMaster] DROP CONSTRAINT [DF__tbl_Incid__DataS__35A7EF71]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Incid__Proce__34B3CB38]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_IncidentStatusMaster] DROP CONSTRAINT [DF__tbl_Incid__Proce__34B3CB38]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Incid__Modif__10AB74EC]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_IncidentSourceMaster] DROP CONSTRAINT [DF__tbl_Incid__Modif__10AB74EC]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Incid__Modif__0FB750B3]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_IncidentSourceMaster] DROP CONSTRAINT [DF__tbl_Incid__Modif__0FB750B3]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Incid__Creat__0EC32C7A]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_IncidentSourceMaster] DROP CONSTRAINT [DF__tbl_Incid__Creat__0EC32C7A]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Incid__Creat__0DCF0841]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_IncidentSourceMaster] DROP CONSTRAINT [DF__tbl_Incid__Creat__0DCF0841]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Incid__Media__4301EA8F]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_IncidentDetailsHistory] DROP CONSTRAINT [DF__tbl_Incid__Media__4301EA8F]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Incid__DataS__420DC656]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_IncidentDetailsHistory] DROP CONSTRAINT [DF__tbl_Incid__DataS__420DC656]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Incid__Modif__4119A21D]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_IncidentDetailsHistory] DROP CONSTRAINT [DF__tbl_Incid__Modif__4119A21D]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Incid__Modif__40257DE4]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_IncidentDetailsHistory] DROP CONSTRAINT [DF__tbl_Incid__Modif__40257DE4]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Incid__Creat__3F3159AB]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_IncidentDetailsHistory] DROP CONSTRAINT [DF__tbl_Incid__Creat__3F3159AB]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Incid__Creat__3E3D3572]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_IncidentDetailsHistory] DROP CONSTRAINT [DF__tbl_Incid__Creat__3E3D3572]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Incid__Modif__3F9B6DFF]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_IncidentCheckListMaster] DROP CONSTRAINT [DF__tbl_Incid__Modif__3F9B6DFF]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Incid__Modif__3EA749C6]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_IncidentCheckListMaster] DROP CONSTRAINT [DF__tbl_Incid__Modif__3EA749C6]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Incid__Creat__3DB3258D]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_IncidentCheckListMaster] DROP CONSTRAINT [DF__tbl_Incid__Creat__3DB3258D]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Incid__Creat__3CBF0154]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_IncidentCheckListMaster] DROP CONSTRAINT [DF__tbl_Incid__Creat__3CBF0154]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Incid__DataS__3BCADD1B]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_IncidentCheckListMaster] DROP CONSTRAINT [DF__tbl_Incid__DataS__3BCADD1B]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Incid__IsAut__3AD6B8E2]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_IncidentCheckListMaster] DROP CONSTRAINT [DF__tbl_Incid__IsAut__3AD6B8E2]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Incid__Categ__39E294A9]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_IncidentCheckListMaster] DROP CONSTRAINT [DF__tbl_Incid__Categ__39E294A9]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Incid__Modif__37FA4C37]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_IncidentCheckList] DROP CONSTRAINT [DF__tbl_Incid__Modif__37FA4C37]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Incid__Modif__370627FE]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_IncidentCheckList] DROP CONSTRAINT [DF__tbl_Incid__Modif__370627FE]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Incid__Creat__361203C5]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_IncidentCheckList] DROP CONSTRAINT [DF__tbl_Incid__Creat__361203C5]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Incid__Creat__351DDF8C]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_IncidentCheckList] DROP CONSTRAINT [DF__tbl_Incid__Creat__351DDF8C]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Incid__DataS__3429BB53]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_IncidentCheckList] DROP CONSTRAINT [DF__tbl_Incid__DataS__3429BB53]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Incid__IsAut__3335971A]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_IncidentCheckList] DROP CONSTRAINT [DF__tbl_Incid__IsAut__3335971A]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Incid__Modif__1BC821DD]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_IncidentCategoryMaster] DROP CONSTRAINT [DF__tbl_Incid__Modif__1BC821DD]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Incid__Modif__1AD3FDA4]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_IncidentCategoryMaster] DROP CONSTRAINT [DF__tbl_Incid__Modif__1AD3FDA4]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Incid__Creat__19DFD96B]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_IncidentCategoryMaster] DROP CONSTRAINT [DF__tbl_Incid__Creat__19DFD96B]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Incid__Creat__18EBB532]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_IncidentCategoryMaster] DROP CONSTRAINT [DF__tbl_Incid__Creat__18EBB532]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Incid__DataS__17F790F9]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_IncidentCategoryMaster] DROP CONSTRAINT [DF__tbl_Incid__DataS__17F790F9]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Incid__Order__17036CC0]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_IncidentCategoryMaster] DROP CONSTRAINT [DF__tbl_Incid__Order__17036CC0]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Incid__Media__3C54ED00]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_IncidentActionHistory] DROP CONSTRAINT [DF__tbl_Incid__Media__3C54ED00]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Incid__DataS__3B60C8C7]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_IncidentActionHistory] DROP CONSTRAINT [DF__tbl_Incid__DataS__3B60C8C7]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Event__Modif__216BEC9A]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_EventsTypeMaster] DROP CONSTRAINT [DF__tbl_Event__Modif__216BEC9A]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Event__Modif__2077C861]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_EventsTypeMaster] DROP CONSTRAINT [DF__tbl_Event__Modif__2077C861]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Event__Creat__1F83A428]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_EventsTypeMaster] DROP CONSTRAINT [DF__tbl_Event__Creat__1F83A428]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Event__Creat__1E8F7FEF]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_EventsTypeMaster] DROP CONSTRAINT [DF__tbl_Event__Creat__1E8F7FEF]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Event__DataS__1D9B5BB6]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_EventsTypeMaster] DROP CONSTRAINT [DF__tbl_Event__DataS__1D9B5BB6]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Event__Syste__1CA7377D]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_EventsTypeMaster] DROP CONSTRAINT [DF__tbl_Event__Syste__1CA7377D]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Event__Chall__19CACAD2]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_EventsTypeMaster] DROP CONSTRAINT [DF__tbl_Event__Chall__19CACAD2]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Event__Revie__1BB31344]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_EventsTypeMaster] DROP CONSTRAINT [DF__tbl_Event__Revie__1BB31344]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Event__Event__1ABEEF0B]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_EventsTypeMaster] DROP CONSTRAINT [DF__tbl_Event__Event__1ABEEF0B]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Error__Creat__5AB9788F]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_ErrorInfo] DROP CONSTRAINT [DF__tbl_Error__Creat__5AB9788F]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Error__Error__59C55456]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_ErrorInfo] DROP CONSTRAINT [DF__tbl_Error__Error__59C55456]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Error__Error__58D1301D]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_ErrorInfo] DROP CONSTRAINT [DF__tbl_Error__Error__58D1301D]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Error__Error__57DD0BE4]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_ErrorInfo] DROP CONSTRAINT [DF__tbl_Error__Error__57DD0BE4]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Error__Error__56E8E7AB]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_ErrorInfo] DROP CONSTRAINT [DF__tbl_Error__Error__56E8E7AB]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Error__Error__55F4C372]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_ErrorInfo] DROP CONSTRAINT [DF__tbl_Error__Error__55F4C372]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Error__Error__55009F39]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_ErrorInfo] DROP CONSTRAINT [DF__tbl_Error__Error__55009F39]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Equip__Modif__5614BF03]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_EquipmentTypeMaster] DROP CONSTRAINT [DF__tbl_Equip__Modif__5614BF03]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Equip__Modif__55209ACA]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_EquipmentTypeMaster] DROP CONSTRAINT [DF__tbl_Equip__Modif__55209ACA]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Equip__Creat__542C7691]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_EquipmentTypeMaster] DROP CONSTRAINT [DF__tbl_Equip__Creat__542C7691]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Equip__Creat__53385258]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_EquipmentTypeMaster] DROP CONSTRAINT [DF__tbl_Equip__Creat__53385258]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Equip__DataS__52442E1F]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_EquipmentTypeMaster] DROP CONSTRAINT [DF__tbl_Equip__DataS__52442E1F]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Equip__Equip__515009E6]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_EquipmentTypeMaster] DROP CONSTRAINT [DF__tbl_Equip__Equip__515009E6]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Equip__Modif__57A801BA]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_EquipmentDetails] DROP CONSTRAINT [DF__tbl_Equip__Modif__57A801BA]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Equip__Modif__56B3DD81]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_EquipmentDetails] DROP CONSTRAINT [DF__tbl_Equip__Modif__56B3DD81]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Equip__Creat__55BFB948]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_EquipmentDetails] DROP CONSTRAINT [DF__tbl_Equip__Creat__55BFB948]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Equip__Creat__54CB950F]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_EquipmentDetails] DROP CONSTRAINT [DF__tbl_Equip__Creat__54CB950F]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Equip__DataS__53D770D6]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_EquipmentDetails] DROP CONSTRAINT [DF__tbl_Equip__DataS__53D770D6]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Equip__OnLin__52E34C9D]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_EquipmentDetails] DROP CONSTRAINT [DF__tbl_Equip__OnLin__52E34C9D]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Equip__Modif__4F67C174]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_EquipmentConfig] DROP CONSTRAINT [DF__tbl_Equip__Modif__4F67C174]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Equip__Modif__4E739D3B]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_EquipmentConfig] DROP CONSTRAINT [DF__tbl_Equip__Modif__4E739D3B]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Equip__Creat__4D7F7902]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_EquipmentConfig] DROP CONSTRAINT [DF__tbl_Equip__Creat__4D7F7902]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Equip__Creat__4C8B54C9]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_EquipmentConfig] DROP CONSTRAINT [DF__tbl_Equip__Creat__4C8B54C9]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Equip__DataS__4B973090]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_EquipmentConfig] DROP CONSTRAINT [DF__tbl_Equip__DataS__4B973090]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Equip__Order__4AA30C57]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_EquipmentConfig] DROP CONSTRAINT [DF__tbl_Equip__Order__4AA30C57]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Equip__Posit__49AEE81E]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_EquipmentConfig] DROP CONSTRAINT [DF__tbl_Equip__Posit__49AEE81E]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Equip__Paren__48BAC3E5]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_EquipmentConfig] DROP CONSTRAINT [DF__tbl_Equip__Paren__48BAC3E5]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Contr__Modif__4A4E069C]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_ControlRoomMaster] DROP CONSTRAINT [DF__tbl_Contr__Modif__4A4E069C]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Contr__Modif__4959E263]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_ControlRoomMaster] DROP CONSTRAINT [DF__tbl_Contr__Modif__4959E263]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Contr__Creat__4865BE2A]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_ControlRoomMaster] DROP CONSTRAINT [DF__tbl_Contr__Creat__4865BE2A]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Contr__Creat__477199F1]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_ControlRoomMaster] DROP CONSTRAINT [DF__tbl_Contr__Creat__477199F1]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Contr__DataS__467D75B8]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_ControlRoomMaster] DROP CONSTRAINT [DF__tbl_Contr__DataS__467D75B8]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_CallE__Modif__3D2915A8]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_CallEventsDetails] DROP CONSTRAINT [DF__tbl_CallE__Modif__3D2915A8]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_CallE__Modif__3C34F16F]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_CallEventsDetails] DROP CONSTRAINT [DF__tbl_CallE__Modif__3C34F16F]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_CallE__Creat__3B40CD36]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_CallEventsDetails] DROP CONSTRAINT [DF__tbl_CallE__Creat__3B40CD36]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_CallE__Creat__3A4CA8FD]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_CallEventsDetails] DROP CONSTRAINT [DF__tbl_CallE__Creat__3A4CA8FD]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_CallE__DataS__395884C4]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_CallEventsDetails] DROP CONSTRAINT [DF__tbl_CallE__DataS__395884C4]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_CallE__SendS__3864608B]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_CallEventsDetails] DROP CONSTRAINT [DF__tbl_CallE__SendS__3864608B]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_ATCCE__Media__6774552F]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_ATCCEventHistory] DROP CONSTRAINT [DF__tbl_ATCCE__Media__6774552F]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_ATCCE__DataS__668030F6]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_ATCCEventHistory] DROP CONSTRAINT [DF__tbl_ATCCE__DataS__668030F6]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_ATCCE__Creat__658C0CBD]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_ATCCEventHistory] DROP CONSTRAINT [DF__tbl_ATCCE__Creat__658C0CBD]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_ATCCE__IsRev__6497E884]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_ATCCEventHistory] DROP CONSTRAINT [DF__tbl_ATCCE__IsRev__6497E884]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_ATCCE__IsWro__63A3C44B]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_ATCCEventHistory] DROP CONSTRAINT [DF__tbl_ATCCE__IsWro__63A3C44B]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_ATCCE__Vehic__62AFA012]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_ATCCEventHistory] DROP CONSTRAINT [DF__tbl_ATCCE__Vehic__62AFA012]
END
GO
/****** Object:  Table [dbo].[temp_ImportPermission]    Script Date: 31-07-2023 16:26:11 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[temp_ImportPermission]') AND type in (N'U'))
DROP TABLE [dbo].[temp_ImportPermission]
GO
/****** Object:  Table [dbo].[temp_EventsTypeMaster]    Script Date: 31-07-2023 16:26:11 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[temp_EventsTypeMaster]') AND type in (N'U'))
DROP TABLE [dbo].[temp_EventsTypeMaster]
GO
/****** Object:  Table [dbo].[temp_EquipmentConfig]    Script Date: 31-07-2023 16:26:11 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[temp_EquipmentConfig]') AND type in (N'U'))
DROP TABLE [dbo].[temp_EquipmentConfig]
GO
/****** Object:  Table [dbo].[tbl_WeatherEventHistory]    Script Date: 31-07-2023 16:26:11 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_WeatherEventHistory]') AND type in (N'U'))
DROP TABLE [dbo].[tbl_WeatherEventHistory]
GO
/****** Object:  Table [dbo].[tbl_WeatherConfiguration]    Script Date: 31-07-2023 16:26:11 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_WeatherConfiguration]') AND type in (N'U'))
DROP TABLE [dbo].[tbl_WeatherConfiguration]
GO
/****** Object:  Table [dbo].[tbl_VSDSSectionSpeedHistory]    Script Date: 31-07-2023 16:26:11 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_VSDSSectionSpeedHistory]') AND type in (N'U'))
DROP TABLE [dbo].[tbl_VSDSSectionSpeedHistory]
GO
/****** Object:  Table [dbo].[tbl_VSDSEventHistory]    Script Date: 31-07-2023 16:26:11 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_VSDSEventHistory]') AND type in (N'U'))
DROP TABLE [dbo].[tbl_VSDSEventHistory]
GO
/****** Object:  Table [dbo].[tbl_VMSMessageHistory]    Script Date: 31-07-2023 16:26:11 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_VMSMessageHistory]') AND type in (N'U'))
DROP TABLE [dbo].[tbl_VMSMessageHistory]
GO
/****** Object:  Table [dbo].[tbl_VMSMessageDetails]    Script Date: 31-07-2023 16:26:11 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_VMSMessageDetails]') AND type in (N'U'))
DROP TABLE [dbo].[tbl_VMSMessageDetails]
GO
/****** Object:  Table [dbo].[tbl_VIDSEventsHistory]    Script Date: 31-07-2023 16:26:11 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_VIDSEventsHistory]') AND type in (N'U'))
DROP TABLE [dbo].[tbl_VIDSEventsHistory]
GO
/****** Object:  Table [dbo].[tbl_VehicleClass]    Script Date: 31-07-2023 16:26:11 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_VehicleClass]') AND type in (N'U'))
DROP TABLE [dbo].[tbl_VehicleClass]
GO
/****** Object:  Table [dbo].[tbl_UserMaster]    Script Date: 31-07-2023 16:26:11 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_UserMaster]') AND type in (N'U'))
DROP TABLE [dbo].[tbl_UserMaster]
GO
/****** Object:  Table [dbo].[tbl_SystemMaster]    Script Date: 31-07-2023 16:26:11 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_SystemMaster]') AND type in (N'U'))
DROP TABLE [dbo].[tbl_SystemMaster]
GO
/****** Object:  Table [dbo].[tbl_RolePermission]    Script Date: 31-07-2023 16:26:11 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_RolePermission]') AND type in (N'U'))
DROP TABLE [dbo].[tbl_RolePermission]
GO
/****** Object:  Table [dbo].[tbl_RoleMaster]    Script Date: 31-07-2023 16:26:11 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_RoleMaster]') AND type in (N'U'))
DROP TABLE [dbo].[tbl_RoleMaster]
GO
/****** Object:  Table [dbo].[tbl_ReportMaster]    Script Date: 31-07-2023 16:26:11 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_ReportMaster]') AND type in (N'U'))
DROP TABLE [dbo].[tbl_ReportMaster]
GO
/****** Object:  Table [dbo].[tbl_PackageDetails]    Script Date: 31-07-2023 16:26:11 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_PackageDetails]') AND type in (N'U'))
DROP TABLE [dbo].[tbl_PackageDetails]
GO
/****** Object:  Table [dbo].[tbl_MenuMaster]    Script Date: 31-07-2023 16:26:11 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_MenuMaster]') AND type in (N'U'))
DROP TABLE [dbo].[tbl_MenuMaster]
GO
/****** Object:  Table [dbo].[tbl_LogingActivity]    Script Date: 31-07-2023 16:26:11 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_LogingActivity]') AND type in (N'U'))
DROP TABLE [dbo].[tbl_LogingActivity]
GO
/****** Object:  Table [dbo].[tbl_IncidentSubCategory]    Script Date: 31-07-2023 16:26:11 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_IncidentSubCategory]') AND type in (N'U'))
DROP TABLE [dbo].[tbl_IncidentSubCategory]
GO
/****** Object:  Table [dbo].[tbl_IncidentStatusMaster]    Script Date: 31-07-2023 16:26:11 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_IncidentStatusMaster]') AND type in (N'U'))
DROP TABLE [dbo].[tbl_IncidentStatusMaster]
GO
/****** Object:  Table [dbo].[tbl_IncidentSourceMaster]    Script Date: 31-07-2023 16:26:11 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_IncidentSourceMaster]') AND type in (N'U'))
DROP TABLE [dbo].[tbl_IncidentSourceMaster]
GO
/****** Object:  Table [dbo].[tbl_IncidentDetailsHistory]    Script Date: 31-07-2023 16:26:11 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_IncidentDetailsHistory]') AND type in (N'U'))
DROP TABLE [dbo].[tbl_IncidentDetailsHistory]
GO
/****** Object:  Table [dbo].[tbl_IncidentCheckListMaster]    Script Date: 31-07-2023 16:26:11 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_IncidentCheckListMaster]') AND type in (N'U'))
DROP TABLE [dbo].[tbl_IncidentCheckListMaster]
GO
/****** Object:  Table [dbo].[tbl_IncidentCheckList]    Script Date: 31-07-2023 16:26:11 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_IncidentCheckList]') AND type in (N'U'))
DROP TABLE [dbo].[tbl_IncidentCheckList]
GO
/****** Object:  Table [dbo].[tbl_IncidentCategoryMaster]    Script Date: 31-07-2023 16:26:11 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_IncidentCategoryMaster]') AND type in (N'U'))
DROP TABLE [dbo].[tbl_IncidentCategoryMaster]
GO
/****** Object:  Table [dbo].[tbl_IncidentActionHistory]    Script Date: 31-07-2023 16:26:11 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_IncidentActionHistory]') AND type in (N'U'))
DROP TABLE [dbo].[tbl_IncidentActionHistory]
GO
/****** Object:  Table [dbo].[tbl_EventsTypeMaster]    Script Date: 31-07-2023 16:26:11 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_EventsTypeMaster]') AND type in (N'U'))
DROP TABLE [dbo].[tbl_EventsTypeMaster]
GO
/****** Object:  Table [dbo].[tbl_ErrorInfo]    Script Date: 31-07-2023 16:26:11 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_ErrorInfo]') AND type in (N'U'))
DROP TABLE [dbo].[tbl_ErrorInfo]
GO
/****** Object:  Table [dbo].[tbl_EquipmentTypeMaster]    Script Date: 31-07-2023 16:26:11 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_EquipmentTypeMaster]') AND type in (N'U'))
DROP TABLE [dbo].[tbl_EquipmentTypeMaster]
GO
/****** Object:  Table [dbo].[tbl_EquipmentDetails]    Script Date: 31-07-2023 16:26:11 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_EquipmentDetails]') AND type in (N'U'))
DROP TABLE [dbo].[tbl_EquipmentDetails]
GO
/****** Object:  Table [dbo].[tbl_EquipmentConfig]    Script Date: 31-07-2023 16:26:11 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_EquipmentConfig]') AND type in (N'U'))
DROP TABLE [dbo].[tbl_EquipmentConfig]
GO
/****** Object:  Table [dbo].[tbl_ControlRoomMaster]    Script Date: 31-07-2023 16:26:11 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_ControlRoomMaster]') AND type in (N'U'))
DROP TABLE [dbo].[tbl_ControlRoomMaster]
GO
/****** Object:  Table [dbo].[tbl_CallEventsDetails]    Script Date: 31-07-2023 16:26:11 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_CallEventsDetails]') AND type in (N'U'))
DROP TABLE [dbo].[tbl_CallEventsDetails]
GO
/****** Object:  Table [dbo].[tbl_ATCCEventHistory]    Script Date: 31-07-2023 16:26:11 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_ATCCEventHistory]') AND type in (N'U'))
DROP TABLE [dbo].[tbl_ATCCEventHistory]
GO
/****** Object:  Table [dbo].[tbl_ActivityLog]    Script Date: 31-07-2023 16:26:11 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_ActivityLog]') AND type in (N'U'))
DROP TABLE [dbo].[tbl_ActivityLog]
GO
/****** Object:  Table [dbo].[eventdata]    Script Date: 31-07-2023 16:26:11 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[eventdata]') AND type in (N'U'))
DROP TABLE [dbo].[eventdata]
GO
/****** Object:  Table [dbo].[eventdata]    Script Date: 31-07-2023 16:26:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[eventdata](
	[EventsTypeId] [tinyint] NOT NULL,
	[EventTypeName] [nvarchar](50) NOT NULL,
	[IncidentRequired] [bit] NOT NULL,
	[ChallanRequired] [bit] NOT NULL,
	[SystemId] [tinyint] NOT NULL,
	[DataStatus] [bit] NOT NULL,
	[CreatedDate] [nvarchar](50) NOT NULL,
	[CreatedBy] [bigint] NOT NULL,
	[ModifiedDate] [nvarchar](50) NOT NULL,
	[ModifiedBy] [bigint] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_ActivityLog]    Script Date: 31-07-2023 16:26:11 ******/
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
/****** Object:  Table [dbo].[tbl_ATCCEventHistory]    Script Date: 31-07-2023 16:26:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_ATCCEventHistory](
	[TransactionId] [varchar](30) NULL,
	[EquipmentId] [bigint] NULL,
	[EquipmentIP] [varchar](20) NULL,
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
	[ReviewedBy] [bigint] NULL,
	[ReviewedDateTime] [datetime] NULL,
	[ReviewedRemark] [varchar](255) NULL,
	[CreatedDate] [datetime] NULL,
	[SystemProviderId] [smallint] NULL,
	[DataSendStatus] [bit] NULL,
	[MediaSendStatus] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_CallEventsDetails]    Script Date: 31-07-2023 16:26:11 ******/
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
/****** Object:  Table [dbo].[tbl_ControlRoomMaster]    Script Date: 31-07-2023 16:26:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_ControlRoomMaster](
	[ControlRoomId] [smallint] IDENTITY(1,1) NOT NULL,
	[ControlRoomName] [varchar](100) NULL,
	[ChainageNumber] [decimal](16, 3) NULL,
	[Latitude] [decimal](8, 6) NULL,
	[Longitude] [decimal](9, 6) NULL,
	[DirectionId] [smallint] NULL,
	[DataStatus] [smallint] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [bigint] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [bigint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_EquipmentConfig]    Script Date: 31-07-2023 16:26:11 ******/
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
	[OrderBy] [smallint] NULL,
	[DataStatus] [smallint] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [bigint] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [bigint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_EquipmentDetails]    Script Date: 31-07-2023 16:26:11 ******/
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
	[Latitude] [decimal](8, 6) NULL,
	[Longitude] [decimal](9, 6) NULL,
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
/****** Object:  Table [dbo].[tbl_EquipmentTypeMaster]    Script Date: 31-07-2023 16:26:11 ******/
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
/****** Object:  Table [dbo].[tbl_ErrorInfo]    Script Date: 31-07-2023 16:26:11 ******/
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
/****** Object:  Table [dbo].[tbl_EventsTypeMaster]    Script Date: 31-07-2023 16:26:11 ******/
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
/****** Object:  Table [dbo].[tbl_IncidentActionHistory]    Script Date: 31-07-2023 16:26:11 ******/
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
/****** Object:  Table [dbo].[tbl_IncidentCategoryMaster]    Script Date: 31-07-2023 16:26:11 ******/
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
/****** Object:  Table [dbo].[tbl_IncidentCheckList]    Script Date: 31-07-2023 16:26:11 ******/
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
/****** Object:  Table [dbo].[tbl_IncidentCheckListMaster]    Script Date: 31-07-2023 16:26:11 ******/
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
/****** Object:  Table [dbo].[tbl_IncidentDetailsHistory]    Script Date: 31-07-2023 16:26:11 ******/
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
/****** Object:  Table [dbo].[tbl_IncidentSourceMaster]    Script Date: 31-07-2023 16:26:11 ******/
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
/****** Object:  Table [dbo].[tbl_IncidentStatusMaster]    Script Date: 31-07-2023 16:26:11 ******/
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
/****** Object:  Table [dbo].[tbl_IncidentSubCategory]    Script Date: 31-07-2023 16:26:11 ******/
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
/****** Object:  Table [dbo].[tbl_LogingActivity]    Script Date: 31-07-2023 16:26:11 ******/
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
/****** Object:  Table [dbo].[tbl_MenuMaster]    Script Date: 31-07-2023 16:26:11 ******/
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
/****** Object:  Table [dbo].[tbl_PackageDetails]    Script Date: 31-07-2023 16:26:11 ******/
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
	[StartLatitude] [decimal](8, 6) NULL,
	[StartLongitude] [decimal](9, 6) NULL,
	[EndLatitude] [decimal](8, 6) NULL,
	[EndLongitude] [decimal](9, 6) NULL,
	[DataStatus] [smallint] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [bigint] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [bigint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_ReportMaster]    Script Date: 31-07-2023 16:26:11 ******/
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
/****** Object:  Table [dbo].[tbl_RoleMaster]    Script Date: 31-07-2023 16:26:11 ******/
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
/****** Object:  Table [dbo].[tbl_RolePermission]    Script Date: 31-07-2023 16:26:11 ******/
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
/****** Object:  Table [dbo].[tbl_SystemMaster]    Script Date: 31-07-2023 16:26:11 ******/
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
	[DataStatus] [smallint] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [bigint] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [bigint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_UserMaster]    Script Date: 31-07-2023 16:26:11 ******/
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
	[DataStatus] [smallint] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [bigint] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [bigint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_VehicleClass]    Script Date: 31-07-2023 16:26:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_VehicleClass](
	[ClassId] [smallint] IDENTITY(1,1) NOT NULL,
	[VehicleClassId] [smallint] NULL,
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
/****** Object:  Table [dbo].[tbl_VIDSEventsHistory]    Script Date: 31-07-2023 16:26:11 ******/
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
/****** Object:  Table [dbo].[tbl_VMSMessageDetails]    Script Date: 31-07-2023 16:26:11 ******/
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
/****** Object:  Table [dbo].[tbl_VMSMessageHistory]    Script Date: 31-07-2023 16:26:11 ******/
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
/****** Object:  Table [dbo].[tbl_VSDSEventHistory]    Script Date: 31-07-2023 16:26:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_VSDSEventHistory](
	[TransactionId] [varchar](30) NULL,
	[EquipmentId] [bigint] NULL,
	[EquipmentIP] [varchar](20) NULL,
	[LaneNumber] [smallint] NULL,
	[EventID] [varchar](255) NULL,
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
	[ReviewedStatus] [bit] NULL,
	[ReviewedVehicleClassId] [smallint] NULL,
	[ReviewedPlateNumber] [varchar](50) NULL,
	[ReviewedPlateVisible] [bit] NULL,
	[ReviewedPlateFaulty] [bit] NULL,
	[ReviewedPlateStandard] [bit] NULL,
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
/****** Object:  Table [dbo].[tbl_VSDSSectionSpeedHistory]    Script Date: 31-07-2023 16:26:11 ******/
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
/****** Object:  Table [dbo].[tbl_WeatherConfiguration]    Script Date: 31-07-2023 16:26:11 ******/
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
/****** Object:  Table [dbo].[tbl_WeatherEventHistory]    Script Date: 31-07-2023 16:26:11 ******/
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
/****** Object:  Table [dbo].[temp_EquipmentConfig]    Script Date: 31-07-2023 16:26:11 ******/
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
	[SessionId] [varchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[temp_EventsTypeMaster]    Script Date: 31-07-2023 16:26:11 ******/
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
/****** Object:  Table [dbo].[temp_ImportPermission]    Script Date: 31-07-2023 16:26:11 ******/
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
INSERT [dbo].[eventdata] ([EventsTypeId], [EventTypeName], [IncidentRequired], [ChallanRequired], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (1, N'Stop Vehicle', 1, 1, 6, 1, N'2021-07-07 11:24:39.433000000', 0, N'2022-05-23 13:49:11.347000000', 1)
GO
INSERT [dbo].[eventdata] ([EventsTypeId], [EventTypeName], [IncidentRequired], [ChallanRequired], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (2, N'Congestion', 1, 0, 6, 1, N'2021-07-07 11:24:39.433000000', 0, N'2022-10-19 15:42:01.913000000', 1)
GO
INSERT [dbo].[eventdata] ([EventsTypeId], [EventTypeName], [IncidentRequired], [ChallanRequired], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (3, N'Wrong Direction', 1, 1, 6, 1, N'2021-07-07 11:24:39.433000000', 0, N'2022-10-19 15:41:44.223000000', 1)
GO
INSERT [dbo].[eventdata] ([EventsTypeId], [EventTypeName], [IncidentRequired], [ChallanRequired], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (4, N'Fast Moving', 0, 1, 6, 1, N'2021-07-07 11:24:39.433000000', 0, N'2022-05-18 13:26:57.053000000', 1)
GO
INSERT [dbo].[eventdata] ([EventsTypeId], [EventTypeName], [IncidentRequired], [ChallanRequired], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (5, N'Slow Moving', 0, 1, 6, 1, N'2021-07-07 11:24:39.433000000', 0, N'2023-02-02 14:33:42.490000000', 1)
GO
INSERT [dbo].[eventdata] ([EventsTypeId], [EventTypeName], [IncidentRequired], [ChallanRequired], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (6, N'Fog/smoke', 1, 1, 6, 1, N'2021-07-07 11:24:39.433000000', 0, N'2022-02-28 17:56:11.980000000', 1)
GO
INSERT [dbo].[eventdata] ([EventsTypeId], [EventTypeName], [IncidentRequired], [ChallanRequired], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (7, N'Fire', 1, 1, 6, 1, N'2021-07-07 11:24:39.433000000', 0, N'2022-02-28 17:56:12.527000000', 1)
GO
INSERT [dbo].[eventdata] ([EventsTypeId], [EventTypeName], [IncidentRequired], [ChallanRequired], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (8, N'Fallen Object', 1, 1, 6, 1, N'2021-07-07 11:24:39.433000000', 0, N'2022-02-28 17:56:13.090000000', 1)
GO
INSERT [dbo].[eventdata] ([EventsTypeId], [EventTypeName], [IncidentRequired], [ChallanRequired], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (9, N'Human Detected', 1, 1, 6, 1, N'2021-07-07 11:24:39.433000000', 0, N'2022-02-28 17:56:13.493000000', 1)
GO
INSERT [dbo].[eventdata] ([EventsTypeId], [EventTypeName], [IncidentRequired], [ChallanRequired], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (10, N'No Video', 0, 1, 6, 1, N'2022-01-14 15:19:16.093000000', 0, N'2022-02-28 17:56:13.870000000', 1)
GO
INSERT [dbo].[eventdata] ([EventsTypeId], [EventTypeName], [IncidentRequired], [ChallanRequired], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (11, N'Human Crossing Road', 0, 1, 6, 1, N'2022-02-10 12:36:11.257000000', 0, N'2022-05-23 13:49:37.483000000', 1)
GO
INSERT [dbo].[eventdata] ([EventsTypeId], [EventTypeName], [IncidentRequired], [ChallanRequired], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (12, N'Vehicle Occupancy', 1, 1, 6, 0, N'2022-02-10 12:36:36.873000000', 0, N'2022-02-28 17:56:17.883000000', 1)
GO
INSERT [dbo].[eventdata] ([EventsTypeId], [EventTypeName], [IncidentRequired], [ChallanRequired], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (13, N'Lane Changed', 1, 1, 6, 1, N'2022-02-10 12:36:47.043000000', 0, N'2022-02-28 17:56:15.197000000', 1)
GO
INSERT [dbo].[eventdata] ([EventsTypeId], [EventTypeName], [IncidentRequired], [ChallanRequired], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (14, N'Speed', 0, 1, 6, 0, N'2022-02-10 12:36:59.243000000', 0, N'2022-03-03 14:58:25.400000000', 1)
GO
INSERT [dbo].[eventdata] ([EventsTypeId], [EventTypeName], [IncidentRequired], [ChallanRequired], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (15, N'Low Speed', 0, 1, 6, 0, N'2022-02-10 12:37:12.620000000', 0, N'2022-02-28 18:00:45.223000000', 1)
GO
INSERT [dbo].[eventdata] ([EventsTypeId], [EventTypeName], [IncidentRequired], [ChallanRequired], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (16, N'ATCC', 0, 1, 6, 1, N'2022-02-10 12:37:38.067000000', 0, N'2022-05-14 15:10:00.113000000', 1)
GO
INSERT [dbo].[eventdata] ([EventsTypeId], [EventTypeName], [IncidentRequired], [ChallanRequired], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (17, N'False Event', 0, 0, 6, 1, N'2022-03-03 12:52:38.407000000', 0, N'2022-04-18 17:51:45.027000000', 1)
GO
INSERT [dbo].[eventdata] ([EventsTypeId], [EventTypeName], [IncidentRequired], [ChallanRequired], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (18, N'Recording Connected', 0, 0, 6, 1, N'2022-07-23 13:35:18.033000000', 0, N'2022-07-23 13:35:18.033000000', 0)
GO
INSERT [dbo].[eventdata] ([EventsTypeId], [EventTypeName], [IncidentRequired], [ChallanRequired], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (19, N'Motion Detected', 0, 1, 6, 1, N'2022-07-23 13:36:30.847000000', 0, N'2022-07-23 13:36:30.847000000', 0)
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
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (23, 0, N'{"EquipmentId":48,"PackageId":1,"EquipmentTypeId":1,"SystemId":16,"EquipmentName":"0","EquipmentDirectionId":2,"EquipmentProtocolTypeId":1,"EquipmentIP":"192.168.1.1","EquipmentPortNumber":80,"EquipmentLoginId":"a","EquipmentPassword":"a","EquipmentChainageNumber":0.000,"EquipmentLatitude":0.000000,"EquipmentLongitude":0.000000,"EquipmentMacAddress":"0","EquipmentModelNumber":"0","EquipmentSerialNumber":"0","EquipmentManufacturer":"0","EquipmentVendorDetail":"0","EquipmentManufacturerDate":"2023-06-22","EquipmentPurchageDate":"2023-06-22","EquipmentWarrantyExpireDate":"2023-06-22","OnLineStatus":0,"DataStatus":1,"CreatedDate":"2023-06-22T08:39:25.650","CreatedBy":0,"ModifiedDate":"2023-06-22T08:39:26.867","ModifiedBy":0}', N'{"EquipmentId":48,"PackageId":1,"EquipmentTypeId":1,"SystemId":0,"EquipmentName":"3","EquipmentDirectionId":0,"EquipmentProtocolTypeId":0,"EquipmentIP":"192.168.1.1","EquipmentPortNumber":80,"EquipmentLoginId":"a","EquipmentPassword":"a","EquipmentChainageNumber":2.000,"EquipmentLatitude":0.000000,"EquipmentLongitude":1.000000,"EquipmentMacAddress":"4","EquipmentModelNumber":"5","EquipmentSerialNumber":"6","EquipmentManufacturer":"7","EquipmentVendorDetail":"8","EquipmentManufacturerDate":"2023-06-22","EquipmentPurchageDate":"2023-06-23","EquipmentWarrantyExpireDate":"2023-06-24","OnLineStatus":0,"DataStatus":1,"CreatedDate":"2023-06-22T08:39:25.650","CreatedBy":0,"ModifiedDate":"2023-06-23T23:07:14.947","ModifiedBy":0}', N'Update', N'4', CAST(N'2023-06-23T23:07:14.947' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (25, 0, N'{"EquipmentId":48,"PackageId":1,"EquipmentTypeId":1,"SystemId":16,"EquipmentName":"3","EquipmentDirectionId":16,"EquipmentProtocolTypeId":0,"EquipmentIP":"192.168.1.1","EquipmentPortNumber":80,"EquipmentLoginId":"a","EquipmentPassword":"a","EquipmentChainageNumber":2.000,"EquipmentLatitude":0.000000,"EquipmentLongitude":1.000000,"EquipmentMacAddress":"4","EquipmentModelNumber":"5","EquipmentSerialNumber":"6","EquipmentManufacturer":"7","EquipmentVendorDetail":"8","EquipmentManufacturerDate":"2023-06-22","EquipmentPurchageDate":"2023-06-23","EquipmentWarrantyExpireDate":"2023-06-24","OnLineStatus":0,"DataStatus":1,"CreatedDate":"2023-06-22T08:39:25.650","CreatedBy":0,"ModifiedDate":"2023-06-23T23:15:31.503","ModifiedBy":0}', N'{"EquipmentId":48,"PackageId":1,"EquipmentTypeId":1,"SystemId":16,"EquipmentName":"3","EquipmentDirectionId":16,"EquipmentProtocolTypeId":0,"EquipmentIP":"192.168.1.1","EquipmentPortNumber":80,"EquipmentLoginId":"a","EquipmentPassword":"a","EquipmentChainageNumber":2.000,"EquipmentLatitude":0.000000,"EquipmentLongitude":1.000000,"EquipmentMacAddress":"4","EquipmentModelNumber":"5","EquipmentSerialNumber":"6","EquipmentManufacturer":"7","EquipmentVendorDetail":"8","EquipmentManufacturerDate":"2023-06-22","EquipmentPurchageDate":"2023-06-23","EquipmentWarrantyExpireDate":"2023-06-24","OnLineStatus":0,"DataStatus":1,"CreatedDate":"2023-06-22T08:39:25.650","CreatedBy":0,"ModifiedDate":"2023-06-23T23:30:53.677","ModifiedBy":0}', N'Update', N'4', CAST(N'2023-06-23T23:30:53.677' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (45, 0, N'{"ClassId":2,"VehicleClassId":1,"VehicleClassName":"Motorcycle","VehicleClassIcon":"fa fa-motorcycle","AllowedSpeed":80.00,"DataStatus":1,"CreatedDate":"2022-01-18T12:21:46.273","CreatedBy":0,"ModifiedDate":"2022-09-17T12:16:25.887","ModifiedBy":1}', N'{"ClassId":2,"VehicleClassId":1,"VehicleClassName":"Motorcycle","VehicleClassIcon":"fa fa-motorcycle","AllowedSpeed":80.00,"DataStatus":1,"CreatedDate":"2022-01-18T12:21:46.273","CreatedBy":0,"ModifiedDate":"2023-06-26T21:17:34.287","ModifiedBy":0}', N'Update', N'8', CAST(N'2023-06-26T21:17:34.287' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (26, 0, N'{"EquipmentId":48,"PackageId":1,"EquipmentTypeId":1,"SystemId":16,"EquipmentName":"3","EquipmentDirectionId":16,"EquipmentProtocolTypeId":0,"EquipmentIP":"192.168.1.1","EquipmentPortNumber":80,"EquipmentLoginId":"a","EquipmentPassword":"a","EquipmentChainageNumber":2.000,"EquipmentLatitude":0.000000,"EquipmentLongitude":1.000000,"EquipmentMacAddress":"4","EquipmentModelNumber":"5","EquipmentSerialNumber":"6","EquipmentManufacturer":"7","EquipmentVendorDetail":"8","EquipmentManufacturerDate":"2023-06-22","EquipmentPurchageDate":"2023-06-23","EquipmentWarrantyExpireDate":"2023-06-24","OnLineStatus":0,"DataStatus":1,"CreatedDate":"2023-06-22T08:39:25.650","CreatedBy":0,"ModifiedDate":"2023-06-23T23:30:53.677","ModifiedBy":0}', N'{"EquipmentId":48,"PackageId":1,"EquipmentTypeId":1,"SystemId":16,"EquipmentName":"3","EquipmentDirectionId":16,"EquipmentProtocolTypeId":0,"EquipmentIP":"192.168.1.1","EquipmentPortNumber":80,"EquipmentLoginId":"a","EquipmentPassword":"a","EquipmentChainageNumber":2.000,"EquipmentLatitude":0.000000,"EquipmentLongitude":1.000000,"EquipmentMacAddress":"4","EquipmentModelNumber":"5","EquipmentSerialNumber":"6","EquipmentManufacturer":"7","EquipmentVendorDetail":"8","EquipmentManufacturerDate":"2023-06-22","EquipmentPurchageDate":"2023-06-23","EquipmentWarrantyExpireDate":"2023-06-24","OnLineStatus":0,"DataStatus":1,"CreatedDate":"2023-06-22T08:39:25.650","CreatedBy":0,"ModifiedDate":"2023-06-23T23:31:04.240","ModifiedBy":0}', N'Update', N'4', CAST(N'2023-06-23T23:31:04.240' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (27, 0, N'{"EquipmentId":48,"PackageId":1,"EquipmentTypeId":1,"SystemId":16,"EquipmentName":"3","EquipmentDirectionId":16,"EquipmentProtocolTypeId":0,"EquipmentIP":"192.168.1.1","EquipmentPortNumber":80,"EquipmentLoginId":"a","EquipmentPassword":"a","EquipmentChainageNumber":2.000,"EquipmentLatitude":0.000000,"EquipmentLongitude":1.000000,"EquipmentMacAddress":"4","EquipmentModelNumber":"5","EquipmentSerialNumber":"6","EquipmentManufacturer":"7","EquipmentVendorDetail":"8","EquipmentManufacturerDate":"2023-06-22","EquipmentPurchageDate":"2023-06-23","EquipmentWarrantyExpireDate":"2023-06-24","OnLineStatus":0,"DataStatus":1,"CreatedDate":"2023-06-22T08:39:25.650","CreatedBy":0,"ModifiedDate":"2023-06-23T23:31:04.240","ModifiedBy":0}', N'{"EquipmentId":48,"PackageId":1,"EquipmentTypeId":1,"SystemId":16,"EquipmentName":"3","EquipmentDirectionId":0,"EquipmentProtocolTypeId":0,"EquipmentIP":"192.168.1.1","EquipmentPortNumber":80,"EquipmentLoginId":"a","EquipmentPassword":"a","EquipmentChainageNumber":2.000,"EquipmentLatitude":0.000000,"EquipmentLongitude":1.000000,"EquipmentMacAddress":"4","EquipmentModelNumber":"5","EquipmentSerialNumber":"6","EquipmentManufacturer":"7","EquipmentVendorDetail":"8","EquipmentManufacturerDate":"2023-06-22","EquipmentPurchageDate":"2023-06-23","EquipmentWarrantyExpireDate":"2023-06-24","OnLineStatus":0,"DataStatus":1,"CreatedDate":"2023-06-22T08:39:25.650","CreatedBy":0,"ModifiedDate":"2023-06-23T23:37:40.670","ModifiedBy":0}', N'Update', N'4', CAST(N'2023-06-23T23:37:40.670' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (32, 0, N'{"ControlRoomId":1,"ControlRoomName":"","DataStatus":1,"CreatedDate":"2023-06-17T06:20:12.823","CreatedBy":0,"ModifiedDate":"2023-06-24T13:00:00.387","ModifiedBy":0}', N'{"ControlRoomId":1,"ControlRoomName":"CR-1","DataStatus":1,"CreatedDate":"2023-06-17T06:20:12.823","CreatedBy":0,"ModifiedDate":"2023-06-24T13:00:28.427","ModifiedBy":0}', N'Update', N'3', CAST(N'2023-06-24T13:00:28.427' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (28, 0, N'{"EquipmentId":48,"PackageId":1,"EquipmentTypeId":1,"SystemId":16,"EquipmentName":"3","EquipmentDirectionId":0,"EquipmentProtocolTypeId":0,"EquipmentIP":"192.168.1.1","EquipmentPortNumber":80,"EquipmentLoginId":"a","EquipmentPassword":"a","EquipmentChainageNumber":2.000,"EquipmentLatitude":0.000000,"EquipmentLongitude":1.000000,"EquipmentMacAddress":"4","EquipmentModelNumber":"5","EquipmentSerialNumber":"6","EquipmentManufacturer":"7","EquipmentVendorDetail":"8","EquipmentManufacturerDate":"2023-06-22","EquipmentPurchageDate":"2023-06-23","EquipmentWarrantyExpireDate":"2023-06-24","OnLineStatus":0,"DataStatus":1,"CreatedDate":"2023-06-22T08:39:25.650","CreatedBy":0,"ModifiedDate":"2023-06-23T23:37:40.670","ModifiedBy":0}', N'{"EquipmentId":48,"PackageId":1,"EquipmentTypeId":1,"SystemId":16,"EquipmentName":"3","EquipmentDirectionId":0,"EquipmentProtocolTypeId":0,"EquipmentIP":"192.168.1.1","EquipmentPortNumber":80,"EquipmentLoginId":"a","EquipmentPassword":"a","EquipmentChainageNumber":2.000,"EquipmentLatitude":0.000000,"EquipmentLongitude":1.000000,"EquipmentMacAddress":"4","EquipmentModelNumber":"5","EquipmentSerialNumber":"6","EquipmentManufacturer":"7","EquipmentVendorDetail":"8","EquipmentManufacturerDate":"2023-06-22","EquipmentPurchageDate":"2023-06-23","EquipmentWarrantyExpireDate":"2023-06-24","OnLineStatus":0,"DataStatus":1,"CreatedDate":"2023-06-22T08:39:25.650","CreatedBy":0,"ModifiedDate":"2023-06-23T23:40:31.680","ModifiedBy":0}', N'Update', N'4', CAST(N'2023-06-23T23:40:31.680' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (29, 0, N'{"EquipmentId":48,"PackageId":1,"EquipmentTypeId":1,"SystemId":16,"EquipmentName":"3","EquipmentDirectionId":0,"EquipmentProtocolTypeId":0,"EquipmentIP":"192.168.1.1","EquipmentPortNumber":80,"EquipmentLoginId":"a","EquipmentPassword":"a","EquipmentChainageNumber":2.000,"EquipmentLatitude":0.000000,"EquipmentLongitude":1.000000,"EquipmentMacAddress":"4","EquipmentModelNumber":"5","EquipmentSerialNumber":"6","EquipmentManufacturer":"7","EquipmentVendorDetail":"8","EquipmentManufacturerDate":"2023-06-22","EquipmentPurchageDate":"2023-06-23","EquipmentWarrantyExpireDate":"2023-06-24","OnLineStatus":0,"DataStatus":1,"CreatedDate":"2023-06-22T08:39:25.650","CreatedBy":0,"ModifiedDate":"2023-06-23T23:40:31.680","ModifiedBy":0}', N'{"EquipmentId":48,"PackageId":1,"EquipmentTypeId":1,"SystemId":16,"EquipmentName":"3","EquipmentDirectionId":0,"EquipmentProtocolTypeId":0,"EquipmentIP":"192.168.1.1","EquipmentPortNumber":80,"EquipmentLoginId":"a","EquipmentPassword":"a","EquipmentChainageNumber":2.000,"EquipmentLatitude":0.000000,"EquipmentLongitude":1.000000,"EquipmentMacAddress":"4","EquipmentModelNumber":"5","EquipmentSerialNumber":"6","EquipmentManufacturer":"7","EquipmentVendorDetail":"8","EquipmentManufacturerDate":"2023-06-22","EquipmentPurchageDate":"2023-06-23","EquipmentWarrantyExpireDate":"2023-06-24","OnLineStatus":0,"DataStatus":1,"CreatedDate":"2023-06-22T08:39:25.650","CreatedBy":0,"ModifiedDate":"2023-06-23T23:53:11.107","ModifiedBy":0}', N'Update', N'4', CAST(N'2023-06-23T23:53:11.107' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (33, 0, N'{"PackageId":1,"ControlRoomId":1,"PackageName":"PKG-1","StartChainageNumber":0.000,"EndChainageNumber":300.000,"DataStatus":1,"CreatedDate":"2023-06-20T15:51:12.060","CreatedBy":0,"ModifiedDate":"2023-06-20T15:51:12.060","ModifiedBy":0}', N'{"PackageId":1,"ControlRoomId":1,"PackageName":"PKG-1","StartChainageNumber":0.000,"EndChainageNumber":100.000,"StartLatitude":0.000000,"StartLongitude":0.000000,"EndLatitude":0.000000,"EndLongitude":0.000000,"DataStatus":1,"CreatedDate":"2023-06-20T15:51:12.060","CreatedBy":0,"ModifiedDate":"2023-06-24T13:01:57.797","ModifiedBy":0}', N'Update', N'7', CAST(N'2023-06-24T13:01:57.797' AS DateTime))
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
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (54, 0, N'{"ControlRoomId":1,"ControlRoomName":"CR-1","ChainageNumber":1.000,"Latitude":0.000000,"Longitude":0.000000,"DirectionId":1,"DataStatus":1,"CreatedDate":"2023-06-17T06:20:12.823","CreatedBy":0,"ModifiedDate":"2023-07-03T23:26:54.767","ModifiedBy":0}', N'{"ControlRoomId":1,"ControlRoomName":"CR-1","ChainageNumber":1.000,"Latitude":0.000000,"Longitude":0.000000,"DirectionId":1,"DataStatus":1,"CreatedDate":"2023-06-17T06:20:12.823","CreatedBy":0,"ModifiedDate":"2023-07-03T23:27:32.387","ModifiedBy":0}', N'Update', N'3', CAST(N'2023-07-03T23:27:32.387' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (55, 0, N'{"ControlRoomId":1,"ControlRoomName":"CR-1","ChainageNumber":1.000,"Latitude":0.000000,"Longitude":0.000000,"DirectionId":1,"DataStatus":1,"CreatedDate":"2023-06-17T06:20:12.823","CreatedBy":0,"ModifiedDate":"2023-07-03T23:27:32.387","ModifiedBy":0}', N'{"ControlRoomId":1,"ControlRoomName":"CR-1","ChainageNumber":1.000,"Latitude":0.000000,"Longitude":0.000000,"DirectionId":1,"DataStatus":1,"CreatedDate":"2023-06-17T06:20:12.823","CreatedBy":0,"ModifiedDate":"2023-07-03T23:28:07.573","ModifiedBy":0}', N'Update', N'3', CAST(N'2023-07-03T23:28:07.573' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (56, 0, N'{"ControlRoomId":1,"ControlRoomName":"CR-1","ChainageNumber":1.000,"Latitude":0.000000,"Longitude":0.000000,"DirectionId":1,"DataStatus":1,"CreatedDate":"2023-06-17T06:20:12.823","CreatedBy":0,"ModifiedDate":"2023-07-03T23:28:07.573","ModifiedBy":0}', N'{"ControlRoomId":1,"ControlRoomName":"CR-1","ChainageNumber":1.000,"Latitude":0.000000,"Longitude":0.000000,"DirectionId":1,"DataStatus":1,"CreatedDate":"2023-06-17T06:20:12.823","CreatedBy":0,"ModifiedDate":"2023-07-03T23:29:20.043","ModifiedBy":0}', N'Update', N'3', CAST(N'2023-07-03T23:29:20.043' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (60, 0, NULL, N'{"IncidentId":"MOBI-202307201545456770","IncidentCategoryId":13,"PriorityId":2,"IncidentDescription":"test333","IncidentImagePath":"\\IMS\\20Jul2023\\IncidentImage\\d04874b0-6d7e-43ab-b05d-95ae8a49645c.png","IncidentVideoPath":"","IncidentAudioPath":"","DirectionId":1,"ChainageNumber":232.900,"Latitude":0.000000,"Longitude":0.000000,"VehiclePlateNumber":"","VehicleClassId":0,"SourceSystemId":7,"EquipmentId":17,"NearByVMSId":0,"NearByPTZId":7,"IncidentGeneratedByTypeId":3,"IncidentGeneratedById":0,"AssignedTo":2,"ProcessPercentage":0.00,"IncidentStatusId":4,"CreatedDate":"2023-07-20T15:43:22.280","CreatedBy":0,"ModifiedDate":"2023-07-20T15:45:45.690","ModifiedBy":0,"DataSendStatus":false,"MediaSendStatus":false}', N'Insert', N'26', CAST(N'2023-07-20T15:43:22.280' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (62, 0, NULL, NULL, N'VIDS- Modified', N'9', CAST(N'2022-07-26T11:30:00.000' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (72, 0, NULL, NULL, N'VIDS- Modified', N'30', CAST(N'2023-07-28T15:35:43.400' AS DateTime))
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
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (61, 0, NULL, N'{"IncidentId":"TMCS-202307201622512330","IncidentCategoryId":6,"PriorityId":1,"IncidentDescription":"test","IncidentImagePath":"\\IMS\\19Jul2023\\IncidentImage\\c60c1634-1aff-4540-b4cd-5d972bd96d2e.jpeg","IncidentVideoPath":"","IncidentAudioPath":"","DirectionId":1,"ChainageNumber":213.500,"Latitude":0.000000,"Longitude":0.000000,"VehiclePlateNumber":"DL7CS7898","VehicleClassId":1,"SourceSystemId":3,"EquipmentId":7,"NearByVMSId":0,"NearByPTZId":0,"IncidentGeneratedByTypeId":3,"IncidentGeneratedById":0,"AssignedTo":2,"ProcessPercentage":0.00,"IncidentStatusId":4,"CreatedDate":"2023-07-20T13:27:10.990","CreatedBy":0,"ModifiedDate":"2023-07-20T13:29:34.580","ModifiedBy":0,"DataSendStatus":false,"MediaSendStatus":false},{"IncidentId":"TMCS-202307201622512330","IncidentCategoryId":0,"PriorityId":0,"IncidentDescription":"","IncidentImagePath":"","IncidentVideoPath":"","IncidentAudioPath":"","DirectionId":0,"ChainageNumber":0.000,"Latitude":0.000000,"Longitude":0.000000,"VehiclePlateNumber":"","VehicleClassId":0,"SourceSystemId":0,"EquipmentId":0,"NearByVMSId":0,"NearByPTZId":48,"IncidentGeneratedByTypeId":0,"IncidentGeneratedById":0,"AssignedTo":0,"ProcessPercentage":0.00,"IncidentStatusId":0,"CreatedDate":"2023-07-20T18:12:38.370","CreatedBy":0,"ModifiedDate":"2023-07-20T18:15:01.733","ModifiedBy":0,"DataSendStatus":false,"MediaSendStatus":false}', N'Insert', N'26', CAST(N'2023-07-20T18:12:38.370' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (68, 0, NULL, NULL, N'VIDS- Created', N'29', CAST(N'2023-07-26T17:14:48.157' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([ActivityId], [UserId], [PrevColumn], [CurrentColumn], [ActionId], [MenuId], [CreatedDate]) VALUES (73, 0, NULL, NULL, N'VIDS- Modified', N'30', CAST(N'2023-07-30T15:40:01.797' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[tbl_ActivityLog] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_ControlRoomMaster] ON 
GO
INSERT [dbo].[tbl_ControlRoomMaster] ([ControlRoomId], [ControlRoomName], [ChainageNumber], [Latitude], [Longitude], [DirectionId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (1, N'CR-1', CAST(1.000 AS Decimal(16, 3)), CAST(0.000000 AS Decimal(8, 6)), CAST(0.000000 AS Decimal(9, 6)), 1, 1, CAST(N'2023-06-17T06:20:12.823' AS DateTime), 0, CAST(N'2023-07-03T23:29:20.043' AS DateTime), 0)
GO
INSERT [dbo].[tbl_ControlRoomMaster] ([ControlRoomId], [ControlRoomName], [ChainageNumber], [Latitude], [Longitude], [DirectionId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (2, N'CR2', NULL, NULL, NULL, NULL, 1, CAST(N'2023-06-19T23:15:11.700' AS DateTime), 0, CAST(N'2023-06-19T23:15:11.717' AS DateTime), 0)
GO
SET IDENTITY_INSERT [dbo].[tbl_ControlRoomMaster] OFF
GO
INSERT [dbo].[tbl_EquipmentConfig] ([SystemId], [EquipmentTypeId], [EquipmentId], [ParentId], [PositionId], [OrderBy], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (6, 28, 12, 0, 0, 1, 1, CAST(N'2023-07-26T17:14:51.753' AS DateTime), 0, CAST(N'2023-07-26T17:14:51.753' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentConfig] ([SystemId], [EquipmentTypeId], [EquipmentId], [ParentId], [PositionId], [OrderBy], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (6, 25, 11, 12, 1, 2, 1, CAST(N'2023-07-26T17:14:51.753' AS DateTime), 0, CAST(N'2023-07-26T17:14:51.753' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentConfig] ([SystemId], [EquipmentTypeId], [EquipmentId], [ParentId], [PositionId], [OrderBy], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (6, 28, 14, 0, 0, 3, 1, CAST(N'2023-07-26T17:14:51.753' AS DateTime), 0, CAST(N'2023-07-26T17:14:51.753' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentConfig] ([SystemId], [EquipmentTypeId], [EquipmentId], [ParentId], [PositionId], [OrderBy], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (6, 25, 13, 14, 1, 4, 1, CAST(N'2023-07-26T17:14:51.753' AS DateTime), 0, CAST(N'2023-07-26T17:14:51.753' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentConfig] ([SystemId], [EquipmentTypeId], [EquipmentId], [ParentId], [PositionId], [OrderBy], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (6, 28, 16, 0, 0, 5, 1, CAST(N'2023-07-26T17:14:51.753' AS DateTime), 0, CAST(N'2023-07-26T17:14:51.753' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentConfig] ([SystemId], [EquipmentTypeId], [EquipmentId], [ParentId], [PositionId], [OrderBy], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (6, 25, 15, 16, 1, 6, 1, CAST(N'2023-07-26T17:14:51.753' AS DateTime), 0, CAST(N'2023-07-26T17:14:51.753' AS DateTime), 0)
GO
SET IDENTITY_INSERT [dbo].[tbl_EquipmentDetails] ON 
GO
INSERT [dbo].[tbl_EquipmentDetails] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (1, 1, 35, 16, N'Firewall / Router', 0, NULL, N'172.16.8.1', 80, N'Admin', N'dZ!kp5Gc', CAST(232.600 AS Decimal(16, 3)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2023-06-19T22:52:27.450' AS DateTime), 0, CAST(N'2023-06-19T22:52:27.450' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentDetails] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (2, 1, 17, 16, N'Fiber Swltch', 0, NULL, N'172.16.8.3', 80, N'Admin', N'dZ!kp5Gc', CAST(232.600 AS Decimal(16, 3)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2023-06-19T22:52:27.450' AS DateTime), 0, CAST(N'2023-06-19T22:52:27.450' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentDetails] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (3, 1, 17, 16, N'Copper Switch', 0, NULL, N'172.16.8.4', 80, N'Admin', N'dZ!kp5Gc', CAST(232.600 AS Decimal(16, 3)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2023-06-19T22:52:27.450' AS DateTime), 0, CAST(N'2023-06-19T22:52:27.450' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentDetails] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (4, 1, 34, 16, N'NVR', 0, NULL, N'172.16.8.6', 80, N'Admin', N'dZ!kp5Gc', CAST(232.600 AS Decimal(16, 3)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2023-06-19T22:52:27.450' AS DateTime), 0, CAST(N'2023-06-19T22:52:27.450' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentDetails] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (5, 1, 13, 16, N'PTZ Joystick', 0, NULL, N'172.16.8.7', 80, N'Admin', N'dZ!kp5Gc', CAST(232.600 AS Decimal(16, 3)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2023-06-19T22:52:27.450' AS DateTime), 0, CAST(N'2023-06-19T22:52:27.450' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentDetails] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (6, 1, 33, 16, N'Printer', 0, NULL, N'172.16.8.9', 80, N'Admin', N'dZ!kp5Gc', CAST(232.600 AS Decimal(16, 3)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2023-06-19T22:52:27.450' AS DateTime), 0, CAST(N'2023-06-19T22:52:27.450' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentDetails] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (7, 1, 1, 5, N'PTZ Camera1', 0, NULL, N'172.16.8.11', 80, N'Admin', N'dZ!kp5Gc', CAST(213.500 AS Decimal(16, 3)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2023-06-19T22:52:27.450' AS DateTime), 0, CAST(N'2023-06-19T22:52:27.450' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentDetails] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (8, 1, 28, 5, N'Managed Switch (PTZ Cameral)', 0, NULL, N'172.16.8.12', 80, N'Admin', N'dZ!kp5Gc', CAST(213.500 AS Decimal(16, 3)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2023-06-19T22:52:27.450' AS DateTime), 0, CAST(N'2023-06-19T22:52:27.450' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentDetails] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (9, 1, 1, 5, N'PTZ Camera2', 0, NULL, N'172.16.8.13', 80, N'Admin', N'dZ!kp5Gc', CAST(258.920 AS Decimal(16, 3)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2023-06-19T22:52:27.450' AS DateTime), 0, CAST(N'2023-06-19T22:52:27.450' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentDetails] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (10, 1, 28, 5, N'Managed Switch (PTZ Camera2)', 0, NULL, N'172.16.8.14', 80, N'Admin', N'dZ!kp5Gc', CAST(258.920 AS Decimal(16, 3)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2023-06-19T22:52:27.450' AS DateTime), 0, CAST(N'2023-06-19T22:52:27.450' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentDetails] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (11, 3, 25, 6, N'VIDS Camera1', 0, NULL, N'172.16.8.21', 80, N'Admin', N'dZ!kp5Gc', CAST(212.300 AS Decimal(16, 3)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2023-06-19T22:52:27.450' AS DateTime), 0, CAST(N'2023-06-19T22:52:27.450' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentDetails] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (12, 3, 28, 6, N'Managed Switch (VIDS Camera1)', 0, NULL, N'172.16.8.22', 80, N'Admin', N'dZ!kp5Gc', CAST(212.300 AS Decimal(16, 3)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2023-06-19T22:52:27.450' AS DateTime), 0, CAST(N'2023-06-19T22:52:27.450' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentDetails] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (13, 3, 25, 6, N'VIDS Camera2', 0, NULL, N'172.16.8.23', 80, N'Admin', N'dZ!kp5Gc', CAST(242.450 AS Decimal(16, 3)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2023-06-19T22:52:27.450' AS DateTime), 0, CAST(N'2023-06-19T22:52:27.450' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentDetails] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (14, 3, 28, 6, N'Managed Switch (VIDS Camera2)', 0, NULL, N'172.16.8.24', 80, N'Admin', N'dZ!kp5Gc', CAST(242.450 AS Decimal(16, 3)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2023-06-19T22:52:27.450' AS DateTime), 0, CAST(N'2023-06-19T22:52:27.450' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentDetails] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (15, 3, 25, 6, N'VIDS Camera3', 0, NULL, N'172.16.8.25', 80, N'Admin', N'dZ!kp5Gc', CAST(265.300 AS Decimal(16, 3)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2023-06-19T22:52:27.450' AS DateTime), 0, CAST(N'2023-06-19T22:52:27.450' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentDetails] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (16, 3, 28, 6, N'Managed Switch (VIDS Camera3)', 0, NULL, N'172.16.8.26', 80, N'Admin', N'dZ!kp5Gc', CAST(265.300 AS Decimal(16, 3)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2023-06-19T22:52:27.450' AS DateTime), 0, CAST(N'2023-06-19T22:52:27.450' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentDetails] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (17, 1, 32, 2, N'ATCC Camera1', 0, NULL, N'172.16.8.31', 80, N'Admin', N'dZ!kp5Gc', CAST(232.900 AS Decimal(16, 3)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2023-06-19T22:52:27.450' AS DateTime), 0, CAST(N'2023-06-19T22:52:27.450' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentDetails] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (18, 1, 28, 2, N'Managed Switch (ATCC Camera1 & Camera2)', 0, NULL, N'172.16.8.32', 80, N'Admin', N'dZ!kp5Gc', CAST(232.900 AS Decimal(16, 3)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2023-06-19T22:52:27.450' AS DateTime), 0, CAST(N'2023-06-19T22:52:27.450' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentDetails] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (19, 1, 32, 2, N'ATCC Camera2', 0, NULL, N'172.16.8.33', 80, N'Admin', N'dZ!kp5Gc', CAST(232.900 AS Decimal(16, 3)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2023-06-19T22:52:27.450' AS DateTime), 0, CAST(N'2023-06-19T22:52:27.450' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentDetails] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (20, 1, 8, 7, N'VMS1', 0, NULL, N'172.16.8.41', 80, N'Admin', N'dZ!kp5Gc', CAST(212.800 AS Decimal(16, 3)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2023-06-19T22:52:27.450' AS DateTime), 0, CAST(N'2023-06-19T22:52:27.450' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentDetails] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (21, 1, 28, 7, N'Managed Switch (VMS1)', 0, NULL, N'172.16.8.42', 80, N'Admin', N'dZ!kp5Gc', CAST(212.800 AS Decimal(16, 3)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2023-06-19T22:52:27.450' AS DateTime), 0, CAST(N'2023-06-19T22:52:27.450' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentDetails] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (22, 1, 8, 7, N'VMS2', 0, NULL, N'172.16.8.43', 80, N'Admin', N'dZ!kp5Gc', CAST(225.800 AS Decimal(16, 3)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2023-06-19T22:52:27.450' AS DateTime), 0, CAST(N'2023-06-19T22:52:27.450' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentDetails] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (23, 1, 28, 7, N'Managed Switch (VMS2)', 0, NULL, N'172.16.8.44', 80, N'Admin', N'dZ!kp5Gc', CAST(225.800 AS Decimal(16, 3)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2023-06-19T22:52:27.450' AS DateTime), 0, CAST(N'2023-06-19T22:52:27.450' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentDetails] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (24, 1, 8, 7, N'VMS3', 0, NULL, N'172.16.8.45', 80, N'Admin', N'dZ!kp5Gc', CAST(232.070 AS Decimal(16, 3)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2023-06-19T22:52:27.450' AS DateTime), 0, CAST(N'2023-06-19T22:52:27.450' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentDetails] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (25, 1, 28, 7, N'Managed Switch (VMS3)', 0, NULL, N'172.16.8.46', 80, N'Admin', N'dZ!kp5Gc', CAST(232.070 AS Decimal(16, 3)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2023-06-19T22:52:27.450' AS DateTime), 0, CAST(N'2023-06-19T22:52:27.450' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentDetails] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (26, 1, 8, 7, N'VMS4', 0, NULL, N'172.16.8.47', 80, N'Admin', N'dZ!kp5Gc', CAST(233.130 AS Decimal(16, 3)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2023-06-19T22:52:27.450' AS DateTime), 0, CAST(N'2023-06-19T22:52:27.450' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentDetails] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (27, 1, 28, 7, N'Managed Switch (VMS4)', 0, NULL, N'172.16.8.48', 80, N'Admin', N'dZ!kp5Gc', CAST(233.130 AS Decimal(16, 3)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2023-06-19T22:52:27.450' AS DateTime), 0, CAST(N'2023-06-19T22:52:27.450' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentDetails] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (28, 1, 8, 7, N'VMS5', 0, NULL, N'172.16.8.49', 80, N'Admin', N'dZ!kp5Gc', CAST(241.700 AS Decimal(16, 3)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2023-06-19T22:52:27.450' AS DateTime), 0, CAST(N'2023-06-19T22:52:27.450' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentDetails] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (29, 1, 28, 7, N'Managed Switch (VMSS)', 0, NULL, N'172.16.8.50', 80, N'Admin', N'dZ!kp5Gc', CAST(241.700 AS Decimal(16, 3)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2023-06-19T22:52:27.450' AS DateTime), 0, CAST(N'2023-06-19T22:52:27.450' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentDetails] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (30, 1, 8, 7, N'VMS6', 0, NULL, N'172.16.8.51', 80, N'Admin', N'dZ!kp5Gc', CAST(242.600 AS Decimal(16, 3)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2023-06-19T22:52:27.450' AS DateTime), 0, CAST(N'2023-06-19T22:52:27.450' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentDetails] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (31, 1, 28, 7, N'Managed Switch (VMS6)', 0, NULL, N'172.16.8.52', 80, N'Admin', N'dZ!kp5Gc', CAST(242.600 AS Decimal(16, 3)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2023-06-19T22:52:27.450' AS DateTime), 0, CAST(N'2023-06-19T22:52:27.450' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentDetails] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (32, 1, 8, 7, N'VMS7', 0, NULL, N'172.16.8.53', 80, N'Admin', N'dZ!kp5Gc', CAST(258.600 AS Decimal(16, 3)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2023-06-19T22:52:27.450' AS DateTime), 0, CAST(N'2023-06-19T22:52:27.450' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentDetails] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (33, 1, 28, 7, N'Managed Switch (VMS7)', 0, NULL, N'172.16.8.54', 80, N'Admin', N'dZ!kp5Gc', CAST(258.600 AS Decimal(16, 3)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2023-06-19T22:52:27.450' AS DateTime), 0, CAST(N'2023-06-19T22:52:27.450' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentDetails] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (34, 1, 8, 7, N'VMS8', 0, NULL, N'172.16.8.55', 80, N'Admin', N'dZ!kp5Gc', CAST(258.790 AS Decimal(16, 3)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2023-06-19T22:52:27.450' AS DateTime), 0, CAST(N'2023-06-19T22:52:27.450' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentDetails] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (35, 1, 28, 7, N'Managed Switch (VMS8)', 0, NULL, N'172.16.8.56', 80, N'Admin', N'dZ!kp5Gc', CAST(258.790 AS Decimal(16, 3)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2023-06-19T22:52:27.450' AS DateTime), 0, CAST(N'2023-06-19T22:52:27.450' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentDetails] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (36, 1, 8, 7, N'VMS9', 0, NULL, N'172.16.8.57', 80, N'Admin', N'dZ!kp5Gc', CAST(265.500 AS Decimal(16, 3)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2023-06-19T22:52:27.450' AS DateTime), 0, CAST(N'2023-06-19T22:52:27.450' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentDetails] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (37, 1, 28, 7, N'Managed Switch (VMS9)', 0, NULL, N'172.16.8.58', 80, N'Admin', N'dZ!kp5Gc', CAST(265.500 AS Decimal(16, 3)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2023-06-19T22:52:27.450' AS DateTime), 0, CAST(N'2023-06-19T22:52:27.450' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentDetails] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (38, 1, 4, 9, N'MET1', 0, NULL, N'172.16.8.61', 80, N'Admin', N'dZ!kp5Gc', CAST(232.600 AS Decimal(16, 3)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2023-06-19T22:52:27.450' AS DateTime), 0, CAST(N'2023-06-19T22:52:27.450' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentDetails] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (39, 1, 28, 9, N'Managed Switch (MET1)', 0, NULL, N'172.16.8.62', 80, N'Admin', N'dZ!kp5Gc', CAST(232.600 AS Decimal(16, 3)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2023-06-19T22:52:27.450' AS DateTime), 0, CAST(N'2023-06-19T22:52:27.450' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentDetails] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (40, 1, 31, 17, N'MRCS1', 0, NULL, N'172.16.8.71', 80, N'Admin', N'dZ!kp5Gc', CAST(232.600 AS Decimal(16, 3)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2023-06-19T22:52:27.450' AS DateTime), 0, CAST(N'2023-06-19T22:52:27.450' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentDetails] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (41, 1, 28, 17, N'Managed Switch (MRCS1)', 0, NULL, N'172.16.8.72', 80, N'Admin', N'dZ!kp5Gc', CAST(232.600 AS Decimal(16, 3)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2023-06-19T22:52:27.450' AS DateTime), 0, CAST(N'2023-06-19T22:52:27.450' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentDetails] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (42, 1, 14, 16, N'ATMS Server', 0, NULL, N'172.16.8.201', 80, N'Admin', N'dZ!kp5Gc', CAST(232.600 AS Decimal(16, 3)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2023-06-19T22:52:27.450' AS DateTime), 0, CAST(N'2023-06-19T22:52:27.450' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentDetails] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (43, 1, 14, 16, N'VIDS Server', 0, NULL, N'172.16.8.202', 80, N'Admin', N'dZ!kp5Gc', CAST(232.600 AS Decimal(16, 3)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2023-06-19T22:52:27.450' AS DateTime), 0, CAST(N'2023-06-19T22:52:27.450' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentDetails] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (44, 1, 14, 16, N'ECB Server', 0, NULL, N'172.16.8.203', 80, N'Admin', N'dZ!kp5Gc', CAST(232.600 AS Decimal(16, 3)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2023-06-19T22:52:27.450' AS DateTime), 0, CAST(N'2023-06-19T22:52:27.450' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentDetails] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (45, 1, 16, 16, N'Workstation1', 0, NULL, N'172.16.8.206', 80, N'Admin', N'dZ!kp5Gc', CAST(232.600 AS Decimal(16, 3)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2023-06-19T22:52:27.450' AS DateTime), 0, CAST(N'2023-06-19T22:52:27.450' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentDetails] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (46, 1, 16, 16, N'Workstation2', 0, NULL, N'172.16.8.207', 80, N'Admin', N'dZ!kp5Gc', CAST(232.600 AS Decimal(16, 3)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2023-06-19T22:52:27.450' AS DateTime), 0, CAST(N'2023-06-19T22:52:27.450' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentDetails] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (47, 1, 16, 16, N'Workstation3', 0, NULL, N'172.16.8.208', 80, N'Admin', N'dZ!kp5Gc', CAST(232.600 AS Decimal(16, 3)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2023-06-19T22:52:27.450' AS DateTime), 0, CAST(N'2023-06-19T22:52:27.450' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentDetails] ([EquipmentId], [PackageId], [EquipmentTypeId], [SystemId], [EquipmentName], [DirectionId], [ProtocolTypeId], [IpAddress], [PortNumber], [LoginId], [Password], [ChainageNumber], [Latitude], [Longitude], [MacAddress], [ModelNumber], [SerialNumber], [ManufacturerDetail], [VendorDetail], [ManufacturerDate], [PurchageDate], [WarrantyExpireDate], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (48, 1, 1, 16, N'3', 1, 1, N'192.168.1.1', 80, N'a', N'a', CAST(2.000 AS Decimal(16, 3)), CAST(0.000000 AS Decimal(8, 6)), CAST(1.000000 AS Decimal(9, 6)), N'4', N'5', N'6', N'7', N'8', CAST(N'2023-06-28' AS Date), CAST(N'2023-06-30' AS Date), CAST(N'2023-06-30' AS Date), 0, 1, CAST(N'2023-06-22T08:39:25.650' AS DateTime), 0, CAST(N'2023-06-25T15:07:22.443' AS DateTime), 0)
GO
SET IDENTITY_INSERT [dbo].[tbl_EquipmentDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_EquipmentTypeMaster] ON 
GO
INSERT [dbo].[tbl_EquipmentTypeMaster] ([EquipmentTypeId], [EquipmentTypeName], [EquipmentCategoryTypeId], [EquipmentConnectionTypeId], [EquipmentIconName], [EquipmentLevel], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (1, N'PTZ Camera', 1, 1, NULL, 3, 1, CAST(N'2022-01-14T23:13:24.977' AS DateTime), 0, CAST(N'2022-01-14T23:13:24.977' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentTypeMaster] ([EquipmentTypeId], [EquipmentTypeName], [EquipmentCategoryTypeId], [EquipmentConnectionTypeId], [EquipmentIconName], [EquipmentLevel], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (2, N'ECB', 1, 1, NULL, 3, 0, CAST(N'2022-01-14T23:14:14.230' AS DateTime), 0, CAST(N'2022-01-14T23:14:14.230' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentTypeMaster] ([EquipmentTypeId], [EquipmentTypeName], [EquipmentCategoryTypeId], [EquipmentConnectionTypeId], [EquipmentIconName], [EquipmentLevel], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (3, N'LPU', 1, 1, NULL, 2, 0, CAST(N'2022-01-14T23:14:25.050' AS DateTime), 0, CAST(N'2022-01-14T23:14:25.050' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentTypeMaster] ([EquipmentTypeId], [EquipmentTypeName], [EquipmentCategoryTypeId], [EquipmentConnectionTypeId], [EquipmentIconName], [EquipmentLevel], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (4, N'MET', 1, 1, NULL, 3, 1, CAST(N'2022-01-14T23:14:29.773' AS DateTime), 0, CAST(N'2022-01-14T23:14:29.773' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentTypeMaster] ([EquipmentTypeId], [EquipmentTypeName], [EquipmentCategoryTypeId], [EquipmentConnectionTypeId], [EquipmentIconName], [EquipmentLevel], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (5, N'Radar', 1, 1, NULL, 3, 0, CAST(N'2022-01-14T23:14:40.693' AS DateTime), 0, CAST(N'2022-01-14T23:14:40.693' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentTypeMaster] ([EquipmentTypeId], [EquipmentTypeName], [EquipmentCategoryTypeId], [EquipmentConnectionTypeId], [EquipmentIconName], [EquipmentLevel], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (6, N'Sensor', 1, 1, NULL, 3, 0, CAST(N'2022-01-14T23:14:46.063' AS DateTime), 0, CAST(N'2022-01-14T23:14:46.063' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EquipmentTypeMaster] ([EquipmentTypeId], [EquipmentTypeName], [EquipmentCategoryTypeId], [EquipmentConnectionTypeId], [EquipmentIconName], [EquipmentLevel], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (7, N'Speed Display', 1, 1, NULL, 3, 0, CAST(N'2022-01-14T23:14:51.997' AS DateTime), 0, CAST(N'2022-01-14T23:14:51.997' AS DateTime), 0)
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
INSERT [dbo].[tbl_EquipmentTypeMaster] ([EquipmentTypeId], [EquipmentTypeName], [EquipmentCategoryTypeId], [EquipmentConnectionTypeId], [EquipmentIconName], [EquipmentLevel], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (26, N'ANPR Camera', 1, 1, NULL, 3, 0, CAST(N'2022-04-16T11:36:43.387' AS DateTime), 0, CAST(N'2022-04-16T11:36:43.387' AS DateTime), 0)
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
INSERT [dbo].[tbl_ErrorInfo] ([ErrorNumber], [ErrorSeverity], [ErrorState], [ErrorProcedure], [ErrorLine], [ErrorMessage], [CreatedDate]) VALUES (245, 16, 1, N'USP_EquipmentConfigInsertUpdate', 59, N'Conversion failed when converting the varchar value ''MN7VD8TUAI'' to data type smallint.', CAST(N'2023-07-26T17:09:00.987' AS DateTime))
GO
INSERT [dbo].[tbl_ErrorInfo] ([ErrorNumber], [ErrorSeverity], [ErrorState], [ErrorProcedure], [ErrorLine], [ErrorMessage], [CreatedDate]) VALUES (245, 16, 1, N'USP_EquipmentConfigInsertUpdate', 59, N'Conversion failed when converting the varchar value ''MN7VD8TUAI'' to data type smallint.', CAST(N'2023-07-26T17:10:18.353' AS DateTime))
GO
INSERT [dbo].[tbl_ErrorInfo] ([ErrorNumber], [ErrorSeverity], [ErrorState], [ErrorProcedure], [ErrorLine], [ErrorMessage], [CreatedDate]) VALUES (245, 16, 1, N'USP_EquipmentConfigInsertUpdate', 60, N'Conversion failed when converting the varchar value ''MN7VD8TUAI'' to data type smallint.', CAST(N'2023-07-26T17:10:31.747' AS DateTime))
GO
INSERT [dbo].[tbl_ErrorInfo] ([ErrorNumber], [ErrorSeverity], [ErrorState], [ErrorProcedure], [ErrorLine], [ErrorMessage], [CreatedDate]) VALUES (245, 16, 1, N'USP_EquipmentConfigInsertUpdate', 60, N'Conversion failed when converting the varchar value ''MN7VD8TUAI'' to data type smallint.', CAST(N'2023-07-26T17:10:38.620' AS DateTime))
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
INSERT [dbo].[tbl_IncidentDetailsHistory] ([IncidentId], [IncidentCategoryId], [PriorityId], [IncidentDescription], [IncidentImagePath], [IncidentVideoPath], [IncidentAudioPath], [DirectionId], [ChainageNumber], [Latitude], [Longitude], [VehiclePlateNumber], [VehicleClassId], [SourceSystemId], [EquipmentId], [NearByPTZId], [IncidentGeneratedByTypeId], [IncidentGeneratedById], [AssignedToId], [IncidentCloseImagePath], [IncidentStatusId], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [DataSendStatus], [MediaSendStatus]) VALUES (N'TMCS-202307191622512330', 6, 1, N'test', N'\IMS\19Jul2023\IncidentImage\c60c1634-1aff-4540-b4cd-5d972bd96d2e.jpeg', N'', N'', 1, CAST(213.500 AS Decimal(16, 3)), CAST(0.000000 AS Decimal(8, 6)), CAST(0.000000 AS Decimal(9, 6)), N'DL7CS7898', 1, 3, 7, 0, 3, 0, NULL, NULL, 1, CAST(N'2023-07-19T16:20:29.860' AS DateTime), 0, CAST(N'2023-07-19T16:22:51.250' AS DateTime), 0, 0, 0)
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
SET IDENTITY_INSERT [dbo].[tbl_LogingActivity] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_MenuMaster] ON 
GO
INSERT [dbo].[tbl_MenuMaster] ([MenuId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (1, N'Dashboard', N'dashboard', N'dripicons-home', 1, 1, 0, 0, 1, CAST(N'2021-06-26T13:27:17.443' AS DateTime), 0, CAST(N'2021-06-26T13:27:17.443' AS DateTime), 0)
GO
INSERT [dbo].[tbl_MenuMaster] ([MenuId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (2, N'Config', N'#', N'fa fa-cog', 1, 2, 0, 0, 1, CAST(N'2021-07-08T11:17:45.390' AS DateTime), 0, CAST(N'2021-07-08T11:17:45.390' AS DateTime), 0)
GO
INSERT [dbo].[tbl_MenuMaster] ([MenuId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (3, N'Control Room', N'controlRoom', N'fa fa-compass', 1, 3, 2, 0, 1, CAST(N'2021-06-26T13:47:24.660' AS DateTime), 0, CAST(N'2021-06-26T13:47:24.660' AS DateTime), 0)
GO
INSERT [dbo].[tbl_MenuMaster] ([MenuId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (4, N'Equipment', N'equipment', N'fa fa-laptop', 1, 5, 2, 0, 1, CAST(N'2021-06-26T13:47:24.660' AS DateTime), 0, CAST(N'2021-06-26T13:47:24.660' AS DateTime), 0)
GO
INSERT [dbo].[tbl_MenuMaster] ([MenuId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (5, N'Ganrty', N'gantry', N'pi pi-th-large', 1, 5, 2, 0, 0, CAST(N'2021-06-30T01:35:45.070' AS DateTime), 0, CAST(N'2021-06-30T01:35:45.070' AS DateTime), 0)
GO
INSERT [dbo].[tbl_MenuMaster] ([MenuId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (6, N'Ganrty Mapping', N'gantryMapping', N'pi pi-sitemap', 1, 6, 2, 0, 0, CAST(N'2021-06-30T10:13:50.700' AS DateTime), 0, CAST(N'2021-06-30T10:13:50.700' AS DateTime), 0)
GO
INSERT [dbo].[tbl_MenuMaster] ([MenuId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (7, N'Package', N'package', N'fa fa-road', 1, 4, 2, 0, 1, CAST(N'2021-06-30T12:40:36.387' AS DateTime), 0, CAST(N'2021-06-30T12:40:36.387' AS DateTime), 0)
GO
INSERT [dbo].[tbl_MenuMaster] ([MenuId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (8, N'Vehicle Class', N'vehicleClass', N'fa fa-taxi', 1, 8, 2, 0, 1, CAST(N'2021-06-30T23:01:22.760' AS DateTime), 0, CAST(N'2021-06-30T23:01:22.760' AS DateTime), 0)
GO
INSERT [dbo].[tbl_MenuMaster] ([MenuId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (9, N'Roles', N'role', N'fa fa-universal-access', 1, 9, 2, 0, 1, CAST(N'2021-07-01T17:59:14.647' AS DateTime), 0, CAST(N'2021-07-01T17:59:14.647' AS DateTime), 0)
GO
INSERT [dbo].[tbl_MenuMaster] ([MenuId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (10, N'Users', N'users', N'fa fa-user', 1, 10, 2, 0, 1, CAST(N'2021-07-01T17:59:32.610' AS DateTime), 0, CAST(N'2021-07-01T17:59:32.610' AS DateTime), 0)
GO
INSERT [dbo].[tbl_MenuMaster] ([MenuId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (11, N'Data Acquisition', N'#', N'fa fa-database', 1, 11, 0, 0, 1, CAST(N'2021-07-08T11:17:49.470' AS DateTime), 0, CAST(N'2021-07-08T11:17:49.470' AS DateTime), 0)
GO
INSERT [dbo].[tbl_MenuMaster] ([MenuId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (12, N'ADAS', N'adas', N'fa fa-tablet', 1, 12, 11, 0, 0, CAST(N'2021-07-08T11:05:53.747' AS DateTime), 0, CAST(N'2021-07-08T11:05:53.747' AS DateTime), 0)
GO
INSERT [dbo].[tbl_MenuMaster] ([MenuId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (13, N'ATCC', N'atcc', N'fa fa-car', 1, 13, 11, 0, 1, CAST(N'2021-07-04T16:37:17.857' AS DateTime), 0, CAST(N'2021-07-04T16:37:17.857' AS DateTime), 0)
GO
INSERT [dbo].[tbl_MenuMaster] ([MenuId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (14, N'ATSC', N'atsc', N'fa fa-lightbulb-o', 1, 14, 11, 0, 0, CAST(N'2021-07-08T11:08:10.570' AS DateTime), 0, CAST(N'2021-07-08T11:08:10.570' AS DateTime), 0)
GO
INSERT [dbo].[tbl_MenuMaster] ([MenuId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (15, N'ECB', N'ecb', N'fa fa-phone-square', 1, 15, 11, 0, 0, CAST(N'2021-07-03T15:41:28.533' AS DateTime), 0, CAST(N'2021-07-03T15:41:28.533' AS DateTime), 0)
GO
INSERT [dbo].[tbl_MenuMaster] ([MenuId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (16, N'MET', N'met', N'fa fa-cloud', 1, 16, 11, 0, 1, CAST(N'2021-07-02T17:00:07.010' AS DateTime), 0, CAST(N'2021-07-02T17:00:07.010' AS DateTime), 0)
GO
INSERT [dbo].[tbl_MenuMaster] ([MenuId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (17, N'TMCS', N'tmcs', N'fa fa-camera', 1, 17, 11, 0, 0, CAST(N'2021-07-08T11:05:45.300' AS DateTime), 0, CAST(N'2021-07-08T11:05:45.300' AS DateTime), 0)
GO
INSERT [dbo].[tbl_MenuMaster] ([MenuId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (18, N'VMS', N'vms', N'fa fa-desktop', 1, 18, 11, 0, 1, CAST(N'2021-07-01T23:29:39.947' AS DateTime), 0, CAST(N'2021-07-01T23:29:39.947' AS DateTime), 0)
GO
INSERT [dbo].[tbl_MenuMaster] ([MenuId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (19, N'VIDS', N'vids', N'ti-video-camera', 1, 19, 11, 0, 0, CAST(N'2021-07-04T15:45:39.013' AS DateTime), 0, CAST(N'2021-07-04T15:45:39.013' AS DateTime), 0)
GO
INSERT [dbo].[tbl_MenuMaster] ([MenuId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (20, N'VSDS', N'vsds', N'fa fa-wifi', 1, 20, 11, 0, 0, CAST(N'2021-07-08T11:05:09.717' AS DateTime), 0, CAST(N'2021-07-08T11:05:09.717' AS DateTime), 0)
GO
INSERT [dbo].[tbl_MenuMaster] ([MenuId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (21, N'SSVDS', N'ssvds', N'pi pi-video', 1, 21, 11, 0, 0, CAST(N'2021-07-08T11:09:00.770' AS DateTime), 0, CAST(N'2021-07-08T11:09:00.770' AS DateTime), 0)
GO
INSERT [dbo].[tbl_MenuMaster] ([MenuId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (22, N'Incident', N'incidents', N'fa fa-bug', 1, 22, 11, 0, 0, CAST(N'2021-07-08T11:06:01.840' AS DateTime), 0, CAST(N'2021-07-08T11:06:01.840' AS DateTime), 0)
GO
INSERT [dbo].[tbl_MenuMaster] ([MenuId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (23, N'FMS', N'fms', N'fa fa-battery-quarter', 1, 23, 0, 0, 0, CAST(N'2021-07-08T11:17:49.470' AS DateTime), 0, CAST(N'2021-07-08T11:17:49.470' AS DateTime), 0)
GO
INSERT [dbo].[tbl_MenuMaster] ([MenuId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (24, N'Reporting', N'reports', N'fa fa-file', 1, 25, 0, 0, 1, CAST(N'2021-07-08T16:50:02.003' AS DateTime), 0, CAST(N'2021-07-08T16:50:02.003' AS DateTime), 0)
GO
INSERT [dbo].[tbl_MenuMaster] ([MenuId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (25, N'IMS', N'#', N'fa fa-exclamation-triangle', 1, 24, 0, 0, 1, CAST(N'2023-06-25T18:46:34.040' AS DateTime), 0, CAST(N'2023-06-25T18:46:34.040' AS DateTime), 0)
GO
INSERT [dbo].[tbl_MenuMaster] ([MenuId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (26, N'Pending', N'pendigIncident', N'fa fa-list-alt', 1, 25, 25, 0, 1, CAST(N'2023-06-25T18:48:43.343' AS DateTime), 0, CAST(N'2023-06-25T18:48:43.343' AS DateTime), 0)
GO
INSERT [dbo].[tbl_MenuMaster] ([MenuId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (27, N'Close', N'closeIncident', N'fa fa-check-square', 1, 26, 25, 0, 1, CAST(N'2023-06-25T18:50:11.367' AS DateTime), 0, CAST(N'2023-06-25T18:50:11.367' AS DateTime), 0)
GO
INSERT [dbo].[tbl_MenuMaster] ([MenuId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (28, N'VIDS', N'#', N'ti-video-camera', 1, 27, 0, 6, 1, CAST(N'2023-07-24T11:07:04.287' AS DateTime), 0, CAST(N'2023-07-24T11:07:04.287' AS DateTime), 0)
GO
INSERT [dbo].[tbl_MenuMaster] ([MenuId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (29, N'Equipment Config', N'vidsEquipmentConfig', N'mdi mdi-monitor-dashboard', 1, 28, 28, 6, 1, CAST(N'2023-07-24T11:08:33.750' AS DateTime), 0, CAST(N'2023-07-24T11:08:33.750' AS DateTime), 0)
GO
INSERT [dbo].[tbl_MenuMaster] ([MenuId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (30, N'Event Config', N'vidsEventConfig', N'mdi mdi-file-cog-outline', 1, 29, 28, 6, 1, CAST(N'2023-07-24T11:11:04.580' AS DateTime), 0, CAST(N'2023-07-24T11:11:04.580' AS DateTime), 0)
GO
INSERT [dbo].[tbl_MenuMaster] ([MenuId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (31, N'Event History', N'vidsEventHistroy', N'mdi mdi-database-clock', 1, 30, 28, 6, 1, CAST(N'2023-07-24T11:11:04.580' AS DateTime), 0, CAST(N'2023-07-24T11:11:04.580' AS DateTime), 0)
GO
INSERT [dbo].[tbl_MenuMaster] ([MenuId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (32, N'Un audited', N'vidsValidation', N'mdi mdi-file-clock-outline', 1, 31, 28, 6, 1, CAST(N'2023-07-24T11:19:06.777' AS DateTime), 0, CAST(N'2023-07-24T11:19:06.777' AS DateTime), 0)
GO
INSERT [dbo].[tbl_MenuMaster] ([MenuId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (33, N'Audited', N'vidsValidated', N'mdi mdi-file-check-outline', 1, 32, 28, 6, 1, CAST(N'2023-07-24T11:19:11.573' AS DateTime), 0, CAST(N'2023-07-24T11:19:11.573' AS DateTime), 0)
GO
SET IDENTITY_INSERT [dbo].[tbl_MenuMaster] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_PackageDetails] ON 
GO
INSERT [dbo].[tbl_PackageDetails] ([PackageId], [ControlRoomId], [PackageName], [StartChainageNumber], [EndChainageNumber], [StartLatitude], [StartLongitude], [EndLatitude], [EndLongitude], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (1, 1, N'PKG-1', CAST(0.000 AS Decimal(16, 3)), CAST(100.000 AS Decimal(16, 3)), CAST(0.000000 AS Decimal(8, 6)), CAST(0.000000 AS Decimal(9, 6)), CAST(0.000000 AS Decimal(8, 6)), CAST(0.000000 AS Decimal(9, 6)), 1, CAST(N'2023-06-20T15:51:12.060' AS DateTime), 0, CAST(N'2023-06-24T13:01:57.797' AS DateTime), 0)
GO
INSERT [dbo].[tbl_PackageDetails] ([PackageId], [ControlRoomId], [PackageName], [StartChainageNumber], [EndChainageNumber], [StartLatitude], [StartLongitude], [EndLatitude], [EndLongitude], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (2, 1, N'PKG-2', CAST(100.001 AS Decimal(16, 3)), CAST(200.000 AS Decimal(16, 3)), CAST(0.000000 AS Decimal(8, 6)), CAST(0.000000 AS Decimal(9, 6)), CAST(0.000000 AS Decimal(8, 6)), CAST(0.000000 AS Decimal(9, 6)), 1, CAST(N'2023-06-20T15:51:12.060' AS DateTime), 0, CAST(N'2023-06-24T13:01:57.797' AS DateTime), 0)
GO
INSERT [dbo].[tbl_PackageDetails] ([PackageId], [ControlRoomId], [PackageName], [StartChainageNumber], [EndChainageNumber], [StartLatitude], [StartLongitude], [EndLatitude], [EndLongitude], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (3, 1, N'PKG-3', CAST(200.001 AS Decimal(16, 3)), CAST(300.000 AS Decimal(16, 3)), CAST(0.000000 AS Decimal(8, 6)), CAST(0.000000 AS Decimal(9, 6)), CAST(0.000000 AS Decimal(8, 6)), CAST(0.000000 AS Decimal(9, 6)), 1, CAST(N'2023-06-20T15:51:12.060' AS DateTime), 0, CAST(N'2023-06-24T13:01:57.797' AS DateTime), 0)
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
SET IDENTITY_INSERT [dbo].[tbl_RoleMaster] OFF
GO
INSERT [dbo].[tbl_RolePermission] ([RoleId], [MenuId], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (2, 1, 1, 0, 0, 1, CAST(N'2023-06-17T05:50:40.283' AS DateTime), 0, CAST(N'2023-06-17T05:50:40.283' AS DateTime), 0)
GO
INSERT [dbo].[tbl_RolePermission] ([RoleId], [MenuId], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (2, 2, 1, 1, 1, 1, CAST(N'2023-06-17T05:50:40.283' AS DateTime), 0, CAST(N'2023-06-17T05:50:40.283' AS DateTime), 0)
GO
INSERT [dbo].[tbl_RolePermission] ([RoleId], [MenuId], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (2, 3, 1, 1, 1, 1, CAST(N'2023-06-17T05:50:40.283' AS DateTime), 0, CAST(N'2023-06-17T05:50:40.283' AS DateTime), 0)
GO
INSERT [dbo].[tbl_RolePermission] ([RoleId], [MenuId], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (2, 4, 0, 0, 0, 1, CAST(N'2023-06-17T05:50:40.283' AS DateTime), 0, CAST(N'2023-06-17T05:50:40.283' AS DateTime), 0)
GO
INSERT [dbo].[tbl_RolePermission] ([RoleId], [MenuId], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (2, 8, 1, 0, 0, 1, CAST(N'2023-06-17T05:50:40.283' AS DateTime), 0, CAST(N'2023-06-17T05:50:40.283' AS DateTime), 0)
GO
INSERT [dbo].[tbl_RolePermission] ([RoleId], [MenuId], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (2, 9, 1, 0, 0, 1, CAST(N'2023-06-17T05:50:40.283' AS DateTime), 0, CAST(N'2023-06-17T05:50:40.283' AS DateTime), 0)
GO
INSERT [dbo].[tbl_RolePermission] ([RoleId], [MenuId], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (2, 10, 1, 0, 0, 1, CAST(N'2023-06-17T05:50:40.283' AS DateTime), 0, CAST(N'2023-06-17T05:50:40.283' AS DateTime), 0)
GO
INSERT [dbo].[tbl_RolePermission] ([RoleId], [MenuId], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (2, 11, 1, 0, 0, 1, CAST(N'2023-06-17T05:50:40.283' AS DateTime), 0, CAST(N'2023-06-17T05:50:40.283' AS DateTime), 0)
GO
INSERT [dbo].[tbl_RolePermission] ([RoleId], [MenuId], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (2, 13, 1, 0, 0, 1, CAST(N'2023-06-17T05:50:40.283' AS DateTime), 0, CAST(N'2023-06-17T05:50:40.283' AS DateTime), 0)
GO
INSERT [dbo].[tbl_RolePermission] ([RoleId], [MenuId], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (2, 15, 1, 0, 0, 1, CAST(N'2023-06-17T05:50:40.283' AS DateTime), 0, CAST(N'2023-06-17T05:50:40.283' AS DateTime), 0)
GO
INSERT [dbo].[tbl_RolePermission] ([RoleId], [MenuId], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (2, 16, 1, 0, 0, 1, CAST(N'2023-06-17T05:50:40.283' AS DateTime), 0, CAST(N'2023-06-17T05:50:40.283' AS DateTime), 0)
GO
INSERT [dbo].[tbl_RolePermission] ([RoleId], [MenuId], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (2, 17, 1, 0, 0, 1, CAST(N'2023-06-17T05:50:40.283' AS DateTime), 0, CAST(N'2023-06-17T05:50:40.283' AS DateTime), 0)
GO
INSERT [dbo].[tbl_RolePermission] ([RoleId], [MenuId], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (2, 18, 1, 0, 0, 1, CAST(N'2023-06-17T05:50:40.283' AS DateTime), 0, CAST(N'2023-06-17T05:50:40.283' AS DateTime), 0)
GO
INSERT [dbo].[tbl_RolePermission] ([RoleId], [MenuId], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (2, 19, 1, 0, 0, 1, CAST(N'2023-06-17T05:50:40.283' AS DateTime), 0, CAST(N'2023-06-17T05:50:40.283' AS DateTime), 0)
GO
INSERT [dbo].[tbl_RolePermission] ([RoleId], [MenuId], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (2, 22, 1, 0, 0, 1, CAST(N'2023-06-17T05:50:40.283' AS DateTime), 0, CAST(N'2023-06-17T05:50:40.283' AS DateTime), 0)
GO
INSERT [dbo].[tbl_RolePermission] ([RoleId], [MenuId], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (2, 24, 1, 0, 0, 1, CAST(N'2023-06-17T05:50:40.283' AS DateTime), 0, CAST(N'2023-06-17T05:50:40.283' AS DateTime), 0)
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
SET IDENTITY_INSERT [dbo].[tbl_SystemMaster] ON 
GO
INSERT [dbo].[tbl_SystemMaster] ([SystemId], [SystemName], [SystemDescription], [AppPort], [ApiPort], [SystemImage], [SystemIcon], [DashBoard], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (1, N'ADAS', N'Advance Driver Advisory System', 3039, 3019, N'ADAS.jpg', N'fas fa-truck-pickup', 0, 0, CAST(N'2022-01-14T23:01:30.817' AS DateTime), 0, CAST(N'2022-01-14T23:01:30.817' AS DateTime), 0)
GO
INSERT [dbo].[tbl_SystemMaster] ([SystemId], [SystemName], [SystemDescription], [AppPort], [ApiPort], [SystemImage], [SystemIcon], [DashBoard], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (2, N'ATCC', N'Automatic Traffic Counter-cum-Classifier', 3031, 3011, N'ATCC.jpg', N'fas fa-car', 1, 1, CAST(N'2022-01-14T23:01:49.837' AS DateTime), 0, CAST(N'2022-01-14T23:01:49.837' AS DateTime), 0)
GO
INSERT [dbo].[tbl_SystemMaster] ([SystemId], [SystemName], [SystemDescription], [AppPort], [ApiPort], [SystemImage], [SystemIcon], [DashBoard], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (3, N'ECS', N'Emergency Calling System', 3034, 3014, N'ECS.jpg', N'fas fa-tty', 1, 1, CAST(N'2022-01-14T23:02:20.130' AS DateTime), 0, CAST(N'2022-01-14T23:02:20.130' AS DateTime), 0)
GO
INSERT [dbo].[tbl_SystemMaster] ([SystemId], [SystemName], [SystemDescription], [AppPort], [ApiPort], [SystemImage], [SystemIcon], [DashBoard], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (4, N'FMS', N'Facility Monitoring System', 3032, 3012, N'NMS.jpg', N'fas fa-network-wired', 0, 0, CAST(N'2022-01-14T23:03:15.580' AS DateTime), 0, CAST(N'2022-01-14T23:03:15.580' AS DateTime), 0)
GO
INSERT [dbo].[tbl_SystemMaster] ([SystemId], [SystemName], [SystemDescription], [AppPort], [ApiPort], [SystemImage], [SystemIcon], [DashBoard], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (5, N'TMCS', N'Traffic Monitor Camera System', 3035, 3015, N'TMCS.jpg', N'pi pi-video', 0, 1, CAST(N'2022-01-14T23:05:25.100' AS DateTime), 0, CAST(N'2022-01-14T23:05:25.100' AS DateTime), 0)
GO
INSERT [dbo].[tbl_SystemMaster] ([SystemId], [SystemName], [SystemDescription], [AppPort], [ApiPort], [SystemImage], [SystemIcon], [DashBoard], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (6, N'VIDS', N'Video Incident Detection System', 3036, 3016, N'VIDS.jpg', N'fas fa-snowplow', 1, 1, CAST(N'2022-01-14T23:05:39.973' AS DateTime), 0, CAST(N'2022-01-14T23:05:39.973' AS DateTime), 0)
GO
INSERT [dbo].[tbl_SystemMaster] ([SystemId], [SystemName], [SystemDescription], [AppPort], [ApiPort], [SystemImage], [SystemIcon], [DashBoard], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (7, N'VMS', N'Variable Message Sign', 3037, 3017, N'VMS.png', N'fa fa-television', 1, 1, CAST(N'2022-01-14T23:05:56.100' AS DateTime), 0, CAST(N'2022-01-14T23:05:56.100' AS DateTime), 0)
GO
INSERT [dbo].[tbl_SystemMaster] ([SystemId], [SystemName], [SystemDescription], [AppPort], [ApiPort], [SystemImage], [SystemIcon], [DashBoard], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (8, N'VSDS', N'Vehicle Speed Detection System', 3038, 3018, N'VSDS.jpg', N'fas fa-video', 0, 0, CAST(N'2022-01-14T23:06:14.370' AS DateTime), 0, CAST(N'2022-01-14T23:06:14.370' AS DateTime), 0)
GO
INSERT [dbo].[tbl_SystemMaster] ([SystemId], [SystemName], [SystemDescription], [AppPort], [ApiPort], [SystemImage], [SystemIcon], [DashBoard], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (9, N'Weather', N'Weather', 3040, 3020, N'MET.jpg', N'fas fa-poo-storm', 1, 1, CAST(N'2022-01-14T23:06:23.450' AS DateTime), 0, CAST(N'2022-01-14T23:06:23.450' AS DateTime), 0)
GO
INSERT [dbo].[tbl_SystemMaster] ([SystemId], [SystemName], [SystemDescription], [AppPort], [ApiPort], [SystemImage], [SystemIcon], [DashBoard], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (10, N'IMS', N'Incident Management System', 3033, 3013, N'IMS.jpg', N'fas fa-car-crash', 1, 1, CAST(N'2022-01-14T23:33:26.807' AS DateTime), 0, CAST(N'2022-01-14T23:33:26.807' AS DateTime), 0)
GO
INSERT [dbo].[tbl_SystemMaster] ([SystemId], [SystemName], [SystemDescription], [AppPort], [ApiPort], [SystemImage], [SystemIcon], [DashBoard], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (11, N'Config', N'Configuration', 3021, 3010, N'Config.jpg', N'fa fa-cog', 0, 0, CAST(N'2022-01-25T11:24:28.827' AS DateTime), 0, CAST(N'2022-01-25T11:24:28.827' AS DateTime), 0)
GO
INSERT [dbo].[tbl_SystemMaster] ([SystemId], [SystemName], [SystemDescription], [AppPort], [ApiPort], [SystemImage], [SystemIcon], [DashBoard], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (12, N'TTMS', N'Time Travel Estimation', 3043, 3023, NULL, N'fas fa-map-marked', 0, 0, CAST(N'2022-03-21T13:07:06.753' AS DateTime), 0, CAST(N'2022-03-21T13:07:06.753' AS DateTime), 0)
GO
INSERT [dbo].[tbl_SystemMaster] ([SystemId], [SystemName], [SystemDescription], [AppPort], [ApiPort], [SystemImage], [SystemIcon], [DashBoard], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (13, N'RMS', N'Report Management System', 3044, NULL, NULL, N'fa fa-files-o', 0, 0, CAST(N'2022-07-04T11:10:53.793' AS DateTime), 0, CAST(N'2022-07-04T11:10:53.793' AS DateTime), 0)
GO
INSERT [dbo].[tbl_SystemMaster] ([SystemId], [SystemName], [SystemDescription], [AppPort], [ApiPort], [SystemImage], [SystemIcon], [DashBoard], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (14, N'NMS', N'Network Management System', 8060, NULL, N'NMS.jpg', N'fas fa-solid fa-network-wired', 0, 0, CAST(N'2022-07-04T11:20:55.147' AS DateTime), 0, CAST(N'2022-07-04T11:20:55.147' AS DateTime), 0)
GO
INSERT [dbo].[tbl_SystemMaster] ([SystemId], [SystemName], [SystemDescription], [AppPort], [ApiPort], [SystemImage], [SystemIcon], [DashBoard], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (15, N'Challan', N'NIC Challan', 3045, 3025, N'NMS.jpg', N'fa fa-address-card', 0, 0, CAST(N'2022-07-21T01:44:46.273' AS DateTime), 0, CAST(N'2022-07-21T01:44:46.273' AS DateTime), 0)
GO
INSERT [dbo].[tbl_SystemMaster] ([SystemId], [SystemName], [SystemDescription], [AppPort], [ApiPort], [SystemImage], [SystemIcon], [DashBoard], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (16, N'CRS', N'Control Room System', 3031, 3030, NULL, NULL, 0, 1, CAST(N'2023-06-20T10:15:39.893' AS DateTime), 0, CAST(N'2023-06-20T10:15:39.893' AS DateTime), 0)
GO
INSERT [dbo].[tbl_SystemMaster] ([SystemId], [SystemName], [SystemDescription], [AppPort], [ApiPort], [SystemImage], [SystemIcon], [DashBoard], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (17, N'MRCS', N'Mobile Radio Communication System', NULL, NULL, NULL, NULL, 0, 1, CAST(N'2023-06-20T10:17:21.870' AS DateTime), 0, CAST(N'2023-06-20T10:17:21.870' AS DateTime), 0)
GO
SET IDENTITY_INSERT [dbo].[tbl_SystemMaster] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_UserMaster] ON 
GO
INSERT [dbo].[tbl_UserMaster] ([UserId], [LoginId], [LoginPassword], [FirstName], [LastName], [EmailId], [MobileNumber], [AccountExpiredDate], [RoleId], [UserTypeId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (1, N'admin', N'ek4e0KyF2CB1xj3nwprPWg==', N'Admin', N'Admin', N'Admin@gmail.com', N'9982567732', CAST(N'2033-06-12' AS Date), 1, 1, 1, CAST(N'2023-06-16T01:10:15.223' AS DateTime), 0, CAST(N'2023-06-26T21:33:56.993' AS DateTime), 1)
GO
INSERT [dbo].[tbl_UserMaster] ([UserId], [LoginId], [LoginPassword], [FirstName], [LastName], [EmailId], [MobileNumber], [AccountExpiredDate], [RoleId], [UserTypeId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (2, N'pt1', N'ek4e0KyF2CB1xj3nwprPWg==', N'Patrolling', N'Team', N'pt1@gmail.com', N'9982567732', CAST(N'2033-06-12' AS Date), 1, 5, 1, CAST(N'2023-06-16T01:10:15.223' AS DateTime), 0, CAST(N'2023-06-26T21:33:56.993' AS DateTime), 1)
GO
SET IDENTITY_INSERT [dbo].[tbl_UserMaster] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_VehicleClass] ON 
GO
INSERT [dbo].[tbl_VehicleClass] ([ClassId], [VehicleClassId], [VehicleClassName], [VehicleClassIcon], [AllowedSpeed], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (1, 0, N'Unknown', N'fa fa-times', CAST(80.00 AS Decimal(10, 2)), 1, CAST(N'2022-01-18T12:21:46.273' AS DateTime), 0, CAST(N'2023-06-26T21:19:20.393' AS DateTime), 0)
GO
INSERT [dbo].[tbl_VehicleClass] ([ClassId], [VehicleClassId], [VehicleClassName], [VehicleClassIcon], [AllowedSpeed], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (2, 1, N'Motorcycle', N'fa fa-motorcycle', CAST(80.00 AS Decimal(10, 2)), 1, CAST(N'2022-01-18T12:21:46.273' AS DateTime), 0, CAST(N'2023-06-26T21:17:34.287' AS DateTime), 0)
GO
INSERT [dbo].[tbl_VehicleClass] ([ClassId], [VehicleClassId], [VehicleClassName], [VehicleClassIcon], [AllowedSpeed], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (3, 2, N'Auto', N'fas fa-truck', CAST(80.00 AS Decimal(10, 2)), 1, CAST(N'2022-01-18T12:21:51.963' AS DateTime), 0, CAST(N'2022-09-17T12:16:28.997' AS DateTime), 1)
GO
INSERT [dbo].[tbl_VehicleClass] ([ClassId], [VehicleClassId], [VehicleClassName], [VehicleClassIcon], [AllowedSpeed], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (4, 3, N'Car', N'fa fa-car', CAST(100.00 AS Decimal(10, 2)), 1, CAST(N'2022-01-18T12:21:58.643' AS DateTime), 0, CAST(N'2022-09-17T12:16:19.307' AS DateTime), 1)
GO
INSERT [dbo].[tbl_VehicleClass] ([ClassId], [VehicleClassId], [VehicleClassName], [VehicleClassIcon], [AllowedSpeed], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (5, 4, N'Bus', N'fas fa-bus', CAST(80.00 AS Decimal(10, 2)), 1, CAST(N'2022-02-06T19:03:34.300' AS DateTime), 0, CAST(N'2022-09-17T12:16:33.870' AS DateTime), 1)
GO
INSERT [dbo].[tbl_VehicleClass] ([ClassId], [VehicleClassId], [VehicleClassName], [VehicleClassIcon], [AllowedSpeed], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (6, 5, N'LCV', N'fas fa-truck-pickup', CAST(80.00 AS Decimal(10, 2)), 1, CAST(N'2022-02-06T19:03:42.730' AS DateTime), 0, CAST(N'2022-09-17T12:16:37.463' AS DateTime), 1)
GO
INSERT [dbo].[tbl_VehicleClass] ([ClassId], [VehicleClassId], [VehicleClassName], [VehicleClassIcon], [AllowedSpeed], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (7, 6, N'Truck', N'fas fa-truck', CAST(80.00 AS Decimal(10, 2)), 1, CAST(N'2022-02-06T19:03:48.770' AS DateTime), 0, CAST(N'2022-09-17T12:16:40.487' AS DateTime), 1)
GO
INSERT [dbo].[tbl_VehicleClass] ([ClassId], [VehicleClassId], [VehicleClassName], [VehicleClassIcon], [AllowedSpeed], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (8, 7, N'Tractor', N'fas fa-tractor', CAST(80.00 AS Decimal(10, 2)), 1, CAST(N'2022-02-06T19:03:55.950' AS DateTime), 0, CAST(N'2022-09-17T12:16:43.843' AS DateTime), 1)
GO
INSERT [dbo].[tbl_VehicleClass] ([ClassId], [VehicleClassId], [VehicleClassName], [VehicleClassIcon], [AllowedSpeed], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (9, 8, N'Oversized', N'fas fa-truck-monster', CAST(80.00 AS Decimal(10, 2)), 1, CAST(N'2022-02-06T19:04:09.470' AS DateTime), 0, CAST(N'2022-09-17T12:16:46.800' AS DateTime), 1)
GO
SET IDENTITY_INSERT [dbo].[tbl_VehicleClass] OFF
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720231114058223', 13, N'AL_E001C0250-20230719009751', 5, CAST(N'2023-07-19T11:14:05.8223000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0250-20230719009751.jpeg', NULL, 0, 0, 0, 0, NULL, NULL, 0, 5, N'', 0, 0, CAST(N'2023-07-30T15:45:20.023' AS DateTime), NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720231055455075', 13, N'AL_E001C0250-20230719009052', 5, CAST(N'2023-07-19T10:55:45.5075000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0250-20230719009052.jpeg', NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720231055341117', 13, N'AL_E001C0250-20230719009049', 5, CAST(N'2023-07-19T10:55:34.1117000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0250-20230719009049.jpeg', NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720231044237766', 11, N'AL_E001C0040-20230719001310', 5, CAST(N'2023-07-19T10:44:23.7766000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0040-20230719001310.jpeg', NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720231044149167', 11, N'AL_E001C0040-20230719001308', 3, CAST(N'2023-07-19T10:44:14.9167000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0040-20230719001308.jpeg', NULL, 0, 1, 0, 0, NULL, 1, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720231041461386', 11, N'AL_E001C0050-20230719002505', 5, CAST(N'2023-07-19T10:41:46.1386000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0050-20230719002505.jpeg', NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720231039295776', 11, N'AL_E001C0050-20230719002470', 8, CAST(N'2023-07-19T10:39:29.5776000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0050-20230719002470.jpeg', NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720231039244238', 11, N'AL_E001C0040-20230719001269', 8, CAST(N'2023-07-19T10:39:24.4238000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0040-20230719001269.jpeg', NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720231039208237', 11, N'AL_E001C0040-20230719001267', 8, CAST(N'2023-07-19T10:39:20.8237000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0040-20230719001267.jpeg', NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720231035252125', 11, N'AL_E001C0050-20230719002428', 5, CAST(N'2023-07-19T10:35:25.2125000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0050-20230719002428.jpeg', NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720231034565673', 11, N'AL_E001C0040-20230719001253', 5, CAST(N'2023-07-19T10:34:56.5673000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0040-20230719001253.jpeg', NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720231024594365', 15, N'AL_E001C0180-20230719001046', 8, CAST(N'2023-07-19T10:24:59.4365000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0180-20230719001046.jpeg', NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720231016522236', 11, N'AL_E001C0060-20230719006503', 3, CAST(N'2023-07-19T10:16:52.2236000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0060-20230719006503.jpeg', NULL, 0, 1, 0, 0, NULL, 1, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720231016237193', 15, N'AL_E001C0230-20230719000053', 3, CAST(N'2023-07-19T10:16:23.7193000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0230-20230719000053.jpeg', NULL, 0, 1, 0, 0, NULL, 1, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720231012589260', 13, N'AL_E001C0250-20230719007555', 3, CAST(N'2023-07-19T10:12:58.9260000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0250-20230719007555.jpeg', NULL, 0, 1, 0, 0, NULL, 1, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720231010599471', 11, N'AL_E001C0050-20230719002187', 5, CAST(N'2023-07-19T10:10:59.9471000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0050-20230719002187.jpeg', NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720231006518026', 15, N'AL_E001C0220-20230719009439', 3, CAST(N'2023-07-19T10:06:51.8026000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0220-20230719009439.jpeg', NULL, 0, 1, 0, 0, NULL, 1, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720231004335071', 15, N'AL_E001C0160-20230719004062', 3, CAST(N'2023-07-19T10:04:33.5071000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0160-20230719004062.jpeg', NULL, 0, 1, 0, 0, NULL, 1, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720230957029560', 11, N'AL_E001C0050-20230719001974', 5, CAST(N'2023-07-19T09:57:02.9560000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0050-20230719001974.jpeg', NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720230953082611', 11, N'AL_E001C0040-20230719001077', 5, CAST(N'2023-07-19T09:53:08.2611000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0040-20230719001077.jpeg', NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720230953052693', 11, N'AL_E001C0040-20230719001076', 3, CAST(N'2023-07-19T09:53:05.2693000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0040-20230719001076.jpeg', NULL, 0, 1, 0, 0, NULL, 1, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720230950011826', 13, N'AL_E001C0250-20230719006833', 5, CAST(N'2023-07-19T09:50:01.1826000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0250-20230719006833.jpeg', NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720230946042081', 11, N'AL_E001C0060-20230719005181', 8, CAST(N'2023-07-19T09:46:04.2081000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0060-20230719005181.jpeg', NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720230946042081', 11, N'AL_E001C0060-20230719005182', 8, CAST(N'2023-07-19T09:46:04.2081000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0060-20230719005182.jpeg', NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720230935322014', 11, N'AL_E001C0040-20230719000988', 8, CAST(N'2023-07-19T09:35:32.2014000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0040-20230719000988.jpeg', NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720230935291222', 11, N'AL_E001C0040-20230719000987', 8, CAST(N'2023-07-19T09:35:29.1222000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0040-20230719000987.jpeg', NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720230930299858', 13, N'AL_E001C0250-20230719006217', 5, CAST(N'2023-07-19T09:30:29.9858000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0250-20230719006217.jpeg', NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720230924383834', 13, N'AL_E001C0250-20230719006154', 1, CAST(N'2023-07-19T09:24:38.3834000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0250-20230719006154.jpeg', NULL, 0, 1, 0, 0, NULL, 1, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720230914195258', 13, N'AL_E001C0250-20230719005769', 1, CAST(N'2023-07-19T09:14:19.5258000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0250-20230719005769.jpeg', NULL, 0, 1, 0, 0, NULL, 1, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720230855156610', 13, N'AL_E001C0250-20230719004619', 5, CAST(N'2023-07-19T08:55:15.6610000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0250-20230719004619.jpeg', NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720230854163874', 13, N'AL_E001C0250-20230719004656', 1, CAST(N'2023-07-19T08:54:16.3874000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0250-20230719004656.jpeg', NULL, 0, 1, 0, 0, NULL, 1, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720230851138790', 13, N'AL_E001C0250-20230719004532', 1, CAST(N'2023-07-19T08:51:13.8790000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0250-20230719004532.jpeg', NULL, 0, 1, 0, 0, NULL, 1, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720230849355905', 15, N'AL_E001C0160-20230719002737', 8, CAST(N'2023-07-19T08:49:35.5905000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0160-20230719002737.jpeg', NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720230847545873', 13, N'AL_E001C0250-20230719004374', 1, CAST(N'2023-07-19T08:47:54.5873000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0250-20230719004374.jpeg', NULL, 0, 1, 0, 0, NULL, 1, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720230837522378', 13, N'AL_E001C0250-20230719004020', 1, CAST(N'2023-07-19T08:37:52.2378000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0250-20230719004020.jpeg', NULL, 0, 1, 0, 0, NULL, 1, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720230833218592', 13, N'AL_E001C0250-20230719003886', 5, CAST(N'2023-07-19T08:33:21.8592000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0250-20230719003886.jpeg', NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720230833090681', 13, N'AL_E001C0250-20230719003867', 5, CAST(N'2023-07-19T08:33:09.0681000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0250-20230719003867.jpeg', NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720230822427333', 13, N'AL_E001C0250-20230719003425', 1, CAST(N'2023-07-19T08:22:42.7333000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0250-20230719003425.jpeg', NULL, 0, 1, 0, 0, NULL, 1, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720230818518634', 13, N'AL_E001C0250-20230719003364', 1, CAST(N'2023-07-19T08:18:51.8634000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0250-20230719003364.jpeg', NULL, 0, 1, 0, 0, NULL, 1, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720230809226490', 13, N'AL_E001C0250-20230719003118', 1, CAST(N'2023-07-19T08:09:22.6490000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0250-20230719003118.jpeg', NULL, 0, 1, 0, 0, NULL, 1, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720230759050423', 11, N'AL_E001C0050-20230719000825', 5, CAST(N'2023-07-19T07:59:05.0423000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0050-20230719000825.jpeg', NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720230758064709', 11, N'AL_E001C0050-20230719000818', 5, CAST(N'2023-07-19T07:58:06.4709000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0050-20230719000818.jpeg', NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720230753070826', 11, N'AL_E001C0050-20230719000802', 5, CAST(N'2023-07-19T07:53:07.0826000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0050-20230719000802.jpeg', NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720230753002683', 11, N'AL_E001C0040-20230719000684', 3, CAST(N'2023-07-19T07:53:00.2683000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0040-20230719000684.jpeg', NULL, 0, 1, 0, 0, NULL, 1, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720230748147526', 13, N'AL_E001C0250-20230719002506', 1, CAST(N'2023-07-19T07:48:14.7526000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0250-20230719002506.jpeg', NULL, 0, 1, 0, 0, NULL, 1, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720230746417609', 11, N'AL_E001C0040-20230719000660', 5, CAST(N'2023-07-19T07:46:41.7609000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0040-20230719000660.jpeg', NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720230745186400', 13, N'AL_E001C0250-20230719002458', 1, CAST(N'2023-07-19T07:45:18.6400000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0250-20230719002458.jpeg', NULL, 0, 1, 0, 0, NULL, 1, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720230724250147', 11, N'AL_E001C0050-20230719000593', 5, CAST(N'2023-07-19T07:24:25.0147000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0050-20230719000593.jpeg', NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720230724181102', 11, N'AL_E001C0060-20230719001689', 5, CAST(N'2023-07-19T07:24:18.1102000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0060-20230719001689.jpeg', NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720230724109969', 11, N'AL_E001C0060-20230719001686', 5, CAST(N'2023-07-19T07:24:10.9969000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0060-20230719001686.jpeg', NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720230724075977', 11, N'AL_E001C0060-20230719001684', 5, CAST(N'2023-07-19T07:24:07.5977000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0060-20230719001684.jpeg', NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720230723563209', 11, N'AL_E001C0060-20230719001679', 5, CAST(N'2023-07-19T07:23:56.3209000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0060-20230719001679.jpeg', NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720230721124402', 13, N'AL_E001C0250-20230719001675', 5, CAST(N'2023-07-19T07:21:12.4402000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0250-20230719001675.jpeg', NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720230721114422', 11, N'AL_E001C0040-20230719000585', 5, CAST(N'2023-07-19T07:21:11.4422000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0040-20230719000585.jpeg', NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720230700251146', 11, N'AL_E001C0050-20230719000481', 5, CAST(N'2023-07-19T07:00:25.1146000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0050-20230719000481.jpeg', NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720230625591748', 11, N'AL_E001C0060-20230719000982', 5, CAST(N'2023-07-19T06:25:59.1748000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0060-20230719000982.jpeg', NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720230611598985', 11, N'AL_E001C0050-20230719000314', 5, CAST(N'2023-07-19T06:11:59.8985000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0050-20230719000314.jpeg', NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720230559031991', 11, N'AL_E001C0050-20230719000258', 5, CAST(N'2023-07-19T05:59:03.1991000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0050-20230719000258.jpeg', NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720230551346965', 13, N'AL_E001C0250-20230719000689', 5, CAST(N'2023-07-19T05:51:34.6965000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0250-20230719000689.jpeg', NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720230529066019', 11, N'AL_E001C0040-20230719000399', 5, CAST(N'2023-07-19T05:29:06.6019000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0040-20230719000399.jpeg', NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720230528336896', 11, N'AL_E001C0040-20230719000394', 5, CAST(N'2023-07-19T05:28:33.6896000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0040-20230719000394.jpeg', NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720230442152745', 13, N'AL_E001C0240-20230719001292', 1, CAST(N'2023-07-19T04:42:15.2745000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0240-20230719001292.jpeg', NULL, 0, 1, 0, 0, NULL, 1, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720230440175755', 11, N'AL_E001C0050-20230719000067', 5, CAST(N'2023-07-19T04:40:17.5755000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0050-20230719000067.jpeg', NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720230430390061', 11, N'AL_E001C0050-20230719000045', 5, CAST(N'2023-07-19T04:30:39.0061000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0050-20230719000045.jpeg', NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720230428406209', 11, N'AL_E001C0060-20230719000064', 5, CAST(N'2023-07-19T04:28:40.6209000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0060-20230719000064.jpeg', NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720230420434318', 11, N'AL_E001C0040-20230719000301', 5, CAST(N'2023-07-19T04:20:43.4318000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0040-20230719000301.jpeg', NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720230419405950', 13, N'AL_E001C0250-20230719000215', 5, CAST(N'2023-07-19T04:19:40.5950000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0250-20230719000215.jpeg', NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720230330471261', 11, N'AL_E001C0040-20230719000211', 5, CAST(N'2023-07-19T03:30:47.1261000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0040-20230719000211.jpeg', NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720230326192552', 11, N'AL_E001C0050-20230719000234', 5, CAST(N'2023-07-19T03:26:19.2552000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0050-20230719000234.jpeg', NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720230322070273', 11, N'AL_E001C0060-20230719001539', 1, CAST(N'2023-07-19T03:22:07.0273000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0060-20230719001539.jpeg', NULL, 0, 1, 0, 0, NULL, 1, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720230312356264', 11, N'AL_E001C0050-20230719000192', 5, CAST(N'2023-07-19T03:12:35.6264000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0050-20230719000192.jpeg', NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720230248422370', 11, N'AL_E001C0050-20230719000117', 5, CAST(N'2023-07-19T02:48:42.2370000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0050-20230719000117.jpeg', NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720230247005037', 11, N'AL_E001C0050-20230719000114', 5, CAST(N'2023-07-19T02:47:00.5037000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0050-20230719000114.jpeg', NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720230246532056', 11, N'AL_E001C0040-20230719000121', 3, CAST(N'2023-07-19T02:46:53.2056000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0040-20230719000121.jpeg', NULL, 0, 1, 0, 0, NULL, 1, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720230223098802', 11, N'AL_E001C0050-20230719000057', 5, CAST(N'2023-07-19T02:23:09.8802000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0050-20230719000057.jpeg', NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720230222591546', 11, N'AL_E001C0060-20230719001111', 5, CAST(N'2023-07-19T02:22:59.1546000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0060-20230719001111.jpeg', NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720230222221775', 11, N'AL_E001C0060-20230719001104', 5, CAST(N'2023-07-19T02:22:22.1775000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0060-20230719001104.jpeg', NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720230206478109', 15, N'AL_E001C0220-20230719001527', 5, CAST(N'2023-07-19T02:06:47.8109000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0220-20230719001527.jpeg', NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720230153136989', 11, N'AL_E001C0050-20230719000031', 5, CAST(N'2023-07-19T01:53:13.6989000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0050-20230719000031.jpeg', NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720230113160638', 11, N'AL_E001C0040-20230719000221', 5, CAST(N'2023-07-19T01:13:16.0638000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0040-20230719000221.jpeg', NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720230105067369', 11, N'AL_E001C0050-20230719000259', 5, CAST(N'2023-07-19T01:05:06.7369000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0050-20230719000259.jpeg', NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720230043575060', 11, N'AL_E001C0050-20230719000181', 5, CAST(N'2023-07-19T00:43:57.5060000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0050-20230719000181.jpeg', NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720230029498933', 11, N'AL_E001C0050-20230719000120', 5, CAST(N'2023-07-19T00:29:49.8933000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0050-20230719000120.jpeg', NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720230028171807', 11, N'AL_E001C0040-20230719000099', 5, CAST(N'2023-07-19T00:28:17.1807000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0040-20230719000099.jpeg', NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720230027372785', 11, N'AL_E001C0040-20230719000093', 5, CAST(N'2023-07-19T00:27:37.2785000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0040-20230719000093.jpeg', NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720230026326344', 11, N'AL_E001C0040-20230719000085', 5, CAST(N'2023-07-19T00:26:32.6344000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0040-20230719000085.jpeg', NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720230017524385', 11, N'AL_E001C0050-20230719000053', 5, CAST(N'2023-07-19T00:17:52.4385000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0050-20230719000053.jpeg', NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720230014140395', 11, N'AL_E001C0040-20230719000032', 5, CAST(N'2023-07-19T00:14:14.0395000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0040-20230719000032.jpeg', NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'190720230013070541', 15, N'AL_E001C0220-20230719000164', 3, CAST(N'2023-07-19T00:13:07.0541000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0220-20230719000164.jpeg', NULL, 0, 1, 0, 0, NULL, 1, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'180720232343100843', 13, N'AL_E001C0260-20230718018076', 3, CAST(N'2023-07-18T23:43:10.0843000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0260-20230718018076.jpeg', NULL, 0, 1, 0, 0, NULL, 1, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'180720232308011868', 11, N'AL_E001C0050-20230718009181', 5, CAST(N'2023-07-18T23:08:01.1868000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0050-20230718009181.jpeg', NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'180720232258190459', 13, N'AL_E001C0250-20230718025919', 5, CAST(N'2023-07-18T22:58:19.0459000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0250-20230718025919.jpeg', NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'180720232258187691', 13, N'AL_E001C0250-20230718025918', 5, CAST(N'2023-07-18T22:58:18.7691000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0250-20230718025918.jpeg', NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'180720232252550814', 11, N'AL_E001C0050-20230718009141', 5, CAST(N'2023-07-18T22:52:55.0814000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0050-20230718009141.jpeg', NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'180720232249422552', 11, N'AL_E001C0040-20230718003715', 5, CAST(N'2023-07-18T22:49:42.2552000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0040-20230718003715.jpeg', NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'180720232249410521', 11, N'AL_E001C0040-20230718003712', 3, CAST(N'2023-07-18T22:49:41.0521000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0040-20230718003712.jpeg', NULL, 0, 1, 0, 0, NULL, 1, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'180720232248355492', 11, N'AL_E001C0050-20230718009114', 5, CAST(N'2023-07-18T22:48:35.5492000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0050-20230718009114.jpeg', NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'180720232248027080', 11, N'AL_E001C0040-20230718003689', 5, CAST(N'2023-07-18T22:48:02.7080000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0040-20230718003689.jpeg', NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'180720232247305133', 13, N'AL_E001C0250-20230718025731', 5, CAST(N'2023-07-18T22:47:30.5133000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0250-20230718025731.jpeg', NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VIDSEventsHistory] ([TransactionId], [EquipmentId], [EventID], [EventTypeId], [EventStartDate], [EventEndDate], [EventDuration], [LaneNumber], [VehicleSpeed], [VehicleClassId], [PlateNumber], [PlateImageUrl], [EventImageUrl], [EventVideoUrl], [IncidentStatusId], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [IsReviewedRequired], [ReviewedStatus], [ReviewedEventTypeId], [ReviewedPlateNumber], [ReviewedVehicleClassId], [ReviewedById], [ReviewedDateTime], [ReviewedRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (N'180720232206002826', 11, N'AL_E001C0040-20230718003542', 6, CAST(N'2023-07-18T22:06:00.2826000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'VIDS/IncidentImages/AL_E001C0040-20230718003542.jpeg', NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, N'0', 0, 0, NULL, NULL, CAST(N'2023-07-19T12:28:24.800' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[tbl_VSDSEventHistory] ([TransactionId], [EquipmentId], [EquipmentIP], [LaneNumber], [EventID], [EventDate], [PlateNumber], [VehicleClassId], [PlateImageUrl], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [RadarSpeed], [AllowedSpeed], [OcrConfidencelevel], [ClassConfidencelevel], [PlateFontColor], [PlateBackColor], [VehicleColor], [VehicleDirectionId], [IsPlateVisible], [IsFaultyPlate], [IsStandardPlate], [IsWrongDirection], [IsReviewedRequired], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedPlateNumber], [ReviewedPlateVisible], [ReviewedPlateFaulty], [ReviewedPlateStandard], [ReviewedBy], [ReviewedDateTime], [ReviewedRemark], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (NULL, NULL, N'10.36.244.82', 2, N'478bfb13-b115-4845-bab7-1e003140d335', CAST(N'2023-07-18T07:05:12.4460000' AS DateTime2), N'HR51CF1997', 3, N'VSDS/PlateImages/478bfb13-b115-4845-bab7-1e003140d335.jpeg', N'VSDS/VehicleImages/478bfb13-b115-4845-bab7-1e003140d335.jpeg', NULL, NULL, CAST(81.36 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2023-07-19T11:44:38.173' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_VSDSEventHistory] ([TransactionId], [EquipmentId], [EquipmentIP], [LaneNumber], [EventID], [EventDate], [PlateNumber], [VehicleClassId], [PlateImageUrl], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [RadarSpeed], [AllowedSpeed], [OcrConfidencelevel], [ClassConfidencelevel], [PlateFontColor], [PlateBackColor], [VehicleColor], [VehicleDirectionId], [IsPlateVisible], [IsFaultyPlate], [IsStandardPlate], [IsWrongDirection], [IsReviewedRequired], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedPlateNumber], [ReviewedPlateVisible], [ReviewedPlateFaulty], [ReviewedPlateStandard], [ReviewedBy], [ReviewedDateTime], [ReviewedRemark], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (NULL, NULL, N'10.36.244.83', 3, N'c6dd43c9-40de-4f52-86ec-0d72db321dc3', CAST(N'2023-07-18T07:05:02.0100000' AS DateTime2), N'39444LV2', 6, N'VSDS/PlateImages/c6dd43c9-40de-4f52-86ec-0d72db321dc3.jpeg', N'VSDS/VehicleImages/c6dd43c9-40de-4f52-86ec-0d72db321dc3.jpeg', NULL, NULL, CAST(62.72 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2023-07-19T11:44:38.173' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_VSDSEventHistory] ([TransactionId], [EquipmentId], [EquipmentIP], [LaneNumber], [EventID], [EventDate], [PlateNumber], [VehicleClassId], [PlateImageUrl], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [RadarSpeed], [AllowedSpeed], [OcrConfidencelevel], [ClassConfidencelevel], [PlateFontColor], [PlateBackColor], [VehicleColor], [VehicleDirectionId], [IsPlateVisible], [IsFaultyPlate], [IsStandardPlate], [IsWrongDirection], [IsReviewedRequired], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedPlateNumber], [ReviewedPlateVisible], [ReviewedPlateFaulty], [ReviewedPlateStandard], [ReviewedBy], [ReviewedDateTime], [ReviewedRemark], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (NULL, NULL, N'10.36.244.82', 2, N'3047b22a-76bc-459a-ae64-085501064933', CAST(N'2023-07-18T07:04:45.5000000' AS DateTime2), N'PB01B6996', 3, N'VSDS/PlateImages/3047b22a-76bc-459a-ae64-085501064933.jpeg', N'VSDS/VehicleImages/3047b22a-76bc-459a-ae64-085501064933.jpeg', NULL, NULL, CAST(88.84 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2023-07-19T11:44:38.173' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_VSDSEventHistory] ([TransactionId], [EquipmentId], [EquipmentIP], [LaneNumber], [EventID], [EventDate], [PlateNumber], [VehicleClassId], [PlateImageUrl], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [RadarSpeed], [AllowedSpeed], [OcrConfidencelevel], [ClassConfidencelevel], [PlateFontColor], [PlateBackColor], [VehicleColor], [VehicleDirectionId], [IsPlateVisible], [IsFaultyPlate], [IsStandardPlate], [IsWrongDirection], [IsReviewedRequired], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedPlateNumber], [ReviewedPlateVisible], [ReviewedPlateFaulty], [ReviewedPlateStandard], [ReviewedBy], [ReviewedDateTime], [ReviewedRemark], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (NULL, NULL, N'10.36.244.82', 2, N'deb7df48-bb2c-4fbb-af8e-0a66c0ddf86d', CAST(N'2023-07-18T07:03:07.4900000' AS DateTime2), N'UP347QM5804', 3, N'VSDS/PlateImages/deb7df48-bb2c-4fbb-af8e-0a66c0ddf86d.jpeg', N'VSDS/VehicleImages/deb7df48-bb2c-4fbb-af8e-0a66c0ddf86d.jpeg', NULL, NULL, CAST(48.01 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2023-07-19T11:44:38.173' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_VSDSEventHistory] ([TransactionId], [EquipmentId], [EquipmentIP], [LaneNumber], [EventID], [EventDate], [PlateNumber], [VehicleClassId], [PlateImageUrl], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [RadarSpeed], [AllowedSpeed], [OcrConfidencelevel], [ClassConfidencelevel], [PlateFontColor], [PlateBackColor], [VehicleColor], [VehicleDirectionId], [IsPlateVisible], [IsFaultyPlate], [IsStandardPlate], [IsWrongDirection], [IsReviewedRequired], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedPlateNumber], [ReviewedPlateVisible], [ReviewedPlateFaulty], [ReviewedPlateStandard], [ReviewedBy], [ReviewedDateTime], [ReviewedRemark], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (NULL, NULL, N'10.36.244.82', 2, N'df4e43e3-073f-44fb-99cb-d1228a18088e', CAST(N'2023-07-18T07:01:02.4950000' AS DateTime2), N'BR01EJ4519', 3, N'VSDS/PlateImages/df4e43e3-073f-44fb-99cb-d1228a18088e.jpeg', N'VSDS/VehicleImages/df4e43e3-073f-44fb-99cb-d1228a18088e.jpeg', NULL, NULL, CAST(100.12 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2023-07-19T11:44:38.173' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_VSDSEventHistory] ([TransactionId], [EquipmentId], [EquipmentIP], [LaneNumber], [EventID], [EventDate], [PlateNumber], [VehicleClassId], [PlateImageUrl], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [RadarSpeed], [AllowedSpeed], [OcrConfidencelevel], [ClassConfidencelevel], [PlateFontColor], [PlateBackColor], [VehicleColor], [VehicleDirectionId], [IsPlateVisible], [IsFaultyPlate], [IsStandardPlate], [IsWrongDirection], [IsReviewedRequired], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedPlateNumber], [ReviewedPlateVisible], [ReviewedPlateFaulty], [ReviewedPlateStandard], [ReviewedBy], [ReviewedDateTime], [ReviewedRemark], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (NULL, NULL, N'10.36.244.82', 2, N'8518a742-558f-4ba9-acb8-0b79da926fa7', CAST(N'2023-07-18T06:58:44.1020000' AS DateTime2), N'UP32NR2543', 3, N'VSDS/PlateImages/8518a742-558f-4ba9-acb8-0b79da926fa7.jpeg', N'VSDS/VehicleImages/8518a742-558f-4ba9-acb8-0b79da926fa7.jpeg', NULL, NULL, CAST(87.06 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2023-07-19T11:44:38.173' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_VSDSEventHistory] ([TransactionId], [EquipmentId], [EquipmentIP], [LaneNumber], [EventID], [EventDate], [PlateNumber], [VehicleClassId], [PlateImageUrl], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [RadarSpeed], [AllowedSpeed], [OcrConfidencelevel], [ClassConfidencelevel], [PlateFontColor], [PlateBackColor], [VehicleColor], [VehicleDirectionId], [IsPlateVisible], [IsFaultyPlate], [IsStandardPlate], [IsWrongDirection], [IsReviewedRequired], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedPlateNumber], [ReviewedPlateVisible], [ReviewedPlateFaulty], [ReviewedPlateStandard], [ReviewedBy], [ReviewedDateTime], [ReviewedRemark], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (NULL, NULL, N'10.36.244.62', 2, N'eccc9fcc-fa32-4e64-ae14-726aa6d9b902', CAST(N'2023-07-18T06:58:22.2110000' AS DateTime2), N'UP54S4957', 3, N'VSDS/PlateImages/eccc9fcc-fa32-4e64-ae14-726aa6d9b902.jpeg', N'VSDS/VehicleImages/eccc9fcc-fa32-4e64-ae14-726aa6d9b902.jpeg', NULL, NULL, CAST(82.28 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2023-07-19T11:44:38.173' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_VSDSEventHistory] ([TransactionId], [EquipmentId], [EquipmentIP], [LaneNumber], [EventID], [EventDate], [PlateNumber], [VehicleClassId], [PlateImageUrl], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [RadarSpeed], [AllowedSpeed], [OcrConfidencelevel], [ClassConfidencelevel], [PlateFontColor], [PlateBackColor], [VehicleColor], [VehicleDirectionId], [IsPlateVisible], [IsFaultyPlate], [IsStandardPlate], [IsWrongDirection], [IsReviewedRequired], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedPlateNumber], [ReviewedPlateVisible], [ReviewedPlateFaulty], [ReviewedPlateStandard], [ReviewedBy], [ReviewedDateTime], [ReviewedRemark], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (NULL, NULL, N'10.36.244.82', 2, N'55089bda-8cb3-4b56-b588-df06f8b00642', CAST(N'2023-07-18T06:57:13.1950000' AS DateTime2), N'UK08AP1579', 3, N'VSDS/PlateImages/55089bda-8cb3-4b56-b588-df06f8b00642.jpeg', N'VSDS/VehicleImages/55089bda-8cb3-4b56-b588-df06f8b00642.jpeg', NULL, NULL, CAST(67.87 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2023-07-19T11:44:38.173' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_VSDSEventHistory] ([TransactionId], [EquipmentId], [EquipmentIP], [LaneNumber], [EventID], [EventDate], [PlateNumber], [VehicleClassId], [PlateImageUrl], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [RadarSpeed], [AllowedSpeed], [OcrConfidencelevel], [ClassConfidencelevel], [PlateFontColor], [PlateBackColor], [VehicleColor], [VehicleDirectionId], [IsPlateVisible], [IsFaultyPlate], [IsStandardPlate], [IsWrongDirection], [IsReviewedRequired], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedPlateNumber], [ReviewedPlateVisible], [ReviewedPlateFaulty], [ReviewedPlateStandard], [ReviewedBy], [ReviewedDateTime], [ReviewedRemark], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (NULL, NULL, N'10.36.244.62', 2, N'eb2301eb-f436-403b-b6db-d73fe2e8ca39', CAST(N'2023-07-18T06:55:52.1920000' AS DateTime2), N'UP32L117374', 3, N'VSDS/PlateImages/eb2301eb-f436-403b-b6db-d73fe2e8ca39.jpeg', N'VSDS/VehicleImages/eb2301eb-f436-403b-b6db-d73fe2e8ca39.jpeg', NULL, NULL, CAST(54.08 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2023-07-19T11:44:38.173' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_VSDSEventHistory] ([TransactionId], [EquipmentId], [EquipmentIP], [LaneNumber], [EventID], [EventDate], [PlateNumber], [VehicleClassId], [PlateImageUrl], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [RadarSpeed], [AllowedSpeed], [OcrConfidencelevel], [ClassConfidencelevel], [PlateFontColor], [PlateBackColor], [VehicleColor], [VehicleDirectionId], [IsPlateVisible], [IsFaultyPlate], [IsStandardPlate], [IsWrongDirection], [IsReviewedRequired], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedPlateNumber], [ReviewedPlateVisible], [ReviewedPlateFaulty], [ReviewedPlateStandard], [ReviewedBy], [ReviewedDateTime], [ReviewedRemark], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (NULL, NULL, N'10.36.244.82', 2, N'1bee7dc7-0318-49bd-9ea7-9432638cc226', CAST(N'2023-07-18T06:55:01.9450000' AS DateTime2), N'OD3EB7151', 6, N'VSDS/PlateImages/1bee7dc7-0318-49bd-9ea7-9432638cc226.jpeg', N'VSDS/VehicleImages/1bee7dc7-0318-49bd-9ea7-9432638cc226.jpeg', NULL, NULL, CAST(80.66 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2023-07-19T11:44:38.173' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_VSDSEventHistory] ([TransactionId], [EquipmentId], [EquipmentIP], [LaneNumber], [EventID], [EventDate], [PlateNumber], [VehicleClassId], [PlateImageUrl], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [RadarSpeed], [AllowedSpeed], [OcrConfidencelevel], [ClassConfidencelevel], [PlateFontColor], [PlateBackColor], [VehicleColor], [VehicleDirectionId], [IsPlateVisible], [IsFaultyPlate], [IsStandardPlate], [IsWrongDirection], [IsReviewedRequired], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedPlateNumber], [ReviewedPlateVisible], [ReviewedPlateFaulty], [ReviewedPlateStandard], [ReviewedBy], [ReviewedDateTime], [ReviewedRemark], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (NULL, NULL, N'10.48.28.83', 3, N'fb8082e4-54ee-4b32-8e3e-e1aa54d31475', CAST(N'2023-07-18T06:54:02.9630000' AS DateTime2), N'UP30AT4517', 3, N'VSDS/PlateImages/fb8082e4-54ee-4b32-8e3e-e1aa54d31475.jpeg', N'VSDS/VehicleImages/fb8082e4-54ee-4b32-8e3e-e1aa54d31475.jpeg', NULL, NULL, CAST(78.85 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2023-07-19T11:44:38.173' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_VSDSEventHistory] ([TransactionId], [EquipmentId], [EquipmentIP], [LaneNumber], [EventID], [EventDate], [PlateNumber], [VehicleClassId], [PlateImageUrl], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [RadarSpeed], [AllowedSpeed], [OcrConfidencelevel], [ClassConfidencelevel], [PlateFontColor], [PlateBackColor], [VehicleColor], [VehicleDirectionId], [IsPlateVisible], [IsFaultyPlate], [IsStandardPlate], [IsWrongDirection], [IsReviewedRequired], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedPlateNumber], [ReviewedPlateVisible], [ReviewedPlateFaulty], [ReviewedPlateStandard], [ReviewedBy], [ReviewedDateTime], [ReviewedRemark], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (NULL, NULL, N'10.48.28.81', 1, N'7ff6d931-c423-4fab-bfb8-84de38840fbd', CAST(N'2023-07-18T06:53:50.2770000' AS DateTime2), N'UAJAN', 6, N'VSDS/PlateImages/7ff6d931-c423-4fab-bfb8-84de38840fbd.jpeg', N'VSDS/VehicleImages/7ff6d931-c423-4fab-bfb8-84de38840fbd.jpeg', NULL, NULL, CAST(40.28 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2023-07-19T11:44:38.173' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_VSDSEventHistory] ([TransactionId], [EquipmentId], [EquipmentIP], [LaneNumber], [EventID], [EventDate], [PlateNumber], [VehicleClassId], [PlateImageUrl], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [RadarSpeed], [AllowedSpeed], [OcrConfidencelevel], [ClassConfidencelevel], [PlateFontColor], [PlateBackColor], [VehicleColor], [VehicleDirectionId], [IsPlateVisible], [IsFaultyPlate], [IsStandardPlate], [IsWrongDirection], [IsReviewedRequired], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedPlateNumber], [ReviewedPlateVisible], [ReviewedPlateFaulty], [ReviewedPlateStandard], [ReviewedBy], [ReviewedDateTime], [ReviewedRemark], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (NULL, NULL, N'10.36.244.62', 2, N'3d73c67b-e1bd-4ce3-b655-b00c7666a5d1', CAST(N'2023-07-18T06:53:13.9520000' AS DateTime2), N'UP53DT5480', 6, N'VSDS/PlateImages/3d73c67b-e1bd-4ce3-b655-b00c7666a5d1.jpeg', N'VSDS/VehicleImages/3d73c67b-e1bd-4ce3-b655-b00c7666a5d1.jpeg', NULL, NULL, CAST(53.74 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2023-07-19T11:44:38.173' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_VSDSEventHistory] ([TransactionId], [EquipmentId], [EquipmentIP], [LaneNumber], [EventID], [EventDate], [PlateNumber], [VehicleClassId], [PlateImageUrl], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [RadarSpeed], [AllowedSpeed], [OcrConfidencelevel], [ClassConfidencelevel], [PlateFontColor], [PlateBackColor], [VehicleColor], [VehicleDirectionId], [IsPlateVisible], [IsFaultyPlate], [IsStandardPlate], [IsWrongDirection], [IsReviewedRequired], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedPlateNumber], [ReviewedPlateVisible], [ReviewedPlateFaulty], [ReviewedPlateStandard], [ReviewedBy], [ReviewedDateTime], [ReviewedRemark], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (NULL, NULL, N'10.36.244.83', 3, N'79a7b772-e878-46a1-a0e0-ecd013a53ce6', CAST(N'2023-07-18T06:53:09.0610000' AS DateTime2), N'UP14CP7824', 3, N'VSDS/PlateImages/79a7b772-e878-46a1-a0e0-ecd013a53ce6.jpeg', N'VSDS/VehicleImages/79a7b772-e878-46a1-a0e0-ecd013a53ce6.jpeg', NULL, NULL, CAST(69.45 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2023-07-19T11:44:38.173' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_VSDSEventHistory] ([TransactionId], [EquipmentId], [EquipmentIP], [LaneNumber], [EventID], [EventDate], [PlateNumber], [VehicleClassId], [PlateImageUrl], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [RadarSpeed], [AllowedSpeed], [OcrConfidencelevel], [ClassConfidencelevel], [PlateFontColor], [PlateBackColor], [VehicleColor], [VehicleDirectionId], [IsPlateVisible], [IsFaultyPlate], [IsStandardPlate], [IsWrongDirection], [IsReviewedRequired], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedPlateNumber], [ReviewedPlateVisible], [ReviewedPlateFaulty], [ReviewedPlateStandard], [ReviewedBy], [ReviewedDateTime], [ReviewedRemark], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (NULL, NULL, N'10.36.244.62', 2, N'01219d7e-78e3-4b39-853f-1526d9eea3a7', CAST(N'2023-07-18T06:52:21.8390000' AS DateTime2), N'J4409E0310', 3, N'VSDS/PlateImages/01219d7e-78e3-4b39-853f-1526d9eea3a7.jpeg', N'VSDS/VehicleImages/01219d7e-78e3-4b39-853f-1526d9eea3a7.jpeg', NULL, NULL, CAST(53.47 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2023-07-19T11:44:38.173' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_VSDSEventHistory] ([TransactionId], [EquipmentId], [EquipmentIP], [LaneNumber], [EventID], [EventDate], [PlateNumber], [VehicleClassId], [PlateImageUrl], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [RadarSpeed], [AllowedSpeed], [OcrConfidencelevel], [ClassConfidencelevel], [PlateFontColor], [PlateBackColor], [VehicleColor], [VehicleDirectionId], [IsPlateVisible], [IsFaultyPlate], [IsStandardPlate], [IsWrongDirection], [IsReviewedRequired], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedPlateNumber], [ReviewedPlateVisible], [ReviewedPlateFaulty], [ReviewedPlateStandard], [ReviewedBy], [ReviewedDateTime], [ReviewedRemark], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (NULL, NULL, N'10.36.244.82', 2, N'bebc8e55-8859-4712-923a-f8c55957f318', CAST(N'2023-07-18T06:51:41.9420000' AS DateTime2), N'UP70CF1282', 3, N'VSDS/PlateImages/bebc8e55-8859-4712-923a-f8c55957f318.jpeg', N'VSDS/VehicleImages/bebc8e55-8859-4712-923a-f8c55957f318.jpeg', NULL, NULL, CAST(90.48 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2023-07-19T11:44:38.173' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_VSDSEventHistory] ([TransactionId], [EquipmentId], [EquipmentIP], [LaneNumber], [EventID], [EventDate], [PlateNumber], [VehicleClassId], [PlateImageUrl], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [RadarSpeed], [AllowedSpeed], [OcrConfidencelevel], [ClassConfidencelevel], [PlateFontColor], [PlateBackColor], [VehicleColor], [VehicleDirectionId], [IsPlateVisible], [IsFaultyPlate], [IsStandardPlate], [IsWrongDirection], [IsReviewedRequired], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedPlateNumber], [ReviewedPlateVisible], [ReviewedPlateFaulty], [ReviewedPlateStandard], [ReviewedBy], [ReviewedDateTime], [ReviewedRemark], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (NULL, NULL, N'10.36.244.62', 2, N'2f769fce-2168-44cc-b89a-4720d6b81717', CAST(N'2023-07-18T06:51:33.9690000' AS DateTime2), N'UP80EQ9076', 3, N'VSDS/PlateImages/2f769fce-2168-44cc-b89a-4720d6b81717.jpeg', N'VSDS/VehicleImages/2f769fce-2168-44cc-b89a-4720d6b81717.jpeg', NULL, NULL, CAST(52.45 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2023-07-19T11:44:38.173' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_VSDSEventHistory] ([TransactionId], [EquipmentId], [EquipmentIP], [LaneNumber], [EventID], [EventDate], [PlateNumber], [VehicleClassId], [PlateImageUrl], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [RadarSpeed], [AllowedSpeed], [OcrConfidencelevel], [ClassConfidencelevel], [PlateFontColor], [PlateBackColor], [VehicleColor], [VehicleDirectionId], [IsPlateVisible], [IsFaultyPlate], [IsStandardPlate], [IsWrongDirection], [IsReviewedRequired], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedPlateNumber], [ReviewedPlateVisible], [ReviewedPlateFaulty], [ReviewedPlateStandard], [ReviewedBy], [ReviewedDateTime], [ReviewedRemark], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (NULL, NULL, N'10.36.244.61', 1, N'e41eae13-a1e5-46f1-9b17-535bd9065cec', CAST(N'2023-07-18T06:50:45.3070000' AS DateTime2), N'UP62EE99501', 3, N'VSDS/PlateImages/e41eae13-a1e5-46f1-9b17-535bd9065cec.jpeg', N'VSDS/VehicleImages/e41eae13-a1e5-46f1-9b17-535bd9065cec.jpeg', NULL, NULL, CAST(112.02 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2023-07-19T11:44:38.173' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_VSDSEventHistory] ([TransactionId], [EquipmentId], [EquipmentIP], [LaneNumber], [EventID], [EventDate], [PlateNumber], [VehicleClassId], [PlateImageUrl], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [RadarSpeed], [AllowedSpeed], [OcrConfidencelevel], [ClassConfidencelevel], [PlateFontColor], [PlateBackColor], [VehicleColor], [VehicleDirectionId], [IsPlateVisible], [IsFaultyPlate], [IsStandardPlate], [IsWrongDirection], [IsReviewedRequired], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedPlateNumber], [ReviewedPlateVisible], [ReviewedPlateFaulty], [ReviewedPlateStandard], [ReviewedBy], [ReviewedDateTime], [ReviewedRemark], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (NULL, NULL, N'10.36.244.82', 2, N'db47db28-6d53-4899-a525-32454ba29025', CAST(N'2023-07-18T06:50:23.0630000' AS DateTime2), N'UP50CP7525', 3, N'VSDS/PlateImages/db47db28-6d53-4899-a525-32454ba29025.jpeg', N'VSDS/VehicleImages/db47db28-6d53-4899-a525-32454ba29025.jpeg', NULL, NULL, CAST(94.43 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2023-07-19T11:44:38.173' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_VSDSEventHistory] ([TransactionId], [EquipmentId], [EquipmentIP], [LaneNumber], [EventID], [EventDate], [PlateNumber], [VehicleClassId], [PlateImageUrl], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [RadarSpeed], [AllowedSpeed], [OcrConfidencelevel], [ClassConfidencelevel], [PlateFontColor], [PlateBackColor], [VehicleColor], [VehicleDirectionId], [IsPlateVisible], [IsFaultyPlate], [IsStandardPlate], [IsWrongDirection], [IsReviewedRequired], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedPlateNumber], [ReviewedPlateVisible], [ReviewedPlateFaulty], [ReviewedPlateStandard], [ReviewedBy], [ReviewedDateTime], [ReviewedRemark], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (NULL, NULL, N'10.36.244.62', 2, N'56e53f67-e835-48b1-b9ce-f52f97e3dac3', CAST(N'2023-07-18T06:50:03.0670000' AS DateTime2), N'U1P54T5231', 3, N'VSDS/PlateImages/56e53f67-e835-48b1-b9ce-f52f97e3dac3.jpeg', N'VSDS/VehicleImages/56e53f67-e835-48b1-b9ce-f52f97e3dac3.jpeg', NULL, NULL, CAST(77.77 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2023-07-19T11:44:38.173' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_VSDSEventHistory] ([TransactionId], [EquipmentId], [EquipmentIP], [LaneNumber], [EventID], [EventDate], [PlateNumber], [VehicleClassId], [PlateImageUrl], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [RadarSpeed], [AllowedSpeed], [OcrConfidencelevel], [ClassConfidencelevel], [PlateFontColor], [PlateBackColor], [VehicleColor], [VehicleDirectionId], [IsPlateVisible], [IsFaultyPlate], [IsStandardPlate], [IsWrongDirection], [IsReviewedRequired], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedPlateNumber], [ReviewedPlateVisible], [ReviewedPlateFaulty], [ReviewedPlateStandard], [ReviewedBy], [ReviewedDateTime], [ReviewedRemark], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (NULL, NULL, N'10.36.244.83', 3, N'a8781994-63a0-4ca4-93ec-fc01d4930342', CAST(N'2023-07-18T06:49:16.5290000' AS DateTime2), N'DL30AP4136', 5, N'VSDS/PlateImages/a8781994-63a0-4ca4-93ec-fc01d4930342.jpeg', N'VSDS/VehicleImages/a8781994-63a0-4ca4-93ec-fc01d4930342.jpeg', NULL, NULL, CAST(37.44 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2023-07-19T11:44:38.173' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_VSDSEventHistory] ([TransactionId], [EquipmentId], [EquipmentIP], [LaneNumber], [EventID], [EventDate], [PlateNumber], [VehicleClassId], [PlateImageUrl], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [RadarSpeed], [AllowedSpeed], [OcrConfidencelevel], [ClassConfidencelevel], [PlateFontColor], [PlateBackColor], [VehicleColor], [VehicleDirectionId], [IsPlateVisible], [IsFaultyPlate], [IsStandardPlate], [IsWrongDirection], [IsReviewedRequired], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedPlateNumber], [ReviewedPlateVisible], [ReviewedPlateFaulty], [ReviewedPlateStandard], [ReviewedBy], [ReviewedDateTime], [ReviewedRemark], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (NULL, NULL, N'10.36.244.62', 2, N'd97f000c-d5cd-400d-8582-946e314fe44f', CAST(N'2023-07-18T06:49:15.5890000' AS DateTime2), N'F5UP35A03551', 3, N'VSDS/PlateImages/d97f000c-d5cd-400d-8582-946e314fe44f.jpeg', N'VSDS/VehicleImages/d97f000c-d5cd-400d-8582-946e314fe44f.jpeg', NULL, NULL, CAST(98.82 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2023-07-19T11:44:38.173' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_VSDSEventHistory] ([TransactionId], [EquipmentId], [EquipmentIP], [LaneNumber], [EventID], [EventDate], [PlateNumber], [VehicleClassId], [PlateImageUrl], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [RadarSpeed], [AllowedSpeed], [OcrConfidencelevel], [ClassConfidencelevel], [PlateFontColor], [PlateBackColor], [VehicleColor], [VehicleDirectionId], [IsPlateVisible], [IsFaultyPlate], [IsStandardPlate], [IsWrongDirection], [IsReviewedRequired], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedPlateNumber], [ReviewedPlateVisible], [ReviewedPlateFaulty], [ReviewedPlateStandard], [ReviewedBy], [ReviewedDateTime], [ReviewedRemark], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (NULL, NULL, N'10.48.28.63', 3, N'b5c19d33-0e89-4cde-8726-d0904a2ca19c', CAST(N'2023-07-18T06:49:11.2310000' AS DateTime2), N'UP53ET3720', 6, N'VSDS/PlateImages/b5c19d33-0e89-4cde-8726-d0904a2ca19c.jpeg', N'VSDS/VehicleImages/b5c19d33-0e89-4cde-8726-d0904a2ca19c.jpeg', NULL, NULL, CAST(54.15 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2023-07-19T11:44:38.173' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_VSDSEventHistory] ([TransactionId], [EquipmentId], [EquipmentIP], [LaneNumber], [EventID], [EventDate], [PlateNumber], [VehicleClassId], [PlateImageUrl], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [RadarSpeed], [AllowedSpeed], [OcrConfidencelevel], [ClassConfidencelevel], [PlateFontColor], [PlateBackColor], [VehicleColor], [VehicleDirectionId], [IsPlateVisible], [IsFaultyPlate], [IsStandardPlate], [IsWrongDirection], [IsReviewedRequired], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedPlateNumber], [ReviewedPlateVisible], [ReviewedPlateFaulty], [ReviewedPlateStandard], [ReviewedBy], [ReviewedDateTime], [ReviewedRemark], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (NULL, NULL, N'10.36.244.63', 3, N'976ca710-4e34-425e-80f8-2212da5d1715', CAST(N'2023-07-18T06:48:59.7410000' AS DateTime2), N'MTVXT', 4, N'VSDS/PlateImages/976ca710-4e34-425e-80f8-2212da5d1715.jpeg', N'VSDS/VehicleImages/976ca710-4e34-425e-80f8-2212da5d1715.jpeg', NULL, NULL, CAST(30.87 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2023-07-19T11:44:38.173' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_VSDSEventHistory] ([TransactionId], [EquipmentId], [EquipmentIP], [LaneNumber], [EventID], [EventDate], [PlateNumber], [VehicleClassId], [PlateImageUrl], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [RadarSpeed], [AllowedSpeed], [OcrConfidencelevel], [ClassConfidencelevel], [PlateFontColor], [PlateBackColor], [VehicleColor], [VehicleDirectionId], [IsPlateVisible], [IsFaultyPlate], [IsStandardPlate], [IsWrongDirection], [IsReviewedRequired], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedPlateNumber], [ReviewedPlateVisible], [ReviewedPlateFaulty], [ReviewedPlateStandard], [ReviewedBy], [ReviewedDateTime], [ReviewedRemark], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (NULL, NULL, N'10.36.244.62', 2, N'73063892-c2f9-4864-85bd-d6965e26f722', CAST(N'2023-07-18T06:48:19.8660000' AS DateTime2), N'UP21CT5526', 6, N'VSDS/PlateImages/73063892-c2f9-4864-85bd-d6965e26f722.jpeg', N'VSDS/VehicleImages/73063892-c2f9-4864-85bd-d6965e26f722.jpeg', NULL, NULL, CAST(85.64 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2023-07-19T11:44:38.173' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_VSDSEventHistory] ([TransactionId], [EquipmentId], [EquipmentIP], [LaneNumber], [EventID], [EventDate], [PlateNumber], [VehicleClassId], [PlateImageUrl], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [RadarSpeed], [AllowedSpeed], [OcrConfidencelevel], [ClassConfidencelevel], [PlateFontColor], [PlateBackColor], [VehicleColor], [VehicleDirectionId], [IsPlateVisible], [IsFaultyPlate], [IsStandardPlate], [IsWrongDirection], [IsReviewedRequired], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedPlateNumber], [ReviewedPlateVisible], [ReviewedPlateFaulty], [ReviewedPlateStandard], [ReviewedBy], [ReviewedDateTime], [ReviewedRemark], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (NULL, NULL, N'10.36.244.62', 2, N'8899ec20-1c05-4009-b0fe-c4dca0d2f72b', CAST(N'2023-07-18T06:48:04.7100000' AS DateTime2), N'UP648L9920', 5, N'VSDS/PlateImages/8899ec20-1c05-4009-b0fe-c4dca0d2f72b.jpeg', N'VSDS/VehicleImages/8899ec20-1c05-4009-b0fe-c4dca0d2f72b.jpeg', NULL, NULL, CAST(82.80 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2023-07-19T11:44:38.173' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_VSDSEventHistory] ([TransactionId], [EquipmentId], [EquipmentIP], [LaneNumber], [EventID], [EventDate], [PlateNumber], [VehicleClassId], [PlateImageUrl], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [RadarSpeed], [AllowedSpeed], [OcrConfidencelevel], [ClassConfidencelevel], [PlateFontColor], [PlateBackColor], [VehicleColor], [VehicleDirectionId], [IsPlateVisible], [IsFaultyPlate], [IsStandardPlate], [IsWrongDirection], [IsReviewedRequired], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedPlateNumber], [ReviewedPlateVisible], [ReviewedPlateFaulty], [ReviewedPlateStandard], [ReviewedBy], [ReviewedDateTime], [ReviewedRemark], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (NULL, NULL, N'10.36.244.83', 3, N'd32a8af0-4755-41b2-b60f-a3810aa473f5', CAST(N'2023-07-18T06:48:01.5870000' AS DateTime2), N'UP10QA6368', 5, N'VSDS/PlateImages/d32a8af0-4755-41b2-b60f-a3810aa473f5.jpeg', N'VSDS/VehicleImages/d32a8af0-4755-41b2-b60f-a3810aa473f5.jpeg', NULL, NULL, CAST(44.67 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2023-07-19T11:44:38.173' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_VSDSEventHistory] ([TransactionId], [EquipmentId], [EquipmentIP], [LaneNumber], [EventID], [EventDate], [PlateNumber], [VehicleClassId], [PlateImageUrl], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [RadarSpeed], [AllowedSpeed], [OcrConfidencelevel], [ClassConfidencelevel], [PlateFontColor], [PlateBackColor], [VehicleColor], [VehicleDirectionId], [IsPlateVisible], [IsFaultyPlate], [IsStandardPlate], [IsWrongDirection], [IsReviewedRequired], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedPlateNumber], [ReviewedPlateVisible], [ReviewedPlateFaulty], [ReviewedPlateStandard], [ReviewedBy], [ReviewedDateTime], [ReviewedRemark], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (NULL, NULL, N'10.36.244.82', 2, N'23c41867-fff4-4d6d-ac48-6cccb001c1f7', CAST(N'2023-07-18T06:47:08.6350000' AS DateTime2), N'UP32KM4825', 3, N'VSDS/PlateImages/23c41867-fff4-4d6d-ac48-6cccb001c1f7.jpeg', N'VSDS/VehicleImages/23c41867-fff4-4d6d-ac48-6cccb001c1f7.jpeg', NULL, NULL, CAST(75.69 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2023-07-19T11:44:38.173' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_VSDSEventHistory] ([TransactionId], [EquipmentId], [EquipmentIP], [LaneNumber], [EventID], [EventDate], [PlateNumber], [VehicleClassId], [PlateImageUrl], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [RadarSpeed], [AllowedSpeed], [OcrConfidencelevel], [ClassConfidencelevel], [PlateFontColor], [PlateBackColor], [VehicleColor], [VehicleDirectionId], [IsPlateVisible], [IsFaultyPlate], [IsStandardPlate], [IsWrongDirection], [IsReviewedRequired], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedPlateNumber], [ReviewedPlateVisible], [ReviewedPlateFaulty], [ReviewedPlateStandard], [ReviewedBy], [ReviewedDateTime], [ReviewedRemark], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (NULL, NULL, N'10.36.244.63', 3, N'1d0800df-db0c-4da3-bfd1-1df5a1089be3', CAST(N'2023-07-18T06:46:58.4240000' AS DateTime2), N'WFARQ1Y', 6, N'VSDS/PlateImages/1d0800df-db0c-4da3-bfd1-1df5a1089be3.jpeg', N'VSDS/VehicleImages/1d0800df-db0c-4da3-bfd1-1df5a1089be3.jpeg', NULL, NULL, CAST(49.33 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2023-07-19T11:44:38.173' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_VSDSEventHistory] ([TransactionId], [EquipmentId], [EquipmentIP], [LaneNumber], [EventID], [EventDate], [PlateNumber], [VehicleClassId], [PlateImageUrl], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [RadarSpeed], [AllowedSpeed], [OcrConfidencelevel], [ClassConfidencelevel], [PlateFontColor], [PlateBackColor], [VehicleColor], [VehicleDirectionId], [IsPlateVisible], [IsFaultyPlate], [IsStandardPlate], [IsWrongDirection], [IsReviewedRequired], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedPlateNumber], [ReviewedPlateVisible], [ReviewedPlateFaulty], [ReviewedPlateStandard], [ReviewedBy], [ReviewedDateTime], [ReviewedRemark], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (NULL, NULL, N'10.36.244.62', 2, N'd23e1022-49f1-4dbc-8919-f6ca5c8eb53f', CAST(N'2023-07-18T06:46:44.7410000' AS DateTime2), N'BR24Y8235', 3, N'VSDS/PlateImages/d23e1022-49f1-4dbc-8919-f6ca5c8eb53f.jpeg', N'VSDS/VehicleImages/d23e1022-49f1-4dbc-8919-f6ca5c8eb53f.jpeg', NULL, NULL, CAST(79.88 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2023-07-19T11:44:38.173' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_VSDSEventHistory] ([TransactionId], [EquipmentId], [EquipmentIP], [LaneNumber], [EventID], [EventDate], [PlateNumber], [VehicleClassId], [PlateImageUrl], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [RadarSpeed], [AllowedSpeed], [OcrConfidencelevel], [ClassConfidencelevel], [PlateFontColor], [PlateBackColor], [VehicleColor], [VehicleDirectionId], [IsPlateVisible], [IsFaultyPlate], [IsStandardPlate], [IsWrongDirection], [IsReviewedRequired], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedPlateNumber], [ReviewedPlateVisible], [ReviewedPlateFaulty], [ReviewedPlateStandard], [ReviewedBy], [ReviewedDateTime], [ReviewedRemark], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (NULL, NULL, N'10.47.89.83', 3, N'268dd43f-5e2e-47c2-8843-a6a3e3a6cf18', CAST(N'2023-07-18T06:46:43.2000000' AS DateTime2), N'UP64U4197', 3, N'VSDS/PlateImages/268dd43f-5e2e-47c2-8843-a6a3e3a6cf18.jpeg', N'VSDS/VehicleImages/268dd43f-5e2e-47c2-8843-a6a3e3a6cf18.jpeg', NULL, NULL, CAST(53.48 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2023-07-19T11:44:38.173' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_VSDSEventHistory] ([TransactionId], [EquipmentId], [EquipmentIP], [LaneNumber], [EventID], [EventDate], [PlateNumber], [VehicleClassId], [PlateImageUrl], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [RadarSpeed], [AllowedSpeed], [OcrConfidencelevel], [ClassConfidencelevel], [PlateFontColor], [PlateBackColor], [VehicleColor], [VehicleDirectionId], [IsPlateVisible], [IsFaultyPlate], [IsStandardPlate], [IsWrongDirection], [IsReviewedRequired], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedPlateNumber], [ReviewedPlateVisible], [ReviewedPlateFaulty], [ReviewedPlateStandard], [ReviewedBy], [ReviewedDateTime], [ReviewedRemark], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (NULL, NULL, N'10.36.244.82', 2, N'51dbbcd6-4943-4e50-ae05-5a5cc07c7bab', CAST(N'2023-07-18T06:46:17.6370000' AS DateTime2), N'UP30AA2472', 3, N'VSDS/PlateImages/51dbbcd6-4943-4e50-ae05-5a5cc07c7bab.jpeg', N'VSDS/VehicleImages/51dbbcd6-4943-4e50-ae05-5a5cc07c7bab.jpeg', NULL, NULL, CAST(108.97 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2023-07-19T11:44:38.173' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_VSDSEventHistory] ([TransactionId], [EquipmentId], [EquipmentIP], [LaneNumber], [EventID], [EventDate], [PlateNumber], [VehicleClassId], [PlateImageUrl], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [RadarSpeed], [AllowedSpeed], [OcrConfidencelevel], [ClassConfidencelevel], [PlateFontColor], [PlateBackColor], [VehicleColor], [VehicleDirectionId], [IsPlateVisible], [IsFaultyPlate], [IsStandardPlate], [IsWrongDirection], [IsReviewedRequired], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedPlateNumber], [ReviewedPlateVisible], [ReviewedPlateFaulty], [ReviewedPlateStandard], [ReviewedBy], [ReviewedDateTime], [ReviewedRemark], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (NULL, NULL, N'10.36.244.82', 2, N'bde77224-81d8-4c99-9a5f-27a180dd9154', CAST(N'2023-07-18T06:44:57.5490000' AS DateTime2), N'UP54M2003', 3, N'VSDS/PlateImages/bde77224-81d8-4c99-9a5f-27a180dd9154.jpeg', N'VSDS/VehicleImages/bde77224-81d8-4c99-9a5f-27a180dd9154.jpeg', NULL, NULL, CAST(94.86 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2023-07-19T11:44:38.173' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_VSDSEventHistory] ([TransactionId], [EquipmentId], [EquipmentIP], [LaneNumber], [EventID], [EventDate], [PlateNumber], [VehicleClassId], [PlateImageUrl], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [RadarSpeed], [AllowedSpeed], [OcrConfidencelevel], [ClassConfidencelevel], [PlateFontColor], [PlateBackColor], [VehicleColor], [VehicleDirectionId], [IsPlateVisible], [IsFaultyPlate], [IsStandardPlate], [IsWrongDirection], [IsReviewedRequired], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedPlateNumber], [ReviewedPlateVisible], [ReviewedPlateFaulty], [ReviewedPlateStandard], [ReviewedBy], [ReviewedDateTime], [ReviewedRemark], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (NULL, NULL, N'10.36.244.82', 2, N'c746b04b-19ee-49dd-91a4-2f0d2f234c84', CAST(N'2023-07-18T06:44:23.6420000' AS DateTime2), N'UP32NB3825', 3, N'VSDS/PlateImages/c746b04b-19ee-49dd-91a4-2f0d2f234c84.jpeg', N'VSDS/VehicleImages/c746b04b-19ee-49dd-91a4-2f0d2f234c84.jpeg', NULL, NULL, CAST(85.97 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2023-07-19T11:44:38.173' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_VSDSEventHistory] ([TransactionId], [EquipmentId], [EquipmentIP], [LaneNumber], [EventID], [EventDate], [PlateNumber], [VehicleClassId], [PlateImageUrl], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [RadarSpeed], [AllowedSpeed], [OcrConfidencelevel], [ClassConfidencelevel], [PlateFontColor], [PlateBackColor], [VehicleColor], [VehicleDirectionId], [IsPlateVisible], [IsFaultyPlate], [IsStandardPlate], [IsWrongDirection], [IsReviewedRequired], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedPlateNumber], [ReviewedPlateVisible], [ReviewedPlateFaulty], [ReviewedPlateStandard], [ReviewedBy], [ReviewedDateTime], [ReviewedRemark], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (NULL, NULL, N'10.36.244.83', 3, N'aca1ade1-eb2e-4133-9fa7-e685017ad937', CAST(N'2023-07-18T06:43:59.0750000' AS DateTime2), N'UP32PN3360', 3, N'VSDS/PlateImages/aca1ade1-eb2e-4133-9fa7-e685017ad937.jpeg', N'VSDS/VehicleImages/aca1ade1-eb2e-4133-9fa7-e685017ad937.jpeg', NULL, NULL, CAST(51.23 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2023-07-19T11:44:38.173' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_VSDSEventHistory] ([TransactionId], [EquipmentId], [EquipmentIP], [LaneNumber], [EventID], [EventDate], [PlateNumber], [VehicleClassId], [PlateImageUrl], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [RadarSpeed], [AllowedSpeed], [OcrConfidencelevel], [ClassConfidencelevel], [PlateFontColor], [PlateBackColor], [VehicleColor], [VehicleDirectionId], [IsPlateVisible], [IsFaultyPlate], [IsStandardPlate], [IsWrongDirection], [IsReviewedRequired], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedPlateNumber], [ReviewedPlateVisible], [ReviewedPlateFaulty], [ReviewedPlateStandard], [ReviewedBy], [ReviewedDateTime], [ReviewedRemark], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (NULL, NULL, N'10.36.244.82', 2, N'e84f27a8-95c9-4cd2-b347-eccf7e5ed16b', CAST(N'2023-07-18T06:43:42.4630000' AS DateTime2), N'DL1CAC3356', 3, N'VSDS/PlateImages/e84f27a8-95c9-4cd2-b347-eccf7e5ed16b.jpeg', N'VSDS/VehicleImages/e84f27a8-95c9-4cd2-b347-eccf7e5ed16b.jpeg', NULL, NULL, CAST(44.23 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2023-07-19T11:44:38.173' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_VSDSEventHistory] ([TransactionId], [EquipmentId], [EquipmentIP], [LaneNumber], [EventID], [EventDate], [PlateNumber], [VehicleClassId], [PlateImageUrl], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [RadarSpeed], [AllowedSpeed], [OcrConfidencelevel], [ClassConfidencelevel], [PlateFontColor], [PlateBackColor], [VehicleColor], [VehicleDirectionId], [IsPlateVisible], [IsFaultyPlate], [IsStandardPlate], [IsWrongDirection], [IsReviewedRequired], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedPlateNumber], [ReviewedPlateVisible], [ReviewedPlateFaulty], [ReviewedPlateStandard], [ReviewedBy], [ReviewedDateTime], [ReviewedRemark], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (NULL, NULL, N'10.36.244.81', 1, N'8a428c1b-c847-4516-83e4-f07c9a57c080', CAST(N'2023-07-18T06:43:31.9310000' AS DateTime2), N'UP54N3736', 3, N'VSDS/PlateImages/8a428c1b-c847-4516-83e4-f07c9a57c080.jpeg', N'VSDS/VehicleImages/8a428c1b-c847-4516-83e4-f07c9a57c080.jpeg', NULL, NULL, CAST(77.44 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2023-07-19T11:44:38.173' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_VSDSEventHistory] ([TransactionId], [EquipmentId], [EquipmentIP], [LaneNumber], [EventID], [EventDate], [PlateNumber], [VehicleClassId], [PlateImageUrl], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [RadarSpeed], [AllowedSpeed], [OcrConfidencelevel], [ClassConfidencelevel], [PlateFontColor], [PlateBackColor], [VehicleColor], [VehicleDirectionId], [IsPlateVisible], [IsFaultyPlate], [IsStandardPlate], [IsWrongDirection], [IsReviewedRequired], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedPlateNumber], [ReviewedPlateVisible], [ReviewedPlateFaulty], [ReviewedPlateStandard], [ReviewedBy], [ReviewedDateTime], [ReviewedRemark], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (NULL, NULL, N'10.48.28.83', 3, N'8407c485-3d0c-434a-ab91-6fe8a458aa23', CAST(N'2023-07-18T06:42:39.9430000' AS DateTime2), N'815244', 6, N'VSDS/PlateImages/8407c485-3d0c-434a-ab91-6fe8a458aa23.jpeg', N'VSDS/VehicleImages/8407c485-3d0c-434a-ab91-6fe8a458aa23.jpeg', NULL, NULL, CAST(51.16 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2023-07-19T11:44:38.173' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_VSDSEventHistory] ([TransactionId], [EquipmentId], [EquipmentIP], [LaneNumber], [EventID], [EventDate], [PlateNumber], [VehicleClassId], [PlateImageUrl], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [RadarSpeed], [AllowedSpeed], [OcrConfidencelevel], [ClassConfidencelevel], [PlateFontColor], [PlateBackColor], [VehicleColor], [VehicleDirectionId], [IsPlateVisible], [IsFaultyPlate], [IsStandardPlate], [IsWrongDirection], [IsReviewedRequired], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedPlateNumber], [ReviewedPlateVisible], [ReviewedPlateFaulty], [ReviewedPlateStandard], [ReviewedBy], [ReviewedDateTime], [ReviewedRemark], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (NULL, NULL, N'10.48.28.83', 3, N'a8d8f632-767a-4a95-91b7-00ed2b6f2ddb', CAST(N'2023-07-18T06:42:35.1710000' AS DateTime2), N'JA2J1AA4118', 6, N'VSDS/PlateImages/a8d8f632-767a-4a95-91b7-00ed2b6f2ddb.jpeg', N'VSDS/VehicleImages/a8d8f632-767a-4a95-91b7-00ed2b6f2ddb.jpeg', NULL, NULL, CAST(49.59 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2023-07-19T11:44:38.173' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_VSDSEventHistory] ([TransactionId], [EquipmentId], [EquipmentIP], [LaneNumber], [EventID], [EventDate], [PlateNumber], [VehicleClassId], [PlateImageUrl], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [RadarSpeed], [AllowedSpeed], [OcrConfidencelevel], [ClassConfidencelevel], [PlateFontColor], [PlateBackColor], [VehicleColor], [VehicleDirectionId], [IsPlateVisible], [IsFaultyPlate], [IsStandardPlate], [IsWrongDirection], [IsReviewedRequired], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedPlateNumber], [ReviewedPlateVisible], [ReviewedPlateFaulty], [ReviewedPlateStandard], [ReviewedBy], [ReviewedDateTime], [ReviewedRemark], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (NULL, NULL, N'10.48.28.83', 3, N'b0b6541d-631c-4d02-b24c-777d271f37ba', CAST(N'2023-07-18T06:42:27.2010000' AS DateTime2), N'PB31AL1418', 6, N'VSDS/PlateImages/b0b6541d-631c-4d02-b24c-777d271f37ba.jpeg', N'VSDS/VehicleImages/b0b6541d-631c-4d02-b24c-777d271f37ba.jpeg', NULL, NULL, CAST(40.21 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2023-07-19T11:44:38.173' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_VSDSEventHistory] ([TransactionId], [EquipmentId], [EquipmentIP], [LaneNumber], [EventID], [EventDate], [PlateNumber], [VehicleClassId], [PlateImageUrl], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [RadarSpeed], [AllowedSpeed], [OcrConfidencelevel], [ClassConfidencelevel], [PlateFontColor], [PlateBackColor], [VehicleColor], [VehicleDirectionId], [IsPlateVisible], [IsFaultyPlate], [IsStandardPlate], [IsWrongDirection], [IsReviewedRequired], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedPlateNumber], [ReviewedPlateVisible], [ReviewedPlateFaulty], [ReviewedPlateStandard], [ReviewedBy], [ReviewedDateTime], [ReviewedRemark], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (NULL, NULL, N'10.36.244.62', 2, N'8e5f39bc-58e7-42b2-a9f8-ad5c0c9d24c2', CAST(N'2023-07-18T06:42:24.0990000' AS DateTime2), N'UP32LM0011', 3, N'VSDS/PlateImages/8e5f39bc-58e7-42b2-a9f8-ad5c0c9d24c2.jpeg', N'VSDS/VehicleImages/8e5f39bc-58e7-42b2-a9f8-ad5c0c9d24c2.jpeg', NULL, NULL, CAST(82.18 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2023-07-19T11:44:38.173' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_VSDSEventHistory] ([TransactionId], [EquipmentId], [EquipmentIP], [LaneNumber], [EventID], [EventDate], [PlateNumber], [VehicleClassId], [PlateImageUrl], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [RadarSpeed], [AllowedSpeed], [OcrConfidencelevel], [ClassConfidencelevel], [PlateFontColor], [PlateBackColor], [VehicleColor], [VehicleDirectionId], [IsPlateVisible], [IsFaultyPlate], [IsStandardPlate], [IsWrongDirection], [IsReviewedRequired], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedPlateNumber], [ReviewedPlateVisible], [ReviewedPlateFaulty], [ReviewedPlateStandard], [ReviewedBy], [ReviewedDateTime], [ReviewedRemark], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (NULL, NULL, N'10.36.244.83', 3, N'6591e424-3306-4632-a6ea-766f59140678', CAST(N'2023-07-18T06:42:21.9360000' AS DateTime2), N'UP77AN7722', 5, N'VSDS/PlateImages/6591e424-3306-4632-a6ea-766f59140678.jpeg', N'VSDS/VehicleImages/6591e424-3306-4632-a6ea-766f59140678.jpeg', NULL, NULL, CAST(51.56 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2023-07-19T11:44:38.173' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_VSDSEventHistory] ([TransactionId], [EquipmentId], [EquipmentIP], [LaneNumber], [EventID], [EventDate], [PlateNumber], [VehicleClassId], [PlateImageUrl], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [RadarSpeed], [AllowedSpeed], [OcrConfidencelevel], [ClassConfidencelevel], [PlateFontColor], [PlateBackColor], [VehicleColor], [VehicleDirectionId], [IsPlateVisible], [IsFaultyPlate], [IsStandardPlate], [IsWrongDirection], [IsReviewedRequired], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedPlateNumber], [ReviewedPlateVisible], [ReviewedPlateFaulty], [ReviewedPlateStandard], [ReviewedBy], [ReviewedDateTime], [ReviewedRemark], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (NULL, NULL, N'10.48.28.62', 2, N'f9e0e299-4ab5-410d-85ff-ee3bda2b5c92', CAST(N'2023-07-18T06:41:59.5500000' AS DateTime2), N'UP25DT5276', 5, N'VSDS/PlateImages/f9e0e299-4ab5-410d-85ff-ee3bda2b5c92.jpeg', N'VSDS/VehicleImages/f9e0e299-4ab5-410d-85ff-ee3bda2b5c92.jpeg', NULL, NULL, CAST(47.57 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2023-07-19T11:44:38.173' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_VSDSEventHistory] ([TransactionId], [EquipmentId], [EquipmentIP], [LaneNumber], [EventID], [EventDate], [PlateNumber], [VehicleClassId], [PlateImageUrl], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [RadarSpeed], [AllowedSpeed], [OcrConfidencelevel], [ClassConfidencelevel], [PlateFontColor], [PlateBackColor], [VehicleColor], [VehicleDirectionId], [IsPlateVisible], [IsFaultyPlate], [IsStandardPlate], [IsWrongDirection], [IsReviewedRequired], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedPlateNumber], [ReviewedPlateVisible], [ReviewedPlateFaulty], [ReviewedPlateStandard], [ReviewedBy], [ReviewedDateTime], [ReviewedRemark], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (NULL, NULL, N'10.36.244.82', 2, N'1b953f05-43a9-4c02-a9c8-5f1997d6f552', CAST(N'2023-07-18T06:41:57.8270000' AS DateTime2), N'DL8CAM9548', 3, N'VSDS/PlateImages/1b953f05-43a9-4c02-a9c8-5f1997d6f552.jpeg', N'VSDS/VehicleImages/1b953f05-43a9-4c02-a9c8-5f1997d6f552.jpeg', NULL, NULL, CAST(80.46 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2023-07-19T11:44:38.173' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_VSDSEventHistory] ([TransactionId], [EquipmentId], [EquipmentIP], [LaneNumber], [EventID], [EventDate], [PlateNumber], [VehicleClassId], [PlateImageUrl], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [RadarSpeed], [AllowedSpeed], [OcrConfidencelevel], [ClassConfidencelevel], [PlateFontColor], [PlateBackColor], [VehicleColor], [VehicleDirectionId], [IsPlateVisible], [IsFaultyPlate], [IsStandardPlate], [IsWrongDirection], [IsReviewedRequired], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedPlateNumber], [ReviewedPlateVisible], [ReviewedPlateFaulty], [ReviewedPlateStandard], [ReviewedBy], [ReviewedDateTime], [ReviewedRemark], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (NULL, NULL, N'10.48.28.82', 2, N'876dafec-5110-4bdf-a021-2bd281203b7c', CAST(N'2023-07-18T06:41:51.5560000' AS DateTime2), N'UP80DS4447', 3, N'VSDS/PlateImages/876dafec-5110-4bdf-a021-2bd281203b7c.jpeg', N'VSDS/VehicleImages/876dafec-5110-4bdf-a021-2bd281203b7c.jpeg', NULL, NULL, CAST(73.62 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2023-07-19T11:44:38.173' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_VSDSEventHistory] ([TransactionId], [EquipmentId], [EquipmentIP], [LaneNumber], [EventID], [EventDate], [PlateNumber], [VehicleClassId], [PlateImageUrl], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [RadarSpeed], [AllowedSpeed], [OcrConfidencelevel], [ClassConfidencelevel], [PlateFontColor], [PlateBackColor], [VehicleColor], [VehicleDirectionId], [IsPlateVisible], [IsFaultyPlate], [IsStandardPlate], [IsWrongDirection], [IsReviewedRequired], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedPlateNumber], [ReviewedPlateVisible], [ReviewedPlateFaulty], [ReviewedPlateStandard], [ReviewedBy], [ReviewedDateTime], [ReviewedRemark], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (NULL, NULL, N'10.48.28.83', 3, N'7c03142f-09f3-418d-84ab-17e42c17c3b4', CAST(N'2023-07-18T06:41:41.0730000' AS DateTime2), N'HR33BAH557', 6, N'VSDS/PlateImages/7c03142f-09f3-418d-84ab-17e42c17c3b4.jpeg', N'VSDS/VehicleImages/7c03142f-09f3-418d-84ab-17e42c17c3b4.jpeg', NULL, NULL, CAST(38.26 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2023-07-19T11:44:38.173' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_VSDSEventHistory] ([TransactionId], [EquipmentId], [EquipmentIP], [LaneNumber], [EventID], [EventDate], [PlateNumber], [VehicleClassId], [PlateImageUrl], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [RadarSpeed], [AllowedSpeed], [OcrConfidencelevel], [ClassConfidencelevel], [PlateFontColor], [PlateBackColor], [VehicleColor], [VehicleDirectionId], [IsPlateVisible], [IsFaultyPlate], [IsStandardPlate], [IsWrongDirection], [IsReviewedRequired], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedPlateNumber], [ReviewedPlateVisible], [ReviewedPlateFaulty], [ReviewedPlateStandard], [ReviewedBy], [ReviewedDateTime], [ReviewedRemark], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (NULL, NULL, N'10.36.244.83', 3, N'1475a73c-c0fb-4379-87e5-08440fccb58f', CAST(N'2023-07-18T06:41:16.1410000' AS DateTime2), N'EV4711', 6, N'VSDS/PlateImages/1475a73c-c0fb-4379-87e5-08440fccb58f.jpeg', N'VSDS/VehicleImages/1475a73c-c0fb-4379-87e5-08440fccb58f.jpeg', NULL, NULL, CAST(60.06 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2023-07-19T11:44:38.173' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_VSDSEventHistory] ([TransactionId], [EquipmentId], [EquipmentIP], [LaneNumber], [EventID], [EventDate], [PlateNumber], [VehicleClassId], [PlateImageUrl], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [RadarSpeed], [AllowedSpeed], [OcrConfidencelevel], [ClassConfidencelevel], [PlateFontColor], [PlateBackColor], [VehicleColor], [VehicleDirectionId], [IsPlateVisible], [IsFaultyPlate], [IsStandardPlate], [IsWrongDirection], [IsReviewedRequired], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedPlateNumber], [ReviewedPlateVisible], [ReviewedPlateFaulty], [ReviewedPlateStandard], [ReviewedBy], [ReviewedDateTime], [ReviewedRemark], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (NULL, NULL, N'10.36.244.62', 2, N'e0fef3bc-f372-4cd3-bc78-f56065baf0bd', CAST(N'2023-07-18T06:40:52.2740000' AS DateTime2), N'UP32GK6555', 3, N'VSDS/PlateImages/e0fef3bc-f372-4cd3-bc78-f56065baf0bd.jpeg', N'VSDS/VehicleImages/e0fef3bc-f372-4cd3-bc78-f56065baf0bd.jpeg', NULL, NULL, CAST(79.73 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2023-07-19T11:44:38.173' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_VSDSEventHistory] ([TransactionId], [EquipmentId], [EquipmentIP], [LaneNumber], [EventID], [EventDate], [PlateNumber], [VehicleClassId], [PlateImageUrl], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [RadarSpeed], [AllowedSpeed], [OcrConfidencelevel], [ClassConfidencelevel], [PlateFontColor], [PlateBackColor], [VehicleColor], [VehicleDirectionId], [IsPlateVisible], [IsFaultyPlate], [IsStandardPlate], [IsWrongDirection], [IsReviewedRequired], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedPlateNumber], [ReviewedPlateVisible], [ReviewedPlateFaulty], [ReviewedPlateStandard], [ReviewedBy], [ReviewedDateTime], [ReviewedRemark], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (NULL, NULL, N'10.48.28.62', 2, N'5e1e918b-ee9f-4f81-9f6a-fce75c68c841', CAST(N'2023-07-18T06:40:31.5560000' AS DateTime2), N'BR01FZ6933', 3, N'VSDS/PlateImages/5e1e918b-ee9f-4f81-9f6a-fce75c68c841.jpeg', N'VSDS/VehicleImages/5e1e918b-ee9f-4f81-9f6a-fce75c68c841.jpeg', NULL, NULL, CAST(110.56 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2023-07-19T11:44:38.173' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_VSDSEventHistory] ([TransactionId], [EquipmentId], [EquipmentIP], [LaneNumber], [EventID], [EventDate], [PlateNumber], [VehicleClassId], [PlateImageUrl], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [RadarSpeed], [AllowedSpeed], [OcrConfidencelevel], [ClassConfidencelevel], [PlateFontColor], [PlateBackColor], [VehicleColor], [VehicleDirectionId], [IsPlateVisible], [IsFaultyPlate], [IsStandardPlate], [IsWrongDirection], [IsReviewedRequired], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedPlateNumber], [ReviewedPlateVisible], [ReviewedPlateFaulty], [ReviewedPlateStandard], [ReviewedBy], [ReviewedDateTime], [ReviewedRemark], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (NULL, NULL, N'10.36.244.82', 2, N'fc6b022a-843c-4f82-ae99-94bf6de3c579', CAST(N'2023-07-18T06:40:13.6320000' AS DateTime2), N'UP60AM3003', 3, N'VSDS/PlateImages/fc6b022a-843c-4f82-ae99-94bf6de3c579.jpeg', N'VSDS/VehicleImages/fc6b022a-843c-4f82-ae99-94bf6de3c579.jpeg', NULL, NULL, CAST(66.05 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2023-07-19T11:44:38.173' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_VSDSEventHistory] ([TransactionId], [EquipmentId], [EquipmentIP], [LaneNumber], [EventID], [EventDate], [PlateNumber], [VehicleClassId], [PlateImageUrl], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [RadarSpeed], [AllowedSpeed], [OcrConfidencelevel], [ClassConfidencelevel], [PlateFontColor], [PlateBackColor], [VehicleColor], [VehicleDirectionId], [IsPlateVisible], [IsFaultyPlate], [IsStandardPlate], [IsWrongDirection], [IsReviewedRequired], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedPlateNumber], [ReviewedPlateVisible], [ReviewedPlateFaulty], [ReviewedPlateStandard], [ReviewedBy], [ReviewedDateTime], [ReviewedRemark], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (NULL, NULL, N'10.36.244.61', 1, N'b50901c4-943e-4043-9e46-e427d8acb8ce', CAST(N'2023-07-18T06:40:07.3540000' AS DateTime2), N'11P3LK1511', 3, N'VSDS/PlateImages/b50901c4-943e-4043-9e46-e427d8acb8ce.jpeg', N'VSDS/VehicleImages/b50901c4-943e-4043-9e46-e427d8acb8ce.jpeg', NULL, NULL, CAST(82.41 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2023-07-19T11:44:38.173' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_VSDSEventHistory] ([TransactionId], [EquipmentId], [EquipmentIP], [LaneNumber], [EventID], [EventDate], [PlateNumber], [VehicleClassId], [PlateImageUrl], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [RadarSpeed], [AllowedSpeed], [OcrConfidencelevel], [ClassConfidencelevel], [PlateFontColor], [PlateBackColor], [VehicleColor], [VehicleDirectionId], [IsPlateVisible], [IsFaultyPlate], [IsStandardPlate], [IsWrongDirection], [IsReviewedRequired], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedPlateNumber], [ReviewedPlateVisible], [ReviewedPlateFaulty], [ReviewedPlateStandard], [ReviewedBy], [ReviewedDateTime], [ReviewedRemark], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (NULL, NULL, N'10.48.28.81', 1, N'32b267e8-a857-4737-9b02-18e6f43a726b', CAST(N'2023-07-18T06:39:51.3460000' AS DateTime2), N'HR20AS8506', 3, N'VSDS/PlateImages/32b267e8-a857-4737-9b02-18e6f43a726b.jpeg', N'VSDS/VehicleImages/32b267e8-a857-4737-9b02-18e6f43a726b.jpeg', NULL, NULL, CAST(40.90 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2023-07-19T11:44:38.173' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_VSDSEventHistory] ([TransactionId], [EquipmentId], [EquipmentIP], [LaneNumber], [EventID], [EventDate], [PlateNumber], [VehicleClassId], [PlateImageUrl], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [RadarSpeed], [AllowedSpeed], [OcrConfidencelevel], [ClassConfidencelevel], [PlateFontColor], [PlateBackColor], [VehicleColor], [VehicleDirectionId], [IsPlateVisible], [IsFaultyPlate], [IsStandardPlate], [IsWrongDirection], [IsReviewedRequired], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedPlateNumber], [ReviewedPlateVisible], [ReviewedPlateFaulty], [ReviewedPlateStandard], [ReviewedBy], [ReviewedDateTime], [ReviewedRemark], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (NULL, NULL, N'10.36.244.83', 3, N'4c6ceed7-ebf9-4d8f-84ee-a263cfa91256', CAST(N'2023-07-18T06:39:50.7970000' AS DateTime2), N'AVJ4AV', 6, N'VSDS/PlateImages/4c6ceed7-ebf9-4d8f-84ee-a263cfa91256.jpeg', N'VSDS/VehicleImages/4c6ceed7-ebf9-4d8f-84ee-a263cfa91256.jpeg', NULL, NULL, CAST(60.92 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2023-07-19T11:44:38.173' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_VSDSEventHistory] ([TransactionId], [EquipmentId], [EquipmentIP], [LaneNumber], [EventID], [EventDate], [PlateNumber], [VehicleClassId], [PlateImageUrl], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [RadarSpeed], [AllowedSpeed], [OcrConfidencelevel], [ClassConfidencelevel], [PlateFontColor], [PlateBackColor], [VehicleColor], [VehicleDirectionId], [IsPlateVisible], [IsFaultyPlate], [IsStandardPlate], [IsWrongDirection], [IsReviewedRequired], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedPlateNumber], [ReviewedPlateVisible], [ReviewedPlateFaulty], [ReviewedPlateStandard], [ReviewedBy], [ReviewedDateTime], [ReviewedRemark], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (NULL, NULL, N'10.36.244.83', 3, N'096a83eb-5d40-4570-82e2-94e92908d875', CAST(N'2023-07-18T06:39:42.9380000' AS DateTime2), N'A1111AG0331', 5, N'VSDS/PlateImages/096a83eb-5d40-4570-82e2-94e92908d875.jpeg', N'VSDS/VehicleImages/096a83eb-5d40-4570-82e2-94e92908d875.jpeg', NULL, NULL, CAST(60.64 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2023-07-19T11:44:38.173' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_VSDSEventHistory] ([TransactionId], [EquipmentId], [EquipmentIP], [LaneNumber], [EventID], [EventDate], [PlateNumber], [VehicleClassId], [PlateImageUrl], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [RadarSpeed], [AllowedSpeed], [OcrConfidencelevel], [ClassConfidencelevel], [PlateFontColor], [PlateBackColor], [VehicleColor], [VehicleDirectionId], [IsPlateVisible], [IsFaultyPlate], [IsStandardPlate], [IsWrongDirection], [IsReviewedRequired], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedPlateNumber], [ReviewedPlateVisible], [ReviewedPlateFaulty], [ReviewedPlateStandard], [ReviewedBy], [ReviewedDateTime], [ReviewedRemark], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (NULL, NULL, N'10.36.244.62', 2, N'f4241489-7617-4f38-ba9c-e4d2e9981495', CAST(N'2023-07-18T06:39:35.3540000' AS DateTime2), N'BR01EW9042', 3, N'VSDS/PlateImages/f4241489-7617-4f38-ba9c-e4d2e9981495.jpeg', N'VSDS/VehicleImages/f4241489-7617-4f38-ba9c-e4d2e9981495.jpeg', NULL, NULL, CAST(79.57 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2023-07-19T11:44:38.173' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_VSDSEventHistory] ([TransactionId], [EquipmentId], [EquipmentIP], [LaneNumber], [EventID], [EventDate], [PlateNumber], [VehicleClassId], [PlateImageUrl], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [RadarSpeed], [AllowedSpeed], [OcrConfidencelevel], [ClassConfidencelevel], [PlateFontColor], [PlateBackColor], [VehicleColor], [VehicleDirectionId], [IsPlateVisible], [IsFaultyPlate], [IsStandardPlate], [IsWrongDirection], [IsReviewedRequired], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedPlateNumber], [ReviewedPlateVisible], [ReviewedPlateFaulty], [ReviewedPlateStandard], [ReviewedBy], [ReviewedDateTime], [ReviewedRemark], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (NULL, NULL, N'10.47.89.82', 2, N'bc9efd54-c8e3-41a0-9f76-7c76daced341', CAST(N'2023-07-18T06:39:24.5510000' AS DateTime2), N'NOT FOUND', 3, N'VSDS/PlateImages/bc9efd54-c8e3-41a0-9f76-7c76daced341.jpeg', N'VSDS/VehicleImages/bc9efd54-c8e3-41a0-9f76-7c76daced341.jpeg', NULL, NULL, CAST(75.72 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2023-07-19T11:44:38.173' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_VSDSEventHistory] ([TransactionId], [EquipmentId], [EquipmentIP], [LaneNumber], [EventID], [EventDate], [PlateNumber], [VehicleClassId], [PlateImageUrl], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [RadarSpeed], [AllowedSpeed], [OcrConfidencelevel], [ClassConfidencelevel], [PlateFontColor], [PlateBackColor], [VehicleColor], [VehicleDirectionId], [IsPlateVisible], [IsFaultyPlate], [IsStandardPlate], [IsWrongDirection], [IsReviewedRequired], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedPlateNumber], [ReviewedPlateVisible], [ReviewedPlateFaulty], [ReviewedPlateStandard], [ReviewedBy], [ReviewedDateTime], [ReviewedRemark], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (NULL, NULL, N'10.48.28.63', 3, N'01d41a67-ff6a-4b71-b37f-a3691b6f2a32', CAST(N'2023-07-18T06:39:17.0730000' AS DateTime2), N'UP14LT8242', 6, N'VSDS/PlateImages/01d41a67-ff6a-4b71-b37f-a3691b6f2a32.jpeg', N'VSDS/VehicleImages/01d41a67-ff6a-4b71-b37f-a3691b6f2a32.jpeg', NULL, NULL, CAST(63.39 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2023-07-19T11:44:38.173' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_VSDSEventHistory] ([TransactionId], [EquipmentId], [EquipmentIP], [LaneNumber], [EventID], [EventDate], [PlateNumber], [VehicleClassId], [PlateImageUrl], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [RadarSpeed], [AllowedSpeed], [OcrConfidencelevel], [ClassConfidencelevel], [PlateFontColor], [PlateBackColor], [VehicleColor], [VehicleDirectionId], [IsPlateVisible], [IsFaultyPlate], [IsStandardPlate], [IsWrongDirection], [IsReviewedRequired], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedPlateNumber], [ReviewedPlateVisible], [ReviewedPlateFaulty], [ReviewedPlateStandard], [ReviewedBy], [ReviewedDateTime], [ReviewedRemark], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (NULL, NULL, N'10.36.244.63', 3, N'66213596-43af-4def-b26a-b95a577d5827', CAST(N'2023-07-18T06:38:46.6580000' AS DateTime2), N'221', 6, N'VSDS/PlateImages/66213596-43af-4def-b26a-b95a577d5827.jpeg', N'VSDS/VehicleImages/66213596-43af-4def-b26a-b95a577d5827.jpeg', NULL, NULL, CAST(44.17 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2023-07-19T11:44:38.173' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_VSDSEventHistory] ([TransactionId], [EquipmentId], [EquipmentIP], [LaneNumber], [EventID], [EventDate], [PlateNumber], [VehicleClassId], [PlateImageUrl], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [RadarSpeed], [AllowedSpeed], [OcrConfidencelevel], [ClassConfidencelevel], [PlateFontColor], [PlateBackColor], [VehicleColor], [VehicleDirectionId], [IsPlateVisible], [IsFaultyPlate], [IsStandardPlate], [IsWrongDirection], [IsReviewedRequired], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedPlateNumber], [ReviewedPlateVisible], [ReviewedPlateFaulty], [ReviewedPlateStandard], [ReviewedBy], [ReviewedDateTime], [ReviewedRemark], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (NULL, NULL, N'10.36.244.63', 3, N'0c7ad5d4-4464-43fc-b7c0-9679ca9fcbb0', CAST(N'2023-07-18T06:38:28.3150000' AS DateTime2), N'A1A18', 6, N'VSDS/PlateImages/0c7ad5d4-4464-43fc-b7c0-9679ca9fcbb0.jpeg', N'VSDS/VehicleImages/0c7ad5d4-4464-43fc-b7c0-9679ca9fcbb0.jpeg', NULL, NULL, CAST(73.98 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2023-07-19T11:44:38.173' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_VSDSEventHistory] ([TransactionId], [EquipmentId], [EquipmentIP], [LaneNumber], [EventID], [EventDate], [PlateNumber], [VehicleClassId], [PlateImageUrl], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [RadarSpeed], [AllowedSpeed], [OcrConfidencelevel], [ClassConfidencelevel], [PlateFontColor], [PlateBackColor], [VehicleColor], [VehicleDirectionId], [IsPlateVisible], [IsFaultyPlate], [IsStandardPlate], [IsWrongDirection], [IsReviewedRequired], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedPlateNumber], [ReviewedPlateVisible], [ReviewedPlateFaulty], [ReviewedPlateStandard], [ReviewedBy], [ReviewedDateTime], [ReviewedRemark], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (NULL, NULL, N'10.48.28.62', 2, N'741ef19e-8e85-4bae-87eb-947be626468f', CAST(N'2023-07-18T06:38:24.8090000' AS DateTime2), N'U18T4C', 5, N'VSDS/PlateImages/741ef19e-8e85-4bae-87eb-947be626468f.jpeg', N'VSDS/VehicleImages/741ef19e-8e85-4bae-87eb-947be626468f.jpeg', NULL, NULL, CAST(83.05 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2023-07-19T11:44:38.173' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_VSDSEventHistory] ([TransactionId], [EquipmentId], [EquipmentIP], [LaneNumber], [EventID], [EventDate], [PlateNumber], [VehicleClassId], [PlateImageUrl], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [RadarSpeed], [AllowedSpeed], [OcrConfidencelevel], [ClassConfidencelevel], [PlateFontColor], [PlateBackColor], [VehicleColor], [VehicleDirectionId], [IsPlateVisible], [IsFaultyPlate], [IsStandardPlate], [IsWrongDirection], [IsReviewedRequired], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedPlateNumber], [ReviewedPlateVisible], [ReviewedPlateFaulty], [ReviewedPlateStandard], [ReviewedBy], [ReviewedDateTime], [ReviewedRemark], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (NULL, NULL, N'10.36.244.63', 3, N'd88a2521-8273-4f43-8e54-fa79884a96d2', CAST(N'2023-07-18T06:38:23.5420000' AS DateTime2), N'NOT FOUND', 6, N'VSDS/PlateImages/d88a2521-8273-4f43-8e54-fa79884a96d2.jpeg', N'VSDS/VehicleImages/d88a2521-8273-4f43-8e54-fa79884a96d2.jpeg', NULL, NULL, CAST(48.28 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2023-07-19T11:44:38.173' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_VSDSEventHistory] ([TransactionId], [EquipmentId], [EquipmentIP], [LaneNumber], [EventID], [EventDate], [PlateNumber], [VehicleClassId], [PlateImageUrl], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [RadarSpeed], [AllowedSpeed], [OcrConfidencelevel], [ClassConfidencelevel], [PlateFontColor], [PlateBackColor], [VehicleColor], [VehicleDirectionId], [IsPlateVisible], [IsFaultyPlate], [IsStandardPlate], [IsWrongDirection], [IsReviewedRequired], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedPlateNumber], [ReviewedPlateVisible], [ReviewedPlateFaulty], [ReviewedPlateStandard], [ReviewedBy], [ReviewedDateTime], [ReviewedRemark], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (NULL, NULL, N'10.36.244.63', 3, N'3648f5da-acb9-421d-9b4f-d23d451cd6da', CAST(N'2023-07-18T06:38:16.6010000' AS DateTime2), N'HU', 5, N'VSDS/PlateImages/3648f5da-acb9-421d-9b4f-d23d451cd6da.jpeg', N'VSDS/VehicleImages/3648f5da-acb9-421d-9b4f-d23d451cd6da.jpeg', NULL, NULL, CAST(57.10 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2023-07-19T11:44:38.173' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_VSDSEventHistory] ([TransactionId], [EquipmentId], [EquipmentIP], [LaneNumber], [EventID], [EventDate], [PlateNumber], [VehicleClassId], [PlateImageUrl], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [RadarSpeed], [AllowedSpeed], [OcrConfidencelevel], [ClassConfidencelevel], [PlateFontColor], [PlateBackColor], [VehicleColor], [VehicleDirectionId], [IsPlateVisible], [IsFaultyPlate], [IsStandardPlate], [IsWrongDirection], [IsReviewedRequired], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedPlateNumber], [ReviewedPlateVisible], [ReviewedPlateFaulty], [ReviewedPlateStandard], [ReviewedBy], [ReviewedDateTime], [ReviewedRemark], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (NULL, NULL, N'10.48.28.61', 1, N'ad480a86-bb12-4cca-bc8a-89e3ab815e36', CAST(N'2023-07-18T06:38:01.9550000' AS DateTime2), N'434256', 6, N'VSDS/PlateImages/ad480a86-bb12-4cca-bc8a-89e3ab815e36.jpeg', N'VSDS/VehicleImages/ad480a86-bb12-4cca-bc8a-89e3ab815e36.jpeg', NULL, NULL, CAST(50.63 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2023-07-19T11:44:38.173' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_VSDSEventHistory] ([TransactionId], [EquipmentId], [EquipmentIP], [LaneNumber], [EventID], [EventDate], [PlateNumber], [VehicleClassId], [PlateImageUrl], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [RadarSpeed], [AllowedSpeed], [OcrConfidencelevel], [ClassConfidencelevel], [PlateFontColor], [PlateBackColor], [VehicleColor], [VehicleDirectionId], [IsPlateVisible], [IsFaultyPlate], [IsStandardPlate], [IsWrongDirection], [IsReviewedRequired], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedPlateNumber], [ReviewedPlateVisible], [ReviewedPlateFaulty], [ReviewedPlateStandard], [ReviewedBy], [ReviewedDateTime], [ReviewedRemark], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (NULL, NULL, N'10.36.244.62', 2, N'5050d648-413d-47cf-9d41-2748d4483f1a', CAST(N'2023-07-18T06:37:58.5420000' AS DateTime2), N'BR06CA3355', 3, N'VSDS/PlateImages/5050d648-413d-47cf-9d41-2748d4483f1a.jpeg', N'VSDS/VehicleImages/5050d648-413d-47cf-9d41-2748d4483f1a.jpeg', NULL, NULL, CAST(114.43 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2023-07-19T11:44:38.173' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_VSDSEventHistory] ([TransactionId], [EquipmentId], [EquipmentIP], [LaneNumber], [EventID], [EventDate], [PlateNumber], [VehicleClassId], [PlateImageUrl], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [RadarSpeed], [AllowedSpeed], [OcrConfidencelevel], [ClassConfidencelevel], [PlateFontColor], [PlateBackColor], [VehicleColor], [VehicleDirectionId], [IsPlateVisible], [IsFaultyPlate], [IsStandardPlate], [IsWrongDirection], [IsReviewedRequired], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedPlateNumber], [ReviewedPlateVisible], [ReviewedPlateFaulty], [ReviewedPlateStandard], [ReviewedBy], [ReviewedDateTime], [ReviewedRemark], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (NULL, NULL, N'10.47.89.82', 2, N'd14ed792-b503-4e88-8071-0bc2c517589a', CAST(N'2023-07-18T06:37:57.5020000' AS DateTime2), N'UP3GCT1150', 3, N'VSDS/PlateImages/d14ed792-b503-4e88-8071-0bc2c517589a.jpeg', N'VSDS/VehicleImages/d14ed792-b503-4e88-8071-0bc2c517589a.jpeg', NULL, NULL, CAST(86.15 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2023-07-19T11:44:38.173' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_VSDSEventHistory] ([TransactionId], [EquipmentId], [EquipmentIP], [LaneNumber], [EventID], [EventDate], [PlateNumber], [VehicleClassId], [PlateImageUrl], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [RadarSpeed], [AllowedSpeed], [OcrConfidencelevel], [ClassConfidencelevel], [PlateFontColor], [PlateBackColor], [VehicleColor], [VehicleDirectionId], [IsPlateVisible], [IsFaultyPlate], [IsStandardPlate], [IsWrongDirection], [IsReviewedRequired], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedPlateNumber], [ReviewedPlateVisible], [ReviewedPlateFaulty], [ReviewedPlateStandard], [ReviewedBy], [ReviewedDateTime], [ReviewedRemark], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (NULL, NULL, N'10.36.244.62', 2, N'54821cf1-e456-4d37-8fe1-f2e812c72afc', CAST(N'2023-07-18T06:37:42.4610000' AS DateTime2), N'DL2CAL4986', 3, N'VSDS/PlateImages/54821cf1-e456-4d37-8fe1-f2e812c72afc.jpeg', N'VSDS/VehicleImages/54821cf1-e456-4d37-8fe1-f2e812c72afc.jpeg', NULL, NULL, CAST(80.77 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2023-07-19T11:44:38.173' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_VSDSEventHistory] ([TransactionId], [EquipmentId], [EquipmentIP], [LaneNumber], [EventID], [EventDate], [PlateNumber], [VehicleClassId], [PlateImageUrl], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [RadarSpeed], [AllowedSpeed], [OcrConfidencelevel], [ClassConfidencelevel], [PlateFontColor], [PlateBackColor], [VehicleColor], [VehicleDirectionId], [IsPlateVisible], [IsFaultyPlate], [IsStandardPlate], [IsWrongDirection], [IsReviewedRequired], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedPlateNumber], [ReviewedPlateVisible], [ReviewedPlateFaulty], [ReviewedPlateStandard], [ReviewedBy], [ReviewedDateTime], [ReviewedRemark], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (NULL, NULL, N'10.36.244.61', 1, N'fc9adff9-5bc6-49a7-abda-2c12b0b215fd', CAST(N'2023-07-18T06:37:33.6600000' AS DateTime2), N'L1P61AU4222', 3, N'VSDS/PlateImages/fc9adff9-5bc6-49a7-abda-2c12b0b215fd.jpeg', N'VSDS/VehicleImages/fc9adff9-5bc6-49a7-abda-2c12b0b215fd.jpeg', NULL, NULL, CAST(58.09 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2023-07-19T11:44:38.173' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_VSDSEventHistory] ([TransactionId], [EquipmentId], [EquipmentIP], [LaneNumber], [EventID], [EventDate], [PlateNumber], [VehicleClassId], [PlateImageUrl], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [RadarSpeed], [AllowedSpeed], [OcrConfidencelevel], [ClassConfidencelevel], [PlateFontColor], [PlateBackColor], [VehicleColor], [VehicleDirectionId], [IsPlateVisible], [IsFaultyPlate], [IsStandardPlate], [IsWrongDirection], [IsReviewedRequired], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedPlateNumber], [ReviewedPlateVisible], [ReviewedPlateFaulty], [ReviewedPlateStandard], [ReviewedBy], [ReviewedDateTime], [ReviewedRemark], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (NULL, NULL, N'10.36.244.82', 2, N'dfe0886d-495a-47f8-a239-744ed5aac655', CAST(N'2023-07-18T06:37:17.7190000' AS DateTime2), N'UP61AU7273', 3, N'VSDS/PlateImages/dfe0886d-495a-47f8-a239-744ed5aac655.jpeg', N'VSDS/VehicleImages/dfe0886d-495a-47f8-a239-744ed5aac655.jpeg', NULL, NULL, CAST(112.67 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2023-07-19T11:44:38.173' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_VSDSEventHistory] ([TransactionId], [EquipmentId], [EquipmentIP], [LaneNumber], [EventID], [EventDate], [PlateNumber], [VehicleClassId], [PlateImageUrl], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [RadarSpeed], [AllowedSpeed], [OcrConfidencelevel], [ClassConfidencelevel], [PlateFontColor], [PlateBackColor], [VehicleColor], [VehicleDirectionId], [IsPlateVisible], [IsFaultyPlate], [IsStandardPlate], [IsWrongDirection], [IsReviewedRequired], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedPlateNumber], [ReviewedPlateVisible], [ReviewedPlateFaulty], [ReviewedPlateStandard], [ReviewedBy], [ReviewedDateTime], [ReviewedRemark], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (NULL, NULL, N'10.36.244.63', 3, N'095ed483-3af0-4bc9-bb7a-b786ba42b46c', CAST(N'2023-07-18T06:36:56.6050000' AS DateTime2), N'143E34ZL', 4, N'VSDS/PlateImages/095ed483-3af0-4bc9-bb7a-b786ba42b46c.jpeg', N'VSDS/VehicleImages/095ed483-3af0-4bc9-bb7a-b786ba42b46c.jpeg', NULL, NULL, CAST(56.93 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2023-07-19T11:44:38.173' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_VSDSEventHistory] ([TransactionId], [EquipmentId], [EquipmentIP], [LaneNumber], [EventID], [EventDate], [PlateNumber], [VehicleClassId], [PlateImageUrl], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [RadarSpeed], [AllowedSpeed], [OcrConfidencelevel], [ClassConfidencelevel], [PlateFontColor], [PlateBackColor], [VehicleColor], [VehicleDirectionId], [IsPlateVisible], [IsFaultyPlate], [IsStandardPlate], [IsWrongDirection], [IsReviewedRequired], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedPlateNumber], [ReviewedPlateVisible], [ReviewedPlateFaulty], [ReviewedPlateStandard], [ReviewedBy], [ReviewedDateTime], [ReviewedRemark], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (NULL, NULL, N'10.36.244.63', 3, N'5b66134b-b3ce-4a25-86f6-a9da9e6b9538', CAST(N'2023-07-18T06:36:49.5190000' AS DateTime2), N'NOT FOUND', 6, N'VSDS/PlateImages/5b66134b-b3ce-4a25-86f6-a9da9e6b9538.jpeg', N'VSDS/VehicleImages/5b66134b-b3ce-4a25-86f6-a9da9e6b9538.jpeg', NULL, NULL, CAST(65.76 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2023-07-19T11:44:38.173' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_VSDSEventHistory] ([TransactionId], [EquipmentId], [EquipmentIP], [LaneNumber], [EventID], [EventDate], [PlateNumber], [VehicleClassId], [PlateImageUrl], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [RadarSpeed], [AllowedSpeed], [OcrConfidencelevel], [ClassConfidencelevel], [PlateFontColor], [PlateBackColor], [VehicleColor], [VehicleDirectionId], [IsPlateVisible], [IsFaultyPlate], [IsStandardPlate], [IsWrongDirection], [IsReviewedRequired], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedPlateNumber], [ReviewedPlateVisible], [ReviewedPlateFaulty], [ReviewedPlateStandard], [ReviewedBy], [ReviewedDateTime], [ReviewedRemark], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (NULL, NULL, N'10.36.244.62', 2, N'fcc63b06-31f4-499f-9410-23311c51a826', CAST(N'2023-07-18T06:36:17.1060000' AS DateTime2), N'UP51AR0917', 3, N'VSDS/PlateImages/fcc63b06-31f4-499f-9410-23311c51a826.jpeg', N'VSDS/VehicleImages/fcc63b06-31f4-499f-9410-23311c51a826.jpeg', NULL, NULL, CAST(73.36 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2023-07-19T11:44:38.173' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_VSDSEventHistory] ([TransactionId], [EquipmentId], [EquipmentIP], [LaneNumber], [EventID], [EventDate], [PlateNumber], [VehicleClassId], [PlateImageUrl], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [RadarSpeed], [AllowedSpeed], [OcrConfidencelevel], [ClassConfidencelevel], [PlateFontColor], [PlateBackColor], [VehicleColor], [VehicleDirectionId], [IsPlateVisible], [IsFaultyPlate], [IsStandardPlate], [IsWrongDirection], [IsReviewedRequired], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedPlateNumber], [ReviewedPlateVisible], [ReviewedPlateFaulty], [ReviewedPlateStandard], [ReviewedBy], [ReviewedDateTime], [ReviewedRemark], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (NULL, NULL, N'10.36.244.61', 1, N'18b51266-0a0c-4be3-b7ae-96a38e88035b', CAST(N'2023-07-18T06:35:51.0320000' AS DateTime2), N'UP32LP4026', 3, N'VSDS/PlateImages/18b51266-0a0c-4be3-b7ae-96a38e88035b.jpeg', N'VSDS/VehicleImages/18b51266-0a0c-4be3-b7ae-96a38e88035b.jpeg', NULL, NULL, CAST(57.54 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2023-07-19T11:44:38.173' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_VSDSEventHistory] ([TransactionId], [EquipmentId], [EquipmentIP], [LaneNumber], [EventID], [EventDate], [PlateNumber], [VehicleClassId], [PlateImageUrl], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [RadarSpeed], [AllowedSpeed], [OcrConfidencelevel], [ClassConfidencelevel], [PlateFontColor], [PlateBackColor], [VehicleColor], [VehicleDirectionId], [IsPlateVisible], [IsFaultyPlate], [IsStandardPlate], [IsWrongDirection], [IsReviewedRequired], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedPlateNumber], [ReviewedPlateVisible], [ReviewedPlateFaulty], [ReviewedPlateStandard], [ReviewedBy], [ReviewedDateTime], [ReviewedRemark], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (NULL, NULL, N'10.48.28.62', 2, N'2e2fc903-2c94-4c4c-8033-30bddd7c8fb9', CAST(N'2023-07-18T06:35:49.4240000' AS DateTime2), N'UP32MZ2561', 3, N'VSDS/PlateImages/2e2fc903-2c94-4c4c-8033-30bddd7c8fb9.jpeg', N'VSDS/VehicleImages/2e2fc903-2c94-4c4c-8033-30bddd7c8fb9.jpeg', NULL, NULL, CAST(73.23 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2023-07-19T11:44:38.173' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_VSDSEventHistory] ([TransactionId], [EquipmentId], [EquipmentIP], [LaneNumber], [EventID], [EventDate], [PlateNumber], [VehicleClassId], [PlateImageUrl], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [RadarSpeed], [AllowedSpeed], [OcrConfidencelevel], [ClassConfidencelevel], [PlateFontColor], [PlateBackColor], [VehicleColor], [VehicleDirectionId], [IsPlateVisible], [IsFaultyPlate], [IsStandardPlate], [IsWrongDirection], [IsReviewedRequired], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedPlateNumber], [ReviewedPlateVisible], [ReviewedPlateFaulty], [ReviewedPlateStandard], [ReviewedBy], [ReviewedDateTime], [ReviewedRemark], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (NULL, NULL, N'10.36.244.61', 1, N'fe507c55-0445-4227-bbbb-9db314c4e081', CAST(N'2023-07-18T06:35:34.8670000' AS DateTime2), N'P', 6, N'VSDS/PlateImages/fe507c55-0445-4227-bbbb-9db314c4e081.jpeg', N'VSDS/VehicleImages/fe507c55-0445-4227-bbbb-9db314c4e081.jpeg', NULL, NULL, CAST(58.35 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2023-07-19T11:44:38.173' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_VSDSEventHistory] ([TransactionId], [EquipmentId], [EquipmentIP], [LaneNumber], [EventID], [EventDate], [PlateNumber], [VehicleClassId], [PlateImageUrl], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [RadarSpeed], [AllowedSpeed], [OcrConfidencelevel], [ClassConfidencelevel], [PlateFontColor], [PlateBackColor], [VehicleColor], [VehicleDirectionId], [IsPlateVisible], [IsFaultyPlate], [IsStandardPlate], [IsWrongDirection], [IsReviewedRequired], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedPlateNumber], [ReviewedPlateVisible], [ReviewedPlateFaulty], [ReviewedPlateStandard], [ReviewedBy], [ReviewedDateTime], [ReviewedRemark], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (NULL, NULL, N'10.48.28.62', 2, N'9179cf91-565c-4c0a-9eaa-0eeed5eb1f33', CAST(N'2023-07-18T06:35:31.9880000' AS DateTime2), N'A5', 3, N'VSDS/PlateImages/9179cf91-565c-4c0a-9eaa-0eeed5eb1f33.jpeg', N'VSDS/VehicleImages/9179cf91-565c-4c0a-9eaa-0eeed5eb1f33.jpeg', NULL, NULL, CAST(78.34 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2023-07-19T11:44:38.173' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_VSDSEventHistory] ([TransactionId], [EquipmentId], [EquipmentIP], [LaneNumber], [EventID], [EventDate], [PlateNumber], [VehicleClassId], [PlateImageUrl], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [RadarSpeed], [AllowedSpeed], [OcrConfidencelevel], [ClassConfidencelevel], [PlateFontColor], [PlateBackColor], [VehicleColor], [VehicleDirectionId], [IsPlateVisible], [IsFaultyPlate], [IsStandardPlate], [IsWrongDirection], [IsReviewedRequired], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedPlateNumber], [ReviewedPlateVisible], [ReviewedPlateFaulty], [ReviewedPlateStandard], [ReviewedBy], [ReviewedDateTime], [ReviewedRemark], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (NULL, NULL, N'10.36.244.82', 2, N'126a4bae-daea-496d-98df-138b8131d0c9', CAST(N'2023-07-18T06:35:18.1730000' AS DateTime2), N'DL01AB5834', 6, N'VSDS/PlateImages/126a4bae-daea-496d-98df-138b8131d0c9.jpeg', N'VSDS/VehicleImages/126a4bae-daea-496d-98df-138b8131d0c9.jpeg', NULL, NULL, CAST(82.92 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2023-07-19T11:44:38.173' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_VSDSEventHistory] ([TransactionId], [EquipmentId], [EquipmentIP], [LaneNumber], [EventID], [EventDate], [PlateNumber], [VehicleClassId], [PlateImageUrl], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [RadarSpeed], [AllowedSpeed], [OcrConfidencelevel], [ClassConfidencelevel], [PlateFontColor], [PlateBackColor], [VehicleColor], [VehicleDirectionId], [IsPlateVisible], [IsFaultyPlate], [IsStandardPlate], [IsWrongDirection], [IsReviewedRequired], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedPlateNumber], [ReviewedPlateVisible], [ReviewedPlateFaulty], [ReviewedPlateStandard], [ReviewedBy], [ReviewedDateTime], [ReviewedRemark], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (NULL, NULL, N'10.47.89.83', 3, N'521dea3e-1679-483a-84c0-bd09b3d9a823', CAST(N'2023-07-18T06:35:12.1420000' AS DateTime2), N'UP21DT3518', 5, N'VSDS/PlateImages/521dea3e-1679-483a-84c0-bd09b3d9a823.jpeg', N'VSDS/VehicleImages/521dea3e-1679-483a-84c0-bd09b3d9a823.jpeg', NULL, NULL, CAST(120.63 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2023-07-19T11:44:38.173' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_VSDSEventHistory] ([TransactionId], [EquipmentId], [EquipmentIP], [LaneNumber], [EventID], [EventDate], [PlateNumber], [VehicleClassId], [PlateImageUrl], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [RadarSpeed], [AllowedSpeed], [OcrConfidencelevel], [ClassConfidencelevel], [PlateFontColor], [PlateBackColor], [VehicleColor], [VehicleDirectionId], [IsPlateVisible], [IsFaultyPlate], [IsStandardPlate], [IsWrongDirection], [IsReviewedRequired], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedPlateNumber], [ReviewedPlateVisible], [ReviewedPlateFaulty], [ReviewedPlateStandard], [ReviewedBy], [ReviewedDateTime], [ReviewedRemark], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (NULL, NULL, N'10.36.244.83', 3, N'bfca528b-3747-41dc-8b35-a148ffe213ac', CAST(N'2023-07-18T06:33:44.6230000' AS DateTime2), N'UP32TN5932', 3, N'VSDS/PlateImages/bfca528b-3747-41dc-8b35-a148ffe213ac.jpeg', N'VSDS/VehicleImages/bfca528b-3747-41dc-8b35-a148ffe213ac.jpeg', NULL, NULL, CAST(52.62 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2023-07-19T11:44:38.173' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_VSDSEventHistory] ([TransactionId], [EquipmentId], [EquipmentIP], [LaneNumber], [EventID], [EventDate], [PlateNumber], [VehicleClassId], [PlateImageUrl], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [RadarSpeed], [AllowedSpeed], [OcrConfidencelevel], [ClassConfidencelevel], [PlateFontColor], [PlateBackColor], [VehicleColor], [VehicleDirectionId], [IsPlateVisible], [IsFaultyPlate], [IsStandardPlate], [IsWrongDirection], [IsReviewedRequired], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedPlateNumber], [ReviewedPlateVisible], [ReviewedPlateFaulty], [ReviewedPlateStandard], [ReviewedBy], [ReviewedDateTime], [ReviewedRemark], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (NULL, NULL, N'10.36.244.62', 2, N'18f0b917-11a9-4a6f-8216-4f834d173b84', CAST(N'2023-07-18T06:33:41.2220000' AS DateTime2), N'BR01EA9065', 3, N'VSDS/PlateImages/18f0b917-11a9-4a6f-8216-4f834d173b84.jpeg', N'VSDS/VehicleImages/18f0b917-11a9-4a6f-8216-4f834d173b84.jpeg', NULL, NULL, CAST(62.37 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2023-07-19T11:44:38.173' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_VSDSEventHistory] ([TransactionId], [EquipmentId], [EquipmentIP], [LaneNumber], [EventID], [EventDate], [PlateNumber], [VehicleClassId], [PlateImageUrl], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [RadarSpeed], [AllowedSpeed], [OcrConfidencelevel], [ClassConfidencelevel], [PlateFontColor], [PlateBackColor], [VehicleColor], [VehicleDirectionId], [IsPlateVisible], [IsFaultyPlate], [IsStandardPlate], [IsWrongDirection], [IsReviewedRequired], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedPlateNumber], [ReviewedPlateVisible], [ReviewedPlateFaulty], [ReviewedPlateStandard], [ReviewedBy], [ReviewedDateTime], [ReviewedRemark], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (NULL, NULL, N'10.36.244.82', 2, N'835cce8a-fd17-4e65-95c7-aac039415ac4', CAST(N'2023-07-18T06:33:00.1050000' AS DateTime2), N'UP65ER9221', 3, N'VSDS/PlateImages/835cce8a-fd17-4e65-95c7-aac039415ac4.jpeg', N'VSDS/VehicleImages/835cce8a-fd17-4e65-95c7-aac039415ac4.jpeg', NULL, NULL, CAST(50.87 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2023-07-19T11:44:38.173' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_VSDSEventHistory] ([TransactionId], [EquipmentId], [EquipmentIP], [LaneNumber], [EventID], [EventDate], [PlateNumber], [VehicleClassId], [PlateImageUrl], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [RadarSpeed], [AllowedSpeed], [OcrConfidencelevel], [ClassConfidencelevel], [PlateFontColor], [PlateBackColor], [VehicleColor], [VehicleDirectionId], [IsPlateVisible], [IsFaultyPlate], [IsStandardPlate], [IsWrongDirection], [IsReviewedRequired], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedPlateNumber], [ReviewedPlateVisible], [ReviewedPlateFaulty], [ReviewedPlateStandard], [ReviewedBy], [ReviewedDateTime], [ReviewedRemark], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (NULL, NULL, N'10.36.244.82', 2, N'3434140e-d6eb-42ff-9405-b544c7e7b009', CAST(N'2023-07-18T06:32:42.0730000' AS DateTime2), N'UP74TA0', 3, N'VSDS/PlateImages/3434140e-d6eb-42ff-9405-b544c7e7b009.jpeg', N'VSDS/VehicleImages/3434140e-d6eb-42ff-9405-b544c7e7b009.jpeg', NULL, NULL, CAST(63.92 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2023-07-19T11:44:38.173' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_VSDSEventHistory] ([TransactionId], [EquipmentId], [EquipmentIP], [LaneNumber], [EventID], [EventDate], [PlateNumber], [VehicleClassId], [PlateImageUrl], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [RadarSpeed], [AllowedSpeed], [OcrConfidencelevel], [ClassConfidencelevel], [PlateFontColor], [PlateBackColor], [VehicleColor], [VehicleDirectionId], [IsPlateVisible], [IsFaultyPlate], [IsStandardPlate], [IsWrongDirection], [IsReviewedRequired], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedPlateNumber], [ReviewedPlateVisible], [ReviewedPlateFaulty], [ReviewedPlateStandard], [ReviewedBy], [ReviewedDateTime], [ReviewedRemark], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (NULL, NULL, N'10.47.89.63', 3, N'17866038-ebf8-46f2-940d-3dc391f8e5e0', CAST(N'2023-07-18T06:31:55.5960000' AS DateTime2), N'RJ9GF4286', 6, N'VSDS/PlateImages/17866038-ebf8-46f2-940d-3dc391f8e5e0.jpeg', N'VSDS/VehicleImages/17866038-ebf8-46f2-940d-3dc391f8e5e0.jpeg', NULL, NULL, CAST(43.46 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2023-07-19T11:44:38.173' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_VSDSEventHistory] ([TransactionId], [EquipmentId], [EquipmentIP], [LaneNumber], [EventID], [EventDate], [PlateNumber], [VehicleClassId], [PlateImageUrl], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [RadarSpeed], [AllowedSpeed], [OcrConfidencelevel], [ClassConfidencelevel], [PlateFontColor], [PlateBackColor], [VehicleColor], [VehicleDirectionId], [IsPlateVisible], [IsFaultyPlate], [IsStandardPlate], [IsWrongDirection], [IsReviewedRequired], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedPlateNumber], [ReviewedPlateVisible], [ReviewedPlateFaulty], [ReviewedPlateStandard], [ReviewedBy], [ReviewedDateTime], [ReviewedRemark], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (NULL, NULL, N'10.36.244.83', 3, N'4d1ba0c1-a603-4d5a-abcf-239f8b8ca36e', CAST(N'2023-07-18T06:31:55.1170000' AS DateTime2), N'8R01GH', 3, N'VSDS/PlateImages/4d1ba0c1-a603-4d5a-abcf-239f8b8ca36e.jpeg', N'VSDS/VehicleImages/4d1ba0c1-a603-4d5a-abcf-239f8b8ca36e.jpeg', NULL, NULL, CAST(39.83 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2023-07-19T11:44:38.173' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_VSDSEventHistory] ([TransactionId], [EquipmentId], [EquipmentIP], [LaneNumber], [EventID], [EventDate], [PlateNumber], [VehicleClassId], [PlateImageUrl], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [RadarSpeed], [AllowedSpeed], [OcrConfidencelevel], [ClassConfidencelevel], [PlateFontColor], [PlateBackColor], [VehicleColor], [VehicleDirectionId], [IsPlateVisible], [IsFaultyPlate], [IsStandardPlate], [IsWrongDirection], [IsReviewedRequired], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedPlateNumber], [ReviewedPlateVisible], [ReviewedPlateFaulty], [ReviewedPlateStandard], [ReviewedBy], [ReviewedDateTime], [ReviewedRemark], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (NULL, NULL, N'10.47.89.83', 3, N'24413c98-3bdc-4b8b-8aaa-b790edd04c3c', CAST(N'2023-07-18T06:30:54.1630000' AS DateTime2), N'HR55AJ5552', 6, N'VSDS/PlateImages/24413c98-3bdc-4b8b-8aaa-b790edd04c3c.jpeg', N'VSDS/VehicleImages/24413c98-3bdc-4b8b-8aaa-b790edd04c3c.jpeg', NULL, NULL, CAST(43.55 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2023-07-19T11:44:38.173' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_VSDSEventHistory] ([TransactionId], [EquipmentId], [EquipmentIP], [LaneNumber], [EventID], [EventDate], [PlateNumber], [VehicleClassId], [PlateImageUrl], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [RadarSpeed], [AllowedSpeed], [OcrConfidencelevel], [ClassConfidencelevel], [PlateFontColor], [PlateBackColor], [VehicleColor], [VehicleDirectionId], [IsPlateVisible], [IsFaultyPlate], [IsStandardPlate], [IsWrongDirection], [IsReviewedRequired], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedPlateNumber], [ReviewedPlateVisible], [ReviewedPlateFaulty], [ReviewedPlateStandard], [ReviewedBy], [ReviewedDateTime], [ReviewedRemark], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (NULL, NULL, N'10.48.28.83', 3, N'8b30ddf3-f077-4113-bfb2-534b327dd577', CAST(N'2023-07-18T06:30:50.6390000' AS DateTime2), N'JHF0TP8272', 4, N'VSDS/PlateImages/8b30ddf3-f077-4113-bfb2-534b327dd577.jpeg', N'VSDS/VehicleImages/8b30ddf3-f077-4113-bfb2-534b327dd577.jpeg', NULL, NULL, CAST(40.96 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2023-07-19T11:44:38.173' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_VSDSEventHistory] ([TransactionId], [EquipmentId], [EquipmentIP], [LaneNumber], [EventID], [EventDate], [PlateNumber], [VehicleClassId], [PlateImageUrl], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [RadarSpeed], [AllowedSpeed], [OcrConfidencelevel], [ClassConfidencelevel], [PlateFontColor], [PlateBackColor], [VehicleColor], [VehicleDirectionId], [IsPlateVisible], [IsFaultyPlate], [IsStandardPlate], [IsWrongDirection], [IsReviewedRequired], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedPlateNumber], [ReviewedPlateVisible], [ReviewedPlateFaulty], [ReviewedPlateStandard], [ReviewedBy], [ReviewedDateTime], [ReviewedRemark], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (NULL, NULL, N'10.36.244.62', 2, N'b9ed416f-2aaa-45f4-8410-29ac56bfd8ad', CAST(N'2023-07-18T06:30:43.3290000' AS DateTime2), N'8Z9331', 3, N'VSDS/PlateImages/b9ed416f-2aaa-45f4-8410-29ac56bfd8ad.jpeg', N'VSDS/VehicleImages/b9ed416f-2aaa-45f4-8410-29ac56bfd8ad.jpeg', NULL, NULL, CAST(62.73 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2023-07-19T11:44:38.173' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_VSDSEventHistory] ([TransactionId], [EquipmentId], [EquipmentIP], [LaneNumber], [EventID], [EventDate], [PlateNumber], [VehicleClassId], [PlateImageUrl], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [RadarSpeed], [AllowedSpeed], [OcrConfidencelevel], [ClassConfidencelevel], [PlateFontColor], [PlateBackColor], [VehicleColor], [VehicleDirectionId], [IsPlateVisible], [IsFaultyPlate], [IsStandardPlate], [IsWrongDirection], [IsReviewedRequired], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedPlateNumber], [ReviewedPlateVisible], [ReviewedPlateFaulty], [ReviewedPlateStandard], [ReviewedBy], [ReviewedDateTime], [ReviewedRemark], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (NULL, NULL, N'10.48.28.83', 3, N'87f4a13a-914c-4a07-9509-5f1f15259744', CAST(N'2023-07-18T06:30:42.2270000' AS DateTime2), N'UP70FT8222', 6, N'VSDS/PlateImages/87f4a13a-914c-4a07-9509-5f1f15259744.jpeg', N'VSDS/VehicleImages/87f4a13a-914c-4a07-9509-5f1f15259744.jpeg', NULL, NULL, CAST(44.80 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2023-07-19T11:44:38.173' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_VSDSEventHistory] ([TransactionId], [EquipmentId], [EquipmentIP], [LaneNumber], [EventID], [EventDate], [PlateNumber], [VehicleClassId], [PlateImageUrl], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [RadarSpeed], [AllowedSpeed], [OcrConfidencelevel], [ClassConfidencelevel], [PlateFontColor], [PlateBackColor], [VehicleColor], [VehicleDirectionId], [IsPlateVisible], [IsFaultyPlate], [IsStandardPlate], [IsWrongDirection], [IsReviewedRequired], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedPlateNumber], [ReviewedPlateVisible], [ReviewedPlateFaulty], [ReviewedPlateStandard], [ReviewedBy], [ReviewedDateTime], [ReviewedRemark], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (NULL, NULL, N'10.36.244.82', 2, N'3b9ca038-c542-4726-adc7-6ef11142d789', CAST(N'2023-07-18T06:30:19.5760000' AS DateTime2), N'22BH9429E', 3, N'VSDS/PlateImages/3b9ca038-c542-4726-adc7-6ef11142d789.jpeg', N'VSDS/VehicleImages/3b9ca038-c542-4726-adc7-6ef11142d789.jpeg', NULL, NULL, CAST(65.77 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2023-07-19T11:44:38.173' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_VSDSEventHistory] ([TransactionId], [EquipmentId], [EquipmentIP], [LaneNumber], [EventID], [EventDate], [PlateNumber], [VehicleClassId], [PlateImageUrl], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [RadarSpeed], [AllowedSpeed], [OcrConfidencelevel], [ClassConfidencelevel], [PlateFontColor], [PlateBackColor], [VehicleColor], [VehicleDirectionId], [IsPlateVisible], [IsFaultyPlate], [IsStandardPlate], [IsWrongDirection], [IsReviewedRequired], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedPlateNumber], [ReviewedPlateVisible], [ReviewedPlateFaulty], [ReviewedPlateStandard], [ReviewedBy], [ReviewedDateTime], [ReviewedRemark], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (NULL, NULL, N'10.47.89.82', 2, N'784a0da6-cc20-4fbb-afd7-f5f201e0952b', CAST(N'2023-07-18T06:30:03.4440000' AS DateTime2), N'DL46P5742', 3, N'VSDS/PlateImages/784a0da6-cc20-4fbb-afd7-f5f201e0952b.jpeg', N'VSDS/VehicleImages/784a0da6-cc20-4fbb-afd7-f5f201e0952b.jpeg', NULL, NULL, CAST(81.89 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2023-07-19T11:44:38.173' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_VSDSEventHistory] ([TransactionId], [EquipmentId], [EquipmentIP], [LaneNumber], [EventID], [EventDate], [PlateNumber], [VehicleClassId], [PlateImageUrl], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [RadarSpeed], [AllowedSpeed], [OcrConfidencelevel], [ClassConfidencelevel], [PlateFontColor], [PlateBackColor], [VehicleColor], [VehicleDirectionId], [IsPlateVisible], [IsFaultyPlate], [IsStandardPlate], [IsWrongDirection], [IsReviewedRequired], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedPlateNumber], [ReviewedPlateVisible], [ReviewedPlateFaulty], [ReviewedPlateStandard], [ReviewedBy], [ReviewedDateTime], [ReviewedRemark], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (NULL, NULL, N'10.36.244.61', 1, N'5187a74a-6df7-45bc-acf3-5a1b424152e8', CAST(N'2023-07-18T06:30:00.1830000' AS DateTime2), N'NOT FOUND', 3, N'VSDS/PlateImages/5187a74a-6df7-45bc-acf3-5a1b424152e8.jpeg', N'VSDS/VehicleImages/5187a74a-6df7-45bc-acf3-5a1b424152e8.jpeg', NULL, NULL, CAST(83.33 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2023-07-19T11:44:38.173' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_VSDSEventHistory] ([TransactionId], [EquipmentId], [EquipmentIP], [LaneNumber], [EventID], [EventDate], [PlateNumber], [VehicleClassId], [PlateImageUrl], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [RadarSpeed], [AllowedSpeed], [OcrConfidencelevel], [ClassConfidencelevel], [PlateFontColor], [PlateBackColor], [VehicleColor], [VehicleDirectionId], [IsPlateVisible], [IsFaultyPlate], [IsStandardPlate], [IsWrongDirection], [IsReviewedRequired], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedPlateNumber], [ReviewedPlateVisible], [ReviewedPlateFaulty], [ReviewedPlateStandard], [ReviewedBy], [ReviewedDateTime], [ReviewedRemark], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (NULL, NULL, N'10.36.244.82', 2, N'66a79e8e-96b3-4380-ab04-c39e61dbdebc', CAST(N'2023-07-18T06:29:42.0010000' AS DateTime2), N'UP32MH7053', 3, N'VSDS/PlateImages/66a79e8e-96b3-4380-ab04-c39e61dbdebc.jpeg', N'VSDS/VehicleImages/66a79e8e-96b3-4380-ab04-c39e61dbdebc.jpeg', NULL, NULL, CAST(65.29 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2023-07-19T11:44:38.173' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_VSDSEventHistory] ([TransactionId], [EquipmentId], [EquipmentIP], [LaneNumber], [EventID], [EventDate], [PlateNumber], [VehicleClassId], [PlateImageUrl], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [RadarSpeed], [AllowedSpeed], [OcrConfidencelevel], [ClassConfidencelevel], [PlateFontColor], [PlateBackColor], [VehicleColor], [VehicleDirectionId], [IsPlateVisible], [IsFaultyPlate], [IsStandardPlate], [IsWrongDirection], [IsReviewedRequired], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedPlateNumber], [ReviewedPlateVisible], [ReviewedPlateFaulty], [ReviewedPlateStandard], [ReviewedBy], [ReviewedDateTime], [ReviewedRemark], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (NULL, NULL, N'10.48.28.81', 1, N'21ef312b-8a53-4fe8-b900-3a1c9218a1af', CAST(N'2023-07-18T06:29:39.0370000' AS DateTime2), N'JE3', 6, N'VSDS/PlateImages/21ef312b-8a53-4fe8-b900-3a1c9218a1af.jpeg', N'VSDS/VehicleImages/21ef312b-8a53-4fe8-b900-3a1c9218a1af.jpeg', NULL, NULL, CAST(41.14 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2023-07-19T11:44:38.173' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_VSDSEventHistory] ([TransactionId], [EquipmentId], [EquipmentIP], [LaneNumber], [EventID], [EventDate], [PlateNumber], [VehicleClassId], [PlateImageUrl], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [RadarSpeed], [AllowedSpeed], [OcrConfidencelevel], [ClassConfidencelevel], [PlateFontColor], [PlateBackColor], [VehicleColor], [VehicleDirectionId], [IsPlateVisible], [IsFaultyPlate], [IsStandardPlate], [IsWrongDirection], [IsReviewedRequired], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedPlateNumber], [ReviewedPlateVisible], [ReviewedPlateFaulty], [ReviewedPlateStandard], [ReviewedBy], [ReviewedDateTime], [ReviewedRemark], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (NULL, NULL, N'10.36.244.81', 1, N'19bb4b6b-6148-4d75-b4e9-117efce6b2e4', CAST(N'2023-07-18T06:29:28.7090000' AS DateTime2), N'UP85CF4539', 3, N'VSDS/PlateImages/19bb4b6b-6148-4d75-b4e9-117efce6b2e4.jpeg', N'VSDS/VehicleImages/19bb4b6b-6148-4d75-b4e9-117efce6b2e4.jpeg', NULL, NULL, CAST(88.89 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2023-07-19T11:44:38.173' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_VSDSEventHistory] ([TransactionId], [EquipmentId], [EquipmentIP], [LaneNumber], [EventID], [EventDate], [PlateNumber], [VehicleClassId], [PlateImageUrl], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [RadarSpeed], [AllowedSpeed], [OcrConfidencelevel], [ClassConfidencelevel], [PlateFontColor], [PlateBackColor], [VehicleColor], [VehicleDirectionId], [IsPlateVisible], [IsFaultyPlate], [IsStandardPlate], [IsWrongDirection], [IsReviewedRequired], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedPlateNumber], [ReviewedPlateVisible], [ReviewedPlateFaulty], [ReviewedPlateStandard], [ReviewedBy], [ReviewedDateTime], [ReviewedRemark], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (NULL, NULL, N'10.36.244.63', 3, N'def9ca71-5991-42a2-86df-a33615ad144e', CAST(N'2023-07-18T06:29:22.0360000' AS DateTime2), N'J3P84T8', 4, N'VSDS/PlateImages/def9ca71-5991-42a2-86df-a33615ad144e.jpeg', N'VSDS/VehicleImages/def9ca71-5991-42a2-86df-a33615ad144e.jpeg', NULL, NULL, CAST(57.13 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2023-07-19T11:44:38.173' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_VSDSEventHistory] ([TransactionId], [EquipmentId], [EquipmentIP], [LaneNumber], [EventID], [EventDate], [PlateNumber], [VehicleClassId], [PlateImageUrl], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [RadarSpeed], [AllowedSpeed], [OcrConfidencelevel], [ClassConfidencelevel], [PlateFontColor], [PlateBackColor], [VehicleColor], [VehicleDirectionId], [IsPlateVisible], [IsFaultyPlate], [IsStandardPlate], [IsWrongDirection], [IsReviewedRequired], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedPlateNumber], [ReviewedPlateVisible], [ReviewedPlateFaulty], [ReviewedPlateStandard], [ReviewedBy], [ReviewedDateTime], [ReviewedRemark], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (NULL, NULL, N'10.48.28.81', 1, N'9b6017b3-2277-4051-859b-ec34bc3e674b', CAST(N'2023-07-18T06:29:18.5110000' AS DateTime2), N'NOT FOUND', 5, N'VSDS/PlateImages/9b6017b3-2277-4051-859b-ec34bc3e674b.jpeg', N'VSDS/VehicleImages/9b6017b3-2277-4051-859b-ec34bc3e674b.jpeg', NULL, NULL, CAST(41.69 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2023-07-19T11:44:38.173' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_VSDSEventHistory] ([TransactionId], [EquipmentId], [EquipmentIP], [LaneNumber], [EventID], [EventDate], [PlateNumber], [VehicleClassId], [PlateImageUrl], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [RadarSpeed], [AllowedSpeed], [OcrConfidencelevel], [ClassConfidencelevel], [PlateFontColor], [PlateBackColor], [VehicleColor], [VehicleDirectionId], [IsPlateVisible], [IsFaultyPlate], [IsStandardPlate], [IsWrongDirection], [IsReviewedRequired], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedPlateNumber], [ReviewedPlateVisible], [ReviewedPlateFaulty], [ReviewedPlateStandard], [ReviewedBy], [ReviewedDateTime], [ReviewedRemark], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (NULL, NULL, N'10.36.244.63', 3, N'17b08031-65cd-4104-a2ea-ec81002cf4cf', CAST(N'2023-07-18T06:29:17.2300000' AS DateTime2), N'FJ', 6, N'VSDS/PlateImages/17b08031-65cd-4104-a2ea-ec81002cf4cf.jpeg', N'VSDS/VehicleImages/17b08031-65cd-4104-a2ea-ec81002cf4cf.jpeg', NULL, NULL, CAST(70.42 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2023-07-19T11:44:38.173' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_VSDSEventHistory] ([TransactionId], [EquipmentId], [EquipmentIP], [LaneNumber], [EventID], [EventDate], [PlateNumber], [VehicleClassId], [PlateImageUrl], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [RadarSpeed], [AllowedSpeed], [OcrConfidencelevel], [ClassConfidencelevel], [PlateFontColor], [PlateBackColor], [VehicleColor], [VehicleDirectionId], [IsPlateVisible], [IsFaultyPlate], [IsStandardPlate], [IsWrongDirection], [IsReviewedRequired], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedPlateNumber], [ReviewedPlateVisible], [ReviewedPlateFaulty], [ReviewedPlateStandard], [ReviewedBy], [ReviewedDateTime], [ReviewedRemark], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (NULL, NULL, N'10.36.244.62', 2, N'83f30192-fb54-426b-b7d2-95b5e94763fe', CAST(N'2023-07-18T06:28:59.9660000' AS DateTime2), N'UP32JF0999', 3, N'VSDS/PlateImages/83f30192-fb54-426b-b7d2-95b5e94763fe.jpeg', N'VSDS/VehicleImages/83f30192-fb54-426b-b7d2-95b5e94763fe.jpeg', NULL, NULL, CAST(65.06 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2023-07-19T11:44:38.173' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_VSDSEventHistory] ([TransactionId], [EquipmentId], [EquipmentIP], [LaneNumber], [EventID], [EventDate], [PlateNumber], [VehicleClassId], [PlateImageUrl], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [RadarSpeed], [AllowedSpeed], [OcrConfidencelevel], [ClassConfidencelevel], [PlateFontColor], [PlateBackColor], [VehicleColor], [VehicleDirectionId], [IsPlateVisible], [IsFaultyPlate], [IsStandardPlate], [IsWrongDirection], [IsReviewedRequired], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedPlateNumber], [ReviewedPlateVisible], [ReviewedPlateFaulty], [ReviewedPlateStandard], [ReviewedBy], [ReviewedDateTime], [ReviewedRemark], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (NULL, NULL, N'10.47.89.82', 2, N'02330bbe-0d67-4f00-88c4-ac53eab827cb', CAST(N'2023-07-18T06:28:52.7350000' AS DateTime2), N'NOT FOUND', 3, N'VSDS/PlateImages/02330bbe-0d67-4f00-88c4-ac53eab827cb.jpeg', N'VSDS/VehicleImages/02330bbe-0d67-4f00-88c4-ac53eab827cb.jpeg', NULL, NULL, CAST(73.34 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2023-07-19T11:44:38.173' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_VSDSEventHistory] ([TransactionId], [EquipmentId], [EquipmentIP], [LaneNumber], [EventID], [EventDate], [PlateNumber], [VehicleClassId], [PlateImageUrl], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [RadarSpeed], [AllowedSpeed], [OcrConfidencelevel], [ClassConfidencelevel], [PlateFontColor], [PlateBackColor], [VehicleColor], [VehicleDirectionId], [IsPlateVisible], [IsFaultyPlate], [IsStandardPlate], [IsWrongDirection], [IsReviewedRequired], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedPlateNumber], [ReviewedPlateVisible], [ReviewedPlateFaulty], [ReviewedPlateStandard], [ReviewedBy], [ReviewedDateTime], [ReviewedRemark], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (NULL, NULL, N'10.36.244.83', 3, N'3121ad67-7db9-41cc-a14d-64c6c11dd687', CAST(N'2023-07-18T06:28:38.0510000' AS DateTime2), N'PB74C1152', 3, N'VSDS/PlateImages/3121ad67-7db9-41cc-a14d-64c6c11dd687.jpeg', N'VSDS/VehicleImages/3121ad67-7db9-41cc-a14d-64c6c11dd687.jpeg', NULL, NULL, CAST(45.65 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2023-07-19T11:44:38.173' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[tbl_VSDSEventHistory] ([TransactionId], [EquipmentId], [EquipmentIP], [LaneNumber], [EventID], [EventDate], [PlateNumber], [VehicleClassId], [PlateImageUrl], [VehicleImageUrl], [VehicleVideoUrl], [CameraSpeed], [RadarSpeed], [AllowedSpeed], [OcrConfidencelevel], [ClassConfidencelevel], [PlateFontColor], [PlateBackColor], [VehicleColor], [VehicleDirectionId], [IsPlateVisible], [IsFaultyPlate], [IsStandardPlate], [IsWrongDirection], [IsReviewedRequired], [ReviewedStatus], [ReviewedVehicleClassId], [ReviewedPlateNumber], [ReviewedPlateVisible], [ReviewedPlateFaulty], [ReviewedPlateStandard], [ReviewedBy], [ReviewedDateTime], [ReviewedRemark], [IsChallanRequired], [ChallanTypeId], [ChallanStatusId], [ChallanRemark], [CreatedDate], [SystemProviderId], [DataSendStatus], [MediaSendStatus]) VALUES (NULL, NULL, N'10.36.244.62', 2, N'444ece4d-f1c6-40aa-a2eb-8c313ba1ee1b', CAST(N'2023-07-18T06:28:34.0780000' AS DateTime2), N'UP50BC7077', 3, N'VSDS/PlateImages/444ece4d-f1c6-40aa-a2eb-8c313ba1ee1b.jpeg', N'VSDS/VehicleImages/444ece4d-f1c6-40aa-a2eb-8c313ba1ee1b.jpeg', NULL, NULL, CAST(51.89 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2023-07-19T11:44:38.173' AS DateTime), NULL, 0, 0)
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
ALTER TABLE [dbo].[tbl_ATCCEventHistory] ADD  DEFAULT ((0)) FOR [VehicleDirectionId]
GO
ALTER TABLE [dbo].[tbl_ATCCEventHistory] ADD  DEFAULT ((0)) FOR [IsWrongDirection]
GO
ALTER TABLE [dbo].[tbl_ATCCEventHistory] ADD  DEFAULT ((0)) FOR [IsReviewedRequired]
GO
ALTER TABLE [dbo].[tbl_ATCCEventHistory] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[tbl_ATCCEventHistory] ADD  DEFAULT ((0)) FOR [DataSendStatus]
GO
ALTER TABLE [dbo].[tbl_ATCCEventHistory] ADD  DEFAULT ((0)) FOR [MediaSendStatus]
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
ALTER TABLE [dbo].[tbl_VSDSEventHistory] ADD  DEFAULT ((0)) FOR [VehicleDirectionId]
GO
ALTER TABLE [dbo].[tbl_VSDSEventHistory] ADD  DEFAULT ((0)) FOR [IsPlateVisible]
GO
ALTER TABLE [dbo].[tbl_VSDSEventHistory] ADD  DEFAULT ((0)) FOR [IsFaultyPlate]
GO
ALTER TABLE [dbo].[tbl_VSDSEventHistory] ADD  DEFAULT ((0)) FOR [IsStandardPlate]
GO
ALTER TABLE [dbo].[tbl_VSDSEventHistory] ADD  DEFAULT ((0)) FOR [IsWrongDirection]
GO
ALTER TABLE [dbo].[tbl_VSDSEventHistory] ADD  DEFAULT ((0)) FOR [IsReviewedRequired]
GO
ALTER TABLE [dbo].[tbl_VSDSEventHistory] ADD  DEFAULT ((0)) FOR [ReviewedPlateVisible]
GO
ALTER TABLE [dbo].[tbl_VSDSEventHistory] ADD  DEFAULT ((0)) FOR [ReviewedPlateFaulty]
GO
ALTER TABLE [dbo].[tbl_VSDSEventHistory] ADD  DEFAULT ((0)) FOR [ReviewedPlateStandard]
GO
ALTER TABLE [dbo].[tbl_VSDSEventHistory] ADD  DEFAULT ((0)) FOR [IsChallanRequired]
GO
ALTER TABLE [dbo].[tbl_VSDSEventHistory] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[tbl_VSDSEventHistory] ADD  DEFAULT ((0)) FOR [DataSendStatus]
GO
ALTER TABLE [dbo].[tbl_VSDSEventHistory] ADD  DEFAULT ((0)) FOR [MediaSendStatus]
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
/****** Object:  StoredProcedure [dbo].[USP_ControlRoomGetAll]    Script Date: 31-07-2023 16:26:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_ControlRoomGetAll]
AS BEGIN
	SELECT * FROM tbl_ControlRoomMaster
END
GO
/****** Object:  StoredProcedure [dbo].[USP_ControlRoomGetById]    Script Date: 31-07-2023 16:26:12 ******/
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
/****** Object:  StoredProcedure [dbo].[USP_ControlRoomInsertUpdate]    Script Date: 31-07-2023 16:26:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_ControlRoomInsertUpdate] 
@ControlRoomId bigint,
@ControlRoomName varchar(200),
@ChainageNumber decimal(16, 3),
@Latitude decimal(8, 6),
@Longitude decimal(9, 6),
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
/****** Object:  StoredProcedure [dbo].[USP_EquipmentConfigGetBySystemId]    Script Date: 31-07-2023 16:26:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[USP_EquipmentConfigGetBySystemId]
@SystemId smallint
AS BEGIN
	SELECT C.EquipmentId,C.EquipmentTypeId,M.EquipmentTypeName,ChainageNumber,EquipmentName,IpAddress,ParentId,PositionId FROM tbl_EquipmentConfig C 
	INNER JOIN tbl_EquipmentDetails E ON C.EquipmentId=E.EquipmentId
	INNER JOIN tbl_EquipmentTypeMaster M ON C.EquipmentTypeId=M.EquipmentTypeId
	WHERE C.SystemId=@SystemId ORDER BY OrderBy
END
--GO
--EXEC USP_EquipmentConfigGetBySystemId
--@SystemId=6
GO
/****** Object:  StoredProcedure [dbo].[USP_EquipmentConfigInsertUpdate]    Script Date: 31-07-2023 16:26:12 ******/
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
	DECLARE @ActionId varchar(100)
	CREATE TABLE #Temp(AlertMessage varchar(100))
	BEGIN TRY  
		SELECT @MenuId=MenuId FROM tbl_MenuMaster WHERE MenuName ='Equipment Config' AND SystemId=@SystemId
		SELECT @ActionId=SystemName FROM tbl_SystemMaster WHERE SystemId=@SystemId
		CREATE TABLE #EquipmentConfig(id bigint identity,SystemId smallint,EquipmentTypeId smallint,EquipmentId bigint,
		ParentId bigint,PositionId smallint,SessionId varchar(10),ChildCount smallint default 0)

		INSERT INTO #EquipmentConfig(SystemId,EquipmentTypeId,EquipmentId,ParentId,PositionId,SessionId)
		SELECT SystemId,EquipmentTypeId,EquipmentId,ParentId,PositionId,SessionId FROM temp_EquipmentConfig
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
		IF (ISNULL(@PositionCount,0)>1)
		BEGIN
			INSERT INTO #Temp(AlertMessage)
			VALUES('Equipment postion is must be unique!')
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
		
				INSERT INTO tbl_EquipmentConfig(SystemId,EquipmentTypeId,EquipmentId,ParentId,PositionId,OrderBy,CreatedDate,CreatedBy,ModifiedDate,ModifiedBy)
				SELECT SystemId,EquipmentTypeId,EquipmentId,ParentId,PositionId,id,@CreatedDate,@CreatedBy,@ModifiedDate,@ModifiedBy 
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
/****** Object:  StoredProcedure [dbo].[USP_EquipmentDetailsGetAll]    Script Date: 31-07-2023 16:26:12 ******/
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
/****** Object:  StoredProcedure [dbo].[USP_EquipmentDetailsGetById]    Script Date: 31-07-2023 16:26:12 ******/
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
/****** Object:  StoredProcedure [dbo].[USP_EquipmentDetailsGetBySystemId]    Script Date: 31-07-2023 16:26:12 ******/
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
/****** Object:  StoredProcedure [dbo].[USP_EquipmentDetailsInsertUpdate]    Script Date: 31-07-2023 16:26:12 ******/
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
@Latitude decimal(8,6),
@Longitude	decimal(9,6) ,  
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
/****** Object:  StoredProcedure [dbo].[USP_EquipmentTypeMasterGetAll]    Script Date: 31-07-2023 16:26:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_EquipmentTypeMasterGetAll]
AS BEGIN
	SELECT * FROM tbl_EquipmentTypeMaster ORDER BY EquipmentLevel
END
GO
/****** Object:  StoredProcedure [dbo].[USP_ErrorInfoInsert]    Script Date: 31-07-2023 16:26:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_ErrorInfoInsert]

AS  INSERT INTO tbl_ErrorInfo(ErrorNumber,ErrorSeverity,ErrorState,ErrorProcedure,ErrorLine,ErrorMessage)
	SELECT ERROR_NUMBER() AS ErrorNumber,ERROR_SEVERITY() AS ErrorSeverity,ERROR_STATE() AS ErrorState,
	ERROR_PROCEDURE() AS ErrorProcedure,ERROR_LINE() AS ErrorLine ,ERROR_MESSAGE() AS ErrorMessage;  
GO
/****** Object:  StoredProcedure [dbo].[USP_EventsTypeMasterGetAll]    Script Date: 31-07-2023 16:26:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_EventsTypeMasterGetAll]
AS BEGIN
	SELECT * FROM tbl_EventsTypeMaster
END
GO
/****** Object:  StoredProcedure [dbo].[USP_EventsTypeMasterGetBySystemId]    Script Date: 31-07-2023 16:26:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_EventsTypeMasterGetBySystemId]
@SystemId smallint
AS BEGIN
	SELECT * FROM tbl_EventsTypeMaster
	WHERE SystemId =@SystemId 
END
GO
/****** Object:  StoredProcedure [dbo].[USP_EventsTypeUpdate]    Script Date: 31-07-2023 16:26:12 ******/
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
/****** Object:  StoredProcedure [dbo].[USP_IncidentActionHistorGetById]    Script Date: 31-07-2023 16:26:12 ******/
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
/****** Object:  StoredProcedure [dbo].[USP_IncidentActionInsert]    Script Date: 31-07-2023 16:26:12 ******/
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
/****** Object:  StoredProcedure [dbo].[USP_IncidentCategoryMasterGetAll]    Script Date: 31-07-2023 16:26:12 ******/
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
/****** Object:  StoredProcedure [dbo].[USP_IncidentDetailsGetById]    Script Date: 31-07-2023 16:26:12 ******/
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
/****** Object:  StoredProcedure [dbo].[USP_IncidentDetailsInsert]    Script Date: 31-07-2023 16:26:12 ******/
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
/****** Object:  StoredProcedure [dbo].[USP_IncidentDetailsUpdate]    Script Date: 31-07-2023 16:26:12 ******/
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
/****** Object:  StoredProcedure [dbo].[USP_IncidentGetClose]    Script Date: 31-07-2023 16:26:12 ******/
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
	WHERE ID.IncidentStatusId IN (6,7) AND ID.CreatedDate>=@MinDate
END
GO
/****** Object:  StoredProcedure [dbo].[USP_IncidentGetInProgress]    Script Date: 31-07-2023 16:26:12 ******/
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
	WHERE ID.IncidentStatusId NOT IN (1,6,7,8) AND ID.CreatedDate>=@MinDate
END
GO
/****** Object:  StoredProcedure [dbo].[USP_IncidentGetPending]    Script Date: 31-07-2023 16:26:12 ******/
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
	WHERE ID.IncidentStatusId IN (1,8) AND ID.CreatedDate>=@MinDate
END
GO
/****** Object:  StoredProcedure [dbo].[USP_IncidentSourceGetAll]    Script Date: 31-07-2023 16:26:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_IncidentSourceGetAll]
AS BEGIN
SELECT * FROM tbl_IncidentSourceMaster
END
GO
/****** Object:  StoredProcedure [dbo].[USP_IncidentStatusMasterGetAll]    Script Date: 31-07-2023 16:26:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_IncidentStatusMasterGetAll]
AS BEGIN
SELECT * FROM tbl_IncidentStatusMaster
END
GO
/****** Object:  StoredProcedure [dbo].[USP_LogingActivityInsert]    Script Date: 31-07-2023 16:26:12 ******/
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
/****** Object:  StoredProcedure [dbo].[USP_LogingActivityUpdate]    Script Date: 31-07-2023 16:26:12 ******/
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
/****** Object:  StoredProcedure [dbo].[USP_MasterDataGetBySystemId]    Script Date: 31-07-2023 16:26:12 ******/
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
END
GO
/****** Object:  StoredProcedure [dbo].[USP_MenuGetAll]    Script Date: 31-07-2023 16:26:12 ******/
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
/****** Object:  StoredProcedure [dbo].[USP_MenuGetByRoleId]    Script Date: 31-07-2023 16:26:12 ******/
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
/****** Object:  StoredProcedure [dbo].[USP_PackageGetAll]    Script Date: 31-07-2023 16:26:12 ******/
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
/****** Object:  StoredProcedure [dbo].[USP_PackageGetById]    Script Date: 31-07-2023 16:26:12 ******/
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
/****** Object:  StoredProcedure [dbo].[USP_PackageInsertUpdate]    Script Date: 31-07-2023 16:26:12 ******/
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
@StartLatitude decimal(8,6),
@StartLongitude decimal(9,6),
@EndLatitude decimal(8,6),
@EndLongitude decimal(9,6),
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
/****** Object:  StoredProcedure [dbo].[USP_RoleInsertUpdate]    Script Date: 31-07-2023 16:26:12 ******/
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
/****** Object:  StoredProcedure [dbo].[USP_RolePermissionInsertUpdate]    Script Date: 31-07-2023 16:26:12 ******/
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
/****** Object:  StoredProcedure [dbo].[USP_RolesGetAll]    Script Date: 31-07-2023 16:26:12 ******/
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
/****** Object:  StoredProcedure [dbo].[USP_RolesGetById]    Script Date: 31-07-2023 16:26:12 ******/
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
/****** Object:  StoredProcedure [dbo].[USP_RolesPersmissionGetByMenu]    Script Date: 31-07-2023 16:26:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[USP_RolesPersmissionGetByMenu]
@MenuURL varchar(100),
@SystemId bigint,
@RoleId bigint

AS BEGIN
	
	CREATE table #Temp (MenuId bigint,MenuName varchar(100),MenuURL varchar(100),RoleId bigint,DataView Smallint,DataAdd Smallint,DataUpdate smallint,DataStatus smallint,CreatedDate datetime,CreatedBy int,ModifiedDate datetime,ModifiedBy int)
	if(@RoleId=0)
	BEGIN
		IF(@SystemId=0)
		BEGIN
			INSERT INTO #Temp(MenuId,MenuName,MenuURL,RoleId,DataView,DataAdd,DataUpdate,DataStatus,CreatedDate,CreatedBy,ModifiedDate,ModifiedBy)
			SELECT RP.MenuId,MenuName,MenuURL,@RoleId,1,1,1,RP.DataStatus,
			RP.CreatedDate,RP.CreatedBy,RP.ModifiedDate,RP.ModifiedBy
			FROM tbl_MenuMaster RP
			WHERE MenuURL=@MenuURL
			ORDER BY RP.OderBy
		END
		ELSE
		BEGIN
			INSERT INTO #Temp(MenuId,MenuName,MenuURL,RoleId,DataView,DataAdd,DataUpdate,DataStatus,CreatedDate,CreatedBy,ModifiedDate,ModifiedBy)
			SELECT RP.MenuId,MenuName,MenuURL,@RoleId,1,1,1,RP.DataStatus,
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
			INSERT INTO #Temp(MenuId,MenuName,MenuURL,RoleId,DataView,DataAdd,DataUpdate,DataStatus,CreatedDate,CreatedBy,ModifiedDate,ModifiedBy)
			SELECT RP.MenuId,MenuName,MenuURL,RP.RoleId,RP.DataView,RP.DataAdd,RP.DataUpdate,RP.DataStatus,
			RP.CreatedDate,RP.CreatedBy,RP.ModifiedDate,RP.ModifiedBy
			FROM tbl_RolePermission RP INNER JOIN tbl_MenuMaster MM ON RP.MenuId=MM.MenuId AND MM.DataStatus=1
			WHERE RP.RoleId=@RoleId 
			ORDER BY MM.OderBy
		END
		ELSE
		BEGIN
			INSERT INTO #Temp(MenuId,MenuName,MenuURL,RoleId,DataView,DataAdd,DataUpdate,DataStatus,CreatedDate,CreatedBy,ModifiedDate,ModifiedBy)
			SELECT RP.MenuId,MenuName,MenuURL,RP.RoleId,RP.DataView,RP.DataAdd,RP.DataUpdate,RP.DataStatus,
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
/****** Object:  StoredProcedure [dbo].[USP_RolesPersmissionGetByMenuId]    Script Date: 31-07-2023 16:26:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[USP_RolesPersmissionGetByMenuId]
@MenuId bigint,
@RoleId bigint

AS BEGIN
	
	CREATE table #Temp (MenuId bigint,MenuName varchar(100),RoleId bigint,DataView Smallint,DataAdd Smallint,DataUpdate smallint,DataStatus smallint,CreatedDate datetime,CreatedBy int,ModifiedDate datetime,ModifiedBy int)
	if(@RoleId=0)
	BEGIN
		INSERT INTO #Temp(MenuId,MenuName,RoleId,DataView,DataAdd,DataUpdate,DataStatus,CreatedDate,CreatedBy,ModifiedDate,ModifiedBy)
		SELECT RP.MenuId,MenuName,@RoleId,1,1,1,RP.DataStatus,
		RP.CreatedDate,RP.CreatedBy,RP.ModifiedDate,RP.ModifiedBy
		FROM tbl_MenuMaster RP
		WHERE RP.MenuId=@MenuId
		ORDER BY RP.MenuId
	END
	ELSE
	BEGIN
		

		INSERT INTO #Temp(MenuId,MenuName,RoleId,DataView,DataAdd,DataUpdate,DataStatus,CreatedDate,CreatedBy,ModifiedDate,ModifiedBy)
		SELECT RP.MenuId,MenuName,RP.RoleId,RP.DataView,RP.DataAdd,RP.DataUpdate,RP.DataStatus,
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
/****** Object:  StoredProcedure [dbo].[USP_RolesPersmissionGetByRoleId]    Script Date: 31-07-2023 16:26:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_RolesPersmissionGetByRoleId]
@RoleId bigint
AS BEGIN

	CREATE table #Temp (MenuId bigint,MenuName varchar(100),RoleId bigint,DataView Smallint,DataAdd Smallint,
	DataUpdate smallint,DataStatus smallint,CreatedDate datetime,CreatedBy int,ModifiedDate datetime,ModifiedBy int)

	INSERT INTO #Temp(MenuId,MenuName,RoleId,DataView,DataAdd,DataUpdate,DataStatus,CreatedDate,CreatedBy,ModifiedDate,ModifiedBy)
	SELECT RP.MenuId,MenuName,RP.RoleId,RP.DataView,RP.DataAdd,RP.DataUpdate,RP.DataStatus,
	RP.CreatedDate,RP.CreatedBy,RP.ModifiedDate,RP.ModifiedBy
	FROM tbl_RolePermission RP INNER JOIN tbl_MenuMaster MM ON RP.MenuId=MM.MenuId AND MM.DataStatus=1
	WHERE RP.RoleId=@RoleId
	ORDER BY RP.MenuId

	SELECT * FROM #Temp 
	
END
GO
/****** Object:  StoredProcedure [dbo].[USP_SystemGetAll]    Script Date: 31-07-2023 16:26:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_SystemGetAll]
AS BEGIN
	SELECT * FROM tbl_SystemMaster
END
GO
/****** Object:  StoredProcedure [dbo].[USP_SystemGetById]    Script Date: 31-07-2023 16:26:12 ******/
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
/****** Object:  StoredProcedure [dbo].[USP_SystemGetByName]    Script Date: 31-07-2023 16:26:12 ******/
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
/****** Object:  StoredProcedure [dbo].[USP_UserGetAll]    Script Date: 31-07-2023 16:26:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_UserGetAll]

AS BEGIN
	SELECT U.UserId,U.LoginId,U.LoginPassword,U.FirstName,U.LastName,U.EmailId,
	U.MobileNumber,U.AccountExpiredDate,U.RoleId,ISNULL(R.RoleName,'N/A') RoleName,UserTypeId,U.DataStatus,U.CreatedDate,U.CreatedBy,U.ModifiedDate,U.ModifiedBy 
	FROM tbl_UserMaster U 
	LEFT Join tbl_RoleMaster R ON U.RoleId=R.RoleId 
	
END



GO
/****** Object:  StoredProcedure [dbo].[USP_UserGetbyId]    Script Date: 31-07-2023 16:26:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_UserGetbyId]
@UserId bigint
AS BEGIN
	SELECT U.UserId,U.LoginId,U.LoginPassword,U.FirstName,U.LastName,U.EmailId,
	U.MobileNumber,U.AccountExpiredDate,U.RoleId,ISNULL(R.RoleName,'N/A') RoleName,UserTypeId,U.DataStatus,U.CreatedDate,U.CreatedBy,U.ModifiedDate,U.ModifiedBy 
	FROM tbl_UserMaster U 
	LEFT Join tbl_RoleMaster R ON U.RoleId=R.RoleId 
	WHERE U.UserId=@UserId
	
END



GO
/****** Object:  StoredProcedure [dbo].[USP_UserGetByUserTypeId]    Script Date: 31-07-2023 16:26:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_UserGetByUserTypeId]
@UserTypeId smallint
AS BEGIN
	SELECT U.UserId,U.LoginId,U.LoginPassword,U.FirstName,U.LastName,U.EmailId,
	U.MobileNumber,U.AccountExpiredDate,U.RoleId,ISNULL(R.RoleName,'N/A') RoleName,UserTypeId,U.DataStatus,U.CreatedDate,U.CreatedBy,U.ModifiedDate,U.ModifiedBy 
	FROM tbl_UserMaster U 
	LEFT Join tbl_RoleMaster R ON U.RoleId=R.RoleId 
	WHERE U.UserTypeId=@UserTypeId
	
END



GO
/****** Object:  StoredProcedure [dbo].[USP_UserInsertUpdate]    Script Date: 31-07-2023 16:26:12 ******/
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
				
				SET @CVal=(SELECT * FROM tbl_UserMaster WHERE RoleId=@RoleId FOR JSON AUTO, WITHOUT_ARRAY_WRAPPER)		
				
				INSERT INTO tbl_ActivityLog(UserId,CurrentColumn,ActionId,MenuId,CreatedDate)
				VALUES(@CreatedBy,@CVal,'Insert',@MenuId,@CDateTime);
				
				INSERT INTO #Temp(AlertMessage)VALUES('User added successfully.');
			END
			ELSE
			BEGIN
				SET @PVal=(SELECT * FROM tbl_UserMaster WHERE RoleId=@RoleId FOR JSON AUTO, WITHOUT_ARRAY_WRAPPER)	

				UPDATE tbl_UserMaster SET DataStatus=@DataStatus,ModifiedDate=@CDateTime,ModifiedBy=@UserId,UserTypeId=@UserTypeId,
				FirstName=@FirstName,LastName=@LastName,EmailId=@EmailId,MobileNumber=@MobileNumber,AccountExpiredDate=@AccountExpiredDate,RoleId=@RoleId,
				LoginPassword=@LoginPassword,LoginId=@LoginId
				WHERE UserId=@UserId

				SET @CVal=(SELECT * FROM tbl_UserMaster WHERE RoleId=@RoleId FOR JSON AUTO, WITHOUT_ARRAY_WRAPPER)		

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
/****** Object:  StoredProcedure [dbo].[USP_UsersGetByLoginId]    Script Date: 31-07-2023 16:26:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_UsersGetByLoginId]
@LoginId varchar(100)
AS BEGIN
	SELECT U.UserId,U.LoginId,U.LoginPassword,U.FirstName,U.LastName,U.EmailId,
	U.MobileNumber,U.AccountExpiredDate,U.RoleId,ISNULL(R.RoleName,'N/A') RoleName,UserTypeId,U.DataStatus,U.CreatedDate,U.CreatedBy,U.ModifiedDate,U.ModifiedBy 
	FROM tbl_UserMaster U 
	LEFT Join tbl_RoleMaster R ON U.RoleId=R.RoleId 
	WHERE U.LoginId=@LoginId
	
END



GO
/****** Object:  StoredProcedure [dbo].[USP_UserUpdatePassword]    Script Date: 31-07-2023 16:26:12 ******/
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
/****** Object:  StoredProcedure [dbo].[USP_VehicleClassGetAll]    Script Date: 31-07-2023 16:26:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_VehicleClassGetAll]
AS BEGIN

	SELECT * FROM tbl_VehicleClass;

END



GO
/****** Object:  StoredProcedure [dbo].[USP_VehicleClassGetById]    Script Date: 31-07-2023 16:26:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_VehicleClassGetById]
@ClassId smallint
AS BEGIN
	SELECT *
	FROM tbl_VehicleClass
	WHERE ClassId=@ClassId
END



GO
/****** Object:  StoredProcedure [dbo].[USP_VehicleClassInsertUpdate]    Script Date: 31-07-2023 16:26:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_VehicleClassInsertUpdate] 
@ClassId smallint,
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
	IF EXISTS(SELECT ClassId FROM tbl_VehicleClass where VehicleClassId=@VehicleClassId and ClassId<>@ClassId)
		BEGIN
			INSERT INTO #Temp(AlertMessage)
			VALUES('Vehicle Class Id already exists!')
		END
	
	IF EXISTS(SELECT ClassId FROM tbl_VehicleClass where VehicleClassName=@VehicleClassName and ClassId<>@ClassId)
		BEGIN
			INSERT INTO #Temp(AlertMessage)
			VALUES('Vehicle Class name already exists!')
		END
	SELECT @cnt=COUNT(AlertMessage)  FROM #Temp
	IF(@cnt=0)
		BEGIN
			IF(@ClassId=0)
			BEGIN
				insert into tbl_VehicleClass(ClassId,VehicleClassId,VehicleClassName,AllowedSpeed,DataStatus,CreatedDate,CreatedBy)
				values(@ClassId,@VehicleClassId,@VehicleClassName,@AllowedSpeed,@DataStatus,@CDateTime,@UserId);
				SELECT @ClassId=@@IDENTITY

				SET @CVal=(SELECT * FROM tbl_VehicleClass WHERE ClassId=@ClassId FOR JSON AUTO, WITHOUT_ARRAY_WRAPPER)		
				
				INSERT INTO tbl_ActivityLog(UserId,CurrentColumn,ActionId,MenuId,CreatedDate)
				VALUES(@UserId,@CVal,'Insert',@MenuId,@CDateTime);
				
				INSERT INTO #Temp(AlertMessage)VALUES('success');
			END
			ELSE
			BEGIN
				
				SET @PVal=(SELECT * FROM tbl_VehicleClass WHERE ClassId=@ClassId FOR JSON AUTO, WITHOUT_ARRAY_WRAPPER)	
				
				UPDATE tbl_VehicleClass SET AllowedSpeed=@AllowedSpeed,
				VehicleClassName=@VehicleClassName,VehicleClassId=@VehicleClassId,
				DataStatus=@DataStatus,ModifiedDate=@CDateTime,ModifiedBy=@UserId
				WHERE ClassId=@ClassId
				
				SET @CVal=(SELECT * FROM tbl_VehicleClass WHERE ClassId=@ClassId FOR JSON AUTO, WITHOUT_ARRAY_WRAPPER)		

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
/****** Object:  StoredProcedure [dbo].[USP_VIDSEventReviewUpdate]    Script Date: 31-07-2023 16:26:12 ******/
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
			IsChallanRequired=@IsChallanRequired
			,ChallanTypeId=@ChallanTypeId
			WHERE TransactionId=@TransactionId

			SET @CVal=(SELECT EventTypeId,PlateNumber,VehicleClassId,IsChallanRequired,ChallanTypeId 
			FROM tbl_VIDSEventsHistory WHERE TransactionId=@TransactionId FOR JSON AUTO, WITHOUT_ARRAY_WRAPPER)	
			
			SET @PVal=(SELECT ReviewedEventTypeId,ReviewedPlateNumber,ReviewedVehicleClassId,IsChallanRequired,ChallanTypeId 
			FROM tbl_VIDSEventsHistory WHERE TransactionId=@TransactionId FOR JSON AUTO, WITHOUT_ARRAY_WRAPPER)	
				
			INSERT INTO tbl_ActivityLog(UserId,CurrentColumn,ActionId,MenuId,CreatedDate)
			VALUES(@ReviewedById,@CVal,'Insert',@MenuId,@ReviewedDateTime);
			
		END
		END TRY  
	BEGIN CATCH  
		INSERT INTO #Temp(AlertMessage)VALUES('failed');
		EXECUTE USP_ErrorInfoInsert;  
	END CATCH  
		select * from #Temp;
END
GO
/****** Object:  StoredProcedure [dbo].[USP_VIDSEventsGetByFilter]    Script Date: 31-07-2023 16:26:12 ******/
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
/****** Object:  StoredProcedure [dbo].[USP_VIDSEventsGetByHours]    Script Date: 31-07-2023 16:26:12 ******/
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
/****** Object:  StoredProcedure [dbo].[USP_VIDSEventsHistory]    Script Date: 31-07-2023 16:26:12 ******/
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
	ReviewedVehicleClassName,H.ReviewedBy,RUM.LoginId AS ReviewedByLoginId,H.ReviewedDateTime,H.ReviewedRemark,
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
	LEFT JOIN tbl_UserMaster RUM ON H.ReviewedBy=RUM.UserId
END
--GO
--EXEC USP_VIDSEventsHistory
GO
/****** Object:  StoredProcedure [dbo].[USP_VIDSPendingReviewEventsGetByHours]    Script Date: 31-07-2023 16:26:12 ******/
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
