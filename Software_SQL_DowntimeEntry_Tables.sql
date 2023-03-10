GO
/****** Object:  Table [dbo].[DowntimeEntry]    Script Date: 2/22/2023 4:48:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DowntimeEntry](
	[DowntimeDataID] [int] IDENTITY(1,1) NOT NULL,
	[DowntimeStart] [datetime] NOT NULL,
	[DowntimeFinish] [datetime] NOT NULL,
	[EventCount] [int] NOT NULL,
 CONSTRAINT [PK_DowntimeEntry] PRIMARY KEY CLUSTERED 
(
	[DowntimeDataID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShiftCalendar]    Script Date: 2/22/2023 4:48:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShiftCalendar](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ShiftStartTime] [datetime] NOT NULL,
	[ShiftEndTime] [datetime] NOT NULL,
 CONSTRAINT [PK_ShiftCalendar] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[DowntimeEntry] ON 

INSERT [dbo].[DowntimeEntry] ([DowntimeDataID], [DowntimeStart], [DowntimeFinish], [EventCount]) VALUES (7, CAST(N'2013-01-02T17:00:00.000' AS DateTime), CAST(N'2013-01-03T12:00:00.000' AS DateTime), 1)
INSERT [dbo].[DowntimeEntry] ([DowntimeDataID], [DowntimeStart], [DowntimeFinish], [EventCount]) VALUES (9, CAST(N'2013-01-02T00:00:00.000' AS DateTime), CAST(N'2013-01-02T01:00:00.000' AS DateTime), 1)
INSERT [dbo].[DowntimeEntry] ([DowntimeDataID], [DowntimeStart], [DowntimeFinish], [EventCount]) VALUES (11, CAST(N'2013-01-02T07:00:00.000' AS DateTime), CAST(N'2013-01-02T09:00:00.000' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[DowntimeEntry] OFF
GO
SET IDENTITY_INSERT [dbo].[ShiftCalendar] ON 

INSERT [dbo].[ShiftCalendar] ([Id], [ShiftStartTime], [ShiftEndTime]) VALUES (1, CAST(N'2013-01-02T00:00:00.000' AS DateTime), CAST(N'2013-01-02T08:00:00.000' AS DateTime))
INSERT [dbo].[ShiftCalendar] ([Id], [ShiftStartTime], [ShiftEndTime]) VALUES (5, CAST(N'2013-01-02T08:00:00.000' AS DateTime), CAST(N'2013-01-02T16:00:00.000' AS DateTime))
INSERT [dbo].[ShiftCalendar] ([Id], [ShiftStartTime], [ShiftEndTime]) VALUES (6, CAST(N'2013-01-02T16:00:00.000' AS DateTime), CAST(N'2013-01-03T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[ShiftCalendar] OFF
GO
