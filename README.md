## Добро пожаловать в мое портфолио! Здесь вы найдете коллекцию моих SQL-запросов при работе с БД.

### База данных ["Автомобили"](https://github.com/AdelinaBayanova/SQL-queries/tree/main/cars)

**1. Найти страну с максимальной капитализацией всех её производителей**

<details>
<summary>
Решение:</summary>

``` 
SELECT SUM(manufacturers.capitalization) AS summa, c.name AS country
FROM manufacturers
JOIN countries c ON c.id = manufacturers country_id
GROUP BY c.name
ORDER BY summa desc
LIMIT 1;
```
</details>

***
**2. Вывести всю доступную информацию о моделе: имя производителя, имя модели, цена, остаток, страна производства**

<details>
<summary>
Решение:</summary>

``` 
SELECT m.name AS "Имя производителя", models.name AS "Имя модели", p.value AS "Цена", q.count AS "Остаток", c.name AS "Страна производства"
FROM models
JOIN manufacturers m ON models.manufacturer_id = m.id
JOIN prices p ON models.price_id = p.id
JOIN quantity q ON models.id = q.model_id
JOIN countries c ON c.id = m.country_id;

```
</details>

***
**3. Вывести все автомобили и их продавцов, которыми занимаются сотрудники офиса ‘Laconia’**

<details>
<summary>
Решение:</summary>

``` 
SELECT models.name, s.first_name, s.last_name
FROM models
JOIN sellers s ON models.seller_id = s.id
JOIN offices o ON s.office_id = o.id
WHERE o.name = 'Laconia';
```
</details>

***
**4. Найти марку с наибольшим количеством автомобилей в системе**

<details>
<summary>
Решение:</summary>

``` 
SELECT models.name
FROM models
WHERE instock = true;
```
</details>

***
**5. Вывести среднее значение цены всех доступных к продаже автомобилей**

<details>
<summary>
Решение:</summary>

``` 
SELECT AVG(p.value)
FROM models
JOIN prices p ON p.id = models.price_id
WHERE models.instock = true;
```
</details>

***
**6. Вывести общую стоимость всех автомобилей марки ‘Horch’**

<details>
<summary>
Решение:</summary>

``` 
SELECT SUM(p.value)
FROM models
JOIN manufacturers m ON m.id = models.manufacturer_id
JOIN prices p ON p.id = models.price_id
WHERE m.name = 'Horch';
```
</details>

### База данных ["Офисная техника"](https://github.com/AdelinaBayanova/SQL-queries/tree/main/office%20equipment) 

**1. Вывести коды всех принтеров отдела Services, цена которых начинается от 270 долларов.**

<details>
<summary>
Решение:</summary>

``` 
SELECT prt.code FROM printer prt
JOIN product prd ON prd.model=prt.model
JOIN department d ON prd.department_id=d.id
WHERE d.department='Services' 
AND CAST(prt.price AS DECIMAL) > 270;
```
</details>

***
**2. Найти ноутбук с самым большим экраном и вывести его код и к какому отделу он принадлежит.**

<details>
<summary>
Решение:</summary>

``` 
SELECT l.screen, l.code, d.department FROM laptop l
JOIN product prd ON prd.model=l.model
JOIN department d ON prd.department_id=d.id
ORDER BY screen DESC
LIMIT 1
```
</details>

***
**3. Посчитать сколько ПК имеют минимальную скорость**

<details>
<summary>
Решение:</summary>

``` 
SELECT COUNT(*) FROM pc
WHERE pc.speed = (SELECT MIN (pc.speed) FROM pc)
```
</details>