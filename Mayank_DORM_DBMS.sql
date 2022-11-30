-- Creating the database --
create database if not exists ecommerce_store;

-- Using the created Database --
use ecommerce_store;

-- Creating table Supplier --
create table if not exists supplier(
	SUPP_ID int unsigned primary key,
    SUPP_NAME varchar(50) not null,
    SUPP_CITY varchar(50) not null,
    SUPP_PHONE varchar(50) not null
);

-- Creating table customer --
create table if not exists customer (
	CUS_ID int unsigned primary key,
    CUS_NAME varchar(20) not null,
    CUS_PHONE varchar(15) not null,
    CUS_EMAIL varchar(30) not null unique,
    CUS_CITY varchar(30) not null,
    CUS_GENDER enum('M','F') not null
);

-- Creating table Catogory --
create table if not exists category (
	CAT_ID int unsigned primary key,
    CAT_NAME varchar(20) not null,
    PARENT_CAT_ID int unsigned,
    foreign key(PARENT_CAT_ID) references category(CAT_ID)
);

-- Creating table product -- 
create table if not exists product (
	PRO_ID int unsigned primary key,
    PRO_NAME varchar(50) not null default "Dummy",
    PRO_DESC varchar(100) not null,
    CAT_ID int unsigned not null,
    foreign key(CAT_ID) references category(CAT_ID)
);

-- Creating table supplier_pricing
create table if not exists supplier_pricing (
	PRICING_ID int unsigned primary key,
    PRO_ID int unsigned not null,
    SUPP_ID int unsigned not null,
    SUPP_PRICE int unsigned not null default 0,
    foreign key (PRO_ID) references product(PRO_ID),
    foreign key (SUPP_ID) references supplier(SUPP_ID)
);

-- Creating table order --
create table if not exists `order`(
	ORD_ID int unsigned primary key,
	ORD_AMOUNT int not null,
	ORD_DATE date not null,
	CUS_ID int unsigned not null,
	PRICING_ID int unsigned not null,
	foreign key(CUS_ID) references customer(CUS_ID),
	foreign key(PRICING_ID) references supplier_pricing(PRICING_ID)
);

 -- Creating table rating --
 create table if not exists rating(
	RAT_ID int unsigned primary key,
    ORD_ID int unsigned not null,
    RAT_RATSTARS int not null,
    foreign key(ORD_ID) references `order`(ORD_ID)
);

-- Inserting values into supplier table --
INSERT INTO supplier VALUES(1,"Rajesh Retails","Delhi",'1234567890');
INSERT INTO supplier VALUES(2,"Appario Ltd.","Mumbai",'2589631470');
INSERT INTO supplier VALUES(3,"Knome products","Banglore",'9785462315');
INSERT INTO supplier VALUES(4,"Bansal Retails","Kochi",'8975463285');
INSERT INTO supplier VALUES(5,"Mittal Ltd.","Lucknow",'7898456532');

-- Inserting values into customer table --
INSERT INTO customer VALUES(1,"AAKASH",'9999999999',"aakash@gmail.com","DELHI",'M');
INSERT INTO customer VALUES(2,"AMAN",'9785463215',"aman@gmail.com","NOIDA",'M');
INSERT INTO customer VALUES(3,"NEHA",'9999999999',"neha@yahoo.com","MUMBAI",'F');
INSERT INTO customer VALUES(4,"MEGHA",'9994562399',"megha@gmail.com","KOLKATA",'F');
INSERT INTO customer VALUES(5,"PULKIT",'7895999999',"pulkit@gmail.com","LUCKNOW",'M');

-- Inserting values into Catogory table --
INSERT INTO category VALUES( 1,"BOOKS",1);
INSERT INTO category VALUES(2,"GAMES",2);
INSERT INTO category VALUES(3,"GROCERIES",3);
INSERT INTO category VALUES (4,"ELECTRONICS",4);
INSERT INTO category VALUES(5,"CLOTHES",5);

