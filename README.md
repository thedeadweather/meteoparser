Прогноз погоды
======

Учебная консольная программа, позволяющая получать прогноз погоды для разных городов.
Данные берем из XML [метеосервиса](http://www.meteoservice.ru/)  
Пример работы:
```
Вырите город, для которого показать прогноз погоды
0: Москва
1: Пермь
2: Санкт-Петербург
3: Новосибирск
4: Орел
5: Чита
6: Братск
7: Краснодар
0
Москва

16 08 2020, день
16..20, ветер 3 м/с, Пасмурно

16 08 2020, вечер
16..19, ветер 3 м/с, Пасмурно

17 08 2020, ночь
14..16, ветер 4 м/с, Пасмурно

17 08 2020, утро
14..19, ветер 6 м/с, Малооблачно
```
___

Программа написана на Ruby  
Для запуска необходимо перейти в терминале в каталог с программой и запустить ее следующей командой:
```
$ ruby meteoservice.rb
```
___

Программа создана в рамках учебного проекта ["Хороший программист"](https://goodprogrammer.ru) 
