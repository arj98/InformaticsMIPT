USE [Airport]
GO

/*DELETE FROM [Контракты]*/

INSERT INTO [Контракты] ([Дата заключения], [Дата разрыва], [ID сотрудника], [ID должности]) VALUES 
('2014/10/10', '2019/05/06', 
	(
	SELECT [ID сотрудника]
	FROM [Сотрудники экипажа]
	WHERE [Фамилия]='Нуряев'
	AND [Имя]='Петр'
	),
	(
	SELECT [ID должности]
	FROM [Должности]
	WHERE [Название]='Капитан воздушного судна'
	)
),
('2012/06/15', '2014/10/10', 
	(
	SELECT [ID сотрудника]
	FROM [Сотрудники экипажа]
	WHERE [Фамилия]='Нуряев'
	AND [Имя]='Петр'
	),
	(
	SELECT [ID должности]
	FROM [Должности]
	WHERE [Название]='Второй пилот'
	)
),
('2014/05/10', '2019/05/09', 
	(
	SELECT [ID сотрудника]
	FROM [Сотрудники экипажа]
	WHERE [Фамилия]='Апевалов'
	AND [Имя]='Лавр'
	),
	(
	SELECT [ID должности]
	FROM [Должности]
	WHERE [Название]='Бортпроводник'
	)
),
('2014/05/25', '2019/05/24', 
	(
	SELECT [ID сотрудника]
	FROM [Сотрудники экипажа]
	WHERE [Фамилия]='Ромазанова'
	AND [Имя]='Ева'
	),
	(
	SELECT [ID должности]
	FROM [Должности]
	WHERE [Название]='Бортпроводник'
	)
),
('2015/09/11', '2019/09/10', 
	(
	SELECT [ID сотрудника]
	FROM [Сотрудники экипажа]
	WHERE [Фамилия]='Устимовича'
	AND [Имя]='Юнона'
	),
	(
	SELECT [ID должности]
	FROM [Должности]
	WHERE [Название]='Бортпроводник'
	)
),
('2013/07/12', '2018/07/11', 
	(
	SELECT [ID сотрудника]
	FROM [Сотрудники экипажа]
	WHERE [Фамилия]='Тизенгаузен'
	AND [Имя]='Гавриил'
	),
	(
	SELECT [ID должности]
	FROM [Должности]
	WHERE [Название]='Бортпроводник'
	)
),
('2017/06/14', '2022/06/13', 
	(
	SELECT [ID сотрудника]
	FROM [Сотрудники экипажа]
	WHERE [Фамилия]='Пищальников'
	AND [Имя]='Давид'
	),
	(
	SELECT [ID должности]
	FROM [Должности]
	WHERE [Название]='Второй пилот'
	)
),
('2018/06/19', '2023/06/18', 
	(
	SELECT [ID сотрудника]
	FROM [Сотрудники экипажа]
	WHERE [Фамилия]='Весовой'
	AND [Имя]='Юрий'
	),
	(
	SELECT [ID должности]
	FROM [Должности]
	WHERE [Название]='Инженер'
	)
),
('2017/08/14', '2018/06/19', 
	(
	SELECT [ID сотрудника]
	FROM [Сотрудники экипажа]
	WHERE [Фамилия]='Весовой'
	AND [Имя]='Юрий'
	),
	(
	SELECT [ID должности]
	FROM [Должности]
	WHERE [Название]='Второй пилот'
	)
),
('2009/12/14', '2012/03/22', 
	(
	SELECT [ID сотрудника]
	FROM [Сотрудники экипажа]
	WHERE [Фамилия]='Телицына'
	AND [Имя]='Агата'
	),
	(
	SELECT [ID должности]
	FROM [Должности]
	WHERE [Название]='Бортпроводник'
	)
),

