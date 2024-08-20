## Добро пожаловать в мое портфолио! Здесь вы найдете коллекцию моих SQL-запросов при работе с БД.

### База данных "Автомобили"

Найти страну с максимальной капитализацией всех её производителей 

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