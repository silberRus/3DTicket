﻿
Процедура ОбработкаЗаполнения(ДанныеЗаполнения, ТекстЗаполнения, СтандартнаяОбработка)
	
	ТипДанных = ТипЗнч(ДанныеЗаполнения);
	
	Если ТипДанных = Тип("Структура") Тогда
		КонвертацияТипов.ЗаполнитьОбъектПоСтруктуреОснованию(ЭтотОбъект, ДанныеЗаполнения); КонецЕсли;
	
КонецПроцедуры

Процедура ОбработкаПроведения(Отказ, РежимПроведения)
	
	Движения.ЗатраченноеВремя.Очистить();
	Движения.ПодтвержденноеВремя.Очистить();
	
	Для Каждого Строка Из Задачи Цикл
		Если Строка.Согласовано Тогда
		
			Запись = Движения.ЗатраченноеВремя.Добавить();
			Запись.ВидДвижения 	= ВидДвиженияНакопления.Расход;
			Запись.Период 		= Дата;
			Запись.Проект 		= Проект;
			Запись.Пользователь = Строка.Исполнитель;
			Запись.Задача 		= Строка.Задача;
			Запись.Секунд 		= Строка.Секунд;
			Запись.Сумма 		= Строка.Сумма;
		
			Запись = Движения.ПодтвержденноеВремя.Добавить();
			Запись.ВидДвижения 	= ВидДвиженияНакопления.Приход;
			Запись.Период 		= Дата;
			Запись.Проект 		= Проект;
			Запись.Пользователь = Строка.Исполнитель;
			Запись.Задача 		= Строка.Задача;
			Запись.Сумма 		= Строка.Сумма; КонецЕсли; КонецЦикла;
	
	Движения.ЗатраченноеВремя.Записать();
	Движения.ПодтвержденноеВремя.Записать();
	
КонецПроцедуры

Процедура ПриУстановкеНовогоНомера(СтандартнаяОбработка, Префикс)
	
	Префикс = Проект.Префикс;
	
КонецПроцедуры
