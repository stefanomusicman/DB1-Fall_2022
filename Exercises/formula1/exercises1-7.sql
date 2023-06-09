------------------------------- EXERCISE 1 ------------------------------------

-- QUESTION 1
SELECT LAST_NAME, FIRST_NAME, SALARY
FROM DRIVER;

-- QUESTION 2
SELECT LAST_NAME || ' ' || HIRE_DATE
FROM DRIVER;

-- QUESTION 3
SELECT LAST_NAME, SALARY * 1.15 AS NEW_SALARY
FROM DRIVER;

-- QUESTION 4
SELECT LAST_NAME, FIRST_NAME, SALARY 
FROM DRIVER
WHERE SALARY > 55000;

-- QUESTION 5
SELECT LAST_NAME, FIRST_NAME, SALARY
FROM DRIVER
WHERE DRIVER_ID IN ('P300', 'P500', 'P1000');

-- QUESTION 6
SELECT CONSTRUCTOR_ID, CONSTRUCTOR_NAME
FROM CONSTRUCTOR
WHERE CONSTRUCTOR_NAME LIKE 'M%';

-- QUESTION 7
SELECT DRIVER_ID, COMP_DATE
FROM COMPETITION
WHERE QUIT_COMP = 'Y'
AND NB_OF_ROUNDS < 60;

-- QUESTION 8
SELECT LAST_NAME, FIRST_NAME, SALARY
FROM DRIVER
WHERE LAST_NAME NOT LIKE 'S%';

-- QUESTION 9
SELECT LAST_NAME, FIRST_NAME, HIRE_DATE
FROM DRIVER
WHERE HIRE_DATE < TO_DATE('01-JAN-2000', 'DD-MON-YYYY');

-- QUESTION 10
SELECT LAST_NAME, FIRST_NAME, SALARY
FROM DRIVER
WHERE LAST_NAME LIKE '%A%'
OR LAST_NAME LIKE '%E%';

-- QUESTION 11
SELECT DISTINCT CONSTRUCTOR_ID 
FROM COMPETITION;

-- QUESTION 12
SELECT LAST_NAME, FIRST_NAME, SALARY
FROM DRIVER
WHERE SALARY BETWEEN 55000 AND 65000 
ORDER BY SALARY ASC;

-- QUESTION 13
SELECT LAST_NAME, FIRST_NAME, SALARY
FROM DRIVER
WHERE LAST_NAME LIKE '_A%';

-- QUESTION 14
SELECT CONSTRUCTOR_NAME
FROM CONSTRUCTOR
WHERE CONSTRUCTOR_NAME LIKE '%o_%o%';

-- QUESTION 15
SELECT LAST_NAME, FIRST_NAME, SALARY
FROM DRIVER
WHERE FIRST_NAME LIKE '%a'
OR FIRST_NAME LIKE '%e'
OR FIRST_NAME LIKE '%i'
OR FIRST_NAME LIKE '%o'
OR FIRST_NAME LIKE '%u'
OR FIRST_NAME LIKE '%y';

-- QUESTION 16
SELECT DRIVER_ID 
FROM COMPETITION
WHERE NB_OF_ROUNDS IS NULL;

------------------------------- EXERCISE 2 -------------------------------------

-- QUESTION 1
SELECT COUNT(*) 
FROM COMPETITION;

-- QUESTION 2
SELECT COUNT(*)
FROM COMPETITION
WHERE DURATION IS NOT NULL;

-- QUESTION 3
SELECT SUM(SALARY), AVG(SALARY), MIN(SALARY), MAX(SALARY)
FROM DRIVER;

-- QUESTION 4
SELECT COUNT(*)
FROM COMPETITION
WHERE QUIT_COMP = 'Y';

-- QUESTION 5
SELECT COUNT(*) 
FROM DRIVER
WHERE HIRE_DATE BETWEEN TO_DATE('01-JAN-1995', 'DD-MON-YYYY') AND TO_DATE('31-DEC-1995', 'DD-MON-YYYY');

-- QUESTION 6
SELECT COUNTRY_ID, SUM(SALARY)
FROM DRIVER
GROUP BY COUNTRY_ID;

-- QUESTION 7
SELECT COUNT(*) 
FROM COMPETITION
WHERE NB_OF_ROUNDS > 67;

