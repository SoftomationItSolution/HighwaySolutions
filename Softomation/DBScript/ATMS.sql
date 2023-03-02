/****** Object:  StoredProcedure [dbo].[USP_VMSMessageInsertUpdate]    Script Date: 08-07-2021 17:08:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_VMSMessageInsertUpdate]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_VMSMessageInsertUpdate]
GO
/****** Object:  StoredProcedure [dbo].[USP_VMSMessageGetbyId]    Script Date: 08-07-2021 17:08:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_VMSMessageGetbyId]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_VMSMessageGetbyId]
GO
/****** Object:  StoredProcedure [dbo].[USP_VMSMessageGetAvtiveAll]    Script Date: 08-07-2021 17:08:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_VMSMessageGetAvtiveAll]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_VMSMessageGetAvtiveAll]
GO
/****** Object:  StoredProcedure [dbo].[USP_VMSMessageGetAll]    Script Date: 08-07-2021 17:08:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_VMSMessageGetAll]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_VMSMessageGetAll]
GO
/****** Object:  StoredProcedure [dbo].[USP_VehicleClassInsertUpdate]    Script Date: 08-07-2021 17:08:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_VehicleClassInsertUpdate]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_VehicleClassInsertUpdate]
GO
/****** Object:  StoredProcedure [dbo].[USP_VehicleClassGetById]    Script Date: 08-07-2021 17:08:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_VehicleClassGetById]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_VehicleClassGetById]
GO
/****** Object:  StoredProcedure [dbo].[USP_VehicleClassGetAll]    Script Date: 08-07-2021 17:08:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_VehicleClassGetAll]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_VehicleClassGetAll]
GO
/****** Object:  StoredProcedure [dbo].[USP_VehicleClassGetActive]    Script Date: 08-07-2021 17:08:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_VehicleClassGetActive]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_VehicleClassGetActive]
GO
/****** Object:  StoredProcedure [dbo].[USP_RolesPersmissionGetByRoleId]    Script Date: 08-07-2021 17:08:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_RolesPersmissionGetByRoleId]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_RolesPersmissionGetByRoleId]
GO
/****** Object:  StoredProcedure [dbo].[USP_RolesPersmissionGetByEventId]    Script Date: 08-07-2021 17:08:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_RolesPersmissionGetByEventId]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_RolesPersmissionGetByEventId]
GO
/****** Object:  StoredProcedure [dbo].[USP_RolesGetById]    Script Date: 08-07-2021 17:08:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_RolesGetById]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_RolesGetById]
GO
/****** Object:  StoredProcedure [dbo].[USP_RolesGetAll]    Script Date: 08-07-2021 17:08:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_RolesGetAll]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_RolesGetAll]
GO
/****** Object:  StoredProcedure [dbo].[USP_RolesGetActive]    Script Date: 08-07-2021 17:08:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_RolesGetActive]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_RolesGetActive]
GO
/****** Object:  StoredProcedure [dbo].[USP_RolePermissionInsertUpdate]    Script Date: 08-07-2021 17:08:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_RolePermissionInsertUpdate]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_RolePermissionInsertUpdate]
GO
/****** Object:  StoredProcedure [dbo].[USP_RoleInsertUpdate]    Script Date: 08-07-2021 17:08:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_RoleInsertUpdate]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_RoleInsertUpdate]
GO
/****** Object:  StoredProcedure [dbo].[USP_METEventsInsertUpdate]    Script Date: 08-07-2021 17:08:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_METEventsInsertUpdate]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_METEventsInsertUpdate]
GO
/****** Object:  StoredProcedure [dbo].[USP_METEventGetLatest]    Script Date: 08-07-2021 17:08:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_METEventGetLatest]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_METEventGetLatest]
GO
/****** Object:  StoredProcedure [dbo].[USP_METConfigurationInsertUpdate]    Script Date: 08-07-2021 17:08:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_METConfigurationInsertUpdate]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_METConfigurationInsertUpdate]
GO
/****** Object:  StoredProcedure [dbo].[USP_METConfigurationGet]    Script Date: 08-07-2021 17:08:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_METConfigurationGet]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_METConfigurationGet]
GO
/****** Object:  StoredProcedure [dbo].[USP_MenuGetCC]    Script Date: 08-07-2021 17:08:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_MenuGetCC]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_MenuGetCC]
GO
/****** Object:  StoredProcedure [dbo].[USP_MenuGetByRoleId]    Script Date: 08-07-2021 17:08:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_MenuGetByRoleId]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_MenuGetByRoleId]
GO
/****** Object:  StoredProcedure [dbo].[USP_LogingActivityInsert]    Script Date: 08-07-2021 17:08:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_LogingActivityInsert]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_LogingActivityInsert]
GO
/****** Object:  StoredProcedure [dbo].[USP_LocationInsertUpdate]    Script Date: 08-07-2021 17:08:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_LocationInsertUpdate]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_LocationInsertUpdate]
GO
/****** Object:  StoredProcedure [dbo].[USP_LaneInsertUpdate]    Script Date: 08-07-2021 17:08:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_LaneInsertUpdate]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_LaneInsertUpdate]
GO
/****** Object:  StoredProcedure [dbo].[USP_LaneGetbyId]    Script Date: 08-07-2021 17:08:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_LaneGetbyId]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_LaneGetbyId]
GO
/****** Object:  StoredProcedure [dbo].[USP_LaneGetByGantryIdActive]    Script Date: 08-07-2021 17:08:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_LaneGetByGantryIdActive]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_LaneGetByGantryIdActive]
GO
/****** Object:  StoredProcedure [dbo].[USP_LaneGetAllActive]    Script Date: 08-07-2021 17:08:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_LaneGetAllActive]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_LaneGetAllActive]
GO
/****** Object:  StoredProcedure [dbo].[USP_LaneGetAll]    Script Date: 08-07-2021 17:08:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_LaneGetAll]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_LaneGetAll]
GO
/****** Object:  StoredProcedure [dbo].[USP_IncidentMasterInsertUpdate]    Script Date: 08-07-2021 17:08:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_IncidentMasterInsertUpdate]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_IncidentMasterInsertUpdate]
GO
/****** Object:  StoredProcedure [dbo].[USP_IncidentMasterGetById]    Script Date: 08-07-2021 17:08:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_IncidentMasterGetById]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_IncidentMasterGetById]
GO
/****** Object:  StoredProcedure [dbo].[USP_IncidentMasterGetAll]    Script Date: 08-07-2021 17:08:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_IncidentMasterGetAll]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_IncidentMasterGetAll]
GO
/****** Object:  StoredProcedure [dbo].[USP_GetAllCoordinates]    Script Date: 08-07-2021 17:08:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_GetAllCoordinates]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_GetAllCoordinates]
GO
/****** Object:  StoredProcedure [dbo].[USP_GantryMappingValidateInsertUpdate]    Script Date: 08-07-2021 17:08:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_GantryMappingValidateInsertUpdate]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_GantryMappingValidateInsertUpdate]
GO
/****** Object:  StoredProcedure [dbo].[USP_GantryMappingInsertUpdate]    Script Date: 08-07-2021 17:08:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_GantryMappingInsertUpdate]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_GantryMappingInsertUpdate]
GO
/****** Object:  StoredProcedure [dbo].[USP_GantryMappingGetbyGantryId]    Script Date: 08-07-2021 17:08:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_GantryMappingGetbyGantryId]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_GantryMappingGetbyGantryId]
GO
/****** Object:  StoredProcedure [dbo].[USP_GantryMappingGetAll]    Script Date: 08-07-2021 17:08:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_GantryMappingGetAll]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_GantryMappingGetAll]
GO
/****** Object:  StoredProcedure [dbo].[USP_GantryInsertUpdate]    Script Date: 08-07-2021 17:08:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_GantryInsertUpdate]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_GantryInsertUpdate]
GO
/****** Object:  StoredProcedure [dbo].[USP_GantryGetbyId]    Script Date: 08-07-2021 17:08:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_GantryGetbyId]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_GantryGetbyId]
GO
/****** Object:  StoredProcedure [dbo].[USP_GantryGetAllActive]    Script Date: 08-07-2021 17:08:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_GantryGetAllActive]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_GantryGetAllActive]
GO
/****** Object:  StoredProcedure [dbo].[USP_GantryGetAll]    Script Date: 08-07-2021 17:08:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_GantryGetAll]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_GantryGetAll]
GO
/****** Object:  StoredProcedure [dbo].[USP_GantryGetActive]    Script Date: 08-07-2021 17:08:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_GantryGetActive]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_GantryGetActive]
GO
/****** Object:  StoredProcedure [dbo].[USP_ECBEventGetLatest]    Script Date: 08-07-2021 17:08:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_ECBEventGetLatest]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_ECBEventGetLatest]
GO
/****** Object:  StoredProcedure [dbo].[USP_ECBCallEventsUpdate]    Script Date: 08-07-2021 17:08:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_ECBCallEventsUpdate]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_ECBCallEventsUpdate]
GO
/****** Object:  StoredProcedure [dbo].[USP_ECBCallEventsInsert]    Script Date: 08-07-2021 17:08:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_ECBCallEventsInsert]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_ECBCallEventsInsert]
GO
/****** Object:  StoredProcedure [dbo].[USP_DeviceTypeGetById]    Script Date: 08-07-2021 17:08:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_DeviceTypeGetById]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_DeviceTypeGetById]
GO
/****** Object:  StoredProcedure [dbo].[USP_DeviceTypeGetAllActiveByCatId]    Script Date: 08-07-2021 17:08:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_DeviceTypeGetAllActiveByCatId]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_DeviceTypeGetAllActiveByCatId]
GO
/****** Object:  StoredProcedure [dbo].[USP_DeviceTypeGetAllActive]    Script Date: 08-07-2021 17:08:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_DeviceTypeGetAllActive]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_DeviceTypeGetAllActive]
GO
/****** Object:  StoredProcedure [dbo].[USP_DeviceTypeGetAll]    Script Date: 08-07-2021 17:08:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_DeviceTypeGetAll]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_DeviceTypeGetAll]
GO
/****** Object:  StoredProcedure [dbo].[USP_DevicesMasterInsertUpdate]    Script Date: 08-07-2021 17:08:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_DevicesMasterInsertUpdate]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_DevicesMasterInsertUpdate]
GO
/****** Object:  StoredProcedure [dbo].[USP_DevicesMasterGetByTypeIds]    Script Date: 08-07-2021 17:08:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_DevicesMasterGetByTypeIds]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_DevicesMasterGetByTypeIds]
GO
/****** Object:  StoredProcedure [dbo].[USP_DevicesMasterGetByTypeId]    Script Date: 08-07-2021 17:08:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_DevicesMasterGetByTypeId]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_DevicesMasterGetByTypeId]
GO
/****** Object:  StoredProcedure [dbo].[USP_DevicesMasterGetByLocationId]    Script Date: 08-07-2021 17:08:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_DevicesMasterGetByLocationId]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_DevicesMasterGetByLocationId]
GO
/****** Object:  StoredProcedure [dbo].[USP_DevicesMasterGetByIpAddress]    Script Date: 08-07-2021 17:08:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_DevicesMasterGetByIpAddress]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_DevicesMasterGetByIpAddress]
GO
/****** Object:  StoredProcedure [dbo].[USP_DevicesMasterGetByIds]    Script Date: 08-07-2021 17:08:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_DevicesMasterGetByIds]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_DevicesMasterGetByIds]
GO
/****** Object:  StoredProcedure [dbo].[USP_DevicesMasterGetById]    Script Date: 08-07-2021 17:08:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_DevicesMasterGetById]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_DevicesMasterGetById]
GO
/****** Object:  StoredProcedure [dbo].[USP_DevicesMasterGetByControlRoomIdActive]    Script Date: 08-07-2021 17:08:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_DevicesMasterGetByControlRoomIdActive]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_DevicesMasterGetByControlRoomIdActive]
GO
/****** Object:  StoredProcedure [dbo].[USP_DevicesMasterGetByControlRoomId]    Script Date: 08-07-2021 17:08:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_DevicesMasterGetByControlRoomId]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_DevicesMasterGetByControlRoomId]
GO
/****** Object:  StoredProcedure [dbo].[USP_DevicesMasterGetByCategoryId]    Script Date: 08-07-2021 17:08:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_DevicesMasterGetByCategoryId]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_DevicesMasterGetByCategoryId]
GO
/****** Object:  StoredProcedure [dbo].[USP_DevicesMasterGetAllActive]    Script Date: 08-07-2021 17:08:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_DevicesMasterGetAllActive]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_DevicesMasterGetAllActive]
GO
/****** Object:  StoredProcedure [dbo].[USP_DevicesMasterGetAll]    Script Date: 08-07-2021 17:08:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_DevicesMasterGetAll]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_DevicesMasterGetAll]
GO
/****** Object:  StoredProcedure [dbo].[USP_ControlRoomMasterInsertUpdate]    Script Date: 08-07-2021 17:08:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_ControlRoomMasterInsertUpdate]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_ControlRoomMasterInsertUpdate]
GO
/****** Object:  StoredProcedure [dbo].[USP_ControlRoomMasterGetByUserId]    Script Date: 08-07-2021 17:08:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_ControlRoomMasterGetByUserId]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_ControlRoomMasterGetByUserId]
GO
/****** Object:  StoredProcedure [dbo].[USP_ControlRoomMasterGetById]    Script Date: 08-07-2021 17:08:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_ControlRoomMasterGetById]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_ControlRoomMasterGetById]
GO
/****** Object:  StoredProcedure [dbo].[USP_ControlRoomMasterGetAll]    Script Date: 08-07-2021 17:08:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_ControlRoomMasterGetAll]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_ControlRoomMasterGetAll]
GO
/****** Object:  StoredProcedure [dbo].[USP_ConnectionTypeGetAllActive]    Script Date: 08-07-2021 17:08:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_ConnectionTypeGetAllActive]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_ConnectionTypeGetAllActive]
GO
/****** Object:  StoredProcedure [dbo].[USP_ClientInsertUpdate]    Script Date: 08-07-2021 17:08:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_ClientInsertUpdate]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_ClientInsertUpdate]
GO
/****** Object:  StoredProcedure [dbo].[USP_ClientGetbyId]    Script Date: 08-07-2021 17:08:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_ClientGetbyId]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_ClientGetbyId]
GO
/****** Object:  StoredProcedure [dbo].[USP_ClientGetAll]    Script Date: 08-07-2021 17:08:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_ClientGetAll]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_ClientGetAll]
GO
/****** Object:  StoredProcedure [dbo].[USP_ClientGetActive]    Script Date: 08-07-2021 17:08:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_ClientGetActive]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_ClientGetActive]
GO
/****** Object:  StoredProcedure [dbo].[USP_CategoryMasterGetById]    Script Date: 08-07-2021 17:08:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_CategoryMasterGetById]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_CategoryMasterGetById]
GO
/****** Object:  StoredProcedure [dbo].[USP_CategoryMasterGetAllActive]    Script Date: 08-07-2021 17:08:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_CategoryMasterGetAllActive]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_CategoryMasterGetAllActive]
GO
/****** Object:  StoredProcedure [dbo].[USP_CategoryMasterGetAll]    Script Date: 08-07-2021 17:08:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_CategoryMasterGetAll]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_CategoryMasterGetAll]
GO
/****** Object:  StoredProcedure [dbo].[USP_ATCCEventsInsertUpdate]    Script Date: 08-07-2021 17:08:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_ATCCEventsInsertUpdate]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_ATCCEventsInsertUpdate]
GO
/****** Object:  StoredProcedure [dbo].[USP_ATCCEventGetLatest]    Script Date: 08-07-2021 17:08:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_ATCCEventGetLatest]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_ATCCEventGetLatest]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_VMSMe__Modif__2C1E8537]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_VMSMessageDetails] DROP CONSTRAINT [DF__tbl_VMSMe__Modif__2C1E8537]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_VMSMe__Modif__2B2A60FE]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_VMSMessageDetails] DROP CONSTRAINT [DF__tbl_VMSMe__Modif__2B2A60FE]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_VMSMe__Creat__2A363CC5]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_VMSMessageDetails] DROP CONSTRAINT [DF__tbl_VMSMe__Creat__2A363CC5]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_VMSMe__Creat__2942188C]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_VMSMessageDetails] DROP CONSTRAINT [DF__tbl_VMSMe__Creat__2942188C]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_VMSMe__DataS__284DF453]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_VMSMessageDetails] DROP CONSTRAINT [DF__tbl_VMSMe__DataS__284DF453]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_VIDSE__Modif__71BCD978]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_VIDSEventsDetails] DROP CONSTRAINT [DF__tbl_VIDSE__Modif__71BCD978]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_VIDSE__Modif__70C8B53F]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_VIDSEventsDetails] DROP CONSTRAINT [DF__tbl_VIDSE__Modif__70C8B53F]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_VIDSE__Creat__6FD49106]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_VIDSEventsDetails] DROP CONSTRAINT [DF__tbl_VIDSE__Creat__6FD49106]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_VIDSE__Creat__6EE06CCD]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_VIDSEventsDetails] DROP CONSTRAINT [DF__tbl_VIDSE__Creat__6EE06CCD]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_VIDSE__DataS__6DEC4894]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_VIDSEventsDetails] DROP CONSTRAINT [DF__tbl_VIDSE__DataS__6DEC4894]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Vehic__Modif__1DD065E0]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_VehicleClass] DROP CONSTRAINT [DF__tbl_Vehic__Modif__1DD065E0]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Vehic__Modif__1CDC41A7]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_VehicleClass] DROP CONSTRAINT [DF__tbl_Vehic__Modif__1CDC41A7]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Vehic__Creat__1BE81D6E]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_VehicleClass] DROP CONSTRAINT [DF__tbl_Vehic__Creat__1BE81D6E]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Vehic__Creat__1AF3F935]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_VehicleClass] DROP CONSTRAINT [DF__tbl_Vehic__Creat__1AF3F935]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Vehic__DataS__19FFD4FC]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_VehicleClass] DROP CONSTRAINT [DF__tbl_Vehic__DataS__19FFD4FC]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Vehic__Vehic__190BB0C3]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_VehicleClass] DROP CONSTRAINT [DF__tbl_Vehic__Vehic__190BB0C3]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_UserM__Modif__18178C8A]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_UserMaster] DROP CONSTRAINT [DF__tbl_UserM__Modif__18178C8A]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_UserM__Modif__17236851]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_UserMaster] DROP CONSTRAINT [DF__tbl_UserM__Modif__17236851]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_UserM__Creat__162F4418]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_UserMaster] DROP CONSTRAINT [DF__tbl_UserM__Creat__162F4418]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_UserM__Creat__153B1FDF]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_UserMaster] DROP CONSTRAINT [DF__tbl_UserM__Creat__153B1FDF]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_UserM__DataS__1446FBA6]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_UserMaster] DROP CONSTRAINT [DF__tbl_UserM__DataS__1446FBA6]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Shift__Modif__1352D76D]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_ShiftTimining] DROP CONSTRAINT [DF__tbl_Shift__Modif__1352D76D]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Shift__Modif__125EB334]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_ShiftTimining] DROP CONSTRAINT [DF__tbl_Shift__Modif__125EB334]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Shift__Creat__116A8EFB]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_ShiftTimining] DROP CONSTRAINT [DF__tbl_Shift__Creat__116A8EFB]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Shift__Creat__10766AC2]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_ShiftTimining] DROP CONSTRAINT [DF__tbl_Shift__Creat__10766AC2]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Shift__DataS__0F824689]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_ShiftTimining] DROP CONSTRAINT [DF__tbl_Shift__DataS__0F824689]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_RoleP__Modif__0E8E2250]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_RolePermission] DROP CONSTRAINT [DF__tbl_RoleP__Modif__0E8E2250]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_RoleP__Modif__0D99FE17]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_RolePermission] DROP CONSTRAINT [DF__tbl_RoleP__Modif__0D99FE17]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_RoleP__Creat__0CA5D9DE]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_RolePermission] DROP CONSTRAINT [DF__tbl_RoleP__Creat__0CA5D9DE]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_RoleP__Creat__0BB1B5A5]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_RolePermission] DROP CONSTRAINT [DF__tbl_RoleP__Creat__0BB1B5A5]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_RoleP__DataS__0ABD916C]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_RolePermission] DROP CONSTRAINT [DF__tbl_RoleP__DataS__0ABD916C]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_RoleP__DataU__09C96D33]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_RolePermission] DROP CONSTRAINT [DF__tbl_RoleP__DataU__09C96D33]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_RoleP__DataA__08D548FA]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_RolePermission] DROP CONSTRAINT [DF__tbl_RoleP__DataA__08D548FA]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_RoleP__DataV__07E124C1]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_RolePermission] DROP CONSTRAINT [DF__tbl_RoleP__DataV__07E124C1]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_RoleM__Modif__06ED0088]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_RoleMaster] DROP CONSTRAINT [DF__tbl_RoleM__Modif__06ED0088]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_RoleM__Modif__05F8DC4F]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_RoleMaster] DROP CONSTRAINT [DF__tbl_RoleM__Modif__05F8DC4F]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_RoleM__Creat__0504B816]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_RoleMaster] DROP CONSTRAINT [DF__tbl_RoleM__Creat__0504B816]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_RoleM__Creat__041093DD]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_RoleMaster] DROP CONSTRAINT [DF__tbl_RoleM__Creat__041093DD]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_RoleM__DataS__031C6FA4]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_RoleMaster] DROP CONSTRAINT [DF__tbl_RoleM__DataS__031C6FA4]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Permi__Modif__08A03ED0]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_PermissionMaster] DROP CONSTRAINT [DF__tbl_Permi__Modif__08A03ED0]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Permi__Modif__07AC1A97]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_PermissionMaster] DROP CONSTRAINT [DF__tbl_Permi__Modif__07AC1A97]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Permi__Creat__06B7F65E]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_PermissionMaster] DROP CONSTRAINT [DF__tbl_Permi__Creat__06B7F65E]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Permi__Creat__05C3D225]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_PermissionMaster] DROP CONSTRAINT [DF__tbl_Permi__Creat__05C3D225]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Permi__DataS__04CFADEC]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_PermissionMaster] DROP CONSTRAINT [DF__tbl_Permi__DataS__04CFADEC]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Permi__DataU__03DB89B3]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_PermissionMaster] DROP CONSTRAINT [DF__tbl_Permi__DataU__03DB89B3]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Permi__DataA__02E7657A]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_PermissionMaster] DROP CONSTRAINT [DF__tbl_Permi__DataA__02E7657A]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Permi__DataV__01F34141]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_PermissionMaster] DROP CONSTRAINT [DF__tbl_Permi__DataV__01F34141]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_METEv__Modif__7A8729A3]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_METEventsDetails] DROP CONSTRAINT [DF__tbl_METEv__Modif__7A8729A3]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_METEv__Modif__7993056A]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_METEventsDetails] DROP CONSTRAINT [DF__tbl_METEv__Modif__7993056A]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_METEv__Creat__789EE131]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_METEventsDetails] DROP CONSTRAINT [DF__tbl_METEv__Creat__789EE131]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_METEv__Creat__77AABCF8]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_METEventsDetails] DROP CONSTRAINT [DF__tbl_METEv__Creat__77AABCF8]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_METEv__DataS__76B698BF]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_METEventsDetails] DROP CONSTRAINT [DF__tbl_METEv__DataS__76B698BF]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_METEv__Alert__75C27486]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_METEventsDetails] DROP CONSTRAINT [DF__tbl_METEv__Alert__75C27486]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_METCo__Modif__74CE504D]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_METConfiguration] DROP CONSTRAINT [DF__tbl_METCo__Modif__74CE504D]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_METCo__Modif__73DA2C14]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_METConfiguration] DROP CONSTRAINT [DF__tbl_METCo__Modif__73DA2C14]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_METCo__Creat__72E607DB]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_METConfiguration] DROP CONSTRAINT [DF__tbl_METCo__Creat__72E607DB]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_METCo__Creat__71F1E3A2]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_METConfiguration] DROP CONSTRAINT [DF__tbl_METCo__Creat__71F1E3A2]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_METCo__DataS__70FDBF69]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_METConfiguration] DROP CONSTRAINT [DF__tbl_METCo__DataS__70FDBF69]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_MenuM__Modif__7775B2CE]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_MenuMaster] DROP CONSTRAINT [DF__tbl_MenuM__Modif__7775B2CE]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_MenuM__Modif__76818E95]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_MenuMaster] DROP CONSTRAINT [DF__tbl_MenuM__Modif__76818E95]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_MenuM__Creat__758D6A5C]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_MenuMaster] DROP CONSTRAINT [DF__tbl_MenuM__Creat__758D6A5C]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_MenuM__Creat__74994623]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_MenuMaster] DROP CONSTRAINT [DF__tbl_MenuM__Creat__74994623]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_MenuM__DataS__73A521EA]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_MenuMaster] DROP CONSTRAINT [DF__tbl_MenuM__DataS__73A521EA]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Login__Creat__6B44E613]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_LogingActivity] DROP CONSTRAINT [DF__tbl_Login__Creat__6B44E613]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_LaneT__Modif__6A50C1DA]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_LaneType] DROP CONSTRAINT [DF__tbl_LaneT__Modif__6A50C1DA]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_LaneT__Modif__695C9DA1]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_LaneType] DROP CONSTRAINT [DF__tbl_LaneT__Modif__695C9DA1]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_LaneT__Creat__68687968]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_LaneType] DROP CONSTRAINT [DF__tbl_LaneT__Creat__68687968]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_LaneT__Creat__6774552F]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_LaneType] DROP CONSTRAINT [DF__tbl_LaneT__Creat__6774552F]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_LaneT__DataS__668030F6]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_LaneType] DROP CONSTRAINT [DF__tbl_LaneT__DataS__668030F6]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_LaneF__Modif__658C0CBD]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_LaneForType] DROP CONSTRAINT [DF__tbl_LaneF__Modif__658C0CBD]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_LaneF__Modif__6497E884]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_LaneForType] DROP CONSTRAINT [DF__tbl_LaneF__Modif__6497E884]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_LaneF__Creat__63A3C44B]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_LaneForType] DROP CONSTRAINT [DF__tbl_LaneF__Creat__63A3C44B]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_LaneF__Creat__62AFA012]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_LaneForType] DROP CONSTRAINT [DF__tbl_LaneF__Creat__62AFA012]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_LaneF__DataS__61BB7BD9]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_LaneForType] DROP CONSTRAINT [DF__tbl_LaneF__DataS__61BB7BD9]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_LaneC__Modif__60C757A0]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_LaneConfiguration] DROP CONSTRAINT [DF__tbl_LaneC__Modif__60C757A0]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_LaneC__Modif__5FD33367]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_LaneConfiguration] DROP CONSTRAINT [DF__tbl_LaneC__Modif__5FD33367]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_LaneC__Creat__5EDF0F2E]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_LaneConfiguration] DROP CONSTRAINT [DF__tbl_LaneC__Creat__5EDF0F2E]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_LaneC__Creat__5DEAEAF5]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_LaneConfiguration] DROP CONSTRAINT [DF__tbl_LaneC__Creat__5DEAEAF5]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_LaneC__DataS__5CF6C6BC]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_LaneConfiguration] DROP CONSTRAINT [DF__tbl_LaneC__DataS__5CF6C6BC]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Hardw__Modif__5C02A283]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_HardwareType] DROP CONSTRAINT [DF__tbl_Hardw__Modif__5C02A283]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Hardw__Modif__5B0E7E4A]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_HardwareType] DROP CONSTRAINT [DF__tbl_Hardw__Modif__5B0E7E4A]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Hardw__Creat__5A1A5A11]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_HardwareType] DROP CONSTRAINT [DF__tbl_Hardw__Creat__5A1A5A11]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Hardw__Creat__592635D8]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_HardwareType] DROP CONSTRAINT [DF__tbl_Hardw__Creat__592635D8]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Hardw__DataS__5832119F]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_HardwareType] DROP CONSTRAINT [DF__tbl_Hardw__DataS__5832119F]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Hardw__Modif__573DED66]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_HardwareProvider] DROP CONSTRAINT [DF__tbl_Hardw__Modif__573DED66]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Hardw__Modif__5649C92D]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_HardwareProvider] DROP CONSTRAINT [DF__tbl_Hardw__Modif__5649C92D]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Hardw__Creat__5555A4F4]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_HardwareProvider] DROP CONSTRAINT [DF__tbl_Hardw__Creat__5555A4F4]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Hardw__Creat__546180BB]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_HardwareProvider] DROP CONSTRAINT [DF__tbl_Hardw__Creat__546180BB]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Hardw__DataS__536D5C82]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_HardwareProvider] DROP CONSTRAINT [DF__tbl_Hardw__DataS__536D5C82]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Hardw__Modif__52793849]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_HardwareConfiguration] DROP CONSTRAINT [DF__tbl_Hardw__Modif__52793849]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Hardw__Modif__51851410]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_HardwareConfiguration] DROP CONSTRAINT [DF__tbl_Hardw__Modif__51851410]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Hardw__Creat__5090EFD7]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_HardwareConfiguration] DROP CONSTRAINT [DF__tbl_Hardw__Creat__5090EFD7]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Hardw__Creat__4F9CCB9E]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_HardwareConfiguration] DROP CONSTRAINT [DF__tbl_Hardw__Creat__4F9CCB9E]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Hardw__DataS__4EA8A765]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_HardwareConfiguration] DROP CONSTRAINT [DF__tbl_Hardw__DataS__4EA8A765]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Hardw__Hardw__4DB4832C]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_HardwareConfiguration] DROP CONSTRAINT [DF__tbl_Hardw__Hardw__4DB4832C]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Gantr__Modif__4CC05EF3]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_GantryMapping] DROP CONSTRAINT [DF__tbl_Gantr__Modif__4CC05EF3]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Gantr__Modif__4BCC3ABA]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_GantryMapping] DROP CONSTRAINT [DF__tbl_Gantr__Modif__4BCC3ABA]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Gantr__Creat__4AD81681]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_GantryMapping] DROP CONSTRAINT [DF__tbl_Gantr__Creat__4AD81681]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Gantr__Creat__49E3F248]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_GantryMapping] DROP CONSTRAINT [DF__tbl_Gantr__Creat__49E3F248]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Gantr__DataS__48EFCE0F]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_GantryMapping] DROP CONSTRAINT [DF__tbl_Gantr__DataS__48EFCE0F]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Gantr__Modif__47FBA9D6]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_GantryConfiguration] DROP CONSTRAINT [DF__tbl_Gantr__Modif__47FBA9D6]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Gantr__Modif__4707859D]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_GantryConfiguration] DROP CONSTRAINT [DF__tbl_Gantr__Modif__4707859D]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Gantr__Creat__46136164]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_GantryConfiguration] DROP CONSTRAINT [DF__tbl_Gantr__Creat__46136164]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Gantr__Creat__451F3D2B]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_GantryConfiguration] DROP CONSTRAINT [DF__tbl_Gantr__Creat__451F3D2B]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Gantr__DataS__442B18F2]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_GantryConfiguration] DROP CONSTRAINT [DF__tbl_Gantr__DataS__442B18F2]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Event__Modif__4AA30C57]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_EventsTypeMaster] DROP CONSTRAINT [DF__tbl_Event__Modif__4AA30C57]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Event__Modif__49AEE81E]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_EventsTypeMaster] DROP CONSTRAINT [DF__tbl_Event__Modif__49AEE81E]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Event__Creat__48BAC3E5]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_EventsTypeMaster] DROP CONSTRAINT [DF__tbl_Event__Creat__48BAC3E5]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Event__Creat__47C69FAC]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_EventsTypeMaster] DROP CONSTRAINT [DF__tbl_Event__Creat__47C69FAC]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Event__DataS__46D27B73]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_EventsTypeMaster] DROP CONSTRAINT [DF__tbl_Event__DataS__46D27B73]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Event__Mappi__45DE573A]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_EventsTypeMaster] DROP CONSTRAINT [DF__tbl_Event__Mappi__45DE573A]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_ECBCa__Modif__6C040022]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_ECBCallEventsDetails] DROP CONSTRAINT [DF__tbl_ECBCa__Modif__6C040022]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_ECBCa__Modif__6B0FDBE9]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_ECBCallEventsDetails] DROP CONSTRAINT [DF__tbl_ECBCa__Modif__6B0FDBE9]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_ECBCa__Creat__6A1BB7B0]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_ECBCallEventsDetails] DROP CONSTRAINT [DF__tbl_ECBCa__Creat__6A1BB7B0]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_ECBCa__Creat__69279377]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_ECBCallEventsDetails] DROP CONSTRAINT [DF__tbl_ECBCa__Creat__69279377]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_ECBCa__DataS__68336F3E]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_ECBCallEventsDetails] DROP CONSTRAINT [DF__tbl_ECBCa__DataS__68336F3E]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Devic__Modif__4336F4B9]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_DeviceTypeMaster] DROP CONSTRAINT [DF__tbl_Devic__Modif__4336F4B9]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Devic__Modif__4242D080]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_DeviceTypeMaster] DROP CONSTRAINT [DF__tbl_Devic__Modif__4242D080]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Devic__Creat__414EAC47]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_DeviceTypeMaster] DROP CONSTRAINT [DF__tbl_Devic__Creat__414EAC47]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Devic__Creat__405A880E]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_DeviceTypeMaster] DROP CONSTRAINT [DF__tbl_Devic__Creat__405A880E]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Devic__DataS__3F6663D5]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_DeviceTypeMaster] DROP CONSTRAINT [DF__tbl_Devic__DataS__3F6663D5]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Devic__Modif__3E723F9C]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_DeviceDetails] DROP CONSTRAINT [DF__tbl_Devic__Modif__3E723F9C]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Devic__Modif__3D7E1B63]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_DeviceDetails] DROP CONSTRAINT [DF__tbl_Devic__Modif__3D7E1B63]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Devic__Creat__3C89F72A]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_DeviceDetails] DROP CONSTRAINT [DF__tbl_Devic__Creat__3C89F72A]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Devic__Creat__3B95D2F1]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_DeviceDetails] DROP CONSTRAINT [DF__tbl_Devic__Creat__3B95D2F1]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Devic__DataS__3AA1AEB8]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_DeviceDetails] DROP CONSTRAINT [DF__tbl_Devic__DataS__3AA1AEB8]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Devic__OnLin__39AD8A7F]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_DeviceDetails] DROP CONSTRAINT [DF__tbl_Devic__OnLin__39AD8A7F]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Contr__Modif__38B96646]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_ControlRoomMaster] DROP CONSTRAINT [DF__tbl_Contr__Modif__38B96646]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Contr__Modif__37C5420D]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_ControlRoomMaster] DROP CONSTRAINT [DF__tbl_Contr__Modif__37C5420D]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Contr__Creat__36D11DD4]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_ControlRoomMaster] DROP CONSTRAINT [DF__tbl_Contr__Creat__36D11DD4]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Contr__Creat__35DCF99B]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_ControlRoomMaster] DROP CONSTRAINT [DF__tbl_Contr__Creat__35DCF99B]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Contr__DataS__34E8D562]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_ControlRoomMaster] DROP CONSTRAINT [DF__tbl_Contr__DataS__34E8D562]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Conne__Modif__33F4B129]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_ConnectionType] DROP CONSTRAINT [DF__tbl_Conne__Modif__33F4B129]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Conne__Modif__33008CF0]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_ConnectionType] DROP CONSTRAINT [DF__tbl_Conne__Modif__33008CF0]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Conne__Creat__320C68B7]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_ConnectionType] DROP CONSTRAINT [DF__tbl_Conne__Creat__320C68B7]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Conne__Creat__3118447E]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_ConnectionType] DROP CONSTRAINT [DF__tbl_Conne__Creat__3118447E]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Conne__DataS__30242045]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_ConnectionType] DROP CONSTRAINT [DF__tbl_Conne__DataS__30242045]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Clien__Modif__2F2FFC0C]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_ClientConfiguration] DROP CONSTRAINT [DF__tbl_Clien__Modif__2F2FFC0C]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Clien__Modif__2E3BD7D3]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_ClientConfiguration] DROP CONSTRAINT [DF__tbl_Clien__Modif__2E3BD7D3]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Clien__Creat__2D47B39A]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_ClientConfiguration] DROP CONSTRAINT [DF__tbl_Clien__Creat__2D47B39A]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Clien__Creat__2C538F61]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_ClientConfiguration] DROP CONSTRAINT [DF__tbl_Clien__Creat__2C538F61]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Clien__DataS__2B5F6B28]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_ClientConfiguration] DROP CONSTRAINT [DF__tbl_Clien__DataS__2B5F6B28]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Categ__Modif__2A6B46EF]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_CategoryMaster] DROP CONSTRAINT [DF__tbl_Categ__Modif__2A6B46EF]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Categ__Modif__297722B6]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_CategoryMaster] DROP CONSTRAINT [DF__tbl_Categ__Modif__297722B6]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Categ__Creat__2882FE7D]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_CategoryMaster] DROP CONSTRAINT [DF__tbl_Categ__Creat__2882FE7D]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Categ__Creat__278EDA44]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_CategoryMaster] DROP CONSTRAINT [DF__tbl_Categ__Creat__278EDA44]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Categ__DataS__269AB60B]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_CategoryMaster] DROP CONSTRAINT [DF__tbl_Categ__DataS__269AB60B]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_CallT__Modif__5F9E293D]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_CallTypeMaster] DROP CONSTRAINT [DF__tbl_CallT__Modif__5F9E293D]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_CallT__Modif__5EAA0504]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_CallTypeMaster] DROP CONSTRAINT [DF__tbl_CallT__Modif__5EAA0504]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_CallT__Creat__5DB5E0CB]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_CallTypeMaster] DROP CONSTRAINT [DF__tbl_CallT__Creat__5DB5E0CB]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_CallT__Creat__5CC1BC92]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_CallTypeMaster] DROP CONSTRAINT [DF__tbl_CallT__Creat__5CC1BC92]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_CallT__DataS__5BCD9859]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_CallTypeMaster] DROP CONSTRAINT [DF__tbl_CallT__DataS__5BCD9859]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_CallT__Mappi__5AD97420]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_CallTypeMaster] DROP CONSTRAINT [DF__tbl_CallT__Mappi__5AD97420]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_CallS__Modif__664B26CC]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_CallStatusMaster] DROP CONSTRAINT [DF__tbl_CallS__Modif__664B26CC]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_CallS__Modif__65570293]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_CallStatusMaster] DROP CONSTRAINT [DF__tbl_CallS__Modif__65570293]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_CallS__Creat__6462DE5A]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_CallStatusMaster] DROP CONSTRAINT [DF__tbl_CallS__Creat__6462DE5A]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_CallS__Creat__636EBA21]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_CallStatusMaster] DROP CONSTRAINT [DF__tbl_CallS__Creat__636EBA21]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_CallS__DataS__627A95E8]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_CallStatusMaster] DROP CONSTRAINT [DF__tbl_CallS__DataS__627A95E8]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_CallS__Mappi__618671AF]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_CallStatusMaster] DROP CONSTRAINT [DF__tbl_CallS__Mappi__618671AF]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_ATCCE__Modif__7D2E8C24]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_ATCCEventsDetails] DROP CONSTRAINT [DF__tbl_ATCCE__Modif__7D2E8C24]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_ATCCE__Modif__7C3A67EB]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_ATCCEventsDetails] DROP CONSTRAINT [DF__tbl_ATCCE__Modif__7C3A67EB]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_ATCCE__Creat__7B4643B2]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_ATCCEventsDetails] DROP CONSTRAINT [DF__tbl_ATCCE__Creat__7B4643B2]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_ATCCE__Creat__7A521F79]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_ATCCEventsDetails] DROP CONSTRAINT [DF__tbl_ATCCE__Creat__7A521F79]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_ATCCE__DataS__795DFB40]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_ATCCEventsDetails] DROP CONSTRAINT [DF__tbl_ATCCE__DataS__795DFB40]
END
GO
/****** Object:  Table [dbo].[tbl_VMSMessageDetails]    Script Date: 08-07-2021 17:08:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_VMSMessageDetails]') AND type in (N'U'))
DROP TABLE [dbo].[tbl_VMSMessageDetails]
GO
/****** Object:  Table [dbo].[tbl_VIDSEventsDetails]    Script Date: 08-07-2021 17:08:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_VIDSEventsDetails]') AND type in (N'U'))
DROP TABLE [dbo].[tbl_VIDSEventsDetails]
GO
/****** Object:  Table [dbo].[tbl_VehicleClass]    Script Date: 08-07-2021 17:08:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_VehicleClass]') AND type in (N'U'))
DROP TABLE [dbo].[tbl_VehicleClass]
GO
/****** Object:  Table [dbo].[tbl_UserMaster]    Script Date: 08-07-2021 17:08:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_UserMaster]') AND type in (N'U'))
DROP TABLE [dbo].[tbl_UserMaster]
GO
/****** Object:  Table [dbo].[tbl_TempImportPermission]    Script Date: 08-07-2021 17:08:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_TempImportPermission]') AND type in (N'U'))
DROP TABLE [dbo].[tbl_TempImportPermission]
GO
/****** Object:  Table [dbo].[tbl_ShiftTimining]    Script Date: 08-07-2021 17:08:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_ShiftTimining]') AND type in (N'U'))
DROP TABLE [dbo].[tbl_ShiftTimining]
GO
/****** Object:  Table [dbo].[tbl_RolePermission]    Script Date: 08-07-2021 17:08:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_RolePermission]') AND type in (N'U'))
DROP TABLE [dbo].[tbl_RolePermission]
GO
/****** Object:  Table [dbo].[tbl_RoleMaster]    Script Date: 08-07-2021 17:08:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_RoleMaster]') AND type in (N'U'))
DROP TABLE [dbo].[tbl_RoleMaster]
GO
/****** Object:  Table [dbo].[tbl_PermissionMaster]    Script Date: 08-07-2021 17:08:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_PermissionMaster]') AND type in (N'U'))
DROP TABLE [dbo].[tbl_PermissionMaster]
GO
/****** Object:  Table [dbo].[tbl_METEventsDetails]    Script Date: 08-07-2021 17:08:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_METEventsDetails]') AND type in (N'U'))
DROP TABLE [dbo].[tbl_METEventsDetails]
GO
/****** Object:  Table [dbo].[tbl_METConfiguration]    Script Date: 08-07-2021 17:08:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_METConfiguration]') AND type in (N'U'))
DROP TABLE [dbo].[tbl_METConfiguration]
GO
/****** Object:  Table [dbo].[tbl_MenuMaster]    Script Date: 08-07-2021 17:08:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_MenuMaster]') AND type in (N'U'))
DROP TABLE [dbo].[tbl_MenuMaster]
GO
/****** Object:  Table [dbo].[tbl_LogingActivity]    Script Date: 08-07-2021 17:08:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_LogingActivity]') AND type in (N'U'))
DROP TABLE [dbo].[tbl_LogingActivity]
GO
/****** Object:  Table [dbo].[tbl_LocationConfiguration]    Script Date: 08-07-2021 17:08:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_LocationConfiguration]') AND type in (N'U'))
DROP TABLE [dbo].[tbl_LocationConfiguration]
GO
/****** Object:  Table [dbo].[tbl_LaneType]    Script Date: 08-07-2021 17:08:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_LaneType]') AND type in (N'U'))
DROP TABLE [dbo].[tbl_LaneType]
GO
/****** Object:  Table [dbo].[tbl_LaneForType]    Script Date: 08-07-2021 17:08:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_LaneForType]') AND type in (N'U'))
DROP TABLE [dbo].[tbl_LaneForType]
GO
/****** Object:  Table [dbo].[tbl_LaneConfiguration]    Script Date: 08-07-2021 17:08:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_LaneConfiguration]') AND type in (N'U'))
DROP TABLE [dbo].[tbl_LaneConfiguration]
GO
/****** Object:  Table [dbo].[tbl_IncidentMaster]    Script Date: 08-07-2021 17:08:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_IncidentMaster]') AND type in (N'U'))
DROP TABLE [dbo].[tbl_IncidentMaster]
GO
/****** Object:  Table [dbo].[tbl_HardwareType]    Script Date: 08-07-2021 17:08:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_HardwareType]') AND type in (N'U'))
DROP TABLE [dbo].[tbl_HardwareType]
GO
/****** Object:  Table [dbo].[tbl_HardwareProvider]    Script Date: 08-07-2021 17:08:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_HardwareProvider]') AND type in (N'U'))
DROP TABLE [dbo].[tbl_HardwareProvider]
GO
/****** Object:  Table [dbo].[tbl_HardwareConfiguration]    Script Date: 08-07-2021 17:08:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_HardwareConfiguration]') AND type in (N'U'))
DROP TABLE [dbo].[tbl_HardwareConfiguration]
GO
/****** Object:  Table [dbo].[tbl_GantryMapping]    Script Date: 08-07-2021 17:08:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_GantryMapping]') AND type in (N'U'))
DROP TABLE [dbo].[tbl_GantryMapping]
GO
/****** Object:  Table [dbo].[tbl_GantryConfiguration]    Script Date: 08-07-2021 17:08:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_GantryConfiguration]') AND type in (N'U'))
DROP TABLE [dbo].[tbl_GantryConfiguration]
GO
/****** Object:  Table [dbo].[tbl_EventsTypeMaster]    Script Date: 08-07-2021 17:08:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_EventsTypeMaster]') AND type in (N'U'))
DROP TABLE [dbo].[tbl_EventsTypeMaster]
GO
/****** Object:  Table [dbo].[tbl_ECBCallEventsDetails]    Script Date: 08-07-2021 17:08:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_ECBCallEventsDetails]') AND type in (N'U'))
DROP TABLE [dbo].[tbl_ECBCallEventsDetails]
GO
/****** Object:  Table [dbo].[tbl_DeviceTypeMaster]    Script Date: 08-07-2021 17:08:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_DeviceTypeMaster]') AND type in (N'U'))
DROP TABLE [dbo].[tbl_DeviceTypeMaster]
GO
/****** Object:  Table [dbo].[tbl_DeviceDetails]    Script Date: 08-07-2021 17:08:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_DeviceDetails]') AND type in (N'U'))
DROP TABLE [dbo].[tbl_DeviceDetails]
GO
/****** Object:  Table [dbo].[tbl_ControlRoomMaster]    Script Date: 08-07-2021 17:08:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_ControlRoomMaster]') AND type in (N'U'))
DROP TABLE [dbo].[tbl_ControlRoomMaster]
GO
/****** Object:  Table [dbo].[tbl_ConnectionType]    Script Date: 08-07-2021 17:08:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_ConnectionType]') AND type in (N'U'))
DROP TABLE [dbo].[tbl_ConnectionType]
GO
/****** Object:  Table [dbo].[tbl_ClientConfiguration]    Script Date: 08-07-2021 17:08:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_ClientConfiguration]') AND type in (N'U'))
DROP TABLE [dbo].[tbl_ClientConfiguration]
GO
/****** Object:  Table [dbo].[tbl_CategoryMaster]    Script Date: 08-07-2021 17:08:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_CategoryMaster]') AND type in (N'U'))
DROP TABLE [dbo].[tbl_CategoryMaster]
GO
/****** Object:  Table [dbo].[tbl_CallTypeMaster]    Script Date: 08-07-2021 17:08:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_CallTypeMaster]') AND type in (N'U'))
DROP TABLE [dbo].[tbl_CallTypeMaster]
GO
/****** Object:  Table [dbo].[tbl_CallStatusMaster]    Script Date: 08-07-2021 17:08:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_CallStatusMaster]') AND type in (N'U'))
DROP TABLE [dbo].[tbl_CallStatusMaster]
GO
/****** Object:  Table [dbo].[tbl_ATCCEventsDetails]    Script Date: 08-07-2021 17:08:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_ATCCEventsDetails]') AND type in (N'U'))
DROP TABLE [dbo].[tbl_ATCCEventsDetails]
GO
/****** Object:  Table [dbo].[tbl_ActivityLog]    Script Date: 08-07-2021 17:08:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_ActivityLog]') AND type in (N'U'))
DROP TABLE [dbo].[tbl_ActivityLog]
GO
/****** Object:  UserDefinedFunction [dbo].[ValueSplit]    Script Date: 08-07-2021 17:08:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ValueSplit]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[ValueSplit]
GO
/****** Object:  UserDefinedFunction [dbo].[fnc_ValueSplit]    Script Date: 08-07-2021 17:08:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fnc_ValueSplit]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fnc_ValueSplit]
GO
/****** Object:  UserDefinedFunction [dbo].[fnc_ValueSplit]    Script Date: 08-07-2021 17:08:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnc_ValueSplit]
(
	-- Add the parameters for the function here
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
/****** Object:  UserDefinedFunction [dbo].[ValueSplit]    Script Date: 08-07-2021 17:08:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[ValueSplit]
(
	-- Add the parameters for the function here
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
/****** Object:  Table [dbo].[tbl_ActivityLog]    Script Date: 08-07-2021 17:08:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_ActivityLog](
	[EntryId] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [bigint] NULL,
	[PrevColumn] [varchar](4000) NULL,
	[CurrentColumn] [varchar](4000) NULL,
	[Action] [varchar](50) NULL,
	[EventId] [varchar](50) NULL,
	[CreatedDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_ATCCEventsDetails]    Script Date: 08-07-2021 17:08:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_ATCCEventsDetails](
	[EntryId] [bigint] IDENTITY(1,1) NOT NULL,
	[EventDateTime] [datetime] NULL,
	[ATCCId] [bigint] NOT NULL,
	[VehicleClassId] [smallint] NOT NULL,
	[AxleCount] [smallint] NOT NULL,
	[GrossWeight] [decimal](10, 3) NOT NULL,
	[VehicleImage] [varchar](255) NOT NULL,
	[DataStatus] [smallint] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [bigint] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [bigint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_CallStatusMaster]    Script Date: 08-07-2021 17:08:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_CallStatusMaster](
	[EntryId] [smallint] IDENTITY(1,1) NOT NULL,
	[CallStatusName] [varchar](100) NULL,
	[MappingId] [smallint] NULL,
	[DataStatus] [smallint] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [bigint] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [bigint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_CallTypeMaster]    Script Date: 08-07-2021 17:08:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_CallTypeMaster](
	[EntryId] [smallint] IDENTITY(1,1) NOT NULL,
	[CallTypeName] [varchar](100) NULL,
	[MappingId] [smallint] NULL,
	[DataStatus] [smallint] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [bigint] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [bigint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_CategoryMaster]    Script Date: 08-07-2021 17:08:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_CategoryMaster](
	[EntryId] [smallint] IDENTITY(1,1) NOT NULL,
	[CategoryName] [varchar](100) NULL,
	[DataStatus] [smallint] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [bigint] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [bigint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_ClientConfiguration]    Script Date: 08-07-2021 17:08:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_ClientConfiguration](
	[EntryId] [int] IDENTITY(1,1) NOT NULL,
	[ClientName] [varchar](50) NULL,
	[ClientAddress] [varchar](100) NULL,
	[MobileNumber] [varchar](15) NULL,
	[EmailId] [varchar](25) NULL,
	[DataStatus] [smallint] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [bigint] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [bigint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_ConnectionType]    Script Date: 08-07-2021 17:08:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_ConnectionType](
	[EntryId] [int] IDENTITY(1,1) NOT NULL,
	[ConnectionType] [varchar](100) NULL,
	[DataStatus] [smallint] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [bigint] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [bigint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_ControlRoomMaster]    Script Date: 08-07-2021 17:08:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_ControlRoomMaster](
	[EntryId] [smallint] IDENTITY(1,1) NOT NULL,
	[ControlRoomName] [varchar](100) NULL,
	[DataStatus] [smallint] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [bigint] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [bigint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_DeviceDetails]    Script Date: 08-07-2021 17:08:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_DeviceDetails](
	[EntryId] [bigint] IDENTITY(1,1) NOT NULL,
	[ControlRoomId] [smallint] NOT NULL,
	[CategoryId] [smallint] NULL,
	[DeviceTypeId] [smallint] NULL,
	[DeviceName] [varchar](100) NULL,
	[ConnectionTypeId] [smallint] NULL,
	[Direction] [smallint] NULL,
	[IpAddress] [varchar](20) NULL,
	[PortNumber] [smallint] NULL,
	[DeviceLoginId] [varchar](50) NULL,
	[DevicePassword] [varchar](50) NULL,
	[Latitude] [varchar](50) NULL,
	[Longitude] [varchar](50) NULL,
	[ModelNumber] [varchar](100) NULL,
	[Manufacturer] [varchar](100) NULL,
	[Vendor] [varchar](100) NULL,
	[Remark] [varchar](100) NULL,
	[PurchageDate] [date] NULL,
	[ManufacturerDate] [date] NULL,
	[WarrantyExpireDate] [date] NULL,
	[GantryId] [smallint] NULL,
	[LaneNumber] [smallint] NULL,
	[OnLineStatus] [smallint] NULL,
	[DataStatus] [smallint] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [bigint] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [bigint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_DeviceTypeMaster]    Script Date: 08-07-2021 17:08:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_DeviceTypeMaster](
	[EntryId] [int] IDENTITY(1,1) NOT NULL,
	[DeviceTypeName] [varchar](100) NULL,
	[CategoryId] [smallint] NULL,
	[IconName] [varchar](100) NULL,
	[DataStatus] [smallint] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [bigint] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [bigint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_ECBCallEventsDetails]    Script Date: 08-07-2021 17:08:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_ECBCallEventsDetails](
	[EntryId] [bigint] IDENTITY(1,1) NOT NULL,
	[CallerId] [bigint] NULL,
	[CalleeId] [bigint] NULL,
	[CallTypeId] [smallint] NULL,
	[SessionId] [varchar](50) NULL,
	[StartDateTime] [datetime] NULL,
	[EndDateTime] [datetime] NULL,
	[CallDuration] [smallint] NULL,
	[RecordingFileName] [varchar](255) NULL,
	[CallStatusId] [smallint] NULL,
	[DataStatus] [smallint] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [bigint] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [bigint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_EventsTypeMaster]    Script Date: 08-07-2021 17:08:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_EventsTypeMaster](
	[EntryId] [smallint] IDENTITY(1,1) NOT NULL,
	[EventTypeName] [varchar](100) NULL,
	[DeviceTypeId] [smallint] NULL,
	[MappingId] [smallint] NULL,
	[DataStatus] [smallint] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [bigint] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [bigint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_GantryConfiguration]    Script Date: 08-07-2021 17:08:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_GantryConfiguration](
	[EntryId] [int] IDENTITY(1,1) NOT NULL,
	[ControlRoomId] [smallint] NULL,
	[GantryName] [varchar](50) NULL,
	[Latitude] [varchar](50) NULL,
	[Longitude] [varchar](50) NULL,
	[DataStatus] [smallint] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [bigint] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [bigint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_GantryMapping]    Script Date: 08-07-2021 17:08:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_GantryMapping](
	[EntryGantryId] [int] NULL,
	[ExitGantryId] [int] NULL,
	[GantryDistance] [decimal](18, 3) NULL,
	[DataStatus] [smallint] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [bigint] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [bigint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_HardwareConfiguration]    Script Date: 08-07-2021 17:08:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_HardwareConfiguration](
	[EntryId] [bigint] IDENTITY(1,1) NOT NULL,
	[LaneId] [bigint] NULL,
	[HardwareName] [varchar](50) NULL,
	[HardwareProviderId] [smallint] NULL,
	[HardwareTypeId] [smallint] NULL,
	[ConnectionTypeId] [smallint] NULL,
	[ConnectionAddress] [varchar](20) NULL,
	[Port] [int] NULL,
	[UserID] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[DataStatus] [smallint] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [bigint] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [bigint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_HardwareProvider]    Script Date: 08-07-2021 17:08:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_HardwareProvider](
	[EntryId] [smallint] IDENTITY(1,1) NOT NULL,
	[ClientId] [smallint] NULL,
	[ProviderName] [varchar](100) NULL,
	[DataStatus] [smallint] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [bigint] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [bigint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_HardwareType]    Script Date: 08-07-2021 17:08:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_HardwareType](
	[EntryId] [smallint] IDENTITY(1,1) NOT NULL,
	[HardwareType] [varchar](100) NULL,
	[IconName] [varchar](100) NULL,
	[ConnectionTypeId] [smallint] NULL,
	[DataStatus] [smallint] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [bigint] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [bigint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_IncidentMaster]    Script Date: 08-07-2021 17:08:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_IncidentMaster](
	[EntryId] [bigint] IDENTITY(1,1) NOT NULL,
	[IncidentName] [varchar](100) NOT NULL,
	[IncidentReportDate] [datetime] NOT NULL,
	[IncidentDate] [datetime] NOT NULL,
	[IncidentCategoryId] [bigint] NOT NULL,
	[IncidentRefNo] [varchar](30) NULL,
	[IncidentSourceType] [varchar](30) NOT NULL,
	[IncidentSourceDevice] [varchar](50) NULL,
	[VehicleRegNo] [varchar](30) NULL,
	[PersonName] [varchar](100) NULL,
	[PhoneNo] [varchar](15) NULL,
	[Comments] [varchar](500) NULL,
	[IncidentLocation] [varchar](50) NULL,
	[Latitude] [varchar](50) NULL,
	[Longitude] [varchar](50) NULL,
	[IncidentStatus] [smallint] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [bigint] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [bigint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_LaneConfiguration]    Script Date: 08-07-2021 17:08:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_LaneConfiguration](
	[EntryId] [bigint] IDENTITY(1,1) NOT NULL,
	[ControlRoomId] [smallint] NULL,
	[GantryId] [smallint] NULL,
	[LaneNumber] [smallint] NULL,
	[LaneDirection] [smallint] NULL,
	[DataStatus] [smallint] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [bigint] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [bigint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_LaneForType]    Script Date: 08-07-2021 17:08:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_LaneForType](
	[EntryId] [smallint] IDENTITY(1,1) NOT NULL,
	[LaneForName] [varchar](100) NULL,
	[DataStatus] [smallint] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [bigint] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [bigint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_LaneType]    Script Date: 08-07-2021 17:08:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_LaneType](
	[EntryId] [smallint] IDENTITY(1,1) NOT NULL,
	[LaneType] [varchar](100) NULL,
	[DataStatus] [smallint] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [bigint] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [bigint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_LocationConfiguration]    Script Date: 08-07-2021 17:08:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_LocationConfiguration](
	[EntryId] [int] IDENTITY(1,1) NOT NULL,
	[TmsId] [int] NOT NULL,
	[LocationName] [varchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_LogingActivity]    Script Date: 08-07-2021 17:08:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_LogingActivity](
	[EntryId] [bigint] IDENTITY(1,1) NOT NULL,
	[LoginId] [varchar](50) NULL,
	[PlazaId] [smallint] NULL,
	[LaneNumber] [smallint] NULL,
	[LoginStatus] [smallint] NULL,
	[LaneTransId] [bigint] NULL,
	[CreatedDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_MenuMaster]    Script Date: 08-07-2021 17:08:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_MenuMaster](
	[EntryId] [int] IDENTITY(1,1) NOT NULL,
	[MenuName] [varchar](40) NULL,
	[MenuURL] [varchar](100) NULL,
	[MenuIcon] [varchar](100) NULL,
	[MennuAccess] [smallint] NULL,
	[OderBy] [smallint] NULL,
	[ParentId] [bigint] NULL,
	[EventId] [smallint] NULL,
	[DataStatus] [smallint] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [bigint] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [bigint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_METConfiguration]    Script Date: 08-07-2021 17:08:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_METConfiguration](
	[EntryId] [bigint] IDENTITY(1,1) NOT NULL,
	[AirTemperatureMin] [decimal](6, 2) NOT NULL,
	[AirTemperatureMax] [decimal](6, 2) NOT NULL,
	[HumidityRH] [decimal](6, 2) NOT NULL,
	[HumidityAH] [decimal](6, 2) NOT NULL,
	[Visibility] [decimal](8, 2) NOT NULL,
	[RoadTemperature] [decimal](6, 2) NOT NULL,
	[WindDirectionValue] [decimal](6, 2) NOT NULL,
	[WindSpeedValue] [decimal](6, 2) NOT NULL,
	[RainValue] [decimal](6, 2) NOT NULL,
	[SynchronizeTime] [smallint] NOT NULL,
	[DataStatus] [smallint] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [bigint] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [bigint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_METEventsDetails]    Script Date: 08-07-2021 17:08:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_METEventsDetails](
	[EntryId] [bigint] IDENTITY(1,1) NOT NULL,
	[EventDateTime] [datetime] NULL,
	[MetId] [bigint] NOT NULL,
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
	[AlertRequired] [smallint] NULL,
	[DataStatus] [smallint] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [bigint] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [bigint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_PermissionMaster]    Script Date: 08-07-2021 17:08:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_PermissionMaster](
	[EntryId] [int] IDENTITY(1,1) NOT NULL,
	[ClientId] [smallint] NULL,
	[EventName] [varchar](100) NULL,
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
/****** Object:  Table [dbo].[tbl_RoleMaster]    Script Date: 08-07-2021 17:08:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_RoleMaster](
	[EntryId] [int] IDENTITY(1,1) NOT NULL,
	[ClientId] [smallint] NULL,
	[PlazaId] [smallint] NULL,
	[RoleName] [varchar](100) NULL,
	[DataStatus] [smallint] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [bigint] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [bigint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_RolePermission]    Script Date: 08-07-2021 17:08:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_RolePermission](
	[ClientId] [smallint] NULL,
	[EventId] [smallint] NULL,
	[RoleId] [bigint] NULL,
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
/****** Object:  Table [dbo].[tbl_ShiftTimining]    Script Date: 08-07-2021 17:08:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_ShiftTimining](
	[EntryId] [smallint] IDENTITY(1,1) NOT NULL,
	[StartTimmng] [varchar](10) NULL,
	[EndTimming] [varchar](10) NULL,
	[DataStatus] [smallint] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [bigint] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [bigint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_TempImportPermission]    Script Date: 08-07-2021 17:08:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_TempImportPermission](
	[EventId] [smallint] NULL,
	[DataView] [smallint] NULL,
	[DataAdd] [smallint] NULL,
	[DataUpdate] [smallint] NULL,
	[SessionId] [varchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_UserMaster]    Script Date: 08-07-2021 17:08:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_UserMaster](
	[EntryId] [int] IDENTITY(1,1) NOT NULL,
	[ClientId] [smallint] NULL,
	[LoginId] [varchar](20) NULL,
	[LoginPassword] [varchar](100) NULL,
	[FirstName] [varchar](20) NULL,
	[LastName] [varchar](20) NULL,
	[EmailId] [varchar](25) NULL,
	[MobileNumber] [varchar](15) NULL,
	[AccountExpiredDate] [date] NULL,
	[RoleId] [int] NULL,
	[DataStatus] [smallint] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [bigint] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [bigint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_VehicleClass]    Script Date: 08-07-2021 17:08:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_VehicleClass](
	[EntryId] [smallint] IDENTITY(1,1) NOT NULL,
	[ClassName] [varchar](100) NULL,
	[ClassDescription] [varchar](100) NULL,
	[VehicleSpeed] [smallint] NULL,
	[DataStatus] [smallint] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [bigint] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [bigint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_VIDSEventsDetails]    Script Date: 08-07-2021 17:08:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_VIDSEventsDetails](
	[EntryId] [bigint] IDENTITY(1,1) NOT NULL,
	[EventDateTime] [datetime] NULL,
	[VidsId] [bigint] NOT NULL,
	[EventTypeId] [bigint] NOT NULL,
	[DataStatus] [smallint] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [bigint] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [bigint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_VMSMessageDetails]    Script Date: 08-07-2021 17:08:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_VMSMessageDetails](
	[EntryId] [bigint] IDENTITY(1,1) NOT NULL,
	[VmsIds] [varchar](4000) NOT NULL,
	[MessageFormatId] [smallint] NOT NULL,
	[FontFormat] [varchar](100) NULL,
	[FontSize] [smallint] NULL,
	[AlignmentId] [smallint] NULL,
	[Brightness] [smallint] NULL,
	[MessageLanguageId] [smallint] NOT NULL,
	[MessageOrientationId] [smallint] NOT NULL,
	[MessageDuration] [smallint] NOT NULL,
	[MessageBody] [nvarchar](1000) NOT NULL,
	[MessagePriority] [smallint] NULL,
	[DataStatus] [smallint] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [bigint] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [bigint] NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbl_ActivityLog] ON 
GO
INSERT [dbo].[tbl_ActivityLog] ([EntryId], [UserId], [PrevColumn], [CurrentColumn], [Action], [EventId], [CreatedDate]) VALUES (1, 0, NULL, N'DeviceId:1,ControlRoomId:1,CategoryId:1,DeviceTypeId:1,DeviceName:KM 100,Direction:1,IpAddress:192.168.1.1,PortNumber:556,DeviceLoginId:admin,DevicePassword:admin@123,Latitude:0,Longitude:0,ModelNumber:MK101,Manufacturer:Hikvision,Remark:Test,WarrantyExpireDate:2039-12-31,Status:1', N'Insert', N'2', CAST(N'2021-06-30T01:20:47.250' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([EntryId], [UserId], [PrevColumn], [CurrentColumn], [Action], [EventId], [CreatedDate]) VALUES (2, 0, NULL, N'DeviceId:1,ControlRoomId:1,CategoryId:1,DeviceTypeId:1,DeviceName:KM 100,Direction:1,IpAddress:192.168.1.1,PortNumber:556,DeviceLoginId:admin,DevicePassword:admin@123,Latitude:0,Longitude:0,ModelNumber:MK101,Manufacturer:Hikvision,Remark:Test,WarrantyExpireDate:2039-12-31,Status:2', N'Insert', N'2', CAST(N'2021-06-30T01:26:18.943' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([EntryId], [UserId], [PrevColumn], [CurrentColumn], [Action], [EventId], [CreatedDate]) VALUES (3, 0, NULL, N'DeviceId:1,ControlRoomId:1,CategoryId:1,DeviceTypeId:1,DeviceName:KM 100,Direction:1,IpAddress:192.168.1.1,PortNumber:556,DeviceLoginId:admin,DevicePassword:admin@123,Latitude:0,Longitude:0,ModelNumber:MK101,Manufacturer:Hikvision,Remark:Test,WarrantyExpireDate:2039-12-31,Status:1', N'Insert', N'2', CAST(N'2021-06-30T01:26:25.657' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([EntryId], [UserId], [PrevColumn], [CurrentColumn], [Action], [EventId], [CreatedDate]) VALUES (4, 0, NULL, N'DeviceId:1,ControlRoomId:1,CategoryId:1,DeviceTypeId:1,DeviceName:KM 100,Direction:1,IpAddress:192.168.1.1,PortNumber:556,DeviceLoginId:admin,DevicePassword:admin@123,Latitude:0,Longitude:0,ModelNumber:MK101,Manufacturer:Hikvision,Remark:Test,WarrantyExpireDate:2039-12-31,Status:1', N'Insert', N'2', CAST(N'2021-06-30T01:26:32.697' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([EntryId], [UserId], [PrevColumn], [CurrentColumn], [Action], [EventId], [CreatedDate]) VALUES (5, 0, NULL, N'GantryId:1,GantryName:Gantry 1,Latitude:0,Longitude:0,Status:1,ControlRoomId:1', N'Insert', N'3', CAST(N'2021-06-30T02:25:34.257' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([EntryId], [UserId], [PrevColumn], [CurrentColumn], [Action], [EventId], [CreatedDate]) VALUES (6, 0, N'GantryId:1,GantryName:Gantry 1,Latitude:0,Longitude:0,Status:1,ControlRoomId:1', N'GantryId:1,GantryName:Gantry 10,Latitude:0,Longitude:0,Status:2,ControlRoomId:1', N'Update', N'3', CAST(N'2021-06-30T02:28:37.970' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([EntryId], [UserId], [PrevColumn], [CurrentColumn], [Action], [EventId], [CreatedDate]) VALUES (7, 0, N'GantryId:1,GantryName:Gantry 10,Latitude:0,Longitude:0,Status:2,ControlRoomId:1', N'GantryId:1,GantryName:Gantry 1,Latitude:0,Longitude:0,Status:1,ControlRoomId:1', N'Update', N'3', CAST(N'2021-06-30T02:28:45.737' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([EntryId], [UserId], [PrevColumn], [CurrentColumn], [Action], [EventId], [CreatedDate]) VALUES (8, 0, NULL, N'GantryId:2,GantryName:Gantry 2,Latitude:0.2,Longitude:0.1,Status:1,ControlRoomId:1', N'Insert', N'3', CAST(N'2021-06-30T10:39:49.560' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([EntryId], [UserId], [PrevColumn], [CurrentColumn], [Action], [EventId], [CreatedDate]) VALUES (9, 0, NULL, N'EntryGantryId:1,ExitGantryId:2,GantryDistance:2.000,DataStatus:1', N'Insert', N'4', CAST(N'2021-06-30T10:40:27.107' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([EntryId], [UserId], [PrevColumn], [CurrentColumn], [Action], [EventId], [CreatedDate]) VALUES (10, 0, NULL, N'EntryGantryId:2,ExitGantryId:1,GantryDistance:3.000,DataStatus:1', N'Insert', N'4', CAST(N'2021-06-30T10:40:38.843' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([EntryId], [UserId], [PrevColumn], [CurrentColumn], [Action], [EventId], [CreatedDate]) VALUES (11, 0, N'EntryGantryId:1,ExitGantryId:2,GantryDistance:2.000,DataStatus:1', N'EntryGantryId:1,ExitGantryId:2,GantryDistance:5.000,DataStatus:1', N'Update', N'4', CAST(N'2021-06-30T10:40:50.983' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([EntryId], [UserId], [PrevColumn], [CurrentColumn], [Action], [EventId], [CreatedDate]) VALUES (12, 0, N'EntryGantryId:2,ExitGantryId:1,GantryDistance:3.000,DataStatus:1', N'EntryGantryId:2,ExitGantryId:1,GantryDistance:7.000,DataStatus:1', N'Update', N'4', CAST(N'2021-06-30T10:41:05.833' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([EntryId], [UserId], [PrevColumn], [CurrentColumn], [Action], [EventId], [CreatedDate]) VALUES (17, 0, N'ClassId:1,ClassName:LMV,ClassDescription:,VehicleSpeed:80,Status:1', N'ClassId:1,ClassName:LMV,ClassDescription:test,VehicleSpeed:80,Status:1', N'Update', N'6', CAST(N'2021-07-01T00:33:56.260' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([EntryId], [UserId], [PrevColumn], [CurrentColumn], [Action], [EventId], [CreatedDate]) VALUES (18, 0, N'ClassId:1,ClassName:LMV,ClassDescription:test,VehicleSpeed:80,Status:1', N'ClassId:1,ClassName:LMV,ClassDescription:test,VehicleSpeed:800,Status:1', N'Update', N'6', CAST(N'2021-07-01T00:34:03.203' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([EntryId], [UserId], [PrevColumn], [CurrentColumn], [Action], [EventId], [CreatedDate]) VALUES (19, 0, N'ClassId:1,ClassName:LMV,ClassDescription:test,VehicleSpeed:800,Status:1', N'ClassId:1,ClassName:LMV,ClassDescription:test,VehicleSpeed:80,Status:1', N'Update', N'6', CAST(N'2021-07-01T00:34:32.600' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([EntryId], [UserId], [PrevColumn], [CurrentColumn], [Action], [EventId], [CreatedDate]) VALUES (21, 0, N'DeviceId:2,ControlRoomId:1,CategoryId:1,DeviceTypeId:1,DeviceName:PTZ Camera,Direction:1,IpAddress:192.168.10.1,PortNumber:556,DeviceLoginId:admin,DevicePassword:admin,Latitude:0,Longitude:0,ModelNumber:PTZ Camera,Manufacturer:PTZ Camera,Vendor:PTZ Camera,Remark:New Instal,PurchageDate:2021-07-01,ManufacturerDate:2021-07-01,WarrantyExpireDate:2039-12-31,GantryId:1,LaneNumber:1,Status:1', N'DeviceId:2,ControlRoomId:1,CategoryId:1,DeviceTypeId:1,DeviceName:PTZ Camera1,Direction:1,IpAddress:192.168.10.1,PortNumber:556,DeviceLoginId:admin1,DevicePassword:admin1,Latitude:0,Longitude:0,ModelNumber:PTZ Camera0,Manufacturer:PTZ Camera1,Vendor:PTZ Camera2,Remark:New Instal1,PurchageDate:2021-06-01,ManufacturerDate:2021-01-01,WarrantyExpireDate:2039-12-31,GantryId:1,LaneNumber:1,Status:1', N'Insert', N'2', CAST(N'2021-07-01T17:26:22.990' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([EntryId], [UserId], [PrevColumn], [CurrentColumn], [Action], [EventId], [CreatedDate]) VALUES (22, 0, NULL, N'DeviceId:1,ControlRoomId:1,CategoryId:1,DeviceTypeId:1,DeviceName:KM 100,Direction:1,IpAddress:192.168.1.1,PortNumber:556,DeviceLoginId:admin,DevicePassword:admin@123,Latitude:0,Longitude:0,ModelNumber:MK101,Manufacturer:Hikvision,Vendor:Super,Remark:Test,PurchageDate:2021-05-03,ManufacturerDate:2021-01-05,WarrantyExpireDate:2039-12-31,GantryId:1,LaneNumber:1,Status:1', N'Insert', N'2', CAST(N'2021-07-01T17:26:59.890' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([EntryId], [UserId], [PrevColumn], [CurrentColumn], [Action], [EventId], [CreatedDate]) VALUES (24, 0, N'RoleId:1,RoleName:Role,Status:1,ClientId:0,PlazaId:0', N'RoleId:1,RoleName:Role-1,Status:1,ClientId:0,PlazaId:0', N'Update', N'10', CAST(N'2021-07-01T23:19:38.040' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([EntryId], [UserId], [PrevColumn], [CurrentColumn], [Action], [EventId], [CreatedDate]) VALUES (25, 0, N'RoleId:1,RoleName:Role-1,Status:1,ClientId:0,PlazaId:0', N'RoleId:1,RoleName:Role-10,Status:1,ClientId:0,PlazaId:0', N'Update', N'10', CAST(N'2021-07-01T23:21:36.827' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([EntryId], [UserId], [PrevColumn], [CurrentColumn], [Action], [EventId], [CreatedDate]) VALUES (26, 0, NULL, N'RoleId:2,RoleName:Role,Status:1,ClientId:0,PlazaId:0', N'Insert', N'10', CAST(N'2021-07-01T23:22:09.097' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([EntryId], [UserId], [PrevColumn], [CurrentColumn], [Action], [EventId], [CreatedDate]) VALUES (27, 0, NULL, N'DeviceId:3,ControlRoomId:1,CategoryId:1,DeviceTypeId:8,DeviceName:VMS-1,Direction:0,IpAddress:192.168.1.10,PortNumber:779,DeviceLoginId:,DevicePassword:,Latitude:0,Longitude:0,ModelNumber:Photon,Manufacturer:Photon,Vendor:Plus,Remark:New VMS ,PurchageDate:2021-07-01,ManufacturerDate:2021-07-01,WarrantyExpireDate:2021-07-31,GantryId:0,LaneNumber:0,Status:1', N'Insert', N'2', CAST(N'2021-07-02T00:25:44.017' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([EntryId], [UserId], [PrevColumn], [CurrentColumn], [Action], [EventId], [CreatedDate]) VALUES (28, 0, NULL, N'DeviceId:4,ControlRoomId:1,CategoryId:1,DeviceTypeId:8,DeviceName:VMS 2,Direction:0,IpAddress:192.168.0.11,PortNumber:779,DeviceLoginId:,DevicePassword:,Latitude:0,Longitude:0,ModelNumber:VMS 2,Manufacturer:VMS 2,Vendor:VMS 2,Remark:New Instal,PurchageDate:2021-07-31,ManufacturerDate:2021-07-31,WarrantyExpireDate:2021-07-31,GantryId:0,LaneNumber:0,Status:1', N'Insert', N'2', CAST(N'2021-07-02T12:59:31.440' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([EntryId], [UserId], [PrevColumn], [CurrentColumn], [Action], [EventId], [CreatedDate]) VALUES (29, 0, NULL, N'MessageId:1,MessageFormatId:1,FontFormat:Calibri,FontSize:13AlignmentId:1,Brightness:1,MessageLanguageId:2,MessageOrientationId:1MessageDuration:10,MessageBody:???? ??? ?? ????? ??????,MessagePriority:0,Status:1', N'Insert', N'9', CAST(N'2021-07-03T14:06:16.993' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([EntryId], [UserId], [PrevColumn], [CurrentColumn], [Action], [EventId], [CreatedDate]) VALUES (30, 0, NULL, N'MessageId:1,MessageFormatId:1,FontFormat:Calibri,FontSize:12AlignmentId:1,Brightness:0,MessageLanguageId:2,MessageOrientationId:1MessageDuration:10,MessageBody:???? ??? ?? ????? ??????,MessagePriority:0,Status:1', N'Insert', N'9', CAST(N'2021-07-03T14:10:05.537' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([EntryId], [UserId], [PrevColumn], [CurrentColumn], [Action], [EventId], [CreatedDate]) VALUES (31, 0, NULL, N'MessageId:2,MessageFormatId:2,FontFormat:Calibri,FontSize:0AlignmentId:0,Brightness:0,MessageLanguageId:0,MessageOrientationId:1MessageDuration:10,MessageBody:UNO3M-20210703145443889jpeg,MessagePriority:0,Status:1', N'Insert', N'9', CAST(N'2021-07-03T14:54:51.197' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([EntryId], [UserId], [PrevColumn], [CurrentColumn], [Action], [EventId], [CreatedDate]) VALUES (13, 0, NULL, N'LaneId:1,Number:1,Direction:1,Status:1,ControlRoomId:1,GantryId:1', N'Insert', N'5', CAST(N'2021-06-30T22:57:34.027' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([EntryId], [UserId], [PrevColumn], [CurrentColumn], [Action], [EventId], [CreatedDate]) VALUES (14, 0, N'LaneId:1,Number:1,Direction:1,Status:1,ControlRoomId:1,GantryId:1', N'LaneId:1,Number:1,Direction:2,Status:1,ControlRoomId:1,GantryId:1', N'Update', N'5', CAST(N'2021-06-30T22:59:19.127' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([EntryId], [UserId], [PrevColumn], [CurrentColumn], [Action], [EventId], [CreatedDate]) VALUES (15, 0, N'LaneId:1,Number:1,Direction:2,Status:1,ControlRoomId:1,GantryId:1', N'LaneId:1,Number:1,Direction:1,Status:1,ControlRoomId:1,GantryId:1', N'Update', N'5', CAST(N'2021-06-30T22:59:26.597' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([EntryId], [UserId], [PrevColumn], [CurrentColumn], [Action], [EventId], [CreatedDate]) VALUES (16, 0, NULL, N'ClassId:1,ClassName:LMV,ClassDescription:,VehicleSpeed:80,Status:1', N'Insert', N'6', CAST(N'2021-07-01T00:31:20.147' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([EntryId], [UserId], [PrevColumn], [CurrentColumn], [Action], [EventId], [CreatedDate]) VALUES (23, 0, NULL, N'RoleId:1,RoleName:Role,Status:1,ClientId:0,PlazaId:0', N'Insert', N'10', CAST(N'2021-07-01T23:15:05.810' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([EntryId], [UserId], [PrevColumn], [CurrentColumn], [Action], [EventId], [CreatedDate]) VALUES (32, 0, NULL, N'MessageId:3,MessageFormatId:2,FontFormat:Calibri,FontSize:0AlignmentId:0,Brightness:0,MessageLanguageId:0,MessageOrientationId:1MessageDuration:10,MessageBody:83ZEQ-20210703150025418.jpeg,MessagePriority:0,Status:1', N'Insert', N'9', CAST(N'2021-07-03T15:00:25.473' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([EntryId], [UserId], [PrevColumn], [CurrentColumn], [Action], [EventId], [CreatedDate]) VALUES (20, 0, NULL, N'DeviceId:2,ControlRoomId:1,CategoryId:1,DeviceTypeId:1,DeviceName:PTZ Camera,Direction:1,IpAddress:192.168.10.1,PortNumber:556,DeviceLoginId:admin,DevicePassword:admin,Latitude:0,Longitude:0,ModelNumber:PTZ Camera,Manufacturer:PTZ Camera,Vendor:PTZ Camera,Remark:New Instal,PurchageDate:2021-07-01,ManufacturerDate:2021-07-01,WarrantyExpireDate:2039-12-31,GantryId:1,LaneNumber:1,Status:1', N'Insert', N'2', CAST(N'2021-07-01T17:03:08.633' AS DateTime))
GO
INSERT [dbo].[tbl_ActivityLog] ([EntryId], [UserId], [PrevColumn], [CurrentColumn], [Action], [EventId], [CreatedDate]) VALUES (33, 0, N'DeviceId:4,ControlRoomId:1,CategoryId:1,DeviceTypeId:8,DeviceName:VMS 2,Direction:0,IpAddress:192.168.0.11,PortNumber:779,DeviceLoginId:,DevicePassword:,Latitude:0,Longitude:0,ModelNumber:VMS 2,Manufacturer:VMS 2,Vendor:VMS 2,Remark:New Instal,PurchageDate:2021-07-31,ManufacturerDate:2021-07-31,WarrantyExpireDate:2021-07-31,GantryId:0,LaneNumber:0,Status:1', N'DeviceId:4,ControlRoomId:1,CategoryId:1,DeviceTypeId:8,DeviceName:VMS 2,Direction:0,IpAddress:192.168.0.11,PortNumber:779,DeviceLoginId:,DevicePassword:,Latitude:0,Longitude:0,ModelNumber:VMS 2,Manufacturer:VMS 2,Vendor:VMS 2,Remark:New Instal,PurchageDate:2021-07-31,ManufacturerDate:2021-07-31,WarrantyExpireDate:2021-07-31,GantryId:0,LaneNumber:0,Status:1', N'Insert', N'2', CAST(N'2021-07-04T16:34:34.913' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[tbl_ActivityLog] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_CategoryMaster] ON 
GO
INSERT [dbo].[tbl_CategoryMaster] ([EntryId], [CategoryName], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (1, N'Field Equipment', 1, CAST(N'2021-06-29T09:42:30.397' AS DateTime), 0, CAST(N'2021-06-29T09:42:30.397' AS DateTime), 0)
GO
INSERT [dbo].[tbl_CategoryMaster] ([EntryId], [CategoryName], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (2, N'Control Room Equipment', 1, CAST(N'2021-06-29T09:42:30.403' AS DateTime), 0, CAST(N'2021-06-29T09:42:30.403' AS DateTime), 0)
GO
INSERT [dbo].[tbl_CategoryMaster] ([EntryId], [CategoryName], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (3, N'Network Infrastructure Equipment', 1, CAST(N'2021-06-29T09:42:30.403' AS DateTime), 0, CAST(N'2021-06-29T09:42:30.403' AS DateTime), 0)
GO
INSERT [dbo].[tbl_CategoryMaster] ([EntryId], [CategoryName], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (4, N'Power Equipment', 1, CAST(N'2021-06-29T09:42:30.403' AS DateTime), 0, CAST(N'2021-06-29T09:42:30.403' AS DateTime), 0)
GO
INSERT [dbo].[tbl_CategoryMaster] ([EntryId], [CategoryName], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (5, N'Other Assets', 1, CAST(N'2021-06-29T09:42:30.407' AS DateTime), 0, CAST(N'2021-06-29T09:42:30.407' AS DateTime), 0)
GO
SET IDENTITY_INSERT [dbo].[tbl_CategoryMaster] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_ConnectionType] ON 
GO
INSERT [dbo].[tbl_ConnectionType] ([EntryId], [ConnectionType], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (1, N'Network', 1, CAST(N'2021-07-04T16:16:00.233' AS DateTime), 0, CAST(N'2021-07-04T16:16:00.233' AS DateTime), 0)
GO
INSERT [dbo].[tbl_ConnectionType] ([EntryId], [ConnectionType], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (2, N'COM', 1, CAST(N'2021-07-04T16:16:00.530' AS DateTime), 0, CAST(N'2021-07-04T16:16:00.530' AS DateTime), 0)
GO
INSERT [dbo].[tbl_ConnectionType] ([EntryId], [ConnectionType], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (3, N'Other/None', 1, CAST(N'2021-07-04T16:16:00.790' AS DateTime), 0, CAST(N'2021-07-04T16:16:00.790' AS DateTime), 0)
GO
SET IDENTITY_INSERT [dbo].[tbl_ConnectionType] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_ControlRoomMaster] ON 
GO
INSERT [dbo].[tbl_ControlRoomMaster] ([EntryId], [ControlRoomName], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (1, N'Package 01', 1, CAST(N'2021-06-28T17:48:35.397' AS DateTime), 0, CAST(N'2021-06-28T17:51:27.060' AS DateTime), 0)
GO
SET IDENTITY_INSERT [dbo].[tbl_ControlRoomMaster] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_DeviceDetails] ON 
GO
INSERT [dbo].[tbl_DeviceDetails] ([EntryId], [ControlRoomId], [CategoryId], [DeviceTypeId], [DeviceName], [ConnectionTypeId], [Direction], [IpAddress], [PortNumber], [DeviceLoginId], [DevicePassword], [Latitude], [Longitude], [ModelNumber], [Manufacturer], [Vendor], [Remark], [PurchageDate], [ManufacturerDate], [WarrantyExpireDate], [GantryId], [LaneNumber], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (1, 1, 1, 1, N'KM 100', 1, 1, N'192.168.1.1', 556, N'admin', N'admin@123', N'0', N'0', N'MK101', N'Hikvision', NULL, N'Test', NULL, NULL, CAST(N'2039-12-31' AS Date), NULL, NULL, 0, 1, CAST(N'2021-06-30T01:20:47.250' AS DateTime), 0, CAST(N'2021-07-01T17:26:59.890' AS DateTime), 0)
GO
INSERT [dbo].[tbl_DeviceDetails] ([EntryId], [ControlRoomId], [CategoryId], [DeviceTypeId], [DeviceName], [ConnectionTypeId], [Direction], [IpAddress], [PortNumber], [DeviceLoginId], [DevicePassword], [Latitude], [Longitude], [ModelNumber], [Manufacturer], [Vendor], [Remark], [PurchageDate], [ManufacturerDate], [WarrantyExpireDate], [GantryId], [LaneNumber], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (2, 1, 1, 1, N'PTZ Camera1', 1, 1, N'192.168.10.1', 556, N'admin1', N'admin1', N'0', N'0', N'PTZ Camera0', N'PTZ Camera1', N'PTZ Camera', N'New Instal1', CAST(N'2021-07-01' AS Date), CAST(N'2021-07-01' AS Date), CAST(N'2039-12-31' AS Date), 1, 1, 0, 1, CAST(N'2021-07-01T17:03:08.633' AS DateTime), 0, CAST(N'2021-07-01T17:26:22.990' AS DateTime), 0)
GO
INSERT [dbo].[tbl_DeviceDetails] ([EntryId], [ControlRoomId], [CategoryId], [DeviceTypeId], [DeviceName], [ConnectionTypeId], [Direction], [IpAddress], [PortNumber], [DeviceLoginId], [DevicePassword], [Latitude], [Longitude], [ModelNumber], [Manufacturer], [Vendor], [Remark], [PurchageDate], [ManufacturerDate], [WarrantyExpireDate], [GantryId], [LaneNumber], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (3, 1, 1, 8, N'VMS-1', 1, 0, N'192.168.1.10', 779, N'', N'', N'0', N'0', N'Photon', N'Photon', N'Plus', N'New VMS ', CAST(N'2021-07-01' AS Date), CAST(N'2021-07-01' AS Date), CAST(N'2021-07-31' AS Date), 0, 0, 0, 1, CAST(N'2021-07-02T00:25:44.017' AS DateTime), 0, CAST(N'2021-07-02T00:25:44.023' AS DateTime), 0)
GO
INSERT [dbo].[tbl_DeviceDetails] ([EntryId], [ControlRoomId], [CategoryId], [DeviceTypeId], [DeviceName], [ConnectionTypeId], [Direction], [IpAddress], [PortNumber], [DeviceLoginId], [DevicePassword], [Latitude], [Longitude], [ModelNumber], [Manufacturer], [Vendor], [Remark], [PurchageDate], [ManufacturerDate], [WarrantyExpireDate], [GantryId], [LaneNumber], [OnLineStatus], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (4, 1, 1, 8, N'VMS 2', 1, 0, N'192.168.0.11', 779, N'', N'', N'0', N'0', N'VMS 2', N'VMS 2', N'VMS 2', N'New Instal', CAST(N'2021-07-31' AS Date), CAST(N'2021-07-31' AS Date), CAST(N'2021-07-31' AS Date), 0, 0, 0, 1, CAST(N'2021-07-02T12:59:31.440' AS DateTime), 0, CAST(N'2021-07-04T16:34:34.913' AS DateTime), 0)
GO
SET IDENTITY_INSERT [dbo].[tbl_DeviceDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_DeviceTypeMaster] ON 
GO
INSERT [dbo].[tbl_DeviceTypeMaster] ([EntryId], [DeviceTypeName], [CategoryId], [IconName], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (1, N'CCTV', 1, N'CCTV.svg', 1, CAST(N'2021-06-29T09:51:49.177' AS DateTime), 0, CAST(N'2021-06-29T09:51:49.177' AS DateTime), 0)
GO
INSERT [dbo].[tbl_DeviceTypeMaster] ([EntryId], [DeviceTypeName], [CategoryId], [IconName], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (2, N'ECB', 1, N'ECB.svg', 1, CAST(N'2021-06-29T09:51:49.183' AS DateTime), 0, CAST(N'2021-06-29T09:51:49.183' AS DateTime), 0)
GO
INSERT [dbo].[tbl_DeviceTypeMaster] ([EntryId], [DeviceTypeName], [CategoryId], [IconName], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (3, N'ATCC Camera', 1, N'ATCC.svg', 1, CAST(N'2021-06-29T09:51:49.183' AS DateTime), 0, CAST(N'2021-06-29T09:51:49.183' AS DateTime), 0)
GO
INSERT [dbo].[tbl_DeviceTypeMaster] ([EntryId], [DeviceTypeName], [CategoryId], [IconName], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (4, N'ATCC Sensor', 1, N'ATCC.svg', 1, CAST(N'2021-06-29T09:51:49.183' AS DateTime), 0, CAST(N'2021-06-29T09:51:49.183' AS DateTime), 0)
GO
INSERT [dbo].[tbl_DeviceTypeMaster] ([EntryId], [DeviceTypeName], [CategoryId], [IconName], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (5, N'ANPR Camera', 1, N'ANPR.svg', 1, CAST(N'2021-06-29T09:51:49.187' AS DateTime), 0, CAST(N'2021-06-29T09:51:49.187' AS DateTime), 0)
GO
INSERT [dbo].[tbl_DeviceTypeMaster] ([EntryId], [DeviceTypeName], [CategoryId], [IconName], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (6, N'Radar', 1, N'radar.svg', 1, CAST(N'2021-06-29T09:51:49.187' AS DateTime), 0, CAST(N'2021-06-29T09:51:49.187' AS DateTime), 0)
GO
INSERT [dbo].[tbl_DeviceTypeMaster] ([EntryId], [DeviceTypeName], [CategoryId], [IconName], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (7, N'VIDS Camera', 1, N'VIDS.svg', 1, CAST(N'2021-06-29T09:51:49.190' AS DateTime), 0, CAST(N'2021-06-29T09:51:49.190' AS DateTime), 0)
GO
INSERT [dbo].[tbl_DeviceTypeMaster] ([EntryId], [DeviceTypeName], [CategoryId], [IconName], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (8, N'VMS Display', 1, N'VMS.svg', 1, CAST(N'2021-06-29T09:51:49.193' AS DateTime), 0, CAST(N'2021-06-29T09:51:49.193' AS DateTime), 0)
GO
INSERT [dbo].[tbl_DeviceTypeMaster] ([EntryId], [DeviceTypeName], [CategoryId], [IconName], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (9, N'MET', 1, NULL, 1, CAST(N'2021-06-29T09:51:49.197' AS DateTime), 0, CAST(N'2021-06-29T09:51:49.197' AS DateTime), 0)
GO
INSERT [dbo].[tbl_DeviceTypeMaster] ([EntryId], [DeviceTypeName], [CategoryId], [IconName], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (10, N'Video Wall', 2, N'movie.svg', 1, CAST(N'2021-06-29T09:51:49.210' AS DateTime), 0, CAST(N'2021-06-29T09:51:49.210' AS DateTime), 0)
GO
INSERT [dbo].[tbl_DeviceTypeMaster] ([EntryId], [DeviceTypeName], [CategoryId], [IconName], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (11, N'Server', 2, N'server.svg', 1, CAST(N'2021-06-29T09:51:49.200' AS DateTime), 0, CAST(N'2021-06-29T09:51:49.200' AS DateTime), 0)
GO
INSERT [dbo].[tbl_DeviceTypeMaster] ([EntryId], [DeviceTypeName], [CategoryId], [IconName], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (12, N'Data Storage', 2, N'storage.svg', 1, CAST(N'2021-06-29T09:51:49.210' AS DateTime), 0, CAST(N'2021-06-29T09:51:49.210' AS DateTime), 0)
GO
INSERT [dbo].[tbl_DeviceTypeMaster] ([EntryId], [DeviceTypeName], [CategoryId], [IconName], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (13, N'Joy Stick', 2, NULL, 1, CAST(N'2021-06-29T09:51:49.213' AS DateTime), 0, CAST(N'2021-06-29T09:51:49.213' AS DateTime), 0)
GO
INSERT [dbo].[tbl_DeviceTypeMaster] ([EntryId], [DeviceTypeName], [CategoryId], [IconName], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (14, N'Network Switch', 3, NULL, 1, CAST(N'2021-06-29T09:51:49.203' AS DateTime), 0, CAST(N'2021-06-29T09:51:49.203' AS DateTime), 0)
GO
INSERT [dbo].[tbl_DeviceTypeMaster] ([EntryId], [DeviceTypeName], [CategoryId], [IconName], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (15, N'Firewall', 3, NULL, 1, CAST(N'2021-06-29T09:51:49.217' AS DateTime), 0, CAST(N'2021-06-29T09:51:49.217' AS DateTime), 0)
GO
INSERT [dbo].[tbl_DeviceTypeMaster] ([EntryId], [DeviceTypeName], [CategoryId], [IconName], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (15, N'UPS', 4, NULL, 1, CAST(N'2021-06-29T09:51:49.213' AS DateTime), 0, CAST(N'2021-06-29T09:51:49.213' AS DateTime), 0)
GO
INSERT [dbo].[tbl_DeviceTypeMaster] ([EntryId], [DeviceTypeName], [CategoryId], [IconName], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (16, N'Other', 5, NULL, 1, CAST(N'2021-06-29T09:51:49.213' AS DateTime), 0, CAST(N'2021-06-29T09:51:49.213' AS DateTime), 0)
GO
INSERT [dbo].[tbl_DeviceTypeMaster] ([EntryId], [DeviceTypeName], [CategoryId], [IconName], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (17, N'Speed Display', 1, NULL, 1, CAST(N'2021-07-01T15:57:42.590' AS DateTime), 0, CAST(N'2021-07-01T15:57:42.590' AS DateTime), 0)
GO
INSERT [dbo].[tbl_DeviceTypeMaster] ([EntryId], [DeviceTypeName], [CategoryId], [IconName], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (18, N'RFID Reader', 1, NULL, 1, CAST(N'2021-07-01T15:57:49.880' AS DateTime), 0, CAST(N'2021-07-01T15:57:49.880' AS DateTime), 0)
GO
INSERT [dbo].[tbl_DeviceTypeMaster] ([EntryId], [DeviceTypeName], [CategoryId], [IconName], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (19, N'NVR', 2, NULL, 1, CAST(N'2021-07-01T15:59:31.043' AS DateTime), 0, CAST(N'2021-07-01T15:59:31.043' AS DateTime), 0)
GO
INSERT [dbo].[tbl_DeviceTypeMaster] ([EntryId], [DeviceTypeName], [CategoryId], [IconName], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (20, N'ECB Console', 2, NULL, 1, CAST(N'2021-07-01T16:00:31.870' AS DateTime), 0, CAST(N'2021-07-01T16:00:31.870' AS DateTime), 0)
GO
SET IDENTITY_INSERT [dbo].[tbl_DeviceTypeMaster] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_EventsTypeMaster] ON 
GO
INSERT [dbo].[tbl_EventsTypeMaster] ([EntryId], [EventTypeName], [DeviceTypeId], [MappingId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (1, N'Stop Vehicle', 7, 0, 1, CAST(N'2021-07-07T11:24:39.433' AS DateTime), 0, CAST(N'2021-07-07T11:24:39.433' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EventsTypeMaster] ([EntryId], [EventTypeName], [DeviceTypeId], [MappingId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (2, N'Reverse Direction', 7, 0, 1, CAST(N'2021-07-07T11:24:39.433' AS DateTime), 0, CAST(N'2021-07-07T11:24:39.433' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EventsTypeMaster] ([EntryId], [EventTypeName], [DeviceTypeId], [MappingId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (3, N'Wrong Direction', 7, 0, 1, CAST(N'2021-07-07T11:24:39.433' AS DateTime), 0, CAST(N'2021-07-07T11:24:39.433' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EventsTypeMaster] ([EntryId], [EventTypeName], [DeviceTypeId], [MappingId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (4, N'Acceleration', 7, 0, 1, CAST(N'2021-07-07T11:24:39.433' AS DateTime), 0, CAST(N'2021-07-07T11:24:39.433' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EventsTypeMaster] ([EntryId], [EventTypeName], [DeviceTypeId], [MappingId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (5, N'Deacceleration', 7, 0, 1, CAST(N'2021-07-07T11:24:39.433' AS DateTime), 0, CAST(N'2021-07-07T11:24:39.433' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EventsTypeMaster] ([EntryId], [EventTypeName], [DeviceTypeId], [MappingId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (6, N'Fog/smoke', 7, 0, 1, CAST(N'2021-07-07T11:24:39.433' AS DateTime), 0, CAST(N'2021-07-07T11:24:39.433' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EventsTypeMaster] ([EntryId], [EventTypeName], [DeviceTypeId], [MappingId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (7, N'Fire', 7, 0, 1, CAST(N'2021-07-07T11:24:39.433' AS DateTime), 0, CAST(N'2021-07-07T11:24:39.433' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EventsTypeMaster] ([EntryId], [EventTypeName], [DeviceTypeId], [MappingId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (8, N'Fallen Object', 7, 0, 1, CAST(N'2021-07-07T11:24:39.433' AS DateTime), 0, CAST(N'2021-07-07T11:24:39.433' AS DateTime), 0)
GO
INSERT [dbo].[tbl_EventsTypeMaster] ([EntryId], [EventTypeName], [DeviceTypeId], [MappingId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (9, N'Cattle', 7, 0, 1, CAST(N'2021-07-07T11:24:39.433' AS DateTime), 0, CAST(N'2021-07-07T11:24:39.433' AS DateTime), 0)
GO
SET IDENTITY_INSERT [dbo].[tbl_EventsTypeMaster] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_GantryConfiguration] ON 
GO
INSERT [dbo].[tbl_GantryConfiguration] ([EntryId], [ControlRoomId], [GantryName], [Latitude], [Longitude], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (1, 1, N'Gantry 1', N'0', N'0', 1, CAST(N'2021-06-30T02:25:34.257' AS DateTime), 0, CAST(N'2021-06-30T02:28:45.737' AS DateTime), 0)
GO
INSERT [dbo].[tbl_GantryConfiguration] ([EntryId], [ControlRoomId], [GantryName], [Latitude], [Longitude], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (2, 1, N'Gantry 2', N'0.2', N'0.1', 1, CAST(N'2021-06-30T10:39:49.560' AS DateTime), 0, CAST(N'2021-06-30T10:39:49.560' AS DateTime), 0)
GO
SET IDENTITY_INSERT [dbo].[tbl_GantryConfiguration] OFF
GO
INSERT [dbo].[tbl_GantryMapping] ([EntryGantryId], [ExitGantryId], [GantryDistance], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (1, 2, CAST(5.000 AS Decimal(18, 3)), 1, CAST(N'2021-06-30T10:40:27.107' AS DateTime), 0, CAST(N'2021-06-30T10:40:50.983' AS DateTime), 0)
GO
INSERT [dbo].[tbl_GantryMapping] ([EntryGantryId], [ExitGantryId], [GantryDistance], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (2, 1, CAST(7.000 AS Decimal(18, 3)), 1, CAST(N'2021-06-30T10:40:38.843' AS DateTime), 0, CAST(N'2021-06-30T10:41:05.833' AS DateTime), 0)
GO
SET IDENTITY_INSERT [dbo].[tbl_LaneConfiguration] ON 
GO
INSERT [dbo].[tbl_LaneConfiguration] ([EntryId], [ControlRoomId], [GantryId], [LaneNumber], [LaneDirection], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (1, 1, 1, 1, 1, 1, CAST(N'2021-06-30T22:57:34.027' AS DateTime), 0, CAST(N'2021-06-30T22:59:26.597' AS DateTime), 0)
GO
SET IDENTITY_INSERT [dbo].[tbl_LaneConfiguration] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_LogingActivity] ON 
GO
INSERT [dbo].[tbl_LogingActivity] ([EntryId], [LoginId], [PlazaId], [LaneNumber], [LoginStatus], [LaneTransId], [CreatedDate]) VALUES (1, N'transit360', 0, 0, 1, 0, CAST(N'2021-06-26T13:26:28.347' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([EntryId], [LoginId], [PlazaId], [LaneNumber], [LoginStatus], [LaneTransId], [CreatedDate]) VALUES (2, N'transit360', 0, 0, 1, 0, CAST(N'2021-06-26T13:31:57.177' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([EntryId], [LoginId], [PlazaId], [LaneNumber], [LoginStatus], [LaneTransId], [CreatedDate]) VALUES (3, N'transit360', 0, 0, 1, 0, CAST(N'2021-06-26T14:28:51.623' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([EntryId], [LoginId], [PlazaId], [LaneNumber], [LoginStatus], [LaneTransId], [CreatedDate]) VALUES (4, N'transit360', 0, 0, 1, 0, CAST(N'2021-06-26T14:47:42.760' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([EntryId], [LoginId], [PlazaId], [LaneNumber], [LoginStatus], [LaneTransId], [CreatedDate]) VALUES (5, N'transit360', 0, 0, 1, 0, CAST(N'2021-06-26T23:11:27.170' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([EntryId], [LoginId], [PlazaId], [LaneNumber], [LoginStatus], [LaneTransId], [CreatedDate]) VALUES (6, N'transit360', 0, 0, 1, 0, CAST(N'2021-06-27T14:21:40.693' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([EntryId], [LoginId], [PlazaId], [LaneNumber], [LoginStatus], [LaneTransId], [CreatedDate]) VALUES (7, N'transit360', 0, 0, 1, 0, CAST(N'2021-06-27T14:28:32.103' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([EntryId], [LoginId], [PlazaId], [LaneNumber], [LoginStatus], [LaneTransId], [CreatedDate]) VALUES (10006, N'transit360', 0, 0, 1, 0, CAST(N'2021-06-28T16:41:45.847' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([EntryId], [LoginId], [PlazaId], [LaneNumber], [LoginStatus], [LaneTransId], [CreatedDate]) VALUES (10007, N'transit360', 0, 0, 1, 0, CAST(N'2021-06-29T09:33:49.383' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([EntryId], [LoginId], [PlazaId], [LaneNumber], [LoginStatus], [LaneTransId], [CreatedDate]) VALUES (10008, N'transit360', 0, 0, 1, 0, CAST(N'2021-06-30T10:14:31.927' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([EntryId], [LoginId], [PlazaId], [LaneNumber], [LoginStatus], [LaneTransId], [CreatedDate]) VALUES (10015, N'transit360', 0, 0, 1, 0, CAST(N'2021-07-02T00:44:22.267' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([EntryId], [LoginId], [PlazaId], [LaneNumber], [LoginStatus], [LaneTransId], [CreatedDate]) VALUES (10016, N'transit360', 0, 0, 1, 0, CAST(N'2021-07-02T10:21:37.120' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([EntryId], [LoginId], [PlazaId], [LaneNumber], [LoginStatus], [LaneTransId], [CreatedDate]) VALUES (10017, N'transit360', 0, 0, 1, 0, CAST(N'2021-07-02T17:03:43.620' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([EntryId], [LoginId], [PlazaId], [LaneNumber], [LoginStatus], [LaneTransId], [CreatedDate]) VALUES (10018, N'transit360', 0, 0, 1, 0, CAST(N'2021-07-02T18:16:09.190' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([EntryId], [LoginId], [PlazaId], [LaneNumber], [LoginStatus], [LaneTransId], [CreatedDate]) VALUES (10009, N'transit360', 0, 0, 1, 0, CAST(N'2021-06-30T23:25:58.353' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([EntryId], [LoginId], [PlazaId], [LaneNumber], [LoginStatus], [LaneTransId], [CreatedDate]) VALUES (10010, N'transit360', 0, 0, 1, 0, CAST(N'2021-07-01T14:45:35.773' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([EntryId], [LoginId], [PlazaId], [LaneNumber], [LoginStatus], [LaneTransId], [CreatedDate]) VALUES (10011, N'transit360', 0, 0, 2, 0, CAST(N'2021-07-01T14:45:42.053' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([EntryId], [LoginId], [PlazaId], [LaneNumber], [LoginStatus], [LaneTransId], [CreatedDate]) VALUES (10012, N'transit360', 0, 0, 1, 0, CAST(N'2021-07-01T14:45:54.713' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([EntryId], [LoginId], [PlazaId], [LaneNumber], [LoginStatus], [LaneTransId], [CreatedDate]) VALUES (10013, N'transit360', 0, 0, 1, 0, CAST(N'2021-07-01T18:01:52.090' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([EntryId], [LoginId], [PlazaId], [LaneNumber], [LoginStatus], [LaneTransId], [CreatedDate]) VALUES (10014, N'transit360', 0, 0, 1, 0, CAST(N'2021-07-01T22:54:54.443' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([EntryId], [LoginId], [PlazaId], [LaneNumber], [LoginStatus], [LaneTransId], [CreatedDate]) VALUES (10019, N'transit360', 0, 0, 1, 0, CAST(N'2021-07-04T13:28:57.217' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([EntryId], [LoginId], [PlazaId], [LaneNumber], [LoginStatus], [LaneTransId], [CreatedDate]) VALUES (10020, N'transit360', 0, 0, 1, 0, CAST(N'2021-07-06T11:37:20.657' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([EntryId], [LoginId], [PlazaId], [LaneNumber], [LoginStatus], [LaneTransId], [CreatedDate]) VALUES (10021, N'transit360', 0, 0, 1, 0, CAST(N'2021-07-07T13:05:35.413' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([EntryId], [LoginId], [PlazaId], [LaneNumber], [LoginStatus], [LaneTransId], [CreatedDate]) VALUES (10022, N'transit360', 0, 0, 1, 0, CAST(N'2021-07-07T13:11:23.430' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([EntryId], [LoginId], [PlazaId], [LaneNumber], [LoginStatus], [LaneTransId], [CreatedDate]) VALUES (10023, N'transit360', 0, 0, 1, 0, CAST(N'2021-07-07T13:11:26.307' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([EntryId], [LoginId], [PlazaId], [LaneNumber], [LoginStatus], [LaneTransId], [CreatedDate]) VALUES (10026, N'transit360', 0, 0, 1, 0, CAST(N'2021-07-08T11:02:48.197' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([EntryId], [LoginId], [PlazaId], [LaneNumber], [LoginStatus], [LaneTransId], [CreatedDate]) VALUES (10024, N'transit360', 0, 0, 1, 0, CAST(N'2021-07-07T13:11:30.347' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([EntryId], [LoginId], [PlazaId], [LaneNumber], [LoginStatus], [LaneTransId], [CreatedDate]) VALUES (10025, N'transit360', 0, 0, 1, 0, CAST(N'2021-07-07T13:13:47.977' AS DateTime))
GO
INSERT [dbo].[tbl_LogingActivity] ([EntryId], [LoginId], [PlazaId], [LaneNumber], [LoginStatus], [LaneTransId], [CreatedDate]) VALUES (10027, N'transit360', 0, 0, 1, 0, CAST(N'2021-07-08T14:14:18.370' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[tbl_LogingActivity] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_MenuMaster] ON 
GO
INSERT [dbo].[tbl_MenuMaster] ([EntryId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [EventId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (1, N'Dashboard', N'dashboard', N'fa fa-tachometer', 1, 1, 0, 0, 1, CAST(N'2021-06-26T13:27:17.443' AS DateTime), 0, CAST(N'2021-06-26T13:27:17.443' AS DateTime), 0)
GO
INSERT [dbo].[tbl_MenuMaster] ([EntryId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [EventId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (2, N'Config', N'#', N'fa fa-cog', 1, 2, 0, -1, 1, CAST(N'2021-07-08T11:17:45.390' AS DateTime), 0, CAST(N'2021-07-08T11:17:45.390' AS DateTime), 0)
GO
INSERT [dbo].[tbl_MenuMaster] ([EntryId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [EventId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (3, N'Control Room', N'controlRoom', N'fa fa-compass', 1, 3, 2, 1, 1, CAST(N'2021-06-26T13:47:24.660' AS DateTime), 0, CAST(N'2021-06-26T13:47:24.660' AS DateTime), 0)
GO
INSERT [dbo].[tbl_MenuMaster] ([EntryId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [EventId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (4, N'Devices', N'devices', N'fa fa-keyboard-o', 1, 4, 2, 2, 1, CAST(N'2021-06-26T13:47:24.660' AS DateTime), 0, CAST(N'2021-06-26T13:47:24.660' AS DateTime), 0)
GO
INSERT [dbo].[tbl_MenuMaster] ([EntryId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [EventId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (5, N'Ganrty', N'gantry', N'pi pi-th-large', 1, 5, 2, 3, 1, CAST(N'2021-06-30T01:35:45.070' AS DateTime), 0, CAST(N'2021-06-30T01:35:45.070' AS DateTime), 0)
GO
INSERT [dbo].[tbl_MenuMaster] ([EntryId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [EventId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (6, N'Ganrty Mapping', N'gantryMapping', N'pi pi-sitemap', 1, 6, 2, 4, 1, CAST(N'2021-06-30T10:13:50.700' AS DateTime), 0, CAST(N'2021-06-30T10:13:50.700' AS DateTime), 0)
GO
INSERT [dbo].[tbl_MenuMaster] ([EntryId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [EventId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (7, N'Lane', N'lane', N'fa fa-road', 1, 7, 2, 5, 1, CAST(N'2021-06-30T12:40:36.387' AS DateTime), 0, CAST(N'2021-06-30T12:40:36.387' AS DateTime), 0)
GO
INSERT [dbo].[tbl_MenuMaster] ([EntryId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [EventId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (8, N'Vehicle Class', N'vehicleClass', N'fa fa-taxi', 1, 8, 2, 6, 1, CAST(N'2021-06-30T23:01:22.760' AS DateTime), 0, CAST(N'2021-06-30T23:01:22.760' AS DateTime), 0)
GO
INSERT [dbo].[tbl_MenuMaster] ([EntryId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [EventId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (9, N'Roles', N'role', N'pi pi-lock', 1, 9, 2, 7, 1, CAST(N'2021-07-01T17:59:14.647' AS DateTime), 0, CAST(N'2021-07-01T17:59:14.647' AS DateTime), 0)
GO
INSERT [dbo].[tbl_MenuMaster] ([EntryId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [EventId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (10, N'Users', N'users', N'pi pi-users', 1, 10, 2, 8, 1, CAST(N'2021-07-01T17:59:32.610' AS DateTime), 0, CAST(N'2021-07-01T17:59:32.610' AS DateTime), 0)
GO
INSERT [dbo].[tbl_MenuMaster] ([EntryId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [EventId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (11, N'Data Acquisition', N'#', N'fa fa-database', 1, 11, 0, -1, 1, CAST(N'2021-07-08T11:17:49.470' AS DateTime), 0, CAST(N'2021-07-08T11:17:49.470' AS DateTime), 0)
GO
INSERT [dbo].[tbl_MenuMaster] ([EntryId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [EventId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (12, N'ADAS', N'adas', N'fa fa-tablet', 1, 12, 11, 9, 0, CAST(N'2021-07-08T11:05:53.747' AS DateTime), 0, CAST(N'2021-07-08T11:05:53.747' AS DateTime), 0)
GO
INSERT [dbo].[tbl_MenuMaster] ([EntryId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [EventId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (13, N'ATCC', N'atcc', N'fa fa-car', 1, 13, 11, 10, 1, CAST(N'2021-07-04T16:37:17.857' AS DateTime), 0, CAST(N'2021-07-04T16:37:17.857' AS DateTime), 0)
GO
INSERT [dbo].[tbl_MenuMaster] ([EntryId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [EventId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (14, N'ATSC', N'atsc', N'fa fa-lightbulb-o', 1, 14, 11, 11, 0, CAST(N'2021-07-08T11:08:10.570' AS DateTime), 0, CAST(N'2021-07-08T11:08:10.570' AS DateTime), 0)
GO
INSERT [dbo].[tbl_MenuMaster] ([EntryId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [EventId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (15, N'ECB', N'ecb', N'fa fa-phone-square', 1, 15, 11, 12, 1, CAST(N'2021-07-03T15:41:28.533' AS DateTime), 0, CAST(N'2021-07-03T15:41:28.533' AS DateTime), 0)
GO
INSERT [dbo].[tbl_MenuMaster] ([EntryId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [EventId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (16, N'MET', N'met', N'fa fa-cloud', 1, 16, 11, 13, 1, CAST(N'2021-07-02T17:00:07.010' AS DateTime), 0, CAST(N'2021-07-02T17:00:07.010' AS DateTime), 0)
GO
INSERT [dbo].[tbl_MenuMaster] ([EntryId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [EventId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (17, N'TMCS', N'tmcs', N'fa fa-camera', 1, 17, 11, 14, 0, CAST(N'2021-07-08T11:05:45.300' AS DateTime), 0, CAST(N'2021-07-08T11:05:45.300' AS DateTime), 0)
GO
INSERT [dbo].[tbl_MenuMaster] ([EntryId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [EventId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (18, N'VMS', N'vms', N'fa fa-list-alt', 1, 18, 11, 15, 1, CAST(N'2021-07-01T23:29:39.947' AS DateTime), 0, CAST(N'2021-07-01T23:29:39.947' AS DateTime), 0)
GO
INSERT [dbo].[tbl_MenuMaster] ([EntryId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [EventId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (19, N'VIDS', N'vids', N'fa fa-video-camera', 1, 19, 11, 16, 1, CAST(N'2021-07-04T15:45:39.013' AS DateTime), 0, CAST(N'2021-07-04T15:45:39.013' AS DateTime), 0)
GO
INSERT [dbo].[tbl_MenuMaster] ([EntryId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [EventId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (20, N'VSDS', N'vsds', N'fa fa-wifi', 1, 20, 11, 17, 1, CAST(N'2021-07-08T11:05:09.717' AS DateTime), 0, CAST(N'2021-07-08T11:05:09.717' AS DateTime), 0)
GO
INSERT [dbo].[tbl_MenuMaster] ([EntryId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [EventId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (21, N'SSVDS', N'ssvds', N'pi pi-video', 1, 21, 11, 18, 1, CAST(N'2021-07-08T11:09:00.770' AS DateTime), 0, CAST(N'2021-07-08T11:09:00.770' AS DateTime), 0)
GO
INSERT [dbo].[tbl_MenuMaster] ([EntryId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [EventId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (22, N'Incident', N'incidents', N'fa fa-bug', 1, 22, 11, 19, 1, CAST(N'2021-07-08T11:06:01.840' AS DateTime), 0, CAST(N'2021-07-08T11:06:01.840' AS DateTime), 0)
GO
INSERT [dbo].[tbl_MenuMaster] ([EntryId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [EventId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (23, N'FMS', N'fms', N'fa fa-battery-quarter', 1, 23, 0, 20, 1, CAST(N'2021-07-08T11:17:49.470' AS DateTime), 0, CAST(N'2021-07-08T11:17:49.470' AS DateTime), 0)
GO
INSERT [dbo].[tbl_MenuMaster] ([EntryId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [EventId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (24, N'Reporting', N'reports', N'fa fa-file', NULL, 24, 0, 21, 1, CAST(N'2021-07-08T16:50:02.003' AS DateTime), 0, CAST(N'2021-07-08T16:50:02.003' AS DateTime), 0)
GO
SET IDENTITY_INSERT [dbo].[tbl_MenuMaster] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_METConfiguration] ON 
GO
INSERT [dbo].[tbl_METConfiguration] ([EntryId], [AirTemperatureMin], [AirTemperatureMax], [HumidityRH], [HumidityAH], [Visibility], [RoadTemperature], [WindDirectionValue], [WindSpeedValue], [RainValue], [SynchronizeTime], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (1, CAST(20.00 AS Decimal(6, 2)), CAST(60.00 AS Decimal(6, 2)), CAST(80.00 AS Decimal(6, 2)), CAST(90.00 AS Decimal(6, 2)), CAST(100.00 AS Decimal(8, 2)), CAST(70.00 AS Decimal(6, 2)), CAST(100.00 AS Decimal(6, 2)), CAST(90.00 AS Decimal(6, 2)), CAST(60.00 AS Decimal(6, 2)), 5, 1, CAST(N'2021-07-03T11:00:05.690' AS DateTime), 0, CAST(N'2021-07-03T11:00:05.690' AS DateTime), 0)
GO
SET IDENTITY_INSERT [dbo].[tbl_METConfiguration] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_PermissionMaster] ON 
GO
INSERT [dbo].[tbl_PermissionMaster] ([EntryId], [ClientId], [EventName], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (1, 0, N'Control Room', 1, 1, 1, 1, CAST(N'2021-06-28T17:42:39.730' AS DateTime), 0, CAST(N'2021-06-28T17:42:39.730' AS DateTime), 0)
GO
INSERT [dbo].[tbl_PermissionMaster] ([EntryId], [ClientId], [EventName], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (2, 0, N'Devices', 1, 1, 1, 1, CAST(N'2021-06-28T17:42:39.730' AS DateTime), 0, CAST(N'2021-06-28T17:42:39.730' AS DateTime), 0)
GO
INSERT [dbo].[tbl_PermissionMaster] ([EntryId], [ClientId], [EventName], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (3, 0, N'Ganrty', 1, 1, 1, 1, CAST(N'2021-06-30T01:39:12.933' AS DateTime), 0, CAST(N'2021-06-30T01:39:12.933' AS DateTime), 0)
GO
INSERT [dbo].[tbl_PermissionMaster] ([EntryId], [ClientId], [EventName], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (4, 0, N'Ganrty Mapping', 1, 1, 1, 1, CAST(N'2021-06-30T22:42:47.367' AS DateTime), 0, CAST(N'2021-06-30T22:42:47.367' AS DateTime), 0)
GO
INSERT [dbo].[tbl_PermissionMaster] ([EntryId], [ClientId], [EventName], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (5, 0, N'Lane', 1, 1, 1, 1, CAST(N'2021-06-30T22:43:58.307' AS DateTime), 0, CAST(N'2021-06-30T22:43:58.307' AS DateTime), 0)
GO
INSERT [dbo].[tbl_PermissionMaster] ([EntryId], [ClientId], [EventName], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (6, 0, N'Vehicle Class', 1, 1, 1, 1, CAST(N'2021-06-30T23:02:08.107' AS DateTime), 0, CAST(N'2021-06-30T23:02:08.107' AS DateTime), 0)
GO
INSERT [dbo].[tbl_PermissionMaster] ([EntryId], [ClientId], [EventName], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (10, 0, N'Automatic Traffic Counter & Classifier (ATCC)', 1, 2, 1, 1, CAST(N'2021-07-02T17:00:40.153' AS DateTime), 0, CAST(N'2021-07-02T17:00:40.153' AS DateTime), 0)
GO
INSERT [dbo].[tbl_PermissionMaster] ([EntryId], [ClientId], [EventName], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (11, 0, N'Adaptive Traffic Signal Control System (ATSC)', 1, 1, 1, 1, CAST(N'2021-07-03T15:40:36.047' AS DateTime), 0, CAST(N'2021-07-03T15:40:36.047' AS DateTime), 0)
GO
INSERT [dbo].[tbl_PermissionMaster] ([EntryId], [ClientId], [EventName], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (7, 0, N'Roles', 1, 1, 1, 1, CAST(N'2021-07-01T17:58:31.927' AS DateTime), 0, CAST(N'2021-07-01T17:58:31.927' AS DateTime), 0)
GO
INSERT [dbo].[tbl_PermissionMaster] ([EntryId], [ClientId], [EventName], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (8, 0, N'Users', 1, 1, 1, 1, CAST(N'2021-07-01T17:58:36.467' AS DateTime), 0, CAST(N'2021-07-01T17:58:36.467' AS DateTime), 0)
GO
INSERT [dbo].[tbl_PermissionMaster] ([EntryId], [ClientId], [EventName], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (9, 0, N'Advance Driver Advisory System (ADAS)', 1, 1, 1, 1, CAST(N'2021-07-01T23:30:51.490' AS DateTime), 0, CAST(N'2021-07-01T23:30:51.490' AS DateTime), 0)
GO
INSERT [dbo].[tbl_PermissionMaster] ([EntryId], [ClientId], [EventName], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (12, 0, N'Emergency Call', 1, 2, 2, 1, CAST(N'2021-07-08T11:04:04.510' AS DateTime), 0, CAST(N'2021-07-08T11:04:04.510' AS DateTime), 0)
GO
INSERT [dbo].[tbl_PermissionMaster] ([EntryId], [ClientId], [EventName], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (13, 0, N'Wheather', 1, 2, 1, 1, CAST(N'2021-07-08T17:00:46.560' AS DateTime), 0, CAST(N'2021-07-08T17:00:46.560' AS DateTime), 0)
GO
INSERT [dbo].[tbl_PermissionMaster] ([EntryId], [ClientId], [EventName], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (14, 0, N'Traffic Monitor Camera System (TMCS)', 1, 2, 2, 1, CAST(N'2021-07-08T17:01:51.847' AS DateTime), 0, CAST(N'2021-07-08T17:01:51.847' AS DateTime), 0)
GO
INSERT [dbo].[tbl_PermissionMaster] ([EntryId], [ClientId], [EventName], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (17, 0, N'Vehicle Speed Detection System(VSDS)', 1, 2, 2, 1, CAST(N'2021-07-08T17:03:42.600' AS DateTime), 0, CAST(N'2021-07-08T17:03:42.600' AS DateTime), 0)
GO
INSERT [dbo].[tbl_PermissionMaster] ([EntryId], [ClientId], [EventName], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (18, 0, N'Section Speed Vehicle  Detection System(SSVDS)', 1, 2, 2, 1, CAST(N'2021-07-08T17:04:18.003' AS DateTime), 0, CAST(N'2021-07-08T17:04:18.003' AS DateTime), 0)
GO
INSERT [dbo].[tbl_PermissionMaster] ([EntryId], [ClientId], [EventName], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (19, 0, N'Incident', 1, 1, 1, 1, CAST(N'2021-07-08T17:04:37.790' AS DateTime), 0, CAST(N'2021-07-08T17:04:37.790' AS DateTime), 0)
GO
INSERT [dbo].[tbl_PermissionMaster] ([EntryId], [ClientId], [EventName], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (20, 0, N'Facility Monitoring System(FMS)', 1, 2, 1, 1, CAST(N'2021-07-08T17:04:59.757' AS DateTime), 0, CAST(N'2021-07-08T17:04:59.757' AS DateTime), 0)
GO
INSERT [dbo].[tbl_PermissionMaster] ([EntryId], [ClientId], [EventName], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (21, 0, N'Reporting', 1, 2, 2, 1, CAST(N'2021-07-08T17:05:05.790' AS DateTime), 0, CAST(N'2021-07-08T17:05:05.790' AS DateTime), 0)
GO
INSERT [dbo].[tbl_PermissionMaster] ([EntryId], [ClientId], [EventName], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (15, 0, N'Variable Message Sign (VMS)', 1, 1, 1, 1, CAST(N'2021-07-08T17:02:14.250' AS DateTime), 0, CAST(N'2021-07-08T17:02:14.250' AS DateTime), 0)
GO
INSERT [dbo].[tbl_PermissionMaster] ([EntryId], [ClientId], [EventName], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (16, 0, N'Video Incident Detection System (VIDS)', 1, 2, 2, 1, CAST(N'2021-07-08T17:02:42.293' AS DateTime), 0, CAST(N'2021-07-08T17:02:42.293' AS DateTime), 0)
GO
SET IDENTITY_INSERT [dbo].[tbl_PermissionMaster] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_RoleMaster] ON 
GO
INSERT [dbo].[tbl_RoleMaster] ([EntryId], [ClientId], [PlazaId], [RoleName], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (1, 0, 0, N'Role-10', 1, CAST(N'2021-07-01T23:15:05.810' AS DateTime), 0, CAST(N'2021-07-01T23:21:36.827' AS DateTime), 0)
GO
INSERT [dbo].[tbl_RoleMaster] ([EntryId], [ClientId], [PlazaId], [RoleName], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (2, 0, 0, N'Role', 1, CAST(N'2021-07-01T23:22:09.097' AS DateTime), 0, CAST(N'2021-07-01T23:22:09.097' AS DateTime), 0)
GO
SET IDENTITY_INSERT [dbo].[tbl_RoleMaster] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_VehicleClass] ON 
GO
INSERT [dbo].[tbl_VehicleClass] ([EntryId], [ClassName], [ClassDescription], [VehicleSpeed], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (1, N'LMV', N'test', 80, 1, CAST(N'2021-07-01T00:31:20.147' AS DateTime), 0, CAST(N'2021-07-01T00:34:32.600' AS DateTime), 0)
GO
SET IDENTITY_INSERT [dbo].[tbl_VehicleClass] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_VMSMessageDetails] ON 
GO
INSERT [dbo].[tbl_VMSMessageDetails] ([EntryId], [VmsIds], [MessageFormatId], [FontFormat], [FontSize], [AlignmentId], [Brightness], [MessageLanguageId], [MessageOrientationId], [MessageDuration], [MessageBody], [MessagePriority], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (1, N'0', 1, N'Calibri', 12, 1, 0, 2, 1, 10, N'धीमी गति से गाड़ी चालाना', 0, 1, CAST(N'2021-07-03T14:10:05.537' AS DateTime), 0, CAST(N'2021-07-03T14:10:05.540' AS DateTime), 0)
GO
INSERT [dbo].[tbl_VMSMessageDetails] ([EntryId], [VmsIds], [MessageFormatId], [FontFormat], [FontSize], [AlignmentId], [Brightness], [MessageLanguageId], [MessageOrientationId], [MessageDuration], [MessageBody], [MessagePriority], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (2, N'0', 2, N'Calibri', 0, 0, 0, 0, 1, 10, N'UNO3M-20210703145443889.png', 0, 1, CAST(N'2021-07-03T14:54:51.197' AS DateTime), 0, CAST(N'2021-07-03T14:54:51.227' AS DateTime), 0)
GO
INSERT [dbo].[tbl_VMSMessageDetails] ([EntryId], [VmsIds], [MessageFormatId], [FontFormat], [FontSize], [AlignmentId], [Brightness], [MessageLanguageId], [MessageOrientationId], [MessageDuration], [MessageBody], [MessagePriority], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (3, N'0', 2, N'Calibri', 0, 0, 0, 0, 1, 10, N'83ZEQ-20210703150025418.jpeg', 0, 1, CAST(N'2021-07-03T15:00:25.473' AS DateTime), 0, CAST(N'2021-07-03T15:00:25.503' AS DateTime), 0)
GO
SET IDENTITY_INSERT [dbo].[tbl_VMSMessageDetails] OFF
GO
ALTER TABLE [dbo].[tbl_ATCCEventsDetails] ADD  DEFAULT ((1)) FOR [DataStatus]
GO
ALTER TABLE [dbo].[tbl_ATCCEventsDetails] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[tbl_ATCCEventsDetails] ADD  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[tbl_ATCCEventsDetails] ADD  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[tbl_ATCCEventsDetails] ADD  DEFAULT ((0)) FOR [ModifiedBy]
GO
ALTER TABLE [dbo].[tbl_CallStatusMaster] ADD  DEFAULT ((0)) FOR [MappingId]
GO
ALTER TABLE [dbo].[tbl_CallStatusMaster] ADD  DEFAULT ((1)) FOR [DataStatus]
GO
ALTER TABLE [dbo].[tbl_CallStatusMaster] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[tbl_CallStatusMaster] ADD  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[tbl_CallStatusMaster] ADD  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[tbl_CallStatusMaster] ADD  DEFAULT ((0)) FOR [ModifiedBy]
GO
ALTER TABLE [dbo].[tbl_CallTypeMaster] ADD  DEFAULT ((0)) FOR [MappingId]
GO
ALTER TABLE [dbo].[tbl_CallTypeMaster] ADD  DEFAULT ((1)) FOR [DataStatus]
GO
ALTER TABLE [dbo].[tbl_CallTypeMaster] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[tbl_CallTypeMaster] ADD  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[tbl_CallTypeMaster] ADD  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[tbl_CallTypeMaster] ADD  DEFAULT ((0)) FOR [ModifiedBy]
GO
ALTER TABLE [dbo].[tbl_CategoryMaster] ADD  DEFAULT ((1)) FOR [DataStatus]
GO
ALTER TABLE [dbo].[tbl_CategoryMaster] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[tbl_CategoryMaster] ADD  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[tbl_CategoryMaster] ADD  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[tbl_CategoryMaster] ADD  DEFAULT ((0)) FOR [ModifiedBy]
GO
ALTER TABLE [dbo].[tbl_ClientConfiguration] ADD  DEFAULT ((1)) FOR [DataStatus]
GO
ALTER TABLE [dbo].[tbl_ClientConfiguration] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[tbl_ClientConfiguration] ADD  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[tbl_ClientConfiguration] ADD  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[tbl_ClientConfiguration] ADD  DEFAULT ((0)) FOR [ModifiedBy]
GO
ALTER TABLE [dbo].[tbl_ConnectionType] ADD  DEFAULT ((1)) FOR [DataStatus]
GO
ALTER TABLE [dbo].[tbl_ConnectionType] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[tbl_ConnectionType] ADD  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[tbl_ConnectionType] ADD  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[tbl_ConnectionType] ADD  DEFAULT ((0)) FOR [ModifiedBy]
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
ALTER TABLE [dbo].[tbl_DeviceDetails] ADD  DEFAULT ((0)) FOR [OnLineStatus]
GO
ALTER TABLE [dbo].[tbl_DeviceDetails] ADD  DEFAULT ((1)) FOR [DataStatus]
GO
ALTER TABLE [dbo].[tbl_DeviceDetails] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[tbl_DeviceDetails] ADD  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[tbl_DeviceDetails] ADD  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[tbl_DeviceDetails] ADD  DEFAULT ((0)) FOR [ModifiedBy]
GO
ALTER TABLE [dbo].[tbl_DeviceTypeMaster] ADD  DEFAULT ((1)) FOR [DataStatus]
GO
ALTER TABLE [dbo].[tbl_DeviceTypeMaster] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[tbl_DeviceTypeMaster] ADD  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[tbl_DeviceTypeMaster] ADD  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[tbl_DeviceTypeMaster] ADD  DEFAULT ((0)) FOR [ModifiedBy]
GO
ALTER TABLE [dbo].[tbl_ECBCallEventsDetails] ADD  DEFAULT ((1)) FOR [DataStatus]
GO
ALTER TABLE [dbo].[tbl_ECBCallEventsDetails] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[tbl_ECBCallEventsDetails] ADD  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[tbl_ECBCallEventsDetails] ADD  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[tbl_ECBCallEventsDetails] ADD  DEFAULT ((0)) FOR [ModifiedBy]
GO
ALTER TABLE [dbo].[tbl_EventsTypeMaster] ADD  DEFAULT ((0)) FOR [MappingId]
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
ALTER TABLE [dbo].[tbl_GantryConfiguration] ADD  DEFAULT ((1)) FOR [DataStatus]
GO
ALTER TABLE [dbo].[tbl_GantryConfiguration] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[tbl_GantryConfiguration] ADD  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[tbl_GantryConfiguration] ADD  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[tbl_GantryConfiguration] ADD  DEFAULT ((0)) FOR [ModifiedBy]
GO
ALTER TABLE [dbo].[tbl_GantryMapping] ADD  DEFAULT ((1)) FOR [DataStatus]
GO
ALTER TABLE [dbo].[tbl_GantryMapping] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[tbl_GantryMapping] ADD  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[tbl_GantryMapping] ADD  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[tbl_GantryMapping] ADD  DEFAULT ((0)) FOR [ModifiedBy]
GO
ALTER TABLE [dbo].[tbl_HardwareConfiguration] ADD  DEFAULT ((0)) FOR [HardwareProviderId]
GO
ALTER TABLE [dbo].[tbl_HardwareConfiguration] ADD  DEFAULT ((1)) FOR [DataStatus]
GO
ALTER TABLE [dbo].[tbl_HardwareConfiguration] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[tbl_HardwareConfiguration] ADD  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[tbl_HardwareConfiguration] ADD  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[tbl_HardwareConfiguration] ADD  DEFAULT ((0)) FOR [ModifiedBy]
GO
ALTER TABLE [dbo].[tbl_HardwareProvider] ADD  DEFAULT ((1)) FOR [DataStatus]
GO
ALTER TABLE [dbo].[tbl_HardwareProvider] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[tbl_HardwareProvider] ADD  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[tbl_HardwareProvider] ADD  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[tbl_HardwareProvider] ADD  DEFAULT ((0)) FOR [ModifiedBy]
GO
ALTER TABLE [dbo].[tbl_HardwareType] ADD  DEFAULT ((1)) FOR [DataStatus]
GO
ALTER TABLE [dbo].[tbl_HardwareType] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[tbl_HardwareType] ADD  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[tbl_HardwareType] ADD  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[tbl_HardwareType] ADD  DEFAULT ((0)) FOR [ModifiedBy]
GO
ALTER TABLE [dbo].[tbl_LaneConfiguration] ADD  DEFAULT ((1)) FOR [DataStatus]
GO
ALTER TABLE [dbo].[tbl_LaneConfiguration] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[tbl_LaneConfiguration] ADD  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[tbl_LaneConfiguration] ADD  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[tbl_LaneConfiguration] ADD  DEFAULT ((0)) FOR [ModifiedBy]
GO
ALTER TABLE [dbo].[tbl_LaneForType] ADD  DEFAULT ((1)) FOR [DataStatus]
GO
ALTER TABLE [dbo].[tbl_LaneForType] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[tbl_LaneForType] ADD  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[tbl_LaneForType] ADD  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[tbl_LaneForType] ADD  DEFAULT ((0)) FOR [ModifiedBy]
GO
ALTER TABLE [dbo].[tbl_LaneType] ADD  DEFAULT ((1)) FOR [DataStatus]
GO
ALTER TABLE [dbo].[tbl_LaneType] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[tbl_LaneType] ADD  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[tbl_LaneType] ADD  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[tbl_LaneType] ADD  DEFAULT ((0)) FOR [ModifiedBy]
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
ALTER TABLE [dbo].[tbl_METConfiguration] ADD  DEFAULT ((1)) FOR [DataStatus]
GO
ALTER TABLE [dbo].[tbl_METConfiguration] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[tbl_METConfiguration] ADD  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[tbl_METConfiguration] ADD  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[tbl_METConfiguration] ADD  DEFAULT ((0)) FOR [ModifiedBy]
GO
ALTER TABLE [dbo].[tbl_METEventsDetails] ADD  DEFAULT ((0)) FOR [AlertRequired]
GO
ALTER TABLE [dbo].[tbl_METEventsDetails] ADD  DEFAULT ((1)) FOR [DataStatus]
GO
ALTER TABLE [dbo].[tbl_METEventsDetails] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[tbl_METEventsDetails] ADD  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[tbl_METEventsDetails] ADD  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[tbl_METEventsDetails] ADD  DEFAULT ((0)) FOR [ModifiedBy]
GO
ALTER TABLE [dbo].[tbl_PermissionMaster] ADD  DEFAULT ((1)) FOR [DataView]
GO
ALTER TABLE [dbo].[tbl_PermissionMaster] ADD  DEFAULT ((1)) FOR [DataAdd]
GO
ALTER TABLE [dbo].[tbl_PermissionMaster] ADD  DEFAULT ((1)) FOR [DataUpdate]
GO
ALTER TABLE [dbo].[tbl_PermissionMaster] ADD  DEFAULT ((1)) FOR [DataStatus]
GO
ALTER TABLE [dbo].[tbl_PermissionMaster] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[tbl_PermissionMaster] ADD  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[tbl_PermissionMaster] ADD  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[tbl_PermissionMaster] ADD  DEFAULT ((0)) FOR [ModifiedBy]
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
ALTER TABLE [dbo].[tbl_ShiftTimining] ADD  DEFAULT ((1)) FOR [DataStatus]
GO
ALTER TABLE [dbo].[tbl_ShiftTimining] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[tbl_ShiftTimining] ADD  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[tbl_ShiftTimining] ADD  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[tbl_ShiftTimining] ADD  DEFAULT ((0)) FOR [ModifiedBy]
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
ALTER TABLE [dbo].[tbl_VehicleClass] ADD  DEFAULT ((100)) FOR [VehicleSpeed]
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
ALTER TABLE [dbo].[tbl_VIDSEventsDetails] ADD  DEFAULT ((1)) FOR [DataStatus]
GO
ALTER TABLE [dbo].[tbl_VIDSEventsDetails] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[tbl_VIDSEventsDetails] ADD  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[tbl_VIDSEventsDetails] ADD  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[tbl_VIDSEventsDetails] ADD  DEFAULT ((0)) FOR [ModifiedBy]
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
/****** Object:  StoredProcedure [dbo].[USP_ATCCEventGetLatest]    Script Date: 08-07-2021 17:08:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_ATCCEventGetLatest]
AS BEGIN

	SELECT TOP 100 A.EntryId,A.EventDateTime,A.ATCCId,D.DeviceName,C.ControlRoomName,A.VehicleClassId,V.ClassName,
	A.AxleCount,A.GrossWeight,A.VehicleImage,
	A.DataStatus,A.CreatedDate,A.CreatedBy,A.ModifiedDate,A.ModifiedBy 
	FROM tbl_ATCCEventsDetails A 
	INNER JOIN tbl_DeviceDetails D ON A.ATCCId=D.EntryId
	INNER JOIN tbl_ControlRoomMaster C ON D.ControlRoomId=C.EntryId
	INNER JOIN tbl_VehicleClass V ON A.VehicleClassId=V.EntryId
	ORDER BY EventDateTime DESC
END
GO
/****** Object:  StoredProcedure [dbo].[USP_ATCCEventsInsertUpdate]    Script Date: 08-07-2021 17:08:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_ATCCEventsInsertUpdate] 
@EventDateTime DateTime,
@ATCCId	bigint,
@VehicleClassId	smallint,
@AxleCount	smallint,
@GrossWeight decimal(10,3),
@VehicleImage varchar(255)
AS
BEGIN
		CREATE TABLE #Temp(AlertMessage varchar(100))
		insert into tbl_ATCCEventsDetails(EventDateTime,ATCCId,VehicleClassId,AxleCount,GrossWeight,VehicleImage)
		values(@EventDateTime,@ATCCId,@VehicleClassId,@AxleCount,@GrossWeight,@VehicleImage);
		INSERT INTO #Temp(AlertMessage)VALUES('success');
		select * from #Temp;
END


GO
/****** Object:  StoredProcedure [dbo].[USP_CategoryMasterGetAll]    Script Date: 08-07-2021 17:08:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_CategoryMasterGetAll]
AS BEGIN
	SELECT * FROM tbl_CategoryMaster ORDER BY EntryId 
END
GO
/****** Object:  StoredProcedure [dbo].[USP_CategoryMasterGetAllActive]    Script Date: 08-07-2021 17:08:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_CategoryMasterGetAllActive]
AS BEGIN
	SELECT * FROM tbl_CategoryMaster 
	WHERE DataStatus=1
	ORDER BY EntryId 
END
GO
/****** Object:  StoredProcedure [dbo].[USP_CategoryMasterGetById]    Script Date: 08-07-2021 17:08:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_CategoryMasterGetById]
@EntryId smallint
AS BEGIN
	SELECT * FROM tbl_CategoryMaster WHERE EntryId =@EntryId 
END
GO
/****** Object:  StoredProcedure [dbo].[USP_ClientGetActive]    Script Date: 08-07-2021 17:08:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[USP_ClientGetActive]
AS BEGIN
	
		SELECT C.EntryId,C.ClientName,C.ClientAddress,C.MobileNumber,C.EmailId,C.DataStatus,C.CreatedDate,C.CreatedBy,C.ModifiedDate,C.ModifiedBy
        FROM tbl_ClientConfiguration C WHERE DataStatus=1
		ORDER BY ModifiedDate DESC,CreatedDate DESC
END

--GO
--EXEC USP_UsersGetByLoginId
--@LoginId='admin'

GO
/****** Object:  StoredProcedure [dbo].[USP_ClientGetAll]    Script Date: 08-07-2021 17:08:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[USP_ClientGetAll]
AS BEGIN
	
		SELECT C.EntryId,C.ClientName,C.ClientAddress,C.MobileNumber,C.EmailId,C.DataStatus,C.CreatedDate,C.CreatedBy,C.ModifiedDate,C.ModifiedBy
        FROM tbl_ClientConfiguration C
		ORDER BY ModifiedDate DESC,CreatedDate DESC
END

--GO
--EXEC USP_UsersGetByLoginId
--@LoginId='admin'

GO
/****** Object:  StoredProcedure [dbo].[USP_ClientGetbyId]    Script Date: 08-07-2021 17:08:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[USP_ClientGetbyId]
@EntryId int
AS BEGIN
	
		SELECT C.EntryId,C.ClientName,C.ClientAddress,C.MobileNumber,C.EmailId,C.DataStatus,C.CreatedDate,C.CreatedBy,C.ModifiedDate,C.ModifiedBy
        FROM tbl_ClientConfiguration C
		WHERE EntryId=@EntryId
END

--GO
--EXEC USP_UsersGetByLoginId
--@LoginId='admin'

GO
/****** Object:  StoredProcedure [dbo].[USP_ClientInsertUpdate]    Script Date: 08-07-2021 17:08:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_ClientInsertUpdate] 
@EntryId bigint,
@ClientName varchar(100),
@ClientAddress varchar (200),
@MobileNumber varchar (20),
@EmailId varchar (50),
@DataStatus smallint,
@UserId bigint,
@CDateTime DateTime
AS
BEGIN
	DECLARE @EventId smallint=1;
	DECLARE @PVal varchar(4000)
	DECLARE @CVal varchar(4000)
	CREATE TABLE #Temp(AlertMessage varchar(100))
	DECLARE @cnt int
	DECLARE @DataCount int=0;
	
	IF EXISTS(SELECT EntryId FROM tbl_ClientConfiguration where ClientName=@ClientName AND EntryId<>@EntryId)
	BEGIN
		INSERT INTO #Temp(AlertMessage)
		VALUES('Name already exists')
	END
	IF EXISTS(SELECT EntryId FROM tbl_ClientConfiguration where MobileNumber=@MobileNumber AND EntryId<>@EntryId)
	BEGIN
		INSERT INTO #Temp(AlertMessage)
		VALUES('Mobile number already exists')
	END
	IF EXISTS(SELECT EntryId FROM tbl_ClientConfiguration where EmailId=@EmailId AND EntryId<>@EntryId)
	BEGIN
		INSERT INTO #Temp(AlertMessage)
		VALUES('Email id already exists')
	END
	IF(@EntryId<>0 AND @DataStatus<>1)
	BEGIN
		IF EXISTS(SELECT EntryId FROM tbl_PlazaConfiguration where ClientId=@EntryId AND DataStatus=1)
		BEGIN
			INSERT INTO #Temp(AlertMessage)
			VALUES('Client cannot inactive due to plaza already conncted!');
		END	
	END
	
	SELECT @cnt=COUNT(AlertMessage)  FROM #Temp
	IF(@cnt=0)
		BEGIN
			IF(@EntryId=0)
			BEGIN
				insert into tbl_ClientConfiguration(ClientName,ClientAddress,MobileNumber,EmailId,DataStatus,CreatedDate,CreatedBy)
				values(@ClientName,@ClientAddress,@MobileNumber,@EmailId,@DataStatus,@CDateTime,@UserId);
				SELECT @EntryId=@@IDENTITY
				
				Set @CVal ='ClientId:'+convert(varchar,@EntryId)+',ClientName:'+@ClientName+',ClientAddress:'+@ClientAddress+
				',EmailId:'+@EmailId+',MobileNumber:'+@MobileNumber+',Status:'+CONVERT(varchar,@DataStatus)			
				
				INSERT INTO tbl_ActivityLog(UserId,CurrentColumn,Action,EventId,CreatedDate)
				VALUES(@UserId,@CVal,'Insert',@EventId,@CDateTime);
				
				INSERT INTO #Temp(AlertMessage)VALUES('success');
			END
			ELSE
			BEGIN
				Declare @LDataStatus smallint		
				Declare @LClientName varchar(100)	Declare @LClientAddress varchar(200)	Declare @LEmailId varchar(50)
				Declare @LMobileNumber varchar(30)	
				


				Select @LDataStatus=DataStatus,
				@LClientName=ClientName,@LClientAddress=ClientAddress,@LEmailId=EmailId,@LMobileNumber=MobileNumber
				from tbl_ClientConfiguration where EntryId=@EntryId;

				UPDATE tbl_ClientConfiguration SET ClientName=@ClientName,ClientAddress=@ClientAddress,MobileNumber=@MobileNumber,EmailId=@EmailId,
				DataStatus=@DataStatus,ModifiedDate=@CDateTime,ModifiedBy=@UserId
				WHERE EntryId=@EntryId
			
				Set @CVal ='ClientId:'+convert(varchar,@EntryId)+',ClientName:'+@ClientName+',ClientAddress:'+@ClientAddress+
				',EmailId:'+@EmailId+',MobileNumber:'+@MobileNumber+',Status:'+CONVERT(varchar,@DataStatus)		
				
				Set @PVal ='ClientId:'+convert(varchar,@EntryId)+',ClientName:'+@LClientName+',ClientAddress:'+@LClientAddress+
				',EmailId:'+@LEmailId+',MobileNumber:'+@LMobileNumber+',Status:'+CONVERT(varchar,@LDataStatus)		
					
				INSERT INTO tbl_ActivityLog(UserId,PrevColumn,CurrentColumn,Action,EventId,CreatedDate)
				VALUES(@UserId,@PVal,@CVal,'Update',@EventId,@CDateTime);

				INSERT INTO #Temp(AlertMessage)VALUES('success');
			END
		END
		select * from #Temp;
END


GO
/****** Object:  StoredProcedure [dbo].[USP_ConnectionTypeGetAllActive]    Script Date: 08-07-2021 17:08:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[USP_ConnectionTypeGetAllActive] 

AS
BEGIN
	SELECT EntryId,ConnectionType,DataStatus,CreatedDate,CreatedBy,ModifiedDate,ModifiedBy FROM tbl_ConnectionType
	WHERE DataStatus=1
END


GO
/****** Object:  StoredProcedure [dbo].[USP_ControlRoomMasterGetAll]    Script Date: 08-07-2021 17:08:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_ControlRoomMasterGetAll]

AS BEGIN

	SELECT * FROM tbl_ControlRoomMaster
END
GO
/****** Object:  StoredProcedure [dbo].[USP_ControlRoomMasterGetById]    Script Date: 08-07-2021 17:08:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_ControlRoomMasterGetById]
@EntryId smallint
AS BEGIN
	SELECT * FROM tbl_ControlRoomMaster WHERE EntryId=@EntryId
END
GO
/****** Object:  StoredProcedure [dbo].[USP_ControlRoomMasterGetByUserId]    Script Date: 08-07-2021 17:08:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_ControlRoomMasterGetByUserId]
@UserId bigint
AS BEGIN
	SELECT * FROM tbl_ControlRoomMaster 
	--WHERE EntryId=@EntryId
END
GO
/****** Object:  StoredProcedure [dbo].[USP_ControlRoomMasterInsertUpdate]    Script Date: 08-07-2021 17:08:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_ControlRoomMasterInsertUpdate]
(
@EntryId bigint,
@ControlRoomName varchar(100),
@DataStatus smallint,
@CreatedBy bigint,
@CreatedDate datetime,
@ModifiedBy bigint,
@ModifiedDate datetime
)
AS BEGIN
	DECLARE @PVal varchar(4000)
	DECLARE @CVal varchar(4000)
	DECLARE @EventId smallint=1;
	CREATE TABLE #Temp(AlertMessage varchar(100))
	DECLARE @cnt int
	IF EXISTS(SELECT EntryId FROM tbl_ControlRoomMaster where ControlRoomName=@ControlRoomName AND EntryId<>@EntryId)
		BEGIN
			INSERT INTO #Temp(AlertMessage)
			VALUES('Control name already exists!')
		END
	
	SELECT @cnt=COUNT(AlertMessage)  FROM #Temp
	IF(@cnt=0)
	BEGIN
		IF(@EntryId=0)
		BEGIN
			INSERT INTO tbl_ControlRoomMaster(ControlRoomName,DataStatus,CreatedBy,CreatedDate)
			VALUES(@ControlRoomName,@DataStatus,@CreatedBy,@CreatedDate)
			SELECT @EntryId=@@IDENTITY

			Set @CVal ='ControlRoomId:'+convert(varchar,@EntryId)+',ControlRoomName:'+@ControlRoomName+',Status:'+CONVERT(varchar,@DataStatus)			
				
			INSERT INTO tbl_ActivityLog(UserId,CurrentColumn,Action,EventId,CreatedDate)
			VALUES(@CreatedBy,@CVal,'Insert',@EventId,@CreatedDate);

			INSERT INTO #Temp(AlertMessage)VALUES('success');
		END
		ELSE
		BEGIN

		
		DECLARE @PControlRoomName	varchar(100)	DECLARE @PDataStatus smallint			

		Select @PControlRoomName=ControlRoomName,@PDataStatus=DataStatus
		FROM tbl_ControlRoomMaster where EntryId=@EntryId;

			UPDATE tbl_ControlRoomMaster 
			SET ControlRoomName= @ControlRoomName,
			ModifiedBy=@ModifiedBy,
			ModifiedDate=@ModifiedDate,
			DataStatus=@DataStatus
			WHERE EntryId=@EntryId
			INSERT INTO #Temp(AlertMessage)VALUES('success');

		Set @CVal ='ControlRoomId:'+convert(varchar,@EntryId)+',ControlRoomName:'+@ControlRoomName+',Status:'+CONVERT(varchar,@DataStatus)		
				
		Set @PVal ='ControlRoomId:'+convert(varchar,@EntryId)+',ControlRoomName:'+@PControlRoomName+',Status:'+CONVERT(varchar,@PDataStatus)
				
		INSERT INTO tbl_ActivityLog(UserId,PrevColumn,CurrentColumn,Action,EventId,CreatedDate)
		VALUES(@ModifiedBy,@PVal,@CVal,'Insert',@EventId,@ModifiedDate);
		END
	END
	SELECT * FROM #Temp
END
GO
/****** Object:  StoredProcedure [dbo].[USP_DevicesMasterGetAll]    Script Date: 08-07-2021 17:08:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_DevicesMasterGetAll]

AS BEGIN
	SELECT D.EntryId,D.ControlRoomId,CR.ControlRoomName,D.CategoryId,C.CategoryName,D.DeviceTypeId,DTM.DeviceTypeName,DTM.IconName,
	D.DeviceName,D.Direction,D.ConnectionTypeId,CT.ConnectionType,D.IpAddress,D.PortNumber,D.DeviceLoginId,D.DevicePassword,D.Latitude,D.Longitude,D.ModelNumber,D.Manufacturer,
	D.Vendor,D.Remark,D.PurchageDate,D.ManufacturerDate,D.WarrantyExpireDate,D.GantryId,G.GantryName,D.LaneNumber,D.OnLineStatus,D.DataStatus,
	D.CreatedDate,D.CreatedBy,D.ModifiedDate,D.ModifiedBy
	FROM tbl_DeviceDetails D 
	INNER JOIN tbl_ControlRoomMaster CR ON D.ControlRoomId=CR.EntryId
	INNER JOIN tbl_CategoryMaster C ON D.CategoryId=C.EntryId
	INNER JOIN tbl_DeviceTypeMaster DTM ON D.DeviceTypeId =DTM.EntryId
	LEFT JOIN tbl_GantryConfiguration G ON D.GantryId=G.EntryId
	LEFT JOIN tbl_ConnectionType CT ON D.ConnectionTypeId=CT.EntryId
END
GO
/****** Object:  StoredProcedure [dbo].[USP_DevicesMasterGetAllActive]    Script Date: 08-07-2021 17:08:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_DevicesMasterGetAllActive]

AS BEGIN
	SELECT D.EntryId,D.ControlRoomId,CR.ControlRoomName,D.CategoryId,C.CategoryName,D.DeviceTypeId,DTM.DeviceTypeName,DTM.IconName,
	D.DeviceName,D.Direction,D.ConnectionTypeId,CT.ConnectionType,D.IpAddress,D.PortNumber,D.DeviceLoginId,D.DevicePassword,D.Latitude,D.Longitude,D.ModelNumber,D.Manufacturer,
	D.Vendor,D.Remark,D.PurchageDate,D.ManufacturerDate,D.WarrantyExpireDate,D.GantryId,G.GantryName,D.LaneNumber,D.OnLineStatus,D.DataStatus,
	D.CreatedDate,D.CreatedBy,D.ModifiedDate,D.ModifiedBy
	FROM tbl_DeviceDetails D 
	INNER JOIN tbl_ControlRoomMaster CR ON D.ControlRoomId=CR.EntryId AND CR.DataStatus=1
	INNER JOIN tbl_CategoryMaster C ON D.CategoryId=C.EntryId AND C.DataStatus=1
	INNER JOIN tbl_DeviceTypeMaster DTM ON D.DeviceTypeId =DTM.EntryId AND DTM.DataStatus=1
	LEFT JOIN tbl_GantryConfiguration G ON D.GantryId =G.EntryId
	LEFT JOIN tbl_ConnectionType CT ON D.ConnectionTypeId=CT.EntryId
	WHERE C.DataStatus=1
END
GO
/****** Object:  StoredProcedure [dbo].[USP_DevicesMasterGetByCategoryId]    Script Date: 08-07-2021 17:08:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_DevicesMasterGetByCategoryId]
(
@CategoryId smallint
)
AS BEGIN
	SELECT D.EntryId,D.ControlRoomId,CR.ControlRoomName,D.CategoryId,C.CategoryName,D.DeviceTypeId,DTM.DeviceTypeName,DTM.IconName,
	D.DeviceName,D.Direction,D.ConnectionTypeId,CT.ConnectionType,D.IpAddress,D.PortNumber,D.DeviceLoginId,D.DevicePassword,D.Latitude,D.Longitude,D.ModelNumber,D.Manufacturer,
	D.Vendor,D.Remark,D.PurchageDate,D.ManufacturerDate,D.WarrantyExpireDate,D.GantryId,G.GantryName,D.LaneNumber,D.OnLineStatus,D.DataStatus,
	D.CreatedDate,D.CreatedBy,D.ModifiedDate,D.ModifiedBy
	FROM tbl_DeviceDetails D 
	INNER JOIN tbl_ControlRoomMaster CR ON D.ControlRoomId=CR.EntryId
	INNER JOIN tbl_CategoryMaster C ON D.CategoryId=C.EntryId
	INNER JOIN tbl_DeviceTypeMaster DTM ON D.DeviceTypeId =DTM.EntryId
	LEFT JOIN tbl_GantryConfiguration G ON D.GantryId =G.EntryId
	LEFT JOIN tbl_ConnectionType CT ON D.ConnectionTypeId=CT.EntryId
	WHERE D.CategoryId=@CategoryId
END
GO
/****** Object:  StoredProcedure [dbo].[USP_DevicesMasterGetByControlRoomId]    Script Date: 08-07-2021 17:08:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_DevicesMasterGetByControlRoomId]
(
@ControlRoomId smallint
)
AS BEGIN
	IF(@ControlRoomId=0)
	BEGIN
		SELECT D.EntryId,D.ControlRoomId,CR.ControlRoomName,D.CategoryId,C.CategoryName,D.DeviceTypeId,DTM.DeviceTypeName,DTM.IconName,
		D.DeviceName,D.Direction,D.ConnectionTypeId,CT.ConnectionType,D.IpAddress,D.PortNumber,D.DeviceLoginId,D.DevicePassword,D.Latitude,D.Longitude,D.ModelNumber,D.Manufacturer,
		D.Vendor,D.Remark,D.PurchageDate,D.ManufacturerDate,D.WarrantyExpireDate,D.GantryId,G.GantryName,D.LaneNumber,D.OnLineStatus,D.DataStatus,
		D.CreatedDate,D.CreatedBy,D.ModifiedDate,D.ModifiedBy
		FROM tbl_DeviceDetails D 
		INNER JOIN tbl_ControlRoomMaster CR ON D.ControlRoomId=CR.EntryId
		INNER JOIN tbl_CategoryMaster C ON D.CategoryId=C.EntryId
		INNER JOIN tbl_DeviceTypeMaster DTM ON D.DeviceTypeId =DTM.EntryId
		LEFT JOIN tbl_GantryConfiguration G ON D.GantryId =G.EntryId
	   LEFT JOIN tbl_ConnectionType CT ON D.ConnectionTypeId=CT.EntryId

	END
	ELSE
	BEGIN
		SELECT D.EntryId,D.ControlRoomId,CR.ControlRoomName,D.CategoryId,C.CategoryName,D.DeviceTypeId,DTM.DeviceTypeName,DTM.IconName,
		D.DeviceName,D.Direction,D.ConnectionTypeId,CT.ConnectionType,D.IpAddress,D.PortNumber,D.DeviceLoginId,D.DevicePassword,D.Latitude,D.Longitude,D.ModelNumber,D.Manufacturer,
		D.Vendor,D.Remark,D.PurchageDate,D.ManufacturerDate,D.WarrantyExpireDate,D.GantryId,G.GantryName,D.LaneNumber,D.OnLineStatus,D.DataStatus,
		D.CreatedDate,D.CreatedBy,D.ModifiedDate,D.ModifiedBy
		FROM tbl_DeviceDetails D 
		INNER JOIN tbl_ControlRoomMaster CR ON D.ControlRoomId=CR.EntryId
		INNER JOIN tbl_CategoryMaster C ON D.CategoryId=C.EntryId
		INNER JOIN tbl_DeviceTypeMaster DTM ON D.DeviceTypeId =DTM.EntryId
		LEFT JOIN tbl_GantryConfiguration G ON D.GantryId =G.EntryId
	   LEFT JOIN tbl_ConnectionType CT ON D.ConnectionTypeId=CT.EntryId
		WHERE D.ControlRoomId=@ControlRoomId
	END
END
GO
/****** Object:  StoredProcedure [dbo].[USP_DevicesMasterGetByControlRoomIdActive]    Script Date: 08-07-2021 17:08:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_DevicesMasterGetByControlRoomIdActive]
(
@ControlRoomId smallint
)
AS BEGIN
	IF(@ControlRoomId=0)
	BEGIN
		SELECT D.EntryId,D.ControlRoomId,CR.ControlRoomName,D.CategoryId,C.CategoryName,D.DeviceTypeId,DTM.DeviceTypeName,DTM.IconName,
		D.DeviceName,D.Direction,D.ConnectionTypeId,CT.ConnectionType,D.IpAddress,D.PortNumber,D.DeviceLoginId,D.DevicePassword,D.Latitude,D.Longitude,D.ModelNumber,D.Manufacturer,
		D.Vendor,D.Remark,D.PurchageDate,D.ManufacturerDate,D.WarrantyExpireDate,D.GantryId,G.GantryName,D.LaneNumber,D.OnLineStatus,D.DataStatus,
		D.CreatedDate,D.CreatedBy,D.ModifiedDate,D.ModifiedBy
		FROM tbl_DeviceDetails D 
		INNER JOIN tbl_ControlRoomMaster CR ON D.ControlRoomId=CR.EntryId AND CR.DataStatus=1
		INNER JOIN tbl_CategoryMaster C ON D.CategoryId=C.EntryId AND C.DataStatus=1
		INNER JOIN tbl_DeviceTypeMaster DTM ON D.DeviceTypeId =DTM.EntryId AND DTM.DataStatus=1
		LEFT JOIN tbl_GantryConfiguration G ON D.GantryId =G.EntryId
	   LEFT JOIN tbl_ConnectionType CT ON D.ConnectionTypeId=CT.EntryId
		WHERE C.DataStatus=1
	END
	ELSE
	BEGIN
		SELECT D.EntryId,D.ControlRoomId,CR.ControlRoomName,D.CategoryId,C.CategoryName,D.DeviceTypeId,DTM.DeviceTypeName,DTM.IconName,
		D.DeviceName,D.Direction,D.ConnectionTypeId,CT.ConnectionType,D.IpAddress,D.PortNumber,D.DeviceLoginId,D.DevicePassword,D.Latitude,D.Longitude,D.ModelNumber,D.Manufacturer,
		D.Vendor,D.Remark,D.PurchageDate,D.ManufacturerDate,D.WarrantyExpireDate,D.GantryId,G.GantryName,D.LaneNumber,D.OnLineStatus,D.DataStatus,
		D.CreatedDate,D.CreatedBy,D.ModifiedDate,D.ModifiedBy
		FROM tbl_DeviceDetails D 
		INNER JOIN tbl_ControlRoomMaster CR ON D.ControlRoomId=CR.EntryId AND CR.DataStatus=1
		INNER JOIN tbl_CategoryMaster C ON D.CategoryId=C.EntryId AND C.DataStatus=1
		INNER JOIN tbl_DeviceTypeMaster DTM ON D.DeviceTypeId =DTM.EntryId AND DTM.DataStatus=1
		LEFT JOIN tbl_GantryConfiguration G ON D.GantryId =G.EntryId
	   LEFT JOIN tbl_ConnectionType CT ON D.ConnectionTypeId=CT.EntryId
		WHERE C.DataStatus=1 AND D.ControlRoomId=@ControlRoomId
	END
END
GO
/****** Object:  StoredProcedure [dbo].[USP_DevicesMasterGetById]    Script Date: 08-07-2021 17:08:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_DevicesMasterGetById]
(
@EntryId bigint
)
AS BEGIN
	SELECT D.EntryId,D.ControlRoomId,CR.ControlRoomName,D.CategoryId,C.CategoryName,D.DeviceTypeId,DTM.DeviceTypeName,DTM.IconName,
	D.DeviceName,D.Direction,D.ConnectionTypeId,CT.ConnectionType,D.IpAddress,D.PortNumber,D.DeviceLoginId,D.DevicePassword,D.Latitude,D.Longitude,D.ModelNumber,D.Manufacturer,
	D.Vendor,D.Remark,D.PurchageDate,D.ManufacturerDate,D.WarrantyExpireDate,D.GantryId,G.GantryName,D.LaneNumber,D.OnLineStatus,D.DataStatus,
	D.CreatedDate,D.CreatedBy,D.ModifiedDate,D.ModifiedBy
	FROM tbl_DeviceDetails D 
	INNER JOIN tbl_ControlRoomMaster CR ON D.ControlRoomId=CR.EntryId
	INNER JOIN tbl_CategoryMaster C ON D.CategoryId=C.EntryId
	INNER JOIN tbl_DeviceTypeMaster DTM ON D.DeviceTypeId =DTM.EntryId
	LEFT JOIN tbl_GantryConfiguration G ON D.GantryId =G.EntryId
	LEFT JOIN tbl_ConnectionType CT ON D.ConnectionTypeId=CT.EntryId
	WHERE D.EntryId=@EntryId
END
GO
/****** Object:  StoredProcedure [dbo].[USP_DevicesMasterGetByIds]    Script Date: 08-07-2021 17:08:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_DevicesMasterGetByIds]
(
@DeviceIds varchar(4000)
)
AS BEGIN
	SELECT D.EntryId,D.ControlRoomId,CR.ControlRoomName,D.CategoryId,C.CategoryName,D.DeviceTypeId,DTM.DeviceTypeName,DTM.IconName,
	D.DeviceName,D.Direction,D.ConnectionTypeId,CT.ConnectionType,D.IpAddress,D.PortNumber,D.DeviceLoginId,D.DevicePassword,D.Latitude,D.Longitude,D.ModelNumber,D.Manufacturer,
	D.Vendor,D.Remark,D.PurchageDate,D.ManufacturerDate,D.WarrantyExpireDate,D.GantryId,G.GantryName,D.LaneNumber,D.OnLineStatus,D.DataStatus,
	D.CreatedDate,D.CreatedBy,D.ModifiedDate,D.ModifiedBy
	FROM tbl_DeviceDetails D 
	INNER JOIN tbl_ControlRoomMaster CR ON D.ControlRoomId=CR.EntryId AND CR.DataStatus=1
	INNER JOIN tbl_CategoryMaster C ON D.CategoryId=C.EntryId AND C.DataStatus=1
	INNER JOIN tbl_DeviceTypeMaster DTM ON D.DeviceTypeId =DTM.EntryId AND DTM.DataStatus=1
	LEFT JOIN tbl_GantryConfiguration G ON D.GantryId =G.EntryId AND G.DataStatus=1
	LEFT JOIN tbl_ConnectionType CT ON D.ConnectionTypeId=CT.EntryId
	WHERE D.EntryId IN  (SELECT Value from fnc_ValueSplit(@DeviceIds)) AND D.DataStatus=1

END

--GO 
--EXEC USP_DevicesMasterGetByTypeIds
--@DeviceIds='3'

GO
/****** Object:  StoredProcedure [dbo].[USP_DevicesMasterGetByIpAddress]    Script Date: 08-07-2021 17:08:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_DevicesMasterGetByIpAddress]
(
@IpAddress varchar(50)
)
AS BEGIN
	SELECT D.EntryId,D.ControlRoomId,CR.ControlRoomName,D.CategoryId,C.CategoryName,D.DeviceTypeId,DTM.DeviceTypeName,DTM.IconName,
	D.DeviceName,D.Direction,D.ConnectionTypeId,CT.ConnectionType,D.IpAddress,D.PortNumber,D.DeviceLoginId,D.DevicePassword,D.Latitude,D.Longitude,D.ModelNumber,D.Manufacturer,
	D.Vendor,D.Remark,D.PurchageDate,D.ManufacturerDate,D.WarrantyExpireDate,D.GantryId,G.GantryName,D.LaneNumber,D.OnLineStatus,D.DataStatus,
	D.CreatedDate,D.CreatedBy,D.ModifiedDate,D.ModifiedBy
	FROM tbl_DeviceDetails D 
	INNER JOIN tbl_ControlRoomMaster CR ON D.ControlRoomId=CR.EntryId
	INNER JOIN tbl_CategoryMaster C ON D.CategoryId=C.EntryId
	INNER JOIN tbl_DeviceTypeMaster DTM ON D.DeviceTypeId =DTM.EntryId
	LEFT JOIN tbl_GantryConfiguration G ON D.GantryId =G.EntryId
	LEFT JOIN tbl_ConnectionType CT ON D.ConnectionTypeId=CT.EntryId
	WHERE D.IpAddress=@IpAddress
END
GO
/****** Object:  StoredProcedure [dbo].[USP_DevicesMasterGetByLocationId]    Script Date: 08-07-2021 17:08:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_DevicesMasterGetByLocationId]
(
@LocationId bigint
)
AS BEGIN
IF(@LocationId=0)
BEGIN
	SELECT D.EntryId,D.DeviceTypeId,DTM.DeviceTypeName,D.DeviceName,D.Direction,D.ConnectionTypeId,CT.ConnectionType,
	D.IpAddress,D.PortNumber,D.DeviceLoginId,D.DevicePassword,D.Latitude,D.Longitude,D.ModelNumber,D.WarrantyExpireDate,D.CreatedBy,D.CreatedDate,
	D.ModifiedBy,D.ModifiedDate,D.DataStatus FROM tbl_DeviceDetails D 
	INNER JOIN tbl_DeviceTypeMaster DTM ON D.DeviceTypeId =DTM.EntryId
	INNER JOIN tbl_ConnectionType CT ON D.ConnectionTypeId=CT.EntryId
END
ELSE
BEGIN
	SELECT D.EntryId,D.DeviceTypeId,DTM.DeviceTypeName,D.DeviceName,D.Direction,D.ConnectionTypeId,CT.ConnectionType,
	D.IpAddress,D.PortNumber,D.DeviceLoginId,D.DevicePassword,D.Latitude,D.Longitude,D.ModelNumber,D.WarrantyExpireDate,D.CreatedBy,D.CreatedDate,
	D.ModifiedBy,D.ModifiedDate,D.DataStatus FROM tbl_DeviceDetails D 
	INNER JOIN tbl_DeviceTypeMaster DTM ON D.DeviceTypeId =DTM.EntryId
	LEFT JOIN tbl_ConnectionType CT ON D.ConnectionTypeId=CT.EntryId
END
END
GO
/****** Object:  StoredProcedure [dbo].[USP_DevicesMasterGetByTypeId]    Script Date: 08-07-2021 17:08:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_DevicesMasterGetByTypeId]
(
@DeviceTypeId smallint
)
AS BEGIN
	SELECT D.EntryId,D.ControlRoomId,CR.ControlRoomName,D.CategoryId,C.CategoryName,D.DeviceTypeId,DTM.DeviceTypeName,DTM.IconName,
	D.DeviceName,D.Direction,D.ConnectionTypeId,CT.ConnectionType,D.IpAddress,D.PortNumber,D.DeviceLoginId,D.DevicePassword,D.Latitude,D.Longitude,D.ModelNumber,D.Manufacturer,
	D.Vendor,D.Remark,D.PurchageDate,D.ManufacturerDate,D.WarrantyExpireDate,D.GantryId,G.GantryName,D.LaneNumber,D.OnLineStatus,D.DataStatus,
	D.CreatedDate,D.CreatedBy,D.ModifiedDate,D.ModifiedBy
	FROM tbl_DeviceDetails D 
	INNER JOIN tbl_ControlRoomMaster CR ON D.ControlRoomId=CR.EntryId AND CR.DataStatus=1
	INNER JOIN tbl_CategoryMaster C ON D.CategoryId=C.EntryId AND C.DataStatus=1
	INNER JOIN tbl_DeviceTypeMaster DTM ON D.DeviceTypeId =DTM.EntryId AND DTM.DataStatus=1
	LEFT JOIN tbl_GantryConfiguration G ON D.GantryId =G.EntryId AND G.DataStatus=1
	LEFT JOIN tbl_ConnectionType CT ON D.ConnectionTypeId=CT.EntryId
	WHERE D.DeviceTypeId=@DeviceTypeId AND D.DataStatus=1
END
GO
/****** Object:  StoredProcedure [dbo].[USP_DevicesMasterGetByTypeIds]    Script Date: 08-07-2021 17:08:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_DevicesMasterGetByTypeIds]
(
@DeviceIds varchar(4000)
)
AS BEGIN
	SELECT D.EntryId,D.ControlRoomId,CR.ControlRoomName,D.CategoryId,C.CategoryName,D.DeviceTypeId,DTM.DeviceTypeName,DTM.IconName,
	D.DeviceName,D.Direction,D.ConnectionTypeId,CT.ConnectionType,D.IpAddress,D.PortNumber,D.DeviceLoginId,D.DevicePassword,D.Latitude,D.Longitude,D.ModelNumber,D.Manufacturer,
	D.Vendor,D.Remark,D.PurchageDate,D.ManufacturerDate,D.WarrantyExpireDate,D.GantryId,G.GantryName,D.LaneNumber,D.OnLineStatus,D.DataStatus,
	D.CreatedDate,D.CreatedBy,D.ModifiedDate,D.ModifiedBy
	FROM tbl_DeviceDetails D 
	INNER JOIN tbl_ControlRoomMaster CR ON D.ControlRoomId=CR.EntryId AND CR.DataStatus=1
	INNER JOIN tbl_CategoryMaster C ON D.CategoryId=C.EntryId AND C.DataStatus=1
	INNER JOIN tbl_DeviceTypeMaster DTM ON D.DeviceTypeId =DTM.EntryId AND DTM.DataStatus=1
	LEFT JOIN tbl_GantryConfiguration G ON D.GantryId =G.EntryId AND G.DataStatus=1
	LEFT JOIN tbl_ConnectionType CT ON D.ConnectionTypeId=CT.EntryId
	WHERE D.EntryId IN  (SELECT Value from fnc_ValueSplit(@DeviceIds)) AND D.DataStatus=1

	SELECT Value from fnc_ValueSplit(@DeviceIds)
END

--GO 
--EXEC USP_DevicesMasterGetByTypeIds
--@DeviceIds='3'

GO
/****** Object:  StoredProcedure [dbo].[USP_DevicesMasterInsertUpdate]    Script Date: 08-07-2021 17:08:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_DevicesMasterInsertUpdate]
(
@EntryId bigint,
@ControlRoomId	smallint,
@CategoryId	smallint,
@DeviceTypeId	smallint,
@DeviceName	varchar(100),
@Direction	smallint,
@ConnectionTypeId smallint,
@IpAddress	varchar(20),
@PortNumber	smallint,
@DeviceLoginId	varchar(50),
@DevicePassword	varchar(50),
@Latitude	varchar(50),
@Longitude	varchar(50),
@ModelNumber varchar(100),
@Manufacturer varchar(100),
@Vendor varchar(100),
@PurchageDate date,
@ManufacturerDate date,
@WarrantyExpireDate date,
@Remark varchar(100),
@DataStatus smallint,
@GantryId smallint,
@LaneNumber smallint,
@CreatedBy bigint,
@CreatedDate datetime,
@ModifiedBy bigint,
@ModifiedDate datetime
)
AS BEGIN
	DECLARE @PVal varchar(4000)
	DECLARE @CVal varchar(4000)
	DECLARE @EventId smallint=2;
	CREATE TABLE #Temp(AlertMessage varchar(100))
	DECLARE @cnt int
	IF EXISTS(SELECT EntryId FROM tbl_DeviceDetails where IpAddress=@IpAddress AND PortNumber=@PortNumber AND EntryId<>@EntryId AND PortNumber<>0)
		BEGIN
			INSERT INTO #Temp(AlertMessage)
			VALUES('Ip Address and Port already exists!')
		END
	IF EXISTS(SELECT EntryId FROM tbl_DeviceDetails where DeviceName=@DeviceName AND EntryId<>@EntryId)
		BEGIN
			INSERT INTO #Temp(AlertMessage)
			VALUES('Device name already exists!')
		END
	SELECT @cnt=COUNT(AlertMessage)  FROM #Temp
	IF(@cnt=0)
	BEGIN
		IF(@EntryId=0)
		BEGIN
			INSERT INTO tbl_DeviceDetails(ControlRoomId,CategoryId,DeviceTypeId,DeviceName,Direction,ConnectionTypeId,IpAddress,PortNumber,DeviceLoginId,
			DevicePassword,Latitude,Longitude,ModelNumber,Manufacturer,Vendor,Remark,PurchageDate,ManufacturerDate,WarrantyExpireDate,GantryId,
			LaneNumber,DataStatus,CreatedDate,CreatedBy)
			VALUES(@ControlRoomId,@CategoryId,@DeviceTypeId,@DeviceName,@Direction,@ConnectionTypeId,@IpAddress,@PortNumber,@DeviceLoginId,@DevicePassword,
			@Latitude,@Longitude,@ModelNumber,@Manufacturer,@Vendor,@Remark,@PurchageDate,@ManufacturerDate,@WarrantyExpireDate,@GantryId,
			@LaneNumber,@DataStatus,@CreatedDate,@CreatedBy)
			SELECT @EntryId=@@IDENTITY

			Set @CVal ='DeviceId:'+convert(varchar,@EntryId)+',ControlRoomId:'+convert(varchar,@ControlRoomId)+',CategoryId:'+convert(varchar,@CategoryId)+
			',DeviceTypeId:'+convert(varchar,@DeviceTypeId)+',DeviceName:'+@DeviceName+',Direction:'+convert(varchar,@Direction)+',IpAddress:'+@IpAddress+
			',PortNumber:'+convert(varchar,@PortNumber)+',DeviceLoginId:'+@DeviceLoginId+',DevicePassword:'+@DevicePassword+',Latitude:'+convert(varchar,@Latitude)+
			',Longitude:'+convert(varchar,@Longitude)+',ModelNumber:'+@ModelNumber+',Manufacturer:'+@Manufacturer+',Vendor:'+@Vendor+
			',Remark:'+@Remark+',PurchageDate:'+convert(varchar,@PurchageDate)+',ManufacturerDate:'+convert(varchar,@ManufacturerDate)+
			',WarrantyExpireDate:'+convert(varchar,@WarrantyExpireDate)+',GantryId:'+CONVERT(varchar,@GantryId)+',LaneNumber:'+CONVERT(varchar,@LaneNumber)+
			',Status:'+CONVERT(varchar,@DataStatus)			
				
			INSERT INTO tbl_ActivityLog(UserId,CurrentColumn,Action,EventId,CreatedDate)
			VALUES(@CreatedBy,@CVal,'Insert',@EventId,@CreatedDate);

			INSERT INTO #Temp(AlertMessage)VALUES('success');
		END
		ELSE
		BEGIN

		DECLARE @PControlRoomId	smallint		DECLARE @PCategoryId	smallint		DECLARE @PDeviceTypeId	smallint
		DECLARE @PDeviceName	varchar(100)	DECLARE @PDirection	smallint			DECLARE @PIpAddress	varchar(20)
		DECLARE @PPortNumber	smallint		DECLARE @PDeviceLoginId	varchar(50)		DECLARE @PDevicePassword	varchar(50)
		DECLARE @PLatitude	varchar(50)			DECLARE @PLongitude	varchar(50)			DECLARE @PModelNumber varchar(100)
		DECLARE @PManufacturer varchar(100)		DECLARE @PWarrantyExpireDate date		DECLARE @PRemark varchar(100)
		DECLARE @PDataStatus smallint			DECLARE @PVendor varchar(100)			DECLARE @PPurchageDate date
		DECLARE @PManufacturerDate date			DECLARE @PGantryId smallint				DECLARE @PLaneNumber smallint

		Select @PControlRoomId=ControlRoomId,@PCategoryId=CategoryId,@PDeviceTypeId=DeviceTypeId,@PDeviceName=DeviceName,@PDirection=Direction,
		@PIpAddress=IpAddress,@PPortNumber=PortNumber,@PDeviceLoginId=DeviceLoginId,@PDevicePassword=DevicePassword,@PLatitude=Latitude,
		@PLongitude=Longitude,@PModelNumber=ModelNumber,@PManufacturer=Manufacturer,@PRemark=Remark,@PWarrantyExpireDate=WarrantyExpireDate,
		@PVendor=Vendor,@PPurchageDate=PurchageDate,@PManufacturerDate=ManufacturerDate,@PGantryId=GantryId,@PLaneNumber=LaneNumber
		FROM tbl_DeviceDetails where EntryId=@EntryId;

		UPDATE tbl_DeviceDetails 
		SET ControlRoomId=@ControlRoomId,CategoryId=@CategoryId,DeviceTypeId=@DeviceTypeId,DeviceName=@DeviceName,
		Direction=@Direction,ConnectionTypeId=@ConnectionTypeId,IpAddress=@IpAddress,PortNumber=@PortNumber,DeviceLoginId=@DeviceLoginId,DevicePassword=@DevicePassword,
		Latitude=@Latitude,Longitude=@Longitude,ModelNumber=@ModelNumber,Manufacturer=@Manufacturer,Remark=@Remark,WarrantyExpireDate=@WarrantyExpireDate,
		DataStatus=@DataStatus,ModifiedDate=@ModifiedDate,ModifiedBy=@ModifiedBy
		WHERE EntryId=@EntryId
			
		Set @CVal ='DeviceId:'+convert(varchar,@EntryId)+',ControlRoomId:'+convert(varchar,@ControlRoomId)+',CategoryId:'+convert(varchar,@CategoryId)+
		',DeviceTypeId:'+convert(varchar,@DeviceTypeId)+',DeviceName:'+@DeviceName+',Direction:'+convert(varchar,@Direction)+',IpAddress:'+@IpAddress+
		',PortNumber:'+convert(varchar,@PortNumber)+',DeviceLoginId:'+@DeviceLoginId+',DevicePassword:'+@DevicePassword+',Latitude:'+convert(varchar,@Latitude)+
		',Longitude:'+convert(varchar,@Longitude)+',ModelNumber:'+@ModelNumber+',Manufacturer:'+@Manufacturer+',Vendor:'+@Vendor+
		',Remark:'+@Remark+',PurchageDate:'+convert(varchar,@PurchageDate)+',ManufacturerDate:'+convert(varchar,@ManufacturerDate)+
		',WarrantyExpireDate:'+convert(varchar,@WarrantyExpireDate)+',GantryId:'+CONVERT(varchar,@GantryId)+',LaneNumber:'+CONVERT(varchar,@LaneNumber)+
		',Status:'+CONVERT(varchar,@DataStatus)		

		Set @PVal ='DeviceId:'+convert(varchar,@EntryId)+',ControlRoomId:'+convert(varchar,@PControlRoomId)+',CategoryId:'+convert(varchar,@PCategoryId)+
		',DeviceTypeId:'+convert(varchar,@PDeviceTypeId)+',DeviceName:'+@PDeviceName+',Direction:'+convert(varchar,@PDirection)+',IpAddress:'+@PIpAddress+
		',PortNumber:'+convert(varchar,@PPortNumber)+',DeviceLoginId:'+@PDeviceLoginId+',DevicePassword:'+@PDevicePassword+',Latitude:'+convert(varchar,@PLatitude)+
		',Longitude:'+convert(varchar,@PLongitude)+',ModelNumber:'+@PModelNumber+',Manufacturer:'+@PManufacturer+',Vendor:'+@PVendor+
		',Remark:'+@PRemark+',PurchageDate:'+convert(varchar,@PPurchageDate)+',ManufacturerDate:'+convert(varchar,@PManufacturerDate)+
		',WarrantyExpireDate:'+convert(varchar,@PWarrantyExpireDate)+',GantryId:'+CONVERT(varchar,@PGantryId)+',LaneNumber:'+CONVERT(varchar,@PLaneNumber)+
		',Status:'+CONVERT(varchar,@DataStatus)		
				
		INSERT INTO tbl_ActivityLog(UserId,PrevColumn,CurrentColumn,Action,EventId,CreatedDate)
		VALUES(@ModifiedBy,@PVal,@CVal,'Insert',@EventId,@ModifiedDate);

		INSERT INTO #Temp(AlertMessage)VALUES('success');

		END
	END
	SELECT * FROM #Temp
END
GO
/****** Object:  StoredProcedure [dbo].[USP_DeviceTypeGetAll]    Script Date: 08-07-2021 17:08:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_DeviceTypeGetAll]
AS BEGIN
	SELECT * FROM tbl_DeviceTypeMaster ORDER BY EntryId 
END
GO
/****** Object:  StoredProcedure [dbo].[USP_DeviceTypeGetAllActive]    Script Date: 08-07-2021 17:08:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_DeviceTypeGetAllActive]
AS BEGIN
	SELECT * FROM tbl_DeviceTypeMaster
	WHERE DataStatus=1
	ORDER BY EntryId 
END
GO
/****** Object:  StoredProcedure [dbo].[USP_DeviceTypeGetAllActiveByCatId]    Script Date: 08-07-2021 17:08:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_DeviceTypeGetAllActiveByCatId]
@CategoryId smallint
AS BEGIN
	SELECT * FROM tbl_DeviceTypeMaster WHERE CategoryId =@CategoryId AND DataStatus=1
	ORDER BY EntryId

END
GO
/****** Object:  StoredProcedure [dbo].[USP_DeviceTypeGetById]    Script Date: 08-07-2021 17:08:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_DeviceTypeGetById]
@EntryId smallint
AS BEGIN
	SELECT * FROM tbl_DeviceTypeMaster WHERE EntryId=@EntryId 
END
GO
/****** Object:  StoredProcedure [dbo].[USP_ECBCallEventsInsert]    Script Date: 08-07-2021 17:08:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_ECBCallEventsInsert]
(
@StartDateTime DateTime,
@CallerId bigint,
@CalleeId bigint,
@SessionId varchar(50),
@CallTypeId smallint

)
AS BEGIN
	INSERT INTO tbl_ECBCallEventsDetails(CallerId,CalleeId,CallTypeId,SessionId,StartDateTime)
	VALUES(@CallerId,@CalleeId,@CallTypeId,@SessionId,@StartDateTime)
END
GO
/****** Object:  StoredProcedure [dbo].[USP_ECBCallEventsUpdate]    Script Date: 08-07-2021 17:08:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_ECBCallEventsUpdate]
(
@EndDateTime DateTime,
@CallDuration smallint,
@CallStatusId smallint,
@SessionId varchar(50),
@RecordingFileName varchar(255)

)
AS BEGIN
	UPDATE tbl_ECBCallEventsDetails SET 
	EndDateTime=@EndDateTime,
	CallDuration=@CallDuration,
	CallStatusId=@CallStatusId,
	RecordingFileName=@RecordingFileName
	WHERE SessionId=@SessionId
END
GO
/****** Object:  StoredProcedure [dbo].[USP_ECBEventGetLatest]    Script Date: 08-07-2021 17:08:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_ECBEventGetLatest]
AS BEGIN

	SELECT TOP 100 
	E.CallerId,S.DeviceName AS [Caller],SC.ControlRoomName CallerControlRoomName,
	E.CalleeId,R.DeviceName AS Callee,RC.ControlRoomName CalleeControlRoomName,
	E.CallTypeId,CT.CallTypeName,E.SessionId,E.StartDateTime,E.EndDateTime,E.CallDuration,
	E.CallStatusId,CS.CallStatusName,RecordingFileName,
	E.DataStatus,E.CreatedDate,E.CreatedBy,E.ModifiedDate,E.ModifiedBy,E.EntryId 
	FROM tbl_ECBCallEventsDetails E 
	INNER JOIN tbl_CallTypeMaster CT ON E.CallTypeId=CT.EntryId
	INNER JOIN tbl_CallStatusMaster CS ON E.CallStatusId=CS.EntryId
	INNER JOIN tbl_DeviceDetails S ON E.CallerId=S.EntryId
	INNER JOIN tbl_ControlRoomMaster SC ON S.ControlRoomId=SC.EntryId
	INNER JOIN tbl_DeviceDetails R ON E.CalleeId=R.EntryId
	INNER JOIN tbl_ControlRoomMaster RC ON R.ControlRoomId=RC.EntryId
	ORDER BY StartDateTime DESC
END
GO
/****** Object:  StoredProcedure [dbo].[USP_GantryGetActive]    Script Date: 08-07-2021 17:08:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_GantryGetActive] 

AS
BEGIN
	Select G.EntryId,G.ControlRoomId,C.ControlRoomName,G.GantryName,G.Latitude,G.Longitude,G.DataStatus,G.CreatedDate,G.CreatedBy,G.ModifiedDate,G.ModifiedBy 
	from tbl_GantryConfiguration G INNER JOIN tbl_ControlRoomMaster C ON G.ControlRoomId=C.EntryId
	WHERE G.DataStatus=1
END


GO
/****** Object:  StoredProcedure [dbo].[USP_GantryGetAll]    Script Date: 08-07-2021 17:08:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_GantryGetAll] 

AS
BEGIN
	Select G.EntryId,G.ControlRoomId,C.ControlRoomName,G.GantryName,G.Latitude,G.Longitude,G.DataStatus,G.CreatedDate,G.CreatedBy,G.ModifiedDate,G.ModifiedBy 
	from tbl_GantryConfiguration G INNER JOIN tbl_ControlRoomMaster C ON G.ControlRoomId=C.EntryId
	
END


GO
/****** Object:  StoredProcedure [dbo].[USP_GantryGetAllActive]    Script Date: 08-07-2021 17:08:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_GantryGetAllActive] 

AS
BEGIN
Select G.EntryId,G.ControlRoomId,C.ControlRoomName,G.GantryName,G.Latitude,G.Longitude,G.DataStatus,G.CreatedDate,G.CreatedBy,G.ModifiedDate,G.ModifiedBy 
	from tbl_GantryConfiguration G INNER JOIN tbl_ControlRoomMaster C ON G.ControlRoomId=C.EntryId
	WHERE C.DataStatus=1
END


GO
/****** Object:  StoredProcedure [dbo].[USP_GantryGetbyId]    Script Date: 08-07-2021 17:08:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_GantryGetbyId] 
@EntryId int
AS
BEGIN
	Select G.EntryId,G.ControlRoomId,C.ControlRoomName,G.GantryName,G.Latitude,G.Longitude,G.DataStatus,G.CreatedDate,G.CreatedBy,G.ModifiedDate,G.ModifiedBy 
	from tbl_GantryConfiguration G INNER JOIN tbl_ControlRoomMaster C ON G.ControlRoomId=C.EntryId
	WHERE G.EntryId=@EntryId
END





GO
/****** Object:  StoredProcedure [dbo].[USP_GantryInsertUpdate]    Script Date: 08-07-2021 17:08:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_GantryInsertUpdate] 
@EntryId int,
@ControlRoomId smallint,
@GantryName varchar(100),
@Latitude	varchar(50),
@Longitude	varchar(50),
@DataStatus smallint,
@CreatedBy bigint,
@CreatedDate datetime,
@ModifiedBy bigint,
@ModifiedDate datetime
AS
BEGIN
	DECLARE @PVal varchar(4000)
	DECLARE @CVal varchar(4000)
	DECLARE @EventId smallint=3;
	CREATE TABLE #Temp(AlertMessage varchar(100))
	DECLARE @cnt int
	
	
	IF EXISTS(SELECT EntryId FROM tbl_GantryConfiguration where GantryName=@GantryName AND EntryId<>@EntryId)
	BEGIN
		INSERT INTO #Temp(AlertMessage)
		VALUES('Gantry Name Address already exists')
	END
	IF EXISTS(SELECT EntryId FROM tbl_GantryConfiguration where Latitude=@Latitude AND Latitude=@Latitude AND EntryId<>@EntryId)
	BEGIN
		INSERT INTO #Temp(AlertMessage)
		VALUES('Gantry coordinate already exists')
	END
	
	SELECT @cnt=COUNT(AlertMessage)  FROM #Temp
	IF(@cnt=0)
		BEGIN
			IF(@EntryId=0)
			BEGIN
				
				insert into tbl_GantryConfiguration(ControlRoomId,GantryName,Latitude,Longitude,DataStatus,CreatedDate,CreatedBy)
				values(@ControlRoomId,@GantryName,@Latitude,@Longitude,@DataStatus,@CreatedDate,@CreatedBy);
				SELECT @EntryId=@@IDENTITY
				
				Set @CVal ='GantryId:'+convert(varchar,@EntryId)+',GantryName:'+@GantryName+',Latitude:'+@Latitude+',Longitude:'+@Longitude+
				',Status:'+CONVERT(varchar,@DataStatus)+',ControlRoomId:'+CONVERT(varchar,@ControlRoomId)						
				
				INSERT INTO tbl_ActivityLog(UserId,CurrentColumn,Action,EventId,CreatedDate)
				VALUES(@CreatedBy,@CVal,'Insert',@EventId,@CreatedDate);
				
				INSERT INTO #Temp(AlertMessage)VALUES('success');
			END
			ELSE
			BEGIN
				DECLARE @PControlRoomId smallint				DECLARE @PGantryName varchar(100)				DECLARE @PLatitude varchar(20)
				DECLARE @PLongitude varchar(200)		DECLARE @PDataStatus smallint

				Select @PControlRoomId=ControlRoomId,@PGantryName=GantryName,@PDataStatus=DataStatus,@PLatitude=Latitude, @PLongitude=Longitude
				from tbl_GantryConfiguration where EntryId=@EntryId;

				UPDATE tbl_GantryConfiguration SET ControlRoomId=@ControlRoomId,GantryName=@GantryName,
				Latitude=@Latitude,Longitude=@Longitude,
				DataStatus=@DataStatus,ModifiedDate=@ModifiedDate,ModifiedBy=@ModifiedBy
				WHERE EntryId=@EntryId
			
				Set @CVal ='GantryId:'+convert(varchar,@EntryId)+',GantryName:'+@GantryName+',Latitude:'+@Latitude+',Longitude:'+@Longitude+
				',Status:'+CONVERT(varchar,@DataStatus)+',ControlRoomId:'+CONVERT(varchar,@ControlRoomId)		
				
				Set @PVal ='GantryId:'+convert(varchar,@EntryId)+',GantryName:'+@PGantryName+',Latitude:'+@PLatitude+',Longitude:'+@PLongitude+
				',Status:'+CONVERT(varchar,@PDataStatus)+',ControlRoomId:'+CONVERT(varchar,@PControlRoomId)		
					
				INSERT INTO tbl_ActivityLog(UserId,PrevColumn,CurrentColumn,Action,EventId,CreatedDate)
				VALUES(@ModifiedBy,@PVal,@CVal,'Update',@EventId,@ModifiedDate);

				INSERT INTO #Temp(AlertMessage)VALUES('success');
			END
		END
		select * from #Temp;
END
--GO 
--EXEC USP_GantryInsertUpdate
--@EntryId =0,
--@ClientId =1,
--@GantryName ='Gantry 1',--
--@GantryServerIpAddress ='192.168.0.1',--
--@DataSendAPI ='http://182.74.121.114:6076/VaaaN/TTE-Events/RoadSideEvents',--
--@DataReceiveAPI ='http://182.74.121.114:6076/VaaaN/TTE-Events/RoadSideEvents',--
--@FTPPath ='ftp://ftp.example.com/Batch_File',--
--@FTPLoginId ='admin',
--@FTPPassword ='admin',
--@DataStatus =1,
--@UserId =0,
--@CDateTime='2021-04-07'
GO
/****** Object:  StoredProcedure [dbo].[USP_GantryMappingGetAll]    Script Date: 08-07-2021 17:08:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_GantryMappingGetAll]
AS BEGIN
CREATE TABLE #GantryMapping(EntryId int identity,EntryGantryId int,EntryGantryName varchar(100),ExitGantryId int,ExitGantryName varchar(100),
GantryDistance decimal(18,3) DEFAULT 0,DataStatus smallint DEFAULT 1,CreatedDate datetime,CreatedBy int,ModifiedDate datetime,ModifiedBy int) 

INSERT INTO #GantryMapping(EntryGantryId,EntryGantryName,ExitGantryId,ExitGantryName)
SELECT S.EntryId,S.GantryName,D.EntryId,D.GantryName
FROM tbl_GantryConfiguration S INNER JOIN tbl_GantryConfiguration D ON S.EntryId <> D.EntryId
WHERE S.DataStatus=1 AND D.DataStatus=1
ORDER BY S.EntryId

UPDATE T SET T.GantryDistance=V.GantryDistance,T.DataStatus=V.DataStatus,
T.CreatedDate=V.CreatedDate,T.CreatedBy=V.CreatedBy,T.ModifiedDate=V.ModifiedDate,T.ModifiedBy =V.ModifiedBy
FROM #GantryMapping T  INNER JOIN 
(
SELECT EntryGantryId,ExitGantryId,ISNULL(GantryDistance,0) GantryDistance,ISNULL(DataStatus,1) DataStatus,
CreatedDate,CreatedBy,ModifiedDate,ModifiedBy 
FROM tbl_GantryMapping
) V ON T.EntryGantryId=V.EntryGantryId AND T.ExitGantryId=V.ExitGantryId 

SELECT * FROM #GantryMapping
ORDER BY GantryDistance

END

GO
/****** Object:  StoredProcedure [dbo].[USP_GantryMappingGetbyGantryId]    Script Date: 08-07-2021 17:08:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_GantryMappingGetbyGantryId]
@GantryId int
AS BEGIN
CREATE TABLE #GantryMapping(EntryId int identity,EntryGantryId int,EntryGantryName varchar(100),ExitGantryId int,ExitGantryName varchar(100),
GantryDistance decimal(18,3) DEFAULT 0,DataStatus smallint DEFAULT 1,CreatedDate datetime,CreatedBy int,ModifiedDate datetime,ModifiedBy int) 

INSERT INTO #GantryMapping(EntryGantryId,EntryGantryName,ExitGantryId,ExitGantryName)
SELECT S.EntryId,S.GantryName,D.EntryId,D.GantryName
FROM tbl_GantryConfiguration S INNER JOIN tbl_GantryConfiguration D ON S.EntryId <> D.EntryId
WHERE S.EntryId=@GantryId OR D.EntryId=@GantryId

UPDATE T SET T.GantryDistance=V.GantryDistance,T.DataStatus=V.DataStatus,
T.CreatedDate=V.CreatedDate,T.CreatedBy=V.CreatedBy,T.ModifiedDate=V.ModifiedDate,T.ModifiedBy =V.ModifiedBy
FROM #GantryMapping T  INNER JOIN 
(
SELECT EntryGantryId,ExitGantryId,ISNULL(GantryDistance,0) GantryDistance,ISNULL(DataStatus,1) DataStatus,
CreatedDate,CreatedBy,ModifiedDate,ModifiedBy 
FROM tbl_GantryMapping
) V ON T.EntryGantryId=V.EntryGantryId AND T.ExitGantryId=V.ExitGantryId 

SELECT * FROM #GantryMapping
ORDER BY EntryGantryId

END
--GO
--EXEC USP_GantryMappingGetbyGantryId
--@GantryId=1

GO
/****** Object:  StoredProcedure [dbo].[USP_GantryMappingInsertUpdate]    Script Date: 08-07-2021 17:08:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_GantryMappingInsertUpdate] 
@EntryGantryId int,
@ExitGantryId int,
@GantryDistance decimal(18,3),
@DataStatus smallint,
@UserId bigint,
@CDateTime DateTime
AS
BEGIN
	DECLARE @PVal varchar(4000)
	DECLARE @CVal varchar(4000)
	DECLARE @EventId smallint=4;
	DECLARE @cnt int
	DECLARE @RGantryDistance decimal(18,3)=0
	CREATE TABLE #Temp(AlertMessage varchar(100))

	SELECT @cnt=COUNT(1)  FROM tbl_GantryMapping WHERE EntryGantryId=@EntryGantryId AND ExitGantryId=@ExitGantryId
	IF(@cnt=0)
	BEGIN
		SET @CVal='EntryGantryId:'+convert(varchar,@EntryGantryId)+',ExitGantryId:'+convert(varchar,@ExitGantryId)
		+',GantryDistance:'+convert(varchar,@GantryDistance)+',DataStatus:'+convert(varchar,@DataStatus)
		
		INSERT INTO tbl_ActivityLog(UserId,CurrentColumn,Action,EventId,CreatedDate)
		VALUES(@UserId,@CVal,'Insert',@EventId,@CDateTime);
		insert into tbl_GantryMapping(EntryGantryId,ExitGantryId,GantryDistance,DataStatus,CreatedDate,CreatedBy)
		VALUES(@EntryGantryId,@ExitGantryId,@GantryDistance,@DataStatus,@CDateTime,@UserId)
		
		INSERT INTO #Temp(AlertMessage)VALUES('success');
	END
	ELSE
	BEGIN
		DECLARE @LGantryDistance decimal(18,3)	DECLARE @LDataStatus smallint

		Select @LGantryDistance=GantryDistance,@LDataStatus=DataStatus 
		FROM tbl_GantryMapping WHERE EntryGantryId=@EntryGantryId AND ExitGantryId=@ExitGantryId
		

		SET @CVal='EntryGantryId:'+convert(varchar,@EntryGantryId)+',ExitGantryId:'+convert(varchar,@ExitGantryId)
		+',GantryDistance:'+convert(varchar,@GantryDistance)+',DataStatus:'+convert(varchar,@DataStatus)

		SET @PVal='EntryGantryId:'+convert(varchar,@EntryGantryId)+',ExitGantryId:'+convert(varchar,@ExitGantryId)
		+',GantryDistance:'+convert(varchar,@LGantryDistance)+',DataStatus:'+convert(varchar,@LDataStatus)

		INSERT INTO tbl_ActivityLog(UserId,PrevColumn,CurrentColumn,Action,EventId,CreatedDate)
		VALUES(@UserId,@PVal,@CVal,'Update',@EventId,@CDateTime);
		
		UPDATE tbl_GantryMapping SET GantryDistance=@GantryDistance,DataStatus=@DataStatus,ModifiedBy=@UserId,ModifiedDate=@CDateTime
		WHERE EntryGantryId=@EntryGantryId AND ExitGantryId=@ExitGantryId
		INSERT INTO #Temp(AlertMessage)VALUES('success');
	END
	select * from #Temp;
END
--GO 
--EXEC USP_GantryInsertUpdate
--@EntryId =0,
--@ClientId =1,
--@GantryName ='Gantry 1',--
--@GantryServerIpAddress ='192.168.0.1',--
--@DataSendAPI ='http://182.74.121.114:6076/VaaaN/TTE-Events/RoadSideEvents',--
--@DataReceiveAPI ='http://182.74.121.114:6076/VaaaN/TTE-Events/RoadSideEvents',--
--@FTPPath ='ftp://ftp.example.com/Batch_File',--
--@FTPLoginId ='admin',
--@FTPPassword ='admin',
--@DataStatus =1,
--@UserId =0,
--@CDateTime='2021-04-07'
GO
/****** Object:  StoredProcedure [dbo].[USP_GantryMappingValidateInsertUpdate]    Script Date: 08-07-2021 17:08:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_GantryMappingValidateInsertUpdate] 
@EntryGantryId int,
@ExitGantryId int,
@GantryDistance decimal(18,3),
@DataStatus smallint,
@UserId bigint,
@CDateTime DateTime
AS
BEGIN
	DECLARE @PVal varchar(4000)
	DECLARE @CVal varchar(4000)
	DECLARE @EventId smallint=5;
	DECLARE @cnt int
	DECLARE @RGantryDistance decimal(18,3)=0
	CREATE TABLE #Temp(AlertMessage varchar(100))

	SELECT @RGantryDistance=GantryDistance FROM tbl_GantryMapping WHERE EntryGantryId=@ExitGantryId AND ExitGantryId=@EntryGantryId
	if(@RGantryDistance<>0 AND @RGantryDistance<>@GantryDistance)
	BEGIN
		INSERT INTO #Temp(AlertMessage)VALUES('Distance must be '+CONVERT(varchar,@RGantryDistance) +' KM');
	END
	
	select * from #Temp;
END
--GO 
--EXEC USP_GantryInsertUpdate
--@EntryId =0,
--@ClientId =1,
--@GantryName ='Gantry 1',--
--@GantryServerIpAddress ='192.168.0.1',--
--@DataSendAPI ='http://182.74.121.114:6076/VaaaN/TTE-Events/RoadSideEvents',--
--@DataReceiveAPI ='http://182.74.121.114:6076/VaaaN/TTE-Events/RoadSideEvents',--
--@FTPPath ='ftp://ftp.example.com/Batch_File',--
--@FTPLoginId ='admin',
--@FTPPassword ='admin',
--@DataStatus =1,
--@UserId =0,
--@CDateTime='2021-04-07'
GO
/****** Object:  StoredProcedure [dbo].[USP_GetAllCoordinates]    Script Date: 08-07-2021 17:08:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_GetAllCoordinates]
@ControlRoomId smallint
AS BEGIN
IF(@ControlRoomId=0)
BEGIN
	SELECT DISTINCT Latitude,Longitude FROM tbl_DeviceDetails 
	WHERE (Latitude IS NOT NULL OR Longitude IS NOT NULL) AND DataStatus=1 AND CategoryId=1
END
ELSE 
BEGIN
	SELECT DISTINCT Latitude,Longitude FROM tbl_DeviceDetails 
	WHERE ControlRoomId=@ControlRoomId AND DataStatus=1 AND CategoryId=1 AND (Latitude IS NOT NULL OR Longitude IS NOT NULL)
END
END
GO
/****** Object:  StoredProcedure [dbo].[USP_IncidentMasterGetAll]    Script Date: 08-07-2021 17:08:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_IncidentMasterGetAll]

AS BEGIN

	SELECT I.EntryId,IncidentName,IncidentReportDate,IncidentDate,I.IncidentCategoryId,IncidentRefNo,IncidentSourceType,IncidentSourceDevice,VehicleRegNo,
	PersonName,PhoneNo,Comments,IncidentLocation,I.Latitude,I.Longitude,I.CreatedBy,I.CreatedDate,
	I.ModifiedBy,I.ModifiedDate,IncidentStatus FROM tbl_IncidentMaster I 
	
END

GO
/****** Object:  StoredProcedure [dbo].[USP_IncidentMasterGetById]    Script Date: 08-07-2021 17:08:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_IncidentMasterGetById]
(
@EntryId bigint
)
AS BEGIN

	SELECT I.EntryId,IncidentName,IncidentReportDate,IncidentDate,I.IncidentCategoryId,IncidentRefNo,IncidentSourceType,IncidentSourceDevice,VehicleRegNo,
	PersonName,PhoneNo,Comments,IncidentLocation,I.Latitude,I.Longitude,I.CreatedBy,I.CreatedDate,
	I.ModifiedBy,I.ModifiedDate,IncidentStatus FROM tbl_IncidentMaster I WHERE I.EntryId=@EntryId
END

GO
/****** Object:  StoredProcedure [dbo].[USP_IncidentMasterInsertUpdate]    Script Date: 08-07-2021 17:08:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_IncidentMasterInsertUpdate]
(
@EntryId bigint,
@IncidentName	varchar(100),
@IncidentReportDate	datetime,
@IncidentDate	datetime,
@IncidentCategoryId	bigint,
@IncidentRefNo	varchar(100),
@IncidentSourceType	varchar(50),
@IncidentSourceDevice varchar(50),
@VehicleRegNo	varchar(50),
@PersonName varchar(100),
@PhoneNo varchar(15),
@Comments varchar(500),
@IncidentLocation varchar(50),
@Latitude	varchar(50),
@Longitude	varchar(50),
@DataStatus smallint,
@CreatedBy bigint,
@CreatedDate datetime,
@ModifiedBy bigint,
@ModifiedDate datetime
)
AS BEGIN

	CREATE TABLE #Temp(AlertMessage varchar(100))
	DECLARE @cnt int
	
	IF EXISTS(SELECT EntryId FROM tbl_IncidentMaster where IncidentName=@IncidentName AND EntryId<>@EntryId)
		BEGIN
			INSERT INTO #Temp(AlertMessage)
			VALUES('Incident name already exists!')
		END
	SELECT @cnt=COUNT(AlertMessage)  FROM #Temp
	IF(@cnt=0)
	BEGIN
		IF(@EntryId=0)
		BEGIN
			INSERT INTO tbl_IncidentMaster(IncidentName,IncidentReportDate,IncidentDate,IncidentCategoryId,
			IncidentRefNo,IncidentSourceType,IncidentSourceDevice,VehicleRegNo,PersonName,PhoneNo,Comments,IncidentLocation
			,Latitude,Longitude,IncidentStatus,CreatedBy,CreatedDate)
			VALUES(@IncidentName,@IncidentReportDate,@IncidentDate,@IncidentCategoryId,@IncidentRefNo,
			@IncidentSourceType,@IncidentSourceDevice,@VehicleRegNo,@PersonName,@PhoneNo,@Comments,@IncidentLocation,
			@Latitude,@Longitude,@DataStatus,@CreatedBy,@CreatedDate)
			SELECT @EntryId=@@IDENTITY
			INSERT INTO #Temp(AlertMessage)VALUES('success');
		END
		ELSE
		BEGIN
			UPDATE tbl_IncidentMaster 
			SET IncidentName= @IncidentName,
			IncidentReportDate=@IncidentReportDate,
			IncidentDate=@IncidentDate,
			IncidentCategoryId=@IncidentCategoryId,
			IncidentRefNo=@IncidentRefNo,
			IncidentSourceType=@IncidentSourceType,
			IncidentSourceDevice=@IncidentSourceDevice,
			VehicleRegNo=@VehicleRegNo,
			PersonName=@PersonName,
			PhoneNo=@PhoneNo,
			Comments=@Comments,
			IncidentLocation=@IncidentLocation,
			Latitude=@Latitude,
			Longitude=@Longitude,
			ModifiedBy=@ModifiedBy,
			ModifiedDate=@ModifiedDate,
			IncidentStatus=@DataStatus
			WHERE EntryId=@EntryId
			INSERT INTO #Temp(AlertMessage)VALUES('success');
		END
	END
	SELECT * FROM #Temp
END

GO
/****** Object:  StoredProcedure [dbo].[USP_LaneGetAll]    Script Date: 08-07-2021 17:08:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_LaneGetAll] 

AS
BEGIN
	SELECT L.EntryId,L.ControlRoomId,C.ControlRoomName,L.GantryId,G.GantryName,L.LaneNumber,
	L.LaneDirection,L.DataStatus,L.CreatedDate,L.CreatedBy,L.ModifiedDate,L.ModifiedBy 
	FROM tbl_LaneConfiguration L 
	INNER JOIN tbl_ControlRoomMaster C ON L.ControlRoomId=C.EntryId 
	INNER JOIN tbl_GantryConfiguration G ON L.GantryId=G.EntryId 
END


GO
/****** Object:  StoredProcedure [dbo].[USP_LaneGetAllActive]    Script Date: 08-07-2021 17:08:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_LaneGetAllActive] 

AS
BEGIN
	SELECT L.EntryId,L.ControlRoomId,C.ControlRoomName,L.GantryId,G.GantryName,L.LaneNumber,
	L.LaneDirection,L.DataStatus,L.CreatedDate,L.CreatedBy,L.ModifiedDate,L.ModifiedBy 
	FROM tbl_LaneConfiguration L 
	INNER JOIN tbl_ControlRoomMaster C ON L.ControlRoomId=C.EntryId AND C.DataStatus=1
	INNER JOIN tbl_GantryConfiguration G ON L.GantryId=G.EntryId AND G.DataStatus=1
END


GO
/****** Object:  StoredProcedure [dbo].[USP_LaneGetByGantryIdActive]    Script Date: 08-07-2021 17:08:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_LaneGetByGantryIdActive] 
@GantryId smallint
AS
BEGIN
	SELECT L.EntryId,L.ControlRoomId,C.ControlRoomName,L.GantryId,G.GantryName,L.LaneNumber,
	L.LaneDirection,L.DataStatus,L.CreatedDate,L.CreatedBy,L.ModifiedDate,L.ModifiedBy 
	FROM tbl_LaneConfiguration L 
	INNER JOIN tbl_ControlRoomMaster C ON L.ControlRoomId=C.EntryId AND C.DataStatus=1
	INNER JOIN tbl_GantryConfiguration G ON L.GantryId=G.EntryId AND G.DataStatus=1
	WHERE L.GantryId=@GantryId
END


GO
/****** Object:  StoredProcedure [dbo].[USP_LaneGetbyId]    Script Date: 08-07-2021 17:08:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_LaneGetbyId] 
@EntryId int
AS
BEGIN
	SELECT L.EntryId,L.ControlRoomId,C.ControlRoomName,L.GantryId,G.GantryName,L.LaneNumber,
	L.LaneDirection,L.DataStatus,L.CreatedDate,L.CreatedBy,L.ModifiedDate,L.ModifiedBy 
	FROM tbl_LaneConfiguration L 
	INNER JOIN tbl_ControlRoomMaster C ON L.ControlRoomId=C.EntryId 
	INNER JOIN tbl_GantryConfiguration G ON L.GantryId=G.EntryId 
	WHERE L.EntryId=@EntryId
END


GO
/****** Object:  StoredProcedure [dbo].[USP_LaneInsertUpdate]    Script Date: 08-07-2021 17:08:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_LaneInsertUpdate] 
@EntryId bigint,
@ControlRoomId smallint,
@GantryId int,
@LaneNumber smallint,
@LaneDirection smallint,
@DataStatus smallint,
@CreatedBy bigint,
@CreatedDate DateTime,
@ModifiedBy bigint,
@ModifiedDate DateTime
AS
BEGIN
	DECLARE @EventId smallint=5;
	DECLARE @PVal varchar(4000)
	DECLARE @CVal varchar(4000)
	DECLARE @cnt int
	CREATE TABLE #Temp(AlertMessage varchar(100))
	IF EXISTS(SELECT EntryId FROM tbl_LaneConfiguration where GantryId=@GantryId AND LaneNumber=@LaneNumber AND EntryId<>@EntryId)
	BEGIN
		INSERT INTO #Temp(AlertMessage)
		VALUES('Lane Number already exists')
	END

	SELECT @cnt=COUNT(AlertMessage)  FROM #Temp
	IF(@cnt=0)
		BEGIN
			IF(@EntryId=0)
			BEGIN
				
				insert into tbl_LaneConfiguration(ControlRoomId,GantryId,LaneNumber,LaneDirection,DataStatus,CreatedDate,CreatedBy)
				values(@ControlRoomId,@GantryId,@LaneNumber,@LaneDirection,@DataStatus,@CreatedDate,@CreatedBy);
				SELECT @EntryId=@@IDENTITY
				
				Set @CVal ='LaneId:'+convert(varchar,@EntryId)+',Number:'+CONVERT(varchar,@LaneNumber)+
				',Direction:'+CONVERT(varchar,@LaneDirection)+',Status:'+
				CONVERT(varchar,@DataStatus)+',ControlRoomId:'+CONVERT(varchar,@ControlRoomId)+',GantryId:'+CONVERT(varchar,@GantryId)						
				
				INSERT INTO tbl_ActivityLog(UserId,CurrentColumn,Action,EventId,CreatedDate)
				VALUES(@CreatedBy,@CVal,'Insert',@EventId,@CreatedDate);
				
				INSERT INTO #Temp(AlertMessage)VALUES('success');
			END
			ELSE
			BEGIN
				DECLARE @LControlRoomId smallint		DECLARE @LGantryId int							DECLARE @LLaneNumber smallint
				DECLARE @LLaneType smallint				DECLARE @LLaneDirection smallint				DECLARE @LLaneName varchar(200)
				DECLARE @LLaneIP varchar(20)			DECLARE @LDataStatus smallint					DECLARE @LLaneFor smallint

				Select @LControlRoomId=ControlRoomId,@LGantryId=GantryId,@LLaneNumber=LaneNumber,
				@LLaneDirection=LaneDirection,@LDataStatus=DataStatus 
				from tbl_LaneConfiguration where EntryId=@EntryId;
				
				UPDATE tbl_LaneConfiguration SET ControlRoomId=@ControlRoomId,GantryId=@GantryId,LaneNumber=@LaneNumber,
				LaneDirection=@LaneDirection,DataStatus=@DataStatus,ModifiedDate=@ModifiedDate,ModifiedBy=@ModifiedBy
				WHERE EntryId=@EntryId
			
				Set @CVal ='LaneId:'+convert(varchar,@EntryId)+',Number:'+CONVERT(varchar,@LaneNumber)+
				',Direction:'+CONVERT(varchar,@LaneDirection)+',Status:'+
				CONVERT(varchar,@DataStatus)+',ControlRoomId:'+CONVERT(varchar,@ControlRoomId)+',GantryId:'+CONVERT(varchar,@GantryId)
				
				Set @PVal ='LaneId:'+convert(varchar,@EntryId)+',Number:'+CONVERT(varchar,@LLaneNumber)+
				',Direction:'+CONVERT(varchar,@LLaneDirection)+',Status:'+CONVERT(varchar,@LDataStatus)+',ControlRoomId:'+CONVERT(varchar,@LControlRoomId)+',GantryId:'+CONVERT(varchar,@LGantryId)
					
				INSERT INTO tbl_ActivityLog(UserId,PrevColumn,CurrentColumn,Action,EventId,CreatedDate)
				VALUES(@ModifiedBy,@PVal,@CVal,'Update',@EventId,@ModifiedDate);

				INSERT INTO #Temp(AlertMessage)VALUES('success');
			END
		END
		select * from #Temp;
END
--GO 
--EXEC USP_PlazaInsertUpdate
--@EntryId =0,
--@ClientId =1,
--@PlazaName ='Plaza 1',--
--@PlazaServerIpAddress ='192.168.0.1',--
--@DataSendAPI ='http://182.74.121.114:6076/VaaaN/TTE-Events/RoadSideEvents',--
--@DataReceiveAPI ='http://182.74.121.114:6076/VaaaN/TTE-Events/RoadSideEvents',--
--@FTPPath ='ftp://ftp.example.com/Batch_File',--
--@FTPLoginId ='admin',
--@FTPPassword ='admin',
--@DataStatus =1,
--@UserId =0,
--@CDateTime='2021-04-07'
GO
/****** Object:  StoredProcedure [dbo].[USP_LocationInsertUpdate]    Script Date: 08-07-2021 17:08:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_LocationInsertUpdate]
(
@EntryId int,
@TmsId int,
@LocationName varchar(100),
@MappingData varchar(max)
)
AS BEGIN
	CREATE TABLE #Temp(AlertMessage varchar(100))
	Declare @XMLMappingData XML;
	Set @XMLMappingData = @MappingData;
	CREATE TABLE #TempMappingData(HardwareId int,IntegrationMethodologyId smallint)
	insert into #TempMappingData(HardwareId,IntegrationMethodologyId)
	SELECT  doc.col.value('HardwareId[1]', 'int'),doc.col.value('IntegrationMethodologyId[1]', 'smallint')
	FROM    @XMLMappingData.nodes('/ nodes / node') as doc ( col );
	IF EXISTS(SELECT TmsId FROM tbl_LocationConfiguration where LocationName=@LocationName  AND TmsId=@TmsId AND EntryId<>@EntryId)
		BEGIN
			INSERT INTO #Temp(AlertMessage)
			VALUES('Site Name already exists!')
		END
	DECLARE @cnt int
	SELECT @cnt=COUNT(AlertMessage)  FROM #Temp
	IF(@cnt=0)
	BEGIN
		IF(@EntryId=0)
		BEGIN
			INSERT INTO tbl_LocationConfiguration (TmsId,LocationName) 
			VALUES(@TmsId,@LocationName);
			SELECT @EntryId=@@IDENTITY

			INSERT INTO tbl_HardwareTypeMapping(TmsId,LocationId,HardwareId,IntegrationMethodologyId,DataStatus)
			SELECT @TmsId,@EntryId,HardwareId,IntegrationMethodologyId,1 FROM #TempMappingData
			INSERT INTO #Temp(AlertMessage)VALUES('success');
		END
		ELSE
		BEGIN
			UPDATE tbl_LocationConfiguration 
			SET LocationName=@LocationName
			WHERE TmsId=@TmsId AND EntryId=@EntryId
			UPDATE tbl_HardwareTypeMapping SET DataStatus=2 WHERE TmsId=@TmsId AND LocationId=@EntryId
			UPDATE T SET DataStatus=1
			FROM tbl_HardwareTypeMapping t INNER JOIN
			(
				SELECT HardwareId,IntegrationMethodologyId FROM #TempMappingData 
			) V ON T.HardwareId =V.HardwareId AND T.LocationId=@EntryId AND T.TmsId=@TmsId
			
			INSERT INTO tbl_HardwareTypeMapping(TmsId,LocationId,HardwareId,IntegrationMethodologyId,DataStatus)
			SELECT @TmsId,@EntryId,HardwareId,IntegrationMethodologyId,1 FROM #TempMappingData
			WHERE HardwareId NOT IN 
			(SELECT HardwareId FROM tbl_HardwareTypeMapping WHERE LocationId=@EntryId AND TmsId=@TmsId)
			DELETE FROM tbl_HardwareTypeMapping WHERE TmsId=@TmsId AND LocationId=@EntryId AND DataStatus=2
			INSERT INTO #Temp(AlertMessage)VALUES('success');
		END


		
	END
	SELECT * FROM #Temp
END
GO
/****** Object:  StoredProcedure [dbo].[USP_LogingActivityInsert]    Script Date: 08-07-2021 17:08:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[USP_LogingActivityInsert]
(
@LoginId varchar(20),
@PlazaId smallint,
@LaneNumber smallint,
@LoginStatus smallint,
@LaneTransId bigint,
@CreatedDate datetime
)
AS BEGIN
	INSERT INTO tbl_LogingActivity(LoginId,PlazaId,LaneNumber,LoginStatus,LaneTransId,CreatedDate)
	VALUES(@LoginId,@PlazaId,@LaneNumber,@LoginStatus,@LaneTransId,@CreatedDate)
END
GO
/****** Object:  StoredProcedure [dbo].[USP_MenuGetByRoleId]    Script Date: 08-07-2021 17:08:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_MenuGetByRoleId]
@RoleId bigint
AS BEGIN
	
	CREATE table #TempPermission (EventId bigint,EventName varchar(100),RoleId bigint,DataView Smallint,DataAdd Smallint,
	DataUpdate smallint,DataStatus smallint,CreatedDate datetime,CreatedBy int,ModifiedDate datetime,ModifiedBy int)
	INSERT INTO #TempPermission(EventId) values(0)
	
	INSERT INTO #TempPermission(EventId,EventName,RoleId,DataView,DataAdd,DataUpdate,DataStatus,CreatedDate,CreatedBy,ModifiedDate,ModifiedBy)
	SELECT RP.EventId,PM.EventName,RP.RoleId,RP.DataView,RP.DataAdd,RP.DataUpdate,RP.DataStatus,
	RP.CreatedDate,RP.CreatedBy,RP.ModifiedDate,RP.ModifiedBy
	FROM tbl_RolePermission RP  INNER JOIN tbl_PermissionMaster PM ON RP.EventId=PM.EntryId AND RP.DataView=1
	WHERE RP.RoleId=@RoleId
	ORDER BY RP.EventId
	
	SELECT M.EntryId,M.MenuName,M.MenuURL,M.MenuIcon,M.OderBy,M.ParentId,M.MennuAccess,M.EventId,
	M.DataStatus,M.CreatedDate,M.CreatedBy,M.ModifiedDate,M.ModifiedBy
    FROM tbl_MenuMaster M
	WHERE M.EventId IN (SELECT EventId FROM #TempPermission) AND M.DataStatus=1
	ORDER BY OderBy
END

--GO
--EXEC USP_MenuGetByRoleId
--@RoleId=2

GO
/****** Object:  StoredProcedure [dbo].[USP_MenuGetCC]    Script Date: 08-07-2021 17:08:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_MenuGetCC]
AS BEGIN
	SELECT M.EntryId,M.MenuName,M.MenuURL,M.MenuIcon,M.OderBy,M.ParentId,M.MennuAccess,M.EventId,
	M.DataStatus,M.CreatedDate,M.CreatedBy,M.ModifiedDate,M.ModifiedBy
    FROM tbl_MenuMaster M
	WHERE M.MennuAccess<>2 AND M.DataStatus=1
	ORDER BY OderBy
END

--GO
--EXEC USP_UsersGetByLoginId
--@LoginId='admin'

GO
/****** Object:  StoredProcedure [dbo].[USP_METConfigurationGet]    Script Date: 08-07-2021 17:08:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_METConfigurationGet]
AS BEGIN

	SELECT M.EntryId,M.AirTemperatureMin,M.AirTemperatureMax,M.HumidityRH,M.HumidityAH,M.Visibility,M.RoadTemperature,
	M.WindDirectionValue,M.WindSpeedValue,M.RainValue,SynchronizeTime,
	M.DataStatus,M.CreatedDate,M.CreatedBy,M.ModifiedDate,M.ModifiedBy 
	FROM tbl_METConfiguration M 
END
GO
/****** Object:  StoredProcedure [dbo].[USP_METConfigurationInsertUpdate]    Script Date: 08-07-2021 17:08:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_METConfigurationInsertUpdate] 
@AirTemperatureMin	decimal(6,2),
@AirTemperatureMax	decimal(6,2),
@HumidityRH	decimal(6,2),
@HumidityAH	decimal(6,2),
@Visibility	decimal(8,2),
@RoadTemperature	decimal(6,2),
@WindDirectionValue	decimal(6,2),
@WindSpeedValue	decimal(6,2),
@RainValue	decimal(6,2),
@SynchronizeTime smallint,
@CreatedBy bigint,
@CreatedDate datetime,
@ModifiedBy bigint,
@ModifiedDate datetime
AS
BEGIN
	DECLARE @PVal varchar(4000)
	DECLARE @CVal varchar(4000)
	DECLARE @EventId smallint=10;
	CREATE TABLE #Temp(AlertMessage varchar(100))
	DECLARE @EntryId int
	SELECT @EntryId=MAX(EntryId) FROM tbl_METConfiguration
	SET @EntryId=ISNULL(@EntryId,0)
	IF(@EntryId=0)
	BEGIN
		insert into tbl_METConfiguration(AirTemperatureMin,AirTemperatureMax,HumidityRH,HumidityAH,Visibility,RoadTemperature,
		WindDirectionValue,WindSpeedValue,RainValue,SynchronizeTime)
		values(@AirTemperatureMin,@AirTemperatureMax,@HumidityRH,@HumidityAH,@Visibility,@RoadTemperature,
		@WindDirectionValue,@WindSpeedValue,@RainValue,@SynchronizeTime);

		Set @CVal ='AirTemperatureMin:'+convert(varchar,@AirTemperatureMin)+',AirTemperatureMax:'+convert(varchar,@AirTemperatureMax)+
		',HumidityRH:'+convert(varchar,@HumidityRH)+',HumidityAH:'+convert(varchar,@HumidityAH)+',Visibility:'+convert(varchar,@Visibility)+
		',RoadTemperature:'+convert(varchar,@RoadTemperature)+',WindDirectionValue:'+convert(varchar,@WindDirectionValue)+
		',WindSpeedValue:'+convert(varchar,@WindSpeedValue)+',RainValue:'+convert(varchar,@RainValue)+
		',SynchronizeTime:'+CONVERT(varchar,@SynchronizeTime)			
				
		INSERT INTO tbl_ActivityLog(UserId,CurrentColumn,Action,EventId,CreatedDate)
		VALUES(@CreatedBy,@CVal,'Insert',@EventId,@CreatedDate);
				
		INSERT INTO #Temp(AlertMessage)VALUES('success');
	END
	ELSE
	BEGIN

		DECLARE @PAirTemperatureMin	decimal(6,2)		DECLARE @PAirTemperatureMax	decimal(6,2)		DECLARE @PHumidityRH decimal(6,2)
		DECLARE @PHumidityAH decimal(6,2)				DECLARE @PVisibility decimal(8,2)				DECLARE @PRoadTemperature decimal(6,2)
		DECLARE @PWindDirectionValue decimal(6,2)		DECLARE @PWindSpeedValue decimal(6,2)			DECLARE @PRainValue	decimal(6,2)
		DECLARE @PSynchronizeTime smallint

		Select  
		@PAirTemperatureMin=AirTemperatureMin,
		@PAirTemperatureMax=AirTemperatureMax,
		@PHumidityRH=HumidityRH,
		@PHumidityAH=HumidityAH,
		@PVisibility=Visibility,
		@PRoadTemperature=RoadTemperature,
		@PWindDirectionValue=WindDirectionValue,
		@PWindSpeedValue=WindSpeedValue,
		@PRainValue=RainValue,
		@PSynchronizeTime=SynchronizeTime
		from tbl_METConfiguration where EntryId=@EntryId;

		UPDATE tbl_METConfiguration SET 
		AirTemperatureMin=@AirTemperatureMin,
		AirTemperatureMax=@AirTemperatureMax,
		HumidityRH=@HumidityRH,
		HumidityAH=@HumidityAH,
		Visibility=@Visibility,
		RoadTemperature=@RoadTemperature,
		WindDirectionValue=@WindDirectionValue,
		WindSpeedValue=@WindSpeedValue,
		RainValue=@RainValue,
		SynchronizeTime=@SynchronizeTime,
		ModifiedDate=@ModifiedDate,
		ModifiedBy=@ModifiedBy
		WHERE EntryId=@EntryId
			
		Set @CVal ='AirTemperatureMin:'+convert(varchar,@AirTemperatureMin)+',AirTemperatureMax:'+convert(varchar,@AirTemperatureMax)+
		',HumidityRH:'+convert(varchar,@HumidityRH)+',HumidityAH:'+convert(varchar,@HumidityAH)+',Visibility:'+convert(varchar,@Visibility)+
		',RoadTemperature:'+convert(varchar,@RoadTemperature)+',WindDirectionValue:'+convert(varchar,@WindDirectionValue)+
		',WindSpeedValue:'+convert(varchar,@WindSpeedValue)+',RainValue:'+convert(varchar,@RainValue)+
		',SynchronizeTime:'+CONVERT(varchar,@SynchronizeTime)	
				
		Set @PVal ='AirTemperatureMin:'+convert(varchar,@AirTemperatureMin)+',AirTemperatureMax:'+convert(varchar,@AirTemperatureMax)+
		',HumidityRH:'+convert(varchar,@HumidityRH)+',HumidityAH:'+convert(varchar,@HumidityAH)+',Visibility:'+convert(varchar,@Visibility)+
		',RoadTemperature:'+convert(varchar,@RoadTemperature)+',WindDirectionValue:'+convert(varchar,@WindDirectionValue)+
		',WindSpeedValue:'+convert(varchar,@WindSpeedValue)+',RainValue:'+convert(varchar,@RainValue)+
		',SynchronizeTime:'+CONVERT(varchar,@SynchronizeTime)	
					
		INSERT INTO tbl_ActivityLog(UserId,PrevColumn,CurrentColumn,Action,EventId,CreatedDate)
		VALUES(@ModifiedBy,@PVal,@CVal,'Update',@EventId,@ModifiedDate);

		INSERT INTO #Temp(AlertMessage)VALUES('success');
	END
	select * from #Temp;
END


GO
/****** Object:  StoredProcedure [dbo].[USP_METEventGetLatest]    Script Date: 08-07-2021 17:08:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_METEventGetLatest]
AS BEGIN

	SELECT TOP 100 M.EntryId,M.EventDateTime,M.MetId,D.DeviceName,C.ControlRoomName,M.AirTemperature,M.HumidityRH,M.HumidityAH,M.Visibility,M.RoadTemperature,
	M.WindDirectionValue,M.WindDirection,M.WindSpeedValue,M.WindSpeedMeasurement,M.RainValue,M.RainMeasurement,M.AlertRequired,
	M.DataStatus,M.CreatedDate,M.CreatedBy,M.ModifiedDate,M.ModifiedBy 
	FROM tbl_METEventsDetails M 
	INNER JOIN tbl_DeviceDetails D ON M.MetId=D.EntryId
	INNER JOIN tbl_ControlRoomMaster C ON D.ControlRoomId=C.EntryId
	ORDER BY EventDateTime DESC
END
GO
/****** Object:  StoredProcedure [dbo].[USP_METEventsInsertUpdate]    Script Date: 08-07-2021 17:08:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_METEventsInsertUpdate] 
@EventDateTime DateTime,
@MetId	bigint,
@AirTemperature	decimal(6,2),
@HumidityRH	decimal(6,2),
@HumidityAH	decimal(6,2),
@Visibility	decimal(8,2),
@RoadTemperature	decimal(6,2),
@WindDirectionValue	decimal(6,2),
@WindDirection	varchar(10),
@WindSpeedValue	decimal(6,2),
@WindSpeedMeasurement	varchar(10),
@RainValue	decimal(6,2),
@RainMeasurement	varchar(10),
@AlertRequired	smallint
AS
BEGIN
		CREATE TABLE #Temp(AlertMessage varchar(100))
		insert into tbl_METEventsDetails(EventDateTime,MetId,AirTemperature,HumidityRH,HumidityAH,Visibility,RoadTemperature,
		WindDirectionValue,WindDirection,WindSpeedValue,WindSpeedMeasurement,RainValue,RainMeasurement,AlertRequired)
		values(@EventDateTime,@MetId,@AirTemperature,@HumidityRH,@HumidityAH,@Visibility,@RoadTemperature,
		@WindDirectionValue,@WindDirection,@WindSpeedValue,@WindSpeedMeasurement,@RainValue,@RainMeasurement,@AlertRequired);
		INSERT INTO #Temp(AlertMessage)VALUES('success');
		select * from #Temp;
END


GO
/****** Object:  StoredProcedure [dbo].[USP_RoleInsertUpdate]    Script Date: 08-07-2021 17:08:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_RoleInsertUpdate] 
@EntryId bigint,
@ClientId smallint,
@PlazaId smallint,
@RoleName varchar(200),
@DataStatus smallint,
@UserId bigint,
@CDateTime DateTime

AS
BEGIN
	DECLARE @PVal varchar(4000)
	DECLARE @CVal varchar(4000)
	DECLARE @EventId smallint=10;
	CREATE TABLE #Temp(AlertMessage varchar(100))
	DECLARE @cnt int
	IF EXISTS(SELECT EntryId FROM tbl_RoleMaster where RoleName=@RoleName and EntryId<>@EntryId)
		BEGIN
			INSERT INTO #Temp(AlertMessage)
			VALUES('Role name already exists!')
		END
	IF(@EntryId<>0 AND @DataStatus<>1)
	BEGIN
		IF EXISTS(SELECT RoleId FROM tbl_UserMaster where RoleId=@EntryId AND DataStatus=1)
		BEGIN
			INSERT INTO #Temp(AlertMessage)
			VALUES('Role cannot inactive due to users already conncted!')
		END	
	END
	SELECT @cnt=COUNT(AlertMessage)  FROM #Temp
	IF(@cnt=0)
		BEGIN
			IF(@EntryId=0)
			BEGIN
				insert into tbl_RoleMaster(ClientId,PlazaId,RoleName,DataStatus,CreatedDate,CreatedBy)
				values(@ClientId,@PlazaId,@RoleName,@DataStatus,@CDateTime,@UserId);
				SELECT @EntryId=@@IDENTITY
				
				Set @CVal ='RoleId:'+convert(varchar,@EntryId)+',RoleName:'+@RoleName+',Status:'+CONVERT(varchar,@DataStatus)
				+',ClientId:'+CONVERT(varchar,@ClientId)+',PlazaId:'+CONVERT(varchar,@PlazaId)				
				
				INSERT INTO tbl_ActivityLog(UserId,CurrentColumn,Action,EventId,CreatedDate)
				VALUES(@UserId,@CVal,'Insert',@EventId,@CDateTime);
				
				INSERT INTO #Temp(AlertMessage)VALUES('success');
			END
			ELSE
			BEGIN
				Declare @LClientId smallint			Declare @LPlazaId smallint			
				Declare @LRoleName varchar(200)	Declare @LDataStatus smallint
			
				Select @LClientId=ClientId,@LPlazaId=PlazaId,@LRoleName=RoleName,@LDataStatus=DataStatus
				from tbl_RoleMaster where EntryId=@EntryId;

				UPDATE tbl_RoleMaster SET ClientId=@ClientId,PlazaId=@PlazaId,RoleName=@RoleName,
				DataStatus=@DataStatus,ModifiedDate=@CDateTime,ModifiedBy=@UserId
				WHERE EntryId=@EntryId
			
				Set @CVal ='RoleId:'+convert(varchar,@EntryId)+',RoleName:'+@RoleName+',Status:'+CONVERT(varchar,@DataStatus)
					+',ClientId:'+CONVERT(varchar,@ClientId)+',PlazaId:'+CONVERT(varchar,@PlazaId)		
				Set @PVal ='RoleId:'+convert(varchar,@EntryId)+',RoleName:'+@LRoleName+',Status:'+CONVERT(varchar,@LDataStatus)
					+',ClientId:'+CONVERT(varchar,@LClientId)+',PlazaId:'+CONVERT(varchar,@LPlazaId)
					
				INSERT INTO tbl_ActivityLog(UserId,PrevColumn,CurrentColumn,Action,EventId,CreatedDate)
				VALUES(@UserId,@PVal,@CVal,'Update',@EventId,@CDateTime);

				INSERT INTO #Temp(AlertMessage)VALUES('success');
			END
		END
		select * from #Temp;
END


GO
/****** Object:  StoredProcedure [dbo].[USP_RolePermissionInsertUpdate]    Script Date: 08-07-2021 17:08:10 ******/
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
	DECLARE @EventId smallint=10;
	CREATE TABLE #Temp(AlertMessage varchar(100))
	
	CREATE table #TempUpload (EventId bigint,EventName varchar(100),RoleId bigint,DataView Smallint,DataAdd Smallint,
	DataUpdate smallint,DataStatus smallint,CreatedDate datetime,CreatedBy int,ModifiedDate datetime,ModifiedBy int)
	
	INSERT INTO #TempUpload(EventId,RoleId,DataView,DataAdd,DataUpdate,DataStatus)
	SELECT EventId,@RoleId,ISNULL(DataView,0),ISNULL(DataAdd,''),ISNULL(DataUpdate,''),1
	FROM tbl_TempImportPermission WHERE SessionId=@SessionId
	DELETE FROM tbl_TempImportPermission WHERE SessionId=@SessionId
	
	DELETE FROM tbl_RolePermission WHERE RoleId=@RoleId
	INSERT INTO tbl_RolePermission(ClientId,EventId,RoleId,DataView,DataAdd,DataUpdate,DataStatus,CreatedDate,CreatedBy,ModifiedDate,ModifiedBy)
	SELECT 0,EventId,RoleId,DataView,DataAdd,DataUpdate,DataStatus,@CDateTime,@UserId,@CDateTime,@UserId
	FROM #TempUpload
	
	INSERT INTO tbl_ActivityLog(UserId,Action,EventId,CreatedDate)
	VALUES(@UserId,'Permission',@EventId,@CDateTime);
	INSERT INTO #Temp(AlertMessage)VALUES('success');
	select * from #Temp;
