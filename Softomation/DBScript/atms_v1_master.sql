USE [ATMSv1]
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
/****** Object:  Table [dbo].[tbl_VehicleClass]    Script Date: 14-06-2024 15:17:20 ******/
DROP TABLE IF EXISTS [dbo].[tbl_VehicleClass]
GO
/****** Object:  Table [dbo].[tbl_UserMaster]    Script Date: 14-06-2024 15:17:20 ******/
DROP TABLE IF EXISTS [dbo].[tbl_UserMaster]
GO
/****** Object:  Table [dbo].[tbl_SystemSetting]    Script Date: 14-06-2024 15:17:20 ******/
DROP TABLE IF EXISTS [dbo].[tbl_SystemSetting]
GO
/****** Object:  Table [dbo].[tbl_SystemMaster]    Script Date: 14-06-2024 15:17:20 ******/
DROP TABLE IF EXISTS [dbo].[tbl_SystemMaster]
GO
/****** Object:  Table [dbo].[tbl_RolePermission]    Script Date: 14-06-2024 15:17:20 ******/
DROP TABLE IF EXISTS [dbo].[tbl_RolePermission]
GO
/****** Object:  Table [dbo].[tbl_RoleMaster]    Script Date: 14-06-2024 15:17:20 ******/
DROP TABLE IF EXISTS [dbo].[tbl_RoleMaster]
GO
/****** Object:  Table [dbo].[tbl_ReportMaster]    Script Date: 14-06-2024 15:17:20 ******/
DROP TABLE IF EXISTS [dbo].[tbl_ReportMaster]
GO
/****** Object:  Table [dbo].[tbl_MenuMaster]    Script Date: 14-06-2024 15:17:20 ******/
DROP TABLE IF EXISTS [dbo].[tbl_MenuMaster]
GO
/****** Object:  Table [dbo].[tbl_IncidentSubCategory]    Script Date: 14-06-2024 15:17:20 ******/
DROP TABLE IF EXISTS [dbo].[tbl_IncidentSubCategory]
GO
/****** Object:  Table [dbo].[tbl_IncidentStatusMaster]    Script Date: 14-06-2024 15:17:20 ******/
DROP TABLE IF EXISTS [dbo].[tbl_IncidentStatusMaster]
GO
/****** Object:  Table [dbo].[tbl_IncidentSourceMaster]    Script Date: 14-06-2024 15:17:20 ******/
DROP TABLE IF EXISTS [dbo].[tbl_IncidentSourceMaster]
GO
/****** Object:  Table [dbo].[tbl_IncidentCheckListMaster]    Script Date: 14-06-2024 15:17:20 ******/
DROP TABLE IF EXISTS [dbo].[tbl_IncidentCheckListMaster]
GO
/****** Object:  Table [dbo].[tbl_EventsTypeMaster]    Script Date: 14-06-2024 15:17:20 ******/
DROP TABLE IF EXISTS [dbo].[tbl_EventsTypeMaster]
GO
/****** Object:  Table [dbo].[tbl_EquipmentTypeMaster]    Script Date: 14-06-2024 15:17:20 ******/
DROP TABLE IF EXISTS [dbo].[tbl_EquipmentTypeMaster]
GO
/****** Object:  Table [dbo].[tbl_EquipmentPositionTypeMaster]    Script Date: 14-06-2024 15:17:20 ******/
DROP TABLE IF EXISTS [dbo].[tbl_EquipmentPositionTypeMaster]
GO
/****** Object:  Table [dbo].[tbl_EquipmentPositionTypeMaster]    Script Date: 14-06-2024 15:17:20 ******/
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
/****** Object:  Table [dbo].[tbl_EquipmentTypeMaster]    Script Date: 14-06-2024 15:17:20 ******/
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
/****** Object:  Table [dbo].[tbl_EventsTypeMaster]    Script Date: 14-06-2024 15:17:20 ******/
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
/****** Object:  Table [dbo].[tbl_IncidentCheckListMaster]    Script Date: 14-06-2024 15:17:20 ******/
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
/****** Object:  Table [dbo].[tbl_IncidentSourceMaster]    Script Date: 14-06-2024 15:17:20 ******/
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
/****** Object:  Table [dbo].[tbl_IncidentStatusMaster]    Script Date: 14-06-2024 15:17:20 ******/
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
/****** Object:  Table [dbo].[tbl_IncidentSubCategory]    Script Date: 14-06-2024 15:17:20 ******/
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
/****** Object:  Table [dbo].[tbl_MenuMaster]    Script Date: 14-06-2024 15:17:20 ******/
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
/****** Object:  Table [dbo].[tbl_ReportMaster]    Script Date: 14-06-2024 15:17:20 ******/
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
/****** Object:  Table [dbo].[tbl_RoleMaster]    Script Date: 14-06-2024 15:17:20 ******/
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
/****** Object:  Table [dbo].[tbl_RolePermission]    Script Date: 14-06-2024 15:17:20 ******/
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
/****** Object:  Table [dbo].[tbl_SystemMaster]    Script Date: 14-06-2024 15:17:20 ******/
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
/****** Object:  Table [dbo].[tbl_SystemSetting]    Script Date: 14-06-2024 15:17:20 ******/
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
/****** Object:  Table [dbo].[tbl_UserMaster]    Script Date: 14-06-2024 15:17:20 ******/
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
/****** Object:  Table [dbo].[tbl_VehicleClass]    Script Date: 14-06-2024 15:17:20 ******/
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
SET IDENTITY_INSERT [dbo].[tbl_EquipmentPositionTypeMaster] ON 

