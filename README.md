## Добро пожаловать в мое портфолио! Здесь вы найдете коллекцию моих SQL-запросов при работе с БД.

### База данных ["Автомобили"](https://ссылочку_сюда)

**1. Найти страну с максимальной капитализацией всех её производителей**

<details>
<summary>
Решение:</summary>

``` 
select SUM(manufacturers.capitalization) as summa, c.name as country
from manufacturers
join countries c on c.id = manufacturers country_id
group by c.name
order by summa desc
limit 1;
```
</details>

***
**2. Вывести всю доступную информацию о моделе: имя производителя, имя модели, цена, остаток, страна производства**

<details>
<summary>
Решение:</summary>

``` 
select m.name as "Имя производителя", models.name as "Имя модели", p.value as
"Цена",
q.count as "Остаток", c.name as "Страна производства"
from models
join manufacturers m on models.manufacturer_id = m.id
join prices p on models.price_id = p.id
join quantity q on models.id = q.model_id
join countries c on c.id = m.country_id;

```
</details>

***
**3. Вывести все автомобили и их продавцов, которыми занимаются сотрудники офиса ‘Laconia’**

<details>
<summary>
Решение:</summary>

``` 
select models.name, s.first_name, s.last_name
from models
join sellers s on models.seller_id = s.id
join offices o on s.office_id = o.id
where o.name = 'Laconia';
```
</details>

***
**4. Найти марку с наибольшим количеством автомобилей в системе**

<details>
<summary>
Решение:</summary>

``` 
select models.name
from models
where instock = true;
```
</details>

***
**5. Вывести среднее значение цены всех доступных к продаже автомобилей**

<details>
<summary>
Решение:</summary>

``` 
select AVG(p.value)
from models
join prices p on p.id = models.price_id
where models.instock = true;
```
</details>

***
**6. Вывести общую стоимость всех автомобилей марки ‘Horch’**

<details>
<summary>
Решение:</summary>

``` 
select SUM(p.value)
from models
join manufacturers m on m.id = models.manufacturer_id
join prices p on p.id = models.price_id
where m.name = 'Horch';
```
</details>

### База данных ["Офисная техника"](https://ссылочку_сюда) 

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