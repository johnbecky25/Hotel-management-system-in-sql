CREATE DATABASE Hotel_management_system
  
-------Tables--------
CREATE DOMAIN Gender VARCHAR(15)
CHECK (VALUE IN ('Male', 'Female', 'TransGender'));

DROP TABLE Customers
CREATE TABLE Customers(
Customer_id varchar(10) primary key,
First_name VARCHAR(20),
Last_name VARCHAR(20),
Gender VARCHAR(20),
Phone_number text[] 
);

INSERT INTO Customers VALUES ('Cus001','Brian','Luke','Male','{"0743337658","0730858923458"}'),
							('Cus002','Victor','Kiplagat','Male','{"0744637658","073034923458"}'),
							('Cus003','Karis','leah','Female','{"074334658"}'),
							('Cus004','Sasha','Lanu','Female','{"074331658","073048923458"}'),
							('Cus005','Geofrey','Otieno','Male','{"0744327658","07300923458"}'),
							('Cus007','John','Onyango','Male','{"0743339658","0790858923458"}'),
							('Cus008','harry','Peter','Male','{"074337658"}'),
							('Cus009','Anne','Muchire','Female','{"074337658","07308523458"}'),
							('Cus010','David','Cooper','Male','{"07437658"}'),
							('Cus011','Steve','Owens','Female','{"074337658","073085523458"}'),
							('Cus012','Henry','Persic','Male','{"0743387658"}'),
							('Cus013','Erick','Onyango','Male','{"0743337658","0730858923458"}'),
							('Cus014','Mary','Auma','Female','{"07434537658"}'),
							('Cus015','Mary','Achieng','Female','{"0743337658","07303923458"}'),
							('Cus016','Mary','Wango','Female','{"0713337658","07858923458"}'),
							('Cus017','Anne','Elizabeth','Female','{"0723337658","07908589234"}'),
							('Cus018','Betty','ELls','Female','{"0743337658"}'),
							('Cus019','Kelly','John','Male','{"07407658","073023458"}'),
							('Cus020','Joshua','Opiyo','Male','{"070987658","0738923458"}'),
							('Cus021','Mary','Akoth','Female','{"075237658"}'),
							('Cus022','Onyango','Timon','Male','{"079057658","0730858923"}'),
							('Cus023','Ronald','Kisia','Male','{"073337658"}'),
							('Cus024','Wayne','Ouma','Male','{"0743337658","072923458"}'),
							('Cus025','John','Wayne','Male','{"0792316179"}');
							
SELECT*FROM Customers							
--------------Functions----------
CREATE OR REPLACE FUNCTION totalRecords1 ()
RETURNS integer
LANGUAGE plpgsql  
AS
$$
  DECLARE
	NoOfRecords integer;
BEGIN
   SELECT count(*) into NoOfRecords FROM Customers;
   RETURN NoOfRecords;
END;
$$

SELECT totalRecords1();
SELECT * FROM Customers


CREATE TABLE Booking (
    Booking_id INTEGER NOT NULL primary key,
    Book_type VARCHAR(20),
    Book_date VARCHAR(20),
    Customer_id VARCHAR,
    FOREIGN key(customer_id) 
	REFERENCES Customers
);


INSERT INTO Booking VALUES ('2021','Third_Party','01/01/2018','Cus001'),
							('2022','Direct','10/03/2021','Cus002'),
							('2023','Third_Party','01/05/2018','Cus007'),
							('2024','Direct','09/04/2018','Cus004'),
							('2025','Third_Party','20/03/2018','Cus007'),
							('2026','Direct','10/02/2018','Cus008'),
							('2027','Third_party','11/02/2018','Cus005'),
							('2028','Direct','15/06/2018','Cus012'),
							('2029','Third_Party','15/03/2018','Cus018'),
							('2030','Direct','14/02/2018','Cus025');
							
							
SELECT*FROM Booking	

CREATE TABLE Reservation (
    Reserv_ID int primary key,
    check_in_date Date,
    check_out_date Date,
     No_of_days int,
    Customer_id varchar,
    Booking_id INTEGER,
    FOREIGN key(customer_id) references Customers,
    FOREIGN key(Booking_id) references Booking
);

INSERT INTO Reservation VALUES ('1001','01/03/2018','01/05/2021','2','Cus001','2021'),
 								('1002','01/01/2018','01/02/2021','1','Cus002','2022'),
 								('1003','01/03/2018','01/05/2021','2','Cus003','2023'),
 								('1004','01/09/2018','01/12/2021','3','Cus004','2024'),
 								('1005','01/11/2018','01/15/2021','4','Cus008','2025'),
 								('1006','01/15/2018','01/21/2021','6','Cus010','2026'),
								('1007','01/17/2018','01/22/2021','5','Cus012','2027'),
								('1008','01/20/2018','01/22/2021','2','Cus014','2028'),
 								('1009','01/22/2018','01/23/2021','4','Cus016','2029'),
 								('1010','01/30/2018','01/31/2021','1','Cus017','2030'),
								('1011','02/08/2018','02/10/2021','2','Cus020','2029');
SELECT*FROM Reservation							

CREATE TABLE Room (
    Room_no INTEGER NOT NULL ,
    Room_type varchar(20),
    Bed_type varchar(20),
    No_of_occupants int,
    Room_price int,
    Customer_id varchar,
    Reserv_ID int,
    FOREIGN key(customer_id) references Customers,
    FOREIGN key(Reserv_ID) references Reservation
);