-- QUESTION 8
SELECT COUNTRY_NAME
FROM DRIVER
GROUP BY COUNTRY_NAME
HAVING COUNT(*) >= 2;

------------------------------- EXERCISE 3 -------------------------------------

-- QUESTION 1
SELECT CIRCUIT.CIRCUIT_ID, CIRCUIT.DESCRIPTION, CIRCUIT.ROUND_LENGTH, COUNTRY.NAME
FROM CIRCUIT
JOIN COUNTRY ON COUNTRY.COUNTRY_ID = CIRCUIT.COUNTRY_ID;

-- QUESTION 2
SELECT D.DRIVER_ID, D.LAST_NAME, C.DURATION
FROM DRIVER D
JOIN COMPETITION C ON D.DRIVER_ID = C.DRIVER_ID
WHERE C.QUIT_COMP = 'N'
ORDER BY C.DURATION DESC;

-- QUESTION 3
SELECT D.DRIVER_ID, D.LAST_NAME, D.FIRST_NAME
FROM DRIVER D
JOIN COMPETITION C ON C.DRIVER_ID = D.DRIVER_ID
WHERE C.QUIT_COMP = 'N'
AND C.DURATION < 1.5370;

-- QUESTION 4
SELECT D.LAST_NAME, D.COUNTRY_NAME, C.NB_OF_ROUNDS, CON.CONSTRUCTOR_NAME
FROM DRIVER D
JOIN COMPETITION C ON D.DRIVER_ID = C.DRIVER_ID
JOIN CONSTRUCTOR CON ON C.CONSTRUCTOR_ID = CON.CONSTRUCTOR_ID;

-- QUESTION 5
-- DRIVER === D
-- COMPETITION === COMP
-- CONSTRUCTOR === CON
-- CIRCUIT === CIR
-- COUNTRY === C
SELECT D.LAST_NAME, CON.CONSTRUCTOR_NAME, CIR.DESCRIPTION, COMP.NB_OF_ROUNDS, C.NAME
FROM COMPETITION COMP
JOIN DRIVER D ON D.DRIVER_ID = COMP.DRIVER_ID
JOIN CONSTRUCTOR CON ON CON.CONSTRUCTOR_ID = COMP.CONSTRUCTOR_ID
JOIN CIRCUIT CIR ON CIR.CIRCUIT_ID = COMP.CIRCUIT_ID
JOIN COUNTRY C ON C.COUNTRY_ID = CIR.COUNTRY_ID;

-- QUESTION 6
CREATE OR REPLACE VIEW V1_COMPETITION
AS
SELECT D.LAST_NAME, CON.CONSTRUCTOR_NAME, CIR.DESCRIPTION, COMP.NB_OF_ROUNDS, C.NAME
FROM COMPETITION COMP
JOIN DRIVER D ON D.DRIVER_ID = COMP.DRIVER_ID
JOIN CONSTRUCTOR CON ON CON.CONSTRUCTOR_ID = COMP.CONSTRUCTOR_ID
JOIN CIRCUIT CIR ON CIR.CIRCUIT_ID = COMP.CIRCUIT_ID
JOIN COUNTRY C ON C.COUNTRY_ID = CIR.COUNTRY_ID;

-- QUESTION 7
CREATE OR REPLACE VIEW V2_COMPETITION
AS
SELECT D.LAST_NAME, CON.CONSTRUCTOR_NAME, COMP.DISTANCE, COMP.SPEED
FROM COMPETITION COMP
JOIN DRIVER D ON D.DRIVER_ID = COMP.DRIVER_ID
JOIN CONSTRUCTOR CON ON CON.CONSTRUCTOR_ID = COMP.CONSTRUCTOR_ID;

-- QUESTION 8
SELECT CON.CONSTRUCTOR_NAME
FROM CONSTRUCTOR CON
JOIN COMPETITION COMP ON COMP.CONSTRUCTOR_ID = CON.CONSTRUCTOR_ID
GROUP BY CON.CONSTRUCTOR_NAME
HAVING COUNT(*) >= 2;

------------------------------- EXERCISE 4 -------------------------------------

-- QUESTION 1
SELECT CIRCUIT.CIRCUIT_ID, CIRCUIT.DESCRIPTION, CIRCUIT.ROUND_LENGTH, COUNTRY.NAME
FROM CIRCUIT, COUNTRY
WHERE COUNTRY.COUNTRY_ID = CIRCUIT.COUNTRY_ID;

