/*Task1: Create a database named ‘computerstore’*/
create database computerstore;

/*Create the tables based on schema*/
create table manufacturers(
code int primary key auto_increment,
name char(50) not null
);
create table products(
code int primary key auto_increment,
name char(50) not null,
manufacturer integer not null,
foreign key (manufacturer) references manufacturers(code)
);
select * from products;

/*Task3: Insert the following data into the tables*/
insert into manufacturers (code, name)
values (1, 'Sony'),
(2, 'Asus'),
(3, 'Helwett-Packard'),
(4, 'Lenovo'),
(5, 'Fujitsu'),
(6, 'SanDisk');
alter table products add column price real not null;
select* from manufacturers;
INSERT INTO products (code,name, price, manufacturer) values
(1, 'Hard drive', 64.89, 5),
(2, 'Memory card', 17.99, 6),
(3, 'Laptop charger', 42.29, 4),
(4, 'USB Flash drive', 10, 6),
(5, 'Monitor', 219.99, 1),
(6, 'HDMI Cable', 18.29, 2),
(7, 'Gaming laptop', 2079.59, 2),
(8, 'Printer', 96.32, 3),
(9, 'Toner cartridge', 59, 3),
(10, 'Computer case', 158.92, 2);

/*Task4: Check that all the records were inserted in the Manufacturers table*/
select name from products;

/*Task5: Check that all the records were inserted in the Products table*/
select code from products;

/*Task6: Select the names of all the products in the store.*/
SELECT Name, Price FROM Products;

/*Task8: Select the name of the products with a price less than or equal to $200*/
SELECT Name FROM Products WHERE Price <= 200;

/*Task9: Select all the products with a price between $60 and $120*/
SELECT * FROM Products WHERE Price >= 60 AND Price <= 120;
SELECT * FROM Products WHERE Price BETWEEN 60 AND 120;

/*Task10: Select the name and price in cents (i.e., the price must be multiplied by 100).*/
SELECT Name, Price * 100 FROM Products;
SELECT Name, Price * 100 AS PriceCents FROM Products;
SELECT Name AS ProductName FROM Products;

/*Task11: Compute the average price of all the products*/
SELECT AVG(Price) FROM Products;

/*Task12:  Compute the average price of all products with manufacturer code equal to 2.*/
SELECT AVG(Price) FROM Products WHERE Manufacturer = 2;

/**Task13:  Compute the number of products with a price larger than or equal to $180*/
SELECT COUNT(*) FROM Products WHERE Price >= 180;

/*Task14:  Select the name and price of all products with a price larger than or equal to $180, and sort first by price (in descending order), and then by name (in ascending order)*/
SELECT Name, Price FROM Products
WHERE Price >= 180
ORDER BY Price DESC, Name;

/*Task15:  Select all the data from the products, including all the data for each product's manufacturer*/
/* with LEFT JOIN */
SELECT * FROM Products LEFT JOIN Manufacturers ON Products.Manufacturer = Manufacturers.Code;

/* without JOIN */
SELECT * FROM products, manufacturers WHERE Products.Manufacturer = Manufacturers.Code;

/*Task16:  Select the product name, price, and manufacturer name of all the products*/
SELECT Products.Name, Price, Manufacturers.Name
FROM Products INNER JOIN Manufacturers
ON Products.Manufacturer = Manufacturers.Code;

/*Task17:  Select the average price of each manufacturer's products, showing only the manufacturer's code*/
SELECT AVG(Price), Manufacturer
FROM Products
GROUP BY Manufacturer;


/*Task18:  Select the average price of each manufacturer's products, showing the manufacturer's name*/
SELECT AVG(Price), Manufacturers.Name
FROM Products INNER JOIN Manufacturers
ON Products.Manufacturer = Manufacturers.Code
GROUP BY Manufacturers.Name;

/*Task19:  Select the name and price of the cheapest product.*/
/* using MIN with a nested select */
SELECT Name, Price
FROM Products
WHERE Price = (SELECT MIN(Price) FROM Products);

/* ordering and limiting to 1 */
SELECT Name, Price
FROM Products
ORDER BY Price ASC
LIMIT 1;

/*Task20:  Add a new product: Loudspeakers, $70, manufacturer 2.*/
INSERT INTO Products (Code, Name, Price, Manufacturer)
VALUES (11, 'Loudspeakers', 70, 2);
SELECT * FROM Products WHERE Code = 11;

/*Task21:  Update the name of product 8 to "Laser Printer"*/
SELECT * FROM Products WHERE Code = 8;
UPDATE Products 
SET Name = 'Laser printer'
WHERE Code = 8;

/*Task22:  Apply a 10% discount to all products.*/
UPDATE Products
SET Price = Price - (Price * 0.1);

/*Task23:  Apply a 15% discount to all products with a price larger than or equal to $120*/
Select price-(0.15*price) discount15, code, name, manufacturer, price from products
where price>=120 ;

/*Task24:  Select the product with the smallest price where the manufacturer is Sony*/
SELECT MIN(Price)
FROM Products
WHERE Manufacturer = (SELECT Code FROM Manufacturers WHERE Name = 'Asus' );

SELECT MIN(Price)
FROM Products INNER JOIN Manufacturers
ON Manufacturers.Code = Products.Manufacturer
WHERE Manufacturers.Name = 'Asus';

/*Task25:  Select all products where manufacturers are Sony, Asus and Lenovo*/
SELECT * FROM Products
WHERE Manufacturer IN ( SELECT Code FROM manufacturers WHERE Name IN ('Sony', 'Lenovo', 'Asus'));
SELECT Code FROM manufacturers WHERE Name IN ('Sony', 'Lenovo', 'Asus');

SELECT * FROM Products
WHERE Price IN (63, 16.461);

SELECT * FROM Products;

SELECT * FROM Products
WHERE Name IN ('Laser printer', 'Gaming Laptop', 'Monitor');

SELECT * FROM Products
WHERE Name = 'Laser Printer' OR Name = 'Gaming Laptop' OR Name = 'Monitor';
