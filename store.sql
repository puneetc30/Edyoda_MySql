CREATE DATABASE store;

USE store;

CREATE TABLE SalesPeople(Snum INT PRIMARY KEY,
						 Sname VARCHAR(20),
                         City VARCHAR(20),
                         Comm FLOAT,
                         UNIQUE(Sname));

CREATE TABLE customers(Cnum INT PRIMARY KEY,
					  Cname VARCHAR(20),
					  City VARCHAR(20) NOT NULL,
                      Snum INT,
                      FOREIGN KEY(Snum) REFERENCES SalesPeople(Snum));
                      
CREATE TABLE Orders(Onum INT PRIMARY KEY,
					Amt DECIMAL(6,2),
                    Odate DATE,
                    Cnum INT,
                    Snum INT,
                    FOREIGN KEY(Snum) REFERENCES SalesPeople(Snum),
                    FOREIGN KEY(Cnum) REFERENCES Customers(Cnum));
                    
INSERT INTO SalesPeople(Snum,Sname,City,Comm) VALUES(1001, 'Peel.', 'London', .12),
													(1002, 'Serres', 'Sanjose', .13),
													(1004, 'Motika', 'London', .11),
													(1007, 'Rifkin', 'Barcelona', .15),
													(1003, 'Axelrod', 'Newyork', .10);
                                                    
                                                    
INSERT INTO Customers(Cnum,Cname,City,Snum) VALUES(2001, 'Hoffman', 'London', 1001),
												  (2002, 'Giovanni', 'Rome', 1003),
												  (2003, 'Liu', 'Sanjose', 1002),
												  (2004, 'Grass', 'Berlin', 1002),
												  (2006, 'Clemens', 'London', 1001),
												  (2008, 'Cisneros', 'Sanjose', 1007),
												  (2007, 'Pereira', 'Rome', 1004);
                                                  
                                                  
INSERT INTO orders(Onum,Amt,Odate,Cnum,Snum) VALUES(3001, 18.69, '1990-10-3', 2008, 1007),
												   (3003, 767.19, '1990-10-3', 2001, 1001),
												   (3002, 1900.10, '1990-10-3', 2007, 1004),
												   (3005, 5160.45, '1990-10-3', 2003, 1002),
												   (3006, 1098.16, '1990-10-3', 2008, 1007),
												   (3009, 1713.23, '1990-10-4', 2002, 1003),
												   (3007, 75.75, '1990-10-4', 2004, 1002),
												   (3008, 4273.00, '1990-10-5', 2006, 1001),
												   (3010, 1309.95, '1990-10-6', 2004, 1002),
												   (3011, 9891.88, '1990-10-6', 2006, 1001);
-- 1 											
SELECT COUNT(*) AS "Number of Salesperson whose name starts with 'a'/'A'" FROM SalesPeople WHERE Sname LIKE 'A%';

-- 2
SELECT Orders.Snum, SalesPeople.Sname,SUM(Amt) FROM Orders
INNER JOIN SalesPeople
ON Orders.Snum = SalesPeople.Snum WHERE Amt>2000 GROUP BY SalesPeople.Snum;  


-- 3
SELECT COUNT(*) AS 'Number of Sales Person from Newyork' FROM SalesPeople WHERE City = 'Newyork';   


-- 4
SELECT COUNT(*) AS 'Number of Sales Person from London or Paris' FROM SalesPeople WHERE City in ('London','Paris');


-- 5
SELECT Snum, COUNT(*), Odate FROM Orders GROUP BY Snum,Odate;                                               
