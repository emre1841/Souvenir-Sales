USE [SouvenirSalesDB]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 5.01.2021 21:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Baskets]    Script Date: 5.01.2021 21:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Baskets](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[CreateUserID] [int] NOT NULL,
	[UpdateDate] [datetime] NULL,
	[UpdateUserID] [int] NULL,
 CONSTRAINT [PK_dbo.Baskets] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 5.01.2021 21:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ParentID] [int] NOT NULL,
	[Name] [nvarchar](max) NULL,
	[IsActive] [bit] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[CreateUserID] [int] NOT NULL,
	[UpdateDate] [datetime] NULL,
	[UpdateUserID] [int] NULL,
 CONSTRAINT [PK_dbo.Categories] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderProducts]    Script Date: 5.01.2021 21:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderProducts](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[CreateUserID] [int] NOT NULL,
	[UpdateDate] [datetime] NULL,
	[UpdateUserID] [int] NULL,
 CONSTRAINT [PK_dbo.OrderProducts] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 5.01.2021 21:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[TotalPrice] [decimal](18, 2) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[CreateUserID] [int] NOT NULL,
	[UpdateDate] [datetime] NULL,
	[UpdateUserID] [int] NULL,
 CONSTRAINT [PK_dbo.Orders] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 5.01.2021 21:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[CategoryId] [int] NOT NULL,
	[Brand] [nvarchar](max) NULL,
	[Model] [nvarchar](max) NULL,
	[ImageUrl] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[CreateUserID] [int] NOT NULL,
	[UpdateDate] [datetime] NULL,
	[UpdateUserID] [int] NULL,
 CONSTRAINT [PK_dbo.Products] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 5.01.2021 21:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[LastName] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[Telephone] [nvarchar](max) NULL,
	[Password] [nvarchar](max) NULL,
	[TCKN] [nvarchar](max) NULL,
	[Adress] [nvarchar](max) NULL,
	[IsActive] [bit] NOT NULL,
	[IsAdmin] [bit] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[CreateUserID] [int] NOT NULL,
	[UpdateDate] [datetime] NULL,
	[UpdateUserID] [int] NULL,
 CONSTRAINT [PK_dbo.Users] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'202012191959143_v1', N'SouvenirSales.WebUI.Migrations.Configuration', 0x1F8B0800000000000400ED5DDB6EE436127D0F907F10F494048EDBF6BC244677024F7B266864C6F64EDBD97D33D812DD26A24B87A21C3716FB6579D84FDA5F58EACEAB445DBADB7684C10C6C8A3C2C9255C552A9AAE67F7FFD77FAF3B3EF594F1047280C66F6E9F1896DC1C0095D14AC67764C1EBEFFC1FEF9A7AFBF9A7E70FD67EBB7A2DFBBA41F1D194433FB9190CDF96412398FD007D1B18F1C1C46E1033976427F02DC70727672F2E3E4F4740229844DB12C6BFA250E08F261FA0BFD751E060EDC9018789F43177A51DE4E9F2C5354EB0AF830DA0007CEEC65183FC100E125F06074FC4FB8BA5B1C67A38E290C81CFC4B62E3C0428654BE83DD8160882900042E93EBF8BE092E030582F37B40178B7DB0DA4FD1E8017C17C3DE75577D3A59D9C254B9B54030B28278E48E8B7043C7D97EFD5441CDE69C7ED722FE96E7EA0BB4EB6C9AAD31D9DD9EF41F43BA41B264E753EF770D2AD76BB5334445B3394234BD1F7A8E419CA5AC99F236B1E7B24C67016C09860E01D5937F1CA43CEAF707B1BFE0E8359107B1E4B35A59B3EE31A68D30D0E371093ED17F890AF6571695B137EDC441C580E63C664EB5C04E4DD996D5DD1C9C1CA832553307BB2242186BFC0006240A07B030881989EE9C285E9B64AB30B7351E6C3CDF3D563D05FDDD8210BB71FCC3F629093DC07658E21DD884BFAB7C0497EBEA572DD116A881DBADBB85AA24C462A6910065E8127B44E79427D3CB6F5057AE9F3E8116D323D940BC97DD9E5230EFD2FA1570A61F1E49E4A117612EA43E5E35B80D789C8B2344D279564D7CA7B397B3F81CF614689AFE7A8E4DF62367AEFD02BD5B63E83E74F305893C7994D7FA46C809EA15BB4E414DC0588DEC07410C171B3E850D2D621DEF6D509EF3108DC9D539B72D2CE6759F8600DEFF0EE27BA849183D126BB9D773CD70D464EA5D4A0837C40177883E94FB9F1F6836D2D1D909CF8A8CCFB2BF342B094DABCD0C655A74A9F8BCF248D2E75E8A5D32B12FA29F50267D4EA0D720830EDD897B5F772372CA20B87A0A772A2F721E53F108CCAC14839184BE03576211EC8B462B14649AC3FC774AFFADA3DE32BD5C105ADEE164ECF587905B392729F77AB2E61F9A9740D2BBAA82EE2AE2F7C1CBCE2B54FF5BC9EC6415E01F39D1A404B8DEAC9C0E1D353ADDC525ABCD1F2DFAFCE4906EB45FA3E7B2C0872DAAA16DFEC512FA1CDA6EC27B309C628B22FC02AFF0422B297893EF800EDDE07720B3DB8790C83DDAFE70644D19F21DEBD97EA76FEEBD5CE27B970318CA257F30E48715C1F05E3ABE490AF921751143A28555DBC45593996F8E93F04AED5E465CAF889F15251AEA2FA1C6DA806A734CCECEFA455D5C016F716035B799C78DC5309976A7E98784B10F0E6F426A577090A887C4DA0C0411BE03590208C33BC6092CD2F67109F5CC20D0C92BBA161534DA6661DF13209E54CC2EDD7B443D309C323F5AC237C61D29DB0EE735375BEC5576173AED17CA36A66C58158463DFF1E1846BD992613337E8783700B63CBEA4E5565D856279ABF489A3389C21866E032137727DC214FBC07CE9037CF64D2E29DF1702CC17B546ACF52E35E1158A4C32554E3996962C021594649C1BE5847B9B92693975ED1C3F350D35554EF021B988F0E7639D551B16F6E7AF11755662727917C7404C4390D9CD7E2725506FA491E11AA3F73A74894BF1E89BC91C02F21E16C26FA1656D9E782112431170F90EF8E0AA1E4AA0688DC7044500552D9DA0D28EC31AB8078193201D3A2340E4F6E31D5E8EC8E1706338C206D2BF37D9DE9A6FB062F72A7C1CB5249397B92129B1BBC1E3140EC798ACE2E7EB1061B21868DC9DB5067F69B18FE0CE5A534D4EC80C6D437D8C80EAB671DAEF2CA75266C9311CBD05A307ACD8215662B0390B3FA302B15BE6669565C63A199DA68E20E18F17E8D55D6B8A37D77A486FF9B2D0E739BA3FFBE0C2B1785DFA8BC0FCB67D349161A9F374C279A18FAE967B0D9A060CDC4D4E72DD6320BA89F7FBF6C1F59EE6718132752049897D4963391108335149ED2A929A51F118EC8252060051247DDDCF5A56E9ADB5F73071593F217BC7C7CC5DD54F44F7E56581BCA1483C23A90EDA71CED235DAF9FD860E9070949C5CA03AD24D70178002BBE7ECC432FF603BD31A81F5D38265984A2CD1C85B10059A01AC3508F55C549B05055AB3912EB4966B1D8F6B668AAFDE29FB4D87BC6A9CCED3FD3DE164D799EDC1319713A11785232E2255910D493285A4682576ABB81254FA3E10D444F3B7237B2977DE263C7672D2D7892F128731C59E369D6A3E501DE2C50DE648E91876FB31879933946159CCDED6DD96A8EC4455FB360DC83367A2E8DB3E0755CDA346AA537A2959877B381F592EE2DD44031E987EE46335511CC1CAB97ADFBD471D5E7696E3D65EB28796F44F2F8F7A981858F736EB517C0FAE1BB11C2D24DCF42687DF77A9CD1381F85B19B30EE460ABB8ADF5E5F890561D17D75D5A3B071B92C12DB3E4ACB1B9196CCC73BB0B0A8DCD606B2A21EF652DF60AB505716A56A3547CA63595998BCA985D05691AA9CCC56CD6D6CE8221695B7A18BD61654A5C1A61C41698B39421149CA62146D87B0C4CB505101286B1CD5E2AB528BD22708B14B397BF92942F8E430CDDDFFCDB57DA4EF01599724D7257C426EFA2D601B11E81F271D8E977F78730FD1F5561D3E83003DC08864690AF6D9C9E999500EE8E594E6994491EB293E9FC8F579F8D3DA43A6054AF6B43197A26D943517259D4ED13757330591824016810B9F67F6BFD351E7D6E25FF7E5C0232B3536CFAD13EB3FBD733CBB2C418E7F4F649B0C15FFDE852439FA5D459249AE812A1A5EA04886695DBCE66D484366006513044F003B8F007FE383E76FDB6EBA5C00C6542AAA91BDC482AB1CD36B295C75985E486205985E608A2A2FBDF0B87C4E77F7F99CA386695B4AE56DA818B1524997A31B4C4D8979682B345E9E7B646DBD8BFBD5B2B750FEC3F4D6CB87F5BAF24643F46F2F4B6F4488F82215A66C9C8DEAC5C372658BD1127A392CAEC80B7CAD1C3E980523D66DE805C6D566E88524D55FE8F76E22D458E8471A5347A117105F2BE1E076A8500B61346577A99B7AD448A8B2873A552F90D27EBA1557E8943458134E66A275AD0E550FDE54958316275677F045166087EA087D6A5FECAF74C10B4C01ED54AB20CB116B5D4F40C8E2E952E0A0D3396BBEFE0F7EC8BA901C79A2575579A04B1D0075C2568F3CF3EEC9E0FB4EFB7E6B75030652EE87E4833D2AFAD69CB05F75AFCEF8975303C5535425F2D7E4F167A104D4A65D85F4AC33235493EFAC4BF2AFCBF157C1DFE8123E351500B6B5F9FFAA196A52CDEBEA0334960750CD559B10AB9E4E5F40403B41337276B16B6A0BA870D529DAFB283B209E2B9FED210B9742C329F2D72407CB218B0AB420546958CBA9B1FD973740D50096C9AAB8CBBA05710CCF84350FB41CDE381AA4344033B135B7A52E7B62E0E5D6B068CBBCFFAE8C3AF4B25BA4F4CB7173F49A65FEE73C7AD347685D4124FF8F5E001DEE822DFB2C8287B0B8EA058A8A2E62340624C0A5B7EF0526E80138843E766014A5654A7F035E9C7A3157D05D04D731D9C4842E19FA2B8F536C89BD50377F5AB780A7797A9D465A44432C8192891257D475F03E469E5BD2FD51F687E920124324F74627674912AFF47A5B225D4971C33AA07CFB4AFBE916FA1B8F8245D7C11224FEC8F6B451A5F409AE81B3BDC9C31FF520CD07C16FFBF4128135067E946354E3E9AF94875DFFF9A7FF0343A4245240720000, N'6.4.4')
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([ID], [ParentID], [Name], [IsActive], [CreateDate], [CreateUserID], [UpdateDate], [UpdateUserID]) VALUES (1011, 0, N'Pencil', 1, CAST(N'2021-01-04T21:23:58.340' AS DateTime), 4, NULL, NULL)
INSERT [dbo].[Categories] ([ID], [ParentID], [Name], [IsActive], [CreateDate], [CreateUserID], [UpdateDate], [UpdateUserID]) VALUES (1012, 0, N'Toy Car', 1, CAST(N'2021-01-04T21:24:29.910' AS DateTime), 4, NULL, NULL)
INSERT [dbo].[Categories] ([ID], [ParentID], [Name], [IsActive], [CreateDate], [CreateUserID], [UpdateDate], [UpdateUserID]) VALUES (1013, 0, N'Watch', 1, CAST(N'2021-01-04T21:24:46.960' AS DateTime), 4, NULL, NULL)
INSERT [dbo].[Categories] ([ID], [ParentID], [Name], [IsActive], [CreateDate], [CreateUserID], [UpdateDate], [UpdateUserID]) VALUES (1014, 0, N'Perfume', 1, CAST(N'2021-01-04T21:26:05.677' AS DateTime), 4, NULL, NULL)
INSERT [dbo].[Categories] ([ID], [ParentID], [Name], [IsActive], [CreateDate], [CreateUserID], [UpdateDate], [UpdateUserID]) VALUES (1018, 0, N'headset', 1, CAST(N'2021-01-05T21:05:12.533' AS DateTime), 4, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderProducts] ON 

