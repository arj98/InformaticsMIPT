USE [Airport]
GO

ALTER TABLE [Расписание по дням недели]  
ADD CONSTRAINT [АК_Расписание по дням недели] UNIQUE ([ID расписания], [ID дня недели])   
GO 

ALTER TABLE [Страны]  
ADD CONSTRAINT [АК_Страны] UNIQUE ([Название])   
GO 

INSERT INTO [Страны] ([ID страны],[Название]) VALUES 
(1,'Россия'),
(2,'Франция'),
(3,'Италия'),
(4,'Казахстан'),
(5,'Норвегия'),
(6,'Турция'),
(7,'Латвия'),
(8,'Чехия'),
(9,'Германия'),
(10,'Швейцария'),
(11,'Китай');

DELETE FROM [Страны]