-- QUESTION 2
SELECT D.DRIVER_ID, D.LAST_NAME, C.DURATION
FROM DRIVER D, COMPETITION C 
WHERE D.DRIVER_ID = C.DRIVER_ID
AND C.QUIT_COMP = 'N'
ORDER BY C.DURATION DESC;

-- QUESTION 3
SELECT D.DRIVER_ID, D.LAST_NAME, D.FIRST_NAME
FROM DRIVER D, COMPETITION C
WHERE C.DRIVER_ID = D.DRIVER_ID
AND C.QUIT_COMP = 'N'
AND C.DURATION < 1.5370;

-- QUESTION 4
SELECT D.LAST_NAME, D.COUNTRY_NAME, C.NB_OF_ROUNDS, CON.CONSTRUCTOR_NAME
FROM DRIVER D, COMPETITION C, CONSTRUCTOR CON
WHERE D.DRIVER_ID = C.DRIVER_ID
AND C.CONSTRUCTOR_ID = CON.CONSTRUCTOR_ID;

-- QUESTION 5
SELECT D.LAST_NAME, CON.CONSTRUCTOR_NAME, CIR.DESCRIPTION, COMP.NB_OF_ROUNDS, C.NAME
FROM COMPETITION COMP, DRIVER D, CONSTRUCTOR CON, CIRCUIT CIR, COUNTRY C
WHERE D.DRIVER_ID = COMP.DRIVER_ID
AND CON.CONSTRUCTOR_ID = COMP.CONSTRUCTOR_ID
AND CIR.CIRCUIT_ID = COMP.CIRCUIT_ID
AND C.COUNTRY_ID = CIR.COUNTRY_ID;

-- QUESTION 6
CREATE OR REPLACE VIEW V1_COMPETITION
AS
SELECT D.LAST_NAME, CON.CONSTRUCTOR_NAME, CIR.DESCRIPTION, COMP.NB_OF_ROUNDS, C.NAME
FROM COMPETITION COMP, DRIVER D, CONSTRUCTOR CON, CIRCUIT CIR, COUNTRY C
WHERE D.DRIVER_ID = COMP.DRIVER_ID
AND CON.CONSTRUCTOR_ID = COMP.CONSTRUCTOR_ID
AND CIR.CIRCUIT_ID = COMP.CIRCUIT_ID
AND C.COUNTRY_ID = CIR.COUNTRY_ID;

-- QUESTION 7
CREATE OR REPLACE VIEW V2_COMPETITION
AS
SELECT D.LAST_NAME, CON.CONSTRUCTOR_NAME, COMP.DISTANCE, COMP.SPEED
FROM COMPETITION COMP, DRIVER D, CONSTRUCTOR CON
WHERE D.DRIVER_ID = COMP.DRIVER_ID
AND CON.CONSTRUCTOR_ID = COMP.CONSTRUCTOR_ID;

-- QUESTION 8
SELECT CON.CONSTRUCTOR_NAME
FROM CONSTRUCTOR CON, COMPETITION COMP
WHERE COMP.CONSTRUCTOR_ID = CON.CONSTRUCTOR_ID
GROUP BY CON.CONSTRUCTOR_NAME
HAVING COUNT(*) >= 2;

------------------------------- EXERCISE 6 -------------------------------------

-- QUESTION 9
SELECT D.DRIVER_ID, D.LAST_NAME, D.FIRST_NAME, C.DURATION
FROM DRIVER D
JOIN COMPETITION C ON C.DRIVER_ID = C.DRIVER_ID
WHERE C.QUIT_COMP = 'N'
AND C.DURATION <= (SELECT AVG(DURATION) FROM COMPETITION);

-- QUESTION 10
SELECT LAST_NAME, SALARY 
FROM DRIVER
WHERE SALARY > (SELECT SALARY FROM DRIVER WHERE UPPER(LAST_NAME) = UPPER('Montoya'));

-- QUESTION 11
SELECT LAST_NAME, SALARY
FROM DRIVER
WHERE SALARY = (SELECT MAX(SALARY) FROM DRIVER);