END
--GO 
--EXEC USP_AVCVehicleClassUpload
--@FileName ='ABC',
--@SessionId='MO71EKB5ED',
--@ClientId =0,
--@DataStatus =1,
--@UserId =0,
--@CDateTime='2021-04-07'
GO
/****** Object:  StoredProcedure [dbo].[USP_RolesGetActive]    Script Date: 08-07-2021 17:08:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_RolesGetActive]

AS BEGIN
	--SELECT R.EntryId,RoleName,R.DataStatus,R.CreatedDate,R.CreatedBy,R.ModifiedDate,R.ModifiedBy,
	--CASE COUNT(EventId) WHEN 0 THEN 'Not set' ELSE 'Set' END PermissionStatus  
	--FROM tbl_RoleMaster R LEFT JOIN tbl_RolePermission P ON R.EntryId=P.RoleId where R.DataStatus<>0
	--GROUP BY  R.EntryId,RoleName,R.DataStatus,R.CreatedDate,R.CreatedBy,R.ModifiedDate,R.ModifiedBy

	SELECT EntryId,ClientId,PlazaId,RoleName,DataStatus,CreatedDate,CreatedBy,ModifiedDate,ModifiedBy FROM tbl_RoleMaster 
	WHERE DataStatus=1
	ORDER BY ModifiedDate DESC,CreatedDate DESC
END



GO
/****** Object:  StoredProcedure [dbo].[USP_RolesGetAll]    Script Date: 08-07-2021 17:08:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[USP_RolesGetAll]

AS BEGIN
	SELECT EntryId,ClientId,PlazaId,RoleName,DataStatus,CreatedDate,CreatedBy,ModifiedDate,ModifiedBy FROM tbl_RoleMaster 
	ORDER BY ModifiedDate DESC,CreatedDate DESC
END



GO
/****** Object:  StoredProcedure [dbo].[USP_RolesGetById]    Script Date: 08-07-2021 17:08:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[USP_RolesGetById]
@EntryId int
AS BEGIN
	SELECT EntryId,ClientId,PlazaId,RoleName,DataStatus,CreatedDate,CreatedBy,ModifiedDate,ModifiedBy	
	FROM tbl_RoleMaster where EntryId=@EntryId
END
GO
/****** Object:  StoredProcedure [dbo].[USP_RolesPersmissionGetByEventId]    Script Date: 08-07-2021 17:08:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_RolesPersmissionGetByEventId]
@EventId bigint,
@RoleId bigint

AS BEGIN

	CREATE table #Temp (EventId bigint,EventName varchar(100),RoleId bigint,DataView Smallint,DataAdd Smallint,
	DataUpdate smallint,DataStatus smallint,CreatedDate datetime,CreatedBy int,ModifiedDate datetime,ModifiedBy int)

	IF EXISTS (SELECT EventId FROM  tbl_RolePermission WHERE RoleId=@RoleId)
	BEGIN
		INSERT INTO #Temp(EventId,EventName,RoleId,DataView,DataAdd,DataUpdate,DataStatus,CreatedDate,CreatedBy,ModifiedDate,ModifiedBy)
		SELECT RP.EventId,PM.EventName,RP.RoleId,RP.DataView,RP.DataAdd,RP.DataUpdate,RP.DataStatus,
		RP.CreatedDate,RP.CreatedBy,RP.ModifiedDate,RP.ModifiedBy
		FROM tbl_RolePermission RP  INNER JOIN tbl_PermissionMaster PM ON RP.EventId=PM.EntryId
		WHERE RP.RoleId=@RoleId
		ORDER BY RP.EventId
		
	END
	ELSE
	BEGIN
		INSERT INTO #Temp(EventId,EventName,RoleId,DataView,DataAdd,DataUpdate,DataStatus)
		SELECT EntryId,EventName,@RoleId,DataView,DataAdd,DataUpdate,DataStatus
		FROM tbl_PermissionMaster
		ORDER BY EntryId
		if(@RoleId<>0)
		BEGIN
			UPDATE #Temp SET DataView=0 WHERE DataView=1;
			UPDATE #Temp SET DataAdd=0 WHERE DataAdd=1;
			UPDATE #Temp SET DataUpdate=0 WHERE DataUpdate=1;
		END
		ELSE
		BEGIN
			UPDATE #Temp SET DataView=1 WHERE DataView=2;
			UPDATE #Temp SET DataAdd=1 WHERE DataAdd=2;
			UPDATE #Temp SET DataUpdate=1 WHERE DataUpdate=2;
		END
	END

	SELECT * FROM #Temp 
	WHERE EventId=@EventId AND RoleId=@RoleId
END

--GO
--EXEC USP_RolesPersmissionGetByRoleId
--@RoleId=1
GO
/****** Object:  StoredProcedure [dbo].[USP_RolesPersmissionGetByRoleId]    Script Date: 08-07-2021 17:08:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_RolesPersmissionGetByRoleId]
@RoleId bigint
AS BEGIN

	CREATE table #Temp (EventId bigint,EventName varchar(100),RoleId bigint,DataView Smallint,DataAdd Smallint,
	DataUpdate smallint,DataStatus smallint,CreatedDate datetime,CreatedBy int,ModifiedDate datetime,ModifiedBy int)

	INSERT INTO #Temp(EventId,EventName,RoleId,DataView,DataAdd,DataUpdate,DataStatus)
	SELECT EntryId,EventName,@RoleId,DataView,DataAdd,DataUpdate,DataStatus
	FROM tbl_PermissionMaster
	if(@RoleId<>0)
		BEGIN
			UPDATE #Temp SET DataView=0 WHERE DataView=1;
			UPDATE #Temp SET DataAdd=0 WHERE DataAdd=1;
			UPDATE #Temp SET DataUpdate=0 WHERE DataUpdate=1;
		END


	IF EXISTS (SELECT EventId FROM  tbl_RolePermission WHERE RoleId=@RoleId)
	BEGIN
		UPDATE T SET T.DataView=V.DataView,T.DataAdd=V.DataAdd,T.DataUpdate=V.DataUpdate FROM #Temp T 
		INNER JOIN (
		--INSERT INTO #Temp(EventId,EventName,RoleId,DataView,DataAdd,DataUpdate,DataStatus,CreatedDate,CreatedBy,ModifiedDate,ModifiedBy)
			SELECT RP.EventId,PM.EventName,RP.RoleId,RP.DataView,RP.DataAdd,RP.DataUpdate,RP.DataStatus,
			RP.CreatedDate,RP.CreatedBy,RP.ModifiedDate,RP.ModifiedBy
			FROM tbl_RolePermission RP  INNER JOIN tbl_PermissionMaster PM ON RP.EventId=PM.EntryId
			WHERE RP.RoleId=@RoleId
		) V ON T.EventId=V.EventId
		
	END
	
	
	SELECT * FROM #Temp ORDER BY EventId
END
--GO
--EXEC USP_RolesPersmissionGetByRoleId
--@RoleId=4

GO
/****** Object:  StoredProcedure [dbo].[USP_VehicleClassGetActive]    Script Date: 08-07-2021 17:08:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_VehicleClassGetActive]
AS BEGIN

	SELECT EntryId,ClassName,ClassDescription,VehicleSpeed,DataStatus,CreatedDate,CreatedBy,ModifiedDate,ModifiedBy
	FROM tbl_VehicleClass
	WHERE DataStatus=1
	
END



GO
/****** Object:  StoredProcedure [dbo].[USP_VehicleClassGetAll]    Script Date: 08-07-2021 17:08:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_VehicleClassGetAll]
AS BEGIN

	SELECT EntryId,ClassName,ClassDescription,VehicleSpeed,DataStatus,CreatedDate,CreatedBy,ModifiedDate,ModifiedBy
	FROM tbl_VehicleClass
	
END



GO
/****** Object:  StoredProcedure [dbo].[USP_VehicleClassGetById]    Script Date: 08-07-2021 17:08:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_VehicleClassGetById]
@EntryId smallint
AS BEGIN
	SELECT EntryId,ClassName,ClassDescription,VehicleSpeed,DataStatus,CreatedDate,CreatedBy,ModifiedDate,ModifiedBy
	FROM tbl_VehicleClass
	WHERE EntryId=@EntryId
END



GO
/****** Object:  StoredProcedure [dbo].[USP_VehicleClassInsertUpdate]    Script Date: 08-07-2021 17:08:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_VehicleClassInsertUpdate] 
@EntryId smallint,
@ClassName varchar(100),
@ClassDescription varchar(100),
@VehicleSpeed smallint,
@DataStatus smallint,
@CreatedBy bigint,
@CreatedDate DateTime,
@ModifiedBy bigint,
@ModifiedDate DateTime
AS
BEGIN
	DECLARE @EventId smallint=6;
	DECLARE @PVal varchar(4000)
	DECLARE @CVal varchar(4000)
	DECLARE @cnt int
	CREATE TABLE #Temp(AlertMessage varchar(100))
	IF EXISTS(SELECT EntryId FROM tbl_VehicleClass where ClassName=@ClassName AND EntryId<>@EntryId)
	BEGIN
		INSERT INTO #Temp(AlertMessage)
		VALUES('Class already exists')
	END

	SELECT @cnt=COUNT(AlertMessage)  FROM #Temp
	IF(@cnt=0)
		BEGIN
			IF(@EntryId=0)
			BEGIN
				
				insert into tbl_VehicleClass(ClassName,ClassDescription,VehicleSpeed,DataStatus,CreatedDate,CreatedBy)
				values(@ClassName,@ClassDescription,@VehicleSpeed,@DataStatus,@CreatedDate,@CreatedBy);
				SELECT @EntryId=@@IDENTITY
				
				Set @CVal ='ClassId:'+convert(varchar,@EntryId)+',ClassName:'+@ClassName+',ClassDescription:'+@ClassDescription+
				',VehicleSpeed:'+CONVERT(varchar,@VehicleSpeed)+',Status:'+CONVERT(varchar,@DataStatus)						
				
				INSERT INTO tbl_ActivityLog(UserId,CurrentColumn,Action,EventId,CreatedDate)
				VALUES(@CreatedBy,@CVal,'Insert',@EventId,@CreatedDate);
				
				INSERT INTO #Temp(AlertMessage)VALUES('success');
			END
			ELSE
			BEGIN
				
				DECLARE @LClassName varchar(100)		DECLARE @LClassDescription varchar(200)	
				DECLARE @LDataStatus smallint			DECLARE @LVehicleSpeed	smallint

				Select @LClassDescription=ClassDescription,@LClassName=ClassName,@LVehicleSpeed=VehicleSpeed,@LDataStatus=DataStatus 
				from tbl_VehicleClass where EntryId=@EntryId;
				
				UPDATE tbl_VehicleClass SET ClassDescription=@ClassDescription,ClassName=@ClassName,VehicleSpeed=@VehicleSpeed,
				DataStatus=@DataStatus,ModifiedDate=@ModifiedDate,ModifiedBy=@ModifiedBy
				WHERE EntryId=@EntryId
			
				Set @CVal ='ClassId:'+convert(varchar,@EntryId)+',ClassName:'+@ClassName+',ClassDescription:'+@ClassDescription+
				',VehicleSpeed:'+CONVERT(varchar,@VehicleSpeed)+',Status:'+CONVERT(varchar,@DataStatus)	
				
				Set @PVal ='ClassId:'+convert(varchar,@EntryId)+',ClassName:'+@LClassName+',ClassDescription:'+@LClassDescription+
				',VehicleSpeed:'+CONVERT(varchar,@LVehicleSpeed)+',Status:'+CONVERT(varchar,@LDataStatus)	
					
				INSERT INTO tbl_ActivityLog(UserId,PrevColumn,CurrentColumn,Action,EventId,CreatedDate)
				VALUES(@ModifiedBy,@PVal,@CVal,'Update',@EventId,@ModifiedDate);

				INSERT INTO #Temp(AlertMessage)VALUES('success');
			END
		END
		select * from #Temp;
END
--GO 
--EXEC USP_PlazaInsertUpdate
--@EntryId =0,
--@ClientId =1,
--@PlazaName ='Plaza 1',--
--@PlazaServerIpAddress ='192.168.0.1',--
--@DataSendAPI ='http://182.74.121.114:6076/VaaaN/TTE-Events/RoadSideEvents',--
--@DataReceiveAPI ='http://182.74.121.114:6076/VaaaN/TTE-Events/RoadSideEvents',--
--@FTPPath ='ftp://ftp.example.com/Batch_File',--
--@FTPLoginId ='admin',
--@FTPPassword ='admin',
--@DataStatus =1,
--@UserId =0,
--@CDateTime='2021-04-07'
GO
/****** Object:  StoredProcedure [dbo].[USP_VMSMessageGetAll]    Script Date: 08-07-2021 17:08:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_VMSMessageGetAll]
AS BEGIN
/****** Script for SelectTopNRows command from SSMS  ******/
SELECT  V.EntryId,V.VmsIds,V.MessageFormatId,V.FontFormat,V.FontSize,V.AlignmentId,V.Brightness,V.MessageLanguageId,V.MessageOrientationId,
V.MessageDuration,V.MessageBody,V.MessagePriority,V.CreatedBy,V.CreatedDate,V.ModifiedBy,V.ModifiedDate,V.DataStatus 
FROM tbl_VMSMessageDetails V
--INNER JOIN dbo.tbl_DeviceDetails D ON V.DeviceId=D.EntryId 

