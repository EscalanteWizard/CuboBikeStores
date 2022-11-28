CREATE TABLE [DimOrders](
	[OrderKey] [int] IDENTITY(1,1) NOT NULL,
	[order_id] [int] NOT NULL,
	[customer_id] [int] NOT NULL,
	[order_status] [tinyint] NOT NULL,
	[order_date] [date] NOT NULL,
	[required_date] [date] NOT NULL,
	[shipped_date] [date] NULL,
	[store_id] [int] NOT NULL,
	[staff_id] [int] NOT NULL,
	[item_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[list_price] [decimal](18, 0) NOT NULL,
	[discount] [decimal](18, 0) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [DimProducts](
	[ProductKey] [int] IDENTITY(1,1) NOT NULL,
	[product_id] [int] NOT NULL,
	[product_name] [varchar](255) NOT NULL,
	[brand_id] [int] NOT NULL,
	[brand_name] [varchar](255) NOT NULL,
	[category_id] [int] NOT NULL,
	[category_name] [varchar](255) NOT NULL,
	[model_year] [smallint] NOT NULL,
	[list_price] [decimal](10, 2) NOT NULL,
	[store_id] [int] NOT NULL,
	[quantity] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[FactSales](
	[SalesKey] [int] IDENTITY(1,1) NOT NULL,
	[ProductKey] [int] NOT NULL,
	[StoreKey] [int] NOT NULL,
	[CustomerKey] [int] NOT NULL,
	[StaffKey] [int] NOT NULL,
	[OrderKey] [int] NOT NULL,
	[OrderDateKey] [date] NOT NULL,
	[RequiredDateKey] [date] NOT NULL,
	[ShippedDateKey] [date] NOT NULL,
	[Discount] [decimal](18, 0) NULL,
	[Quantity] [int] NULL,
	[list_price] [decimal](18, 0) NULL,
PRIMARY KEY CLUSTERED 
(
	[SalesKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[FactSales]  WITH CHECK ADD FOREIGN KEY([CustomerKey])
REFERENCES [dbo].[DimCustomers] ([customer_id])
GO

ALTER TABLE [dbo].[FactSales]  WITH CHECK ADD FOREIGN KEY([OrderKey])
REFERENCES [dbo].[DimOrders] ([OrderKey])
GO

ALTER TABLE [dbo].[FactSales]  WITH CHECK ADD FOREIGN KEY([ProductKey])
REFERENCES [dbo].[DimProducts] ([ProductKey])
GO

ALTER TABLE [dbo].[FactSales]  WITH CHECK ADD FOREIGN KEY([StaffKey])
REFERENCES [dbo].[DimStaffs] ([staff_id])
GO

ALTER TABLE [dbo].[FactSales]  WITH CHECK ADD FOREIGN KEY([StoreKey])
REFERENCES [dbo].[DimStores] ([store_id])
GO

--fechas--

ALTER TABLE [dbo].[FactSales]  WITH CHECK ADD FOREIGN KEY([OrderDateKey])
REFERENCES [dbo].[DimOrders] ([Order_date])
GO

ALTER TABLE [dbo].[FactSales]  WITH CHECK ADD FOREIGN KEY([RequiredDateKey])
REFERENCES [dbo].[DimOrders] ([required_date])
GO

ALTER TABLE [dbo].[FactSales]  WITH CHECK ADD FOREIGN KEY([ShippedDateKey])
REFERENCES [dbo].[DimOrders] ([shipped_date])
