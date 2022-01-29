# Pewlett-Hackard-Analysis
Report prepared for Module 7 challenge by Hannah Wikum - January 2022

# Resources
Data Source: departments.csv, dept_emp.csv, dept_manager.csv, employees.csv, salaries.csv, titles.csv (provided)
Software: PostgreSQL 11, Visual Studio Code, QuickDBD, Notepad
___
# Overview
## Background
This project was completed for Bobby, a HR analyst, at Pewlett Hackard. As a large corporation with many employees, Pewlett Hackard needs to think toward the future to offer retirement packages to eligible employess, while also thinking about which positions will need to be filled in the future. Six CSV files were provided with various employee information.

## Analysis
 In order to efficiently analyze the data and answer questions about the amount of employees eligible for retirements, I created a database with multiple tables from the CSV files to be queried using SQL in PostgreSQL. To start, I mapped out an entity relationship diagram (ERD) using QuickDBD to understand how each table related. I added the column headers, data type, and primary or foreign key relationships between each table to show the relationships. The employee number was the primary key in four out of six files, but employee number was a foreign key in the Managers data that could then be used to match department number primary keys to the Departments table. A visual of my ERD is below.
 
  _Pewlett-Hackard ERD_
  ![EmployeeDB](https://user-images.githubusercontent.com/93058069/151673145-371a4b8f-c5db-4073-9c39-7b2e8fc2a00f.PNG)

After mapping out the relationship, I worked in the Query Editor with the PGAdmin4 interface to Postgres in order to build the tables and import the data. Similar to the ERD exercise, I used the table/file name, column headers, data type, and primary/foreign keys to build out shells for each table.

  _Sample table creation query_
  ![image](https://user-images.githubusercontent.com/93058069/151673267-f30fb464-5c42-43fa-b5d0-ec7ac69890db.png)
