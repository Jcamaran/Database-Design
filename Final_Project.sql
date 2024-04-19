-- Yamaran Bike Shop DB   --
-- Joaquin Camaran        --
-- Final Project database --
--      CS-331-A          --


CREATE DATABASE YamaranDb;


USE YamaranDb;




DROP TABLE BikeInventory ;
DROP TABLE CustomerInfo ;
DROP TABLE Sales ;
DROP TABLE EmployeeInformation ;
DROP TABLE PartsInvetory ;
DROP TABLE SupplierInfo ;



------------------------------------------UserView1----------------------------------------------
CREATE TABLE BikeInventory(
    BikeID INT PRIMARY KEY,
    Model VARCHAR(50),
    Year INT,
    Color VARCHAR(50),
    BikeStatus VARCHAR(50),
);


CREATE TABLE BikePricing (
    BikeID INT PRIMARY KEY,
	Price DECIMAL(10,2),
	Tax DECIMAL(10,2),
	VendorFee DECIMAL(10,2),
	Total DECIMAL(10,2),
	FOREIGN KEY (BikeID) REFERENCES BikePricing(BikeID)
);

INSERT INTO BikePricing(BikeID, Price, Tax, VendorFee, Total)
VALUES
(1, 18999.00, 1500.00, 500.00, 21000.00),
(2, 12999.00, 1000.00, 400.00, 14399.00),
(3, 7999.00, 600.00, 200.00, 8799.00),
(4, 10999.00, 900.00, 300.00, 12199.00),
(5, 8499.00, 700.00, 250.00, 9449.00),
(6, 17999.00, 1400.00, 600.00, 20000.00),
(7, 9999.00, 800.00, 300.00, 11099.00),
(8, 11999.00, 900.00, 400.00, 13399.00),
(9, 15999.00, 1200.00, 500.00, 17699.00),
(10, 1599.00, 120.00, 50.00, 1769.00),
(11, 10999.00, 800.00, 300.00, 12199.00),  
(12, 7999.00, 600.00, 200.00, 8799.00);

INSERT INTO BikeInventory(BikeID, Model, Year, Color, BikeStatus)
VALUES
(1, 'YZF-R1', 2023, 'Red', 'In Stock'),
(2, 'YZF-R6', 2022, 'Black', 'In Stock'),
(3, 'YZF-R3', 2021, 'White', 'SOLD' ),
(4, 'MT-09', 2023, 'Blue', 'SOLD' ),
(5, 'MT-07', 2024, 'Gray', 'SOLD' ),
(6, 'FJR1300', 2022, 'Silver', 'In Stock' ),
(7, 'XSR700', 2023, 'Yellow', 'In Stock' ),
(8, 'Tenere 700', 2022, 'Green', 'In Stock' ),
(9, 'Tracer 9 GT', 2021, 'Black', 'SOLD'),
(10, 'PW50', 2024, 'Blue', 'In Stock');

-----------------------User View 6-----------------------------------------------------


CREATE TABLE CustomerInfo(
    CustID INT PRIMARY KEY,
    Fname VARCHAR(50),
    Lname VARCHAR(50),
    ContactNum VARCHAR(50),
    EmailAddress VARCHAR(50)
);


CREATE TABLE OrderHistory(
    HistID INT PRIMARY KEY,
    CustID INT FOREIGN KEY REFERENCES CustomerInfo(CustID),
    Fname VARCHAR(50),
	Lname VARCHAR(50),
    BikeBought VARCHAR(50),
    TotalSpent DECIMAL(10,2)
);


INSERT INTO CustomerInfo(CustID, Fname, Lname, ContactNum, EmailAddress)
VALUES
(1, 'Jordan', 'Reed', '965-999-9992', 'reedJr@mail.com'),
(2, 'Emily', 'Smith', '555-123-4567', 'emilysmith@mail.com'),
(3, 'Michael', 'Johnson', '123-456-7890', 'mjohnson@mail.com'),
(4, 'Jessica', 'Davis', '987-654-3210', 'jdavis@mail.com');

INSERT INTO OrderHistory(HistID,CustID , Fname, Lname, BikeBought, TotalSpent)
VALUES
(01,1,'Jordan', 'Reed', 'Tracer 9 GT', 17699.00),
(02,2, 'Emily', 'Smith', 'MT-07', 9449.00),
(03,3, 'Michael', 'Johnson', 'MT-09', 12199.00),
(04,4, 'Jessica', 'Davis', 'YZF-R3', 8799.00);







--------------------------------------User View 2-----------------------------------------------
CREATE TABLE Sales(
    SaleID INT PRIMARY KEY,
    BikeID INT FOREIGN KEY REFERENCES BikeInventory(BikeID),
    Model VARCHAR(50),
    Year INT,
    SaleDate DATE,
    TotalSale DECIMAL(10,2)
);


INSERT INTO Sales(SaleID, BikeID, Model, Year, SaleDate,TotalSale )
VALUES
(1, 3,'YZF-R3', 2021, '2023-04-09',8799.00 ),
(2, 4,'MT-09', 2023, '2024-01-12',12199.00 ),
(3, 5,'MT-07', 2024, '2024-05-10',9449.00 ),
(4, 9,'Tracer 9 GT', 2021, '2024-06-22',17699.00 );

------------------------------------User view 3--------------------------------------------------------

CREATE TABLE Department(
    DepID INT PRIMARY KEY,
	DepName VARCHAR(50),
	DepLocation VARCHAR(50)
);


CREATE TABLE EmployeeInformation(
    EmployeeID INT PRIMARY KEY,
    Fname VARCHAR(50),
	Lname VARCHAR(50),
	ContactNum VARCHAR(50),
    EmailAddress VARCHAR(50),
    Position VARCHAR(50),
	Salary DECIMAL(10,2),
	DepID INT FOREIGN KEY (DepID) REFERENCES Department(DepID)
);