INSERT [dbo].[tbl_EquipmentPositionTypeMaster] ([EquipmentPositionId], [EquipmentPositionName], [EquipmentPositionColor], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (1, N'Entry', N'#362FD9', 1, CAST(N'2023-11-01T13:50:15.380' AS DateTime), 0, CAST(N'2023-11-01T13:50:15.380' AS DateTime), 0)
INSERT [dbo].[tbl_EquipmentPositionTypeMaster] ([EquipmentPositionId], [EquipmentPositionName], [EquipmentPositionColor], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (2, N'Exit', N'#1AACAC', 1, CAST(N'2023-11-01T13:50:21.880' AS DateTime), 0, CAST(N'2023-11-01T13:50:21.880' AS DateTime), 0)
INSERT [dbo].[tbl_EquipmentPositionTypeMaster] ([EquipmentPositionId], [EquipmentPositionName], [EquipmentPositionColor], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (3, N'Main Carriageway', N'#2E97A7', 1, CAST(N'2023-11-01T13:50:28.430' AS DateTime), 0, CAST(N'2023-11-01T13:50:28.430' AS DateTime), 0)
INSERT [dbo].[tbl_EquipmentPositionTypeMaster] ([EquipmentPositionId], [EquipmentPositionName], [EquipmentPositionColor], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (4, N'Parking Spot', N'#EEEEEE', 1, CAST(N'2023-11-01T13:50:33.090' AS DateTime), 0, CAST(N'2023-11-01T13:50:33.090' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[tbl_EquipmentPositionTypeMaster] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_EquipmentTypeMaster] ON 

INSERT [dbo].[tbl_EquipmentTypeMaster] ([EquipmentTypeId], [EquipmentTypeName], [EquipmentCategoryTypeId], [EquipmentConnectionTypeId], [EquipmentIconName], [EquipmentLevel], [EquipmentColor], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (1, N'PTZ Camera', 1, 1, N'#7eb0d5', 3, NULL, 1, CAST(N'2022-01-14T23:13:24.977' AS DateTime), 0, CAST(N'2022-01-14T23:13:24.977' AS DateTime), 0)
INSERT [dbo].[tbl_EquipmentTypeMaster] ([EquipmentTypeId], [EquipmentTypeName], [EquipmentCategoryTypeId], [EquipmentConnectionTypeId], [EquipmentIconName], [EquipmentLevel], [EquipmentColor], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (2, N'ECB', 1, 1, N'#b2e061', 3, NULL, 1, CAST(N'2022-01-14T23:14:14.230' AS DateTime), 0, CAST(N'2022-01-14T23:14:14.230' AS DateTime), 0)
INSERT [dbo].[tbl_EquipmentTypeMaster] ([EquipmentTypeId], [EquipmentTypeName], [EquipmentCategoryTypeId], [EquipmentConnectionTypeId], [EquipmentIconName], [EquipmentLevel], [EquipmentColor], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (3, N'LPU', 1, 1, N'#bd7ebe', 2, NULL, 1, CAST(N'2022-01-14T23:14:25.050' AS DateTime), 0, CAST(N'2022-01-14T23:14:25.050' AS DateTime), 0)
INSERT [dbo].[tbl_EquipmentTypeMaster] ([EquipmentTypeId], [EquipmentTypeName], [EquipmentCategoryTypeId], [EquipmentConnectionTypeId], [EquipmentIconName], [EquipmentLevel], [EquipmentColor], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (4, N'MET', 1, 1, N'#ffb55a', 3, NULL, 1, CAST(N'2022-01-14T23:14:29.773' AS DateTime), 0, CAST(N'2022-01-14T23:14:29.773' AS DateTime), 0)
INSERT [dbo].[tbl_EquipmentTypeMaster] ([EquipmentTypeId], [EquipmentTypeName], [EquipmentCategoryTypeId], [EquipmentConnectionTypeId], [EquipmentIconName], [EquipmentLevel], [EquipmentColor], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (5, N'Radar', 1, 1, N'#ffee65', 3, NULL, 1, CAST(N'2022-01-14T23:14:40.693' AS DateTime), 0, CAST(N'2022-01-14T23:14:40.693' AS DateTime), 0)
INSERT [dbo].[tbl_EquipmentTypeMaster] ([EquipmentTypeId], [EquipmentTypeName], [EquipmentCategoryTypeId], [EquipmentConnectionTypeId], [EquipmentIconName], [EquipmentLevel], [EquipmentColor], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (6, N'Sensor', 1, 1, N'#beb9db', 3, NULL, 0, CAST(N'2022-01-14T23:14:46.063' AS DateTime), 0, CAST(N'2022-01-14T23:14:46.063' AS DateTime), 0)
INSERT [dbo].[tbl_EquipmentTypeMaster] ([EquipmentTypeId], [EquipmentTypeName], [EquipmentCategoryTypeId], [EquipmentConnectionTypeId], [EquipmentIconName], [EquipmentLevel], [EquipmentColor], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (7, N'Speed Display', 1, 1, N'#fdcce5', 3, NULL, 1, CAST(N'2022-01-14T23:14:51.997' AS DateTime), 0, CAST(N'2022-01-14T23:14:51.997' AS DateTime), 0)
INSERT [dbo].[tbl_EquipmentTypeMaster] ([EquipmentTypeId], [EquipmentTypeName], [EquipmentCategoryTypeId], [EquipmentConnectionTypeId], [EquipmentIconName], [EquipmentLevel], [EquipmentColor], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (8, N'VMS', 1, 1, N'#ea5545', 3, NULL, 1, CAST(N'2022-01-14T23:14:54.837' AS DateTime), 0, CAST(N'2022-01-14T23:14:54.837' AS DateTime), 0)
INSERT [dbo].[tbl_EquipmentTypeMaster] ([EquipmentTypeId], [EquipmentTypeName], [EquipmentCategoryTypeId], [EquipmentConnectionTypeId], [EquipmentIconName], [EquipmentLevel], [EquipmentColor], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (9, N'Light', 1, 3, N'#f46a9b', 4, NULL, 0, CAST(N'2022-01-14T23:15:02.623' AS DateTime), 0, CAST(N'2022-01-14T23:15:02.623' AS DateTime), 0)
INSERT [dbo].[tbl_EquipmentTypeMaster] ([EquipmentTypeId], [EquipmentTypeName], [EquipmentCategoryTypeId], [EquipmentConnectionTypeId], [EquipmentIconName], [EquipmentLevel], [EquipmentColor], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (10, N'Blinker', 1, 1, N'#ef9b20', 4, NULL, 0, CAST(N'2022-01-14T23:15:07.100' AS DateTime), 0, CAST(N'2022-01-14T23:15:07.100' AS DateTime), 0)
INSERT [dbo].[tbl_EquipmentTypeMaster] ([EquipmentTypeId], [EquipmentTypeName], [EquipmentCategoryTypeId], [EquipmentConnectionTypeId], [EquipmentIconName], [EquipmentLevel], [EquipmentColor], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (11, N'Data Storage', 2, 3, N'#edbf33', 2, NULL, 0, CAST(N'2022-01-14T23:15:11.313' AS DateTime), 0, CAST(N'2022-01-14T23:15:11.313' AS DateTime), 0)
INSERT [dbo].[tbl_EquipmentTypeMaster] ([EquipmentTypeId], [EquipmentTypeName], [EquipmentCategoryTypeId], [EquipmentConnectionTypeId], [EquipmentIconName], [EquipmentLevel], [EquipmentColor], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (12, N'IP Phone', 2, 1, N'#ede15b', 2, NULL, 1, CAST(N'2022-01-14T23:15:17.223' AS DateTime), 0, CAST(N'2022-01-14T23:15:17.223' AS DateTime), 0)
INSERT [dbo].[tbl_EquipmentTypeMaster] ([EquipmentTypeId], [EquipmentTypeName], [EquipmentCategoryTypeId], [EquipmentConnectionTypeId], [EquipmentIconName], [EquipmentLevel], [EquipmentColor], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (13, N'Joy Stick', 2, 1, N'#bdcf32', 2, NULL, 1, CAST(N'2022-01-14T23:15:28.973' AS DateTime), 0, CAST(N'2022-01-14T23:15:28.973' AS DateTime), 0)
INSERT [dbo].[tbl_EquipmentTypeMaster] ([EquipmentTypeId], [EquipmentTypeName], [EquipmentCategoryTypeId], [EquipmentConnectionTypeId], [EquipmentIconName], [EquipmentLevel], [EquipmentColor], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (14, N'Server', 2, 1, N'#87bc45', 2, NULL, 1, CAST(N'2022-01-14T23:15:53.723' AS DateTime), 0, CAST(N'2022-01-14T23:15:53.723' AS DateTime), 0)
INSERT [dbo].[tbl_EquipmentTypeMaster] ([EquipmentTypeId], [EquipmentTypeName], [EquipmentCategoryTypeId], [EquipmentConnectionTypeId], [EquipmentIconName], [EquipmentLevel], [EquipmentColor], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (15, N'Video Wall', 2, 1, N'#27aeef', 2, NULL, 1, CAST(N'2022-01-14T23:15:56.897' AS DateTime), 0, CAST(N'2022-01-14T23:15:56.897' AS DateTime), 0)
INSERT [dbo].[tbl_EquipmentTypeMaster] ([EquipmentTypeId], [EquipmentTypeName], [EquipmentCategoryTypeId], [EquipmentConnectionTypeId], [EquipmentIconName], [EquipmentLevel], [EquipmentColor], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (16, N'Work Station', 2, 1, N'#b33dc6', 3, NULL, 1, CAST(N'2022-01-14T23:16:00.003' AS DateTime), 0, CAST(N'2022-01-14T23:16:00.003' AS DateTime), 0)
INSERT [dbo].[tbl_EquipmentTypeMaster] ([EquipmentTypeId], [EquipmentTypeName], [EquipmentCategoryTypeId], [EquipmentConnectionTypeId], [EquipmentIconName], [EquipmentLevel], [EquipmentColor], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (17, N'Network Switch', 3, 1, N'#e60049', 1, NULL, 1, CAST(N'2022-01-14T23:16:11.100' AS DateTime), 0, CAST(N'2022-01-14T23:16:11.100' AS DateTime), 0)
INSERT [dbo].[tbl_EquipmentTypeMaster] ([EquipmentTypeId], [EquipmentTypeName], [EquipmentCategoryTypeId], [EquipmentConnectionTypeId], [EquipmentIconName], [EquipmentLevel], [EquipmentColor], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (18, N'Tablet', 1, 3, N'#0bb4ff', 3, NULL, 0, CAST(N'2022-01-14T23:16:23.103' AS DateTime), 0, CAST(N'2022-01-14T23:16:23.103' AS DateTime), 0)
INSERT [dbo].[tbl_EquipmentTypeMaster] ([EquipmentTypeId], [EquipmentTypeName], [EquipmentCategoryTypeId], [EquipmentConnectionTypeId], [EquipmentIconName], [EquipmentLevel], [EquipmentColor], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (19, N'UPS', 4, 3, N'#50e991', 1, NULL, 0, CAST(N'2022-01-16T21:35:13.517' AS DateTime), 0, CAST(N'2022-01-16T21:35:13.517' AS DateTime), 0)
INSERT [dbo].[tbl_EquipmentTypeMaster] ([EquipmentTypeId], [EquipmentTypeName], [EquipmentCategoryTypeId], [EquipmentConnectionTypeId], [EquipmentIconName], [EquipmentLevel], [EquipmentColor], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (20, N'Hooter Alarm with Beacon', 1, 1, N'#e6d800', 3, NULL, 0, CAST(N'2022-02-04T15:53:10.700' AS DateTime), 0, CAST(N'2022-02-04T15:53:10.700' AS DateTime), 0)
INSERT [dbo].[tbl_EquipmentTypeMaster] ([EquipmentTypeId], [EquipmentTypeName], [EquipmentCategoryTypeId], [EquipmentConnectionTypeId], [EquipmentIconName], [EquipmentLevel], [EquipmentColor], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (21, N'GPS Device', 1, 3, N'#9b19f5', 3, NULL, 0, CAST(N'2022-03-19T17:27:59.037' AS DateTime), 0, CAST(N'2022-03-19T17:27:59.037' AS DateTime), 0)
INSERT [dbo].[tbl_EquipmentTypeMaster] ([EquipmentTypeId], [EquipmentTypeName], [EquipmentCategoryTypeId], [EquipmentConnectionTypeId], [EquipmentIconName], [EquipmentLevel], [EquipmentColor], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (22, N'Body Cam', 1, 3, N'#ffa300', 3, NULL, 0, CAST(N'2022-03-19T17:28:27.350' AS DateTime), 0, CAST(N'2022-03-19T17:28:27.350' AS DateTime), 0)
INSERT [dbo].[tbl_EquipmentTypeMaster] ([EquipmentTypeId], [EquipmentTypeName], [EquipmentCategoryTypeId], [EquipmentConnectionTypeId], [EquipmentIconName], [EquipmentLevel], [EquipmentColor], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (23, N'Dash Cam', 1, 3, N'#dc0ab4', 3, NULL, 0, CAST(N'2022-03-19T17:28:36.553' AS DateTime), 0, CAST(N'2022-03-19T17:28:36.553' AS DateTime), 0)
INSERT [dbo].[tbl_EquipmentTypeMaster] ([EquipmentTypeId], [EquipmentTypeName], [EquipmentCategoryTypeId], [EquipmentConnectionTypeId], [EquipmentIconName], [EquipmentLevel], [EquipmentColor], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (24, N'Other', 3, 3, N'#b3d4ff', 4, NULL, 1, CAST(N'2022-03-19T17:28:46.037' AS DateTime), 0, CAST(N'2022-03-19T17:28:46.037' AS DateTime), 0)
INSERT [dbo].[tbl_EquipmentTypeMaster] ([EquipmentTypeId], [EquipmentTypeName], [EquipmentCategoryTypeId], [EquipmentConnectionTypeId], [EquipmentIconName], [EquipmentLevel], [EquipmentColor], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (25, N'VIDS Camera', 1, 1, N'#00bfa0', 3, NULL, 1, CAST(N'2022-04-16T11:36:34.280' AS DateTime), 0, CAST(N'2022-04-16T11:36:34.280' AS DateTime), 0)
INSERT [dbo].[tbl_EquipmentTypeMaster] ([EquipmentTypeId], [EquipmentTypeName], [EquipmentCategoryTypeId], [EquipmentConnectionTypeId], [EquipmentIconName], [EquipmentLevel], [EquipmentColor], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (26, N'ANPR Camera', 1, 1, N'#b30000', 3, NULL, 1, CAST(N'2022-04-16T11:36:43.387' AS DateTime), 0, CAST(N'2022-04-16T11:36:43.387' AS DateTime), 0)
INSERT [dbo].[tbl_EquipmentTypeMaster] ([EquipmentTypeId], [EquipmentTypeName], [EquipmentCategoryTypeId], [EquipmentConnectionTypeId], [EquipmentIconName], [EquipmentLevel], [EquipmentColor], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (27, N'Motion Detection Camera', 1, 1, N'#7c1158', 3, NULL, 1, CAST(N'2022-04-16T11:37:43.030' AS DateTime), 0, CAST(N'2022-04-16T11:37:43.030' AS DateTime), 0)
INSERT [dbo].[tbl_EquipmentTypeMaster] ([EquipmentTypeId], [EquipmentTypeName], [EquipmentCategoryTypeId], [EquipmentConnectionTypeId], [EquipmentIconName], [EquipmentLevel], [EquipmentColor], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (28, N'Media Converter', 3, 1, N'#4421af', 1, NULL, 1, CAST(N'2022-07-21T20:04:01.707' AS DateTime), 0, CAST(N'2022-07-21T20:04:01.707' AS DateTime), 0)
INSERT [dbo].[tbl_EquipmentTypeMaster] ([EquipmentTypeId], [EquipmentTypeName], [EquipmentCategoryTypeId], [EquipmentConnectionTypeId], [EquipmentIconName], [EquipmentLevel], [EquipmentColor], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (29, N'Vehicle Front Camera', 1, 1, N'#1a53ff', 3, NULL, 0, CAST(N'2022-07-21T20:04:01.707' AS DateTime), 0, CAST(N'2022-07-21T20:04:01.707' AS DateTime), 0)
INSERT [dbo].[tbl_EquipmentTypeMaster] ([EquipmentTypeId], [EquipmentTypeName], [EquipmentCategoryTypeId], [EquipmentConnectionTypeId], [EquipmentIconName], [EquipmentLevel], [EquipmentColor], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (30, N'Vehicle Rear Camera', 1, 1, N'#0d88e6', 3, NULL, 0, CAST(N'2022-07-21T20:04:01.707' AS DateTime), 0, CAST(N'2022-07-21T20:04:01.707' AS DateTime), 0)
INSERT [dbo].[tbl_EquipmentTypeMaster] ([EquipmentTypeId], [EquipmentTypeName], [EquipmentCategoryTypeId], [EquipmentConnectionTypeId], [EquipmentIconName], [EquipmentLevel], [EquipmentColor], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (31, N'MRCS', 1, 1, N'#00b7c7', 1, NULL, 1, CAST(N'2023-06-19T23:41:10.913' AS DateTime), 0, CAST(N'2023-06-19T23:41:10.913' AS DateTime), 0)
INSERT [dbo].[tbl_EquipmentTypeMaster] ([EquipmentTypeId], [EquipmentTypeName], [EquipmentCategoryTypeId], [EquipmentConnectionTypeId], [EquipmentIconName], [EquipmentLevel], [EquipmentColor], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (32, N'ATCC Camera', 1, 1, N'#5ad45a', 3, NULL, 1, CAST(N'2023-06-19T23:41:44.013' AS DateTime), 0, CAST(N'2023-06-19T23:41:44.013' AS DateTime), 0)
INSERT [dbo].[tbl_EquipmentTypeMaster] ([EquipmentTypeId], [EquipmentTypeName], [EquipmentCategoryTypeId], [EquipmentConnectionTypeId], [EquipmentIconName], [EquipmentLevel], [EquipmentColor], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (33, N'Printer', 2, 1, N'#8be04e', 1, NULL, 1, CAST(N'2023-06-19T23:42:17.457' AS DateTime), 0, CAST(N'2023-06-19T23:42:17.457' AS DateTime), 0)
INSERT [dbo].[tbl_EquipmentTypeMaster] ([EquipmentTypeId], [EquipmentTypeName], [EquipmentCategoryTypeId], [EquipmentConnectionTypeId], [EquipmentIconName], [EquipmentLevel], [EquipmentColor], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (34, N'NVR', 2, 1, N'#ebdc78', 1, NULL, 1, CAST(N'2023-06-19T23:42:45.433' AS DateTime), 0, CAST(N'2023-06-19T23:42:45.433' AS DateTime), 0)
INSERT [dbo].[tbl_EquipmentTypeMaster] ([EquipmentTypeId], [EquipmentTypeName], [EquipmentCategoryTypeId], [EquipmentConnectionTypeId], [EquipmentIconName], [EquipmentLevel], [EquipmentColor], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (35, N'Firewall/Router', 2, 1, N'#fd7f6f', 0, NULL, 1, CAST(N'2023-06-19T23:42:54.540' AS DateTime), 0, CAST(N'2023-06-19T23:42:54.540' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[tbl_EquipmentTypeMaster] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_EventsTypeMaster] ON 

INSERT [dbo].[tbl_EventsTypeMaster] ([EventTypeId], [EventTypeName], [EventsRequired], [ReviewRequired], [ChallanTypeId], [MinimumValue], [MaximumValue], [EventsColor], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (0, N'False Event', 0, 0, 0, CAST(0.000000 AS Decimal(18, 6)), CAST(0.000000 AS Decimal(18, 6)), N'#ea5545', 0, 1, CAST(N'2023-07-26T17:35:03.363' AS DateTime), 0, CAST(N'2023-07-26T17:35:03.363' AS DateTime), 0)
INSERT [dbo].[tbl_EventsTypeMaster] ([EventTypeId], [EventTypeName], [EventsRequired], [ReviewRequired], [ChallanTypeId], [MinimumValue], [MaximumValue], [EventsColor], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (1, N'Stop Vehicle', 1, 1, 5, CAST(0.000000 AS Decimal(18, 6)), CAST(0.000000 AS Decimal(18, 6)), N'#f46a9b', 6, 1, CAST(N'2023-07-26T17:35:05.083' AS DateTime), 0, CAST(N'2023-07-26T17:35:05.083' AS DateTime), 0)
INSERT [dbo].[tbl_EventsTypeMaster] ([EventTypeId], [EventTypeName], [EventsRequired], [ReviewRequired], [ChallanTypeId], [MinimumValue], [MaximumValue], [EventsColor], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (2, N'Congestion', 1, 0, 0, CAST(0.000000 AS Decimal(18, 6)), CAST(0.000000 AS Decimal(18, 6)), N'#ef9b20', 6, 1, CAST(N'2023-07-26T17:35:05.083' AS DateTime), 0, CAST(N'2023-07-26T17:35:05.083' AS DateTime), 0)
INSERT [dbo].[tbl_EventsTypeMaster] ([EventTypeId], [EventTypeName], [EventsRequired], [ReviewRequired], [ChallanTypeId], [MinimumValue], [MaximumValue], [EventsColor], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (3, N'Wrong Direction', 1, 1, 6, CAST(0.000000 AS Decimal(18, 6)), CAST(0.000000 AS Decimal(18, 6)), N'#edbf33', 6, 1, CAST(N'2023-07-26T17:35:05.083' AS DateTime), 0, CAST(N'2023-07-26T17:35:05.083' AS DateTime), 0)
INSERT [dbo].[tbl_EventsTypeMaster] ([EventTypeId], [EventTypeName], [EventsRequired], [ReviewRequired], [ChallanTypeId], [MinimumValue], [MaximumValue], [EventsColor], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (4, N'Fast Moving', 1, 0, 0, CAST(0.000000 AS Decimal(18, 6)), CAST(0.000000 AS Decimal(18, 6)), N'#ede15b', 6, 1, CAST(N'2023-07-26T17:35:05.083' AS DateTime), 0, CAST(N'2023-07-26T17:35:05.083' AS DateTime), 0)
INSERT [dbo].[tbl_EventsTypeMaster] ([EventTypeId], [EventTypeName], [EventsRequired], [ReviewRequired], [ChallanTypeId], [MinimumValue], [MaximumValue], [EventsColor], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (5, N'Slow Moving', 1, 0, 0, CAST(0.000000 AS Decimal(18, 6)), CAST(0.000000 AS Decimal(18, 6)), N'#bdcf32', 6, 1, CAST(N'2023-07-26T17:35:05.083' AS DateTime), 0, CAST(N'2023-07-26T17:35:05.083' AS DateTime), 0)
INSERT [dbo].[tbl_EventsTypeMaster] ([EventTypeId], [EventTypeName], [EventsRequired], [ReviewRequired], [ChallanTypeId], [MinimumValue], [MaximumValue], [EventsColor], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (6, N'Fog/smoke', 0, 0, 0, CAST(0.000000 AS Decimal(18, 6)), CAST(0.000000 AS Decimal(18, 6)), N'#87bc45', 6, 1, CAST(N'2023-07-26T17:35:05.083' AS DateTime), 0, CAST(N'2023-07-26T17:35:05.083' AS DateTime), 0)
INSERT [dbo].[tbl_EventsTypeMaster] ([EventTypeId], [EventTypeName], [EventsRequired], [ReviewRequired], [ChallanTypeId], [MinimumValue], [MaximumValue], [EventsColor], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (7, N'Fire', 0, 0, 0, CAST(0.000000 AS Decimal(18, 6)), CAST(0.000000 AS Decimal(18, 6)), N'#27aeef', 6, 1, CAST(N'2023-07-26T17:35:05.083' AS DateTime), 0, CAST(N'2023-07-26T17:35:05.083' AS DateTime), 0)
INSERT [dbo].[tbl_EventsTypeMaster] ([EventTypeId], [EventTypeName], [EventsRequired], [ReviewRequired], [ChallanTypeId], [MinimumValue], [MaximumValue], [EventsColor], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (8, N'Fallen Object', 0, 0, 0, CAST(0.000000 AS Decimal(18, 6)), CAST(0.000000 AS Decimal(18, 6)), N'#b33dc6', 6, 1, CAST(N'2023-07-26T17:35:05.083' AS DateTime), 0, CAST(N'2023-07-26T17:35:05.083' AS DateTime), 0)
INSERT [dbo].[tbl_EventsTypeMaster] ([EventTypeId], [EventTypeName], [EventsRequired], [ReviewRequired], [ChallanTypeId], [MinimumValue], [MaximumValue], [EventsColor], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (9, N'Human Detected', 1, 0, 0, CAST(0.000000 AS Decimal(18, 6)), CAST(0.000000 AS Decimal(18, 6)), N'#e60049', 6, 1, CAST(N'2023-07-26T17:35:05.083' AS DateTime), 0, CAST(N'2023-07-26T17:35:05.083' AS DateTime), 0)
INSERT [dbo].[tbl_EventsTypeMaster] ([EventTypeId], [EventTypeName], [EventsRequired], [ReviewRequired], [ChallanTypeId], [MinimumValue], [MaximumValue], [EventsColor], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (10, N'Human Crossing Road', 1, 0, 0, CAST(0.000000 AS Decimal(18, 6)), CAST(0.000000 AS Decimal(18, 6)), N'#0bb4ff', 6, 1, CAST(N'2023-07-26T17:35:05.083' AS DateTime), 0, CAST(N'2023-07-26T17:35:05.083' AS DateTime), 0)
INSERT [dbo].[tbl_EventsTypeMaster] ([EventTypeId], [EventTypeName], [EventsRequired], [ReviewRequired], [ChallanTypeId], [MinimumValue], [MaximumValue], [EventsColor], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (11, N'Lane Changed', 1, 1, 3, CAST(0.000000 AS Decimal(18, 6)), CAST(0.000000 AS Decimal(18, 6)), N'#50e991', 6, 1, CAST(N'2023-07-26T17:35:05.083' AS DateTime), 0, CAST(N'2023-07-26T17:35:05.083' AS DateTime), 0)
INSERT [dbo].[tbl_EventsTypeMaster] ([EventTypeId], [EventTypeName], [EventsRequired], [ReviewRequired], [ChallanTypeId], [MinimumValue], [MaximumValue], [EventsColor], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (12, N'Overspeed', 1, 1, 1, CAST(0.000000 AS Decimal(18, 6)), CAST(0.000000 AS Decimal(18, 6)), N'#e6d800', 8, 1, CAST(N'2023-09-09T13:20:41.063' AS DateTime), 0, CAST(N'2023-09-09T13:20:41.063' AS DateTime), 0)
INSERT [dbo].[tbl_EventsTypeMaster] ([EventTypeId], [EventTypeName], [EventsRequired], [ReviewRequired], [ChallanTypeId], [MinimumValue], [MaximumValue], [EventsColor], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (13, N'Lane Overspeed', 1, 1, 0, CAST(0.000000 AS Decimal(18, 6)), CAST(0.000000 AS Decimal(18, 6)), N'#9b19f5', 8, 1, CAST(N'2023-09-09T13:20:47.310' AS DateTime), 0, CAST(N'2023-09-09T13:20:47.310' AS DateTime), 0)
INSERT [dbo].[tbl_EventsTypeMaster] ([EventTypeId], [EventTypeName], [EventsRequired], [ReviewRequired], [ChallanTypeId], [MinimumValue], [MaximumValue], [EventsColor], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (14, N'Restricted Vehicles', 1, 1, 0, CAST(0.000000 AS Decimal(18, 6)), CAST(0.000000 AS Decimal(18, 6)), N'#ffa300', 8, 1, CAST(N'2023-09-09T13:20:52.517' AS DateTime), 0, CAST(N'2023-09-09T13:20:52.517' AS DateTime), 0)
INSERT [dbo].[tbl_EventsTypeMaster] ([EventTypeId], [EventTypeName], [EventsRequired], [ReviewRequired], [ChallanTypeId], [MinimumValue], [MaximumValue], [EventsColor], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (15, N'Wrong Direction', 1, 1, 0, CAST(0.000000 AS Decimal(18, 6)), CAST(0.000000 AS Decimal(18, 6)), N'#dc0ab4', 8, 1, CAST(N'2023-09-09T13:21:47.013' AS DateTime), 0, CAST(N'2023-09-09T13:21:47.013' AS DateTime), 0)
INSERT [dbo].[tbl_EventsTypeMaster] ([EventTypeId], [EventTypeName], [EventsRequired], [ReviewRequired], [ChallanTypeId], [MinimumValue], [MaximumValue], [EventsColor], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (16, N'Restricted Vehicles', 0, 0, 0, CAST(0.000000 AS Decimal(18, 6)), CAST(0.000000 AS Decimal(18, 6)), N'#b3d4ff', 6, 1, CAST(N'2023-09-09T13:21:58.383' AS DateTime), 0, CAST(N'2023-09-09T13:21:58.383' AS DateTime), 0)
INSERT [dbo].[tbl_EventsTypeMaster] ([EventTypeId], [EventTypeName], [EventsRequired], [ReviewRequired], [ChallanTypeId], [MinimumValue], [MaximumValue], [EventsColor], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (17, N'Wrong Lane Driving', 1, 1, 0, CAST(0.000000 AS Decimal(18, 6)), CAST(0.000000 AS Decimal(18, 6)), N'#00bfa0', 8, 1, CAST(N'2023-09-09T13:23:51.777' AS DateTime), 0, CAST(N'2023-09-09T13:23:51.777' AS DateTime), 0)
INSERT [dbo].[tbl_EventsTypeMaster] ([EventTypeId], [EventTypeName], [EventsRequired], [ReviewRequired], [ChallanTypeId], [MinimumValue], [MaximumValue], [EventsColor], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (18, N'ANPR', 1, 0, 0, CAST(0.000000 AS Decimal(18, 6)), CAST(0.000000 AS Decimal(18, 6)), N'#b30000', 8, 1, CAST(N'2023-09-10T12:41:38.817' AS DateTime), 0, CAST(N'2023-09-10T12:41:38.817' AS DateTime), 0)
INSERT [dbo].[tbl_EventsTypeMaster] ([EventTypeId], [EventTypeName], [EventsRequired], [ReviewRequired], [ChallanTypeId], [MinimumValue], [MaximumValue], [EventsColor], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (19, N'Air Temperature', 1, 0, 0, CAST(50.000000 AS Decimal(18, 6)), CAST(100.000000 AS Decimal(18, 6)), N'#7c1158', 9, 1, CAST(N'2023-10-06T13:50:52.980' AS DateTime), 0, CAST(N'2023-10-06T13:50:52.980' AS DateTime), 0)
INSERT [dbo].[tbl_EventsTypeMaster] ([EventTypeId], [EventTypeName], [EventsRequired], [ReviewRequired], [ChallanTypeId], [MinimumValue], [MaximumValue], [EventsColor], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (20, N'Road Temperature', 1, 0, 0, CAST(0.000000 AS Decimal(18, 6)), CAST(0.000000 AS Decimal(18, 6)), N'#4421af', 9, 1, CAST(N'2023-10-06T13:51:20.313' AS DateTime), 0, CAST(N'2023-10-06T13:51:20.313' AS DateTime), 0)
INSERT [dbo].[tbl_EventsTypeMaster] ([EventTypeId], [EventTypeName], [EventsRequired], [ReviewRequired], [ChallanTypeId], [MinimumValue], [MaximumValue], [EventsColor], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (21, N'Humidity', 1, 0, 0, CAST(0.000000 AS Decimal(18, 6)), CAST(0.000000 AS Decimal(18, 6)), N'#1a53ff', 9, 1, CAST(N'2023-10-06T13:51:31.863' AS DateTime), 0, CAST(N'2023-10-06T13:51:31.863' AS DateTime), 0)
INSERT [dbo].[tbl_EventsTypeMaster] ([EventTypeId], [EventTypeName], [EventsRequired], [ReviewRequired], [ChallanTypeId], [MinimumValue], [MaximumValue], [EventsColor], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (22, N'Visibility', 1, 0, 0, CAST(0.000000 AS Decimal(18, 6)), CAST(0.000000 AS Decimal(18, 6)), N'#0d88e6', 9, 1, CAST(N'2023-10-06T13:51:41.320' AS DateTime), 0, CAST(N'2023-10-06T13:51:41.320' AS DateTime), 0)
INSERT [dbo].[tbl_EventsTypeMaster] ([EventTypeId], [EventTypeName], [EventsRequired], [ReviewRequired], [ChallanTypeId], [MinimumValue], [MaximumValue], [EventsColor], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (23, N'Wind Direction', 1, 0, 0, CAST(0.000000 AS Decimal(18, 6)), CAST(0.000000 AS Decimal(18, 6)), N'#00b7c7', 9, 1, CAST(N'2023-10-06T13:51:55.177' AS DateTime), 0, CAST(N'2023-10-06T13:51:55.177' AS DateTime), 0)
INSERT [dbo].[tbl_EventsTypeMaster] ([EventTypeId], [EventTypeName], [EventsRequired], [ReviewRequired], [ChallanTypeId], [MinimumValue], [MaximumValue], [EventsColor], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (24, N'Wind Speed', 1, 0, 0, CAST(0.000000 AS Decimal(18, 6)), CAST(0.000000 AS Decimal(18, 6)), N'#5ad45a', 9, 1, CAST(N'2023-10-06T13:52:07.123' AS DateTime), 0, CAST(N'2023-10-06T13:52:07.123' AS DateTime), 0)
INSERT [dbo].[tbl_EventsTypeMaster] ([EventTypeId], [EventTypeName], [EventsRequired], [ReviewRequired], [ChallanTypeId], [MinimumValue], [MaximumValue], [EventsColor], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (25, N'Rainfall', 1, 0, 0, CAST(0.000000 AS Decimal(18, 6)), CAST(0.000000 AS Decimal(18, 6)), N'#8be04e', 9, 1, CAST(N'2023-10-06T13:52:22.087' AS DateTime), 0, CAST(N'2023-10-06T13:52:22.087' AS DateTime), 0)
INSERT [dbo].[tbl_EventsTypeMaster] ([EventTypeId], [EventTypeName], [EventsRequired], [ReviewRequired], [ChallanTypeId], [MinimumValue], [MaximumValue], [EventsColor], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (26, N'Incomming', 1, 0, 0, CAST(0.000000 AS Decimal(18, 6)), CAST(0.000000 AS Decimal(18, 6)), N'#f46a9b', 3, 1, CAST(N'2023-11-05T10:36:13.840' AS DateTime), 0, CAST(N'2023-11-05T10:36:13.840' AS DateTime), 0)
INSERT [dbo].[tbl_EventsTypeMaster] ([EventTypeId], [EventTypeName], [EventsRequired], [ReviewRequired], [ChallanTypeId], [MinimumValue], [MaximumValue], [EventsColor], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (27, N'Outgoing', 1, 0, 0, CAST(0.000000 AS Decimal(18, 6)), CAST(0.000000 AS Decimal(18, 6)), N'#87bc45', 3, 1, CAST(N'2023-11-05T10:36:31.827' AS DateTime), 0, CAST(N'2023-11-05T10:36:31.827' AS DateTime), 0)
INSERT [dbo].[tbl_EventsTypeMaster] ([EventTypeId], [EventTypeName], [EventsRequired], [ReviewRequired], [ChallanTypeId], [MinimumValue], [MaximumValue], [EventsColor], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (28, N'Missed', 1, 0, 0, CAST(0.000000 AS Decimal(18, 6)), CAST(0.000000 AS Decimal(18, 6)), N'#0bb4ff', 3, 1, CAST(N'2023-11-05T10:36:37.367' AS DateTime), 0, CAST(N'2023-11-05T10:36:37.367' AS DateTime), 0)
INSERT [dbo].[tbl_EventsTypeMaster] ([EventTypeId], [EventTypeName], [EventsRequired], [ReviewRequired], [ChallanTypeId], [MinimumValue], [MaximumValue], [EventsColor], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (29, N'Rejected', 1, 0, 0, CAST(0.000000 AS Decimal(18, 6)), CAST(0.000000 AS Decimal(18, 6)), N'#dc0ab4', 3, 1, CAST(N'2023-11-05T10:36:38.143' AS DateTime), 0, CAST(N'2023-11-05T10:36:38.143' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[tbl_EventsTypeMaster] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_IncidentCheckListMaster] ON 

INSERT [dbo].[tbl_IncidentCheckListMaster] ([CheckListMasterId], [CategoryId], [StepsName], [IsAutoProcess], [StepsProofId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (1, 0, N'Broadcast to VMS', 1, 0, 1, CAST(N'2022-02-21T14:19:23.817' AS DateTime), 0, CAST(N'2022-02-21T14:19:23.817' AS DateTime), 0)
INSERT [dbo].[tbl_IncidentCheckListMaster] ([CheckListMasterId], [CategoryId], [StepsName], [IsAutoProcess], [StepsProofId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (2, 1, N'Patrolling Camper', 0, 0, 1, CAST(N'2022-02-21T14:23:22.150' AS DateTime), 0, CAST(N'2022-02-21T14:23:22.150' AS DateTime), 0)
INSERT [dbo].[tbl_IncidentCheckListMaster] ([CheckListMasterId], [CategoryId], [StepsName], [IsAutoProcess], [StepsProofId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (3, 1, N'Patrolling Ambulance', 0, 0, 1, CAST(N'2022-02-21T14:47:43.997' AS DateTime), 0, CAST(N'2022-02-21T14:47:43.997' AS DateTime), 0)
INSERT [dbo].[tbl_IncidentCheckListMaster] ([CheckListMasterId], [CategoryId], [StepsName], [IsAutoProcess], [StepsProofId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (4, 1, N'Patrolling Hydra / Recovery', 0, 0, 1, CAST(N'2022-02-21T14:54:16.623' AS DateTime), 0, CAST(N'2022-02-21T14:54:16.623' AS DateTime), 0)
INSERT [dbo].[tbl_IncidentCheckListMaster] ([CheckListMasterId], [CategoryId], [StepsName], [IsAutoProcess], [StepsProofId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (5, 1, N'Ambulance 108', 0, 0, 1, CAST(N'2022-02-21T14:56:15.563' AS DateTime), 0, CAST(N'2022-02-21T14:56:15.563' AS DateTime), 0)
INSERT [dbo].[tbl_IncidentCheckListMaster] ([CheckListMasterId], [CategoryId], [StepsName], [IsAutoProcess], [StepsProofId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (6, 1, N'Police Dial 100 / 112', 0, 0, 1, CAST(N'2022-02-21T14:57:09.770' AS DateTime), 0, CAST(N'2022-02-21T14:57:09.770' AS DateTime), 0)
INSERT [dbo].[tbl_IncidentCheckListMaster] ([CheckListMasterId], [CategoryId], [StepsName], [IsAutoProcess], [StepsProofId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (7, 1, N'District Control Room', 0, 0, 1, CAST(N'2022-02-21T14:57:50.510' AS DateTime), 0, CAST(N'2022-02-21T14:57:50.510' AS DateTime), 0)
INSERT [dbo].[tbl_IncidentCheckListMaster] ([CheckListMasterId], [CategoryId], [StepsName], [IsAutoProcess], [StepsProofId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (8, 1, N'Fire Bridge', 0, 0, 1, CAST(N'2022-02-21T14:23:22.150' AS DateTime), 0, CAST(N'2022-02-21T14:23:22.150' AS DateTime), 0)
INSERT [dbo].[tbl_IncidentCheckListMaster] ([CheckListMasterId], [CategoryId], [StepsName], [IsAutoProcess], [StepsProofId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (9, 1, N'EPC Contractor', 0, 0, 1, CAST(N'2022-02-21T14:47:43.997' AS DateTime), 0, CAST(N'2022-02-21T14:47:43.997' AS DateTime), 0)
INSERT [dbo].[tbl_IncidentCheckListMaster] ([CheckListMasterId], [CategoryId], [StepsName], [IsAutoProcess], [StepsProofId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (10, 0, N'Toll Collection Agency', 0, 0, 1, CAST(N'2022-08-28T23:11:41.120' AS DateTime), 0, CAST(N'2022-08-28T23:11:41.120' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[tbl_IncidentCheckListMaster] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_IncidentSourceMaster] ON 

INSERT [dbo].[tbl_IncidentSourceMaster] ([SourceId], [SourceName], [ReferenceNo], [DataStatus], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (1, N'Emergency Call-1033', N'ECSS-', 1, 0, CAST(N'2022-07-13T00:00:00.000' AS DateTime), 0, CAST(N'2022-07-13T00:00:00.000' AS DateTime))
INSERT [dbo].[tbl_IncidentSourceMaster] ([SourceId], [SourceName], [ReferenceNo], [DataStatus], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (2, N'Patrolling/Enforcement Vehicle', N'PEVS-', 0, 0, CAST(N'2022-07-13T00:00:00.000' AS DateTime), 0, CAST(N'2022-07-13T00:00:00.000' AS DateTime))
INSERT [dbo].[tbl_IncidentSourceMaster] ([SourceId], [SourceName], [ReferenceNo], [DataStatus], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (3, N'TMCS', N'TMCS-', 1, 0, CAST(N'2022-07-13T00:00:00.000' AS DateTime), 0, CAST(N'2022-07-13T00:00:00.000' AS DateTime))
INSERT [dbo].[tbl_IncidentSourceMaster] ([SourceId], [SourceName], [ReferenceNo], [DataStatus], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (4, N'VIDS', N'VIDS-', 1, 0, CAST(N'2022-07-13T00:00:00.000' AS DateTime), 0, CAST(N'2022-07-13T00:00:00.000' AS DateTime))
INSERT [dbo].[tbl_IncidentSourceMaster] ([SourceId], [SourceName], [ReferenceNo], [DataStatus], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (5, N'VSDS', N'VSDS-', 0, 0, CAST(N'2022-07-13T00:00:00.000' AS DateTime), 0, CAST(N'2022-07-13T00:00:00.000' AS DateTime))
INSERT [dbo].[tbl_IncidentSourceMaster] ([SourceId], [SourceName], [ReferenceNo], [DataStatus], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (6, N'ECB', N'ECBS-', 0, 0, CAST(N'2022-07-13T00:00:00.000' AS DateTime), 0, CAST(N'2022-07-13T00:00:00.000' AS DateTime))
INSERT [dbo].[tbl_IncidentSourceMaster] ([SourceId], [SourceName], [ReferenceNo], [DataStatus], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (7, N'Commuter Mobile', N'MOBI-', 1, 0, CAST(N'2022-07-19T23:28:49.620' AS DateTime), 0, CAST(N'2022-07-19T23:28:49.620' AS DateTime))
INSERT [dbo].[tbl_IncidentSourceMaster] ([SourceId], [SourceName], [ReferenceNo], [DataStatus], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (8, N'Motion Detection', N'MDSS-', 0, 0, CAST(N'2022-07-26T22:24:41.860' AS DateTime), 0, CAST(N'2022-07-26T22:24:41.860' AS DateTime))
INSERT [dbo].[tbl_IncidentSourceMaster] ([SourceId], [SourceName], [ReferenceNo], [DataStatus], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (9, N'ATCC', N'ATCC-', 1, 0, CAST(N'2023-07-06T19:42:25.803' AS DateTime), 0, CAST(N'2023-07-06T19:42:25.803' AS DateTime))
SET IDENTITY_INSERT [dbo].[tbl_IncidentSourceMaster] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_IncidentStatusMaster] ON 

INSERT [dbo].[tbl_IncidentStatusMaster] ([IncidentStatusId], [IncidentStatusName], [IncidentStatusIcon], [IncidentStatusColorCode], [ProcessPercentage], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (1, N'Created', N'fa fa-question-circle', N'#EF0610', CAST(10.00 AS Decimal(5, 2)), 1, CAST(N'2022-02-18T19:11:33.617' AS DateTime), 0, CAST(N'2022-02-18T19:11:33.617' AS DateTime), 0)
INSERT [dbo].[tbl_IncidentStatusMaster] ([IncidentStatusId], [IncidentStatusName], [IncidentStatusIcon], [IncidentStatusColorCode], [ProcessPercentage], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (2, N'Accepted', N'fa fa-check-square', N'#EB8811', CAST(30.00 AS Decimal(5, 2)), 1, CAST(N'2022-02-18T19:11:33.617' AS DateTime), 0, CAST(N'2022-02-18T19:11:33.617' AS DateTime), 0)
INSERT [dbo].[tbl_IncidentStatusMaster] ([IncidentStatusId], [IncidentStatusName], [IncidentStatusIcon], [IncidentStatusColorCode], [ProcessPercentage], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (3, N'Rejected', N'fa fa-window-close-o', N'#51060E', CAST(50.00 AS Decimal(5, 2)), 1, CAST(N'2022-02-18T19:11:33.630' AS DateTime), 0, CAST(N'2022-02-18T19:11:33.630' AS DateTime), 0)
INSERT [dbo].[tbl_IncidentStatusMaster] ([IncidentStatusId], [IncidentStatusName], [IncidentStatusIcon], [IncidentStatusColorCode], [ProcessPercentage], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (4, N'Assigned To', N'fa fa-check', N'#BABC36', CAST(50.00 AS Decimal(5, 2)), 1, CAST(N'2022-02-18T19:11:33.630' AS DateTime), 0, CAST(N'2022-02-18T19:11:33.630' AS DateTime), 0)
INSERT [dbo].[tbl_IncidentStatusMaster] ([IncidentStatusId], [IncidentStatusName], [IncidentStatusIcon], [IncidentStatusColorCode], [ProcessPercentage], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (5, N'Re-assigned To', N'fa fa-check-circle-o', N'#95BC36', CAST(50.00 AS Decimal(5, 2)), 1, CAST(N'2023-06-27T12:51:22.510' AS DateTime), 0, CAST(N'2023-06-27T12:51:22.510' AS DateTime), 0)
INSERT [dbo].[tbl_IncidentStatusMaster] ([IncidentStatusId], [IncidentStatusName], [IncidentStatusIcon], [IncidentStatusColorCode], [ProcessPercentage], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (6, N'Closed', N'fa fa-times-circle', N'#3CC933', CAST(100.00 AS Decimal(5, 2)), 1, CAST(N'2023-06-27T12:51:25.110' AS DateTime), 0, CAST(N'2023-06-27T12:51:25.110' AS DateTime), 0)
INSERT [dbo].[tbl_IncidentStatusMaster] ([IncidentStatusId], [IncidentStatusName], [IncidentStatusIcon], [IncidentStatusColorCode], [ProcessPercentage], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (7, N'Auto Closed', N'fa fa-times-circle', N'#1EEB11', CAST(100.00 AS Decimal(5, 2)), 1, CAST(N'2023-07-03T20:56:21.913' AS DateTime), 0, CAST(N'2023-07-03T20:56:21.913' AS DateTime), 0)
INSERT [dbo].[tbl_IncidentStatusMaster] ([IncidentStatusId], [IncidentStatusName], [IncidentStatusIcon], [IncidentStatusColorCode], [ProcessPercentage], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (8, N'Modified', N'fa fa-question-circle', N'#E8464D
', CAST(20.00 AS Decimal(5, 2)), 1, CAST(N'2023-07-20T13:02:41.803' AS DateTime), 0, CAST(N'2023-07-20T13:02:41.803' AS DateTime), 0)
INSERT [dbo].[tbl_IncidentStatusMaster] ([IncidentStatusId], [IncidentStatusName], [IncidentStatusIcon], [IncidentStatusColorCode], [ProcessPercentage], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (9, N'Transfer To', N'fa fa-exchange', N'#EB8811', CAST(30.00 AS Decimal(5, 2)), 1, CAST(N'2023-07-21T13:19:30.187' AS DateTime), 0, CAST(N'2023-07-21T13:19:30.187' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[tbl_IncidentStatusMaster] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_MenuMaster] ON 

INSERT [dbo].[tbl_MenuMaster] ([MenuId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (1, N'Dashboard', N'#', N'mdi mdi-home-circle', 1, 1, 0, 16, 1, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0)
INSERT [dbo].[tbl_MenuMaster] ([MenuId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (2, N'System Setting', N'#PopUpSystemSetting', N'mdi mdi-cog-sync', 1, 2, 0, 11, 1, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0)
INSERT [dbo].[tbl_MenuMaster] ([MenuId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (3, N'Config', N'#', N'mdi mdi-cog', 1, 3, 0, 11, 1, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0)
INSERT [dbo].[tbl_MenuMaster] ([MenuId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (4, N'System Config', N'configSystem', N'mdi mdi-cog-sync', 1, 4, 3, 11, 1, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0)
INSERT [dbo].[tbl_MenuMaster] ([MenuId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (5, N'Control Room', N'configControlRoom', N'mdi mdi-domain', 1, 5, 3, 11, 1, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0)
INSERT [dbo].[tbl_MenuMaster] ([MenuId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (6, N'Package', N'configPackage', N'mdi mdi-road-variant', 1, 6, 3, 11, 1, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0)
INSERT [dbo].[tbl_MenuMaster] ([MenuId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (7, N'Equipment', N'configEquipment', N'mdi mdi-devices', 1, 7, 3, 11, 1, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0)
INSERT [dbo].[tbl_MenuMaster] ([MenuId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (8, N'Vehicle Class', N'configVehicleClass', N'mdi mdi-car-3-plus', 1, 8, 3, 11, 1, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0)
INSERT [dbo].[tbl_MenuMaster] ([MenuId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (9, N'Lane Config', N'configLaneConfig', N'mdi mdi-highway', 1, 9, 3, 11, 1, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0)
INSERT [dbo].[tbl_MenuMaster] ([MenuId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (10, N'Roles', N'configRole', N'mdi mdi-account-eye-outline', 1, 10, 3, 11, 1, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0)
INSERT [dbo].[tbl_MenuMaster] ([MenuId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (11, N'Users', N'configUsers', N'mdi mdi-account-group', 1, 11, 3, 11, 1, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0)
INSERT [dbo].[tbl_MenuMaster] ([MenuId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (12, N'TMCS', N'tmcs', N'mdi mdi-cctv', 1, 12, 0, 5, 0, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0)
INSERT [dbo].[tbl_MenuMaster] ([MenuId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (13, N'ADAS', N'#', N'mdi mdi-rv-truck', 1, 13, 0, 1, 0, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0)
INSERT [dbo].[tbl_MenuMaster] ([MenuId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (14, N'Equipment Config', N'adasEquipmentConfig', N'mdi mdi-monitor-dashboard', 1, 14, 13, 1, 0, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0)
INSERT [dbo].[tbl_MenuMaster] ([MenuId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (15, N'Vehicle View', N'adasVehicleview', N'mdi mdi-truck-delivery', 1, 15, 13, 1, 0, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0)
INSERT [dbo].[tbl_MenuMaster] ([MenuId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (16, N'ECB', N'#', N'mdi mdi-rv-truck', 1, 16, 0, 3, 1, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0)
INSERT [dbo].[tbl_MenuMaster] ([MenuId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (17, N'Equipment Config', N'ecbEquipmentConfig', N'mdi mdi-monitor-dashboard', 1, 17, 16, 3, 1, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0)
INSERT [dbo].[tbl_MenuMaster] ([MenuId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (18, N'Event History ', N'ecbEventHistroy', N'mdi mdi-database-clock', 1, 18, 16, 3, 1, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0)
INSERT [dbo].[tbl_MenuMaster] ([MenuId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (19, N'VIDS', N'#', N'mdi mdi-video-vintage', 1, 19, 0, 6, 1, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0)
INSERT [dbo].[tbl_MenuMaster] ([MenuId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (20, N'Equipment Config', N'vidsEquipmentConfig', N'mdi mdi-monitor-dashboard', 1, 20, 19, 6, 1, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0)
INSERT [dbo].[tbl_MenuMaster] ([MenuId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (21, N'Event Config', N'vidsEventConfig', N'mdi mdi-file-cog-outline', 1, 21, 19, 6, 1, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0)
INSERT [dbo].[tbl_MenuMaster] ([MenuId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (22, N'Event History', N'vidsEventHistroy', N'mdi mdi-database-clock', 1, 22, 19, 6, 1, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0)
INSERT [dbo].[tbl_MenuMaster] ([MenuId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (23, N'Un audited', N'vidsValidation', N'mdi mdi-file-clock-outline', 1, 23, 19, 6, 1, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0)
INSERT [dbo].[tbl_MenuMaster] ([MenuId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (24, N'Audited', N'vidsValidated', N'mdi mdi-file-check-outline', 1, 24, 19, 6, 1, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0)
INSERT [dbo].[tbl_MenuMaster] ([MenuId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (25, N'VSDS', N'#', N'mdi mdi-video-box', 1, 25, 0, 8, 0, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0)
INSERT [dbo].[tbl_MenuMaster] ([MenuId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (26, N'Equipment Config', N'vsdsEquipmentConfig', N'mdi mdi-monitor-dashboard', 1, 26, 25, 8, 0, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0)
INSERT [dbo].[tbl_MenuMaster] ([MenuId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (27, N'Event Config', N'vsdsEventConfig', N'mdi mdi-file-cog-outline', 1, 27, 25, 8, 0, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0)
INSERT [dbo].[tbl_MenuMaster] ([MenuId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (28, N'Event History', N'vsdsEventHistroy', N'mdi mdi-database-clock', 1, 28, 25, 8, 0, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0)
INSERT [dbo].[tbl_MenuMaster] ([MenuId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (29, N'Un audited', N'vsdsValidation', N'mdi mdi-file-clock-outline', 1, 29, 25, 8, 0, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0)
INSERT [dbo].[tbl_MenuMaster] ([MenuId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (30, N'Audited', N'vsdsValidated', N'mdi mdi-file-check-outline', 1, 30, 25, 8, 0, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0)
INSERT [dbo].[tbl_MenuMaster] ([MenuId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (31, N'ATCC', N'#', N'mdi mdi-video', 1, 31, 0, 2, 1, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0)
INSERT [dbo].[tbl_MenuMaster] ([MenuId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (32, N'Equipment Config', N'atccEquipmentConfig', N'mdi mdi-monitor-dashboard', 1, 32, 31, 2, 1, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0)
INSERT [dbo].[tbl_MenuMaster] ([MenuId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (33, N'Event History', N'atccEventHistroy', N'mdi mdi-database-clock', 1, 33, 31, 2, 1, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0)
INSERT [dbo].[tbl_MenuMaster] ([MenuId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (34, N'Un audited', N'atccValidation', N'mdi mdi-file-clock-outline', 1, 34, 31, 2, 1, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0)
INSERT [dbo].[tbl_MenuMaster] ([MenuId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (35, N'Audited', N'atccValidated', N'mdi mdi-file-check-outline', 1, 35, 31, 2, 1, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0)
INSERT [dbo].[tbl_MenuMaster] ([MenuId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (36, N'VMS', N'#', N'mdi mdi-message-reply-text', 1, 36, 0, 7, 1, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0)
INSERT [dbo].[tbl_MenuMaster] ([MenuId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (37, N'Equipment Config', N'vmsEventConfig', N'mdi mdi-monitor-dashboard', 1, 37, 36, 7, 1, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0)
INSERT [dbo].[tbl_MenuMaster] ([MenuId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (38, N'Message Details', N'vmsMessageDetails', N'mdi mdi-message-cog-outline', 1, 38, 36, 7, 1, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0)
INSERT [dbo].[tbl_MenuMaster] ([MenuId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (39, N'Message History ', N'vmsMessageHistory', N'mdi mdi-database-clock', 1, 39, 36, 7, 1, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0)
INSERT [dbo].[tbl_MenuMaster] ([MenuId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (40, N'TTMS', N'ttmsEventHistroy', N'mdi mdi-sort-clock-descending-outline', 1, 40, 0, 12, 0, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0)
INSERT [dbo].[tbl_MenuMaster] ([MenuId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (41, N'E-Challan', N'#', N'mdi mdi-account-cash', 1, 41, 0, 15, 0, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0)
INSERT [dbo].[tbl_MenuMaster] ([MenuId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (42, N'Pending', N'challanPending', N'mdi mdi-circle-slice-1', 1, 42, 40, 15, 0, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0)
INSERT [dbo].[tbl_MenuMaster] ([MenuId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (43, N'Closed', N'challanClosed', N'mdi mdi-circle-slice-7', 1, 43, 40, 14, 0, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0)
INSERT [dbo].[tbl_MenuMaster] ([MenuId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (44, N'In-Progress', N'imsProgress', N'mdi mdi-circle-slice-5', 1, 44, 40, 15, 0, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0)
INSERT [dbo].[tbl_MenuMaster] ([MenuId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (45, N'Weather', N'weather', N'mdi mdi-weather-cloudy-alert', 1, 45, 0, 9, 1, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0)
INSERT [dbo].[tbl_MenuMaster] ([MenuId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (46, N'Event Config', N'weatherEventConfig', N'mdi mdi-file-cog-outline', 1, 46, 45, 9, 1, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0)
INSERT [dbo].[tbl_MenuMaster] ([MenuId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (47, N'Event History ', N'weatherEventHistory', N'mdi mdi-database-clock', 1, 47, 45, 9, 1, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0)
INSERT [dbo].[tbl_MenuMaster] ([MenuId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (48, N'IMS', N'#', N'mdi mdi-alert-decagram', 1, 48, 0, 10, 1, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0)
INSERT [dbo].[tbl_MenuMaster] ([MenuId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (49, N'Pending', N'imsPending', N'mdi mdi-circle-slice-1', 1, 49, 48, 10, 1, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0)
INSERT [dbo].[tbl_MenuMaster] ([MenuId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (50, N'In-Progress', N'imsProgress', N'mdi mdi-circle-slice-5', 1, 50, 48, 10, 1, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0)
INSERT [dbo].[tbl_MenuMaster] ([MenuId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (51, N'Close', N'imsClosed', N'mdi mdi-circle-slice-7', 1, 51, 48, 10, 1, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0)
INSERT [dbo].[tbl_MenuMaster] ([MenuId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (52, N'Reporting', N'rmsReports', N'mdi mdi-file-chart', 1, 52, 0, 13, 1, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0, CAST(N'2023-10-03T17:52:52.150' AS DateTime), 0)
INSERT [dbo].[tbl_MenuMaster] ([MenuId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (53, N'Graph-Dashboard', N'graphDashboard', N'mdi mdi-view-dashboard-variant', 1, 53, 1, 16, 1, CAST(N'2023-10-27T14:27:37.563' AS DateTime), 0, CAST(N'2023-10-27T14:27:37.563' AS DateTime), 0)
INSERT [dbo].[tbl_MenuMaster] ([MenuId], [MenuName], [MenuURL], [MenuIcon], [MennuAccess], [OderBy], [ParentId], [SystemId], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (54, N'GIS-Dashboard', N'gisDashboard', N'mdi mdi-tablet-dashboard', 1, 54, 1, 16, 1, CAST(N'2023-10-27T14:28:33.553' AS DateTime), 0, CAST(N'2023-10-27T14:28:33.553' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[tbl_MenuMaster] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_ReportMaster] ON 

INSERT [dbo].[tbl_ReportMaster] ([ReportId], [ReportName], [ParentId], [OrderBy], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (1, N'Summary
', 0, 1, 1, CAST(N'2023-10-31T13:49:55.957' AS DateTime), 0, CAST(N'2023-10-31T13:49:55.957' AS DateTime), 0)
INSERT [dbo].[tbl_ReportMaster] ([ReportId], [ReportName], [ParentId], [OrderBy], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (2, N'Details', 0, 2, 1, CAST(N'2023-10-31T13:50:07.193' AS DateTime), 0, CAST(N'2023-10-31T13:50:07.193' AS DateTime), 0)
INSERT [dbo].[tbl_ReportMaster] ([ReportId], [ReportName], [ParentId], [OrderBy], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (3, N'Accuracy', 0, 3, 1, CAST(N'2023-10-31T13:50:18.153' AS DateTime), 0, CAST(N'2023-10-31T13:50:18.153' AS DateTime), 0)
INSERT [dbo].[tbl_ReportMaster] ([ReportId], [ReportName], [ParentId], [OrderBy], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (4, N'Locationwise
', 0, 4, 1, CAST(N'2023-10-31T13:50:30.487' AS DateTime), 0, CAST(N'2023-10-31T13:50:30.487' AS DateTime), 0)
INSERT [dbo].[tbl_ReportMaster] ([ReportId], [ReportName], [ParentId], [OrderBy], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (5, N'Classwise
', 0, 5, 1, CAST(N'2023-10-31T13:50:38.593' AS DateTime), 0, CAST(N'2023-10-31T13:50:38.593' AS DateTime), 0)
INSERT [dbo].[tbl_ReportMaster] ([ReportId], [ReportName], [ParentId], [OrderBy], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (6, N'Positionwise', 0, 6, 1, CAST(N'2023-10-31T13:50:51.230' AS DateTime), 0, CAST(N'2023-10-31T13:50:51.230' AS DateTime), 0)
INSERT [dbo].[tbl_ReportMaster] ([ReportId], [ReportName], [ParentId], [OrderBy], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (7, N'Eventwise', 0, 7, 1, CAST(N'2023-10-31T13:51:18.207' AS DateTime), 0, CAST(N'2023-10-31T13:51:18.207' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[tbl_ReportMaster] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_RoleMaster] ON 

INSERT [dbo].[tbl_RoleMaster] ([RoleId], [RoleName], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (1, N'Admin', 1, CAST(N'2023-06-16T01:15:40.177' AS DateTime), 0, CAST(N'2023-06-26T21:19:25.497' AS DateTime), 0)
INSERT [dbo].[tbl_RoleMaster] ([RoleId], [RoleName], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (2, N'Operator', 1, CAST(N'2023-06-17T05:16:49.577' AS DateTime), 0, CAST(N'2023-06-19T23:15:53.770' AS DateTime), 0)
INSERT [dbo].[tbl_RoleMaster] ([RoleId], [RoleName], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (3, N'Test', 1, CAST(N'2023-08-03T00:10:21.003' AS DateTime), 0, CAST(N'2023-08-03T10:49:29.317' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[tbl_RoleMaster] OFF
GO
INSERT [dbo].[tbl_RolePermission] ([RoleId], [MenuId], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (2, 1, 1, 1, 1, 1, CAST(N'2023-08-01T17:40:39.860' AS DateTime), 0, CAST(N'2023-08-01T17:40:39.860' AS DateTime), 0)
INSERT [dbo].[tbl_RolePermission] ([RoleId], [MenuId], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (2, 2, 1, 1, 1, 1, CAST(N'2023-08-01T17:40:39.860' AS DateTime), 0, CAST(N'2023-08-01T17:40:39.860' AS DateTime), 0)
INSERT [dbo].[tbl_RolePermission] ([RoleId], [MenuId], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (2, 3, 1, 1, 1, 1, CAST(N'2023-08-01T17:40:39.860' AS DateTime), 0, CAST(N'2023-08-01T17:40:39.860' AS DateTime), 0)
INSERT [dbo].[tbl_RolePermission] ([RoleId], [MenuId], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (2, 7, 0, 0, 0, 1, CAST(N'2023-08-01T17:40:39.860' AS DateTime), 0, CAST(N'2023-08-01T17:40:39.860' AS DateTime), 0)
INSERT [dbo].[tbl_RolePermission] ([RoleId], [MenuId], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (2, 4, 0, 0, 0, 1, CAST(N'2023-08-01T17:40:39.860' AS DateTime), 0, CAST(N'2023-08-01T17:40:39.860' AS DateTime), 0)
INSERT [dbo].[tbl_RolePermission] ([RoleId], [MenuId], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (2, 8, 1, 0, 0, 1, CAST(N'2023-08-01T17:40:39.860' AS DateTime), 0, CAST(N'2023-08-01T17:40:39.860' AS DateTime), 0)
INSERT [dbo].[tbl_RolePermission] ([RoleId], [MenuId], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (2, 9, 1, 0, 0, 1, CAST(N'2023-08-01T17:40:39.860' AS DateTime), 0, CAST(N'2023-08-01T17:40:39.860' AS DateTime), 0)
INSERT [dbo].[tbl_RolePermission] ([RoleId], [MenuId], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (2, 10, 1, 0, 0, 1, CAST(N'2023-08-01T17:40:39.860' AS DateTime), 0, CAST(N'2023-08-01T17:40:39.860' AS DateTime), 0)
INSERT [dbo].[tbl_RolePermission] ([RoleId], [MenuId], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (2, 11, 1, 0, 0, 1, CAST(N'2023-08-01T17:40:39.860' AS DateTime), 0, CAST(N'2023-08-01T17:40:39.860' AS DateTime), 0)
INSERT [dbo].[tbl_RolePermission] ([RoleId], [MenuId], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (2, 13, 1, 0, 0, 1, CAST(N'2023-08-01T17:40:39.860' AS DateTime), 0, CAST(N'2023-08-01T17:40:39.860' AS DateTime), 0)
INSERT [dbo].[tbl_RolePermission] ([RoleId], [MenuId], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (2, 16, 1, 0, 0, 1, CAST(N'2023-08-01T17:40:39.860' AS DateTime), 0, CAST(N'2023-08-01T17:40:39.860' AS DateTime), 0)
INSERT [dbo].[tbl_RolePermission] ([RoleId], [MenuId], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (2, 18, 1, 0, 0, 1, CAST(N'2023-08-01T17:40:39.860' AS DateTime), 0, CAST(N'2023-08-01T17:40:39.860' AS DateTime), 0)
INSERT [dbo].[tbl_RolePermission] ([RoleId], [MenuId], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (2, 25, 0, 0, 0, 1, CAST(N'2023-08-01T17:40:39.860' AS DateTime), 0, CAST(N'2023-08-01T17:40:39.860' AS DateTime), 0)
INSERT [dbo].[tbl_RolePermission] ([RoleId], [MenuId], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (2, 26, 0, 0, 0, 1, CAST(N'2023-08-01T17:40:39.860' AS DateTime), 0, CAST(N'2023-08-01T17:40:39.860' AS DateTime), 0)
INSERT [dbo].[tbl_RolePermission] ([RoleId], [MenuId], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (2, 24, 1, 0, 0, 1, CAST(N'2023-08-01T17:40:39.860' AS DateTime), 0, CAST(N'2023-08-01T17:40:39.860' AS DateTime), 0)
INSERT [dbo].[tbl_RolePermission] ([RoleId], [MenuId], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (2, 27, 0, 0, 0, 1, CAST(N'2023-08-01T17:40:39.860' AS DateTime), 0, CAST(N'2023-08-01T17:40:39.860' AS DateTime), 0)
INSERT [dbo].[tbl_RolePermission] ([RoleId], [MenuId], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (1, 1, 1, 1, 0, 1, CAST(N'2023-06-22T00:00:04.770' AS DateTime), 0, CAST(N'2023-06-22T00:00:04.770' AS DateTime), 0)
INSERT [dbo].[tbl_RolePermission] ([RoleId], [MenuId], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (1, 2, 1, 0, 0, 1, CAST(N'2023-06-22T00:00:04.770' AS DateTime), 0, CAST(N'2023-06-22T00:00:04.770' AS DateTime), 0)
INSERT [dbo].[tbl_RolePermission] ([RoleId], [MenuId], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (1, 3, 1, 0, 0, 1, CAST(N'2023-06-22T00:00:04.770' AS DateTime), 0, CAST(N'2023-06-22T00:00:04.770' AS DateTime), 0)
INSERT [dbo].[tbl_RolePermission] ([RoleId], [MenuId], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (1, 4, 1, 0, 0, 1, CAST(N'2023-06-22T00:00:04.770' AS DateTime), 0, CAST(N'2023-06-22T00:00:04.770' AS DateTime), 0)
INSERT [dbo].[tbl_RolePermission] ([RoleId], [MenuId], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (1, 7, 1, 0, 0, 1, CAST(N'2023-06-22T00:00:04.770' AS DateTime), 0, CAST(N'2023-06-22T00:00:04.770' AS DateTime), 0)
INSERT [dbo].[tbl_RolePermission] ([RoleId], [MenuId], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (1, 8, 1, 0, 0, 1, CAST(N'2023-06-22T00:00:04.770' AS DateTime), 0, CAST(N'2023-06-22T00:00:04.770' AS DateTime), 0)
INSERT [dbo].[tbl_RolePermission] ([RoleId], [MenuId], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (1, 9, 1, 0, 0, 1, CAST(N'2023-06-22T00:00:04.770' AS DateTime), 0, CAST(N'2023-06-22T00:00:04.770' AS DateTime), 0)
INSERT [dbo].[tbl_RolePermission] ([RoleId], [MenuId], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (1, 10, 1, 0, 0, 1, CAST(N'2023-06-22T00:00:04.770' AS DateTime), 0, CAST(N'2023-06-22T00:00:04.770' AS DateTime), 0)
INSERT [dbo].[tbl_RolePermission] ([RoleId], [MenuId], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (1, 11, 1, 0, 0, 1, CAST(N'2023-06-22T00:00:04.770' AS DateTime), 0, CAST(N'2023-06-22T00:00:04.770' AS DateTime), 0)
INSERT [dbo].[tbl_RolePermission] ([RoleId], [MenuId], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (1, 13, 1, 0, 0, 1, CAST(N'2023-06-22T00:00:04.770' AS DateTime), 0, CAST(N'2023-06-22T00:00:04.770' AS DateTime), 0)
INSERT [dbo].[tbl_RolePermission] ([RoleId], [MenuId], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (1, 16, 1, 0, 0, 1, CAST(N'2023-06-22T00:00:04.770' AS DateTime), 0, CAST(N'2023-06-22T00:00:04.770' AS DateTime), 0)
INSERT [dbo].[tbl_RolePermission] ([RoleId], [MenuId], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (1, 18, 1, 0, 0, 1, CAST(N'2023-06-22T00:00:04.770' AS DateTime), 0, CAST(N'2023-06-22T00:00:04.770' AS DateTime), 0)
INSERT [dbo].[tbl_RolePermission] ([RoleId], [MenuId], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (1, 19, 1, 0, 0, 1, CAST(N'2023-06-22T00:00:04.770' AS DateTime), 0, CAST(N'2023-06-22T00:00:04.770' AS DateTime), 0)
INSERT [dbo].[tbl_RolePermission] ([RoleId], [MenuId], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (1, 22, 1, 1, 0, 1, CAST(N'2023-06-22T00:00:04.770' AS DateTime), 0, CAST(N'2023-06-22T00:00:04.770' AS DateTime), 0)
INSERT [dbo].[tbl_RolePermission] ([RoleId], [MenuId], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (1, 24, 1, 0, 0, 1, CAST(N'2023-06-22T00:00:04.770' AS DateTime), 0, CAST(N'2023-06-22T00:00:04.770' AS DateTime), 0)
INSERT [dbo].[tbl_RolePermission] ([RoleId], [MenuId], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (2, 28, 1, 1, 1, 1, CAST(N'2023-08-01T17:40:39.860' AS DateTime), 0, CAST(N'2023-08-01T17:40:39.860' AS DateTime), 0)
INSERT [dbo].[tbl_RolePermission] ([RoleId], [MenuId], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (2, 29, 1, 1, 1, 1, CAST(N'2023-08-01T17:40:39.860' AS DateTime), 0, CAST(N'2023-08-01T17:40:39.860' AS DateTime), 0)
INSERT [dbo].[tbl_RolePermission] ([RoleId], [MenuId], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (2, 30, 1, 1, 1, 1, CAST(N'2023-08-01T17:40:39.860' AS DateTime), 0, CAST(N'2023-08-01T17:40:39.860' AS DateTime), 0)
INSERT [dbo].[tbl_RolePermission] ([RoleId], [MenuId], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (2, 31, 1, 1, 1, 1, CAST(N'2023-08-01T17:40:39.860' AS DateTime), 0, CAST(N'2023-08-01T17:40:39.860' AS DateTime), 0)
INSERT [dbo].[tbl_RolePermission] ([RoleId], [MenuId], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (2, 32, 1, 1, 1, 1, CAST(N'2023-08-01T17:40:39.860' AS DateTime), 0, CAST(N'2023-08-01T17:40:39.860' AS DateTime), 0)
INSERT [dbo].[tbl_RolePermission] ([RoleId], [MenuId], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (2, 33, 1, 1, 1, 1, CAST(N'2023-08-01T17:40:39.860' AS DateTime), 0, CAST(N'2023-08-01T17:40:39.860' AS DateTime), 0)
INSERT [dbo].[tbl_RolePermission] ([RoleId], [MenuId], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (3, 1, 1, 0, 0, 1, CAST(N'2023-08-03T10:49:36.387' AS DateTime), 0, CAST(N'2023-08-03T10:49:36.387' AS DateTime), 0)
INSERT [dbo].[tbl_RolePermission] ([RoleId], [MenuId], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (3, 2, 1, 0, 0, 1, CAST(N'2023-08-03T10:49:36.387' AS DateTime), 0, CAST(N'2023-08-03T10:49:36.387' AS DateTime), 0)
INSERT [dbo].[tbl_RolePermission] ([RoleId], [MenuId], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (3, 3, 1, 0, 0, 1, CAST(N'2023-08-03T10:49:36.387' AS DateTime), 0, CAST(N'2023-08-03T10:49:36.387' AS DateTime), 0)
INSERT [dbo].[tbl_RolePermission] ([RoleId], [MenuId], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (3, 4, 1, 0, 0, 1, CAST(N'2023-08-03T10:49:36.387' AS DateTime), 0, CAST(N'2023-08-03T10:49:36.387' AS DateTime), 0)
INSERT [dbo].[tbl_RolePermission] ([RoleId], [MenuId], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (3, 5, 1, 0, 0, 1, CAST(N'2023-08-03T10:49:36.387' AS DateTime), 0, CAST(N'2023-08-03T10:49:36.387' AS DateTime), 0)
INSERT [dbo].[tbl_RolePermission] ([RoleId], [MenuId], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (3, 6, 1, 0, 0, 1, CAST(N'2023-08-03T10:49:36.387' AS DateTime), 0, CAST(N'2023-08-03T10:49:36.387' AS DateTime), 0)
INSERT [dbo].[tbl_RolePermission] ([RoleId], [MenuId], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (3, 7, 1, 0, 0, 1, CAST(N'2023-08-03T10:49:36.387' AS DateTime), 0, CAST(N'2023-08-03T10:49:36.387' AS DateTime), 0)
INSERT [dbo].[tbl_RolePermission] ([RoleId], [MenuId], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (3, 8, 1, 0, 0, 1, CAST(N'2023-08-03T10:49:36.387' AS DateTime), 0, CAST(N'2023-08-03T10:49:36.387' AS DateTime), 0)
INSERT [dbo].[tbl_RolePermission] ([RoleId], [MenuId], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (3, 16, 1, 0, 0, 1, CAST(N'2023-08-03T10:49:36.387' AS DateTime), 0, CAST(N'2023-08-03T10:49:36.387' AS DateTime), 0)
INSERT [dbo].[tbl_RolePermission] ([RoleId], [MenuId], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (3, 17, 1, 0, 0, 1, CAST(N'2023-08-03T10:49:36.387' AS DateTime), 0, CAST(N'2023-08-03T10:49:36.387' AS DateTime), 0)
INSERT [dbo].[tbl_RolePermission] ([RoleId], [MenuId], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (3, 18, 1, 0, 0, 1, CAST(N'2023-08-03T10:49:36.387' AS DateTime), 0, CAST(N'2023-08-03T10:49:36.387' AS DateTime), 0)
INSERT [dbo].[tbl_RolePermission] ([RoleId], [MenuId], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (3, 19, 1, 0, 0, 1, CAST(N'2023-08-03T10:49:36.387' AS DateTime), 0, CAST(N'2023-08-03T10:49:36.387' AS DateTime), 0)
INSERT [dbo].[tbl_RolePermission] ([RoleId], [MenuId], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (3, 20, 1, 0, 0, 1, CAST(N'2023-08-03T10:49:36.387' AS DateTime), 0, CAST(N'2023-08-03T10:49:36.387' AS DateTime), 0)
INSERT [dbo].[tbl_RolePermission] ([RoleId], [MenuId], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (3, 21, 1, 0, 0, 1, CAST(N'2023-08-03T10:49:36.387' AS DateTime), 0, CAST(N'2023-08-03T10:49:36.387' AS DateTime), 0)
INSERT [dbo].[tbl_RolePermission] ([RoleId], [MenuId], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (3, 22, 1, 0, 0, 1, CAST(N'2023-08-03T10:49:36.387' AS DateTime), 0, CAST(N'2023-08-03T10:49:36.387' AS DateTime), 0)
INSERT [dbo].[tbl_RolePermission] ([RoleId], [MenuId], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (3, 23, 1, 0, 0, 1, CAST(N'2023-08-03T10:49:36.387' AS DateTime), 0, CAST(N'2023-08-03T10:49:36.387' AS DateTime), 0)
INSERT [dbo].[tbl_RolePermission] ([RoleId], [MenuId], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (3, 24, 1, 0, 0, 1, CAST(N'2023-08-03T10:49:36.387' AS DateTime), 0, CAST(N'2023-08-03T10:49:36.387' AS DateTime), 0)
INSERT [dbo].[tbl_RolePermission] ([RoleId], [MenuId], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (3, 25, 1, 0, 0, 1, CAST(N'2023-08-03T10:49:36.387' AS DateTime), 0, CAST(N'2023-08-03T10:49:36.387' AS DateTime), 0)
INSERT [dbo].[tbl_RolePermission] ([RoleId], [MenuId], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (3, 26, 1, 0, 0, 1, CAST(N'2023-08-03T10:49:36.387' AS DateTime), 0, CAST(N'2023-08-03T10:49:36.387' AS DateTime), 0)
INSERT [dbo].[tbl_RolePermission] ([RoleId], [MenuId], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (3, 40, 1, 0, 0, 1, CAST(N'2023-08-03T10:49:36.387' AS DateTime), 0, CAST(N'2023-08-03T10:49:36.387' AS DateTime), 0)
INSERT [dbo].[tbl_RolePermission] ([RoleId], [MenuId], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (3, 41, 1, 0, 0, 1, CAST(N'2023-08-03T10:49:36.387' AS DateTime), 0, CAST(N'2023-08-03T10:49:36.387' AS DateTime), 0)
INSERT [dbo].[tbl_RolePermission] ([RoleId], [MenuId], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (3, 42, 1, 0, 0, 1, CAST(N'2023-08-03T10:49:36.387' AS DateTime), 0, CAST(N'2023-08-03T10:49:36.387' AS DateTime), 0)
INSERT [dbo].[tbl_RolePermission] ([RoleId], [MenuId], [DataView], [DataAdd], [DataUpdate], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (3, 44, 1, 0, 0, 1, CAST(N'2023-08-03T10:49:36.387' AS DateTime), 0, CAST(N'2023-08-03T10:49:36.387' AS DateTime), 0)
GO
SET IDENTITY_INSERT [dbo].[tbl_SystemMaster] ON 

INSERT [dbo].[tbl_SystemMaster] ([SystemId], [SystemName], [SystemDescription], [AppPort], [ApiPort], [SystemImage], [SystemIcon], [DashBoard], [ReportIds], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (1, N'ADAS', N'Advance Driver Advisory System', 3039, 3019, N'ADAS.jpg', N'fas fa-truck-pickup', 0, N'', 0, CAST(N'2022-01-14T23:01:30.817' AS DateTime), 0, CAST(N'2022-01-14T23:01:30.817' AS DateTime), 0)
INSERT [dbo].[tbl_SystemMaster] ([SystemId], [SystemName], [SystemDescription], [AppPort], [ApiPort], [SystemImage], [SystemIcon], [DashBoard], [ReportIds], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (2, N'ATCC', N'Automatic Traffic Counter-cum-Classifier', 3031, 3011, N'ATCC.jpg', N'fas fa-car', 1, N'1,4,5,6,2', 1, CAST(N'2022-01-14T23:01:49.837' AS DateTime), 0, CAST(N'2022-01-14T23:01:49.837' AS DateTime), 0)
INSERT [dbo].[tbl_SystemMaster] ([SystemId], [SystemName], [SystemDescription], [AppPort], [ApiPort], [SystemImage], [SystemIcon], [DashBoard], [ReportIds], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (3, N'ECB', N'Emergency Calling Box System', 3034, 3014, N'ECS.jpg', N'fas fa-tty', 1, N'1,4,7,2', 1, CAST(N'2022-01-14T23:02:20.130' AS DateTime), 0, CAST(N'2022-01-14T23:02:20.130' AS DateTime), 0)
INSERT [dbo].[tbl_SystemMaster] ([SystemId], [SystemName], [SystemDescription], [AppPort], [ApiPort], [SystemImage], [SystemIcon], [DashBoard], [ReportIds], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (4, N'FMS', N'Facility Monitoring System', 3032, 3012, N'NMS.jpg', N'fas fa-network-wired', 0, N'', 0, CAST(N'2022-01-14T23:03:15.580' AS DateTime), 0, CAST(N'2022-01-14T23:03:15.580' AS DateTime), 0)
INSERT [dbo].[tbl_SystemMaster] ([SystemId], [SystemName], [SystemDescription], [AppPort], [ApiPort], [SystemImage], [SystemIcon], [DashBoard], [ReportIds], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (5, N'TMCS', N'Traffic Monitor Camera System', 3035, 3015, N'TMCS.jpg', N'pi pi-video', 0, N'', 1, CAST(N'2022-01-14T23:05:25.100' AS DateTime), 0, CAST(N'2022-01-14T23:05:25.100' AS DateTime), 0)
INSERT [dbo].[tbl_SystemMaster] ([SystemId], [SystemName], [SystemDescription], [AppPort], [ApiPort], [SystemImage], [SystemIcon], [DashBoard], [ReportIds], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (6, N'VIDS', N'Video Incident Detection System', 3036, 3016, N'VIDS.jpg', N'fas fa-snowplow', 1, N'13,14,1,2,3,4,6,7', 1, CAST(N'2022-01-14T23:05:39.973' AS DateTime), 0, CAST(N'2022-01-14T23:05:39.973' AS DateTime), 0)
INSERT [dbo].[tbl_SystemMaster] ([SystemId], [SystemName], [SystemDescription], [AppPort], [ApiPort], [SystemImage], [SystemIcon], [DashBoard], [ReportIds], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (7, N'VMS', N'Variable Message Sign', 3037, 3017, N'VMS.png', N'fa fa-television', 1, N'1', 1, CAST(N'2022-01-14T23:05:56.100' AS DateTime), 0, CAST(N'2022-01-14T23:05:56.100' AS DateTime), 0)
INSERT [dbo].[tbl_SystemMaster] ([SystemId], [SystemName], [SystemDescription], [AppPort], [ApiPort], [SystemImage], [SystemIcon], [DashBoard], [ReportIds], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (8, N'VSDS', N'Vehicle Speed Detection System', 3038, 3018, N'VSDS.jpg', N'fas fa-video', 0, N'', 0, CAST(N'2022-01-14T23:06:14.370' AS DateTime), 0, CAST(N'2022-01-14T23:06:14.370' AS DateTime), 0)
INSERT [dbo].[tbl_SystemMaster] ([SystemId], [SystemName], [SystemDescription], [AppPort], [ApiPort], [SystemImage], [SystemIcon], [DashBoard], [ReportIds], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (9, N'Weather', N'Weather', 3040, 3020, N'MET.jpg', N'fas fa-poo-storm', 1, N'1', 1, CAST(N'2022-01-14T23:06:23.450' AS DateTime), 0, CAST(N'2022-01-14T23:06:23.450' AS DateTime), 0)
INSERT [dbo].[tbl_SystemMaster] ([SystemId], [SystemName], [SystemDescription], [AppPort], [ApiPort], [SystemImage], [SystemIcon], [DashBoard], [ReportIds], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (10, N'IMS', N'Incident Management System', 3033, 3013, N'IMS.jpg', N'fas fa-car-crash', 1, N'1,7,4', 1, CAST(N'2022-01-14T23:33:26.807' AS DateTime), 0, CAST(N'2022-01-14T23:33:26.807' AS DateTime), 0)
INSERT [dbo].[tbl_SystemMaster] ([SystemId], [SystemName], [SystemDescription], [AppPort], [ApiPort], [SystemImage], [SystemIcon], [DashBoard], [ReportIds], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (11, N'Config', N'Configuration', 3021, 3010, N'Config.jpg', N'fa fa-cog', 0, N'', 0, CAST(N'2022-01-25T11:24:28.827' AS DateTime), 0, CAST(N'2022-01-25T11:24:28.827' AS DateTime), 0)
INSERT [dbo].[tbl_SystemMaster] ([SystemId], [SystemName], [SystemDescription], [AppPort], [ApiPort], [SystemImage], [SystemIcon], [DashBoard], [ReportIds], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (12, N'TTMS', N'Time Travel Estimation', 3043, 3023, NULL, N'fas fa-map-marked', 0, N'', 0, CAST(N'2022-03-21T13:07:06.753' AS DateTime), 0, CAST(N'2022-03-21T13:07:06.753' AS DateTime), 0)
INSERT [dbo].[tbl_SystemMaster] ([SystemId], [SystemName], [SystemDescription], [AppPort], [ApiPort], [SystemImage], [SystemIcon], [DashBoard], [ReportIds], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (13, N'RMS', N'Report Management System', 3044, NULL, NULL, N'fa fa-files-o', 0, N'', 0, CAST(N'2022-07-04T11:10:53.793' AS DateTime), 0, CAST(N'2022-07-04T11:10:53.793' AS DateTime), 0)
INSERT [dbo].[tbl_SystemMaster] ([SystemId], [SystemName], [SystemDescription], [AppPort], [ApiPort], [SystemImage], [SystemIcon], [DashBoard], [ReportIds], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (14, N'NMS', N'Network Management System', 8060, NULL, N'NMS.jpg', N'fas fa-solid fa-network-wired', 0, N'', 0, CAST(N'2022-07-04T11:20:55.147' AS DateTime), 0, CAST(N'2022-07-04T11:20:55.147' AS DateTime), 0)
INSERT [dbo].[tbl_SystemMaster] ([SystemId], [SystemName], [SystemDescription], [AppPort], [ApiPort], [SystemImage], [SystemIcon], [DashBoard], [ReportIds], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (15, N'Challan', N'NIC Challan', 3045, 3025, N'NMS.jpg', N'fa fa-address-card', 0, N'', 0, CAST(N'2022-07-21T01:44:46.273' AS DateTime), 0, CAST(N'2022-07-21T01:44:46.273' AS DateTime), 0)
INSERT [dbo].[tbl_SystemMaster] ([SystemId], [SystemName], [SystemDescription], [AppPort], [ApiPort], [SystemImage], [SystemIcon], [DashBoard], [ReportIds], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (16, N'CRS', N'Control Room System', 3031, 3030, NULL, NULL, 0, N'', 1, CAST(N'2023-06-20T10:15:39.893' AS DateTime), 0, CAST(N'2023-06-20T10:15:39.893' AS DateTime), 0)
INSERT [dbo].[tbl_SystemMaster] ([SystemId], [SystemName], [SystemDescription], [AppPort], [ApiPort], [SystemImage], [SystemIcon], [DashBoard], [ReportIds], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (17, N'MRCS', N'Mobile Radio Communication System', NULL, NULL, NULL, NULL, 0, N'', 1, CAST(N'2023-06-20T10:17:21.870' AS DateTime), 0, CAST(N'2023-06-20T10:17:21.870' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[tbl_SystemMaster] OFF
GO
INSERT [dbo].[tbl_SystemSetting] ([TotalLane], [IsATCCIndependently], [ATCCByVSDS], [ATCCByVIDS], [TrafficCount], [TrafficByTime], [RestrictedVehiclesIds], [DefaultControlRoomId], [IsWeatherOnline], [WeatherAPI], [WeatherAPIHitPerMinite], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (4, 1, 0, 0, 10, 1, N'2,1', 1, 1, N'https://api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&units=metric&appid=8c5dde45d62aeb966988a236db01e310', 5, 1, CAST(N'2023-08-03T00:13:22.633' AS DateTime), 0, CAST(N'2023-10-26T11:29:43.050' AS DateTime), 0)
GO
SET IDENTITY_INSERT [dbo].[tbl_UserMaster] ON 

INSERT [dbo].[tbl_UserMaster] ([UserId], [LoginId], [LoginPassword], [FirstName], [LastName], [EmailId], [MobileNumber], [AccountExpiredDate], [RoleId], [UserTypeId], [UserProfileImage], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (1, N'admin', N'ek4e0KyF2CB1xj3nwprPWg==', N'Admin', N'Admin', N'Admin@gmail.com', N'9982567732', CAST(N'2033-06-12' AS Date), 1, 1, N'\User\ProfileImage\0d6e31fe-bef9-4d04-8ba6-6ad3d016bcc8.png', 1, CAST(N'2023-06-16T01:10:15.223' AS DateTime), 0, CAST(N'2023-06-26T21:33:56.993' AS DateTime), 1)
INSERT [dbo].[tbl_UserMaster] ([UserId], [LoginId], [LoginPassword], [FirstName], [LastName], [EmailId], [MobileNumber], [AccountExpiredDate], [RoleId], [UserTypeId], [UserProfileImage], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (2, N'pt1', N'ek4e0KyF2CB1xj3nwprPWg==', N'Patrolling', N'Team', N'pt1@gmail.com', N'9982567732', CAST(N'2033-06-12' AS Date), 1, 5, NULL, 1, CAST(N'2023-06-16T01:10:15.223' AS DateTime), 0, CAST(N'2023-06-26T21:33:56.993' AS DateTime), 1)
INSERT [dbo].[tbl_UserMaster] ([UserId], [LoginId], [LoginPassword], [FirstName], [LastName], [EmailId], [MobileNumber], [AccountExpiredDate], [RoleId], [UserTypeId], [UserProfileImage], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (3, N'user1', N'EbWS3/EHBvt8Qg7+RlryTg==', N'Operator-1', N'VIDS', N'abc@g.com', N'128909870909', CAST(N'2029-12-24' AS Date), 2, 3, NULL, 1, CAST(N'2023-08-01T15:13:37.257' AS DateTime), 0, CAST(N'2023-08-03T10:49:58.207' AS DateTime), 3)
SET IDENTITY_INSERT [dbo].[tbl_UserMaster] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_VehicleClass] ON 

INSERT [dbo].[tbl_VehicleClass] ([VehicleClassId], [VehicleClassName], [VehicleClassIcon], [VehicleClassColor], [AllowedSpeed], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (0, N'Unknown', N'mdi mdi-plus-circle', N'#fff', CAST(80.00 AS Decimal(10, 2)), 1, CAST(N'2022-01-18T12:21:46.273' AS DateTime), 0, CAST(N'2023-06-26T21:19:20.393' AS DateTime), 0)
INSERT [dbo].[tbl_VehicleClass] ([VehicleClassId], [VehicleClassName], [VehicleClassIcon], [VehicleClassColor], [AllowedSpeed], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (1, N'Motorcycle', N'mdi mdi-motorbike', N'#0C356A', CAST(80.00 AS Decimal(10, 2)), 1, CAST(N'2022-01-18T12:21:46.273' AS DateTime), 0, CAST(N'2023-10-27T13:47:37.573' AS DateTime), 0)
INSERT [dbo].[tbl_VehicleClass] ([VehicleClassId], [VehicleClassName], [VehicleClassIcon], [VehicleClassColor], [AllowedSpeed], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (2, N'Auto', N'mdi mdi-truck-cargo-container', N'#FFC436', CAST(80.00 AS Decimal(10, 2)), 1, CAST(N'2022-01-18T12:21:51.963' AS DateTime), 0, CAST(N'2022-09-17T12:16:28.997' AS DateTime), 1)
INSERT [dbo].[tbl_VehicleClass] ([VehicleClassId], [VehicleClassName], [VehicleClassIcon], [VehicleClassColor], [AllowedSpeed], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (3, N'Car', N'mdi mdi-car', N'#0174BE', CAST(100.00 AS Decimal(10, 2)), 1, CAST(N'2022-01-18T12:21:58.643' AS DateTime), 0, CAST(N'2022-09-17T12:16:19.307' AS DateTime), 1)
INSERT [dbo].[tbl_VehicleClass] ([VehicleClassId], [VehicleClassName], [VehicleClassIcon], [VehicleClassColor], [AllowedSpeed], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (4, N'Bus', N'mdi mdi-van-passenger', N'#005B41', CAST(80.00 AS Decimal(10, 2)), 1, CAST(N'2022-02-06T19:03:34.300' AS DateTime), 0, CAST(N'2022-09-17T12:16:33.870' AS DateTime), 1)
INSERT [dbo].[tbl_VehicleClass] ([VehicleClassId], [VehicleClassName], [VehicleClassIcon], [VehicleClassColor], [AllowedSpeed], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (5, N'LCV', N'mdi mdi-car-pickup', N'#4F709C', CAST(80.00 AS Decimal(10, 2)), 1, CAST(N'2022-02-06T19:03:42.730' AS DateTime), 0, CAST(N'2022-09-17T12:16:37.463' AS DateTime), 1)
INSERT [dbo].[tbl_VehicleClass] ([VehicleClassId], [VehicleClassName], [VehicleClassIcon], [VehicleClassColor], [AllowedSpeed], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (6, N'Truck', N'mdi mdi-rv-truck', N'#008170', CAST(80.00 AS Decimal(10, 2)), 1, CAST(N'2022-02-06T19:03:48.770' AS DateTime), 0, CAST(N'2022-09-17T12:16:40.487' AS DateTime), 1)
INSERT [dbo].[tbl_VehicleClass] ([VehicleClassId], [VehicleClassName], [VehicleClassIcon], [VehicleClassColor], [AllowedSpeed], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (7, N'Tractor', N'mdi mdi-tractor', N'#662549', CAST(80.00 AS Decimal(10, 2)), 1, CAST(N'2022-02-06T19:03:55.950' AS DateTime), 0, CAST(N'2022-09-17T12:16:43.843' AS DateTime), 1)
INSERT [dbo].[tbl_VehicleClass] ([VehicleClassId], [VehicleClassName], [VehicleClassIcon], [VehicleClassColor], [AllowedSpeed], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (8, N'Oversized', N'mdi mdi-bus-double-decker', N'#BCA37F', CAST(80.00 AS Decimal(10, 2)), 1, CAST(N'2022-02-06T19:04:09.470' AS DateTime), 0, CAST(N'2023-08-03T10:49:07.670' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[tbl_VehicleClass] OFF
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
