USE [Airport]
GO

/*Определить среднее рассчетное время полета для самолета 'CУ-24' для международных перевозок
(Airbus  A320) 
среднее рассчетное время полета - усредненное время в полете (по расписанию)?

Выбрать марку самолета, которая чаще всего используется на внутренних рейсах.

Выбрать маршрут/маршруты, по которым чаще всего летают рейсы, заполненные менее, чем на 70%.
(находим *вылеты, заполненные <70%, затем выбираем самый популярный маршрут)

Определить наличие свободных мест на рейс №354 23 августа 2004г.*/


/*1*/
SELECT (AVG(DATEDIFF(minute, [Расписание по дням недели].[Время отправления],[Расписание по дням недели].[Время прибытия]))-AVG(DATEDIFF(minute, [Расписание по дням недели].[Время отправления],[Расписание по дням недели].[Время прибытия]))%60)/60 'часов',
AVG(DATEDIFF(minute, [Расписание по дням недели].[Время отправления],[Расписание по дням недели].[Время прибытия]))%60 'минут'
FROM [Марки самолетов], [Самолет], [Вылеты], [Расписание по дням недели], [Рейсы], [Маршрут], [Типы маршрутов]
WHERE [Марки самолетов].[Название]='Airbus  A320'
AND [Марки самолетов].[ID марки]=[Самолет].[Марка ID]
AND [Самолет].[ID самолета]=[Вылеты].[ID самолета]
AND [Вылеты].[ID рейса]=[Рейсы].[ID рейса]
AND [Вылеты].[ID расписания по дням недели]=[Расписание по дням недели].[ID расписания по дням недели]
AND [Рейсы].[ID маршрута]=[Маршрут].[ID маршрута]
AND [Маршрут].[ID типа]=[Типы маршрутов].[ID типа]
AND [Типы маршрутов].[Название типа]='Внутренний'

/*2*/
SELECT table1.[Название]
FROM (
		SELECT COUNT(tmp3.[Номер рейса]) 'кол-во внутренних рейсов', [Название]
		FROM (
			SELECT [Марки самолетов].[Название], [Рейсы].[Номер рейса]
			FROM [Марки самолетов], [Самолет], [Вылеты], [Рейсы], [Маршрут], [Типы маршрутов]
			WHERE [Марки самолетов].[ID марки]=[Самолет].[Марка ID]
			AND [Самолет].[ID самолета]=[Вылеты].[ID самолета]
			AND [Вылеты].[ID рейса]=[Рейсы].[ID рейса]
			AND [Рейсы].[ID маршрута]=[Маршрут].[ID маршрута]
			AND [Маршрут].[ID типа]=[Типы маршрутов].[ID типа]
			AND [Типы маршрутов].[Название типа]='внутренний'
			) tmp3
		GROUP BY tmp3.[Название]
		) table1 

WHERE	table1.[кол-во внутренних рейсов]=
	(SELECT MAX([кол-во внутренних рейсов]) as 'макс'
	FROM (
		SELECT COUNT(tmp.[Номер рейса]) 'кол-во внутренних рейсов', [Название]
		FROM (
			SELECT [Марки самолетов].[Название], [Рейсы].[Номер рейса]
			FROM [Марки самолетов], [Самолет], [Вылеты], [Рейсы], [Маршрут], [Типы маршрутов]
			WHERE [Марки самолетов].[ID марки]=[Самолет].[Марка ID]
			AND [Самолет].[ID самолета]=[Вылеты].[ID самолета]
			AND [Вылеты].[ID рейса]=[Рейсы].[ID рейса]
			AND [Рейсы].[ID маршрута]=[Маршрут].[ID маршрута]
			AND [Маршрут].[ID типа]=[Типы маршрутов].[ID типа]
			AND [Типы маршрутов].[Название типа]='внутренний'
			) tmp
		GROUP BY tmp.[Название]
		) tmp2
	 ) 

/*3*/
SELECT tmp4.[ID маршрута], tmp4.[КОЛ-ВО ВЫЛЕТОВ, заполн. <70%]
FROM 

(SELECT [tmp3].[ID маршрута], count([tmp3].[ID маршрута]) AS 'КОЛ-ВО ВЫЛЕТОВ, заполн. <70%'
	FROM 
		(SELECT  [Маршрут].[ID маршрута]
		FROM [Маршрут],

			(SELECT [Маршрут].[ID маршрута], [tmp].[ID вылета]
			FROM [Маршрут], [Рейсы],
				(SELECT [Вылеты].[ID вылета], [Вылеты].[ID рейса]
				FROM [Вылеты], [Самолет], [Марки самолетов]
				WHERE [Вылеты].[ID самолета]=[Самолет].[ID самолета]
				AND [Самолет].[Марка ID]=[Марки самолетов].[ID марки]
				AND (CAST([Вылеты].[Кол-во проданных билетов] as float)/CAST([Марки самолетов].[Число мест] as FLOAT))<0.95
				) tmp
			WHERE [Маршрут].[ID маршрута]=[Рейсы].[ID маршрута]
			AND [Рейсы].[ID рейса]=[tmp].[ID рейса]
			/*GROUP BY [Маршрут].[ID маршрута]*/
			) tmp2 /*это ID маршрутов вылетов, удовл условию <0.7*/

		WHERE [Маршрут].[ID маршрута]=[tmp2].[ID маршрута]
		) tmp3 /* это ID маршрутов вылетов, удовл условию <0.7 */

	grOUP BY [tmp3].[ID маршрута]
	) tmp4

WHERE tmp4.[КОЛ-ВО ВЫЛЕТОВ, заполн. <70%]=

(SELECT MAX(tmp4.[КОЛ-ВО ВЫЛЕТОВ, заполн. <70%])
FROM
	(SELECT [tmp3].[ID маршрута], count([tmp3].[ID маршрута]) AS 'КОЛ-ВО ВЫЛЕТОВ, заполн. <70%'
	FROM 
		(SELECT [Маршрут].[ID маршрута]
		FROM  [Маршрут],

			(SELECT [Маршрут].[ID маршрута], [tmp].[ID вылета]
			FROM [Маршрут], [Рейсы],
				(SELECT [Вылеты].[ID вылета], [Вылеты].[ID рейса]
				FROM [Вылеты], [Самолет], [Марки самолетов]
				WHERE [Вылеты].[ID самолета]=[Самолет].[ID самолета]
				AND [Самолет].[Марка ID]=[Марки самолетов].[ID марки]
				AND (CAST([Вылеты].[Кол-во проданных билетов] as float)/CAST([Марки самолетов].[Число мест] as FLOAT))<0.95
				) tmp
			WHERE [Маршрут].[ID маршрута]=[Рейсы].[ID маршрута]
			AND [Рейсы].[ID рейса]=[tmp].[ID рейса]
			/*GROUP BY [Маршрут].[ID маршрута]*/
			) tmp2 /*это ID маршрутов вылетов, удовл условию <0.7*/

		WHERE [Маршрут].[ID маршрута]=[tmp2].[ID маршрута]
		) tmp3 /* это ID маршрутов вылетов, удовл условию <0.7 */

	grOUP BY [tmp3].[ID маршрута]
	) tmp4
)
