USE [restaurantDB]
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ProductId], [Name], [Type], [Description], [Price], [IMG]) VALUES (2, N'番茄義大利麵', N'主食', N'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Aperiam ea laboriosam in expedita error, praesentium beatae illum eum ipsa. Dolorum, fugit nesciunt natus eum facilis maxime placeat eos enim. Error a molestias ab rem impedit nesciunt dolor alias suscipit dicta minima eaque pariatur reprehenderit consequatur voluptatum reiciendis aliquam recusandae, distinctio deleniti iusto assumenda ducimus nihil! ', 120, N'spaghetti-tomato.jpg')
INSERT [dbo].[Products] ([ProductId], [Name], [Type], [Description], [Price], [IMG]) VALUES (3, N'培根義大利麵', N'主食', N'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Aperiam ea laboriosam in expedita error, praesentium beatae illum eum ipsa. Dolorum, fugit nesciunt natus eum facilis maxime placeat eos enim. Error a molestias ab rem impedit nesciunt dolor alias suscipit dicta minima eaque pariatur reprehenderit consequatur voluptatum reiciendis aliquam recusandae, distinctio deleniti iusto assumenda ducimus nihil! ', 120, N'spaghetti-carbonara.jpg')
INSERT [dbo].[Products] ([ProductId], [Name], [Type], [Description], [Price], [IMG]) VALUES (26, N'聖代', N'副食', N'test', 80, N'sorbetti.jpg')
INSERT [dbo].[Products] ([ProductId], [Name], [Type], [Description], [Price], [IMG]) VALUES (27, N'烏龍麵', N'主食', N'test', 80, N'udon.jpg')
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230607001127_initial', N'6.0.16')
GO
