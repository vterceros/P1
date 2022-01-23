CREATE DATABASE MI_CH02
GO

USE MI_CH02
GO


CREATE TABLE [dbo].[ITEM](
	[ItemID] [INT] NOT NULL,
	[Description] [VARCHAR](255) NOT NULL,
	[PurchaseDate] [DATE] NOT NULL,
	[Store] [VARCHAR](50) NOT NULL,
	[City] [VARCHAR](35) NOT NULL,
	[Quantity] [INT] NOT NULL,
	[LocalCurrencyAmount] [NUMERIC](18, 2) NOT NULL,
	[ExchangeRate] [NUMERIC](12, 6) NOT NULL,
 CONSTRAINT [PK_ITEM] PRIMARY KEY CLUSTERED 
(
	[ItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


CREATE TABLE [dbo].[SHIPMENT](
	[ShipmentID] [INT] NOT NULL,
	[ShipperName] [VARCHAR](35) NOT NULL,
	[ShipperInvoiceNumber] [INT] NOT NULL,
	[DepartureDate] [DATE] NULL,
	[ArrivalDate] [DATE] NULL,
	[InsuredValue] [NUMERIC](12, 2) NULL,
 CONSTRAINT [PK_SHIPMENT] PRIMARY KEY CLUSTERED 
(
	[ShipmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO



CREATE TABLE [dbo].[SHIPMENT_ITEM](
	[ShipmentID] [INT] NOT NULL,
	[ShipmentItemID] [INT] NOT NULL,
	[ItemID] [INT] NOT NULL,
	[Value] [NUMERIC](12, 2) NOT NULL,
 CONSTRAINT [PK_SHIPMENT_ITEM_1] PRIMARY KEY CLUSTERED 
(
	[ShipmentID] ASC,
	[ShipmentItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[SHIPMENT_ITEM]  WITH CHECK ADD  CONSTRAINT [FK_SHIPMENT_ITEM_ITEM] FOREIGN KEY([ItemID])
REFERENCES [dbo].[ITEM] ([ItemID])
ON UPDATE CASCADE
GO

ALTER TABLE [dbo].[SHIPMENT_ITEM] CHECK CONSTRAINT [FK_SHIPMENT_ITEM_ITEM]
GO

ALTER TABLE [dbo].[SHIPMENT_ITEM]  WITH CHECK ADD  CONSTRAINT [FK_SHIPMENT_ITEM_SHIPMENT] FOREIGN KEY([ShipmentID])
REFERENCES [dbo].[SHIPMENT] ([ShipmentID])
GO

ALTER TABLE [dbo].[SHIPMENT_ITEM] CHECK CONSTRAINT [FK_SHIPMENT_ITEM_SHIPMENT]
GO





--Insert DATA

INSERT INTO dbo.ITEM
(
    ItemID,
    Description,
    PurchaseDate,
    Store,
    City,
    Quantity,
    LocalCurrencyAmount,
    ExchangeRate
)
VALUES
(   1,         -- ItemID - int
    'QE Dining Set',        -- Description - varchar(255)
    '2018-04-17', -- PurchaseDate - date
    'Eastern Treasures',        -- Store - varchar(50)
    'Manila',        -- City - varchar(35)
    2,         -- Quantity - int
    403405,      -- LocalCurrencyAmount - numeric(18, 2)
    0.01774       -- ExchangeRate - numeric(12, 6)
)
GO

INSERT INTO dbo.ITEM
(
    ItemID,
    Description,
    PurchaseDate,
    Store,
    City,
    Quantity,
    LocalCurrencyAmount,
    ExchangeRate
)
VALUES
(   2,         -- ItemID - int
    'Willow Serving Dishes',        -- Description - varchar(255)
    '2018-07-15', -- PurchaseDate - date
    'Jade Antiques',        -- Store - varchar(50)
    'Singapore',        -- City - varchar(35)
    75,         -- Quantity - int
    102,      -- LocalCurrencyAmount - numeric(18, 2)
    0.5903       -- ExchangeRate - numeric(12, 6)
)

GO	

INSERT INTO dbo.ITEM
(
    ItemID,
    Description,
    PurchaseDate,
    Store,
    City,
    Quantity,
    LocalCurrencyAmount,
    ExchangeRate
)
VALUES
(   3,         -- ItemID - int
    'Large Bureau',        -- Description - varchar(255)
    '2018-07-17', -- PurchaseDate - date
    'Eastern Sales',        -- Store - varchar(50)
    'Singapore',        -- City - varchar(35)
    8,         -- Quantity - int
    2000,      -- LocalCurrencyAmount - numeric(18, 2)
    0.5903       -- ExchangeRate - numeric(12, 6)
)
GO

INSERT dbo.ITEM
(
    ItemID,
    Description,
    PurchaseDate,
    Store,
    City,
    Quantity,
    LocalCurrencyAmount,
    ExchangeRate
)
VALUES
(   4,         -- ItemID - int
    'Brass Lamps',        -- Description - varchar(255)
    '2018-07-20', -- PurchaseDate - date
    'Jade Antiques',        -- Store - varchar(50)
    'Singapore',        -- City - varchar(35)
    40,         -- Quantity - int
    50,      -- LocalCurrencyAmount - numeric(18, 2)
    0.5903       -- ExchangeRate - numeric(12, 6)
)

GO

-- Insert DAta Shipment

INSERT INTO dbo.SHIPMENT
(
    ShipmentID,
    ShipperName,
    ShipperInvoiceNumber,
    DepartureDate,
    ArrivalDate,
    InsuredValue
)
VALUES
(   1,         -- ShipmentID - int
    'ABC Trans-Oceanic',        -- ShipperName - varchar(35)
    2017651,         -- ShipperInvoiceNumber - int
    '2017-12-10', -- DepartureDate - date
    '2018-03-15', -- ArrivalDate - date
    15000       -- InsuredValue - numeric(12, 2)
    )
GO

INSERT INTO dbo.SHIPMENT
(
    ShipmentID,
    ShipperName,
    ShipperInvoiceNumber,
    DepartureDate,
    ArrivalDate,
    InsuredValue
)
VALUES
(   2,         -- ShipmentID - int
    'ABC Trans-Oceanic',        -- ShipperName - varchar(35)
    2018012,         -- ShipperInvoiceNumber - int
    '2018-01-18', -- DepartureDate - date
    '2018-03-20', -- ArrivalDate - date
    12000       -- InsuredValue - numeric(12, 2)
    )
GO
	

INSERT INTO dbo.SHIPMENT
(
    ShipmentID,
    ShipperName,
    ShipperInvoiceNumber,
    DepartureDate,
    ArrivalDate,
    InsuredValue
)
VALUES
(   3,         -- ShipmentID - int
    'Worldwide',        -- ShipperName - varchar(35)
    49100300,         -- ShipperInvoiceNumber - int
    '2018-05-18', -- DepartureDate - date
    '2018-06-17', -- ArrivalDate - date
    20000       -- InsuredValue - numeric(12, 2)
    )
GO
	

INSERT INTO dbo.SHIPMENT
(
    ShipmentID,
    ShipperName,
    ShipperInvoiceNumber,
    DepartureDate,
    ArrivalDate,
    InsuredValue
)
VALUES
(   4,         -- ShipmentID - int
    'International',        -- ShipperName - varchar(35)
    399400,         -- ShipperInvoiceNumber - int
    '2018-06-02', -- DepartureDate - date
    '2018-07-17', -- ArrivalDate - date
    17500       -- InsuredValue - numeric(12, 2)
    )
GO

INSERT INTO dbo.SHIPMENT
(
    ShipmentID,
    ShipperName,
    ShipperInvoiceNumber,
    DepartureDate,
    ArrivalDate,
    InsuredValue
)
VALUES
(   5,         -- ShipmentID - int
    'Worldwide',        -- ShipperName - varchar(35)
    84899440,         -- ShipperInvoiceNumber - int
    '2018-07-10', -- DepartureDate - date
    '2018-07-28', -- ArrivalDate - date
    25000       -- InsuredValue - numeric(12, 2)
    )
GO
	
INSERT INTO dbo.SHIPMENT
(
    ShipmentID,
    ShipperName,
    ShipperInvoiceNumber,
    DepartureDate,
    ArrivalDate,
    InsuredValue
)
VALUES
(   6,         -- ShipmentID - int
    'International',        -- ShipperName - varchar(35)
    488955,         -- ShipperInvoiceNumber - int
    '2018-08-05', -- DepartureDate - date
    '2018-09-11', -- ArrivalDate - date
    18000		-- InsuredValue - numeric(12, 2)
    )
GO


INSERT INTO dbo.SHIPMENT_ITEM
(
    ShipmentID,
    ShipmentItemID,
    ItemID,
    Value
)
VALUES
(   3,   -- ShipmentID - int
    1,   -- ShipmentItemID - int
    1,   -- ItemID - int
    15000-- Value - numeric(12, 2)
    )
GO

INSERT INTO dbo.SHIPMENT_ITEM
(
    ShipmentID,
    ShipmentItemID,
    ItemID,
    Value
)
VALUES
(   4,   -- ShipmentID - int
    1,   -- ShipmentItemID - int
    4,   -- ItemID - int
    1200-- Value - numeric(12, 2)
    )
GO

INSERT INTO dbo.SHIPMENT_ITEM
(
    ShipmentID,
    ShipmentItemID,
    ItemID,
    Value
)
VALUES
(   4,   -- ShipmentID - int
    2,   -- ShipmentItemID - int
    3,   -- ItemID - int
    9500-- Value - numeric(12, 2)
    )
GO

INSERT INTO dbo.SHIPMENT_ITEM
(
    ShipmentID,
    ShipmentItemID,
    ItemID,
    Value
)
VALUES
(   4,   -- ShipmentID - int
    3,   -- ShipmentItemID - int
    2,   -- ItemID - int
    4500-- Value - numeric(12, 2)
    )
GO
