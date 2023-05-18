-- DISPLAY EMPLOYEE LAST_NAME, SALARY AND THE
-- CORRESPONDING MANAGER LAST_NAME AND SALARY
SELECT E.LAST_NAME, E.SALARY, M.LAST_NAME, M.SALARY
FROM EMPLOYEE E
JOIN EMPLOYEE M
ON E.MANAGER_ID = M.EMPLOYEE_ID;

---------------- JOINING TABLES AND GROUP FUNCTIONS -------------------------

-- DISPLAY THE DEPARTMENT NAME AND THE CORRESPONDING SUM AND AVERAGE SALARY
SELECT NAME, SUM(SALARY), AVG(SALARY)
FROM EMPLOYEE
JOIN DEPARTMENT USING (DEPARTMENT_ID)
GROUP BY NAME;

-- DISPLAY THE DEPARTMENT NAME AND THE CORRESPONDING SUM AND AVERAGE SALARY
-- FOR EACH LOCATION
SELECT LOCATION_ID, NAME, SUM(SALARY), ROUND(AVG(SALARY), 2)
FROM EMPLOYEE
JOIN DEPARTMENT USING (DEPARTMENT_ID)
JOIN LOCATION USING (LOCATION_ID)
GROUP BY LOCATION_ID, NAME;

---------------------PROCEDURAL JOIN : SUBQUERIES----------------------------
-- DISPLAY THE EMPLOYEE (LAST_NAME, SALARY) WHO EARN
-- THE SAME SALARY AS THE EMPLOYEE 7505
SELECT LAST_NAME, SALARY
FROM EMPLOYEE
WHERE SALARY = (SELECT SALARY FROM EMPLOYEE WHERE EMPLOYEE_ID = 7505);

-- DISPLAY THE EMPLOYEE (LAST_NAME, SALARY) WHO WORK IN THE SAME
-- DEPARTMENT AS THE EMPLOYEE 7506
SELECT EMPLOYEE_ID, LAST_NAME, SALARY
FROM EMPLOYEE
WHERE DEPARTMENT_ID = (SELECT DEPARTMENT_ID FROM EMPLOYEE WHERE EMPLOYEE_ID = 7506);

-- DISPLAY THE EMPLOYEE (LAST_NAME, SALARY) WHO DONT WORK IN THE SAME
-- DEPARTMENT AS THE EMPLOYEE 7506
SELECT EMPLOYEE_ID, LAST_NAME, SALARY
FROM EMPLOYEE
WHERE DEPARTMENT_ID <> (SELECT DEPARTMENT_ID FROM EMPLOYEE WHERE EMPLOYEE_ID = 7506);

-- DISPLAY EMPLOYEES (LAST_NAME, SALARY) WHO EARN THE HIGHEST SALARY
SELECT DEPARTMENT_ID, EMPLOYEE_ID, LAST_NAME, SALARY
FROM EMPLOYEE
WHERE SALARY >= ALL (SELECT SALARY FROM EMPLOYEE);

-- DISPLAY THE EMPLOYEE(LAST_NAME, SALARY) WHO EARN
-- THE HIGHEST SALARY OF DEPARTMENT 10
SELECT DEPARTMENT_ID, EMPLOYEE_ID, LAST_NAME, SALARY
FROM EMPLOYEE
WHERE SALARY > (SELECT MAX(SALARY) FROM EMPLOYEE WHERE DEPARTMENT_ID = 20);

-- DISPLAY THE EMPLOYEES (EMPLOYEE_ID, LAST_NAME, HIRE_DATE)
-- WHO WERE HIRED FIRST
SELECT EMPLOYEE_ID, LAST_NAME, HIRE_DATE 
FROM EMPLOYEE
WHERE HIRE_DATE = (SELECT MIN(HIRE_DATE) FROM EMPLOYEE);
-- EQUIVALENT TO
SELECT EMPLOYEE_ID, LAST_NAME, HIRE_DATE 
FROM EMPLOYEE
WHERE HIRE_DATE <=ALL (SELECT HIRE_DATE FROM EMPLOYEE);

-- DISPLAY THE EMPLOYEES (EMPLOYEE_ID, LAST_NAME, SALARY)
-- WHO EARN THE SAME SALARY AS THE EMPLOYEES : 7505 OR 7506
SELECT EMPLOYEE_ID, LAST_NAME, SALARY
FROM EMPLOYEE
WHERE SALARY = (SELECT SALARY FROM EMPLOYEE WHERE EMPLOYEE_ID = 7505)
OR SALARY = (SELECT SALARY FROM EMPLOYEE WHERE EMPLOYEE_ID = 7506);