INSERT [dbo].[OrderProducts] ([ID], [OrderId], [ProductId], [Quantity], [CreateDate], [CreateUserID], [UpdateDate], [UpdateUserID]) VALUES (1012, 1010, 14, 1, CAST(N'2021-01-05T01:22:20.093' AS DateTime), 8, NULL, NULL)
INSERT [dbo].[OrderProducts] ([ID], [OrderId], [ProductId], [Quantity], [CreateDate], [CreateUserID], [UpdateDate], [UpdateUserID]) VALUES (1013, 1010, 15, 1, CAST(N'2021-01-05T01:22:20.113' AS DateTime), 8, NULL, NULL)
INSERT [dbo].[OrderProducts] ([ID], [OrderId], [ProductId], [Quantity], [CreateDate], [CreateUserID], [UpdateDate], [UpdateUserID]) VALUES (1014, 1010, 16, 1, CAST(N'2021-01-05T01:22:20.140' AS DateTime), 8, NULL, NULL)
INSERT [dbo].[OrderProducts] ([ID], [OrderId], [ProductId], [Quantity], [CreateDate], [CreateUserID], [UpdateDate], [UpdateUserID]) VALUES (1015, 1010, 17, 1, CAST(N'2021-01-05T01:22:20.160' AS DateTime), 8, NULL, NULL)
INSERT [dbo].[OrderProducts] ([ID], [OrderId], [ProductId], [Quantity], [CreateDate], [CreateUserID], [UpdateDate], [UpdateUserID]) VALUES (1016, 1011, 14, 2, CAST(N'2021-01-05T21:15:34.717' AS DateTime), 8, NULL, NULL)
INSERT [dbo].[OrderProducts] ([ID], [OrderId], [ProductId], [Quantity], [CreateDate], [CreateUserID], [UpdateDate], [UpdateUserID]) VALUES (1017, 1012, 14, 1, CAST(N'2021-01-05T21:17:25.523' AS DateTime), 8, NULL, NULL)
INSERT [dbo].[OrderProducts] ([ID], [OrderId], [ProductId], [Quantity], [CreateDate], [CreateUserID], [UpdateDate], [UpdateUserID]) VALUES (1018, 1013, 15, 1, CAST(N'2021-01-05T21:20:54.980' AS DateTime), 8, NULL, NULL)
INSERT [dbo].[OrderProducts] ([ID], [OrderId], [ProductId], [Quantity], [CreateDate], [CreateUserID], [UpdateDate], [UpdateUserID]) VALUES (1019, 1013, 17, 1, CAST(N'2021-01-05T21:20:55.003' AS DateTime), 8, NULL, NULL)
INSERT [dbo].[OrderProducts] ([ID], [OrderId], [ProductId], [Quantity], [CreateDate], [CreateUserID], [UpdateDate], [UpdateUserID]) VALUES (1020, 1013, 20, 1, CAST(N'2021-01-05T21:20:55.023' AS DateTime), 8, NULL, NULL)
SET IDENTITY_INSERT [dbo].[OrderProducts] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([ID], [UserId], [TotalPrice], [CreateDate], [CreateUserID], [UpdateDate], [UpdateUserID]) VALUES (1010, 8, CAST(14600.00 AS Decimal(18, 2)), CAST(N'2021-01-05T01:22:20.067' AS DateTime), 8, NULL, NULL)
INSERT [dbo].[Orders] ([ID], [UserId], [TotalPrice], [CreateDate], [CreateUserID], [UpdateDate], [UpdateUserID]) VALUES (1011, 8, CAST(60.00 AS Decimal(18, 2)), CAST(N'2021-01-05T21:15:34.697' AS DateTime), 8, NULL, NULL)
INSERT [dbo].[Orders] ([ID], [UserId], [TotalPrice], [CreateDate], [CreateUserID], [UpdateDate], [UpdateUserID]) VALUES (1012, 8, CAST(30.00 AS Decimal(18, 2)), CAST(N'2021-01-05T21:17:25.497' AS DateTime), 8, NULL, NULL)
INSERT [dbo].[Orders] ([ID], [UserId], [TotalPrice], [CreateDate], [CreateUserID], [UpdateDate], [UpdateUserID]) VALUES (1013, 8, CAST(14775.00 AS Decimal(18, 2)), CAST(N'2021-01-05T21:20:54.957' AS DateTime), 8, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ID], [Name], [CategoryId], [Brand], [Model], [ImageUrl], [Description], [Price], [CreateDate], [CreateUserID], [UpdateDate], [UpdateUserID]) VALUES (14, N'Rotring Pencil', 1011, N'Rotring', N'Tikky', N'/Content/images/kalem.png', N'Useful, Comfortable and Sturdy Mechanical Pencil', CAST(30.00 AS Decimal(18, 2)), CAST(N'2021-01-04T21:29:23.560' AS DateTime), 4, NULL, NULL)
INSERT [dbo].[Products] ([ID], [Name], [CategoryId], [Brand], [Model], [ImageUrl], [Description], [Price], [CreateDate], [CreateUserID], [UpdateDate], [UpdateUserID]) VALUES (15, N'Black Car', 1012, N'BMW', N'X1', N'/Content/images/10417707089970.jpg', N'3-8 Years Old Use Smart Steering Feature Led Lighted Headlights And Illuminated Wheels', CAST(12000.00 AS Decimal(18, 2)), CAST(N'2021-01-04T21:33:46.487' AS DateTime), 4, NULL, NULL)
INSERT [dbo].[Products] ([ID], [Name], [CategoryId], [Brand], [Model], [ImageUrl], [Description], [Price], [CreateDate], [CreateUserID], [UpdateDate], [UpdateUserID]) VALUES (16, N'Perfume', 1014, N'AVON', N'Wish of Love Women', N'/Content/images/parfum.jpg', N'Cranberry, cherry blossom and rose petals', CAST(70.00 AS Decimal(18, 2)), CAST(N'2021-01-04T21:35:53.523' AS DateTime), 4, NULL, NULL)
INSERT [dbo].[Products] ([ID], [Name], [CategoryId], [Brand], [Model], [ImageUrl], [Description], [Price], [CreateDate], [CreateUserID], [UpdateDate], [UpdateUserID]) VALUES (17, N'Unisex Wristwatch', 1013, N'EMPERIO ARMANI', N' SGK1110-KS', N'/Content/images/saat.jpg', N'Band Color: Metallic Gray Cord Type: Wire Mesh', CAST(2500.00 AS Decimal(18, 2)), CAST(N'2021-01-04T21:39:27.597' AS DateTime), 4, NULL, NULL)
INSERT [dbo].[Products] ([ID], [Name], [CategoryId], [Brand], [Model], [ImageUrl], [Description], [Price], [CreateDate], [CreateUserID], [UpdateDate], [UpdateUserID]) VALUES (20, N'headset', 1018, N'JBL', N'Tune 500', N'/Content/images/6925281939921_2_org_zoom.jpg', N'wired headset', CAST(275.00 AS Decimal(18, 2)), CAST(N'2021-01-05T21:05:46.367' AS DateTime), 4, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([ID], [Name], [LastName], [Email], [Telephone], [Password], [TCKN], [Adress], [IsActive], [IsAdmin], [CreateDate], [CreateUserID], [UpdateDate], [UpdateUserID]) VALUES (4, N'Dursuncan', N'Aydemir', N'dursuncan.aydemir28@gmail.com', N'05395890302', N'124124', N'11131313162', N'adress', 1, 1, CAST(N'2020-12-12T00:00:00.000' AS DateTime), 0, NULL, NULL)
INSERT [dbo].[Users] ([ID], [Name], [LastName], [Email], [Telephone], [Password], [TCKN], [Adress], [IsActive], [IsAdmin], [CreateDate], [CreateUserID], [UpdateDate], [UpdateUserID]) VALUES (8, N'Emre', N'Cinoğlu', N'emre1841@gmail.com', N'05895623536', N'124124', N'11102305689', N'adress', 1, 0, CAST(N'2021-12-12T00:00:00.000' AS DateTime), 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Baskets]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Baskets_dbo.Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ID])
GO
ALTER TABLE [dbo].[Baskets] CHECK CONSTRAINT [FK_dbo.Baskets_dbo.Products_ProductId]
GO
ALTER TABLE [dbo].[OrderProducts]  WITH CHECK ADD  CONSTRAINT [FK_dbo.OrderProducts_dbo.Orders_OrderId] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([ID])
GO
ALTER TABLE [dbo].[OrderProducts] CHECK CONSTRAINT [FK_dbo.OrderProducts_dbo.Orders_OrderId]
GO
ALTER TABLE [dbo].[OrderProducts]  WITH CHECK ADD  CONSTRAINT [FK_dbo.OrderProducts_dbo.Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ID])
GO
ALTER TABLE [dbo].[OrderProducts] CHECK CONSTRAINT [FK_dbo.OrderProducts_dbo.Products_ProductId]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Orders_dbo.Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_dbo.Orders_dbo.Users_UserId]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Products_dbo.Categories_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([ID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_dbo.Products_dbo.Categories_CategoryId]
GO
