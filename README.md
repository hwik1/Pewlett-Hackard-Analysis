# Pewlett-Hackard-Analysis
Report prepared for Module 7 challenge by Hannah Wikum - January 2022

# Resources
Data Source: departments.csv, dept_emp.csv, dept_manager.csv, employees.csv, salaries.csv, titles.csv (provided)
Software: PostgreSQL 11, Visual Studio Code, QuickDBD, Notepad
___
# Overview
## Background
This project was completed for Bobby, a HR analyst, at Pewlett Hackard. As a large corporation with many employees, Pewlett Hackard needs to think toward the future to offer retirement packages to eligible employess, while also thinking about which positions will need to be filled in the future. Six CSV files were provided with various employee information.

## Methodology
 In order to efficiently analyze the data and answer questions about the amount of employees eligible for retirements, I created a database with multiple tables from the CSV files to be queried using SQL in PostgreSQL. To start, I mapped out an entity relationship diagram (ERD) using QuickDBD to understand how each table related. I added the column headers, data type, and primary or foreign key relationships between each table to show the relationships. The employee number was the primary key in four out of six files, but employee number was a foreign key in the Managers data that could then be used to match department number primary keys to the Departments table. A visual of my ERD is below.
 
  _Pewlett-Hackard ERD_
  
  ![EmployeeDB](https://user-images.githubusercontent.com/93058069/151673145-371a4b8f-c5db-4073-9c39-7b2e8fc2a00f.PNG)

After mapping out the relationship, I worked in the Query Editor with the PGAdmin4 interface to Postgres in order to build the tables and import the data. Similar to the ERD exercise, I used the table/file name, column headers, data type, and primary/foreign keys to build out shells for each table.

  _Sample table creation query_
  
  ![image](https://user-images.githubusercontent.com/93058069/151673267-f30fb464-5c42-43fa-b5d0-ec7ac69890db.png)

After creating each table, I imported each file as a CSV with headers and comma delimiters into the appropriate table. I used SQL queries to join and limit data to find specific metrics related to the amount of employees who will be eligible for retirement. The first deliverable specific to the challenge was to create a list of the most recent title held by each retirement eligible employee and then a count to see which positions will have the most openings. The second was to create a list of employees eligible for a mentorship program so they could be trained on jobs before the more experienced employees retire.
___

# Results
Based on the two challenge deliverables described above, here are some major findings:

 * Pewlett-Hackard is facing a large amount of retirees. There are 72,458 current employees who were born in the year 1952-1955 who are now eligible for retirement.
 
 * The 72,458 current employees ready for retirment represent a large portion of Pewlett-Hackard's 240,124 employee base. About 30% of the company is eligible for retirement! (To calculate total employees, I used the count(distinct()) method on the employee number from the Employees table and joined with Dept_Emp to filter for current employees. See sample code below.)
 
   _Sample code for getting count of total active employees_

   ![image](https://user-images.githubusercontent.com/93058069/151676718-3e38b742-18ea-404d-a15d-0fba5243710c.png)
 
 * The largest amount of the retirees are retiring from Senior Engineer or Senior Staff roles. As you can see in retiring_titles.csv, when you take a count of the number of retirement-eligible employees by current title, 25,916 are in a Senior Engineer roles, while 24,926 are currently Senior Staff.
 
   _Export from Retiring Titles table_
  
   ![image](https://user-images.githubusercontent.com/93058069/151677709-df21cf7c-d07b-4168-87d3-4dfcd05df8ad.png)

* Pewlett-Hackard has plenty of mentors available for their proposed mentorship program, but not many mentees. As mentioned previously, there are 72,458 employees ready for retirement who could teach the next wave of senior employees, but only 1,549 current employees born during 1965 who would be eligible as a mentee. (I used a similar count(distinct()) as described above on the Mentorship Eligibility table to get the count of mentees.)
___

# Summary
In summary, Pewlett-Hackard is facing a major disruption to their work force in the next few years due to retirements. If all existing jobs are to be maintained, the company needs to fill 72,458 roles, mostly in Senior Engineering or Senior Staffing positions.

To determine if there are enough potential mentors for each department, I wrote a new query to determine the percentage ready for retirement in each department. First, I added department number to the eligible employee numbers from the unique_titles table by joining with the dept_emp table. Next, I wrote another chunk of code inside a with statement to get the number of total current employees by department. Finally, I referenced the first part of my code and the with statement to show the department number, department name, number of retirees, number of employees, and percent retirees by department. Here is a look at my completed code:

![image](https://user-images.githubusercontent.com/93058069/151679459-69ab23c1-15fe-4527-bc9c-611bd9561f0e.png)
![image](https://user-images.githubusercontent.com/93058069/151679480-044e31eb-b4fe-4c47-9ba0-48481fb5bb17.png)

Here is the result of my new code:

![image](https://user-images.githubusercontent.com/93058069/151679411-da333873-41c6-455b-a83d-9f28a5213afd.png)

As you can see in the output, the retirees are very evenly spread across department. Retirees make up 29-31% of the employees by department. Even if not all retirees choose to be mentors, there is still good coverage by department.








