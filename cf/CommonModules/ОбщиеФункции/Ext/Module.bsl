﻿
Функция ЗаписатьИСообщитьЕслиОшибка(Объект, ДопПараметры = Неопределено) Экспорт
	
	// Записывает и сообщает если ошибка
	
	Попытка		Если ДопПараметры <> Неопределено Тогда
						Объект.Записать(ДопПараметры);
				Иначе	Объект.Записать(); КонецЕсли;
	Исключение
		Сообщить("Ошибка записи объекта " + Объект);
		Возврат Ложь; КонецПопытки;
	
	Возврат Истина;
	
КонецФункции

Функция ЗаписатьИзмененияОбъекта(Объект, Поля, ДопПараметры = Неопределено, ПоляИсключения = Неопределено) Экспорт
	
	// Функция записывает объект емли переданные поля отличаются
	// Объект 			- объект, Важно! что сравнение будет через Объект.Ссылка
	// Поля 			- структура (ключ,значение)
	// ПоляИсключения 	- строка, перечень полей через запятую которые не нужно проверять
	//
	// Возвращает ЛОЖЬ если произошла ошибка записи объекта, в остальных случаях всегда ИСТИНА
	
	массИсключений = ?(ПоляИсключения = Неопределено, Новый Массив, КонвертацияТипов.ПолучитьМассивИзСтроки(НРег(ПоляИсключения)));
	
	Изменился = Ложь;
	Для Каждого Поле Из Поля Цикл
		Если массИсключений.Найти(НРег(Поле.Ключ)) = Неопределено И объект.Ссылка[Поле.Ключ] <> Поле.Значение Тогда
			Изменился = Истина;
			объект[Поле.Ключ] = Поле.Значение; КонецЕсли; КонецЦикла;
	
	Возврат Не Изменился Или ЗаписатьИСообщитьЕслиОшибка(Объект, ДопПараметры);
	
КонецФункции

Функция ПользователюНужноСменитьПароль() Экспорт
	
	Возврат ПараметрыСеанса.ТекущийПользователь.УстановитьНовыйПарольПриВходе;

КонецФункции
Процедура УстановитьПароль(Пароль) Экспорт
	
	УстановитьПривилегированныйРежим(Истина);
	
	// Установим пароль
	
	ПользовательСистемы = ПользователиИнформационнойБазы.ТекущийПользователь();
	ПользовательСистемы.Пароль = Пароль;
	ПользовательСистемы.Записать();
	
	// Сменим требование установить пароль
	
	Спр = ПараметрыСеанса.ТекущийПользователь.ПолучитьОбъект();
	Спр.УстановитьНовыйПарольПриВходе = Ложь;
	Если Не ОбщиеФункции.ЗаписатьИСообщитьЕслиОшибка(Спр) Тогда
		ВызватьИсключение "Ошибка сброса пароля"; КонецЕсли;
	
	УстановитьПривилегированныйРежим(Ложь);
	
КонецПроцедуры

Функция ОбернутьHTML(Тело = "", Стиль = "") Экспорт
	
	Возврат СтрШаблон("<html lang=""""ru""""><head>
	|<meta http-equiv=""X-UA-Compatible"" content=""IE=10"">
	|<meta http-equiv=""Content-Type"" content=""text/html; charset=utf-8"">
	|<meta name=""GENERATOR"" content=""MSHTML 11.00.10570.1001"">
	|<style>
	|%1
	|</style>
	|</head>
	|<body>
	|%2
	|</body>
	|</html>
	|", Стиль, Тело);
	
КонецФункции

Функция представлениеВремени(Секунд) Экспорт
	
	Дней = Цел(Секунд / 86400); 
	Возврат ?(Дней, Строка(Дней) + "д. ", "") + Формат('00010101' + Секунд, "ДЛФ=T");
	
КонецФункции