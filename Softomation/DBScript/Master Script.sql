IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__tbl_Vehic__DataS__00DF2177]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_VehicleClassMapping] DROP CONSTRAINT [DF__tbl_Vehic__DataS__00DF2177]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__tbl_Vehic__Vehic__7FEAFD3E]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_VehicleClassMapping] DROP CONSTRAINT [DF__tbl_Vehic__Vehic__7FEAFD3E]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__tbl_UserM__DataS__17036CC0]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_UserMaster] DROP CONSTRAINT [DF__tbl_UserM__DataS__17036CC0]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__tbl_Trans__DataS__5EBF139D]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_TransactionTypeMaster] DROP CONSTRAINT [DF__tbl_Trans__DataS__5EBF139D]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__tbl_Shift__DataS__3F466844]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_ShiftTimining] DROP CONSTRAINT [DF__tbl_Shift__DataS__3F466844]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__tbl_RoleP__DataS__35BCFE0A]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_RolePermission] DROP CONSTRAINT [DF__tbl_RoleP__DataS__35BCFE0A]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__tbl_RoleP__DataU__34C8D9D1]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_RolePermission] DROP CONSTRAINT [DF__tbl_RoleP__DataU__34C8D9D1]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__tbl_RoleP__DataA__33D4B598]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_RolePermission] DROP CONSTRAINT [DF__tbl_RoleP__DataA__33D4B598]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__tbl_RoleP__DataV__32E0915F]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_RolePermission] DROP CONSTRAINT [DF__tbl_RoleP__DataV__32E0915F]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__tbl_RoleM__DataS__02084FDA]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_RoleMaster] DROP CONSTRAINT [DF__tbl_RoleM__DataS__02084FDA]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__tbl_Plaza__DataS__4D5F7D71]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_PlazaMapping] DROP CONSTRAINT [DF__tbl_Plaza__DataS__4D5F7D71]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__tbl_Plaza__DataS__339FAB6E]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_PlazaConfiguration] DROP CONSTRAINT [DF__tbl_Plaza__DataS__339FAB6E]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__tbl_Permi__DataS__30F848ED]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_PermissionMaster] DROP CONSTRAINT [DF__tbl_Permi__DataS__30F848ED]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__tbl_Permi__DataU__300424B4]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_PermissionMaster] DROP CONSTRAINT [DF__tbl_Permi__DataU__300424B4]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__tbl_Permi__DataA__2F10007B]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_PermissionMaster] DROP CONSTRAINT [DF__tbl_Permi__DataA__2F10007B]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__tbl_Permi__DataV__2E1BDC42]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_PermissionMaster] DROP CONSTRAINT [DF__tbl_Permi__DataV__2E1BDC42]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__tbl_LaneC__DataS__25869641]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_LaneConfiguration] DROP CONSTRAINT [DF__tbl_LaneC__DataS__25869641]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__tbl_IHMCL__DataS__7849DB76]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_IHMCLClass] DROP CONSTRAINT [DF__tbl_IHMCL__DataS__7849DB76]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__tbl_IHMCL__Vehic__7755B73D]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_IHMCLClass] DROP CONSTRAINT [DF__tbl_IHMCL__Vehic__7755B73D]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__tbl_FareC__DataS__3D5E1FD2]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_FareConfiguration] DROP CONSTRAINT [DF__tbl_FareC__DataS__3D5E1FD2]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__tbl_ExitL__Refer__76969D2E]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_ExitLaneTransaction] DROP CONSTRAINT [DF__tbl_ExitL__Refer__76969D2E]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__tbl_ExitL__Revei__75A278F5]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_ExitLaneTransaction] DROP CONSTRAINT [DF__tbl_ExitL__Revei__75A278F5]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__tbl_Exemp__DataS__5CD6CB2B]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_ExemptTypeMaster] DROP CONSTRAINT [DF__tbl_Exemp__DataS__5CD6CB2B]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__tbl_Entry__Refer__73BA3083]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_EntryLaneTransaction] DROP CONSTRAINT [DF__tbl_Entry__Refer__73BA3083]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__tbl_Entry__Revei__72C60C4A]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_EntryLaneTransaction] DROP CONSTRAINT [DF__tbl_Entry__Revei__72C60C4A]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__tbl_Clien__DataS__2180FB33]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_ClientConfiguration] DROP CONSTRAINT [DF__tbl_Clien__DataS__2180FB33]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__tbl_AVCCl__DataS__662B2B3B]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_AVCClass] DROP CONSTRAINT [DF__tbl_AVCCl__DataS__662B2B3B]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__tbl_AVCCl__Vehic__65370702]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_AVCClass] DROP CONSTRAINT [DF__tbl_AVCCl__Vehic__65370702]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__tbl_AVCCl__Vehic__6442E2C9]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_AVCClass] DROP CONSTRAINT [DF__tbl_AVCCl__Vehic__6442E2C9]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__tbl_AVCCl__Vehic__634EBE90]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_AVCClass] DROP CONSTRAINT [DF__tbl_AVCCl__Vehic__634EBE90]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__tbl_AVCCl__Vehic__625A9A57]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_AVCClass] DROP CONSTRAINT [DF__tbl_AVCCl__Vehic__625A9A57]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__tbl_AVCCl__AxleC__6166761E]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_AVCClass] DROP CONSTRAINT [DF__tbl_AVCCl__AxleC__6166761E]
END

