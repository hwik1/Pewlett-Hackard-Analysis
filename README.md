# Pewlett-Hackard-Analysis
Report prepared for Module 7 challenge by Hannah Wikum - January 2022

# Resources
Data Source: departments.csv, dept_emp.csv, dept_manager.csv, employees.csv, salaries.csv, titles.csv (provided)

Software: PostgreSQL 11, Visual Studio Code, QuickDBD, Notepad
___
# Overview
## Background
This project was completed for Bobby, a HR analyst, at Pewlett Hackard. As a large corporation with many employees, Pewlett Hackard needs to think toward the future to offer retirement packages to eligible employees, while also thinking about having employees available as mentors and which positions will need to be filled in the future. Six CSV files were provided with various employee information.

## Methodology
 In order to efficiently analyze the data and answer questions about the amount of employees eligible for retirements, I created a database with multiple tables from the CSV files to be queried using SQL in PostgreSQL. To start, I mapped out an entity relationship diagram (ERD) using QuickDBD to understand how each table connected to the others. I added the column headers, data type, and primary or foreign key relationships between each table to show the relationships. The employee number was the primary key in four out of six files, but employee number was a foreign key in the Managers data that could then be used to match department number primary keys to the Departments table. A visual of my ERD is below.
 
  _Pewlett Hackard ERD_
  
  ![EmployeeDB](https://user-images.githubusercontent.com/93058069/151673145-371a4b8f-c5db-4073-9c39-7b2e8fc2a00f.PNG)

After mapping out the relationship, I worked in the Query Editor with the PGAdmin4 interface to Postgres in order to build the tables and import the data. Similar to the ERD exercise, I used the table/file name, column headers, data type, and primary/foreign keys to build out shells for each table.

  _Sample table creation query_
  
  ![image](https://user-images.githubusercontent.com/93058069/151673267-f30fb464-5c42-43fa-b5d0-ec7ac69890db.png)

After creating each table, I imported each file as a CSV with headers and comma delimiters into the appropriate table. I used SQL queries to join and limit data to find specific metrics related to the amount of employees who will be eligible for retirement. The first deliverable specific to the challenge was to create a list of the most recent title held by each retirement eligible employee and then a count to see which positions will have the most openings. The second was to create a list of employees eligible for a mentorship program so they could train new employees before they get to full retirement age.
___

# Results
Based on the two challenge deliverables described above, here are some major findings:

 * Pewlett Hackard is facing a large amount of retirees. There are 72,458 current employees who were born in the year 1952-1955 who are now eligible for retirement.
 
 * The 72,458 current employees ready for retirment represent a large portion of Pewlett Hackard's 240,124 employee base. About 30% of the company is eligible for retirement! (To calculate total employees, I used the count(distinct()) method on the employee number from the Employees table and joined with Dept_Emp to filter for current employees. See sample code below.)
 
   _Sample code for getting count of total active employees_

   ![image](https://user-images.githubusercontent.com/93058069/151907394-a68fdabd-f59c-4d9f-8b92-91ee01e55616.png)
 
 * The largest amount of the retirees are retiring from Senior Engineer or Senior Staff roles. As you can see in the Retiring Titles file, when you take a count of the number of retirement-eligible employees by current title, 25,916 are in a Senior Engineer roles, while 24,926 are currently Senior Staff.
 
   _Export from Retiring Titles table_
  
   ![image](https://user-images.githubusercontent.com/93058069/151900696-96da72fa-161c-4055-8043-4882c85868f2.png)

* Pewlett Hackard does not have many mentors available for their proposed mentorship program. As mentioned previously, there are 72,458 employees ready for retirement who are leaving, but only 1,549 current employees born during 1965 who would be eligible as a mentor for the next generation of employees. (I used a similar count(distinct()) as described above on the Mentorship Eligibility table to get the count of mentors.)
___

# Summary
In summary, Pewlett Hackard is facing a major disruption to their work force in the next few years due to the number of retirements. If all existing jobs are to be maintained, the company needs to fill 72,458 roles, mostly in Senior Engineering or Senior Staffing positions. With only 1,549 current employees born in 1965, they do not have enough mentors to train new employees.

Although we know there aren't many mentors, I wrote new code to check the number of mentors by department to see if there is good coverage across the company. I added department number to the eligible employee numbers from the Mentorship Eligibility table by joining with the dept_emp table and then used a count in a second query block. Here is a sample of my code:

 _Code for Determining Number of Mentors by Department_

 ![image](https://user-images.githubusercontent.com/93058069/151906569-2eb62d14-79f6-46c6-bfef-a3c102d8396e.png)

Below is the result of running both queries, where you can see that there are at least 64+ mentors per department. Although it isn't as many people as we want, at least expertise from all departments is represented.

 _Count of Mentors by Department_
 
 ![image](https://user-images.githubusercontent.com/93058069/151906712-e9521831-ef3b-43ee-8394-a092ac5fd7f0.png)

Next, I wrote a second new query to check how many employees would be retiring by department and percent to total employed in that department. I started my code with similar code as mentioned above to get the department from dept_emp added to the Unique Titles table. I wrote another chunk of code inside a with statement to get the number of total current employees by department. Finally, I referenced the first part of my code and the with statement to show the department number, department name, number of retirees, number of employees, and percent retirees by department. Here is a look at my completed code:

 _Code to Determine Count of Retirees by Department Compared to Total Employees_

 ![image](https://user-images.githubusercontent.com/93058069/151679459-69ab23c1-15fe-4527-bc9c-611bd9561f0e.png)
 ![image](https://user-images.githubusercontent.com/93058069/151679480-044e31eb-b4fe-4c47-9ba0-48481fb5bb17.png)

Here is the result of my new code:

 _Number and Percentage Retirees by Department_
 
 ![image](https://user-images.githubusercontent.com/93058069/151679411-da333873-41c6-455b-a83d-9f28a5213afd.png)

As you can see in the output, the retirees are very evenly spread across department. Pewlett Hackard will have to train new employees in all departments, but all have to replace about 30% of their workforce instead of one department losing 80% while another retains most current employees.








