﻿
Функция ЗадачиПолучить(Запрос) Экспорт
	
	Ответ = Новый HTTPСервисОтвет(200);
	
	Запрос = Новый Запрос("ВЫБРАТЬ РАЗРЕШЕННЫЕ Ссылка guid, Номер num, Дата date, Наименование name, Факт mass, План plan, Сумма sum ИЗ Документ.Задача УПОРЯДОЧИТЬ ПО Дата Убыв");
	
	Ответ.УстановитьТелоИзСтроки(json.toString(КонвертацияТипов.ПолучитьМассивИзТаблицыЗначений(Запрос.Выполнить().Выгрузить())));
	Возврат Ответ;
	
КонецФункции