INSERT INTO Room VALUES ('101','Standard','Queen','1','80000','Cus002','1001'),
						('504','President','King','2','12000','Cus003','1002'),
						('402','Executive','Queen','2','100000','Cus005','1003'),
						('404','Executive','Queen','1','25000','Cus008','1004'),
						('408','Executive','Queen','2','45000','Cus009','1005'),
						('401','Standard','Queen','2','78000','Cus017','1006'),
						('409','Executive','Queen','2','13000','Cus018','1007'),
						('402','Executive','Queen','2','11000','Cus015','1008'),
						('504','President','King','2','19000','Cus016','1009'),
						('103','Standard','Queen','1','80000','Cus018','1010'),
						('108','Standard','Queen','1','10090','Cus025','1011');

SELECT*FROM Room 



CREATE TABLE Address (
    Street varchar(30),
    City varchar(30),
    Country varchar(20),
    Customer_id varchar,
    FOREIGN key(customer_id) references Customers
);

INSERT INTO Address VALUES ('22 Oak Street','San Diego','US','Cus011'),
							('22 Jump Street','Los Angeles','US','Cus004'),
							('31 Hill Avenue','San Francisco','US','Cus005'),
							('44 Areo drive','Phonenix','US','Cus007'),
							('29 What Street','San Diego','US','Cus010'),
							('550 Upas Street','New York','US','Cus012'),
							('123 Summer Lane','Birmingham','US','Cus015'),
							('4513 Pineville Road','Chicago','US','Cus018'),
							('987 Bubbly Lane','Baltimore','US','Cus021'),
							('555 Elwood Way','Los Angeles','US','Cus025');


----------------Inheritance-------------
CREATE TABLE Invoice(Invoice_NO int primary key)
inherits (public.Room);

INSERT INTO Invoice(Invoice_No,Room_no,Customer_id,Reserv_ID)
VALUES ('3011','101','Cus001','1001'),
		('3012','504','Cus003','1003'),
		('3013','404','Cus005','1004'),
		('3014','409','Cus007','1008'),
		('3015','402','Cus008','1010');


select*from Invoice


CREATE TABLE transactions (
    Trans_No int NOT NULL primary key,
    Payment_Method varchar(20),
    Payment_Date date,
    Invoice_no integer,
    Customer_id varchar,
    FOREIGN key(Invoice_no) references Invoice,
    FOREIGN key(customer_id) references Customers   
);


INSERT INTO transactions VALUES ('222444','cash','01/05/2018','3011','Cus001'),
								('222445','credit_card','01/02/2018','3011','Cus004'),
								('222446','MPESA','01/05/2018','3011','Cus007'),
								('222447','credit_card','01/12/2018','3012','Cus008'),
								('222449','cash','01/12/2018','3013','Cus009'),
								('222450','MPESA','01/16/2018','3013','Cus005'),
								('222451','cash','01/18/2018','3014','Cus010'),
								('222452','MPESA','01/22/2018','3015','Cus011'),
								('222453','cash','01/23/2018','3013','Cus012'),
								('222454','MPESA','01/31/2018','3014','Cus013');


SELECT*FROM transactions


--------------commit----------
BEGIN;
	UPDATE Customers
	SET First_Name = 'Wayne'
	WHERE Customer_id = 'Cus0012';
COMMIT;

select * from Cusromers


--------------RollBack-----------
BEGIN;
	UPDATE Customers
	SET First_Name = 'John'
	WHERE Customer_id= 'Cus020';
ROLLBACK;

select * from Customers

----------Triggers-------------
CREATE TABLE Customer_audits(
   Customer_id varchar PRIMARY KEY,
   First_Name varchar,
   changed_on TIMESTAMP(6) NOT NULL
)	

SELECT  * FROM Customer_audits


CREATE OR REPLACE FUNCTION logname_changes()
 RETURNS trigger AS
$BODY$
BEGIN
	IF NEW.First_Name <> OLD.First_Name THEN
		 INSERT INTO Customer_audits(Customer_id,First_Name,changed_on)
		 VALUES(OLD.Customer_id,OLD.First_Name,now());
	END IF;
	RETURN NEW;
END;
$BODY$
LANGUAGE plpgsql 

CREATE TRIGGER LOGchanges
  BEFORE UPDATE
  ON Customers
  FOR EACH ROW
  EXECUTE PROCEDURE LOGNAME_changes();

SELECT * FROM Customer_audits
SELECT * FROM Customers

UPDATE Customers
SET First_Name = 'John'
WHERE Customer_id = 'Cus006';





-------------QUERIES--------
-------------Retrieving the first subset of elements---------
SELECT First_Name, Phone_number[1]  
FROM Customers; 

--------using where------
SELECT First_Name  
FROM Customers  
WHERE Phone_number[2]='072923458'; 

-----------retrieving passengers first names "John" or "Brian"----------
SELECT *FROM Customers
where FIRST_NAME = 'John'
or FIRST_NAME = 'Brian'

-----list of Passengers whose name start wth J----
SELECT * FROM Customers
WHERE FIRST_NAME LIKE 'J%';

--------getting the list of Customers who paid via mpesa------
SELECT*FROM transactions
WHERE Payment_Method='MPESA';

--------CUSTOMER DETAILS WHO BOOKED ROOM 1001----
SELECT*FROM Room
WHERE Room_no ='101';

--------Getting the total records for customers------
SELECT totalRecords1();

--------updating customer details using trigger function-----
UPDATE Customers
SET First_Name = 'John'
WHERE Customer_id = 'Cus006';

----------getting invoince no 3011-----
SELECT*FROM Invoice
WHERE Invoice_No='3011';







