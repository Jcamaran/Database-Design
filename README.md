# Database Design Final project - Yamaran Bike Shop
Yamaran Bike Shop Database
Welcome to the Yamaran Bike Shop Database project! This project consists of a database schema designed for a fictional bike shop, along with several user views and sample data.

## Project Overview
The Yamaran Bike Shop Database project is developed as part of the Final Project for CS-331-A. The goal of the project is to create a database schema to manage inventory, sales, customer information, order history, employee information, and more for a bike shop.

## Technologies Used
- Database Management System: Microsoft SQL Server
- Query Language: Transact-SQL (T-SQL)
- Database Design Tools: SQL Server Management Studio (SSMS)

## Database Schema
The database schema consists of the following tables:

1. BikeInventory: Stores information about bike inventory including BikeID, Model, Year, Color, and BikeStatus.
2. BikePricing: Contains pricing information for bikes including Price, Tax, VendorFee, and Total.
3. CustomerInfo: Stores customer information such as CustID, Fname, Lname, ContactNum, and EmailAddress.
4. OrderHistory: Records customer order history with details like HistID, CustID, Fname, Lname, BikeBought, and TotalSpent.
5. Sales: Tracks bike sales with information like SaleID, BikeID, Model, Year, SaleDate, and TotalSale.
6. Department: Stores information about departments within the bike shop including DepID, DepName, and DepLocation.
7. EmployeeInformation: Contains details about employees such as EmployeeID, Fname, Lname, ContactNum, EmailAddress, Position, Salary, and DepID.
8. PartsInventory: Manages inventory of bike parts including PartID, PartName, PartDescription, QuantityInStock, and PricePerUnit.
9. SupplierInfo: Stores information about parts suppliers with details like SupplierID, SupplierName, ContactNum, EmailAddress, and PartName.

## User Views
The project includes several user views for querying the database:

1. User View 1: Displays bike inventory with pricing information.
2. User View 2: Shows sales data including bike sales with details like Model, Year, and SaleDate.
3. User View 3: Provides information about employees including EmployeeID, Fname, Lname, Position, and DepartmentName.
4. User View 4: Displays parts inventory with details such as PartID, PartName, QuantityInStock, and PricePerUnit.
5. User View 5: Shows details about parts suppliers including SupplierID, SupplierName, ContactNum, EmailAddress, and PartName.
6. User View 6: Presents customer information along with their order history including CustID, Fname, Lname, BikeBought, and TotalSpent.