GO
/****** Object:  Table [dbo].[Temp_ImportClass]    Script Date: 12-04-2021 01:45:31 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Temp_ImportClass]') AND type in (N'U'))
DROP TABLE [dbo].[Temp_ImportClass]
GO
/****** Object:  Table [dbo].[tbl_VehicleClassMapping]    Script Date: 12-04-2021 01:45:31 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_VehicleClassMapping]') AND type in (N'U'))
DROP TABLE [dbo].[tbl_VehicleClassMapping]
GO
/****** Object:  Table [dbo].[tbl_UserMaster]    Script Date: 12-04-2021 01:45:31 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_UserMaster]') AND type in (N'U'))
DROP TABLE [dbo].[tbl_UserMaster]
GO
/****** Object:  Table [dbo].[tbl_TransactionTypeMaster]    Script Date: 12-04-2021 01:45:31 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_TransactionTypeMaster]') AND type in (N'U'))
DROP TABLE [dbo].[tbl_TransactionTypeMaster]
GO
/****** Object:  Table [dbo].[tbl_ShiftTimining]    Script Date: 12-04-2021 01:45:31 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_ShiftTimining]') AND type in (N'U'))
DROP TABLE [dbo].[tbl_ShiftTimining]
GO
/****** Object:  Table [dbo].[tbl_RolePermission]    Script Date: 12-04-2021 01:45:31 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_RolePermission]') AND type in (N'U'))
DROP TABLE [dbo].[tbl_RolePermission]
GO
/****** Object:  Table [dbo].[tbl_RoleMaster]    Script Date: 12-04-2021 01:45:31 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_RoleMaster]') AND type in (N'U'))
DROP TABLE [dbo].[tbl_RoleMaster]
GO
/****** Object:  Table [dbo].[tbl_PlazaMapping]    Script Date: 12-04-2021 01:45:31 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_PlazaMapping]') AND type in (N'U'))
DROP TABLE [dbo].[tbl_PlazaMapping]
GO
/****** Object:  Table [dbo].[tbl_PlazaConfiguration]    Script Date: 12-04-2021 01:45:31 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_PlazaConfiguration]') AND type in (N'U'))
DROP TABLE [dbo].[tbl_PlazaConfiguration]
GO
/****** Object:  Table [dbo].[tbl_PermissionMaster]    Script Date: 12-04-2021 01:45:31 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_PermissionMaster]') AND type in (N'U'))
DROP TABLE [dbo].[tbl_PermissionMaster]
GO
/****** Object:  Table [dbo].[tbl_MenuMaster_bkp]    Script Date: 12-04-2021 01:45:31 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_MenuMaster_bkp]') AND type in (N'U'))
DROP TABLE [dbo].[tbl_MenuMaster_bkp]
GO
/****** Object:  Table [dbo].[tbl_MenuMaster]    Script Date: 12-04-2021 01:45:31 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_MenuMaster]') AND type in (N'U'))
DROP TABLE [dbo].[tbl_MenuMaster]
GO
/****** Object:  Table [dbo].[tbl_LaneConfiguration]    Script Date: 12-04-2021 01:45:31 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_LaneConfiguration]') AND type in (N'U'))
DROP TABLE [dbo].[tbl_LaneConfiguration]
GO
/****** Object:  Table [dbo].[tbl_IHMCLClass]    Script Date: 12-04-2021 01:45:31 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_IHMCLClass]') AND type in (N'U'))
DROP TABLE [dbo].[tbl_IHMCLClass]
GO
/****** Object:  Table [dbo].[tbl_FareConfiguration]    Script Date: 12-04-2021 01:45:31 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_FareConfiguration]') AND type in (N'U'))
DROP TABLE [dbo].[tbl_FareConfiguration]
GO
/****** Object:  Table [dbo].[tbl_ExitLaneTransaction]    Script Date: 12-04-2021 01:45:31 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_ExitLaneTransaction]') AND type in (N'U'))
DROP TABLE [dbo].[tbl_ExitLaneTransaction]
GO
/****** Object:  Table [dbo].[tbl_ExemptTypeMaster]    Script Date: 12-04-2021 01:45:31 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_ExemptTypeMaster]') AND type in (N'U'))
DROP TABLE [dbo].[tbl_ExemptTypeMaster]
GO
/****** Object:  Table [dbo].[tbl_EntryLaneTransaction]    Script Date: 12-04-2021 01:45:31 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_EntryLaneTransaction]') AND type in (N'U'))
DROP TABLE [dbo].[tbl_EntryLaneTransaction]
GO
/****** Object:  Table [dbo].[tbl_ClientConfiguration]    Script Date: 12-04-2021 01:45:31 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_ClientConfiguration]') AND type in (N'U'))
DROP TABLE [dbo].[tbl_ClientConfiguration]
GO
/****** Object:  Table [dbo].[tbl_AVCClass]    Script Date: 12-04-2021 01:45:31 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_AVCClass]') AND type in (N'U'))
DROP TABLE [dbo].[tbl_AVCClass]
GO
/****** Object:  Table [dbo].[tbl_ActivityLog]    Script Date: 12-04-2021 01:45:31 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_ActivityLog]') AND type in (N'U'))
DROP TABLE [dbo].[tbl_ActivityLog]
GO
/****** Object:  Table [dbo].[SampleLaneData]    Script Date: 12-04-2021 01:45:31 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SampleLaneData]') AND type in (N'U'))
DROP TABLE [dbo].[SampleLaneData]
GO
/****** Object:  Table [dbo].[SampleIHMCLClass]    Script Date: 12-04-2021 01:45:31 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SampleIHMCLClass]') AND type in (N'U'))
DROP TABLE [dbo].[SampleIHMCLClass]
GO
/****** Object:  StoredProcedure [dbo].[USP_VehicleClassInsertUpdate]    Script Date: 12-04-2021 01:45:31 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_VehicleClassInsertUpdate]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_VehicleClassInsertUpdate]
GO
/****** Object:  StoredProcedure [dbo].[USP_VehicleClassGetEntryId]    Script Date: 12-04-2021 01:45:31 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_VehicleClassGetEntryId]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_VehicleClassGetEntryId]
GO
/****** Object:  StoredProcedure [dbo].[USP_VehicleClassGetClientId]    Script Date: 12-04-2021 01:45:31 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_VehicleClassGetClientId]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_VehicleClassGetClientId]
GO
/****** Object:  StoredProcedure [dbo].[USP_VehicleClassGetClassId]    Script Date: 12-04-2021 01:45:31 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_VehicleClassGetClassId]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_VehicleClassGetClassId]
GO
/****** Object:  StoredProcedure [dbo].[USP_VehicleClassGetAll]    Script Date: 12-04-2021 01:45:31 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_VehicleClassGetAll]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_VehicleClassGetAll]
GO
/****** Object:  StoredProcedure [dbo].[USP_UsersGetByLoginId]    Script Date: 12-04-2021 01:45:31 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_UsersGetByLoginId]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_UsersGetByLoginId]
GO
/****** Object:  StoredProcedure [dbo].[USP_UserInsertUpdate]    Script Date: 12-04-2021 01:45:31 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_UserInsertUpdate]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_UserInsertUpdate]
GO
/****** Object:  StoredProcedure [dbo].[USP_UserGetbyId]    Script Date: 12-04-2021 01:45:31 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_UserGetbyId]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_UserGetbyId]
GO
/****** Object:  StoredProcedure [dbo].[USP_UserGetAll]    Script Date: 12-04-2021 01:45:31 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_UserGetAll]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_UserGetAll]
GO
/****** Object:  StoredProcedure [dbo].[USP_RolesGetById]    Script Date: 12-04-2021 01:45:31 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_RolesGetById]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_RolesGetById]
GO
/****** Object:  StoredProcedure [dbo].[USP_RolesGetAll]    Script Date: 12-04-2021 01:45:31 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_RolesGetAll]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_RolesGetAll]
GO
/****** Object:  StoredProcedure [dbo].[USP_RoleInsertUpdate]    Script Date: 12-04-2021 01:45:31 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_RoleInsertUpdate]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_RoleInsertUpdate]
GO
/****** Object:  StoredProcedure [dbo].[USP_PlazaMappingValidateInsertUpdate]    Script Date: 12-04-2021 01:45:31 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_PlazaMappingValidateInsertUpdate]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_PlazaMappingValidateInsertUpdate]
GO
/****** Object:  StoredProcedure [dbo].[USP_PlazaMappingInsertUpdate]    Script Date: 12-04-2021 01:45:31 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_PlazaMappingInsertUpdate]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_PlazaMappingInsertUpdate]
GO
/****** Object:  StoredProcedure [dbo].[USP_PlazaMappingGetbyPlazaId]    Script Date: 12-04-2021 01:45:31 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_PlazaMappingGetbyPlazaId]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_PlazaMappingGetbyPlazaId]
GO
/****** Object:  StoredProcedure [dbo].[USP_PlazaMappingGetAll]    Script Date: 12-04-2021 01:45:31 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_PlazaMappingGetAll]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_PlazaMappingGetAll]
GO
/****** Object:  StoredProcedure [dbo].[USP_PlazaInsertUpdate]    Script Date: 12-04-2021 01:45:31 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_PlazaInsertUpdate]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_PlazaInsertUpdate]
GO
/****** Object:  StoredProcedure [dbo].[USP_PlazaGetbyId]    Script Date: 12-04-2021 01:45:31 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_PlazaGetbyId]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_PlazaGetbyId]
GO
/****** Object:  StoredProcedure [dbo].[USP_PlazaGetAll]    Script Date: 12-04-2021 01:45:31 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_PlazaGetAll]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_PlazaGetAll]
GO
/****** Object:  StoredProcedure [dbo].[USP_MenuGetAll]    Script Date: 12-04-2021 01:45:31 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_MenuGetAll]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_MenuGetAll]
GO
/****** Object:  StoredProcedure [dbo].[USP_IHMCLVehicleClassUpload]    Script Date: 12-04-2021 01:45:31 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_IHMCLVehicleClassUpload]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_IHMCLVehicleClassUpload]
GO
/****** Object:  StoredProcedure [dbo].[USP_IHMCLVehicleClassGetbyId]    Script Date: 12-04-2021 01:45:31 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_IHMCLVehicleClassGetbyId]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_IHMCLVehicleClassGetbyId]
GO
/****** Object:  StoredProcedure [dbo].[USP_IHMCLVehicleClassGetbyClassId]    Script Date: 12-04-2021 01:45:31 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_IHMCLVehicleClassGetbyClassId]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_IHMCLVehicleClassGetbyClassId]
GO
/****** Object:  StoredProcedure [dbo].[USP_IHMCLVehicleClassGetAll]    Script Date: 12-04-2021 01:45:31 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_IHMCLVehicleClassGetAll]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_IHMCLVehicleClassGetAll]
GO
/****** Object:  StoredProcedure [dbo].[USP_ClientInsertUpdate]    Script Date: 12-04-2021 01:45:31 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_ClientInsertUpdate]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_ClientInsertUpdate]
GO
/****** Object:  StoredProcedure [dbo].[USP_ClientGetbyId]    Script Date: 12-04-2021 01:45:31 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_ClientGetbyId]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_ClientGetbyId]
GO
/****** Object:  StoredProcedure [dbo].[USP_ClientGetAll]    Script Date: 12-04-2021 01:45:31 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_ClientGetAll]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_ClientGetAll]
GO
/****** Object:  StoredProcedure [dbo].[USP_AVCVehicleClassUpload]    Script Date: 12-04-2021 01:45:31 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_AVCVehicleClassUpload]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_AVCVehicleClassUpload]
GO
/****** Object:  StoredProcedure [dbo].[USP_AVCVehicleClassGetbyId]    Script Date: 12-04-2021 01:45:31 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_AVCVehicleClassGetbyId]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_AVCVehicleClassGetbyId]
GO
/****** Object:  StoredProcedure [dbo].[USP_AVCVehicleClassGetbyClassId]    Script Date: 12-04-2021 01:45:31 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_AVCVehicleClassGetbyClassId]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_AVCVehicleClassGetbyClassId]
GO
/****** Object:  StoredProcedure [dbo].[USP_AVCVehicleClassGetAll]    Script Date: 12-04-2021 01:45:31 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_AVCVehicleClassGetAll]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_AVCVehicleClassGetAll]
GO
/****** Object:  StoredProcedure [dbo].[USP_AVCVehicleClassGetAll]    Script Date: 12-04-2021 01:45:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_AVCVehicleClassGetAll]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[USP_AVCVehicleClassGetAll]
AS BEGIN
	SELECT A.EntryId,A.ClientId,C.ClientName,A.AvcClassId,A.AvcClassName,A.AvcClassDescription,A.AxleCount,A.VehicleHeight,A.VehicleWidth,A.VehicleLength,A.VehicleWeight
	,A.DataStatus,A.CreatedDate,A.CreatedBy,A.ModifiedDate,A.ModifiedBy 
	FROM tbl_AVCClass A INNER JOIN tbl_ClientConfiguration C
	ON A.ClientId=C.EntryId
	ORDER BY AvcClassId ASC
END


' 
END
GO
/****** Object:  StoredProcedure [dbo].[USP_AVCVehicleClassGetbyClassId]    Script Date: 12-04-2021 01:45:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_AVCVehicleClassGetbyClassId]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[USP_AVCVehicleClassGetbyClassId]
@AvcClassId smallint
AS BEGIN
	SELECT A.EntryId,A.ClientId,C.ClientName,A.AvcClassId,A.AvcClassName,A.AvcClassDescription,A.AxleCount,A.VehicleHeight,A.VehicleWidth,A.VehicleLength,A.VehicleWeight
	,A.DataStatus,A.CreatedDate,A.CreatedBy,A.ModifiedDate,A.ModifiedBy 
	FROM tbl_AVCClass A INNER JOIN tbl_ClientConfiguration C
	ON A.ClientId=C.EntryId
	WHERE AvcClassId=@AvcClassId
END


' 
END
GO
/****** Object:  StoredProcedure [dbo].[USP_AVCVehicleClassGetbyId]    Script Date: 12-04-2021 01:45:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_AVCVehicleClassGetbyId]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[USP_AVCVehicleClassGetbyId]
@EntryId smallint
AS BEGIN
	SELECT A.EntryId,A.ClientId,C.ClientName,A.AvcClassId,A.AvcClassName,A.AvcClassDescription,A.AxleCount,A.VehicleHeight,A.VehicleWidth,A.VehicleLength,A.VehicleWeight
	,A.DataStatus,A.CreatedDate,A.CreatedBy,A.ModifiedDate,A.ModifiedBy 
	FROM tbl_AVCClass A INNER JOIN tbl_ClientConfiguration C
	ON A.ClientId=C.EntryId
	WHERE A.EntryId=@EntryId
END


' 
END
GO
/****** Object:  StoredProcedure [dbo].[USP_AVCVehicleClassUpload]    Script Date: 12-04-2021 01:45:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_AVCVehicleClassUpload]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[USP_AVCVehicleClassUpload] 
@FileName varchar(20),
@SessionId varchar(20),
@ClientId smallint,
@DataStatus smallint,
@UserId bigint,
@CDateTime DateTime
AS
BEGIN
	DECLARE @Datacnt int
	DECLARE @EventId smallint=5;
	CREATE TABLE #Temp(AlertMessage varchar(100))
	CREATE TABLE #TempACVUpload(EntryId smallint,ClientId smallint NULL,AvcClassId smallint NULL,AvcClassName nvarchar(100) NULL,AvcClassDescription nvarchar(100) NULL,AxleCount smallint NULL,VehicleHeight decimal(18, 4) NULL,VehicleWidth decimal(18, 4) NULL,VehicleLength decimal(18, 4) NULL,VehicleWeight decimal(18, 3) NULL)
	CREATE TABLE #TempUpload(EntryId smallint,ClientId smallint NULL,AvcClassId smallint NULL,AvcClassName nvarchar(100) NULL,AvcClassDescription nvarchar(100) NULL,AxleCount smallint NULL,VehicleHeight decimal(18, 4) NULL,VehicleWidth decimal(18, 4) NULL,VehicleLength decimal(18, 4) NULL,VehicleWeight decimal(18, 3) NULL)
	
	INSERT INTO #TempUpload(EntryId,ClientId,AvcClassId,AvcClassName,AvcClassDescription,AxleCount,VehicleHeight,VehicleWidth,VehicleLength,VehicleWeight)
	SELECT 0,@ClientId,ISNULL(ClassId,0),ISNULL(ClassName,0),ISNULL(ClassDescription,''''),ISNULL(AxleCount,0),ISNULL(VehicleHeight,0),ISNULL(VehicleWidth,0),ISNULL(VehicleLength,0),ISNULL(VehicleWeight,0)
	FROM Temp_ImportClass WHERE SessionId=@SessionId
	DELETE FROM Temp_ImportClass WHERE SessionId=@SessionId
	
	INSERT INTO #TempACVUpload(EntryId,ClientId,AvcClassId,AvcClassName,AvcClassDescription,AxleCount,VehicleHeight,VehicleWidth,VehicleLength,VehicleWeight)
	SELECT EntryId,ClientId,AvcClassId,AvcClassName,AvcClassDescription,AxleCount,VehicleHeight,VehicleWidth,VehicleLength,VehicleWeight
	FROM tbl_AVCClass WHERE ClientId=@ClientId
	
	SELECT @Datacnt=COUNT(1) FROM tbl_AVCClass WHERE ClientId=@ClientId
	IF(@Datacnt=0)
	BEGIN
		INSERT INTO tbl_AVCClass(ClientId,AvcClassId,AvcClassName,AvcClassDescription,AxleCount,VehicleHeight,VehicleWidth,VehicleLength,VehicleWeight,DataStatus,CreatedDate,CreatedBy)
		SELECT ClientId,AvcClassId,AvcClassName,AvcClassDescription,AxleCount,VehicleHeight,VehicleWidth,VehicleLength,VehicleWeight,@DataStatus,@CDateTime,@UserId 
		FROM #TempUpload
		
		INSERT INTO tbl_ActivityLog(UserId,CurrentColumn,Action,EventId,CreatedDate)
		VALUES(@UserId,@FileName,''Upload'',@EventId,@CDateTime);
		INSERT INTO #Temp(AlertMessage)VALUES(''success'');
	END
	ELSE
	BEGIN
		UPDATE T SET T.EntryId=V.EntryId FROM #TempUpload T INNER JOIN 
		(
			SELECT EntryId,AvcClassId,AvcClassName,AvcClassDescription,AxleCount,VehicleHeight,VehicleWidth,VehicleLength,VehicleWeight
			FROM #TempACVUpload 
		) V ON T.AvcClassId=V.AvcClassId

		INSERT INTO tbl_AVCClass(ClientId,AvcClassId,AvcClassName,AvcClassDescription,AxleCount,VehicleHeight,VehicleWidth,VehicleLength,VehicleWeight,DataStatus,CreatedDate,CreatedBy)
		SELECT ClientId,AvcClassId,AvcClassName,AvcClassDescription,AxleCount,VehicleHeight,VehicleWidth,VehicleLength,VehicleWeight,@DataStatus,@CDateTime,@UserId 
		FROM #TempUpload WHERE EntryId=0

		UPDATE T SET T.AvcClassName=V.AvcClassName,T.AvcClassDescription=V.AvcClassDescription,
		T.AxleCount=V.AxleCount,T.VehicleHeight=V.VehicleHeight,T.VehicleWidth=V.VehicleWidth,T.VehicleLength=V.VehicleLength,
		T.VehicleWeight=V.VehicleWeight,T.ModifiedBy=@UserId,T.ModifiedDate=@CDateTime
		FROM tbl_AVCClass T INNER JOIN 
		(
			SELECT EntryId,AvcClassId,AvcClassName,AvcClassDescription,AxleCount,VehicleHeight,VehicleWidth,VehicleLength,VehicleWeight
			FROM #TempUpload WHERE EntryId<>0  
		) V ON T.EntryId=V.EntryId

		INSERT INTO tbl_ActivityLog(UserId,CurrentColumn,Action,EventId,CreatedDate)
		VALUES(@UserId,@FileName,''Upload'',@EventId,@CDateTime);
		INSERT INTO #Temp(AlertMessage)VALUES(''success'');
	END
	select * from #Temp;
END
--GO 
--EXEC USP_AVCVehicleClassUpload
--@FileName =''ABC'',
--@SessionId=''MO71EKB5ED'',
--@ClientId =0,
--@DataStatus =1,
--@UserId =0,
--@CDateTime=''2021-04-07''' 
END
GO
/****** Object:  StoredProcedure [dbo].[USP_ClientGetAll]    Script Date: 12-04-2021 01:45:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_ClientGetAll]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[USP_ClientGetAll]
AS BEGIN
	
		SELECT C.EntryId,C.ClientName,C.ClientAddress,C.MobileNumber,C.EmailId,C.DataStatus,C.CreatedDate,C.CreatedBy,C.ModifiedDate,C.ModifiedBy
        FROM tbl_ClientConfiguration C
		ORDER BY ModifiedDate DESC,CreatedDate DESC
END

--GO
--EXEC USP_UsersGetByLoginId
--@LoginId=''admin''
' 
END
GO
/****** Object:  StoredProcedure [dbo].[USP_ClientGetbyId]    Script Date: 12-04-2021 01:45:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_ClientGetbyId]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[USP_ClientGetbyId]
@EntryId int
AS BEGIN
	
		SELECT C.EntryId,C.ClientName,C.ClientAddress,C.MobileNumber,C.EmailId,C.DataStatus,C.CreatedDate,C.CreatedBy,C.ModifiedDate,C.ModifiedBy
        FROM tbl_ClientConfiguration C
		WHERE EntryId=@EntryId
END

--GO
--EXEC USP_UsersGetByLoginId
--@LoginId=''admin''
' 
END
GO
/****** Object:  StoredProcedure [dbo].[USP_ClientInsertUpdate]    Script Date: 12-04-2021 01:45:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_ClientInsertUpdate]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[USP_ClientInsertUpdate] 
@EntryId bigint,
@ClientName nvarchar(100),
@ClientAddress nvarchar (200),
@MobileNumber nvarchar (20),
@EmailId nvarchar (50),
@DataStatus smallint,
@UserId bigint,
@CDateTime DateTime
AS
BEGIN
	DECLARE @PVal varchar(4000)
	DECLARE @CVal varchar(4000)
	DECLARE @EventId smallint=1;
	CREATE TABLE #Temp(AlertMessage varchar(100))
	DECLARE @cnt int
	DECLARE @DataCount int=0;
	
	IF EXISTS(SELECT EntryId FROM tbl_ClientConfiguration where ClientName=@ClientName AND EntryId<>@EntryId)
	BEGIN
		INSERT INTO #Temp(AlertMessage)
		VALUES(''Name already exists'')
	END
	IF EXISTS(SELECT EntryId FROM tbl_ClientConfiguration where MobileNumber=@MobileNumber AND EntryId<>@EntryId)
	BEGIN
		INSERT INTO #Temp(AlertMessage)
		VALUES(''Mobile number already exists'')
	END
	IF EXISTS(SELECT EntryId FROM tbl_ClientConfiguration where EmailId=@EmailId AND EntryId<>@EntryId)
	BEGIN
		INSERT INTO #Temp(AlertMessage)
		VALUES(''Email id already exists'')
	END
	IF(@EntryId<>0 AND @DataStatus<>1)
	BEGIN
		IF EXISTS(SELECT EntryId FROM tbl_PlazaConfiguration where ClientId=@EntryId AND @DataStatus=1)
		BEGIN
			INSERT INTO #Temp(AlertMessage)
			VALUES(''Client cannot inactive due to plaza already conncted!'');
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
				
				Set @CVal =''ClientId:''+convert(varchar,@EntryId)+'',ClientName:''+@ClientName+'',ClientAddress:''+@ClientAddress+
				'',EmailId:''+@EmailId+'',MobileNumber:''+@MobileNumber+'',Status:''+CONVERT(varchar,@DataStatus)			
				
				INSERT INTO tbl_ActivityLog(UserId,CurrentColumn,Action,EventId,CreatedDate)
				VALUES(@UserId,@CVal,''Insert'',@EventId,@CDateTime);
				
				INSERT INTO #Temp(AlertMessage)VALUES(''success'');
			END
			ELSE
			BEGIN
				Declare @LDataStatus smallint		
				Declare @LClientName nvarchar(100)	Declare @LClientAddress nvarchar(200)	Declare @LEmailId nvarchar(50)
				Declare @LMobileNumber nvarchar(30)	
				


				Select @LDataStatus=DataStatus,
				@LClientName=ClientName,@LClientAddress=ClientAddress,@LEmailId=EmailId,@LMobileNumber=MobileNumber
				from tbl_ClientConfiguration where EntryId=@EntryId;

				UPDATE tbl_ClientConfiguration SET ClientName=@ClientName,ClientAddress=@ClientAddress,MobileNumber=@MobileNumber,EmailId=@EmailId,
				DataStatus=@DataStatus,ModifiedDate=@CDateTime,ModifiedBy=@UserId
				WHERE EntryId=@EntryId
			
				Set @CVal =''ClientId:''+convert(varchar,@EntryId)+'',ClientName:''+@ClientName+'',ClientAddress:''+@ClientAddress+
				'',EmailId:''+@EmailId+'',MobileNumber:''+@MobileNumber+'',Status:''+CONVERT(varchar,@DataStatus)		
				
				Set @PVal =''ClientId:''+convert(varchar,@EntryId)+'',ClientName:''+@LClientName+'',ClientAddress:''+@LClientAddress+
				'',EmailId:''+@LEmailId+'',MobileNumber:''+@LMobileNumber+'',Status:''+CONVERT(varchar,@LDataStatus)		
					
				INSERT INTO tbl_ActivityLog(UserId,PrevColumn,CurrentColumn,Action,EventId,CreatedDate)
				VALUES(@UserId,@PVal,@CVal,''Update'',@EventId,@CDateTime);

				INSERT INTO #Temp(AlertMessage)VALUES(''success'');
			END
		END
		select * from #Temp;
END

' 
END
GO
/****** Object:  StoredProcedure [dbo].[USP_IHMCLVehicleClassGetAll]    Script Date: 12-04-2021 01:45:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_IHMCLVehicleClassGetAll]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[USP_IHMCLVehicleClassGetAll]
AS BEGIN
	SELECT A.EntryId,A.IHMCLClassId,A.IHMCLClassName,A.IHMCLClassDescription,A.VehicleWeight,A.DataStatus,A.CreatedDate,A.CreatedBy,A.ModifiedDate,A.ModifiedBy 
	FROM tbl_IHMCLClass A 
	ORDER BY IHMCLClassId ASC
END


' 
END
GO
/****** Object:  StoredProcedure [dbo].[USP_IHMCLVehicleClassGetbyClassId]    Script Date: 12-04-2021 01:45:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_IHMCLVehicleClassGetbyClassId]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[USP_IHMCLVehicleClassGetbyClassId]
@IHMCLClassId smallint
AS BEGIN
	SELECT A.EntryId,A.IHMCLClassId,A.IHMCLClassName,A.IHMCLClassDescription,A.VehicleWeight,A.DataStatus,A.CreatedDate,A.CreatedBy,A.ModifiedDate,A.ModifiedBy 
	FROM tbl_IHMCLClass A 
	WHERE IHMCLClassId =@IHMCLClassId
END


' 
END
GO
/****** Object:  StoredProcedure [dbo].[USP_IHMCLVehicleClassGetbyId]    Script Date: 12-04-2021 01:45:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_IHMCLVehicleClassGetbyId]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[USP_IHMCLVehicleClassGetbyId]
@EntryId smallint
AS BEGIN
	SELECT A.EntryId,A.IHMCLClassId,A.IHMCLClassName,A.IHMCLClassDescription,A.VehicleWeight,A.DataStatus,A.CreatedDate,A.CreatedBy,A.ModifiedDate,A.ModifiedBy 
	FROM tbl_IHMCLClass A 
	WHERE EntryId =@EntryId
END


' 
END
GO
/****** Object:  StoredProcedure [dbo].[USP_IHMCLVehicleClassUpload]    Script Date: 12-04-2021 01:45:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_IHMCLVehicleClassUpload]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[USP_IHMCLVehicleClassUpload] 
@FileName varchar(20),
@SessionId varchar(20),
@DataStatus smallint,
@UserId bigint,
@CDateTime DateTime
AS
BEGIN
	DECLARE @Datacnt int
	DECLARE @EventId smallint=6;
	CREATE TABLE #Temp(AlertMessage varchar(100))
	CREATE TABLE #TempIHMCLUpload(EntryId smallint,IHMCLClassId smallint NULL,IHMCLClassName nvarchar(100) NULL,IHMCLClassDescription nvarchar(100) NULL,VehicleWeight decimal(18, 3) NULL)
	CREATE TABLE #TempUpload(EntryId smallint,IHMCLClassId smallint NULL,IHMCLClassName nvarchar(100) NULL,IHMCLClassDescription nvarchar(100) NULL,VehicleWeight decimal(18, 3) NULL)
	
	INSERT INTO #TempUpload(EntryId,IHMCLClassId,IHMCLClassName,IHMCLClassDescription,VehicleWeight)
	SELECT 0,ISNULL(ClassId,0),ISNULL(ClassName,0),ISNULL(ClassDescription,''''),ISNULL(VehicleWeight,0)
	FROM Temp_ImportClass WHERE SessionId=@SessionId
	DELETE FROM Temp_ImportClass WHERE SessionId=@SessionId
	
	INSERT INTO #TempIHMCLUpload(EntryId,IHMCLClassId,IHMCLClassName,IHMCLClassDescription,VehicleWeight)
	SELECT EntryId,IHMCLClassId,IHMCLClassName,IHMCLClassDescription,VehicleWeight
	FROM tbl_IHMCLClass 
	
	SELECT @Datacnt=COUNT(1) FROM tbl_IHMCLClass 
	IF(@Datacnt=0)
	BEGIN
		INSERT INTO tbl_IHMCLClass(IHMCLClassId,IHMCLClassName,IHMCLClassDescription,VehicleWeight,DataStatus,CreatedDate,CreatedBy)
		SELECT IHMCLClassId,IHMCLClassName,IHMCLClassDescription,VehicleWeight,@DataStatus,@CDateTime,@UserId 
		FROM #TempUpload
		
		INSERT INTO tbl_ActivityLog(UserId,CurrentColumn,Action,EventId,CreatedDate)
		VALUES(@UserId,@FileName,''Upload'',@EventId,@CDateTime);
		INSERT INTO #Temp(AlertMessage)VALUES(''success'');
	END
	ELSE
	BEGIN
		UPDATE T SET T.EntryId=V.EntryId FROM #TempUpload T INNER JOIN 
		(
			SELECT EntryId,IHMCLClassId,IHMCLClassName,IHMCLClassDescription,VehicleWeight
			FROM #TempIHMCLUpload 
		) V ON T.AvcClassId=V.AvcClassId

		INSERT INTO tbl_IHMCLClass(IHMCLClassId,IHMCLClassName,IHMCLClassDescription,VehicleWeight,DataStatus,CreatedDate,CreatedBy)
		SELECT IHMCLClassId,IHMCLClassName,IHMCLClassDescription,VehicleWeight,@DataStatus,@CDateTime,@UserId 
		FROM #TempUpload WHERE EntryId=0

		UPDATE T SET T.IHMCLClassName=V.IHMCLClassName,T.IHMCLClassDescription=V.IHMCLClassDescription,
		T.VehicleWeight=V.VehicleWeight,T.ModifiedBy=@UserId,T.ModifiedDate=@CDateTime
		FROM tbl_IHMCLClass T INNER JOIN 
		(
			SELECT EntryId,IHMCLClassId,IHMCLClassName,IHMCLClassDescription,VehicleWeight
			FROM #TempUpload WHERE EntryId<>0  
		) V ON T.EntryId=V.EntryId

		INSERT INTO tbl_ActivityLog(UserId,CurrentColumn,Action,EventId,CreatedDate)
		VALUES(@UserId,@FileName,''Upload'',@EventId,@CDateTime);
		INSERT INTO #Temp(AlertMessage)VALUES(''success'');
	END
	select * from #Temp;
END
--GO 
--EXEC USP_AVCVehicleClassUpload
--@FileName =''ABC'',
--@SessionId=''MO71EKB5ED'',
--@ClientId =0,
--@DataStatus =1,
--@UserId =0,
--@CDateTime=''2021-04-07''' 
END
GO
/****** Object:  StoredProcedure [dbo].[USP_MenuGetAll]    Script Date: 12-04-2021 01:45:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_MenuGetAll]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[USP_MenuGetAll]
AS BEGIN
	
		SELECT M.EntryId,M.MenuName,M.MenuURL,M.MenuIcon,M.OderBy,M.ParentId
        FROM tbl_MenuMaster M
		ORDER BY OderBy
END

--GO
--EXEC USP_UsersGetByLoginId
--@LoginId=''admin''
' 
END
GO
/****** Object:  StoredProcedure [dbo].[USP_PlazaGetAll]    Script Date: 12-04-2021 01:45:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_PlazaGetAll]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[USP_PlazaGetAll] 

AS
BEGIN
	Select P.EntryId,P.ClientId,C.ClientName,P.PlazaName,P.PlazaServerIpAddress,P.PlazaServerName,P.DataSendAPI,P.DataReceiveAPI,P.FTPPath,P.FTPLoginId
	,P.FTPPassword,P.DataStatus,P.CreatedDate,P.CreatedBy,P.ModifiedDate,P.ModifiedBy 
	from tbl_PlazaConfiguration P INNER JOIN tbl_ClientConfiguration C ON P.ClientId=C.EntryId
END

' 
END
GO
/****** Object:  StoredProcedure [dbo].[USP_PlazaGetbyId]    Script Date: 12-04-2021 01:45:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_PlazaGetbyId]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[USP_PlazaGetbyId] 
@EntryId int
AS
BEGIN
	Select P.EntryId,P.ClientId,C.ClientName,P.PlazaName,P.PlazaServerIpAddress,P.PlazaServerName,P.DataSendAPI,P.DataReceiveAPI,P.FTPPath,P.FTPLoginId
	,P.FTPPassword,P.DataStatus,P.CreatedDate,P.CreatedBy,P.ModifiedDate,P.ModifiedBy 
	from tbl_PlazaConfiguration P INNER JOIN tbl_ClientConfiguration C ON P.ClientId=C.EntryId
	WHERE P.EntryId=@EntryId
END

' 
END
GO
/****** Object:  StoredProcedure [dbo].[USP_PlazaInsertUpdate]    Script Date: 12-04-2021 01:45:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_PlazaInsertUpdate]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[USP_PlazaInsertUpdate] 
@EntryId int,
@ClientId smallint,
@PlazaName nvarchar(100),
@PlazaServerIpAddress nvarchar(20),
@DataSendAPI nvarchar(200),
@DataReceiveAPI nvarchar(200),
@FTPPath nvarchar(200),
@FTPLoginId nvarchar(20),
@FTPPassword nvarchar(20),
@DataStatus smallint,
@UserId bigint,
@CDateTime DateTime
AS
BEGIN
	DECLARE @PVal varchar(4000)
	DECLARE @CVal varchar(4000)
	DECLARE @EventId smallint=4;
	CREATE TABLE #Temp(AlertMessage varchar(100))
	DECLARE @cnt int
	
	IF EXISTS(SELECT EntryId FROM tbl_PlazaConfiguration where PlazaServerIpAddress=@PlazaServerIpAddress AND EntryId<>@EntryId)
	BEGIN
		INSERT INTO #Temp(AlertMessage)
		VALUES(''Server IP Address already exists'')
	END
	IF EXISTS(SELECT EntryId FROM tbl_PlazaConfiguration where FTPPath=@FTPPath AND EntryId<>@EntryId)
	BEGIN
		INSERT INTO #Temp(AlertMessage)
		VALUES(''FTP path already exists'')
	END
	
	SELECT @cnt=COUNT(AlertMessage)  FROM #Temp
	IF(@cnt=0)
		BEGIN
			IF(@EntryId=0)
			BEGIN
				
				insert into tbl_PlazaConfiguration(ClientId,PlazaName,PlazaServerIpAddress,DataSendAPI,DataReceiveAPI,FTPPath,FTPLoginId,FTPPassword,DataStatus,CreatedDate,CreatedBy)
				values(@ClientId,@PlazaName,@PlazaServerIpAddress,@DataSendAPI,@DataReceiveAPI,@FTPPath,@FTPLoginId,@FTPPassword,@DataStatus,@CDateTime,@UserId);
				SELECT @EntryId=@@IDENTITY
				
				--Set @CVal =''PlazaId:''+convert(varchar,@EntryId)+'',PlazaName:''+@PlazaName+'',IpAddress:''+@PlazaServerIpAddress+
				--'',DataSendAPI:''+@DataSendAPI+'',DataReceiveAPI:''+@DataReceiveAPI+'',FTP:''+@FTPPath+'',LoginId:''+@FTPLoginId+'',Password:''+@FTPPassword+
				--'',Status:''+CONVERT(varchar,@DataStatus)+'',ClientId:''+CONVERT(varchar,@ClientId)			
				
				--INSERT INTO tbl_ActivityLog(UserId,CurrentColumn,Action,EventId,CreatedDate)
				--VALUES(@UserId,@CVal,''Insert'',@EventId,@CDateTime);
				
				INSERT INTO #Temp(AlertMessage)VALUES(''success'');
			END
			ELSE
			BEGIN
				DECLARE @LClientId smallint				DECLARE @LPlazaName nvarchar(100)				DECLARE @LPlazaServerIpAddress nvarchar(20)
				DECLARE @LDataSendAPI nvarchar(200)		DECLARE @LDataReceiveAPI nvarchar(200)			DECLARE @LFTPPath nvarchar(200)
				DECLARE @LFTPLoginId nvarchar(20)		DECLARE @LFTPPassword nvarchar(20)				DECLARE @LDataStatus smallint

				Select @LClientId=ClientId,@LPlazaName=PlazaName,@LPlazaServerIpAddress=PlazaServerIpAddress,@LDataSendAPI=DataSendAPI,
				@LDataReceiveAPI=DataReceiveAPI,@LFTPPath=FTPPath,@LFTPLoginId=FTPLoginId,@LFTPPassword=FTPPassword,
				@LDataStatus=DataStatus 
				from tbl_PlazaConfiguration where EntryId=@EntryId;

				UPDATE tbl_PlazaConfiguration SET ClientId=@ClientId,PlazaName=@PlazaName,PlazaServerIpAddress=@PlazaServerIpAddress,
				DataSendAPI=@DataSendAPI,DataReceiveAPI=@DataReceiveAPI,FTPPath=@FTPPath,FTPLoginId=@FTPLoginId,FTPPassword=@FTPPassword,
				DataStatus=@DataStatus,ModifiedDate=@CDateTime,ModifiedBy=@UserId
				WHERE EntryId=@EntryId
			
				Set @CVal =''PlazaId:''+convert(varchar,@EntryId)+'',PlazaName:''+@PlazaName+'',IpAddress:''+@PlazaServerIpAddress+
				'',DataSendAPI:''+@DataSendAPI+'',DataReceiveAPI:''+@DataReceiveAPI+'',FTP:''+@FTPPath+'',LoginId:''+@FTPLoginId+'',Password:''+@FTPPassword+
				'',Status:''+CONVERT(varchar,@DataStatus)+'',ClientId:''+CONVERT(varchar,@ClientId)				
				
				Set @PVal =''PlazaId:''+convert(varchar,@EntryId)+'',PlazaName:''+@PlazaName+'',IpAddress:''+@PlazaServerIpAddress+
				'',DataSendAPI:''+@DataSendAPI+'',DataReceiveAPI:''+@DataReceiveAPI+'',FTP:''+@FTPPath+'',LoginId:''+@FTPLoginId+'',Password:''+@FTPPassword+
				'',Status:''+CONVERT(varchar,@DataStatus)+'',ClientId:''+CONVERT(varchar,@ClientId)	
					
				INSERT INTO tbl_ActivityLog(UserId,PrevColumn,CurrentColumn,Action,EventId,CreatedDate)
				VALUES(@UserId,@PVal,@CVal,''Update'',@EventId,@CDateTime);

				INSERT INTO #Temp(AlertMessage)VALUES(''success'');
			END
		END
		select * from #Temp;
END
--GO 
--EXEC USP_PlazaInsertUpdate
--@EntryId =0,
--@ClientId =1,
--@PlazaName =''Plaza 1'',--
--@PlazaServerIpAddress =''192.168.0.1'',--
--@DataSendAPI =''http://182.74.121.114:6076/VaaaN/TTE-Events/RoadSideEvents'',--
--@DataReceiveAPI =''http://182.74.121.114:6076/VaaaN/TTE-Events/RoadSideEvents'',--
--@FTPPath =''ftp://ftp.example.com/Batch_File'',--
--@FTPLoginId =''admin'',
--@FTPPassword =''admin'',
--@DataStatus =1,
--@UserId =0,
--@CDateTime=''2021-04-07''' 
END
GO
/****** Object:  StoredProcedure [dbo].[USP_PlazaMappingGetAll]    Script Date: 12-04-2021 01:45:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_PlazaMappingGetAll]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[USP_PlazaMappingGetAll]
AS BEGIN
CREATE TABLE #PlazaMapping(EntryId int identity,EntryPlazaId int,EntryPlazaName nvarchar(100),ExitPlazaId int,ExitPlazaName nvarchar(100),
PlazaDistance decimal(18,3) DEFAULT 0,DataStatus smallint DEFAULT 1,CreatedDate datetime,CreatedBy int,ModifiedDate datetime,ModifiedBy int) 

INSERT INTO #PlazaMapping(EntryPlazaId,EntryPlazaName,ExitPlazaId,ExitPlazaName)
SELECT S.EntryId,S.PlazaName,D.EntryId,D.PlazaName
FROM tbl_PlazaConfiguration S INNER JOIN tbl_PlazaConfiguration D ON S.EntryId <> D.EntryId
ORDER BY S.EntryId

UPDATE T SET T.PlazaDistance=V.PlazaDistance,T.DataStatus=V.DataStatus,
T.CreatedDate=V.CreatedDate,T.CreatedBy=V.CreatedBy,T.ModifiedDate=V.ModifiedDate,T.ModifiedBy =V.ModifiedBy
FROM #PlazaMapping T  INNER JOIN 
(
SELECT EntryPlazaId,ExitPlazaId,ISNULL(PlazaDistance,0) PlazaDistance,ISNULL(DataStatus,1) DataStatus,
CreatedDate,CreatedBy,ModifiedDate,ModifiedBy 
FROM tbl_PlazaMapping
) V ON T.EntryPlazaId=V.EntryPlazaId AND T.ExitPlazaId=V.ExitPlazaId 

SELECT * FROM #PlazaMapping
ORDER BY PlazaDistance

END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[USP_PlazaMappingGetbyPlazaId]    Script Date: 12-04-2021 01:45:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_PlazaMappingGetbyPlazaId]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[USP_PlazaMappingGetbyPlazaId]
@PlazId int
AS BEGIN
CREATE TABLE #PlazaMapping(EntryId int identity,EntryPlazaId int,EntryPlazaName nvarchar(100),ExitPlazaId int,ExitPlazaName nvarchar(100),
PlazaDistance decimal(18,3) DEFAULT 0,DataStatus smallint DEFAULT 1,CreatedDate datetime,CreatedBy int,ModifiedDate datetime,ModifiedBy int) 

INSERT INTO #PlazaMapping(EntryPlazaId,EntryPlazaName,ExitPlazaId,ExitPlazaName)
SELECT S.EntryId,S.PlazaName,D.EntryId,D.PlazaName
FROM tbl_PlazaConfiguration S INNER JOIN tbl_PlazaConfiguration D ON S.EntryId <> D.EntryId
WHERE S.EntryId=@PlazId OR D.EntryId=@PlazId

UPDATE T SET T.PlazaDistance=V.PlazaDistance,T.DataStatus=V.DataStatus,
T.CreatedDate=V.CreatedDate,T.CreatedBy=V.CreatedBy,T.ModifiedDate=V.ModifiedDate,T.ModifiedBy =V.ModifiedBy
FROM #PlazaMapping T  INNER JOIN 
(
SELECT EntryPlazaId,ExitPlazaId,ISNULL(PlazaDistance,0) PlazaDistance,ISNULL(DataStatus,1) DataStatus,
CreatedDate,CreatedBy,ModifiedDate,ModifiedBy 
FROM tbl_PlazaMapping
) V ON T.EntryPlazaId=V.EntryPlazaId AND T.ExitPlazaId=V.ExitPlazaId 

SELECT * FROM #PlazaMapping
ORDER BY EntryPlazaId

END
--GO
--EXEC USP_PlazaMappingGetbyPlazaId
--@PlazId=1
' 
END
GO
/****** Object:  StoredProcedure [dbo].[USP_PlazaMappingInsertUpdate]    Script Date: 12-04-2021 01:45:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_PlazaMappingInsertUpdate]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[USP_PlazaMappingInsertUpdate] 
@EntryPlazaId int,
@ExitPlazaId int,
@PlazaDistance decimal(18,3),
@DataStatus smallint,
@UserId bigint,
@CDateTime DateTime
AS
BEGIN
	DECLARE @PVal varchar(4000)
	DECLARE @CVal varchar(4000)
	DECLARE @EventId smallint=5;
	DECLARE @cnt int
	DECLARE @RPlazaDistance decimal(18,3)=0
	CREATE TABLE #Temp(AlertMessage varchar(100))

	SELECT @cnt=COUNT(1)  FROM tbl_PlazaMapping WHERE EntryPlazaId=@EntryPlazaId AND ExitPlazaId=@ExitPlazaId
	IF(@cnt=0)
	BEGIN
		SET @CVal=''EntryPlazaId:''+convert(varchar,@EntryPlazaId)+'',ExitPlazaId:''+convert(varchar,@ExitPlazaId)
		+'',PlazaDistance:''+convert(varchar,@PlazaDistance)+'',DataStatus:''+convert(varchar,@DataStatus)
		
		INSERT INTO tbl_ActivityLog(UserId,CurrentColumn,Action,EventId,CreatedDate)
		VALUES(@UserId,@CVal,''Insert'',@EventId,@CDateTime);
		insert into tbl_PlazaMapping(EntryPlazaId,ExitPlazaId,PlazaDistance,DataStatus,CreatedDate,CreatedBy)
		VALUES(@EntryPlazaId,@ExitPlazaId,@PlazaDistance,@DataStatus,@CDateTime,@UserId)
		
		INSERT INTO #Temp(AlertMessage)VALUES(''success'');
	END
	ELSE
	BEGIN
		DECLARE @LPlazaDistance decimal(18,3)	DECLARE @LDataStatus smallint

		Select @LPlazaDistance=PlazaDistance,@LDataStatus=DataStatus 
		FROM tbl_PlazaMapping WHERE EntryPlazaId=@EntryPlazaId AND ExitPlazaId=@ExitPlazaId
		

		SET @CVal=''EntryPlazaId:''+convert(varchar,@EntryPlazaId)+'',ExitPlazaId:''+convert(varchar,@ExitPlazaId)
		+'',PlazaDistance:''+convert(varchar,@PlazaDistance)+'',DataStatus:''+convert(varchar,@DataStatus)

		SET @PVal=''EntryPlazaId:''+convert(varchar,@EntryPlazaId)+'',ExitPlazaId:''+convert(varchar,@ExitPlazaId)
		+'',PlazaDistance:''+convert(varchar,@LPlazaDistance)+'',DataStatus:''+convert(varchar,@LDataStatus)

		INSERT INTO tbl_ActivityLog(UserId,PrevColumn,CurrentColumn,Action,EventId,CreatedDate)
		VALUES(@UserId,@PVal,@CVal,''Update'',@EventId,@CDateTime);
		
		UPDATE tbl_PlazaMapping SET PlazaDistance=@PlazaDistance,DataStatus=@DataStatus,ModifiedBy=@UserId,ModifiedDate=@CDateTime
		WHERE EntryPlazaId=@EntryPlazaId AND ExitPlazaId=@ExitPlazaId
		INSERT INTO #Temp(AlertMessage)VALUES(''success'');
	END
	select * from #Temp;
END
--GO 
--EXEC USP_PlazaInsertUpdate
--@EntryId =0,
--@ClientId =1,
--@PlazaName =''Plaza 1'',--
--@PlazaServerIpAddress =''192.168.0.1'',--
--@DataSendAPI =''http://182.74.121.114:6076/VaaaN/TTE-Events/RoadSideEvents'',--
--@DataReceiveAPI =''http://182.74.121.114:6076/VaaaN/TTE-Events/RoadSideEvents'',--
--@FTPPath =''ftp://ftp.example.com/Batch_File'',--
--@FTPLoginId =''admin'',
--@FTPPassword =''admin'',
--@DataStatus =1,
--@UserId =0,
--@CDateTime=''2021-04-07''' 
END
GO
/****** Object:  StoredProcedure [dbo].[USP_PlazaMappingValidateInsertUpdate]    Script Date: 12-04-2021 01:45:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_PlazaMappingValidateInsertUpdate]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[USP_PlazaMappingValidateInsertUpdate] 
@EntryPlazaId int,
@ExitPlazaId int,
@PlazaDistance decimal(18,3),
@DataStatus smallint,
@UserId bigint,
@CDateTime DateTime
AS
BEGIN
	DECLARE @PVal varchar(4000)
	DECLARE @CVal varchar(4000)
	DECLARE @EventId smallint=5;
	DECLARE @cnt int
	DECLARE @RPlazaDistance decimal(18,3)=0
	CREATE TABLE #Temp(AlertMessage varchar(100))

	SELECT @RPlazaDistance=PlazaDistance FROM tbl_PlazaMapping WHERE EntryPlazaId=@ExitPlazaId AND ExitPlazaId=@EntryPlazaId
	if(@RPlazaDistance<>0 AND @RPlazaDistance<>@PlazaDistance)
	BEGIN
		INSERT INTO #Temp(AlertMessage)VALUES(''Distance must be ''+CONVERT(varchar,@RPlazaDistance) +'' KM'');
	END
	
	select * from #Temp;
END
--GO 
--EXEC USP_PlazaInsertUpdate
--@EntryId =0,
--@ClientId =1,
--@PlazaName =''Plaza 1'',--
--@PlazaServerIpAddress =''192.168.0.1'',--
--@DataSendAPI =''http://182.74.121.114:6076/VaaaN/TTE-Events/RoadSideEvents'',--
--@DataReceiveAPI =''http://182.74.121.114:6076/VaaaN/TTE-Events/RoadSideEvents'',--
--@FTPPath =''ftp://ftp.example.com/Batch_File'',--
--@FTPLoginId =''admin'',
--@FTPPassword =''admin'',
--@DataStatus =1,
--@UserId =0,
--@CDateTime=''2021-04-07''' 
END
GO
/****** Object:  StoredProcedure [dbo].[USP_RoleInsertUpdate]    Script Date: 12-04-2021 01:45:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_RoleInsertUpdate]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[USP_RoleInsertUpdate] 
@EntryId bigint,
@ClientId smallint,
@PlazaId smallint,
@RoleName nvarchar(200),
@DataStatus smallint,
@UserId bigint,
@CDateTime DateTime

AS
BEGIN
	DECLARE @PVal varchar(4000)
	DECLARE @CVal varchar(4000)
	DECLARE @EventId smallint=2;
	CREATE TABLE #Temp(AlertMessage varchar(100))
	DECLARE @cnt int
	IF EXISTS(SELECT EntryId FROM tbl_RoleMaster where RoleName=@RoleName and EntryId<>@EntryId)
		BEGIN
			INSERT INTO #Temp(AlertMessage)
			VALUES(''Role name already exists!'')
		END
	IF(@EntryId<>0 AND @DataStatus<>1)
	BEGIN
		IF EXISTS(SELECT RoleId FROM tbl_UserMaster where RoleId=@EntryId AND @DataStatus=1)
		BEGIN
			INSERT INTO #Temp(AlertMessage)
			VALUES(''Role cannot inactive due to users already conncted!'')
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
				
				Set @CVal =''RoleId:''+convert(varchar,@EntryId)+'',RoleName:''+@RoleName+'',Status:''+CONVERT(varchar,@DataStatus)
				+'',ClientId:''+CONVERT(varchar,@ClientId)+'',PlazaId:''+CONVERT(varchar,@PlazaId)				
				
				INSERT INTO tbl_ActivityLog(UserId,CurrentColumn,Action,EventId,CreatedDate)
				VALUES(@UserId,@CVal,''Insert'',@EventId,@CDateTime);
				
				INSERT INTO #Temp(AlertMessage)VALUES(''success'');
			END
			ELSE
			BEGIN
				Declare @LClientId smallint			Declare @LPlazaId smallint			
				Declare @LRoleName nvarchar(200)	Declare @LDataStatus smallint
			
				Select @LClientId=ClientId,@LPlazaId=PlazaId,@LRoleName=RoleName,@LDataStatus=DataStatus
				from tbl_RoleMaster where EntryId=@EntryId;

				UPDATE tbl_RoleMaster SET ClientId=@ClientId,PlazaId=@PlazaId,RoleName=@RoleName,
				DataStatus=@DataStatus,ModifiedDate=@CDateTime,ModifiedBy=@UserId
				WHERE EntryId=@EntryId
			
				Set @CVal =''RoleId:''+convert(varchar,@EntryId)+'',RoleName:''+@RoleName+'',Status:''+CONVERT(varchar,@DataStatus)
					+'',ClientId:''+CONVERT(varchar,@ClientId)+'',PlazaId:''+CONVERT(varchar,@PlazaId)		
				Set @PVal =''RoleId:''+convert(varchar,@EntryId)+'',RoleName:''+@LRoleName+'',Status:''+CONVERT(varchar,@LDataStatus)
					+'',ClientId:''+CONVERT(varchar,@LClientId)+'',PlazaId:''+CONVERT(varchar,@LPlazaId)
					
				INSERT INTO tbl_ActivityLog(UserId,PrevColumn,CurrentColumn,Action,EventId,CreatedDate)
				VALUES(@UserId,@PVal,@CVal,''Update'',@EventId,@CDateTime);

				INSERT INTO #Temp(AlertMessage)VALUES(''success'');
			END
		END
		select * from #Temp;
END

' 
END
GO
/****** Object:  StoredProcedure [dbo].[USP_RolesGetAll]    Script Date: 12-04-2021 01:45:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_RolesGetAll]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[USP_RolesGetAll]

AS BEGIN
	--SELECT R.EntryId,RoleName,R.DataStatus,R.CreatedDate,R.CreatedBy,R.ModifiedDate,R.ModifiedBy,
	--CASE COUNT(EventId) WHEN 0 THEN ''Not set'' ELSE ''Set'' END PermissionStatus  
	--FROM tbl_RoleMaster R LEFT JOIN tbl_RolePermission P ON R.EntryId=P.RoleId where R.DataStatus<>0
	--GROUP BY  R.EntryId,RoleName,R.DataStatus,R.CreatedDate,R.CreatedBy,R.ModifiedDate,R.ModifiedBy

	SELECT EntryId,ClientId,PlazaId,RoleName,DataStatus,CreatedDate,CreatedBy,ModifiedDate,ModifiedBy FROM tbl_RoleMaster 
	ORDER BY ModifiedDate DESC,CreatedDate DESC
END


' 
END
GO
/****** Object:  StoredProcedure [dbo].[USP_RolesGetById]    Script Date: 12-04-2021 01:45:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_RolesGetById]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[USP_RolesGetById]
@EntryId int
AS BEGIN
	SELECT EntryId,ClientId,PlazaId,RoleName,DataStatus,CreatedDate,CreatedBy,ModifiedDate,ModifiedBy	
	FROM tbl_RoleMaster where EntryId=@EntryId
END' 
END
GO
/****** Object:  StoredProcedure [dbo].[USP_UserGetAll]    Script Date: 12-04-2021 01:45:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_UserGetAll]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[USP_UserGetAll]

AS BEGIN
	
	SELECT U.EntryId,U.ClientId,C.ClientName,U.PlazaId,U.LoginId,U.LoginPassword,U.FirstName,U.LastName,U.EmailId,U.MobileNumber,U.AccountExpiredDate,U.RoleId,R.RoleName,U.DataStatus,U.CreatedDate,U.CreatedBy,U.ModifiedDate,U.ModifiedBy 
	FROM tbl_UserMaster U 
	Left Join tbl_RoleMaster R ON U.RoleId=R.EntryId
	Left Join tbl_ClientConfiguration C ON U.ClientId=C.EntryId
	ORDER BY ModifiedDate DESC,CreatedDate DESC
END


' 
END
GO
/****** Object:  StoredProcedure [dbo].[USP_UserGetbyId]    Script Date: 12-04-2021 01:45:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_UserGetbyId]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[USP_UserGetbyId]
@EntryId int
AS BEGIN
	
	SELECT U.EntryId,U.ClientId,C.ClientName,U.PlazaId,U.LoginId,U.LoginPassword,U.FirstName,U.LastName,U.EmailId,U.MobileNumber,U.AccountExpiredDate,U.RoleId,R.RoleName,U.DataStatus,U.CreatedDate,U.CreatedBy,U.ModifiedDate,U.ModifiedBy 
	FROM tbl_UserMaster U 
	Left Join tbl_RoleMaster R ON U.RoleId=R.EntryId
	Left Join tbl_ClientConfiguration C ON U.ClientId=C.EntryId
	WHERE U.EntryId=@EntryId
END


' 
END
GO
/****** Object:  StoredProcedure [dbo].[USP_UserInsertUpdate]    Script Date: 12-04-2021 01:45:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_UserInsertUpdate]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[USP_UserInsertUpdate] 
@EntryId bigint,
@ClientId smallint,
@PlazaId smallint,
@LoginId nvarchar (40),
@LoginPassword nvarchar (200),
@FirstName nvarchar (40),
@LastName nvarchar (40),
@EmailId nvarchar (50),
@MobileNumber nvarchar (30),
@AccountExpiredDate Date,
@RoleId int,
@DataStatus smallint,
@UserId bigint,
@CDateTime DateTime
AS
BEGIN
	DECLARE @PVal varchar(4000)
	DECLARE @CVal varchar(4000)
	DECLARE @EventId smallint=3;
	CREATE TABLE #Temp(AlertMessage varchar(100))
	DECLARE @cnt int
	
	IF EXISTS(SELECT EntryId FROM tbl_UserMaster where MobileNumber=@MobileNumber AND EntryId<>@EntryId)
			BEGIN
				INSERT INTO #Temp(AlertMessage)
				VALUES(''Mobile number already exists'')
			END
	IF EXISTS(SELECT EntryId FROM tbl_UserMaster where EmailId=@EmailId AND EntryId<>@EntryId)
		BEGIN
			INSERT INTO #Temp(AlertMessage)
			VALUES(''Email id already exists'')
		END
	IF EXISTS(SELECT EntryId FROM tbl_UserMaster where LoginId=@LoginId AND EntryId<>@EntryId)
		BEGIN
			INSERT INTO #Temp(AlertMessage)
			VALUES(''Login id already exists'')
		END
	SELECT @cnt=COUNT(AlertMessage)  FROM #Temp
	IF(@cnt=0)
		BEGIN
			IF(@EntryId=0)
			BEGIN
				insert into tbl_UserMaster(ClientId,PlazaId,LoginId,LoginPassword,FirstName,LastName,EmailId,MobileNumber,AccountExpiredDate,RoleId,DataStatus,CreatedDate,CreatedBy)
				values(@ClientId,@PlazaId,@LoginId,@LoginPassword,@FirstName,@LastName,@EmailId,@MobileNumber,@AccountExpiredDate,@RoleId,@DataStatus,@CDateTime,@UserId);
				SELECT @EntryId=@@IDENTITY
				
				Set @CVal =''UserId:''+convert(varchar,@EntryId)+'',FirstName:''+@FirstName+'',LastName:''+@LastName+
				'',EmailId:''+@EmailId+'',MobileNumber:''+@MobileNumber+'',RoleId:''+@RoleId+
				'',Status:''+CONVERT(varchar,@DataStatus)+'',ClientId:''+CONVERT(varchar,@ClientId)+'',PlazaId:''+CONVERT(varchar,@PlazaId)				
				
				INSERT INTO tbl_ActivityLog(UserId,CurrentColumn,Action,EventId,CreatedDate)
				VALUES(@UserId,@CVal,''Insert'',@EventId,@CDateTime);
				
				INSERT INTO #Temp(AlertMessage)VALUES(''success'');
			END
			ELSE
			BEGIN
				Declare @LClientId smallint			Declare @LPlazaId smallint				Declare @LDataStatus smallint		
				Declare @LFirstName nvarchar(40)	Declare @LLastName nvarchar (40)		Declare @LEmailId nvarchar (50)
				Declare @LMobileNumber nvarchar(30)	Declare @LAccountExpiredDate Date		Declare @LRoleId int
				
				Select @LClientId=ClientId,@LPlazaId=PlazaId,@LDataStatus=DataStatus,
				@LFirstName=FirstName,@LLastName=LastName,@LEmailId=EmailId,@LMobileNumber=MobileNumber,@LAccountExpiredDate=AccountExpiredDate,
				@LRoleId=RoleId
				from tbl_UserMaster where EntryId=@EntryId;

				UPDATE tbl_UserMaster SET ClientId=@ClientId,PlazaId=@PlazaId,DataStatus=@DataStatus,ModifiedDate=@CDateTime,ModifiedBy=@UserId,
				FirstName=@FirstName,LastName=@LastName,EmailId=@EmailId,MobileNumber=@MobileNumber,AccountExpiredDate=@AccountExpiredDate,RoleId=@RoleId
				WHERE EntryId=@EntryId
			
				Set @CVal =''UserId:''+convert(varchar,@EntryId)+'',FirstName:''+@FirstName+'',LastName:''+@LastName+
				'',EmailId:''+@EmailId+'',MobileNumber:''+@MobileNumber+'',RoleId:''+convert(varchar,@RoleId)+
				'',Status:''+CONVERT(varchar,@DataStatus)+'',ClientId:''+CONVERT(varchar,@ClientId)+'',PlazaId:''+CONVERT(varchar,@PlazaId)		
				
				Set @PVal =''UserId:''+convert(varchar,@EntryId)+'',FirstName:''+@LFirstName+'',LastName:''+@LLastName+
				'',EmailId:''+@LEmailId+'',MobileNumber:''+@LMobileNumber+'',RoleId:''+convert(varchar,@LRoleId)+
				'',Status:''+CONVERT(varchar,@DataStatus)+'',ClientId:''+CONVERT(varchar,@ClientId)+'',PlazaId:''+CONVERT(varchar,@PlazaId)	
					
				INSERT INTO tbl_ActivityLog(UserId,PrevColumn,CurrentColumn,Action,EventId,CreatedDate)
				VALUES(@UserId,@PVal,@CVal,''Update'',@EventId,@CDateTime);

				INSERT INTO #Temp(AlertMessage)VALUES(''success'');
			END
		END
		select * from #Temp;
END

' 
END
GO
/****** Object:  StoredProcedure [dbo].[USP_UsersGetByLoginId]    Script Date: 12-04-2021 01:45:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_UsersGetByLoginId]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[USP_UsersGetByLoginId]
@LoginId varchar(50)
AS BEGIN
	
	SELECT U.EntryId,U.ClientId,C.ClientName,U.PlazaId,U.LoginId,U.LoginPassword,U.FirstName,U.LastName,U.EmailId,U.MobileNumber,U.AccountExpiredDate,U.RoleId,R.RoleName,U.DataStatus,U.CreatedDate,U.CreatedBy,U.ModifiedDate,U.ModifiedBy 
	FROM tbl_UserMaster U 
	Left Join tbl_RoleMaster R ON U.RoleId=R.EntryId
	Left Join tbl_ClientConfiguration C ON U.ClientId=C.EntryId
	WHERE LoginId = @LoginId;
	
	
	
END

--GO
--EXEC USP_UsersGetByLoginId
--@LoginId=''admin''
' 
END
GO
/****** Object:  StoredProcedure [dbo].[USP_VehicleClassGetAll]    Script Date: 12-04-2021 01:45:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_VehicleClassGetAll]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[USP_VehicleClassGetAll]
AS BEGIN
	SELECT
	VC.AVCClassId,A.AvcClassName,A.AvcClassDescription,A.AxleCount,A.VehicleHeight,A.VehicleWidth,A.VehicleLength,A.VehicleWeight AS AVCVehicleWeight,
	VC.IHMCLClassId,I.IHMCLClassName,I.IHMCLClassDescription,I.VehicleWeight AS IHMCLVehicleWeight,
	VC.EntryId,VC.ClientId,C.ClientName,VC.ClassId,VC.ClassName,VC.ClassDescription,VC.VehicleWeight,VC.DataStatus,
	VC.CreatedDate,VC.CreatedBy,VC.ModifiedDate,VC.ModifiedBy 
	FROM tbl_VehicleClassMapping VC 
	INNER JOIN tbl_ClientConfiguration C ON VC.ClientId=C.EntryId
	INNER JOIN tbl_AVCClass A ON VC.AVCClassId=A.AvcClassId AND VC.ClientId=A.ClientId
	INNER JOIN tbl_IHMCLClass I ON VC.IHMCLClassId=I.IHMCLClassId
	
END


' 
END
GO
/****** Object:  StoredProcedure [dbo].[USP_VehicleClassGetClassId]    Script Date: 12-04-2021 01:45:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_VehicleClassGetClassId]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[USP_VehicleClassGetClassId]
@ClassId smallint
AS BEGIN
	SELECT
	VC.AVCClassId,A.AvcClassName,A.AvcClassDescription,A.AxleCount,A.VehicleHeight,A.VehicleWidth,A.VehicleLength,A.VehicleWeight AS AVCVehicleWeight,
	VC.IHMCLClassId,I.IHMCLClassName,I.IHMCLClassDescription,I.VehicleWeight AS IHMCLVehicleWeight,
	VC.EntryId,VC.ClientId,C.ClientName,VC.ClassId,VC.ClassName,VC.ClassDescription,VC.VehicleWeight,VC.DataStatus,
	VC.CreatedDate,VC.CreatedBy,VC.ModifiedDate,VC.ModifiedBy 
	FROM tbl_VehicleClassMapping VC 
	INNER JOIN tbl_ClientConfiguration C ON VC.ClientId=C.EntryId
	INNER JOIN tbl_AVCClass A ON VC.AVCClassId=A.AvcClassId AND VC.ClientId=A.ClientId
	INNER JOIN tbl_IHMCLClass I ON VC.IHMCLClassId=I.IHMCLClassId
	WHERE VC.ClassId=ClassId
END


' 
END
GO
/****** Object:  StoredProcedure [dbo].[USP_VehicleClassGetClientId]    Script Date: 12-04-2021 01:45:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_VehicleClassGetClientId]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[USP_VehicleClassGetClientId]
@ClientId smallint
AS BEGIN
	SELECT
	VC.AVCClassId,A.AvcClassName,A.AvcClassDescription,A.AxleCount,A.VehicleHeight,A.VehicleWidth,A.VehicleLength,A.VehicleWeight AS AVCVehicleWeight,
	VC.IHMCLClassId,I.IHMCLClassName,I.IHMCLClassDescription,I.VehicleWeight AS IHMCLVehicleWeight,
	VC.EntryId,VC.ClientId,C.ClientName,VC.ClassId,VC.ClassName,VC.ClassDescription,VC.VehicleWeight,VC.DataStatus,
	VC.CreatedDate,VC.CreatedBy,VC.ModifiedDate,VC.ModifiedBy 
	FROM tbl_VehicleClassMapping VC 
	INNER JOIN tbl_ClientConfiguration C ON VC.ClientId=C.EntryId
	INNER JOIN tbl_AVCClass A ON VC.AVCClassId=A.AvcClassId AND VC.ClientId=A.ClientId
	INNER JOIN tbl_IHMCLClass I ON VC.IHMCLClassId=I.IHMCLClassId
	WHERE VC.ClientId=@ClientId
END


' 
END
GO
/****** Object:  StoredProcedure [dbo].[USP_VehicleClassGetEntryId]    Script Date: 12-04-2021 01:45:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_VehicleClassGetEntryId]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[USP_VehicleClassGetEntryId]
@EntryId smallint
AS BEGIN
	SELECT
	VC.AVCClassId,A.AvcClassName,A.AvcClassDescription,A.AxleCount,A.VehicleHeight,A.VehicleWidth,A.VehicleLength,A.VehicleWeight AS AVCVehicleWeight,
	VC.IHMCLClassId,I.IHMCLClassName,I.IHMCLClassDescription,I.VehicleWeight AS IHMCLVehicleWeight,
	VC.EntryId,VC.ClientId,C.ClientName,VC.ClassId,VC.ClassName,VC.ClassDescription,VC.VehicleWeight,VC.DataStatus,
	VC.CreatedDate,VC.CreatedBy,VC.ModifiedDate,VC.ModifiedBy 
	FROM tbl_VehicleClassMapping VC 
	INNER JOIN tbl_ClientConfiguration C ON VC.ClientId=C.EntryId
	INNER JOIN tbl_AVCClass A ON VC.AVCClassId=A.AvcClassId AND VC.ClientId=A.ClientId
	INNER JOIN tbl_IHMCLClass I ON VC.IHMCLClassId=I.IHMCLClassId
	WHERE VC.EntryId=@EntryId
END


' 
END
GO
/****** Object:  StoredProcedure [dbo].[USP_VehicleClassInsertUpdate]    Script Date: 12-04-2021 01:45:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_VehicleClassInsertUpdate]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[USP_VehicleClassInsertUpdate] 
@EntryId int,
@ClientId smallint,
@ClassId smallint,
@AVCClassId smallint,
@IHMCLClassId smallint,
@ClassName nvarchar(200),
@ClassDescription nvarchar(200),
@VehicleWeight decimal(18,3),
@DataStatus smallint,
@UserId bigint,
@CDateTime DateTime
AS
BEGIN
	DECLARE @PVal varchar(4000)
	DECLARE @CVal varchar(4000)
	DECLARE @EventId smallint=7;
	CREATE TABLE #Temp(AlertMessage varchar(100))
	DECLARE @cnt int
	--tbl_VehicleClassMapping
	IF EXISTS(SELECT EntryId FROM tbl_VehicleClassMapping where AVCClassId=@AVCClassId AND IHMCLClassId=@IHMCLClassId AND ClientId=@ClientId AND EntryId<>@EntryId)
	BEGIN
		INSERT INTO #Temp(AlertMessage)
		VALUES(''This mapping alreday done'')
	END
	SELECT @cnt=COUNT(AlertMessage)  FROM #Temp
	IF(@cnt=0)
		BEGIN
			IF(@EntryId=0)
			BEGIN
				
				insert into tbl_VehicleClassMapping(ClientId,ClassId,AVCClassId,IHMCLClassId,ClassName,ClassDescription,VehicleWeight,DataStatus,CreatedDate,CreatedBy)
				values(@ClientId,@ClassId,@AVCClassId,@IHMCLClassId,@ClassName,@ClassDescription,@VehicleWeight,@DataStatus,@CDateTime,@UserId);
				SELECT @EntryId=@@IDENTITY
				
				Set @CVal =''EntryId:''+convert(varchar,@EntryId)+'',ClassId:''+convert(varchar,@ClassId)+'',AVCClassId:''+convert(varchar,@AVCClassId)+''IHMCLClassId:''+convert(varchar,@IHMCLClassId)+
				'',ClassName:''+@ClassName+'',Description:''+ISNULL(@ClassDescription,'''')+
				'',VehicleWeight:''+convert(varchar,@VehicleWeight)+'',Status:''+CONVERT(varchar,@DataStatus)+'',ClientId:''+CONVERT(varchar,@ClientId)			
				
				INSERT INTO tbl_ActivityLog(UserId,CurrentColumn,Action,EventId,CreatedDate)
				VALUES(@UserId,@CVal,''Insert'',@EventId,@CDateTime);
				
				INSERT INTO #Temp(AlertMessage)VALUES(''success'');
			END
			ELSE
			BEGIN
				DECLARE @LClassId smallint				DECLARE @LAVCClassId smallint						DECLARE @LIHMCLClassId smallint
				DECLARE @LClassName nvarchar(200)		DECLARE @LClassDescription nvarchar(200)			DECLARE @LVehicleWeight decimal(18,3)
				DECLARE @LDataStatus smallint
				Select @LClassId=ClassId,@LAVCClassId=AVCClassId,@LIHMCLClassId=IHMCLClassId,
				@LClassName=ClassName,@LClassDescription=ClassDescription,@LVehicleWeight=VehicleWeight,
				@LDataStatus=DataStatus 
				from tbl_VehicleClassMapping WHERE EntryId=@EntryId AND ClientId=@ClientId

				UPDATE tbl_VehicleClassMapping SET ClassId=@ClassId,AVCClassId=@AVCClassId,IHMCLClassId=@IHMCLClassId,
				ClassName=@ClassName,ClassDescription=@ClassDescription,VehicleWeight=@VehicleWeight,
				DataStatus=@DataStatus,ModifiedDate=@CDateTime,ModifiedBy=@UserId
				WHERE EntryId=@EntryId AND ClientId=@ClientId
			
				Set @CVal =''EntryId:''+convert(varchar,@EntryId)+'',ClassId:''+convert(varchar,@ClassId)+'',AVCClassId:''+convert(varchar,@AVCClassId)+''IHMCLClassId:''+convert(varchar,@IHMCLClassId)+
				'',ClassName:''+@ClassName+'',Description:''+ISNULL(@ClassDescription,'''')+
				'',VehicleWeight:''+convert(varchar,@VehicleWeight)+'',Status:''+CONVERT(varchar,@DataStatus)+'',ClientId:''+CONVERT(varchar,@ClientId)			
				
				Set @PVal =''EntryId:''+convert(varchar,@EntryId)+'',ClassId:''+convert(varchar,@LClassId)+'',AVCClassId:''+convert(varchar,@LAVCClassId)+''IHMCLClassId:''+convert(varchar,@LIHMCLClassId)+
				'',ClassName:''+@LClassName+'',Description:''+ISNULL(@LClassDescription,'''')+
				'',VehicleWeight:''+convert(varchar,@LVehicleWeight)+'',Status:''+CONVERT(varchar,@LDataStatus)+'',ClientId:''+CONVERT(varchar,@ClientId)	

				INSERT INTO tbl_ActivityLog(UserId,PrevColumn,CurrentColumn,Action,EventId,CreatedDate)
				VALUES(@UserId,@PVal,@CVal,''Update'',@EventId,@CDateTime);

				INSERT INTO #Temp(AlertMessage)VALUES(''success'');
			END
		END
		select * from #Temp;
END
--GO 
--EXEC USP_PlazaInsertUpdate
--@EntryId =0,
--@ClientId =1,
--@PlazaName =''Plaza 1'',--
--@PlazaServerIpAddress =''192.168.0.1'',--
--@DataSendAPI =''http://182.74.121.114:6076/VaaaN/TTE-Events/RoadSideEvents'',--
--@DataReceiveAPI =''http://182.74.121.114:6076/VaaaN/TTE-Events/RoadSideEvents'',--
--@FTPPath =''ftp://ftp.example.com/Batch_File'',--
--@FTPLoginId =''admin'',
--@FTPPassword =''admin'',
--@DataStatus =1,
--@UserId =0,
--@CDateTime=''2021-04-07''' 
END
GO
/****** Object:  Table [dbo].[SampleIHMCLClass]    Script Date: 12-04-2021 01:45:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SampleIHMCLClass]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SampleIHMCLClass](
	[ClassId] [float] NULL,
	[Description] [nvarchar](255) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[SampleLaneData]    Script Date: 12-04-2021 01:45:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SampleLaneData]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SampleLaneData](
	[TollTransactionNumber] [float] NULL,
	[PlazaID] [float] NULL,
	[ShiftNumber] [float] NULL,
	[UserID] [nvarchar](255) NULL,
	[ShiftTypes] [nvarchar](255) NULL,
	[DateTime] [datetime] NULL,
	[LaneID] [float] NULL,
	[TCClass] [float] NULL,
	[ReceiptNumber] [float] NULL,
	[ReferenceID] [nvarchar](255) NULL,
	[AccountID] [float] NULL,
	[PaymentMeansType] [float] NULL,
	[MeansID] [float] NULL,
	[PlateNumber] [nvarchar](255) NULL,
	[Amount] [float] NULL,
	[FareID] [float] NULL,
	[ExemptionID] [float] NULL,
	[PaymentMethod] [float] NULL,
	[AVCTransactionNo] [float] NULL,
	[AVCClass] [float] NULL,
	[Simulation] [float] NULL,
	[CanceledReceipt] [float] NULL,
	[TowVehicle] [float] NULL,
	[ValidatorID] [nvarchar](255) NULL,
	[ValidatorClass] [float] NULL,
	[ValidatorAmount] [float] NULL,
	[ValidationDateTime] [datetime] NULL,
	[CorrectionReasonID] [float] NULL,
	[ValidationMode] [nvarchar](255) NULL,
	[BagNumber] [float] NULL,
	[ManualShiftType] [nvarchar](255) NULL,
	[OperationDay] [datetime] NULL,
	[createddate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[TCRemark] [nvarchar](255) NULL,
	[ValidatorRemark] [nvarchar](255) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[tbl_ActivityLog]    Script Date: 12-04-2021 01:45:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_ActivityLog]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tbl_ActivityLog](
	[EntryId] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [bigint] NULL,
	[PrevColumn] [varchar](4000) NULL,
	[CurrentColumn] [varchar](4000) NULL,
	[Action] [varchar](50) NULL,
	[EventId] [varchar](50) NULL,
	[CreatedDate] [datetime] NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_AVCClass]    Script Date: 12-04-2021 01:45:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_AVCClass]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tbl_AVCClass](
	[EntryId] [smallint] IDENTITY(1,1) NOT NULL,
	[ClientId] [smallint] NULL,
	[AvcClassId] [smallint] NULL,
	[AvcClassName] [nvarchar](100) NULL,
	[AvcClassDescription] [nvarchar](100) NULL,
	[AxleCount] [smallint] NULL,
	[VehicleHeight] [decimal](18, 4) NULL,
	[VehicleWidth] [decimal](18, 4) NULL,
	[VehicleLength] [decimal](18, 4) NULL,
	[VehicleWeight] [decimal](18, 3) NULL,
	[DataStatus] [smallint] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[tbl_ClientConfiguration]    Script Date: 12-04-2021 01:45:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_ClientConfiguration]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tbl_ClientConfiguration](
	[EntryId] [int] IDENTITY(1,1) NOT NULL,
	[ClientName] [nvarchar](50) NULL,
	[ClientAddress] [nvarchar](100) NULL,
	[MobileNumber] [nvarchar](10) NULL,
	[EmailId] [nvarchar](25) NULL,
	[DataStatus] [smallint] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[tbl_EntryLaneTransaction]    Script Date: 12-04-2021 01:45:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_EntryLaneTransaction]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tbl_EntryLaneTransaction](
	[EntryId] [bigint] IDENTITY(1,1) NOT NULL,
	[ClientId] [smallint] NULL,
	[PlazaId] [int] NULL,
	[LaneNumber] [smallint] NULL,
	[LaneType] [smallint] NULL,
	[ShiftId] [smallint] NULL,
	[UserId] [bigint] NULL,
	[PlateNumber] [varchar](20) NULL,
	[MappingClassId] [smallint] NULL,
	[AVCClassId] [smallint] NULL,
	[IHMCLClassId] [smallint] NULL,
	[TransactionTypeId] [smallint] NULL,
	[ExemptTypeId] [smallint] NULL,
	[ReceiptNumber] [varchar](100) NULL,
	[TransactionAmount] [decimal](18, 2) NULL,
	[TransactionTimeStamp] [datetime] NULL,
	[TransactionImage] [varchar](255) NULL,
	[TransactionVideo] [varchar](255) NULL,
	[ReveiwedPlateNumber] [varchar](20) NULL,
	[ReveiwedClassId] [smallint] NULL,
	[ReveiwedAVCClassId] [smallint] NULL,
	[ReveiwedTransactionType] [smallint] NULL,
	[ReveiwedExemptType] [smallint] NULL,
	[ReveiwedTransactionAmount] [decimal](18, 2) NULL,
	[ReveiwedBy] [bigint] NULL,
	[ReveiwedStatus] [smallint] NULL,
	[ReveiwedTimeStamp] [datetime] NULL,
	[ReveiwedRemark] [varchar](255) NULL,
	[ReferenceTransactionId] [bigint] NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_ExemptTypeMaster]    Script Date: 12-04-2021 01:45:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_ExemptTypeMaster]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tbl_ExemptTypeMaster](
	[EntryId] [smallint] IDENTITY(1,1) NOT NULL,
	[ClientId] [smallint] NULL,
	[ExemptTypeName] [nvarchar](100) NULL,
	[CreationDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModificationDate] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[DataStatus] [smallint] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[tbl_ExitLaneTransaction]    Script Date: 12-04-2021 01:45:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_ExitLaneTransaction]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tbl_ExitLaneTransaction](
	[EntryId] [bigint] IDENTITY(1,1) NOT NULL,
	[ClientId] [smallint] NULL,
	[PlazaId] [int] NULL,
	[LaneNumber] [smallint] NULL,
	[LaneType] [smallint] NULL,
	[ShiftId] [smallint] NULL,
	[UserId] [bigint] NULL,
	[PlateNumber] [varchar](20) NULL,
	[MappingClassId] [smallint] NULL,
	[AVCClassId] [smallint] NULL,
	[IHMCLClassId] [smallint] NULL,
	[TransactionTypeId] [smallint] NULL,
	[ExemptTypeId] [smallint] NULL,
	[ReceiptNumber] [varchar](100) NULL,
	[TransactionAmount] [decimal](18, 2) NULL,
	[TransactionTimeStamp] [datetime] NULL,
	[TransactionImage] [varchar](255) NULL,
	[TransactionVideo] [varchar](255) NULL,
	[ReveiwedPlateNumber] [varchar](20) NULL,
	[ReveiwedClassId] [smallint] NULL,
	[ReveiwedAVCClassId] [smallint] NULL,
	[ReveiwedTransactionType] [smallint] NULL,
	[ReveiwedExemptType] [smallint] NULL,
	[ReveiwedTransactionAmount] [decimal](18, 2) NULL,
	[ReveiwedBy] [bigint] NULL,
	[ReveiwedStatus] [smallint] NULL,
	[ReveiwedTimeStamp] [datetime] NULL,
	[ReveiwedRemark] [varchar](255) NULL,
	[ReferenceTransactionId] [bigint] NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_FareConfiguration]    Script Date: 12-04-2021 01:45:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_FareConfiguration]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tbl_FareConfiguration](
	[EntryId] [int] IDENTITY(1,1) NOT NULL,
	[ClientId] [smallint] NULL,
	[PlazaMappingId] [int] NULL,
	[ClassId] [int] NULL,
	[Fare] [decimal](18, 2) NULL,
	[OverweightFare] [decimal](18, 2) NULL,
	[CreationDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModificationDate] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[DataStatus] [smallint] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[tbl_IHMCLClass]    Script Date: 12-04-2021 01:45:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_IHMCLClass]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tbl_IHMCLClass](
	[EntryId] [smallint] IDENTITY(1,1) NOT NULL,
	[IHMCLClassId] [smallint] NULL,
	[IHMCLClassName] [nvarchar](100) NULL,
	[IHMCLClassDescription] [nvarchar](100) NULL,
	[VehicleWeight] [decimal](18, 3) NULL,
	[DataStatus] [smallint] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[tbl_LaneConfiguration]    Script Date: 12-04-2021 01:45:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_LaneConfiguration]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tbl_LaneConfiguration](
	[EntryId] [int] IDENTITY(1,1) NOT NULL,
	[ClientId] [smallint] NULL,
	[PlazaId] [int] NULL,
	[LaneNumber] [smallint] NULL,
	[LaneType] [smallint] NULL,
	[CreationDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModificationDate] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[DataStatus] [smallint] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[tbl_MenuMaster]    Script Date: 12-04-2021 01:45:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_MenuMaster]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tbl_MenuMaster](
	[EntryId] [int] IDENTITY(1,1) NOT NULL,
	[MenuName] [varchar](20) NULL,
	[MenuURL] [varchar](100) NULL,
	[MenuIcon] [varchar](100) NULL,
	[OderBy] [smallint] NULL,
	[ParentId] [bigint] NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_MenuMaster_bkp]    Script Date: 12-04-2021 01:45:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_MenuMaster_bkp]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tbl_MenuMaster_bkp](
	[EntryId] [int] IDENTITY(1,1) NOT NULL,
	[MenuName] [varchar](20) NULL,
	[MenuURL] [varchar](100) NULL,
	[MenuIcon] [varchar](100) NULL,
	[OderBy] [smallint] NULL,
	[ParentId] [bigint] NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_PermissionMaster]    Script Date: 12-04-2021 01:45:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_PermissionMaster]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tbl_PermissionMaster](
	[EntryId] [int] IDENTITY(1,1) NOT NULL,
	[ClientId] [smallint] NULL,
	[EventName] [nvarchar](100) NULL,
	[DataView] [smallint] NULL,
	[DataAdd] [smallint] NULL,
	[DataUpdate] [smallint] NULL,
	[CreationDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModificationDate] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[DataStatus] [smallint] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[tbl_PlazaConfiguration]    Script Date: 12-04-2021 01:45:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_PlazaConfiguration]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tbl_PlazaConfiguration](
	[EntryId] [int] IDENTITY(1,1) NOT NULL,
	[ClientId] [smallint] NULL,
	[PlazaName] [nvarchar](50) NULL,
	[PlazaServerIpAddress] [nvarchar](20) NULL,
	[PlazaServerName] [nvarchar](50) NULL,
	[DataSendAPI] [nvarchar](100) NULL,
	[DataReceiveAPI] [nvarchar](100) NULL,
	[FTPPath] [nvarchar](100) NULL,
	[FTPLoginId] [nvarchar](10) NULL,
	[FTPPassword] [nvarchar](10) NULL,
	[DataStatus] [smallint] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[tbl_PlazaMapping]    Script Date: 12-04-2021 01:45:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_PlazaMapping]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tbl_PlazaMapping](
	[EntryPlazaId] [int] NULL,
	[ExitPlazaId] [int] NULL,
	[PlazaDistance] [decimal](18, 3) NULL,
	[DataStatus] [smallint] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[tbl_RoleMaster]    Script Date: 12-04-2021 01:45:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_RoleMaster]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tbl_RoleMaster](
	[EntryId] [int] IDENTITY(1,1) NOT NULL,
	[ClientId] [smallint] NULL,
	[PlazaId] [smallint] NULL,
	[RoleName] [nvarchar](100) NULL,
	[DataStatus] [smallint] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[tbl_RolePermission]    Script Date: 12-04-2021 01:45:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_RolePermission]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tbl_RolePermission](
	[ClientId] [smallint] NULL,
	[EventId] [smallint] NULL,
	[RoleId] [smallint] NULL,
	[DataView] [smallint] NULL,
	[DataAdd] [smallint] NULL,
	[DataUpdate] [smallint] NULL,
	[CreationDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModificationDate] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[DataStatus] [smallint] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[tbl_ShiftTimining]    Script Date: 12-04-2021 01:45:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_ShiftTimining]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tbl_ShiftTimining](
	[EntryId] [smallint] IDENTITY(1,1) NOT NULL,
	[StartTimmng] [varchar](10) NULL,
	[EndTimming] [varchar](10) NULL,
	[CreationDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModificationDate] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[DataStatus] [smallint] NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_TransactionTypeMaster]    Script Date: 12-04-2021 01:45:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_TransactionTypeMaster]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tbl_TransactionTypeMaster](
	[EntryId] [smallint] IDENTITY(1,1) NOT NULL,
	[ClientId] [smallint] NULL,
	[TransactionTypeName] [nvarchar](100) NULL,
	[CreationDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModificationDate] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[DataStatus] [smallint] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[tbl_UserMaster]    Script Date: 12-04-2021 01:45:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_UserMaster]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tbl_UserMaster](
	[EntryId] [int] IDENTITY(1,1) NOT NULL,
	[ClientId] [smallint] NULL,
	[PlazaId] [smallint] NULL,
	[LoginId] [nvarchar](20) NULL,
	[LoginPassword] [nvarchar](100) NULL,
	[FirstName] [nvarchar](20) NULL,
	[LastName] [nvarchar](20) NULL,
	[EmailId] [nvarchar](25) NULL,
	[MobileNumber] [nvarchar](15) NULL,
	[AccountExpiredDate] [date] NULL,
	[RoleId] [int] NULL,
	[DataStatus] [smallint] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[tbl_VehicleClassMapping]    Script Date: 12-04-2021 01:45:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_VehicleClassMapping]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tbl_VehicleClassMapping](
	[EntryId] [smallint] IDENTITY(1,1) NOT NULL,
	[ClientId] [smallint] NULL,
	[ClassId] [smallint] NULL,
	[AVCClassId] [smallint] NULL,
	[IHMCLClassId] [smallint] NULL,
	[ClassName] [nvarchar](100) NULL,
	[ClassDescription] [nvarchar](100) NULL,
	[VehicleWeight] [decimal](18, 3) NULL,
	[DataStatus] [smallint] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Temp_ImportClass]    Script Date: 12-04-2021 01:45:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Temp_ImportClass]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Temp_ImportClass](
	[ClassId] [smallint] NULL,
	[ClassName] [nvarchar](100) NULL,
	[ClassDescription] [nvarchar](100) NULL,
	[AxleCount] [smallint] NULL,
	[VehicleHeight] [decimal](18, 4) NULL,
	[VehicleWidth] [decimal](18, 4) NULL,
	[VehicleLength] [decimal](18, 4) NULL,
	[VehicleWeight] [decimal](18, 3) NULL,
	[SessionId] [varchar](20) NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__tbl_AVCCl__AxleC__6166761E]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_AVCClass] ADD  DEFAULT ((0)) FOR [AxleCount]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__tbl_AVCCl__Vehic__625A9A57]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_AVCClass] ADD  DEFAULT ((0)) FOR [VehicleHeight]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__tbl_AVCCl__Vehic__634EBE90]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_AVCClass] ADD  DEFAULT ((0)) FOR [VehicleWidth]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__tbl_AVCCl__Vehic__6442E2C9]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_AVCClass] ADD  DEFAULT ((0)) FOR [VehicleLength]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__tbl_AVCCl__Vehic__65370702]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_AVCClass] ADD  DEFAULT ((0)) FOR [VehicleWeight]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__tbl_AVCCl__DataS__662B2B3B]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_AVCClass] ADD  DEFAULT ((1)) FOR [DataStatus]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__tbl_Clien__DataS__2180FB33]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_ClientConfiguration] ADD  DEFAULT ((1)) FOR [DataStatus]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__tbl_Entry__Revei__72C60C4A]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_EntryLaneTransaction] ADD  DEFAULT ((0)) FOR [ReveiwedStatus]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__tbl_Entry__Refer__73BA3083]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_EntryLaneTransaction] ADD  DEFAULT ((0)) FOR [ReferenceTransactionId]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__tbl_Exemp__DataS__5CD6CB2B]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_ExemptTypeMaster] ADD  DEFAULT ((1)) FOR [DataStatus]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__tbl_ExitL__Revei__75A278F5]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_ExitLaneTransaction] ADD  DEFAULT ((0)) FOR [ReveiwedStatus]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__tbl_ExitL__Refer__76969D2E]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_ExitLaneTransaction] ADD  DEFAULT ((0)) FOR [ReferenceTransactionId]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__tbl_FareC__DataS__3D5E1FD2]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_FareConfiguration] ADD  DEFAULT ((1)) FOR [DataStatus]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__tbl_IHMCL__Vehic__7755B73D]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_IHMCLClass] ADD  DEFAULT ((0)) FOR [VehicleWeight]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__tbl_IHMCL__DataS__7849DB76]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_IHMCLClass] ADD  DEFAULT ((1)) FOR [DataStatus]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__tbl_LaneC__DataS__25869641]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_LaneConfiguration] ADD  DEFAULT ((1)) FOR [DataStatus]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__tbl_Permi__DataV__2E1BDC42]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_PermissionMaster] ADD  DEFAULT ((1)) FOR [DataView]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__tbl_Permi__DataA__2F10007B]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_PermissionMaster] ADD  DEFAULT ((1)) FOR [DataAdd]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__tbl_Permi__DataU__300424B4]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_PermissionMaster] ADD  DEFAULT ((1)) FOR [DataUpdate]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__tbl_Permi__DataS__30F848ED]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_PermissionMaster] ADD  DEFAULT ((1)) FOR [DataStatus]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__tbl_Plaza__DataS__339FAB6E]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_PlazaConfiguration] ADD  DEFAULT ((1)) FOR [DataStatus]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__tbl_Plaza__DataS__4D5F7D71]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_PlazaMapping] ADD  DEFAULT ((1)) FOR [DataStatus]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__tbl_RoleM__DataS__02084FDA]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_RoleMaster] ADD  DEFAULT ((1)) FOR [DataStatus]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__tbl_RoleP__DataV__32E0915F]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_RolePermission] ADD  DEFAULT ((1)) FOR [DataView]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__tbl_RoleP__DataA__33D4B598]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_RolePermission] ADD  DEFAULT ((1)) FOR [DataAdd]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__tbl_RoleP__DataU__34C8D9D1]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_RolePermission] ADD  DEFAULT ((1)) FOR [DataUpdate]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__tbl_RoleP__DataS__35BCFE0A]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_RolePermission] ADD  DEFAULT ((1)) FOR [DataStatus]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__tbl_Shift__DataS__3F466844]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_ShiftTimining] ADD  DEFAULT ((1)) FOR [DataStatus]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__tbl_Trans__DataS__5EBF139D]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_TransactionTypeMaster] ADD  DEFAULT ((1)) FOR [DataStatus]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__tbl_UserM__DataS__17036CC0]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_UserMaster] ADD  DEFAULT ((1)) FOR [DataStatus]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__tbl_Vehic__Vehic__7FEAFD3E]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_VehicleClassMapping] ADD  DEFAULT ((0)) FOR [VehicleWeight]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__tbl_Vehic__DataS__00DF2177]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_VehicleClassMapping] ADD  DEFAULT ((1)) FOR [DataStatus]
END

GO
