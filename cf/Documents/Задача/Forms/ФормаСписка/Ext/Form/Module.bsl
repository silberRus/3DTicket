﻿
&НаСервереБезКонтекста
Процедура УстановитьСтатусы(ВыбСтатус, ВбЗадачи)
	
	Документы.Задача.УстановитьСтатусыЗадач(ВыбСтатус, ВбЗадачи);
	
КонецПроцедуры

&НаКлиенте
Процедура ВыбранСтатусДляУстановки(ВыбСтатус, ДопПараметры) Экспорт
	
	Если ВыбСтатус <> Неопределено Тогда
		
		ВыбЗадачи = Новый Массив;
		Для Каждого Ссылка Из Элементы.Список.ВыделенныеСтроки Цикл ВыбЗадачи.Добавить(Ссылка) КонецЦикла;
		
		УстановитьСтатусы(ВыбСтатус, ВыбЗадачи);
		Элементы.Список.Обновить();
		
	КонецЕсли;
	
КонецПроцедуры

&НаКлиенте
Процедура УстановитьСтатус(Команда)
	
	ОткрытьФорму("Справочник.СтатусыЗадач.ФормаВыбора", , ЭтаФорма,,,,Новый ОписаниеОповещения("ВыбранСтатусДляУстановки", ЭтаФорма), РежимОткрытияОкнаФормы.БлокироватьОкноВладельца);
	
КонецПроцедуры

&НаКлиенте
Процедура ВсеРеквизиты(Команда)
	
	ОткрытьФорму("Документ.Задача.Форма.ФормаВсеРеквизиты", Новый Структура("Ключ", Элементы.Список.ТекущаяСтрока));
	
КонецПроцедуры
