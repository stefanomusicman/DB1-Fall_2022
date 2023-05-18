-- DISPLAY ALL EMPLOYEES
SELECT * FROM EMPLOYEE;

-- DISPLAY LAST NAME, FIRST NAME AND SALARY OF ALL EMPLOYEES
SELECT LAST_NAME, FIRST_NAME, SALARY FROM EMPLOYEE;

-- DISPLAY LAST NAME, FIRST NAME AND SALARY OF ALL EMPLOYEES
-- THE HEADING OF LAST NAME IS 'FAMILY NAME'
-- THE HEADING OF FIRST NAME IS 'FIRST NAME'
-- THE HEADING OF SALARY IS 'MONTHLY SALARY'
SELECT LAST_NAME "FAMILY NAME", FIRST_NAME "FIRST NAME", SALARY "MONTHLY SALARY" FROM EMPLOYEE;

-- DISPLAY LAST NAME, SALARY AND THE SALARY INCREASED BY 10%
SELECT LAST_NAME, SALARY, SALARY * 1.1 "NEW SALARY" FROM EMPLOYEE;

-- DISPLAY LAST NAME CONCATENATED WITH HIRE DATE
SELECT LAST_NAME||' '||HIRE_DATE "LAST NAME AND HIRE DATE" FROM EMPLOYEE;

-- DISPLAY THE EMPLOYEES LIKE THIS FORMAT :
-- MY LAST NAME IS : ... AND MY HIRE DATE IS ...
SELECT 'MY LAST NAME IS : '||LAST_NAME||' AND MY HIRE DATE IS : '||HIRE_DATE FROM EMPLOYEE;

-- DISPLAY THE LAST NAME AND THE HIRE DATE FOLLOWING THIS FORMAT :
-- Thursday, November 3 2022
SELECT LAST_NAME, TO_CHAR(HIRE_DATE, 'Day, Month dd yyyy') FROM EMPLOYEE;

--------------------------------------------------------------------------------
-- USING CONDITIONS

-- DISPLAY EMPLOYEES (LAST_NAME, SALARY, WHO EARN MORE THAN 2000)
SELECT LAST_NAME, SALARY FROM EMPLOYEE WHERE SALARY > 2000;

-- THE RELATIONAL OPERATORS ARE : =, !=, >, >=, <, <=
-- THE LOGICAL OPERATORS : AND, OR, NOT

-- DISPLAY EMPLOYEES LAST NAME, SALARY WHO WORK IN THE DEPARTMENT 10
-- AND EARN A SALARY THAT IS NOT EQUAL TO 2000
SELECT LAST_NAME, SALARY FROM EMPLOYEE WHERE SALARY != 2000 AND DEPARTMENT_ID = 10;

-- DISPLAY EMPLOYEES LAST NAME, SALARY WHO WORK IN EITHER DEPT 10 OR 20
SELECT LAST_NAME, SALARY FROM EMPLOYEE WHERE DEPARTMENT_ID = 10 OR DEPARTMENT_ID = 20;

-- DISPLAY EMPLOYEE LAST NAME, SALARY, DEPARTMENT ID 
-- WHO WORK IN DEPARTMENT 10 OR 20 AND WHO'S SALARY IN GREATER THAN 3OOO
SELECT LAST_NAME, SALARY, DEPARTMENT_ID FROM EMPLOYEE WHERE (DEPARTMENT_ID = 10 OR DEPARTMENT_ID = 20) AND SALARY > 3000;

-- DISPLAY EMPLOYEE LAST NAME, SALARY, DEPARTMENT ID 
-- WHO DON'T WORK IN DEPARTMENT 10
SELECT LAST_NAME, SALARY, DEPARTMENT_ID FROM EMPLOYEE WHERE DEPARTMENT_ID != 10;