INSERT INTO Department(DepID,DepName,DepLocation)VALUES
(050, 'Sales Department', 'Main Offices'),
(055,'Service Department', 'Service Garage'),
(060, 'Managerial Department', 'South Offices');



INSERT INTO EmployeeInformation(EmployeeID,Fname,Lname,ContactNum,EmailAddress, Position, Salary, DepID)
VALUES
(105, 'John', 'Smith', '909-554-2278', 'johnBaker@mail.com', 'Head-of-Sales', 65000, 050),
(110, 'Alissa', 'Johnson', '775-824-9985', 'AlissaMoto@mail.com', 'Master-Mechanic', 55000, 055),
(115, 'Sarah', 'Williams', '555-678-9012', 'sarah@mail.com', 'Mechanic', 50000, 055),
(120, 'Ryan', 'Brown', '555-789-0123', 'ryan@mail.com', 'Service Manager', 70000, 060),
(125, 'Megan', 'Davis', '555-890-1234', 'megan@mail.com', 'Parts Manager', 68000, 060),
(130, 'Andrew', 'Miller', '555-901-2345', 'andrew@mail.com', 'Shop Foreman', 55000, 055),
(103, 'Michael', 'Wilson', '555-345-6789', 'michael@example.com', 'Senior Mechanic', 52000, 055),
(135, 'Joaquin', 'Camaran', '555-123-4567', 'Camaran@mail.com', 'CEO', 150000, 060);





--------------------------------------User view 4-----------------------------------------------------------
CREATE TABLE PartsInventory(
    PartID INT PRIMARY KEY,
    PartName VARCHAR(50) ,
    PartDescription TEXT,
    QuantityInStock INT,
    PricePerUnit DECIMAL(10,2)
);




INSERT INTO PartsInventory(PartID, PartName, PartDescription, QuantityInStock, PricePerUnit)
VALUES
(1001,'Spark Plug', 'Spark plugs are essential for igniting the fuel-air mixture in the engine cylinder.', 300, 15.99),
(1002, 'Yamaha Oil Filter', 'Oil filters remove contaminants from the engine oil, ensuring clean lubrication.', 200, 60.99),
(1003, 'Brake Pads', 'Brake pads press against the brake discs to slow down and stop the motorcycle.', 150, 39.99),
(1004, 'Michelin Tires', 'Tires provide traction and stability, allowing the motorcycle to grip the road surface.', 100, 119.99),
(1005, 'Complete Chain and Sprocket Kit', 'Chains and sprockets transfer power from the engine to the rear wheel.', 75, 99.99),
(1006, 'Titanium Akrapovic Exhaust System', 'Aftermarket Exhaust systems expel exhaust gasses from the engine and muffle engine noise.', 50, 1199.00);



-----------------------------------------------User View 5----------------------------------------------------------------


CREATE TABLE SupplierInfo(
    SupplierID INT PRIMARY KEY,
    SupplierName VARCHAR(50),
    ContactNum VARCHAR(50),
    EmailAddress VARCHAR(50),
	PartName VARCHAR(50)  
);





INSERT INTO SupplierInfo(SupplierID, SupplierName, ContactNum, EmailAddress, PartName)
VALUES
(10, 'MotoPartsInc','876-232-7766', 'MotoPartsInc@mail.com','Titanium Akropovic Exhaust System'),
(20, 'GearSpeed Supplies','765-983-1368', 'GSpeed@mail.com','Brake Pads '),
(30, '2Wheel Distributors','765-222-1242', '2Wheel@mail.com','Yamaha Oil Filter '),
(40, 'SpeedyParts Co.', '555-123-4567', 'SpeedyParts@mail.com', 'Michelin Tires'),
(50, 'MotorGear Inc.', '444-987-6543', 'MotorGear@mail.com', 'Spark Plugs'),
(60, 'CycleCentral', '333-555-7890', 'CycleCentral@mail.com', 'Complete Chain and Sprocket Kit');

SELECT * FROM BikeInventory ;
SELECT * FROM CustomerInfo ;
SELECT * FROM Sales ;
SELECT * FROM EmployeeInformation ;
SELECT * FROM PartsInventory ;
SELECT * FROM SupplierInfo ;






----------------------------------------------User view 1 Select----------------------------------------
SELECT BI.*, BP.Price, BP.Tax, BP.VendorFee, BP.Total
FROM BikeInventory BI
JOIN BikePricing BP ON BI.BikeID = BP.BikeID;

----------------------------------------------User view 2 Select----------------------------------------
SELECT * FROM Sales;

----------------------------------------------User view 3 Select----------------------------------------

SELECT 
    EI.EmployeeID AS EmpID,
    EI.Fname AS FName,
    EI.Lname AS LName,
	EI.ContactNum AS ContactNum,
	EI.EmailAddress AS EmailAddress,
    EI.Position AS EmpPosition,
    D.DepName AS DepartmentName,
	D.DepLocation AS DepLocation

FROM 
    EmployeeInformation EI
JOIN 
    Department D ON EI.DepID = D.DepID;

----------------------------------------------User view 4 Select-------------------------------
SELECT * FROM PartsInventory;


----------------------------------------------User view 5 Select-------------------------------
SELECT * FROM SupplierInfo;

----------------------------------------------User view 6 Select-------------------------------
SELECT CI.CustID, CI.Fname, CI.Lname, CI.ContactNum, CI.EmailAddress,
       OH.HistID, OH.BikeBought, OH.TotalSpent
FROM CustomerInfo CI
JOIN OrderHistory OH ON CI.CustID = OH.CustID;
             