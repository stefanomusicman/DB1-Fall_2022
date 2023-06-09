-- *** OUTER JOIN: RETREIVE DATA THAT EITHER MATCHES OR DOESN'T MATCH THE JOIN CONDITION ***
-- THINK ABOUT VENN DIAGRAMS, THE INTERSECTING PART IS THE DATA THAT MATCHES, THE PARTS THAT DON'T INTERSECT IS THE DATA THAT DOESN'T MATCH
-- THE DATA DOESN'T MATCH THE CONDITION FROM THE LEFT TABLE IS CALLED "LEFT OUTER JOIN"
-- THE DATA DOESN'T MATCH THE CONDITION FROM THE RIGHT TABLE IS CALLED "RIGHT OUTER JOIN"

-- SELECT ...... FROM ......(LEFT TABLE) [LEFT/RIGHT/FULL] JOIN .......(RIGHT TABLE) USING/ON........

-- DISPLAY FOR EACH CUSTOMER (CUSTOMER ID, NAME), THE CORRESPONDING EMPLOYEE SALES REPRESENTATIVE
-- THIS IS AN EXAMPLE OF AN STANDARD INNER JOIN
SELECT CUSTOMER_ID, NAME, EMPLOYEE_ID, LAST_NAME
FROM CUSTOMER C
JOIN EMPLOYEE E
ON C.SALESPERSON_ID = E.EMPLOYEE_ID;

-- DISPLAY FOR EACH CUSTOMER (CUSTOMER ID, NAME), THE CORRESPONDING EMPLOYEE SALES REPRESENTATIVE
-- ALSO DISPLAY THE CUSTOMERS THAT DON'T HAVE AN EMPLOYEE SALES REPRESENTATIVE
SELECT CUSTOMER_ID, NAME, EMPLOYEE_ID, LAST_NAME
FROM CUSTOMER C
LEFT JOIN EMPLOYEE E
ON C.SALESPERSON_ID = E.EMPLOYEE_ID;

-- DISPLAY FOR EACH CUSTOMER (CUSTOMER ID, NAME), THE CORRESPONDING EMPLOYEE SALES REPRESENTATIVE
-- ALSO DISPLAY THE EMPLOYEES THAT DON'T REPRESENT ANY CUSTOMERS
-- NVL: NULL VALUE (ONLY WORKS WITH STRINGS)
SELECT CUSTOMER_ID, NVL(NAME, 'NO CUSTOMER'), EMPLOYEE_ID, LAST_NAME
FROM CUSTOMER C
RIGHT JOIN EMPLOYEE E
ON C.SALESPERSON_ID = E.EMPLOYEE_ID;

-- DISPLAY FOR EACH CUSTOMER (CUSTOMER ID, NAME), THE CORRESPONDING EMPLOYEE SALES REPRESENTATIVE
-- ALSO DISPLAY THE CUSTOMERS THAT DON'T HAVE AN EMPLOYEE SALES REPRESENTATIVE
-- ALSO DISPLAY THE EMPLOYEES THAT DON'T REPRESENT ANY CUSTOMERS
SELECT CUSTOMER_ID, NVL(NAME, 'NO CUSTOMER'), EMPLOYEE_ID, LAST_NAME
FROM CUSTOMER C
FULL OUTER JOIN EMPLOYEE E
ON C.SALESPERSON_ID = E.EMPLOYEE_ID;

----------------------------------------------------------------------------------------------------
-- USING A SELECT STATEMENT IN THE "FROM" CLAUSE
-- SELECT ..... FROM (SELECT ...........), (ANOTHER SELECT STATMENT)...... WHERE ........

-- QUERY IN THE FROM CLAUSE

-- DISPLAY FOR EMPLOYEE (LAST_NAME, SALARY)
-- THE PERCENTAGE OF HIS SALARY RELATED TO THE SUM OF SALARIES OF HIS DEPARTMENT

-- LET'S SOLVE IT IN 2 STEPS

-- STEP 1: FIND SUM OF SALARIES PER DEPARTMENT
-- CREATE A VIEW
CREATE OR REPLACE VIEW V_SUMSAL_DEP
AS SELECT DEPARTMENT_ID, SUM(SALARY) SUM_SAL
FROM EMPLOYEE
GROUP BY DEPARTMENT_ID;

SELECT * FROM V_SUMSAL_DEP; -- THIS IS RESPONSIBLE FOR RETRIEVING THE SUMS OF SALARIES FOR EVERY DEPARTMENT

-- STEP 2: CONNECT BOTH
SELECT LAST_NAME, SALARY, ROUND(SALARY/SUM_SAL * 100, 2)
FROM EMPLOYEE
JOIN V_SUMSAL_DEP USING (DEPARTMENT_ID);

-- NOW IN ONE STEP
SELECT LAST_NAME, SALARY, ROUND(SALARY/SUM_SAL * 100, 2)
FROM EMPLOYEE E, (SELECT DEPARTMENT_ID, SUM(SALARY) SUM_SAL FROM EMPLOYEE GROUP BY DEPARTMENT_ID) T_SUM
WHERE E.DEPARTMENT_ID = T_SUM.DEPARTMENT_ID;

-- OR

SELECT LAST_NAME, SALARY, ROUND(SALARY/SUM_SAL * 100, 2)
FROM EMPLOYEE E
JOIN (SELECT DEPARTMENT_ID, SUM(SALARY) SUM_SAL FROM EMPLOYEE GROUP BY DEPARTMENT_ID) T_SUM
ON E.DEPARTMENT_ID = T_SUM.DEPARTMENT_ID;