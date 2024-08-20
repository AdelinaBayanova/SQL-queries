create table if not exists department
(
    id         integer not null
    primary key,
    department varchar
);

create table if not exists product
(
    department_id integer     not null
    constraint fk_department_product
    references department,
    model         varchar(50) not null
    constraint pk_product
    primary key,
    id            integer     not null
    );

create table if not exists laptop
(
    code   integer     not null
    constraint pk_laptop
    primary key,
    model  varchar(50) not null
    constraint fk_laptop_product
    references product,
    speed  smallint    not null,
    ram    smallint    not null,
    hd     real        not null,
    price  money,
    screen smallint    not null
    );

create table if not exists pc
(
    code  integer     not null
    constraint pk_pc
    primary key,
    model varchar(50) not null
    constraint fk_pc_product
    references product,
    speed smallint    not null,
    ram   smallint    not null,
    hd    real        not null,
    cd    varchar(10) not null,
    price money
    );

create table if not exists printer
(
    code  integer     not null
    constraint pk_printer
    primary key,
    model varchar(50) not null
    constraint fk_printer_product
    references product,
    color char        not null,
    type  varchar(10) not null,
    price money
    );


INSERT INTO public.department (id, department) VALUES (1, 'Finances');
INSERT INTO public.department (id, department) VALUES (2, 'Management');
INSERT INTO public.department (id, department) VALUES (3, 'Marketing');
INSERT INTO public.department (id, department) VALUES (4, 'Designers');
INSERT INTO public.department (id, department) VALUES (5, 'Services');

INSERT INTO public.product (department_id, model, id) VALUES (2,1121,16);
INSERT INTO public.product (department_id, model, id) VALUES (5,11211,19);
INSERT INTO public.product (department_id, model, id) VALUES (4,11212,20);
INSERT INTO public.product (department_id, model, id) VALUES (1,1232,15);
INSERT INTO public.product (department_id, model, id) VALUES (1,12324,21);
INSERT INTO public.product (department_id, model, id) VALUES (3,12325,22);
INSERT INTO public.product (department_id, model, id) VALUES (3,12326,23);
INSERT INTO public.product (department_id, model, id) VALUES (1,1233,14);
INSERT INTO public.product (department_id, model, id) VALUES (5,12331,26);
INSERT INTO public.product (department_id, model, id) VALUES (2,12333,25);
INSERT INTO public.product (department_id, model, id) VALUES (5,1260,13);
INSERT INTO public.product (department_id, model, id) VALUES (1,1276,12);
INSERT INTO public.product (department_id, model, id) VALUES (4,1288,11);
INSERT INTO public.product (department_id, model, id) VALUES (1,1298,10);
INSERT INTO public.product (department_id, model, id) VALUES (3,1321,9);
INSERT INTO public.product (department_id, model, id) VALUES (1,1401,8);
INSERT INTO public.product (department_id, model, id) VALUES (1,1408,7);
INSERT INTO public.product (department_id, model, id) VALUES (4,1433,6);
INSERT INTO public.product (department_id, model, id) VALUES (5,1434,5);
INSERT INTO public.product (department_id, model, id) VALUES (5,1670,17);
INSERT INTO public.product (department_id, model, id) VALUES (5,1671,18);
INSERT INTO public.product (department_id, model, id) VALUES (2,1750,4);
INSERT INTO public.product (department_id, model, id) VALUES (1,1752,3);
INSERT INTO public.product (department_id, model, id) VALUES (1,1892,24);
INSERT INTO public.product (department_id, model, id) VALUES (5,2112,1);
INSERT INTO public.product (department_id, model, id) VALUES (5,2113,2);

INSERT INTO public.laptop (code, model, speed, ram, hd, price, screen) VALUES (1,1298,350,32,4,700,11);
INSERT INTO public.laptop (code, model, speed, ram, hd, price, screen) VALUES (2,1321,500,64,8,970,12);
INSERT INTO public.laptop (code, model, speed, ram, hd, price, screen) VALUES (3,1750,750,128,12,1200,14);
INSERT INTO public.laptop (code, model, speed, ram, hd, price, screen) VALUES (4,1298,600,64,10,1050,15);
INSERT INTO public.laptop (code, model, speed, ram, hd, price, screen) VALUES (5,1752,750,128,10,1150,14);
INSERT INTO public.laptop (code, model, speed, ram, hd, price, screen) VALUES (6,1298,450,64,10,950,12);

INSERT INTO public.pc (code, model, speed, ram, hd, cd, price) VALUES (1, 12324, 500, 64, 5, '12x', 600);
INSERT INTO public.pc (code, model, speed, ram, hd, cd, price) VALUES (2,11212,750,128,14,'40x',850);
INSERT INTO public.pc (code, model, speed, ram, hd, cd, price) VALUES (3,12331,500,64,5,'12x',600);
INSERT INTO public.pc (code, model, speed, ram, hd, cd, price) VALUES (4,11211,600,128,14,'40x',850);
INSERT INTO public.pc (code, model, speed, ram, hd, cd, price) VALUES (5,1121,600,128,8,'40x',850);
INSERT INTO public.pc (code, model, speed, ram, hd, cd, price) VALUES (6,1233,750,128,20,'50x',950);
INSERT INTO public.pc (code, model, speed, ram, hd, cd, price) VALUES (7,12325,500,32,10,'12x',400);
INSERT INTO public.pc (code, model, speed, ram, hd, cd, price) VALUES (8,12326,450,64,8,'24x',350);
INSERT INTO public.pc (code, model, speed, ram, hd, cd, price) VALUES (9,1232,450,32,10,'24x',350);
INSERT INTO public.pc (code, model, speed, ram, hd, cd, price) VALUES (10,1260,500,32,10,'12x',350);
INSERT INTO public.pc (code, model, speed, ram, hd, cd, price) VALUES (11,1892,900,128,40,'40x',980);
INSERT INTO public.pc (code, model, speed, ram, hd, cd, price) VALUES (12,12333,800,128,20,'50x',900);

INSERT INTO public.printer (code, model, color, "type", price) VALUES (1,1276,'n','Laser',400);
INSERT INTO public.printer (code, model, color, "type", price) VALUES (2,1433,'y','Jet',270);
INSERT INTO public.printer (code, model, color, "type", price) VALUES (3,1434,'y','Jet',290);
INSERT INTO public.printer (code, model, color, "type", price) VALUES (4,1401,'n','Matrix',150);
INSERT INTO public.printer (code, model, color, "type", price) VALUES (5,1408,'n','Matrix',270);
INSERT INTO public.printer (code, model, color, "type", price) VALUES (6,1288,'n','Laser',400);
INSERT INTO public.printer (code, model, color, "type", price) VALUES (7,1670,'y','Jet',270);
INSERT INTO public.printer (code, model, color, "type", price) VALUES (8,1671,'n','Jet',260);