END
GO
/****** Object:  StoredProcedure [dbo].[USP_VMSMessageGetAvtiveAll]    Script Date: 08-07-2021 17:08:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_VMSMessageGetAvtiveAll]
AS BEGIN
/****** Script for SelectTopNRows command from SSMS  ******/
SELECT  V.EntryId,V.VmsIds,V.MessageFormatId,V.FontFormat,V.FontSize,V.AlignmentId,V.Brightness,V.MessageLanguageId,V.MessageOrientationId,
V.MessageDuration,V.MessageBody,V.MessagePriority,V.CreatedBy,V.CreatedDate,V.ModifiedBy,V.ModifiedDate,V.DataStatus 
FROM tbl_VMSMessageDetails V
WHERE V.DataStatus=1
END
GO
/****** Object:  StoredProcedure [dbo].[USP_VMSMessageGetbyId]    Script Date: 08-07-2021 17:08:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_VMSMessageGetbyId]
@EntryId bigint
AS BEGIN
/****** Script for SelectTopNRows command from SSMS  ******/
	SELECT  V.EntryId,V.VmsIds,V.MessageFormatId,V.FontFormat,V.FontSize,V.AlignmentId,V.Brightness,V.MessageLanguageId,V.MessageOrientationId,
	V.MessageDuration,V.MessageBody,V.MessagePriority,V.CreatedBy,V.CreatedDate,V.ModifiedBy,V.ModifiedDate,V.DataStatus 
	FROM tbl_VMSMessageDetails V
	WHERE V.EntryId=@EntryId