-- QUESTION 12
SELECT D.LAST_NAME, C.NB_OF_ROUNDS
FROM DRIVER D
JOIN COMPETITION C ON D.DRIVER_ID = C.DRIVER_ID
WHERE C.NB_OF_ROUNDS = (
    SELECT NB_OF_ROUNDS 
    FROM COMPETITION 
    WHERE DURATION = (
        SELECT MIN(DURATION) 
        FROM COMPETITION
        WHERE QUIT_COMP = 'N'
    ) 
);

-- QUESTION 13
SELECT CON.CONSTRUCTOR_ID, CON.CONSTRUCTOR_NAME, COUNT(*)
FROM CONSTRUCTOR CON
JOIN COMPETITION COMP ON COMP.CONSTRUCTOR_ID = CON.CONSTRUCTOR_ID
GROUP BY CON.CONSTRUCTOR_ID, CON.CONSTRUCTOR_NAME
HAVING COUNT(*) = (
    SELECT MAX(COUNT(*)) 
    FROM COMPETITION
    GROUP BY CONSTRUCTOR_ID
);

-- QUESTION 14
SELECT D.LAST_NAME, D.FIRST_NAME, COMP.SPEED
FROM DRIVER D
JOIN COMPETITION COMP ON D.DRIVER_ID = COMP.DRIVER_ID
WHERE COMP.SPEED BETWEEN (SELECT MIN(SPEED) FROM COMPETITION WHERE DRIVER_ID IN('P500', 'P900'))
AND (SELECT MAX(SPEED) FROM COMPETITION WHERE DRIVER_ID IN('P500', 'P900'));

-- QUESTION 15
SELECT D.DRIVER_ID, D.LAST_NAME, D.FIRST_NAME, C.DURATION
FROM DRIVER D
JOIN COMPETITION C ON D.DRIVER_ID = C.DRIVER_ID
WHERE C.QUIT_COMP = 'N'
AND C.DURATION < (
    SELECT AVG(DURATION)
    FROM COMPETITION
    WHERE QUIT_COMP = 'N'
);

-- QUESTION 16
SELECT DESCRIPTION, NB_OF_ROUNDS
FROM CIRCUIT
WHERE NB_OF_ROUNDS = (SELECT MAX(NB_OF_ROUNDS) FROM CIRCUIT);

-- QUESTION 17
SELECT LAST_NAME, FIRST_NAME, SALARY
FROM DRIVER
WHERE SALARY BETWEEN (SELECT MIN(SALARY) FROM DRIVER WHERE UPPER(LAST_NAME) = UPPER('SCHUMACHER'))
AND (SELECT MAX(SALARY) FROM DRIVER WHERE UPPER(LAST_NAME) = UPPER('SCHUMACHER'));

------------------------------- EXERCISE 7 -------------------------------------

-- QUESTION 18
SELECT LAST_NAME, FIRST_NAME, SALARY 
FROM DRIVER 
WHERE SALARY = (SELECT MIN(SALARY) FROM DRIVER);

-- QUESTION 20
SELECT D.LAST_NAME, D.FIRST_NAME, C.DURATION
FROM DRIVER D
LEFT JOIN COMPETITION C ON D.DRIVER_ID = C.DRIVER_ID;

-- QUESTION 21
SELECT NVL(D.LAST_NAME, 'NO DRIVER'), C.NAME
FROM DRIVER D
RIGHT JOIN COUNTRY C ON D.COUNTRY_ID = C.COUNTRY_ID;

-- QUESTION 22
SELECT COUNT(*)
FROM COUNTRY
WHERE COUNTRY_ID NOT IN (SELECT COUNTRY_ID FROM DRIVER);

-- QUESTION 23
SELECT LAST_NAME
FROM DRIVER
WHERE TO_CHAR(BIRTH_DATE, 'YYYY') = 1980;

SELECT LAST_NAME
FROM DRIVER
WHERE BIRTH_DATE BETWEEN TO_DATE('01-JAN-1980', 'DD-MON-YYYY')
AND TO_DATE('31-DEC-1980', 'DD-MON-YYYY');

-- QUESTION 24
CREATE OR REPLACE VIEW QUESTION_20
AS
SELECT D.LAST_NAME, D.FIRST_NAME, C.DURATION
FROM DRIVER D
LEFT JOIN COMPETITION C ON D.DRIVER_ID = C.DRIVER_ID;




