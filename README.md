## Добро пожаловать в мое портфолио! Здесь вы найдете коллекцию моих SQL-запросов при работе с БД.

### База данных "Автомобили"

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