('2015/02/10', NULL, 
	(
	SELECT [ID сотрудника]
	FROM [Сотрудники экипажа]
	WHERE [Фамилия]='Якунова'
	AND [Имя]='Регина'
	),
	(
	SELECT [ID должности]
	FROM [Должности]
	WHERE [Название]='Капитан воздушного судна'
	)
),
('2011/06/22', '2013/10/16', 
	(
	SELECT [ID сотрудника]
	FROM [Сотрудники экипажа]
	WHERE [Фамилия]='Дырбов'
	AND [Имя]='Евдоким'
	),
	(
	SELECT [ID должности]
	FROM [Должности]
	WHERE [Название]='Второй пилот'
	)
),
('2008/11/12', '2013/05/11', 
	(
	SELECT [ID сотрудника]
	FROM [Сотрудники экипажа]
	WHERE [Фамилия]='Хомколова'
	AND [Имя]='Владислава'
	),
	(
	SELECT [ID должности]
	FROM [Должности]
	WHERE [Название]='Бортпроводник'
	)
),
('2010/09/25', '2017/01/30', 
	(
	SELECT [ID сотрудника]
	FROM [Сотрудники экипажа]
	WHERE [Фамилия]='Ясаев'
	AND [Имя]='Василий'
	),
	(
	SELECT [ID должности]
	FROM [Должности]
	WHERE [Название]='Бортпроводник'
	)
),
('2016/07/11', '2021/07/10', 
	(
	SELECT [ID сотрудника]
	FROM [Сотрудники экипажа]
	WHERE [Фамилия]='Ухтомский'
	AND [Имя]='Адриан'
	),
	(
	SELECT [ID должности]
	FROM [Должности]
	WHERE [Название]='Бортпроводник'
	)
),
('2015/08/17', '2018/10/25', 
	(
	SELECT [ID сотрудника]
	FROM [Сотрудники экипажа]
	WHERE [Фамилия]='Ожегова'
	AND [Имя]='Пелагея'
	),
	(
	SELECT [ID должности]
	FROM [Должности]
	WHERE [Название]='Бортпроводник'
	)
),
('2017/12/14', '2022/12/13', 
	(
	SELECT [ID сотрудника]
	FROM [Сотрудники экипажа]
	WHERE [Фамилия]='Любова'
	AND [Имя]='Оксана'
	),
	(
	SELECT [ID должности]
	FROM [Должности]
	WHERE [Название]='Второй пилот'
	)
),
('2017/05/19', '2022/05/18', 
	(
	SELECT [ID сотрудника]
	FROM [Сотрудники экипажа]
	WHERE [Фамилия]='Локтев'
	AND [Имя]='Терентий'
	),
	(
	SELECT [ID должности]
	FROM [Должности]
	WHERE [Название]='Инженер'
	)
),
('2013/08/14', '2018/08/13', 
	(
	SELECT [ID сотрудника]
	FROM [Сотрудники экипажа]
	WHERE [Фамилия]='Эристов'
	AND [Имя]='Тимофей'
	),
	(
	SELECT [ID должности]
	FROM [Должности]
	WHERE [Название]='Второй пилот'
	)
),
('2007/11/14', '2012/01/22', 
	(
	SELECT [ID сотрудника]
	FROM [Сотрудники экипажа]
	WHERE [Фамилия]='Стрельникова'
	AND [Имя]='Алла'
	),
	(
	SELECT [ID должности]
	FROM [Должности]
	WHERE [Название]='Бортпроводник'
	)
),

('2013/10/24', '2018/10/23', 
	(
	SELECT [ID сотрудника]
	FROM [Сотрудники экипажа]
	WHERE [Фамилия]='Барсов'
	AND [Имя]='Феликс'
	),
	(
	SELECT [ID должности]
	FROM [Должности]
	WHERE [Название]='Капитан воздушного судна'
	)
),
('2016/04/19', '2021/04/18', 
	(
	SELECT [ID сотрудника]
	FROM [Сотрудники экипажа]
	WHERE [Фамилия]='Яцко'
	AND [Имя]='Алексей'
	),
	(
	SELECT [ID должности]
	FROM [Должности]
	WHERE [Название]='Инженер'
	)
),
('2015/03/11', '2020/03/10', 
	(
	SELECT [ID сотрудника]
	FROM [Сотрудники экипажа]
	WHERE [Фамилия]='Дюгаева'
	AND [Имя]='Агния'
	),
	(
	SELECT [ID должности]
	FROM [Должности]
	WHERE [Название]='Бортпроводник'
	)
)


INSERT INTO [Расписание рейсов] ([дата начала действия расписания], [дата окончания действия расписания], [ID рейса]) VALUES 
('2018/10/12', '2018/12/12', 
		(
		SELECT [ID рейса]
		FROM [Рейсы]
		WHERE [Номер рейса]='SU 1234'
		)
),
('2018/10/01', '2018/12/01', 
		(
		SELECT [ID рейса]
		FROM [Рейсы]
		WHERE [Номер рейса]='SU 4321'
		)
),
('2018/12/13', '2019/02/13', 
		(
		SELECT [ID рейса]
		FROM [Рейсы]
		WHERE [Номер рейса]='SU 1234'
		)
),
('2018/12/02', '2019/02/02', 
		(
		SELECT [ID рейса]
		FROM [Рейсы]
		WHERE [Номер рейса]='SU 4321'
		)
),
('2018/09/26', '2018/11/26', 
		(
		SELECT [ID рейса]
		FROM [Рейсы]
		WHERE [Номер рейса]='SU 1567'
		)
),
('2018/09/20', '2018/11/20', 
		(
		SELECT [ID рейса]
		FROM [Рейсы]
		WHERE [Номер рейса]='SU 7651'
		)
),
('2018/08/28', '2018/10/28', 
		(
		SELECT [ID рейса]
		FROM [Рейсы]
		WHERE [Номер рейса]='SU 1952'
		)
),
('2018/09/01', '2018/11/01', 
		(
		SELECT [ID рейса]
		FROM [Рейсы]
		WHERE [Номер рейса]='SU 2591'
		)
),
('2018/11/05', '2019/01/05', 
		(
		SELECT [ID рейса]
		FROM [Рейсы]
		WHERE [Номер рейса]='SU 2564'
		)
),
('2018/11/10', '2019/01/10', 
		(
		SELECT [ID рейса]
		FROM [Рейсы]
		WHERE [Номер рейса]='SU 4652'
		)
)