-- Inserting values into product table --
INSERT INTO product VALUES(1,"GTA V","Windows 7 and above with i5 processor and 8GB RAM",2);
INSERT INTO product VALUES(2,"TSHIRT","SIZE-L with Black, Blue and White variations",5);
INSERT INTO product VALUES(3,"ROG LAPTOP","Windows 10 with 15inch screen, i7 processor, 1TB SSD",4);
INSERT INTO product VALUES(4,"OATS","Highly Nutritious from Nestle",3);
INSERT INTO product VALUES(5,"HARRY POTTER","Best Collection of all time by J.K Rowling",1);
INSERT INTO product VALUES(6,"MILK","1L Toned MIlk",3);
INSERT INTO product VALUES(7,"Boat EarPhones","1.5Meter long Dolby Atmos",4);
INSERT INTO product VALUES(8,"Jeans","Stretchable Denim Jeans with various sizes and color",5);
INSERT INTO product VALUES(9,"Project IGI","compatible with windows 7 and above",2);
INSERT INTO product VALUES(10,"Hoodie","Black GUCCI for 13 yrs and above",5);
INSERT INTO product VALUES(11,"Rich Dad Poor Dad","Written by RObert Kiyosaki",1);
INSERT INTO product VALUES(12,"Train Your Brain","By Shireen Stephen",1);

-- Inserting values into supplier_pricing table --
INSERT INTO supplier_pricing VALUES(1,1,2,1500);
INSERT INTO supplier_pricing VALUES(3,5,1,3000);
INSERT INTO supplier_pricing VALUES(4,2,3,2500);
INSERT INTO supplier_pricing VALUES(5,4,1,1000);
INSERT INTO supplier_pricing VALUES(6,12,2,780);
INSERT INTO supplier_pricing VALUES(7,12,4,789);
INSERT INTO supplier_pricing VALUES(8,3,1,31000);
INSERT INTO supplier_pricing VALUES(9,1,5,1450);
INSERT INTO supplier_pricing VALUES(10,4,2,999);
INSERT INTO supplier_pricing VALUES(11,7,3,549);
INSERT INTO supplier_pricing VALUES(12,7,4,529);
INSERT INTO supplier_pricing VALUES(13,6,2,105);
INSERT INTO supplier_pricing VALUES(14,6,1,99);
INSERT INTO supplier_pricing VALUES(15,2,5,2999);
INSERT INTO supplier_pricing VALUES(16,5,2,2999);

-- Inserting values into order table --
INSERT INTO `order`(ord_id,ord_amount,ord_date,cus_id,pricing_id) VALUES (101,1500,"2021-10-06",2,1),
(102,1000,"2021-10-12",3,5),
(103,30000,"2021-09-16",5,3),
(104,1500,"2021-10-05",1,1),
(105,3000,"2021-08-16",4,3),
(106,1450,"2021-08-18",1,9),
(107,789,"2021-09-01",3,7),
(108,780,"2021-09-07",5,6),
(109,3000,"2021-09-10",5,3),
(110,2500,"2021-09-10",2,4),
(111,1000,"2021-09-15",4,5),
(112,789,"2021-09-16",4,7),
(113,31000,"2021-09-16",1,8),
(114,1000,"2021-09-16",3,5),
(115,3000,"2021-09-16",5,3),
(116,99,"2021-09-17",2,14);

-- Inserting values into rating table --

INSERT INTO rating VALUES(1,101,4);
INSERT INTO rating VALUES(2,102,3);
INSERT INTO rating VALUES(3,103,1);
INSERT INTO rating VALUES(4,104,2);
INSERT INTO rating VALUES(5,105,4);
INSERT INTO rating VALUES(6,106,3);
INSERT INTO rating VALUES(7,107,4);
INSERT INTO rating VALUES(8,108,4);
INSERT INTO rating VALUES(9,109,3);
INSERT INTO rating VALUES(10,110,5);
INSERT INTO rating VALUES(11,111,3);
INSERT INTO rating VALUES(12,112,4);
INSERT INTO rating VALUES(13,113,2);
INSERT INTO rating VALUES(14,114,1);
INSERT INTO rating VALUES(15,115,1);
INSERT INTO rating VALUES(16,116,0);

select  c.CUS_GENDER as Customer_Gender, count(*) as Order_Count, sum(o.ORD_AMOUNT) as Order_amount from customer as c inner join `order` as o on o.CUS_ID = c.CUS_ID where ORD_AMOUNT >= 3000 group by c.CUS_GENDER;
 
 select * from product as p where p.PRO_ID = 
 (select PRO_ID from `order` as o inner join supplier_pricing as s on o.PRICING_ID = s.PRICING_ID and o.CUS_ID = 2);
 
 select supplier.* from supplier where supplier.SUPP_ID in
(select SUPP_ID from supplier_pricing group by SUPP_ID having count(SUPP_ID)>1) group by supplier.SUPP_ID;

select customer.CUS_NAME, customer.CUS_GENDER from customer where customer.CUS_NAME like 'A%' or customer.CUS_NAME like '%A';