END
GO
/****** Object:  StoredProcedure [dbo].[USP_VMSMessageInsertUpdate]    Script Date: 08-07-2021 17:08:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_VMSMessageInsertUpdate]
(
@EntryId bigint,
@VmsIds varchar(4000),
@MessageFormatId smallint,
@FontFormat varchar(100),
@FontSize smallint,
@AlignmentId smallint,
@Brightness smallint,
@MessageLanguageId smallint,
@MessageOrientationId smallint,
@MessageDuration smallint,
@MessageBody nvarchar(500),
@MessagePriority smallint,
@DataStatus smallint,
@CreatedDate datetime,
@CreatedBy bigint,
@ModifiedBy bigint,
@ModifiedDate datetime
	
)
AS BEGIN

	DECLARE @PVal varchar(4000)
	DECLARE @CVal varchar(4000)
	DECLARE @EventId smallint=9;
	CREATE TABLE #Temp(AlertMessage varchar(100))
	DECLARE @cnt int
	SELECT @cnt=COUNT(AlertMessage)  FROM #Temp
	IF(@cnt=0)
	BEGIN
		IF(@EntryId=0)
		BEGIN
		--@VmsIds,@MessageFormatId,@FontFormat,@FontSize,@AlignmentId,@Brightness,@MessageLanguageId,@MessageOrientationId,@MessageDuration,
		--@MessageBody,@MessagePriority,@DataStatus,@CreatedDate,@CreatedBy

			INSERT INTO tbl_VMSMessageDetails(VmsIds,MessageFormatId,FontFormat,FontSize,AlignmentId,Brightness,MessageLanguageId,
			MessageOrientationId,MessageDuration,MessageBody,MessagePriority,DataStatus,CreatedDate,CreatedBy)
			VALUES(@VmsIds,@MessageFormatId,@FontFormat,@FontSize,@AlignmentId,@Brightness,@MessageLanguageId,
			@MessageOrientationId,@MessageDuration,@MessageBody,@MessagePriority,@DataStatus,@CreatedDate,@CreatedBy)
			SELECT @EntryId=@@IDENTITY
			Set @CVal ='MessageId:'+convert(varchar,@EntryId)+',MessageFormatId:'+convert(varchar,@MessageFormatId)+',FontFormat:'+@FontFormat+',FontSize:'+convert(varchar,@FontSize)+
			'AlignmentId:'+convert(varchar,@AlignmentId)+',Brightness:'+convert(varchar,@Brightness)+',MessageLanguageId:'+convert(varchar,@MessageLanguageId)+',MessageOrientationId:'+convert(varchar,@MessageOrientationId)+
			'MessageDuration:'+convert(varchar,@MessageDuration)+',MessageBody:'+@MessageBody+',MessagePriority:'+convert(varchar,@MessagePriority)+',Status:'+CONVERT(varchar,@DataStatus)					
				
			INSERT INTO tbl_ActivityLog(UserId,CurrentColumn,Action,EventId,CreatedDate)
			VALUES(@CreatedBy,@CVal,'Insert',@EventId,@CreatedDate);
				
			INSERT INTO #Temp(AlertMessage)VALUES('success');
		END
		ELSE
		BEGIN
			DECLARE @PVmsIds varchar(4000)	
			DECLARE @PMessageFormatId smallint
			DECLARE @PFontFormat varchar(100)
			DECLARE @PFontSize smallint
			DECLARE @PAlignmentId smallint
			DECLARE @PBrightness smallint
			DECLARE @PMessageLanguageId smallint
			DECLARE @PMessageOrientationId smallint
			DECLARE @PMessageDuration smallint
			DECLARE @PMessageBody nvarchar(1000)
			DECLARE @PMessagePriority smallint
			DECLARE @PDataStatus smallint


			Select 
			@PVmsIds= VmsIds,
			@PMessageFormatId=MessageFormatId,
			@PFontFormat=FontFormat,
			@PFontSize=FontSize,
			@PAlignmentId=AlignmentId,
			@PBrightness=Brightness,
			@PMessageLanguageId=MessageLanguageId,
			@PMessageOrientationId=MessageOrientationId,
			@PMessageDuration=MessageDuration,
			@PMessageBody=MessageBody,
			@PMessagePriority=MessagePriority,
			@PDataStatus=DataStatus
			from tbl_VMSMessageDetails where EntryId=@EntryId;


			Set @CVal ='MessageId:'+convert(varchar,@EntryId)+',MessageFormatId:'+convert(varchar,@MessageFormatId)+',FontFormat:'+@FontFormat+',FontSize:'+convert(varchar,@FontSize)+
			'AlignmentId:'+convert(varchar,@AlignmentId)+',Brightness:'+convert(varchar,@Brightness)+',MessageLanguageId:'+convert(varchar,@MessageLanguageId)+',MessageOrientationId:'+convert(varchar,@MessageOrientationId)+
			'MessageDuration:'+convert(varchar,@MessageDuration)+',MessageBody:'+@MessageBody+',MessagePriority:'+convert(varchar,@MessagePriority)+',Status:'+CONVERT(varchar,@DataStatus)							

			Set @PVal ='MessageId:'+convert(varchar,@EntryId)+',MessageFormatId:'+convert(varchar,@PMessageFormatId)+',FontFormat:'+@PFontFormat+',FontSize:'+convert(varchar,@PFontSize)+
			'AlignmentId:'+convert(varchar,@PAlignmentId)+',Brightness:'+convert(varchar,@PBrightness)+',MessageLanguageId:'+convert(varchar,@PMessageLanguageId)+',MessageOrientationId:'+convert(varchar,@PMessageOrientationId)+
			'MessageDuration:'+convert(varchar,@PMessageDuration)+',MessageBody:'+@PMessageBody+',MessagePriority:'+convert(varchar,@PMessagePriority)+',Status:'+CONVERT(varchar,@PDataStatus)							

			UPDATE tbl_VMSMessageDetails 
			SET VmsIds= @VmsIds,
			MessageFormatId=@MessageFormatId,
			FontFormat=@FontFormat,
			FontSize=@FontSize,
			AlignmentId=@AlignmentId,
			Brightness=@Brightness,
			MessageLanguageId=@MessageLanguageId,
			MessageOrientationId=@MessageOrientationId,
			MessageDuration=@MessageDuration,
			MessageBody=@MessageBody,
			MessagePriority=@MessagePriority,
			DataStatus=@DataStatus,
			ModifiedBy=@ModifiedBy,
			ModifiedDate=@ModifiedDate
			WHERE EntryId=@EntryId
			
			INSERT INTO tbl_ActivityLog(UserId,PrevColumn,CurrentColumn,Action,EventId,CreatedDate)
			VALUES(@ModifiedBy,@PVal,@CVal,'Update',@EventId,@ModifiedDate);

			INSERT INTO #Temp(AlertMessage)VALUES('success');

		END
	END
	SELECT * FROM #Temp
END
GO