-- DISPLAY EMPLOYEE LAST NAME, SALARY, DEPARTMENT ID 
-- WHO DON'T WORK IN DEPARTMENT 10 AND 20
-- ***OPTIONAL WAY OF DOING THIS***
SELECT LAST_NAME, SALARY, DEPARTMENT_ID FROM EMPLOYEE WHERE NOT (DEPARTMENT_ID = 10 AND DEPARTMENT_ID = 20);

----------------------------------------------------------------------------------------------------------------
--**USING THE BETWEEN OPERATORS** AN ALTERNATIVE TO USING THE CONVENTIAL PROGRAMMATIC WAY OF DECLARING A RANGE

-- DISPLAY EMPLOYEES WHO EARN A SALARY BETWEEN 2000 AND 4000
SELECT LAST_NAME, SALARY FROM EMPLOYEE WHERE SALARY BETWEEN 2000 AND 4000;
-- EQUIVALENT TO, SALARY >= 2000 AND SALARY <= 4000

-- DISPLAY EMPLOYEES WHO EARN A SALARY NOT BETWEEN 2000 AND 4000
SELECT LAST_NAME, SALARY FROM EMPLOYEE WHERE SALARY NOT BETWEEN 2000 AND 4000;

---------------------------------------------------------------------------------------------------------------
-- THE 'IN' OPERATOR

-- DISPLAY THE EMPLOYEES WHO PRACTICE THE JOB : 667, 668, 669
SELECT LAST_NAME, SALARY, JOB_ID FROM EMPLOYEE WHERE JOB_ID IN (667, 668, 669);
-- EQUIVALENT TO, JOB_ID = 667 OR JOB_ID = 668 OR JOB_ID = 669

-- DISPLAY THE EMPLOYEES WHO PRACTICE THE JOB NOT IN : 667, 668, 669
SELECT LAST_NAME, SALARY, JOB_ID FROM EMPLOYEE WHERE JOB_ID NOT IN (667, 668, 669);
-- EQUIVALENT TO, JOB_ID != 667 AND JOB_ID != 668 AND JOB_ID != 669

---------------------------------------------------------------------------------------
-- IS NULL OPERATOR : THE COLUMN IS NOT DEFINED

-- DISPLAY EMPLOYEES WHO HAVE NOT YET RECEIVED A COMISSION
SELECT LAST_NAME, SALARY, COMMISSION FROM EMPLOYEE WHERE COMMISSION IS NULL;

-- DISPLAY EMPLOYEE WHO HAVE HIRE DATE
SELECT LAST_NAME, SALARY, HIRE_DATE FROM EMPLOYEE WHERE HIRE_DATE IS NOT NULL;

-- DISPLAY EMPLOYEES WHO HAVE THE MIDDLE INITIAL = M
SELECT * FROM EMPLOYEE WHERE MIDDLE_INITIAL = 'M';

----------------------------------------------------------------------------------------
-- THE LIKE OPERATOR

-- DISPLAY EMPLOYEES WHERE THEIR LAST NAME START WITH THE LETTER A
-- % == O,1 OR MANY CHARACTERS
SELECT LAST_NAME FROM EMPLOYEE WHERE LAST_NAME LIKE 'A%';

-- DISPLAY EMPLOYEES WHERE THEIR LAST NAME ENDS WITH THE LETTER S
SELECT LAST_NAME FROM EMPLOYEE WHERE LAST_NAME LIKE '%S';

-- DISPLAY EMPLOYEES WHERE THE SECOND LETTER IN THEIR LAST NAME IS E
SELECT LAST_NAME FROM EMPLOYEE WHERE LAST_NAME LIKE '_E%';
-- _ == REPRESENTS ONLY 1 CHARACTER

-- DISPLAY EMPLOYEES WHERE THEIR LAST NAME DOESN'T END WITH THE LETTER S
SELECT LAST_NAME FROM EMPLOYEE WHERE LAST_NAME NOT LIKE '%S';

-- DISPLAY EMPLOYEES WHO'S LAST NAME HAS 2 L'S
SELECT LAST_NAME FROM EMPLOYEE WHERE LAST_NAME LIKE '%LL%';

