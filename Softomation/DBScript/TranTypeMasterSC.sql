IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Trans__Modif__6F1576F7]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_TransactionTypeMaster] DROP CONSTRAINT [DF__tbl_Trans__Modif__6F1576F7]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Trans__Modif__6E2152BE]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_TransactionTypeMaster] DROP CONSTRAINT [DF__tbl_Trans__Modif__6E2152BE]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Trans__Creat__6D2D2E85]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_TransactionTypeMaster] DROP CONSTRAINT [DF__tbl_Trans__Creat__6D2D2E85]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Trans__Creat__6C390A4C]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_TransactionTypeMaster] DROP CONSTRAINT [DF__tbl_Trans__Creat__6C390A4C]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Trans__DataS__6B44E613]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_TransactionTypeMaster] DROP CONSTRAINT [DF__tbl_Trans__DataS__6B44E613]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tbl_Trans__Revei__6A50C1DA]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_TransactionTypeMaster] DROP CONSTRAINT [DF__tbl_Trans__Revei__6A50C1DA]
END
GO
/****** Object:  Table [dbo].[tbl_TransactionTypeMaster]    Script Date: 10-07-2021 20:41:59 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_TransactionTypeMaster]') AND type in (N'U'))
DROP TABLE [dbo].[tbl_TransactionTypeMaster]
GO
/****** Object:  Table [dbo].[tbl_TransactionTypeMaster]    Script Date: 10-07-2021 20:41:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_TransactionTypeMaster](
	[EntryId] [smallint] IDENTITY(1,1) NOT NULL,
	[ClientId] [smallint] NULL,
	[TransactionTypeName] [varchar](100) NULL,
	[ReveiwedRequired] [smallint] NULL,
	[DataStatus] [smallint] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [bigint] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [bigint] NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbl_TransactionTypeMaster] ON 
GO
INSERT [dbo].[tbl_TransactionTypeMaster] ([EntryId], [ClientId], [TransactionTypeName], [ReveiwedRequired], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (1, 0, N'ETC/FastTag', 0, 1, CAST(N'2021-05-04T18:31:21.203' AS DateTime), 0, CAST(N'2021-05-04T18:31:21.203' AS DateTime), 0)
GO
INSERT [dbo].[tbl_TransactionTypeMaster] ([EntryId], [ClientId], [TransactionTypeName], [ReveiwedRequired], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (2, 0, N'Cash', 0, 1, CAST(N'2021-05-04T18:31:21.203' AS DateTime), 0, CAST(N'2021-05-04T18:31:21.203' AS DateTime), 0)
GO
INSERT [dbo].[tbl_TransactionTypeMaster] ([EntryId], [ClientId], [TransactionTypeName], [ReveiwedRequired], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (3, 0, N'Card', 0, 0, CAST(N'2021-05-04T18:31:21.203' AS DateTime), 0, CAST(N'2021-05-04T18:31:21.203' AS DateTime), 0)
GO
INSERT [dbo].[tbl_TransactionTypeMaster] ([EntryId], [ClientId], [TransactionTypeName], [ReveiwedRequired], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (4, 0, N'Violation', 1, 1, CAST(N'2021-05-04T18:31:21.203' AS DateTime), 0, CAST(N'2021-05-04T18:31:21.203' AS DateTime), 0)
GO
INSERT [dbo].[tbl_TransactionTypeMaster] ([EntryId], [ClientId], [TransactionTypeName], [ReveiwedRequired], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (5, 0, N'Exempt', 1, 1, CAST(N'2021-05-04T18:31:21.203' AS DateTime), 0, CAST(N'2021-05-04T18:31:21.203' AS DateTime), 0)
GO
INSERT [dbo].[tbl_TransactionTypeMaster] ([EntryId], [ClientId], [TransactionTypeName], [ReveiwedRequired], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (6, 0, N'Return Journey Pass', 0, 2, CAST(N'2021-07-07T15:56:19.990' AS DateTime), 0, CAST(N'2021-07-07T15:56:19.990' AS DateTime), 0)
GO
INSERT [dbo].[tbl_TransactionTypeMaster] ([EntryId], [ClientId], [TransactionTypeName], [ReveiwedRequired], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (7, 0, N'Return Journey Validated', 0, 2, CAST(N'2021-07-07T15:56:31.010' AS DateTime), 0, CAST(N'2021-07-07T15:56:31.010' AS DateTime), 0)
GO
INSERT [dbo].[tbl_TransactionTypeMaster] ([EntryId], [ClientId], [TransactionTypeName], [ReveiwedRequired], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (8, 0, N'Monthly Pass', 0, 2, CAST(N'2021-07-07T15:56:59.823' AS DateTime), 0, CAST(N'2021-07-07T15:56:59.823' AS DateTime), 0)
GO
INSERT [dbo].[tbl_TransactionTypeMaster] ([EntryId], [ClientId], [TransactionTypeName], [ReveiwedRequired], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (9, 0, N'Local Non-Commercial', 0, 2, CAST(N'2021-07-07T15:57:11.537' AS DateTime), 0, CAST(N'2021-07-07T15:57:11.537' AS DateTime), 0)
GO
INSERT [dbo].[tbl_TransactionTypeMaster] ([EntryId], [ClientId], [TransactionTypeName], [ReveiwedRequired], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (10, 0, N'Local Traffic Cat2', 0, 2, CAST(N'2021-07-07T15:57:18.433' AS DateTime), 0, CAST(N'2021-07-07T15:57:18.433' AS DateTime), 0)
GO
INSERT [dbo].[tbl_TransactionTypeMaster] ([EntryId], [ClientId], [TransactionTypeName], [ReveiwedRequired], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (11, 0, N'Local Private Operator', 0, 2, CAST(N'2021-07-07T15:57:25.273' AS DateTime), 0, CAST(N'2021-07-07T15:57:25.273' AS DateTime), 0)
GO
INSERT [dbo].[tbl_TransactionTypeMaster] ([EntryId], [ClientId], [TransactionTypeName], [ReveiwedRequired], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (12, 0, N'School Bus', 0, 2, CAST(N'2021-07-07T15:57:31.287' AS DateTime), 0, CAST(N'2021-07-07T15:57:31.287' AS DateTime), 0)
GO
INSERT [dbo].[tbl_TransactionTypeMaster] ([EntryId], [ClientId], [TransactionTypeName], [ReveiwedRequired], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (13, 0, N'State Bus', 0, 2, CAST(N'2021-07-07T15:57:45.327' AS DateTime), 0, CAST(N'2021-07-07T15:57:45.327' AS DateTime), 0)
GO
INSERT [dbo].[tbl_TransactionTypeMaster] ([EntryId], [ClientId], [TransactionTypeName], [ReveiwedRequired], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (14, 0, N'Flexi Pass', 0, 2, CAST(N'2021-07-07T16:05:12.947' AS DateTime), 0, CAST(N'2021-07-07T16:05:12.947' AS DateTime), 0)
GO
INSERT [dbo].[tbl_TransactionTypeMaster] ([EntryId], [ClientId], [TransactionTypeName], [ReveiwedRequired], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (15, 0, N'Local Traffic', 0, 2, CAST(N'2021-07-07T16:05:23.820' AS DateTime), 0, CAST(N'2021-07-07T16:05:23.820' AS DateTime), 0)
GO
INSERT [dbo].[tbl_TransactionTypeMaster] ([EntryId], [ClientId], [TransactionTypeName], [ReveiwedRequired], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (16, 0, N'Local Long', 0, 2, CAST(N'2021-07-07T16:05:31.840' AS DateTime), 0, CAST(N'2021-07-07T16:05:31.840' AS DateTime), 0)
GO
INSERT [dbo].[tbl_TransactionTypeMaster] ([EntryId], [ClientId], [TransactionTypeName], [ReveiwedRequired], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (17, 0, N'Local Commercial', 0, 2, CAST(N'2021-07-07T16:05:38.197' AS DateTime), 0, CAST(N'2021-07-07T16:05:38.197' AS DateTime), 0)
GO
INSERT [dbo].[tbl_TransactionTypeMaster] ([EntryId], [ClientId], [TransactionTypeName], [ReveiwedRequired], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (18, 0, N'Local Non-Commercial 20 KM', 0, 2, CAST(N'2021-07-07T16:05:47.720' AS DateTime), 0, CAST(N'2021-07-07T16:05:47.720' AS DateTime), 0)
GO
INSERT [dbo].[tbl_TransactionTypeMaster] ([EntryId], [ClientId], [TransactionTypeName], [ReveiwedRequired], [DataStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (19, 0, N'Local Commercial 20 KM', 0, 2, CAST(N'2021-07-07T16:05:57.947' AS DateTime), 0, CAST(N'2021-07-07T16:05:57.947' AS DateTime), 0)
GO
SET IDENTITY_INSERT [dbo].[tbl_TransactionTypeMaster] OFF
GO
ALTER TABLE [dbo].[tbl_TransactionTypeMaster] ADD  DEFAULT ((0)) FOR [ReveiwedRequired]
GO
ALTER TABLE [dbo].[tbl_TransactionTypeMaster] ADD  DEFAULT ((1)) FOR [DataStatus]
GO
ALTER TABLE [dbo].[tbl_TransactionTypeMaster] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[tbl_TransactionTypeMaster] ADD  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[tbl_TransactionTypeMaster] ADD  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[tbl_TransactionTypeMaster] ADD  DEFAULT ((0)) FOR [ModifiedBy]
GO
