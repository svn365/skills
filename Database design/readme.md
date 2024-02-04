## Модели Данных

1. Для примеров нарисованы модели данных для нашего файлика [Dashboard](https://github.com/svn365/skills/blob/main/Excel/Dashboard.xlsx):

- Концептуальная
[концептуальная схема БД](https://github.com/svn365/skills/blob/main/Database%20design/%D1%81%D1%85%D0%B5%D0%BC%D0%B0%20%D0%BA%D0%BE%D0%BD%D1%86%D0%B5%D0%BF%D1%82.JPG)
- Логическая
[логическая схема БД](https://github.com/svn365/skills/blob/main/Database%20design/%D1%81%D1%85%D0%B5%D0%BC%D0%B0%20%D0%BB%D0%BE%D0%B3%D0%B8%D0%BA%D0%B0.JPG)
- Физическая
[физическая схема БД](https://github.com/svn365/skills/blob/main/Database%20design/%D0%A4%D0%B8%D0%B7%D0%B8%D1%87%D0%B5%D1%81%D0%BA%D0%B0%D1%8F%20%D1%81%D1%85%D0%B5%D0%BC%D0%B0%20%D0%91%D0%94.jpeg)
 Были использованы бесплатные версии [SqlDBM](https://sqldbm.com/Home/) и [DB Design](https://dbdesign.online/models) (софт для создания моделей данных баз данных).

2. После создания физической модели данных был скопирован код DDL и выполнен в SQL клиенте.
[код DDL](https://github.com/svn365/skills/blob/main/Database%20design/%D0%9A%D0%BE%D0%B4%20DDL%20%D0%B4%D0%BB%D1%8F%20%D1%84%D0%B8%D0%B7%D0%B8%D1%87%D0%B5%D1%81%D0%BA%D0%BE%D0%B9%20%D1%81%D1%85%D0%B5%D0%BC%D1%8B%20%D0%91%D0%94.sql)
 
4. Далее заполнены значениями **Dimensions** таблицы и **Sales Fact** таблицу. Сначала мы заполняем **Dimensions** таблицы, где в качестве **id** мы генерим последовательность чисел, а зачем **Sales Fact** таблицу, в которую вставляем **id** из **Dimensions** таблиц.
[код создания схемы Dim](https://github.com/svn365/skills/blob/main/Database%20design/DB%20create%20schema%20dim.sql)

