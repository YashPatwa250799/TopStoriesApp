USE [master]
GO
/****** Object:  Database [TopStoriesDb1]    Script Date: 12-06-2025 10:38:20 ******/
CREATE DATABASE [TopStoriesDb1]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TopStoriesDb1', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQL2019\MSSQL\DATA\TopStoriesDb1.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TopStoriesDb1_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQL2019\MSSQL\DATA\TopStoriesDb1_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [TopStoriesDb1] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TopStoriesDb1].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TopStoriesDb1] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TopStoriesDb1] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TopStoriesDb1] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TopStoriesDb1] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TopStoriesDb1] SET ARITHABORT OFF 
GO
ALTER DATABASE [TopStoriesDb1] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TopStoriesDb1] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TopStoriesDb1] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TopStoriesDb1] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TopStoriesDb1] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TopStoriesDb1] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TopStoriesDb1] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TopStoriesDb1] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TopStoriesDb1] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TopStoriesDb1] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TopStoriesDb1] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TopStoriesDb1] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TopStoriesDb1] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TopStoriesDb1] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TopStoriesDb1] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TopStoriesDb1] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TopStoriesDb1] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TopStoriesDb1] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TopStoriesDb1] SET  MULTI_USER 
GO
ALTER DATABASE [TopStoriesDb1] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TopStoriesDb1] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TopStoriesDb1] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TopStoriesDb1] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TopStoriesDb1] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TopStoriesDb1] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [TopStoriesDb1] SET QUERY_STORE = OFF
GO
USE [TopStoriesDb1]
GO
/****** Object:  Table [dbo].[Articles]    Script Date: 12-06-2025 10:38:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Articles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Section] [nvarchar](100) NULL,
	[Subsection] [nvarchar](100) NULL,
	[Title] [nvarchar](500) NOT NULL,
	[Abstract] [nvarchar](max) NULL,
	[Url] [nvarchar](1000) NULL,
	[Uri] [nvarchar](500) NULL,
	[Byline] [nvarchar](200) NULL,
	[ItemType] [nvarchar](50) NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[CreatedDate] [datetime2](7) NULL,
	[PublishedDate] [datetime2](7) NULL,
	[MaterialTypeFacet] [nvarchar](100) NULL,
	[Kicker] [nvarchar](200) NULL,
	[ShortUrl] [nvarchar](500) NULL,
	[ApiCallTimestamp] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DesFacets]    Script Date: 12-06-2025 10:38:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DesFacets](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ArticleId] [int] NULL,
	[Facet] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GeoFacets]    Script Date: 12-06-2025 10:38:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GeoFacets](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ArticleId] [int] NULL,
	[Facet] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Multimedia]    Script Date: 12-06-2025 10:38:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Multimedia](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ArticleId] [int] NULL,
	[Url] [nvarchar](1000) NULL,
	[Format] [nvarchar](100) NULL,
	[Height] [int] NULL,
	[Width] [int] NULL,
	[Type] [nvarchar](50) NULL,
	[Subtype] [nvarchar](50) NULL,
	[Caption] [nvarchar](max) NULL,
	[Copyright] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrgFacets]    Script Date: 12-06-2025 10:38:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrgFacets](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ArticleId] [int] NULL,
	[Facet] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PerFacets]    Script Date: 12-06-2025 10:38:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PerFacets](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ArticleId] [int] NULL,
	[Facet] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Articles] ON 

INSERT [dbo].[Articles] ([Id], [Section], [Subsection], [Title], [Abstract], [Url], [Uri], [Byline], [ItemType], [UpdatedDate], [CreatedDate], [PublishedDate], [MaterialTypeFacet], [Kicker], [ShortUrl], [ApiCallTimestamp]) VALUES (1157, N'us', N'politics', N'New China Trade ‘Deal’ Takes U.S. Back to Where It Started', N'If a handshake agreement holds, it will merely undo some of the damage from the trade war that President Trump started.', N'https://www.nytimes.com/2025/06/11/us/politics/us-china-trade-deal-trump.html', N'nyt://article/c03e39bc-8e54-5428-b83b-0b519914dc66', N'By Ana Swanson', N'Article', CAST(N'2025-06-12T06:42:32.0000000' AS DateTime2), CAST(N'2025-06-12T04:10:10.0000000' AS DateTime2), CAST(N'2025-06-12T04:10:10.0000000' AS DateTime2), N'', N'News Analysis', N'', CAST(N'2025-06-12T10:05:54.0766667' AS DateTime2))
INSERT [dbo].[Articles] ([Id], [Section], [Subsection], [Title], [Abstract], [Url], [Uri], [Byline], [ItemType], [UpdatedDate], [CreatedDate], [PublishedDate], [MaterialTypeFacet], [Kicker], [ShortUrl], [ApiCallTimestamp]) VALUES (1158, N'business', N'', N'How Washington Has Tried to Control China’s Tech', N'Under three presidential administrations, officials in Washington have used export controls to hold back China’s access to advanced technology.', N'https://www.nytimes.com/2025/06/12/business/washington-china-export-controls-tech-huawei.html', N'nyt://article/8518619d-b895-56fc-9046-2850fff98bb2', N'By Meaghan Tobin', N'Article', CAST(N'2025-06-12T09:30:05.0000000' AS DateTime2), CAST(N'2025-06-12T09:30:05.0000000' AS DateTime2), CAST(N'2025-06-12T09:30:05.0000000' AS DateTime2), N'', N'', N'', CAST(N'2025-06-12T10:05:54.0900000' AS DateTime2))
INSERT [dbo].[Articles] ([Id], [Section], [Subsection], [Title], [Abstract], [Url], [Uri], [Byline], [ItemType], [UpdatedDate], [CreatedDate], [PublishedDate], [MaterialTypeFacet], [Kicker], [ShortUrl], [ApiCallTimestamp]) VALUES (1159, N'us', N'politics', N'Senate Republicans Want to Trim Some of Trump’s Populist Tax Cuts', N'G.O.P. senators are considering whether to further curb the president’s favorite tax cuts as they rewrite key portions of the sprawling domestic agenda bill passed by the House.', N'https://www.nytimes.com/2025/06/11/us/politics/republicans-trump-populist-tax-cuts.html', N'nyt://article/87b555d4-3ef1-55a1-bedc-761f5d9c15ac', N'By Andrew Duehren', N'Article', CAST(N'2025-06-12T09:55:23.0000000' AS DateTime2), CAST(N'2025-06-11T23:40:14.0000000' AS DateTime2), CAST(N'2025-06-11T23:40:14.0000000' AS DateTime2), N'', N'', N'', CAST(N'2025-06-12T10:05:54.1066667' AS DateTime2))
INSERT [dbo].[Articles] ([Id], [Section], [Subsection], [Title], [Abstract], [Url], [Uri], [Byline], [ItemType], [UpdatedDate], [CreatedDate], [PublishedDate], [MaterialTypeFacet], [Kicker], [ShortUrl], [ApiCallTimestamp]) VALUES (1160, N'business', N'', N'The House’s Policy Bill Would Lose Money. Could Trump’s Tariffs Replace It?', N'The short answer is probably not, according to multiple forecasters.', N'https://www.nytimes.com/2025/06/11/business/trump-tariffs-tax-bill.html', N'nyt://article/3922fe02-2e8b-5242-9de3-5501dc2bc7ae', N'By Lydia DePillis and Christine Zhang', N'Article', CAST(N'2025-06-12T09:56:40.0000000' AS DateTime2), CAST(N'2025-06-11T23:50:54.0000000' AS DateTime2), CAST(N'2025-06-11T23:50:54.0000000' AS DateTime2), N'', N'', N'', CAST(N'2025-06-12T10:05:54.1166667' AS DateTime2))
INSERT [dbo].[Articles] ([Id], [Section], [Subsection], [Title], [Abstract], [Url], [Uri], [Byline], [ItemType], [UpdatedDate], [CreatedDate], [PublishedDate], [MaterialTypeFacet], [Kicker], [ShortUrl], [ApiCallTimestamp]) VALUES (1161, N'us', N'politics', N'Israel Appears Ready to Attack Iran, Officials in U.S. and Europe Say', N'Concern about a strike and the prospect of retaliation led the United States to withdraw diplomats from Iraq and authorize the voluntary departure of U.S. military family members from the Middle East.', N'https://www.nytimes.com/2025/06/11/us/politics/iran-us-iraq-diplomats-middle-east.html', N'nyt://article/cd82dfd0-5b9a-5940-ac1b-69a75a27176d', N'By Michael Crowley, David E. Sanger, Farnaz Fassihi and Eric Schmitt', N'Article', CAST(N'2025-06-12T09:18:10.0000000' AS DateTime2), CAST(N'2025-06-12T02:08:31.0000000' AS DateTime2), CAST(N'2025-06-12T02:08:31.0000000' AS DateTime2), N'', N'', N'', CAST(N'2025-06-12T10:05:54.1233333' AS DateTime2))
INSERT [dbo].[Articles] ([Id], [Section], [Subsection], [Title], [Abstract], [Url], [Uri], [Byline], [ItemType], [UpdatedDate], [CreatedDate], [PublishedDate], [MaterialTypeFacet], [Kicker], [ShortUrl], [ApiCallTimestamp]) VALUES (1162, N'world', N'middleeast', N'Netanyahu Survives a Vote to Dissolve Parliament but Emerges Weakened', N'Some of the Israeli prime minister’s coalition partners backed an opposition motion over rules that exempt most religious students from serving in the military.', N'https://www.nytimes.com/2025/06/11/world/middleeast/israel-knesset-vote-orthodox-draft-law.html', N'nyt://article/d5e5fbd7-ee37-5983-a814-abe1c40c5067', N'By Isabel Kershner', N'Article', CAST(N'2025-06-12T07:52:12.0000000' AS DateTime2), CAST(N'2025-06-11T16:52:44.0000000' AS DateTime2), CAST(N'2025-06-11T16:52:44.0000000' AS DateTime2), N'', N'', N'', CAST(N'2025-06-12T10:05:54.1366667' AS DateTime2))
INSERT [dbo].[Articles] ([Id], [Section], [Subsection], [Title], [Abstract], [Url], [Uri], [Byline], [ItemType], [UpdatedDate], [CreatedDate], [PublishedDate], [MaterialTypeFacet], [Kicker], [ShortUrl], [ApiCallTimestamp]) VALUES (1163, N'world', N'middleeast', N'Gaza Aid Group Says Hamas Attacked Its Palestinian Workers', N'The group, which has been harshly criticized by the U.N. and other aid providers, said at least five people had died in an attack on one of its buses.', N'https://www.nytimes.com/2025/06/11/world/middleeast/gaza-aid-hamas-attack.html', N'nyt://article/78bc320d-ce83-5bfd-9e27-9bdab824a115', N'By Ephrat Livni', N'Article', CAST(N'2025-06-12T08:56:48.0000000' AS DateTime2), CAST(N'2025-06-12T07:19:00.0000000' AS DateTime2), CAST(N'2025-06-12T07:19:00.0000000' AS DateTime2), N'', N'', N'', CAST(N'2025-06-12T10:05:54.1433333' AS DateTime2))
INSERT [dbo].[Articles] ([Id], [Section], [Subsection], [Title], [Abstract], [Url], [Uri], [Byline], [ItemType], [UpdatedDate], [CreatedDate], [PublishedDate], [MaterialTypeFacet], [Kicker], [ShortUrl], [ApiCallTimestamp]) VALUES (1164, N'us', N'politics', N'Suggesting More Troops in More Cities, Trump Bends Military’s Role', N'President Trump has expanded domestic use of the armed forces, testing the limits on involving troops at protests and the border.', N'https://www.nytimes.com/2025/06/11/us/politics/trump-domestic-military-expansion.html', N'nyt://article/6c11cebb-9cad-5357-b760-9733903335f7', N'By Luke Broadwater', N'Article', CAST(N'2025-06-12T05:28:45.0000000' AS DateTime2), CAST(N'2025-06-12T04:06:15.0000000' AS DateTime2), CAST(N'2025-06-12T04:06:15.0000000' AS DateTime2), N'', N'News Analysis', N'', CAST(N'2025-06-12T10:05:54.1566667' AS DateTime2))
INSERT [dbo].[Articles] ([Id], [Section], [Subsection], [Title], [Abstract], [Url], [Uri], [Byline], [ItemType], [UpdatedDate], [CreatedDate], [PublishedDate], [MaterialTypeFacet], [Kicker], [ShortUrl], [ApiCallTimestamp]) VALUES (1165, N'us', N'', N'Where People Are Protesting Against Immigration Raids', N'Demonstrations are not only in Los Angeles. They have cropped up in cities across the country.', N'https://www.nytimes.com/2025/06/11/us/us-protest-tracker-trump-ice.html', N'nyt://article/5a588e29-a325-5b61-a009-b7badcbc2454', N'By Leo Dominguez', N'Article', CAST(N'2025-06-12T07:58:38.0000000' AS DateTime2), CAST(N'2025-06-12T06:03:21.0000000' AS DateTime2), CAST(N'2025-06-12T06:03:21.0000000' AS DateTime2), N'', N'', N'', CAST(N'2025-06-12T10:05:54.1700000' AS DateTime2))
INSERT [dbo].[Articles] ([Id], [Section], [Subsection], [Title], [Abstract], [Url], [Uri], [Byline], [ItemType], [UpdatedDate], [CreatedDate], [PublishedDate], [MaterialTypeFacet], [Kicker], [ShortUrl], [ApiCallTimestamp]) VALUES (1166, N'nyregion', N'', N'Judge Opens Door to Releasing Mahmoud Khalil as Soon as This Week', N'Mr. Khalil, a legal permanent resident, has been held in Louisiana for more than three months. The judge suggested he could be released as early as Friday unless the government successfully appeals.', N'https://www.nytimes.com/2025/06/11/nyregion/mahmoud-khalil-release-order.html', N'nyt://article/ce60bcf8-9d24-50d7-b7dc-2227bef7996c', N'By Jonah E. Bromwich', N'Article', CAST(N'2025-06-12T05:42:22.0000000' AS DateTime2), CAST(N'2025-06-12T02:46:54.0000000' AS DateTime2), CAST(N'2025-06-12T02:46:54.0000000' AS DateTime2), N'', N'', N'', CAST(N'2025-06-12T10:05:54.1766667' AS DateTime2))
INSERT [dbo].[Articles] ([Id], [Section], [Subsection], [Title], [Abstract], [Url], [Uri], [Byline], [ItemType], [UpdatedDate], [CreatedDate], [PublishedDate], [MaterialTypeFacet], [Kicker], [ShortUrl], [ApiCallTimestamp]) VALUES (1167, N'us', N'politics', N'Kennedy Announces Eight New Members of C.D.C. Vaccine Advisory Panel', N'The health secretary promised not to pick “anti-vaxxers.” But some public health leaders accused him of breaking his word.', N'https://www.nytimes.com/2025/06/11/us/politics/rfk-jr-cdc-vaccine-panel.html', N'nyt://article/d817d4f5-8b8d-5915-8d1c-15f756d3097a', N'By Sheryl Gay Stolberg', N'Article', CAST(N'2025-06-12T09:04:53.0000000' AS DateTime2), CAST(N'2025-06-12T03:11:03.0000000' AS DateTime2), CAST(N'2025-06-12T03:11:03.0000000' AS DateTime2), N'', N'', N'', CAST(N'2025-06-12T10:05:54.1866667' AS DateTime2))
INSERT [dbo].[Articles] ([Id], [Section], [Subsection], [Title], [Abstract], [Url], [Uri], [Byline], [ItemType], [UpdatedDate], [CreatedDate], [PublishedDate], [MaterialTypeFacet], [Kicker], [ShortUrl], [ApiCallTimestamp]) VALUES (1168, N'us', N'politics', N'No, Not That Lee. Pentagon Finds Black Hero to Rechristen Base Long Named for Robert E.', N'The Army unveiled a list of seven installations that the Trump administration is reverting, sort of, to earlier names venerating Confederate heroes.', N'https://www.nytimes.com/2025/06/11/us/politics/army-bases-trump-confederate.html', N'nyt://article/28beb68d-553a-5519-891b-ff6c34832bf0', N'By Carol Rosenberg', N'Article', CAST(N'2025-06-12T04:10:30.0000000' AS DateTime2), CAST(N'2025-06-12T02:45:00.0000000' AS DateTime2), CAST(N'2025-06-12T02:45:00.0000000' AS DateTime2), N'', N'', N'', CAST(N'2025-06-12T10:05:54.1966667' AS DateTime2))
INSERT [dbo].[Articles] ([Id], [Section], [Subsection], [Title], [Abstract], [Url], [Uri], [Byline], [ItemType], [UpdatedDate], [CreatedDate], [PublishedDate], [MaterialTypeFacet], [Kicker], [ShortUrl], [ApiCallTimestamp]) VALUES (1169, N'us', N'politics', N'McConnell Tells Hegseth America’s Reputation Is at Stake in Ukraine War', N'A testy exchange between a senator who strongly supports Ukraine aid and the defense secretary revealed a deepening split among G.O.P. officials on the war.', N'https://www.nytimes.com/2025/06/11/us/politics/hegseth-congress-defense.html', N'nyt://article/6040a3b3-0ecf-5766-aeda-33f65dd98842', N'By Eric Schmitt', N'Article', CAST(N'2025-06-12T03:24:35.0000000' AS DateTime2), CAST(N'2025-06-12T02:24:20.0000000' AS DateTime2), CAST(N'2025-06-12T02:24:20.0000000' AS DateTime2), N'', N'', N'', CAST(N'2025-06-12T10:05:54.2100000' AS DateTime2))
INSERT [dbo].[Articles] ([Id], [Section], [Subsection], [Title], [Abstract], [Url], [Uri], [Byline], [ItemType], [UpdatedDate], [CreatedDate], [PublishedDate], [MaterialTypeFacet], [Kicker], [ShortUrl], [ApiCallTimestamp]) VALUES (1170, N'arts', N'music', N'Brian Wilson, Pop Auteur and Leader of the Beach Boys, Dies at 82', N'A hitmaker elevated and burdened by the label of genius, he transcended the breezy surf genre to create complex harmonies and intricate soundscapes in the studio.', N'https://www.nytimes.com/2025/06/11/arts/music/brian-wilson-dead.html', N'nyt://article/952439e4-4802-56f1-bf4b-2b9dd074a177', N'By Ben Sisario', N'Article', CAST(N'2025-06-12T09:57:33.0000000' AS DateTime2), CAST(N'2025-06-11T22:31:12.0000000' AS DateTime2), CAST(N'2025-06-11T22:31:12.0000000' AS DateTime2), N'', N'', N'', CAST(N'2025-06-12T10:05:54.2200000' AS DateTime2))
INSERT [dbo].[Articles] ([Id], [Section], [Subsection], [Title], [Abstract], [Url], [Uri], [Byline], [ItemType], [UpdatedDate], [CreatedDate], [PublishedDate], [MaterialTypeFacet], [Kicker], [ShortUrl], [ApiCallTimestamp]) VALUES (1171, N'arts', N'music', N'Brian Wilson: 12 Essential Songs', N'The Beach Boys leader, whose death was announced on Wednesday, was a brilliant writer, arranger and producer whose ambitions propelled his band — and contemporaries like the Beatles — into the future.', N'https://www.nytimes.com/2025/06/11/arts/music/brian-wilson-beach-boys-songs.html', N'nyt://article/09e16f09-5ec9-5eef-9171-a57e53e3e442', N'By Gavin Edwards', N'Article', CAST(N'2025-06-12T07:06:29.0000000' AS DateTime2), CAST(N'2025-06-11T22:56:43.0000000' AS DateTime2), CAST(N'2025-06-11T22:56:43.0000000' AS DateTime2), N'', N'', N'', CAST(N'2025-06-12T10:05:54.2333333' AS DateTime2))
INSERT [dbo].[Articles] ([Id], [Section], [Subsection], [Title], [Abstract], [Url], [Uri], [Byline], [ItemType], [UpdatedDate], [CreatedDate], [PublishedDate], [MaterialTypeFacet], [Kicker], [ShortUrl], [ApiCallTimestamp]) VALUES (1172, N'nyregion', N'', N'Jury in Weinstein Trial Was Ordered to Cool Down Amid Shouting and Threats', N'Harvey Weinstein said infighting in the jury was denying him a fair trial.', N'https://www.nytimes.com/2025/06/11/nyregion/harvey-weinstein-jury.html', N'nyt://article/560f7942-3427-5304-8f53-e906c81921ae', N'By Hurubie Meko, Maria Cramer and Anusha Bayya', N'Article', CAST(N'2025-06-12T06:23:35.0000000' AS DateTime2), CAST(N'2025-06-12T00:18:01.0000000' AS DateTime2), CAST(N'2025-06-12T00:18:01.0000000' AS DateTime2), N'', N'', N'', CAST(N'2025-06-12T10:05:54.2400000' AS DateTime2))
INSERT [dbo].[Articles] ([Id], [Section], [Subsection], [Title], [Abstract], [Url], [Uri], [Byline], [ItemType], [UpdatedDate], [CreatedDate], [PublishedDate], [MaterialTypeFacet], [Kicker], [ShortUrl], [ApiCallTimestamp]) VALUES (1173, N'us', N'politics', N'David Hogg to Exit D.N.C. After Backlash to His Primary Plan', N'Mr. Hogg said he would not run again for vice chair after the party voted for a new election. Democrats have been furious at his plan to challenge the party’s sitting lawmakers in primary races.', N'https://www.nytimes.com/2025/06/11/us/politics/david-hogg-dnc-democrats.html', N'nyt://article/0224be60-aa1e-5499-b6c5-fe79ed6fb78e', N'By Shane Goldmacher', N'Article', CAST(N'2025-06-12T05:35:38.0000000' AS DateTime2), CAST(N'2025-06-12T04:42:30.0000000' AS DateTime2), CAST(N'2025-06-12T04:42:30.0000000' AS DateTime2), N'', N'', N'', CAST(N'2025-06-12T10:05:54.2466667' AS DateTime2))
INSERT [dbo].[Articles] ([Id], [Section], [Subsection], [Title], [Abstract], [Url], [Uri], [Byline], [ItemType], [UpdatedDate], [CreatedDate], [PublishedDate], [MaterialTypeFacet], [Kicker], [ShortUrl], [ApiCallTimestamp]) VALUES (1174, N'us', N'', N'What Happens if ‘Harvard Is Not Harvard’?', N'If President Trump makes good on all his threats, Harvard may lose much of its influence and prestige. It could also become even harder to afford.', N'https://www.nytimes.com/2025/06/11/us/harvard-funding-trump-administration.html', N'nyt://article/5831e903-d496-595f-8215-b6734f1a8477', N'By Sarah Mervosh and Michael S. Schmidt', N'Article', CAST(N'2025-06-11T22:05:51.0000000' AS DateTime2), CAST(N'2025-06-11T20:36:16.0000000' AS DateTime2), CAST(N'2025-06-11T20:36:16.0000000' AS DateTime2), N'', N'', N'', CAST(N'2025-06-12T10:05:54.2600000' AS DateTime2))
INSERT [dbo].[Articles] ([Id], [Section], [Subsection], [Title], [Abstract], [Url], [Uri], [Byline], [ItemType], [UpdatedDate], [CreatedDate], [PublishedDate], [MaterialTypeFacet], [Kicker], [ShortUrl], [ApiCallTimestamp]) VALUES (1175, N'sports', N'baseball', N'Betsy Jochum, 104, Dies; Last Original Member of Women’s Baseball League', N'Playing in the All-American Girls Professional Baseball League, which inspired the film “A League of Their Own,” she won a batting title and stole 127 bases in 1944.', N'https://www.nytimes.com/2025/06/11/sports/baseball/betsy-jochum-dead.html', N'nyt://article/094fb18b-4c1c-528a-9fc1-10050ee883f0', N'By Richard Sandomir', N'Article', CAST(N'2025-06-12T03:54:15.0000000' AS DateTime2), CAST(N'2025-06-12T03:54:15.0000000' AS DateTime2), CAST(N'2025-06-12T03:54:15.0000000' AS DateTime2), N'', N'', N'', CAST(N'2025-06-12T10:05:54.2700000' AS DateTime2))
INSERT [dbo].[Articles] ([Id], [Section], [Subsection], [Title], [Abstract], [Url], [Uri], [Byline], [ItemType], [UpdatedDate], [CreatedDate], [PublishedDate], [MaterialTypeFacet], [Kicker], [ShortUrl], [ApiCallTimestamp]) VALUES (1176, N'opinion', N'', N'Ehud Olmert on Israel’s Catastrophic War in Gaza', N'The former prime minister of Israel discusses why he believes Israel’s war in Gaza can no longer be justified.', N'https://www.nytimes.com/2025/06/11/opinion/ezra-klein-podcast-ehud-olmert.html', N'nyt://article/fdb1f127-e8ce-5e87-a602-34296a6ef583', N'By Ezra Klein', N'Article', CAST(N'2025-06-12T04:41:41.0000000' AS DateTime2), CAST(N'2025-06-11T14:34:01.0000000' AS DateTime2), CAST(N'2025-06-11T14:34:01.0000000' AS DateTime2), N'', N'The Ezra Klein Show', N'', CAST(N'2025-06-12T10:05:54.2800000' AS DateTime2))
INSERT [dbo].[Articles] ([Id], [Section], [Subsection], [Title], [Abstract], [Url], [Uri], [Byline], [ItemType], [UpdatedDate], [CreatedDate], [PublishedDate], [MaterialTypeFacet], [Kicker], [ShortUrl], [ApiCallTimestamp]) VALUES (1177, N'opinion', N'', N'Trump Crossed the Line at Fort Bragg', N'Donald Trump’s Fort Bragg speech was the latest in a string of high-profile efforts to reshape the military more in his own likeness.', N'https://www.nytimes.com/2025/06/11/opinion/trump-wants-the-military-to-be-more-like-trump.html', N'nyt://article/c91cb8e0-b9cf-5444-b312-f153fc12ca78', N'By W.J. Hennigan', N'Article', CAST(N'2025-06-12T04:40:33.0000000' AS DateTime2), CAST(N'2025-06-11T20:42:40.0000000' AS DateTime2), CAST(N'2025-06-11T20:42:40.0000000' AS DateTime2), N'', N'W.J. Hennigan', N'', CAST(N'2025-06-12T10:05:54.2900000' AS DateTime2))
INSERT [dbo].[Articles] ([Id], [Section], [Subsection], [Title], [Abstract], [Url], [Uri], [Byline], [ItemType], [UpdatedDate], [CreatedDate], [PublishedDate], [MaterialTypeFacet], [Kicker], [ShortUrl], [ApiCallTimestamp]) VALUES (1178, N'climate', N'', N'World Bank Ends Its Ban on Funding Nuclear Power Projects', N'The decision, a major reversal, could help poorer nations industrialize, cut planet-warming emissions and boost U.S. competitiveness on next-generation reactors.', N'https://www.nytimes.com/2025/06/11/climate/world-bank-nuclear-power-funding-ban.html', N'nyt://article/41123039-7032-5ac0-bbf6-7092fddb76ef', N'By Max Bearak', N'Article', CAST(N'2025-06-12T01:59:51.0000000' AS DateTime2), CAST(N'2025-06-12T01:45:05.0000000' AS DateTime2), CAST(N'2025-06-12T01:45:05.0000000' AS DateTime2), N'', N'', N'', CAST(N'2025-06-12T10:05:54.3000000' AS DateTime2))
INSERT [dbo].[Articles] ([Id], [Section], [Subsection], [Title], [Abstract], [Url], [Uri], [Byline], [ItemType], [UpdatedDate], [CreatedDate], [PublishedDate], [MaterialTypeFacet], [Kicker], [ShortUrl], [ApiCallTimestamp]) VALUES (1179, N'world', N'', N'The Real Fertility Crisis? Financial Security, a U.N. Report Says.', N'Policymakers in many countries assume that birthrates have fallen because people want fewer children, but a global study says financial insecurity is driving those decisions.', N'https://www.nytimes.com/2025/06/11/world/fertility-crisis-un-report.html', N'nyt://article/e71309e2-3792-5386-90db-d952de27ec79', N'By Ephrat Livni', N'Article', CAST(N'2025-06-12T02:32:31.0000000' AS DateTime2), CAST(N'2025-06-12T02:24:54.0000000' AS DateTime2), CAST(N'2025-06-12T02:24:54.0000000' AS DateTime2), N'', N'', N'', CAST(N'2025-06-12T10:05:54.3100000' AS DateTime2))
INSERT [dbo].[Articles] ([Id], [Section], [Subsection], [Title], [Abstract], [Url], [Uri], [Byline], [ItemType], [UpdatedDate], [CreatedDate], [PublishedDate], [MaterialTypeFacet], [Kicker], [ShortUrl], [ApiCallTimestamp]) VALUES (1180, N'world', N'europe', N'Anti-Immigrant Riots Set Northern Irish Town on Edge', N'Homes, businesses and cars have been attacked and 32 police officers injured during violence in Ballymena and several other areas in Northern Ireland.', N'https://www.nytimes.com/2025/06/11/world/europe/ballymena-riot-northern-ireland-disorder.html', N'nyt://article/08453243-129d-5ec0-a7e9-828110f311b5', N'By Lizzie Dearden and Ali Watkins', N'Article', CAST(N'2025-06-12T10:02:01.0000000' AS DateTime2), CAST(N'2025-06-11T17:16:46.0000000' AS DateTime2), CAST(N'2025-06-11T17:16:46.0000000' AS DateTime2), N'', N'', N'', CAST(N'2025-06-12T10:05:54.3366667' AS DateTime2))
INSERT [dbo].[Articles] ([Id], [Section], [Subsection], [Title], [Abstract], [Url], [Uri], [Byline], [ItemType], [UpdatedDate], [CreatedDate], [PublishedDate], [MaterialTypeFacet], [Kicker], [ShortUrl], [ApiCallTimestamp]) VALUES (1181, N'world', N'asia', N'Pentagon Is Reviewing Deal to Equip Australia With Nuclear Submarines', N'The 2021 pact, meant to help counter China’s ambitions in the Asia Pacific, will be examined to ensure that it meets “America First criteria,” a U.S. official said.', N'https://www.nytimes.com/2025/06/11/world/asia/australia-nuclear-submarines-trump.html', N'nyt://article/b76213f5-48f0-54aa-b098-6a07b504c202', N'By Victoria Kim', N'Article', CAST(N'2025-06-12T09:05:45.0000000' AS DateTime2), CAST(N'2025-06-12T07:16:40.0000000' AS DateTime2), CAST(N'2025-06-12T07:16:40.0000000' AS DateTime2), N'', N'', N'', CAST(N'2025-06-12T10:05:54.3466667' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Articles] OFF
GO
SET IDENTITY_INSERT [dbo].[DesFacets] ON 

INSERT [dbo].[DesFacets] ([Id], [ArticleId], [Facet]) VALUES (1, 1157, N'Customs (Tariff)')
INSERT [dbo].[DesFacets] ([Id], [ArticleId], [Facet]) VALUES (2, 1157, N'Rare Earths')
INSERT [dbo].[DesFacets] ([Id], [ArticleId], [Facet]) VALUES (3, 1157, N'International Trade and World Market')
INSERT [dbo].[DesFacets] ([Id], [ArticleId], [Facet]) VALUES (4, 1157, N'United States International Relations')
INSERT [dbo].[DesFacets] ([Id], [ArticleId], [Facet]) VALUES (5, 1158, N'Artificial Intelligence')
INSERT [dbo].[DesFacets] ([Id], [ArticleId], [Facet]) VALUES (6, 1158, N'International Trade and World Market')
INSERT [dbo].[DesFacets] ([Id], [ArticleId], [Facet]) VALUES (7, 1158, N'Embargoes and Sanctions')
INSERT [dbo].[DesFacets] ([Id], [ArticleId], [Facet]) VALUES (8, 1158, N'Regulation and Deregulation of Industry')
INSERT [dbo].[DesFacets] ([Id], [ArticleId], [Facet]) VALUES (9, 1158, N'Computer Chips')
INSERT [dbo].[DesFacets] ([Id], [ArticleId], [Facet]) VALUES (10, 1158, N'Supply Chain')
INSERT [dbo].[DesFacets] ([Id], [ArticleId], [Facet]) VALUES (11, 1159, N'United States Politics and Government')
INSERT [dbo].[DesFacets] ([Id], [ArticleId], [Facet]) VALUES (12, 1159, N'Law and Legislation')
INSERT [dbo].[DesFacets] ([Id], [ArticleId], [Facet]) VALUES (13, 1159, N'Taxation')
INSERT [dbo].[DesFacets] ([Id], [ArticleId], [Facet]) VALUES (14, 1159, N'Overtime')
INSERT [dbo].[DesFacets] ([Id], [ArticleId], [Facet]) VALUES (15, 1159, N'Tax Credits, Deductions and Exemptions')
INSERT [dbo].[DesFacets] ([Id], [ArticleId], [Facet]) VALUES (16, 1159, N'Tax Cuts and Jobs Act (2017)')
INSERT [dbo].[DesFacets] ([Id], [ArticleId], [Facet]) VALUES (17, 1159, N'One Big Beautiful Bill Act (2025)')
INSERT [dbo].[DesFacets] ([Id], [ArticleId], [Facet]) VALUES (18, 1160, N'Customs (Tariff)')
INSERT [dbo].[DesFacets] ([Id], [ArticleId], [Facet]) VALUES (19, 1160, N'Federal Budget (US)')
INSERT [dbo].[DesFacets] ([Id], [ArticleId], [Facet]) VALUES (20, 1160, N'United States Economy')
INSERT [dbo].[DesFacets] ([Id], [ArticleId], [Facet]) VALUES (21, 1160, N'Tax Credits, Deductions and Exemptions')
INSERT [dbo].[DesFacets] ([Id], [ArticleId], [Facet]) VALUES (22, 1160, N'Prices (Fares, Fees and Rates)')
INSERT [dbo].[DesFacets] ([Id], [ArticleId], [Facet]) VALUES (23, 1160, N'One Big Beautiful Bill Act (2025)')
INSERT [dbo].[DesFacets] ([Id], [ArticleId], [Facet]) VALUES (24, 1161, N'United States Politics and Government')
INSERT [dbo].[DesFacets] ([Id], [ArticleId], [Facet]) VALUES (25, 1161, N'Diplomatic Service, Embassies and Consulates')
INSERT [dbo].[DesFacets] ([Id], [ArticleId], [Facet]) VALUES (26, 1161, N'Nuclear Weapons')
INSERT [dbo].[DesFacets] ([Id], [ArticleId], [Facet]) VALUES (27, 1162, N'Israel-Gaza War (2023- )')
INSERT [dbo].[DesFacets] ([Id], [ArticleId], [Facet]) VALUES (28, 1162, N'Orthodox Judaism')
INSERT [dbo].[DesFacets] ([Id], [ArticleId], [Facet]) VALUES (29, 1163, N'Humanitarian Aid')
INSERT [dbo].[DesFacets] ([Id], [ArticleId], [Facet]) VALUES (30, 1163, N'Foreign Aid')
INSERT [dbo].[DesFacets] ([Id], [ArticleId], [Facet]) VALUES (31, 1163, N'Deaths (Fatalities)')
INSERT [dbo].[DesFacets] ([Id], [ArticleId], [Facet]) VALUES (32, 1163, N'Palestinians')
INSERT [dbo].[DesFacets] ([Id], [ArticleId], [Facet]) VALUES (33, 1163, N'Israel-Gaza War (2023- )')
INSERT [dbo].[DesFacets] ([Id], [ArticleId], [Facet]) VALUES (34, 1163, N'International Relations')
INSERT [dbo].[DesFacets] ([Id], [ArticleId], [Facet]) VALUES (35, 1164, N'United States Politics and Government')
INSERT [dbo].[DesFacets] ([Id], [ArticleId], [Facet]) VALUES (36, 1164, N'Demonstrations, Protests and Riots')
INSERT [dbo].[DesFacets] ([Id], [ArticleId], [Facet]) VALUES (37, 1164, N'Illegal Immigration')
INSERT [dbo].[DesFacets] ([Id], [ArticleId], [Facet]) VALUES (38, 1164, N'United States Defense and Military Forces')
INSERT [dbo].[DesFacets] ([Id], [ArticleId], [Facet]) VALUES (39, 1164, N'Deportation')
INSERT [dbo].[DesFacets] ([Id], [ArticleId], [Facet]) VALUES (40, 1164, N'Federal-State Relations (US)')
INSERT [dbo].[DesFacets] ([Id], [ArticleId], [Facet]) VALUES (41, 1164, N'Law and Legislation')
INSERT [dbo].[DesFacets] ([Id], [ArticleId], [Facet]) VALUES (42, 1164, N'Presidential Power (US)')
INSERT [dbo].[DesFacets] ([Id], [ArticleId], [Facet]) VALUES (43, 1164, N'Insurrection Act (1807)')
INSERT [dbo].[DesFacets] ([Id], [ArticleId], [Facet]) VALUES (44, 1165, N'Demonstrations, Protests and Riots')
INSERT [dbo].[DesFacets] ([Id], [ArticleId], [Facet]) VALUES (45, 1165, N'Police')
INSERT [dbo].[DesFacets] ([Id], [ArticleId], [Facet]) VALUES (46, 1166, N'United States Politics and Government')
INSERT [dbo].[DesFacets] ([Id], [ArticleId], [Facet]) VALUES (47, 1166, N'Colleges and Universities')
INSERT [dbo].[DesFacets] ([Id], [ArticleId], [Facet]) VALUES (48, 1167, N'Vaccination and Immunization')
INSERT [dbo].[DesFacets] ([Id], [ArticleId], [Facet]) VALUES (49, 1167, N'United States Politics and Government')
INSERT [dbo].[DesFacets] ([Id], [ArticleId], [Facet]) VALUES (50, 1167, N'Coronavirus (2019-nCoV)')
INSERT [dbo].[DesFacets] ([Id], [ArticleId], [Facet]) VALUES (51, 1167, N'Medicine and Health')
INSERT [dbo].[DesFacets] ([Id], [ArticleId], [Facet]) VALUES (52, 1168, N'United States Defense and Military Forces')
INSERT [dbo].[DesFacets] ([Id], [ArticleId], [Facet]) VALUES (53, 1168, N'Military Bases and Installations')
INSERT [dbo].[DesFacets] ([Id], [ArticleId], [Facet]) VALUES (54, 1168, N'Black People')
INSERT [dbo].[DesFacets] ([Id], [ArticleId], [Facet]) VALUES (55, 1168, N'Medal of Honor (US)')
INSERT [dbo].[DesFacets] ([Id], [ArticleId], [Facet]) VALUES (56, 1169, N'United States Politics and Government')
INSERT [dbo].[DesFacets] ([Id], [ArticleId], [Facet]) VALUES (57, 1169, N'United States Defense and Military Forces')
INSERT [dbo].[DesFacets] ([Id], [ArticleId], [Facet]) VALUES (58, 1169, N'United States International Relations')
INSERT [dbo].[DesFacets] ([Id], [ArticleId], [Facet]) VALUES (59, 1169, N'Russian Invasion of Ukraine (2022)')
INSERT [dbo].[DesFacets] ([Id], [ArticleId], [Facet]) VALUES (60, 1170, N'Pop and Rock Music')
INSERT [dbo].[DesFacets] ([Id], [ArticleId], [Facet]) VALUES (61, 1170, N'Deaths (Obituaries)')
INSERT [dbo].[DesFacets] ([Id], [ArticleId], [Facet]) VALUES (62, 1170, N'Mental Health and Disorders')
INSERT [dbo].[DesFacets] ([Id], [ArticleId], [Facet]) VALUES (63, 1170, N'Copyrights and Copyright Violations')
INSERT [dbo].[DesFacets] ([Id], [ArticleId], [Facet]) VALUES (64, 1171, N'Pop and Rock Music')
INSERT [dbo].[DesFacets] ([Id], [ArticleId], [Facet]) VALUES (65, 1171, N'Content Type: Personal Profile')
INSERT [dbo].[DesFacets] ([Id], [ArticleId], [Facet]) VALUES (66, 1172, N'Jury System')
INSERT [dbo].[DesFacets] ([Id], [ArticleId], [Facet]) VALUES (67, 1172, N'Decisions and Verdicts')
INSERT [dbo].[DesFacets] ([Id], [ArticleId], [Facet]) VALUES (68, 1173, N'Primaries and Caucuses')
INSERT [dbo].[DesFacets] ([Id], [ArticleId], [Facet]) VALUES (69, 1173, N'United States Politics and Government')
INSERT [dbo].[DesFacets] ([Id], [ArticleId], [Facet]) VALUES (70, 1173, N'Appointments and Executive Changes')
INSERT [dbo].[DesFacets] ([Id], [ArticleId], [Facet]) VALUES (71, 1174, N'Foreign Students (in US)')
INSERT [dbo].[DesFacets] ([Id], [ArticleId], [Facet]) VALUES (72, 1174, N'Colleges and Universities')
INSERT [dbo].[DesFacets] ([Id], [ArticleId], [Facet]) VALUES (73, 1174, N'United States Politics and Government')
INSERT [dbo].[DesFacets] ([Id], [ArticleId], [Facet]) VALUES (74, 1174, N'Academic Freedom')
INSERT [dbo].[DesFacets] ([Id], [ArticleId], [Facet]) VALUES (75, 1174, N'Federal Aid (US)')
INSERT [dbo].[DesFacets] ([Id], [ArticleId], [Facet]) VALUES (76, 1174, N'Research')
INSERT [dbo].[DesFacets] ([Id], [ArticleId], [Facet]) VALUES (77, 1174, N'International Study and Teaching')
INSERT [dbo].[DesFacets] ([Id], [ArticleId], [Facet]) VALUES (78, 1175, N'Deaths (Obituaries)')
INSERT [dbo].[DesFacets] ([Id], [ArticleId], [Facet]) VALUES (79, 1175, N'Baseball')
INSERT [dbo].[DesFacets] ([Id], [ArticleId], [Facet]) VALUES (80, 1175, N'Women and Girls')
INSERT [dbo].[DesFacets] ([Id], [ArticleId], [Facet]) VALUES (81, 1175, N'A League of Their Own (Movie)')
INSERT [dbo].[DesFacets] ([Id], [ArticleId], [Facet]) VALUES (82, 1176, N'Defense and Military Forces')
INSERT [dbo].[DesFacets] ([Id], [ArticleId], [Facet]) VALUES (83, 1176, N'Israel-Gaza War (2023- )')
INSERT [dbo].[DesFacets] ([Id], [ArticleId], [Facet]) VALUES (84, 1176, N'United States International Relations')
INSERT [dbo].[DesFacets] ([Id], [ArticleId], [Facet]) VALUES (85, 1176, N'Palestinians')
INSERT [dbo].[DesFacets] ([Id], [ArticleId], [Facet]) VALUES (86, 1176, N'War and Armed Conflicts')
INSERT [dbo].[DesFacets] ([Id], [ArticleId], [Facet]) VALUES (87, 1176, N'Israeli Settlements')
INSERT [dbo].[DesFacets] ([Id], [ArticleId], [Facet]) VALUES (88, 1176, N'Anti-Semitism')
INSERT [dbo].[DesFacets] ([Id], [ArticleId], [Facet]) VALUES (89, 1177, N'internal-open-access')
INSERT [dbo].[DesFacets] ([Id], [ArticleId], [Facet]) VALUES (90, 1177, N'United States Politics and Government')
INSERT [dbo].[DesFacets] ([Id], [ArticleId], [Facet]) VALUES (91, 1177, N'United States Defense and Military Forces')
INSERT [dbo].[DesFacets] ([Id], [ArticleId], [Facet]) VALUES (92, 1177, N'Demonstrations, Protests and Riots')
INSERT [dbo].[DesFacets] ([Id], [ArticleId], [Facet]) VALUES (93, 1178, N'Global Warming')
INSERT [dbo].[DesFacets] ([Id], [ArticleId], [Facet]) VALUES (94, 1178, N'Greenhouse Gas Emissions')
INSERT [dbo].[DesFacets] ([Id], [ArticleId], [Facet]) VALUES (95, 1178, N'Nuclear Energy')
INSERT [dbo].[DesFacets] ([Id], [ArticleId], [Facet]) VALUES (96, 1178, N'Developing Countries')
INSERT [dbo].[DesFacets] ([Id], [ArticleId], [Facet]) VALUES (97, 1178, N'Banking and Financial Institutions')
INSERT [dbo].[DesFacets] ([Id], [ArticleId], [Facet]) VALUES (98, 1179, N'Birth Rates')
INSERT [dbo].[DesFacets] ([Id], [ArticleId], [Facet]) VALUES (99, 1179, N'Babies and Infants')
GO
INSERT [dbo].[DesFacets] ([Id], [ArticleId], [Facet]) VALUES (100, 1179, N'Children and Childhood')
INSERT [dbo].[DesFacets] ([Id], [ArticleId], [Facet]) VALUES (101, 1179, N'Parenting')
INSERT [dbo].[DesFacets] ([Id], [ArticleId], [Facet]) VALUES (102, 1179, N'Population')
INSERT [dbo].[DesFacets] ([Id], [ArticleId], [Facet]) VALUES (103, 1179, N'Polls and Public Opinion')
INSERT [dbo].[DesFacets] ([Id], [ArticleId], [Facet]) VALUES (104, 1179, N'Politics and Government')
INSERT [dbo].[DesFacets] ([Id], [ArticleId], [Facet]) VALUES (105, 1179, N'Bonuses')
INSERT [dbo].[DesFacets] ([Id], [ArticleId], [Facet]) VALUES (106, 1180, N'Police')
INSERT [dbo].[DesFacets] ([Id], [ArticleId], [Facet]) VALUES (107, 1181, N'Submarines and Submersibles')
INSERT [dbo].[DesFacets] ([Id], [ArticleId], [Facet]) VALUES (108, 1181, N'United States Defense and Military Forces')
INSERT [dbo].[DesFacets] ([Id], [ArticleId], [Facet]) VALUES (109, 1181, N'United States International Relations')
INSERT [dbo].[DesFacets] ([Id], [ArticleId], [Facet]) VALUES (110, 1181, N'Defense and Military Forces')
SET IDENTITY_INSERT [dbo].[DesFacets] OFF
GO
SET IDENTITY_INSERT [dbo].[GeoFacets] ON 

INSERT [dbo].[GeoFacets] ([Id], [ArticleId], [Facet]) VALUES (1, 1157, N'China')
INSERT [dbo].[GeoFacets] ([Id], [ArticleId], [Facet]) VALUES (2, 1158, N'China')
INSERT [dbo].[GeoFacets] ([Id], [ArticleId], [Facet]) VALUES (3, 1158, N'United States')
INSERT [dbo].[GeoFacets] ([Id], [ArticleId], [Facet]) VALUES (4, 1161, N'Iraq')
INSERT [dbo].[GeoFacets] ([Id], [ArticleId], [Facet]) VALUES (5, 1161, N'Iran')
INSERT [dbo].[GeoFacets] ([Id], [ArticleId], [Facet]) VALUES (6, 1161, N'Israel')
INSERT [dbo].[GeoFacets] ([Id], [ArticleId], [Facet]) VALUES (7, 1162, N'Israel')
INSERT [dbo].[GeoFacets] ([Id], [ArticleId], [Facet]) VALUES (8, 1163, N'Gaza Strip')
INSERT [dbo].[GeoFacets] ([Id], [ArticleId], [Facet]) VALUES (9, 1163, N'Israel')
INSERT [dbo].[GeoFacets] ([Id], [ArticleId], [Facet]) VALUES (10, 1163, N'United States')
INSERT [dbo].[GeoFacets] ([Id], [ArticleId], [Facet]) VALUES (11, 1168, N'Fort Gregg-Adams (Va)')
INSERT [dbo].[GeoFacets] ([Id], [ArticleId], [Facet]) VALUES (12, 1168, N'Fort Lee (Va)')
INSERT [dbo].[GeoFacets] ([Id], [ArticleId], [Facet]) VALUES (13, 1176, N'West Bank')
INSERT [dbo].[GeoFacets] ([Id], [ArticleId], [Facet]) VALUES (14, 1176, N'Israel')
INSERT [dbo].[GeoFacets] ([Id], [ArticleId], [Facet]) VALUES (15, 1176, N'Gaza Strip')
INSERT [dbo].[GeoFacets] ([Id], [ArticleId], [Facet]) VALUES (16, 1177, N'Los Angeles (Calif)')
INSERT [dbo].[GeoFacets] ([Id], [ArticleId], [Facet]) VALUES (17, 1179, N'Brazil')
INSERT [dbo].[GeoFacets] ([Id], [ArticleId], [Facet]) VALUES (18, 1179, N'China')
INSERT [dbo].[GeoFacets] ([Id], [ArticleId], [Facet]) VALUES (19, 1179, N'Germany')
INSERT [dbo].[GeoFacets] ([Id], [ArticleId], [Facet]) VALUES (20, 1179, N'Hungary')
INSERT [dbo].[GeoFacets] ([Id], [ArticleId], [Facet]) VALUES (21, 1179, N'India')
INSERT [dbo].[GeoFacets] ([Id], [ArticleId], [Facet]) VALUES (22, 1179, N'Indonesia')
INSERT [dbo].[GeoFacets] ([Id], [ArticleId], [Facet]) VALUES (23, 1179, N'Italy')
INSERT [dbo].[GeoFacets] ([Id], [ArticleId], [Facet]) VALUES (24, 1179, N'Mexico')
INSERT [dbo].[GeoFacets] ([Id], [ArticleId], [Facet]) VALUES (25, 1179, N'Morocco')
INSERT [dbo].[GeoFacets] ([Id], [ArticleId], [Facet]) VALUES (26, 1179, N'Nigeria')
INSERT [dbo].[GeoFacets] ([Id], [ArticleId], [Facet]) VALUES (27, 1179, N'South Africa')
INSERT [dbo].[GeoFacets] ([Id], [ArticleId], [Facet]) VALUES (28, 1179, N'Sweden')
INSERT [dbo].[GeoFacets] ([Id], [ArticleId], [Facet]) VALUES (29, 1179, N'Thailand')
INSERT [dbo].[GeoFacets] ([Id], [ArticleId], [Facet]) VALUES (30, 1179, N'Russia')
INSERT [dbo].[GeoFacets] ([Id], [ArticleId], [Facet]) VALUES (31, 1179, N'Vietnam')
INSERT [dbo].[GeoFacets] ([Id], [ArticleId], [Facet]) VALUES (32, 1179, N'United States')
INSERT [dbo].[GeoFacets] ([Id], [ArticleId], [Facet]) VALUES (33, 1180, N'Northern Ireland')
INSERT [dbo].[GeoFacets] ([Id], [ArticleId], [Facet]) VALUES (34, 1180, N'Great Britain')
INSERT [dbo].[GeoFacets] ([Id], [ArticleId], [Facet]) VALUES (35, 1181, N'Australia')
INSERT [dbo].[GeoFacets] ([Id], [ArticleId], [Facet]) VALUES (36, 1181, N'Great Britain')
INSERT [dbo].[GeoFacets] ([Id], [ArticleId], [Facet]) VALUES (37, 1181, N'China')
INSERT [dbo].[GeoFacets] ([Id], [ArticleId], [Facet]) VALUES (38, 1181, N'Far East, South and Southeast Asia and Pacific Areas')
SET IDENTITY_INSERT [dbo].[GeoFacets] OFF
GO
SET IDENTITY_INSERT [dbo].[Multimedia] ON 

INSERT [dbo].[Multimedia] ([Id], [ArticleId], [Url], [Format], [Height], [Width], [Type], [Subtype], [Caption], [Copyright]) VALUES (1, 1157, N'https://static01.nyt.com/images/2025/06/11/multimedia/11dc-trade-wqvf/11dc-trade-wqvf-superJumbo.jpg', N'Super Jumbo', 1365, 2048, N'image', N'photo', N'The negotiations this week raised questions about what exactly had been gained by President Trump’s aggressive trade tactics against China over the past few months.', N'Kenny Holston/The New York Times')
INSERT [dbo].[Multimedia] ([Id], [ArticleId], [Url], [Format], [Height], [Width], [Type], [Subtype], [Caption], [Copyright]) VALUES (2, 1157, N'https://static01.nyt.com/images/2025/06/11/multimedia/11dc-trade-wqvf/11dc-trade-wqvf-threeByTwoSmallAt2X.jpg', N'threeByTwoSmallAt2X', 400, 600, N'image', N'photo', N'The negotiations this week raised questions about what exactly had been gained by President Trump’s aggressive trade tactics against China over the past few months.', N'Kenny Holston/The New York Times')
INSERT [dbo].[Multimedia] ([Id], [ArticleId], [Url], [Format], [Height], [Width], [Type], [Subtype], [Caption], [Copyright]) VALUES (3, 1157, N'https://static01.nyt.com/images/2025/06/11/multimedia/11dc-trade-wqvf/11dc-trade-wqvf-thumbLarge.jpg', N'Large Thumbnail', 150, 150, N'image', N'photo', N'The negotiations this week raised questions about what exactly had been gained by President Trump’s aggressive trade tactics against China over the past few months.', N'Kenny Holston/The New York Times')
INSERT [dbo].[Multimedia] ([Id], [ArticleId], [Url], [Format], [Height], [Width], [Type], [Subtype], [Caption], [Copyright]) VALUES (4, 1158, N'https://static01.nyt.com/images/2025/06/11/multimedia/11biz-china-tech-01-qlzh/11biz-china-tech-01-qlzh-superJumbo.jpg', N'Super Jumbo', 1365, 2048, N'image', N'photo', N'Semiconductors at a factory in China. The United States has tried for years to hamper China’s ability to make cutting-edge computer chips.', N'Agence France-Presse — Getty Images')
INSERT [dbo].[Multimedia] ([Id], [ArticleId], [Url], [Format], [Height], [Width], [Type], [Subtype], [Caption], [Copyright]) VALUES (5, 1158, N'https://static01.nyt.com/images/2025/06/11/multimedia/11biz-china-tech-01-qlzh/11biz-china-tech-01-qlzh-threeByTwoSmallAt2X.jpg', N'threeByTwoSmallAt2X', 400, 600, N'image', N'photo', N'Semiconductors at a factory in China. The United States has tried for years to hamper China’s ability to make cutting-edge computer chips.', N'Agence France-Presse — Getty Images')
INSERT [dbo].[Multimedia] ([Id], [ArticleId], [Url], [Format], [Height], [Width], [Type], [Subtype], [Caption], [Copyright]) VALUES (6, 1158, N'https://static01.nyt.com/images/2025/06/11/multimedia/11biz-china-tech-01-qlzh/11biz-china-tech-01-qlzh-thumbLarge.jpg', N'Large Thumbnail', 150, 150, N'image', N'photo', N'Semiconductors at a factory in China. The United States has tried for years to hamper China’s ability to make cutting-edge computer chips.', N'Agence France-Presse — Getty Images')
INSERT [dbo].[Multimedia] ([Id], [ArticleId], [Url], [Format], [Height], [Width], [Type], [Subtype], [Caption], [Copyright]) VALUES (7, 1159, N'https://static01.nyt.com/images/2025/06/11/multimedia/11dc-taxfight-vqzm/11dc-taxfight-vqzm-superJumbo.jpg', N'Super Jumbo', 1366, 2048, N'image', N'photo', N'On the chopping block are some of President Trump’s favorite parts of the bill, like not taxing overtime.', N'Eric Lee for The New York Times')
INSERT [dbo].[Multimedia] ([Id], [ArticleId], [Url], [Format], [Height], [Width], [Type], [Subtype], [Caption], [Copyright]) VALUES (8, 1159, N'https://static01.nyt.com/images/2025/06/11/multimedia/11dc-taxfight-vqzm/11dc-taxfight-vqzm-threeByTwoSmallAt2X.jpg', N'threeByTwoSmallAt2X', 400, 600, N'image', N'photo', N'On the chopping block are some of President Trump’s favorite parts of the bill, like not taxing overtime.', N'Eric Lee for The New York Times')
INSERT [dbo].[Multimedia] ([Id], [ArticleId], [Url], [Format], [Height], [Width], [Type], [Subtype], [Caption], [Copyright]) VALUES (9, 1159, N'https://static01.nyt.com/images/2025/06/11/multimedia/11dc-taxfight-vqzm/11dc-taxfight-vqzm-thumbLarge.jpg', N'Large Thumbnail', 150, 150, N'image', N'photo', N'On the chopping block are some of President Trump’s favorite parts of the bill, like not taxing overtime.', N'Eric Lee for The New York Times')
INSERT [dbo].[Multimedia] ([Id], [ArticleId], [Url], [Format], [Height], [Width], [Type], [Subtype], [Caption], [Copyright]) VALUES (10, 1160, N'https://static01.nyt.com/images/2025/06/10/multimedia/2025-05-28-tariff-revenues-index/2025-05-28-tariff-revenues-index-superJumbo-v19.png', N'Super Jumbo', 1333, 2000, N'image', N'photo', N'', N'Christine Zhang')
INSERT [dbo].[Multimedia] ([Id], [ArticleId], [Url], [Format], [Height], [Width], [Type], [Subtype], [Caption], [Copyright]) VALUES (11, 1160, N'https://static01.nyt.com/images/2025/06/10/multimedia/2025-05-28-tariff-revenues-index/2025-05-28-tariff-revenues-index-threeByTwoSmallAt2X-v24.png', N'threeByTwoSmallAt2X', 400, 600, N'image', N'photo', N'', N'Christine Zhang')
INSERT [dbo].[Multimedia] ([Id], [ArticleId], [Url], [Format], [Height], [Width], [Type], [Subtype], [Caption], [Copyright]) VALUES (12, 1160, N'https://static01.nyt.com/images/2025/06/10/multimedia/2025-05-28-tariff-revenues-index/2025-05-28-tariff-revenues-index-thumbLarge-v19.png', N'Large Thumbnail', 150, 150, N'image', N'photo', N'', N'Christine Zhang')
INSERT [dbo].[Multimedia] ([Id], [ArticleId], [Url], [Format], [Height], [Width], [Type], [Subtype], [Caption], [Copyright]) VALUES (13, 1161, N'https://static01.nyt.com/images/2025/06/11/multimedia/11dc-diplo-flvk/11dc-diplo-flvk-superJumbo.jpg', N'Super Jumbo', 1365, 2048, N'image', N'photo', N'The U.S. Embassy complex in Baghdad in 2020. U.S. military family members have been authorized to leave the Middle East.', N'Khalid Mohammed/Associated Press')
INSERT [dbo].[Multimedia] ([Id], [ArticleId], [Url], [Format], [Height], [Width], [Type], [Subtype], [Caption], [Copyright]) VALUES (14, 1161, N'https://static01.nyt.com/images/2025/06/11/multimedia/11dc-diplo-flvk/11dc-diplo-flvk-threeByTwoSmallAt2X.jpg', N'threeByTwoSmallAt2X', 400, 600, N'image', N'photo', N'The U.S. Embassy complex in Baghdad in 2020. U.S. military family members have been authorized to leave the Middle East.', N'Khalid Mohammed/Associated Press')
INSERT [dbo].[Multimedia] ([Id], [ArticleId], [Url], [Format], [Height], [Width], [Type], [Subtype], [Caption], [Copyright]) VALUES (15, 1161, N'https://static01.nyt.com/images/2025/06/11/multimedia/11dc-diplo-flvk/11dc-diplo-flvk-thumbLarge.jpg', N'Large Thumbnail', 150, 150, N'image', N'photo', N'The U.S. Embassy complex in Baghdad in 2020. U.S. military family members have been authorized to leave the Middle East.', N'Khalid Mohammed/Associated Press')
INSERT [dbo].[Multimedia] ([Id], [ArticleId], [Url], [Format], [Height], [Width], [Type], [Subtype], [Caption], [Copyright]) VALUES (16, 1162, N'https://static01.nyt.com/images/2025/06/11/multimedia/11int-israel-knesset-wtlz/11int-israel-knesset-wtlz-superJumbo.jpg', N'Super Jumbo', 1365, 2048, N'image', N'photo', N'Although the move would not immediately bring down Israel’s government, it could hurt Prime Minister Benjamin Netanyahu politically.', N'Pool photo by Ronen Zvulun')
INSERT [dbo].[Multimedia] ([Id], [ArticleId], [Url], [Format], [Height], [Width], [Type], [Subtype], [Caption], [Copyright]) VALUES (17, 1162, N'https://static01.nyt.com/images/2025/06/11/multimedia/11int-israel-knesset-wtlz/11int-israel-knesset-wtlz-threeByTwoSmallAt2X.jpg', N'threeByTwoSmallAt2X', 400, 600, N'image', N'photo', N'Although the move would not immediately bring down Israel’s government, it could hurt Prime Minister Benjamin Netanyahu politically.', N'Pool photo by Ronen Zvulun')
INSERT [dbo].[Multimedia] ([Id], [ArticleId], [Url], [Format], [Height], [Width], [Type], [Subtype], [Caption], [Copyright]) VALUES (18, 1162, N'https://static01.nyt.com/images/2025/06/11/multimedia/11int-israel-knesset-wtlz/11int-israel-knesset-wtlz-thumbLarge.jpg', N'Large Thumbnail', 150, 150, N'image', N'photo', N'Although the move would not immediately bring down Israel’s government, it could hurt Prime Minister Benjamin Netanyahu politically.', N'Pool photo by Ronen Zvulun')
INSERT [dbo].[Multimedia] ([Id], [ArticleId], [Url], [Format], [Height], [Width], [Type], [Subtype], [Caption], [Copyright]) VALUES (19, 1163, N'https://static01.nyt.com/images/2025/06/11/multimedia/11int-gaza-aid-attack-vztq/11int-gaza-aid-attack-vztq-superJumbo.jpg', N'Super Jumbo', 1365, 2048, N'image', N'photo', N'Palestinians carry relief supplies from the Gaza Humanitarian Foundation in central Gaza on Sunday.', N'Eyad Baba/Agence France-Presse — Getty Images')
INSERT [dbo].[Multimedia] ([Id], [ArticleId], [Url], [Format], [Height], [Width], [Type], [Subtype], [Caption], [Copyright]) VALUES (20, 1163, N'https://static01.nyt.com/images/2025/06/11/multimedia/11int-gaza-aid-attack-vztq/11int-gaza-aid-attack-vztq-threeByTwoSmallAt2X.jpg', N'threeByTwoSmallAt2X', 400, 600, N'image', N'photo', N'Palestinians carry relief supplies from the Gaza Humanitarian Foundation in central Gaza on Sunday.', N'Eyad Baba/Agence France-Presse — Getty Images')
INSERT [dbo].[Multimedia] ([Id], [ArticleId], [Url], [Format], [Height], [Width], [Type], [Subtype], [Caption], [Copyright]) VALUES (21, 1163, N'https://static01.nyt.com/images/2025/06/11/multimedia/11int-gaza-aid-attack-vztq/11int-gaza-aid-attack-vztq-thumbLarge.jpg', N'Large Thumbnail', 150, 150, N'image', N'photo', N'Palestinians carry relief supplies from the Gaza Humanitarian Foundation in central Gaza on Sunday.', N'Eyad Baba/Agence France-Presse — Getty Images')
INSERT [dbo].[Multimedia] ([Id], [ArticleId], [Url], [Format], [Height], [Width], [Type], [Subtype], [Caption], [Copyright]) VALUES (22, 1164, N'https://static01.nyt.com/images/2025/06/11/multimedia/11dc-assess-01-ztgl/11dc-assess-01-ztgl-superJumbo.jpg', N'Super Jumbo', 1365, 2048, N'image', N'photo', N'President Trump’s deployment of the National Guard in Los Angeles is first time in more than half a century a president has mobilized National Guard troops without the consent of a governor.', N'Mark Abramson for The New York Times')
INSERT [dbo].[Multimedia] ([Id], [ArticleId], [Url], [Format], [Height], [Width], [Type], [Subtype], [Caption], [Copyright]) VALUES (23, 1164, N'https://static01.nyt.com/images/2025/06/11/multimedia/11dc-assess-01-ztgl/11dc-assess-01-ztgl-threeByTwoSmallAt2X.jpg', N'threeByTwoSmallAt2X', 400, 600, N'image', N'photo', N'President Trump’s deployment of the National Guard in Los Angeles is first time in more than half a century a president has mobilized National Guard troops without the consent of a governor.', N'Mark Abramson for The New York Times')
INSERT [dbo].[Multimedia] ([Id], [ArticleId], [Url], [Format], [Height], [Width], [Type], [Subtype], [Caption], [Copyright]) VALUES (24, 1164, N'https://static01.nyt.com/images/2025/06/11/multimedia/11dc-assess-01-ztgl/11dc-assess-01-ztgl-thumbLarge.jpg', N'Large Thumbnail', 150, 150, N'image', N'photo', N'President Trump’s deployment of the National Guard in Los Angeles is first time in more than half a century a president has mobilized National Guard troops without the consent of a governor.', N'Mark Abramson for The New York Times')
INSERT [dbo].[Multimedia] ([Id], [ArticleId], [Url], [Format], [Height], [Width], [Type], [Subtype], [Caption], [Copyright]) VALUES (25, 1165, N'https://static01.nyt.com/images/2025/06/11/multimedia/11nat-protest-tracker-austin-bplq/11nat-protest-tracker-austin-bplq-superJumbo.jpg', N'Super Jumbo', 1363, 2048, N'image', N'photo', N'', N'Brandon Bell/Getty Images')
INSERT [dbo].[Multimedia] ([Id], [ArticleId], [Url], [Format], [Height], [Width], [Type], [Subtype], [Caption], [Copyright]) VALUES (26, 1165, N'https://static01.nyt.com/images/2025/06/11/multimedia/11nat-protest-tracker-austin-bplq/11nat-protest-tracker-austin-bplq-threeByTwoSmallAt2X.jpg', N'threeByTwoSmallAt2X', 400, 600, N'image', N'photo', N'', N'Brandon Bell/Getty Images')
INSERT [dbo].[Multimedia] ([Id], [ArticleId], [Url], [Format], [Height], [Width], [Type], [Subtype], [Caption], [Copyright]) VALUES (27, 1165, N'https://static01.nyt.com/images/2025/06/11/multimedia/11nat-protest-tracker-austin-bplq/11nat-protest-tracker-austin-bplq-thumbLarge.jpg', N'Large Thumbnail', 150, 150, N'image', N'photo', N'', N'Brandon Bell/Getty Images')
INSERT [dbo].[Multimedia] ([Id], [ArticleId], [Url], [Format], [Height], [Width], [Type], [Subtype], [Caption], [Copyright]) VALUES (28, 1166, N'https://static01.nyt.com/images/2025/06/11/multimedia/00met-khalil-01-hzqp/00met-khalil-01-hzqp-superJumbo.jpg', N'Super Jumbo', 1366, 2048, N'image', N'photo', N'Mahmoud Khalil has been detained for more than three months.', N'Bing Guan for The New York Times')
INSERT [dbo].[Multimedia] ([Id], [ArticleId], [Url], [Format], [Height], [Width], [Type], [Subtype], [Caption], [Copyright]) VALUES (29, 1166, N'https://static01.nyt.com/images/2025/06/11/multimedia/00met-khalil-01-hzqp/00met-khalil-01-hzqp-threeByTwoSmallAt2X.jpg', N'threeByTwoSmallAt2X', 400, 600, N'image', N'photo', N'Mahmoud Khalil has been detained for more than three months.', N'Bing Guan for The New York Times')
INSERT [dbo].[Multimedia] ([Id], [ArticleId], [Url], [Format], [Height], [Width], [Type], [Subtype], [Caption], [Copyright]) VALUES (30, 1166, N'https://static01.nyt.com/images/2025/06/11/multimedia/00met-khalil-01-hzqp/00met-khalil-01-hzqp-thumbLarge.jpg', N'Large Thumbnail', 150, 150, N'image', N'photo', N'Mahmoud Khalil has been detained for more than three months.', N'Bing Guan for The New York Times')
INSERT [dbo].[Multimedia] ([Id], [ArticleId], [Url], [Format], [Height], [Width], [Type], [Subtype], [Caption], [Copyright]) VALUES (31, 1167, N'https://static01.nyt.com/images/2025/06/11/multimedia/rfk-vaccine-cmpz/rfk-vaccine-cmpz-superJumbo.jpg', N'Super Jumbo', 2048, 1367, N'image', N'photo', N'Health Secretary Robert F. Kennedy Jr. in Washington in May.', N'Haiyun Jiang for The New York Times')
INSERT [dbo].[Multimedia] ([Id], [ArticleId], [Url], [Format], [Height], [Width], [Type], [Subtype], [Caption], [Copyright]) VALUES (32, 1167, N'https://static01.nyt.com/images/2025/06/11/multimedia/rfk-vaccine-cmpz/rfk-vaccine-cmpz-threeByTwoSmallAt2X-v2.jpg', N'threeByTwoSmallAt2X', 400, 600, N'image', N'photo', N'Health Secretary Robert F. Kennedy Jr. in Washington in May.', N'Haiyun Jiang for The New York Times')
INSERT [dbo].[Multimedia] ([Id], [ArticleId], [Url], [Format], [Height], [Width], [Type], [Subtype], [Caption], [Copyright]) VALUES (33, 1167, N'https://static01.nyt.com/images/2025/06/11/multimedia/rfk-vaccine-cmpz/rfk-vaccine-cmpz-thumbLarge-v2.jpg', N'Large Thumbnail', 150, 150, N'image', N'photo', N'Health Secretary Robert F. Kennedy Jr. in Washington in May.', N'Haiyun Jiang for The New York Times')
INSERT [dbo].[Multimedia] ([Id], [ArticleId], [Url], [Format], [Height], [Width], [Type], [Subtype], [Caption], [Copyright]) VALUES (34, 1168, N'https://static01.nyt.com/images/2025/06/11/us/politics/11dc-army-base/11dc-army-base-superJumbo.jpg', N'Super Jumbo', 2048, 1367, N'image', N'photo', N'Pvt. Fitz Lee, who served in Troop M, 10th Cavalry, in 1899 with his Medal of Honor on his jacket, which has the faint stripe of a single chevron signifying his rank. ', N'National Museum of African American History and Culture')
INSERT [dbo].[Multimedia] ([Id], [ArticleId], [Url], [Format], [Height], [Width], [Type], [Subtype], [Caption], [Copyright]) VALUES (35, 1168, N'https://static01.nyt.com/images/2025/06/11/us/politics/11dc-army-base/11dc-army-base-threeByTwoSmallAt2X.jpg', N'threeByTwoSmallAt2X', 400, 600, N'image', N'photo', N'Pvt. Fitz Lee, who served in Troop M, 10th Cavalry, in 1899 with his Medal of Honor on his jacket, which has the faint stripe of a single chevron signifying his rank. ', N'National Museum of African American History and Culture')
INSERT [dbo].[Multimedia] ([Id], [ArticleId], [Url], [Format], [Height], [Width], [Type], [Subtype], [Caption], [Copyright]) VALUES (36, 1168, N'https://static01.nyt.com/images/2025/06/11/us/politics/11dc-army-base/11dc-army-base-thumbLarge.jpg', N'Large Thumbnail', 150, 150, N'image', N'photo', N'Pvt. Fitz Lee, who served in Troop M, 10th Cavalry, in 1899 with his Medal of Honor on his jacket, which has the faint stripe of a single chevron signifying his rank. ', N'National Museum of African American History and Culture')
INSERT [dbo].[Multimedia] ([Id], [ArticleId], [Url], [Format], [Height], [Width], [Type], [Subtype], [Caption], [Copyright]) VALUES (37, 1169, N'https://static01.nyt.com/images/2025/06/11/multimedia/11dc-hegseth1-mczf/11dc-hegseth1-mczf-superJumbo.jpg', N'Super Jumbo', 2048, 1366, N'image', N'photo', N'Defense Secretary Pete Hegseth during a Senate hearing on Wednesday.', N'Kenny Holston/The New York Times')
INSERT [dbo].[Multimedia] ([Id], [ArticleId], [Url], [Format], [Height], [Width], [Type], [Subtype], [Caption], [Copyright]) VALUES (38, 1169, N'https://static01.nyt.com/images/2025/06/11/multimedia/11dc-hegseth1-mczf/11dc-hegseth1-mczf-threeByTwoSmallAt2X.jpg', N'threeByTwoSmallAt2X', 400, 600, N'image', N'photo', N'Defense Secretary Pete Hegseth during a Senate hearing on Wednesday.', N'Kenny Holston/The New York Times')
INSERT [dbo].[Multimedia] ([Id], [ArticleId], [Url], [Format], [Height], [Width], [Type], [Subtype], [Caption], [Copyright]) VALUES (39, 1169, N'https://static01.nyt.com/images/2025/06/11/multimedia/11dc-hegseth1-mczf/11dc-hegseth1-mczf-thumbLarge.jpg', N'Large Thumbnail', 150, 150, N'image', N'photo', N'Defense Secretary Pete Hegseth during a Senate hearing on Wednesday.', N'Kenny Holston/The New York Times')
INSERT [dbo].[Multimedia] ([Id], [ArticleId], [Url], [Format], [Height], [Width], [Type], [Subtype], [Caption], [Copyright]) VALUES (40, 1170, N'https://static01.nyt.com/images/2025/06/11/multimedia/11Wilson--tfml/11Wilson--tfml-superJumbo-v4.jpg', N'Super Jumbo', 2048, 1520, N'image', N'photo', N'Brian Wilson 1998.', N'Deborah Feingold/Corbis, via Getty Images')
INSERT [dbo].[Multimedia] ([Id], [ArticleId], [Url], [Format], [Height], [Width], [Type], [Subtype], [Caption], [Copyright]) VALUES (41, 1170, N'https://static01.nyt.com/images/2025/06/11/multimedia/11Wilson--tfml/11Wilson--tfml-threeByTwoSmallAt2X.jpg', N'threeByTwoSmallAt2X', 400, 600, N'image', N'photo', N'Brian Wilson 1998.', N'Deborah Feingold/Corbis, via Getty Images')
INSERT [dbo].[Multimedia] ([Id], [ArticleId], [Url], [Format], [Height], [Width], [Type], [Subtype], [Caption], [Copyright]) VALUES (42, 1170, N'https://static01.nyt.com/images/2025/06/11/multimedia/11Wilson--tfml/11Wilson--tfml-thumbLarge.jpg', N'Large Thumbnail', 150, 150, N'image', N'photo', N'Brian Wilson 1998.', N'Deborah Feingold/Corbis, via Getty Images')
INSERT [dbo].[Multimedia] ([Id], [ArticleId], [Url], [Format], [Height], [Width], [Type], [Subtype], [Caption], [Copyright]) VALUES (43, 1171, N'https://static01.nyt.com/images/2025/06/11/multimedia/11cul-wilson-playlist1-bfhw/11cul-wilson-playlist1-bfhw-superJumbo.jpg', N'Super Jumbo', 1365, 2048, N'image', N'photo', N'Brian Wilson, center at microphone, with the other members of the Beach Boys.', N'NBCU Photo Bank/NBCUniversal, via Getty Images')
INSERT [dbo].[Multimedia] ([Id], [ArticleId], [Url], [Format], [Height], [Width], [Type], [Subtype], [Caption], [Copyright]) VALUES (44, 1171, N'https://static01.nyt.com/images/2025/06/11/multimedia/11cul-wilson-playlist1-bfhw/11cul-wilson-playlist1-bfhw-threeByTwoSmallAt2X.jpg', N'threeByTwoSmallAt2X', 400, 600, N'image', N'photo', N'Brian Wilson, center at microphone, with the other members of the Beach Boys.', N'NBCU Photo Bank/NBCUniversal, via Getty Images')
INSERT [dbo].[Multimedia] ([Id], [ArticleId], [Url], [Format], [Height], [Width], [Type], [Subtype], [Caption], [Copyright]) VALUES (45, 1171, N'https://static01.nyt.com/images/2025/06/11/multimedia/11cul-wilson-playlist1-bfhw/11cul-wilson-playlist1-bfhw-thumbLarge.jpg', N'Large Thumbnail', 150, 150, N'image', N'photo', N'Brian Wilson, center at microphone, with the other members of the Beach Boys.', N'NBCU Photo Bank/NBCUniversal, via Getty Images')
INSERT [dbo].[Multimedia] ([Id], [ArticleId], [Url], [Format], [Height], [Width], [Type], [Subtype], [Caption], [Copyright]) VALUES (46, 1172, N'https://static01.nyt.com/images/2025/06/11/multimedia/11met-weinstein-jury-fqzc/11met-weinstein-jury-fqzc-superJumbo.jpg', N'Super Jumbo', 1365, 2048, N'image', N'photo', N'Wednesday was the fifth day of jury deliberations in the trial of Harvey Weinstein. ', N'Jefferson Siegel for The New York Times')
INSERT [dbo].[Multimedia] ([Id], [ArticleId], [Url], [Format], [Height], [Width], [Type], [Subtype], [Caption], [Copyright]) VALUES (47, 1172, N'https://static01.nyt.com/images/2025/06/11/multimedia/11met-weinstein-jury-fqzc/11met-weinstein-jury-fqzc-threeByTwoSmallAt2X.jpg', N'threeByTwoSmallAt2X', 400, 600, N'image', N'photo', N'Wednesday was the fifth day of jury deliberations in the trial of Harvey Weinstein. ', N'Jefferson Siegel for The New York Times')
INSERT [dbo].[Multimedia] ([Id], [ArticleId], [Url], [Format], [Height], [Width], [Type], [Subtype], [Caption], [Copyright]) VALUES (48, 1172, N'https://static01.nyt.com/images/2025/06/11/multimedia/11met-weinstein-jury-fqzc/11met-weinstein-jury-fqzc-thumbLarge.jpg', N'Large Thumbnail', 150, 150, N'image', N'photo', N'Wednesday was the fifth day of jury deliberations in the trial of Harvey Weinstein. ', N'Jefferson Siegel for The New York Times')
INSERT [dbo].[Multimedia] ([Id], [ArticleId], [Url], [Format], [Height], [Width], [Type], [Subtype], [Caption], [Copyright]) VALUES (49, 1173, N'https://static01.nyt.com/images/2025/06/11/us/politics/pol-hogg-dnc/pol-hogg-dnc-superJumbo.jpg', N'Super Jumbo', 1365, 2048, N'image', N'photo', N'David Hogg said two months ago that he planned to spend millions of dollars on primary elections through a separate group he leads, aiming to bring generational change to the Democratic Party.', N'Bob Daemmrich/Zuma Press, via Alamy')
INSERT [dbo].[Multimedia] ([Id], [ArticleId], [Url], [Format], [Height], [Width], [Type], [Subtype], [Caption], [Copyright]) VALUES (50, 1173, N'https://static01.nyt.com/images/2025/06/11/us/politics/pol-hogg-dnc/pol-hogg-dnc-threeByTwoSmallAt2X.jpg', N'threeByTwoSmallAt2X', 400, 600, N'image', N'photo', N'David Hogg said two months ago that he planned to spend millions of dollars on primary elections through a separate group he leads, aiming to bring generational change to the Democratic Party.', N'Bob Daemmrich/Zuma Press, via Alamy')
INSERT [dbo].[Multimedia] ([Id], [ArticleId], [Url], [Format], [Height], [Width], [Type], [Subtype], [Caption], [Copyright]) VALUES (51, 1173, N'https://static01.nyt.com/images/2025/06/11/us/politics/pol-hogg-dnc/pol-hogg-dnc-thumbLarge.jpg', N'Large Thumbnail', 150, 150, N'image', N'photo', N'David Hogg said two months ago that he planned to spend millions of dollars on primary elections through a separate group he leads, aiming to bring generational change to the Democratic Party.', N'Bob Daemmrich/Zuma Press, via Alamy')
INSERT [dbo].[Multimedia] ([Id], [ArticleId], [Url], [Format], [Height], [Width], [Type], [Subtype], [Caption], [Copyright]) VALUES (52, 1174, N'https://static01.nyt.com/images/2025/06/06/multimedia/00nat-harvard-future-wlzq/00nat-harvard-future-wlzq-superJumbo.jpg', N'Super Jumbo', 1365, 2048, N'image', N'photo', N'The Trump administration has sought to bar international students at Harvard. Without them, Harvard said, it would no longer be the same university as it is today. ', N'Sophie Park for The New York Times')
INSERT [dbo].[Multimedia] ([Id], [ArticleId], [Url], [Format], [Height], [Width], [Type], [Subtype], [Caption], [Copyright]) VALUES (53, 1174, N'https://static01.nyt.com/images/2025/06/06/multimedia/00nat-harvard-future-wlzq/00nat-harvard-future-wlzq-threeByTwoSmallAt2X.jpg', N'threeByTwoSmallAt2X', 400, 600, N'image', N'photo', N'The Trump administration has sought to bar international students at Harvard. Without them, Harvard said, it would no longer be the same university as it is today. ', N'Sophie Park for The New York Times')
INSERT [dbo].[Multimedia] ([Id], [ArticleId], [Url], [Format], [Height], [Width], [Type], [Subtype], [Caption], [Copyright]) VALUES (54, 1174, N'https://static01.nyt.com/images/2025/06/06/multimedia/00nat-harvard-future-wlzq/00nat-harvard-future-wlzq-thumbLarge.jpg', N'Large Thumbnail', 150, 150, N'image', N'photo', N'The Trump administration has sought to bar international students at Harvard. Without them, Harvard said, it would no longer be the same university as it is today. ', N'Sophie Park for The New York Times')
INSERT [dbo].[Multimedia] ([Id], [ArticleId], [Url], [Format], [Height], [Width], [Type], [Subtype], [Caption], [Copyright]) VALUES (55, 1175, N'https://static01.nyt.com/images/2025/06/10/multimedia/10jochum-vckb/10jochum-vckb-superJumbo.jpg', N'Super Jumbo', 2048, 1484, N'image', N'photo', N'Betsy Jochum was the last surviving player from the inaugural 1943 season of what became the All-American Girls Baseball League.', N'Baseball Hall of Fame')
INSERT [dbo].[Multimedia] ([Id], [ArticleId], [Url], [Format], [Height], [Width], [Type], [Subtype], [Caption], [Copyright]) VALUES (56, 1175, N'https://static01.nyt.com/images/2025/06/10/multimedia/10jochum-vckb/10jochum-vckb-threeByTwoSmallAt2X.jpg', N'threeByTwoSmallAt2X', 400, 600, N'image', N'photo', N'Betsy Jochum was the last surviving player from the inaugural 1943 season of what became the All-American Girls Baseball League.', N'Baseball Hall of Fame')
INSERT [dbo].[Multimedia] ([Id], [ArticleId], [Url], [Format], [Height], [Width], [Type], [Subtype], [Caption], [Copyright]) VALUES (57, 1175, N'https://static01.nyt.com/images/2025/06/10/multimedia/10jochum-vckb/10jochum-vckb-thumbLarge.jpg', N'Large Thumbnail', 150, 150, N'image', N'photo', N'Betsy Jochum was the last surviving player from the inaugural 1943 season of what became the All-American Girls Baseball League.', N'Baseball Hall of Fame')
INSERT [dbo].[Multimedia] ([Id], [ArticleId], [Url], [Format], [Height], [Width], [Type], [Subtype], [Caption], [Copyright]) VALUES (58, 1176, N'https://static01.nyt.com/images/2025/06/11/opinion/11eks-olmert/11eks-olmert-superJumbo.jpg', N'Super Jumbo', 1365, 2048, N'image', N'photo', N'', N'The New York Times')
INSERT [dbo].[Multimedia] ([Id], [ArticleId], [Url], [Format], [Height], [Width], [Type], [Subtype], [Caption], [Copyright]) VALUES (59, 1176, N'https://static01.nyt.com/images/2025/06/11/opinion/11eks-olmert/11eks-olmert-threeByTwoSmallAt2X.jpg', N'threeByTwoSmallAt2X', 400, 600, N'image', N'photo', N'', N'The New York Times')
INSERT [dbo].[Multimedia] ([Id], [ArticleId], [Url], [Format], [Height], [Width], [Type], [Subtype], [Caption], [Copyright]) VALUES (60, 1176, N'https://static01.nyt.com/images/2025/06/11/opinion/11eks-olmert/11eks-olmert-thumbLarge.jpg', N'Large Thumbnail', 150, 150, N'image', N'photo', N'', N'The New York Times')
INSERT [dbo].[Multimedia] ([Id], [ArticleId], [Url], [Format], [Height], [Width], [Type], [Subtype], [Caption], [Copyright]) VALUES (61, 1177, N'https://static01.nyt.com/images/2025/06/11/multimedia/11hennigan-qfbc/11hennigan-qfbc-superJumbo.jpg', N'Super Jumbo', 1365, 2048, N'image', N'photo', N'', N'Brendan Smialowski/Agence France-Presse — Getty Images')
INSERT [dbo].[Multimedia] ([Id], [ArticleId], [Url], [Format], [Height], [Width], [Type], [Subtype], [Caption], [Copyright]) VALUES (62, 1177, N'https://static01.nyt.com/images/2025/06/11/multimedia/11hennigan-qfbc/11hennigan-qfbc-threeByTwoSmallAt2X.jpg', N'threeByTwoSmallAt2X', 400, 600, N'image', N'photo', N'', N'Brendan Smialowski/Agence France-Presse — Getty Images')
INSERT [dbo].[Multimedia] ([Id], [ArticleId], [Url], [Format], [Height], [Width], [Type], [Subtype], [Caption], [Copyright]) VALUES (63, 1177, N'https://static01.nyt.com/images/2025/06/11/multimedia/11hennigan-qfbc/11hennigan-qfbc-thumbLarge.jpg', N'Large Thumbnail', 150, 150, N'image', N'photo', N'', N'Brendan Smialowski/Agence France-Presse — Getty Images')
INSERT [dbo].[Multimedia] ([Id], [ArticleId], [Url], [Format], [Height], [Width], [Type], [Subtype], [Caption], [Copyright]) VALUES (64, 1178, N'https://static01.nyt.com/images/2025/06/11/multimedia/11cli-worldbank-nuclear-wjkl/11cli-worldbank-nuclear-wjkl-superJumbo.jpg', N'Super Jumbo', 1365, 2048, N'image', N'photo', N'Construction of Bangladesh’s first nuclear plant in 2023.', N'Abdul Goni/Agence France-Presse — Getty Images')
INSERT [dbo].[Multimedia] ([Id], [ArticleId], [Url], [Format], [Height], [Width], [Type], [Subtype], [Caption], [Copyright]) VALUES (65, 1178, N'https://static01.nyt.com/images/2025/06/11/multimedia/11cli-worldbank-nuclear-wjkl/11cli-worldbank-nuclear-wjkl-threeByTwoSmallAt2X.jpg', N'threeByTwoSmallAt2X', 400, 600, N'image', N'photo', N'Construction of Bangladesh’s first nuclear plant in 2023.', N'Abdul Goni/Agence France-Presse — Getty Images')
INSERT [dbo].[Multimedia] ([Id], [ArticleId], [Url], [Format], [Height], [Width], [Type], [Subtype], [Caption], [Copyright]) VALUES (66, 1178, N'https://static01.nyt.com/images/2025/06/11/multimedia/11cli-worldbank-nuclear-wjkl/11cli-worldbank-nuclear-wjkl-thumbLarge.jpg', N'Large Thumbnail', 150, 150, N'image', N'photo', N'Construction of Bangladesh’s first nuclear plant in 2023.', N'Abdul Goni/Agence France-Presse — Getty Images')
INSERT [dbo].[Multimedia] ([Id], [ArticleId], [Url], [Format], [Height], [Width], [Type], [Subtype], [Caption], [Copyright]) VALUES (67, 1179, N'https://static01.nyt.com/images/2025/06/11/multimedia/11int-un-families-ktqv/11int-un-families-ktqv-superJumbo.jpg', N'Super Jumbo', 1365, 2048, N'image', N'photo', N'Students at a school in Abuja, Nigeria. A U.N. survey found that many people end up having fewer children than they wanted.', N'Taiwo Aina for The New York Times')
INSERT [dbo].[Multimedia] ([Id], [ArticleId], [Url], [Format], [Height], [Width], [Type], [Subtype], [Caption], [Copyright]) VALUES (68, 1179, N'https://static01.nyt.com/images/2025/06/11/multimedia/11int-un-families-ktqv/11int-un-families-ktqv-threeByTwoSmallAt2X.jpg', N'threeByTwoSmallAt2X', 400, 600, N'image', N'photo', N'Students at a school in Abuja, Nigeria. A U.N. survey found that many people end up having fewer children than they wanted.', N'Taiwo Aina for The New York Times')
INSERT [dbo].[Multimedia] ([Id], [ArticleId], [Url], [Format], [Height], [Width], [Type], [Subtype], [Caption], [Copyright]) VALUES (69, 1179, N'https://static01.nyt.com/images/2025/06/11/multimedia/11int-un-families-ktqv/11int-un-families-ktqv-thumbLarge.jpg', N'Large Thumbnail', 150, 150, N'image', N'photo', N'Students at a school in Abuja, Nigeria. A U.N. survey found that many people end up having fewer children than they wanted.', N'Taiwo Aina for The New York Times')
INSERT [dbo].[Multimedia] ([Id], [ArticleId], [Url], [Format], [Height], [Width], [Type], [Subtype], [Caption], [Copyright]) VALUES (70, 1180, N'https://static01.nyt.com/images/2025/06/11/multimedia/11int-nireland-riot-01-mpzk/11int-nireland-riot-01-mpzk-superJumbo.jpg', N'Super Jumbo', 1365, 2048, N'image', N'photo', N'A vehicle is set alight during an anti-immigration demonstration in Ballymena on Tuesday night.', N'Paul Faith/Agence France-Presse — Getty Images')
INSERT [dbo].[Multimedia] ([Id], [ArticleId], [Url], [Format], [Height], [Width], [Type], [Subtype], [Caption], [Copyright]) VALUES (71, 1180, N'https://static01.nyt.com/images/2025/06/11/multimedia/11int-nireland-riot-01-mpzk/11int-nireland-riot-01-mpzk-threeByTwoSmallAt2X.jpg', N'threeByTwoSmallAt2X', 400, 600, N'image', N'photo', N'A vehicle is set alight during an anti-immigration demonstration in Ballymena on Tuesday night.', N'Paul Faith/Agence France-Presse — Getty Images')
INSERT [dbo].[Multimedia] ([Id], [ArticleId], [Url], [Format], [Height], [Width], [Type], [Subtype], [Caption], [Copyright]) VALUES (72, 1180, N'https://static01.nyt.com/images/2025/06/11/multimedia/11int-nireland-riot-01-mpzk/11int-nireland-riot-01-mpzk-thumbLarge.jpg', N'Large Thumbnail', 150, 150, N'image', N'photo', N'A vehicle is set alight during an anti-immigration demonstration in Ballymena on Tuesday night.', N'Paul Faith/Agence France-Presse — Getty Images')
INSERT [dbo].[Multimedia] ([Id], [ArticleId], [Url], [Format], [Height], [Width], [Type], [Subtype], [Caption], [Copyright]) VALUES (73, 1181, N'https://static01.nyt.com/images/2025/06/12/multimedia/12int-oz-aukus-hwcb/12int-oz-aukus-hwcb-superJumbo.jpg', N'Super Jumbo', 1365, 2048, N'image', N'photo', N'Sailors waited for then-President Joseph R. Biden to make remarks about the Aukus agreement in San Diego in 2023. Under the deal, Australia would receive secondhand nuclear submarines from the United States.', N'Haiyun Jiang/The New York Times')
INSERT [dbo].[Multimedia] ([Id], [ArticleId], [Url], [Format], [Height], [Width], [Type], [Subtype], [Caption], [Copyright]) VALUES (74, 1181, N'https://static01.nyt.com/images/2025/06/12/multimedia/12int-oz-aukus-hwcb/12int-oz-aukus-hwcb-threeByTwoSmallAt2X.jpg', N'threeByTwoSmallAt2X', 400, 600, N'image', N'photo', N'Sailors waited for then-President Joseph R. Biden to make remarks about the Aukus agreement in San Diego in 2023. Under the deal, Australia would receive secondhand nuclear submarines from the United States.', N'Haiyun Jiang/The New York Times')
INSERT [dbo].[Multimedia] ([Id], [ArticleId], [Url], [Format], [Height], [Width], [Type], [Subtype], [Caption], [Copyright]) VALUES (75, 1181, N'https://static01.nyt.com/images/2025/06/12/multimedia/12int-oz-aukus-hwcb/12int-oz-aukus-hwcb-thumbLarge.jpg', N'Large Thumbnail', 150, 150, N'image', N'photo', N'Sailors waited for then-President Joseph R. Biden to make remarks about the Aukus agreement in San Diego in 2023. Under the deal, Australia would receive secondhand nuclear submarines from the United States.', N'Haiyun Jiang/The New York Times')
SET IDENTITY_INSERT [dbo].[Multimedia] OFF
GO
SET IDENTITY_INSERT [dbo].[OrgFacets] ON 

INSERT [dbo].[OrgFacets] ([Id], [ArticleId], [Facet]) VALUES (1, 1158, N'ASML Holding NV')
INSERT [dbo].[OrgFacets] ([Id], [ArticleId], [Facet]) VALUES (2, 1158, N'Huawei Technologies Co Ltd')
INSERT [dbo].[OrgFacets] ([Id], [ArticleId], [Facet]) VALUES (3, 1158, N'NVIDIA Corporation')
INSERT [dbo].[OrgFacets] ([Id], [ArticleId], [Facet]) VALUES (4, 1158, N'ZTE Corp')
INSERT [dbo].[OrgFacets] ([Id], [ArticleId], [Facet]) VALUES (5, 1159, N'House of Representatives')
INSERT [dbo].[OrgFacets] ([Id], [ArticleId], [Facet]) VALUES (6, 1159, N'Senate')
INSERT [dbo].[OrgFacets] ([Id], [ArticleId], [Facet]) VALUES (7, 1159, N'Republican Party')
INSERT [dbo].[OrgFacets] ([Id], [ArticleId], [Facet]) VALUES (8, 1161, N'Defense Department')
INSERT [dbo].[OrgFacets] ([Id], [ArticleId], [Facet]) VALUES (9, 1161, N'State Department')
INSERT [dbo].[OrgFacets] ([Id], [ArticleId], [Facet]) VALUES (10, 1161, N'International Atomic Energy Agency')
INSERT [dbo].[OrgFacets] ([Id], [ArticleId], [Facet]) VALUES (11, 1162, N'Likud Party (Israel)')
INSERT [dbo].[OrgFacets] ([Id], [ArticleId], [Facet]) VALUES (12, 1162, N'Shas Party (Israel)')
INSERT [dbo].[OrgFacets] ([Id], [ArticleId], [Facet]) VALUES (13, 1162, N'United Torah Judaism')
INSERT [dbo].[OrgFacets] ([Id], [ArticleId], [Facet]) VALUES (14, 1163, N'Gaza Humanitarian Foundation')
INSERT [dbo].[OrgFacets] ([Id], [ArticleId], [Facet]) VALUES (15, 1163, N'Hamas')
INSERT [dbo].[OrgFacets] ([Id], [ArticleId], [Facet]) VALUES (16, 1164, N'Defense Department')
INSERT [dbo].[OrgFacets] ([Id], [ArticleId], [Facet]) VALUES (17, 1164, N'Border Patrol (US)')
INSERT [dbo].[OrgFacets] ([Id], [ArticleId], [Facet]) VALUES (18, 1164, N'National Guard')
INSERT [dbo].[OrgFacets] ([Id], [ArticleId], [Facet]) VALUES (19, 1164, N'Homeland Security Department')
INSERT [dbo].[OrgFacets] ([Id], [ArticleId], [Facet]) VALUES (20, 1164, N'United States Marine Corps')
INSERT [dbo].[OrgFacets] ([Id], [ArticleId], [Facet]) VALUES (21, 1165, N'Immigration and Customs Enforcement (US)')
INSERT [dbo].[OrgFacets] ([Id], [ArticleId], [Facet]) VALUES (22, 1166, N'Columbia University')
INSERT [dbo].[OrgFacets] ([Id], [ArticleId], [Facet]) VALUES (23, 1167, N'Centers for Disease Control and Prevention')
INSERT [dbo].[OrgFacets] ([Id], [ArticleId], [Facet]) VALUES (24, 1167, N'Advisory Committee on Immunization Practices')
INSERT [dbo].[OrgFacets] ([Id], [ArticleId], [Facet]) VALUES (25, 1168, N'United States Army')
INSERT [dbo].[OrgFacets] ([Id], [ArticleId], [Facet]) VALUES (26, 1169, N'Defense Department')
INSERT [dbo].[OrgFacets] ([Id], [ArticleId], [Facet]) VALUES (27, 1169, N'Senate Committee on Appropriations')
INSERT [dbo].[OrgFacets] ([Id], [ArticleId], [Facet]) VALUES (28, 1170, N'Beach Boys')
INSERT [dbo].[OrgFacets] ([Id], [ArticleId], [Facet]) VALUES (29, 1171, N'Beach Boys')
INSERT [dbo].[OrgFacets] ([Id], [ArticleId], [Facet]) VALUES (30, 1173, N'Democratic National Committee')
INSERT [dbo].[OrgFacets] ([Id], [ArticleId], [Facet]) VALUES (31, 1173, N'Democratic Party')
INSERT [dbo].[OrgFacets] ([Id], [ArticleId], [Facet]) VALUES (32, 1174, N'Harvard Business School')
INSERT [dbo].[OrgFacets] ([Id], [ArticleId], [Facet]) VALUES (33, 1174, N'Harvard Medical School')
INSERT [dbo].[OrgFacets] ([Id], [ArticleId], [Facet]) VALUES (34, 1174, N'Harvard University')
INSERT [dbo].[OrgFacets] ([Id], [ArticleId], [Facet]) VALUES (35, 1174, N'Ivy League')
INSERT [dbo].[OrgFacets] ([Id], [ArticleId], [Facet]) VALUES (36, 1175, N'All-American Girls Professional Baseball League')
INSERT [dbo].[OrgFacets] ([Id], [ArticleId], [Facet]) VALUES (37, 1177, N'National Guard')
INSERT [dbo].[OrgFacets] ([Id], [ArticleId], [Facet]) VALUES (38, 1177, N'United States Marine Corps')
INSERT [dbo].[OrgFacets] ([Id], [ArticleId], [Facet]) VALUES (39, 1178, N'World Bank')
INSERT [dbo].[OrgFacets] ([Id], [ArticleId], [Facet]) VALUES (40, 1179, N'United Nations Population Fund')
INSERT [dbo].[OrgFacets] ([Id], [ArticleId], [Facet]) VALUES (41, 1179, N'United Nations')
INSERT [dbo].[OrgFacets] ([Id], [ArticleId], [Facet]) VALUES (42, 1180, N'Police Service of Northern Ireland')
INSERT [dbo].[OrgFacets] ([Id], [ArticleId], [Facet]) VALUES (43, 1181, N'Defense Department')
INSERT [dbo].[OrgFacets] ([Id], [ArticleId], [Facet]) VALUES (44, 1181, N'United States Navy')
SET IDENTITY_INSERT [dbo].[OrgFacets] OFF
GO
SET IDENTITY_INSERT [dbo].[PerFacets] ON 

INSERT [dbo].[PerFacets] ([Id], [ArticleId], [Facet]) VALUES (1, 1158, N'Biden, Joseph R Jr')
INSERT [dbo].[PerFacets] ([Id], [ArticleId], [Facet]) VALUES (2, 1158, N'Greer, Jamieson L')
INSERT [dbo].[PerFacets] ([Id], [ArticleId], [Facet]) VALUES (3, 1158, N'Trump, Donald J')
INSERT [dbo].[PerFacets] ([Id], [ArticleId], [Facet]) VALUES (4, 1159, N'Johnson, Ron (1955- )')
INSERT [dbo].[PerFacets] ([Id], [ArticleId], [Facet]) VALUES (5, 1159, N'Tillis, Thomas R')
INSERT [dbo].[PerFacets] ([Id], [ArticleId], [Facet]) VALUES (6, 1159, N'Trump, Donald J')
INSERT [dbo].[PerFacets] ([Id], [ArticleId], [Facet]) VALUES (7, 1161, N'Trump, Donald J')
INSERT [dbo].[PerFacets] ([Id], [ArticleId], [Facet]) VALUES (8, 1162, N'Netanyahu, Benjamin')
INSERT [dbo].[PerFacets] ([Id], [ArticleId], [Facet]) VALUES (9, 1164, N'Newsom, Gavin')
INSERT [dbo].[PerFacets] ([Id], [ArticleId], [Facet]) VALUES (10, 1164, N'Trump, Donald J')
INSERT [dbo].[PerFacets] ([Id], [ArticleId], [Facet]) VALUES (11, 1165, N'Trump, Donald J')
INSERT [dbo].[PerFacets] ([Id], [ArticleId], [Facet]) VALUES (12, 1166, N'Khalil, Mahmoud (Activist)')
INSERT [dbo].[PerFacets] ([Id], [ArticleId], [Facet]) VALUES (13, 1166, N'Trump, Donald J')
INSERT [dbo].[PerFacets] ([Id], [ArticleId], [Facet]) VALUES (14, 1167, N'Kennedy, Robert F Jr')
INSERT [dbo].[PerFacets] ([Id], [ArticleId], [Facet]) VALUES (15, 1167, N'Fauci, Anthony S')
INSERT [dbo].[PerFacets] ([Id], [ArticleId], [Facet]) VALUES (16, 1167, N'Kulldorff, Martin')
INSERT [dbo].[PerFacets] ([Id], [ArticleId], [Facet]) VALUES (17, 1167, N'Malone, Robert (1959- )')
INSERT [dbo].[PerFacets] ([Id], [ArticleId], [Facet]) VALUES (18, 1168, N'Trump, Donald J')
INSERT [dbo].[PerFacets] ([Id], [ArticleId], [Facet]) VALUES (19, 1168, N'Lee, Robert E')
INSERT [dbo].[PerFacets] ([Id], [ArticleId], [Facet]) VALUES (20, 1169, N'Hegseth, Pete')
INSERT [dbo].[PerFacets] ([Id], [ArticleId], [Facet]) VALUES (21, 1169, N'McConnell, Mitch')
INSERT [dbo].[PerFacets] ([Id], [ArticleId], [Facet]) VALUES (22, 1169, N'Trump, Donald J')
INSERT [dbo].[PerFacets] ([Id], [ArticleId], [Facet]) VALUES (23, 1169, N'Caine, John Daniel (1968- )')
INSERT [dbo].[PerFacets] ([Id], [ArticleId], [Facet]) VALUES (24, 1170, N'Wilson, Brian (1942- )')
INSERT [dbo].[PerFacets] ([Id], [ArticleId], [Facet]) VALUES (25, 1170, N'Wilson, Dennis (1944-92)')
INSERT [dbo].[PerFacets] ([Id], [ArticleId], [Facet]) VALUES (26, 1170, N'Wilson, Carl')
INSERT [dbo].[PerFacets] ([Id], [ArticleId], [Facet]) VALUES (27, 1170, N'Parks, Van Dyke')
INSERT [dbo].[PerFacets] ([Id], [ArticleId], [Facet]) VALUES (28, 1170, N'Love, Mike')
INSERT [dbo].[PerFacets] ([Id], [ArticleId], [Facet]) VALUES (29, 1171, N'Wilson, Brian (1942- )')
INSERT [dbo].[PerFacets] ([Id], [ArticleId], [Facet]) VALUES (30, 1172, N'Weinstein, Harvey')
INSERT [dbo].[PerFacets] ([Id], [ArticleId], [Facet]) VALUES (31, 1172, N'Farber, Curtis')
INSERT [dbo].[PerFacets] ([Id], [ArticleId], [Facet]) VALUES (32, 1173, N'Hogg, David')
INSERT [dbo].[PerFacets] ([Id], [ArticleId], [Facet]) VALUES (33, 1173, N'Martin, Ken (1973- )')
INSERT [dbo].[PerFacets] ([Id], [ArticleId], [Facet]) VALUES (34, 1173, N'Kenyatta, Malcolm')
INSERT [dbo].[PerFacets] ([Id], [ArticleId], [Facet]) VALUES (35, 1174, N'Kahlenberg, Richard D')
INSERT [dbo].[PerFacets] ([Id], [ArticleId], [Facet]) VALUES (36, 1174, N'Summers, Lawrence H')
INSERT [dbo].[PerFacets] ([Id], [ArticleId], [Facet]) VALUES (37, 1174, N'Trump, Donald J')
INSERT [dbo].[PerFacets] ([Id], [ArticleId], [Facet]) VALUES (38, 1175, N'Jochum, Betsy (1921-2025)')
INSERT [dbo].[PerFacets] ([Id], [ArticleId], [Facet]) VALUES (39, 1176, N'Olmert, Ehud')
INSERT [dbo].[PerFacets] ([Id], [ArticleId], [Facet]) VALUES (40, 1177, N'Trump, Donald J')
INSERT [dbo].[PerFacets] ([Id], [ArticleId], [Facet]) VALUES (41, 1181, N'Trump, Donald J')
INSERT [dbo].[PerFacets] ([Id], [ArticleId], [Facet]) VALUES (42, 1181, N'Biden, Joseph R Jr')
SET IDENTITY_INSERT [dbo].[PerFacets] OFF
GO
ALTER TABLE [dbo].[Articles] ADD  DEFAULT (getdate()) FOR [ApiCallTimestamp]
GO
ALTER TABLE [dbo].[DesFacets]  WITH CHECK ADD FOREIGN KEY([ArticleId])
REFERENCES [dbo].[Articles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[GeoFacets]  WITH CHECK ADD FOREIGN KEY([ArticleId])
REFERENCES [dbo].[Articles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Multimedia]  WITH CHECK ADD FOREIGN KEY([ArticleId])
REFERENCES [dbo].[Articles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrgFacets]  WITH CHECK ADD FOREIGN KEY([ArticleId])
REFERENCES [dbo].[Articles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PerFacets]  WITH CHECK ADD FOREIGN KEY([ArticleId])
REFERENCES [dbo].[Articles] ([Id])
ON DELETE CASCADE
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllArticles]    Script Date: 12-06-2025 10:38:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Stored Procedure to get all articles with related data
CREATE PROCEDURE [dbo].[sp_GetAllArticles]
AS
BEGIN
    SELECT 
        a.Id,
        a.Section,
        a.Subsection,
        a.Title,
        a.Abstract,
        a.Url,
        a.Uri,
        a.Byline,
        a.ItemType,
        a.UpdatedDate,
        a.CreatedDate,
        a.PublishedDate,
        a.MaterialTypeFacet,
        a.Kicker,
        a.ShortUrl,
        a.ApiCallTimestamp
    FROM Articles a
    ORDER BY a.CreatedDate DESC
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetCountArticleByUri]    Script Date: 12-06-2025 10:38:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   proc [dbo].[sp_GetCountArticleByUri]
  @Uri NVARCHAR(500)
  as
	begin
		select Count(1) as ArticleCount from [TopStoriesDb1].[dbo].[Articles] where Uri = @Uri
	end
GO
/****** Object:  StoredProcedure [dbo].[sp_GetFacetsByArticleId]    Script Date: 12-06-2025 10:38:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Stored Procedure to get all facets by article ID
CREATE PROCEDURE [dbo].[sp_GetFacetsByArticleId]
    @ArticleId INT
AS
BEGIN
    SELECT 'des' as FacetType, Facet FROM DesFacets WHERE ArticleId = @ArticleId
    UNION ALL
    SELECT 'org' as FacetType, Facet FROM OrgFacets WHERE ArticleId = @ArticleId
    UNION ALL
    SELECT 'per' as FacetType, Facet FROM PerFacets WHERE ArticleId = @ArticleId
    UNION ALL
    SELECT 'geo' as FacetType, Facet FROM GeoFacets WHERE ArticleId = @ArticleId
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetMultimediaByArticleId]    Script Date: 12-06-2025 10:38:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Stored Procedure to get multimedia by article ID
CREATE PROCEDURE [dbo].[sp_GetMultimediaByArticleId]
    @ArticleId INT
AS
BEGIN
    SELECT * FROM Multimedia WHERE ArticleId = @ArticleId
END
GO
/****** Object:  StoredProcedure [dbo].[sp_SaveArticle]    Script Date: 12-06-2025 10:38:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_SaveArticle]
    @Section NVARCHAR(100),
    @Subsection NVARCHAR(100),
    @Title NVARCHAR(500),
    @Abstract NVARCHAR(MAX),
    @Url NVARCHAR(1000),
    @Uri NVARCHAR(500),
    @Byline NVARCHAR(200),
    @ItemType NVARCHAR(50),
    @UpdatedDate DATETIME2,
    @CreatedDate DATETIME2,
    @PublishedDate DATETIME2,
    @MaterialTypeFacet NVARCHAR(100),
    @Kicker NVARCHAR(200),
    @ShortUrl NVARCHAR(500),
    @ArticleId INT OUTPUT
AS
BEGIN
    INSERT INTO Articles (Section, Subsection, Title, Abstract, Url, Uri, Byline, ItemType, 
                         UpdatedDate, CreatedDate, PublishedDate, MaterialTypeFacet, Kicker, ShortUrl)
    VALUES (@Section, @Subsection, @Title, @Abstract, @Url, @Uri, @Byline, @ItemType,
            @UpdatedDate, @CreatedDate, @PublishedDate, @MaterialTypeFacet, @Kicker, @ShortUrl)
    
    SET @ArticleId = SCOPE_IDENTITY()
END
GO
/****** Object:  StoredProcedure [dbo].[sp_SaveDesFacet]    Script Date: 12-06-2025 10:38:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Stored Procedures for facets
CREATE PROCEDURE [dbo].[sp_SaveDesFacet]
    @ArticleId INT,
    @Facet NVARCHAR(200)
AS
BEGIN
    INSERT INTO DesFacets (ArticleId, Facet) VALUES (@ArticleId, @Facet)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_SaveGeoFacet]    Script Date: 12-06-2025 10:38:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_SaveGeoFacet]
    @ArticleId INT,
    @Facet NVARCHAR(200)
AS
BEGIN
    INSERT INTO GeoFacets (ArticleId, Facet) VALUES (@ArticleId, @Facet)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_SaveMultimedia]    Script Date: 12-06-2025 10:38:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Stored Procedure to save multimedia
CREATE PROCEDURE [dbo].[sp_SaveMultimedia]
    @ArticleId INT,
    @Url NVARCHAR(1000),
    @Format NVARCHAR(100),
    @Height INT,
    @Width INT,
    @Type NVARCHAR(50),
    @Subtype NVARCHAR(50),
    @Caption NVARCHAR(MAX),
    @Copyright NVARCHAR(200)
AS
BEGIN
    INSERT INTO Multimedia (ArticleId, Url, Format, Height, Width, Type, Subtype, Caption, Copyright)
    VALUES (@ArticleId, @Url, @Format, @Height, @Width, @Type, @Subtype, @Caption, @Copyright)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_SaveOrgFacet]    Script Date: 12-06-2025 10:38:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_SaveOrgFacet]
    @ArticleId INT,
    @Facet NVARCHAR(200)
AS
BEGIN
    INSERT INTO OrgFacets (ArticleId, Facet) VALUES (@ArticleId, @Facet)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_SavePerFacet]    Script Date: 12-06-2025 10:38:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_SavePerFacet]
    @ArticleId INT,
    @Facet NVARCHAR(200)
AS
BEGIN
    INSERT INTO PerFacets (ArticleId, Facet) VALUES (@ArticleId, @Facet)
END
GO
USE [master]
GO
ALTER DATABASE [TopStoriesDb1] SET  READ_WRITE 
GO
