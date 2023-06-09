-- QUESTION 18
-- QUERY 1
SELECT LAST_NAME, SALARY
FROM DRIVER 
WHERE SALARY = (SELECT MIN(SALARY) FROM DRIVER);

-- QUERY 2
SELECT LAST_NAME, SALARY
FROM DRIVER D, (SELECT MIN(SALARY) LOW FROM DRIVER) LOW_SAL
WHERE D.SALARY = LOW_SAL.LOW;

-- QUESTION 19
SELECT DESCRIPTION
FROM CIRCUIT C, (SELECT MAX(NB_OF_ROUNDS) MOST FROM CIRCUIT) MAX_RD
WHERE C.NB_OF_ROUNDS = MAX_RD.MOST;

-- QUESTION 20
SELECT D.FIRST_NAME, D.LAST_NAME, C.DURATION
FROM DRIVER D
RIGHT JOIN COMPETITION C
ON D.DRIVER_ID = C.DRIVER_ID;

-- QUESTION 21
SELECT C.NAME COUNTRY, LAST_NAME DRIVER
FROM DRIVER D
FULL OUTER JOIN COUNTRY C
ON D.COUNTRY_ID = C.COUNTRY_ID;

-- QUESTION 22
SELECT C.NAME
FROM COUNTRY C
JOIN DRIVER D ON D.COUNTRY_NAME = C.NAME
WHERE DRIVER_ID NOT IN (SELECT DRIVER_ID FROM COMPETITION);

-- QUESTION 23
-- QUERY 1
SELECT LAST_NAME 
FROM DRIVER
WHERE BIRTH_DATE > ('80-01-01') AND BIRTH_DATE < ('80-12-31');

-- QUERY 2
SELECT LAST_NAME 
FROM DRIVER D, (SELECT BIRTH_DATE BDATE FROM DRIVER WHERE BIRTH_DATE > ('80-01-01') AND BIRTH_DATE < ('80-12-31')) BDAY
WHERE D.BIRTH_DATE = BDAY.BDATE;

-- QUESTION 24
CREATE OR REPLACE VIEW COUNTRIES_OF_DRIVERS AS 
SELECT D.FIRST_NAME, D.LAST_NAME, C.DURATION
FROM DRIVER D
RIGHT JOIN COMPETITION C
ON D.DRIVER_ID = C.DRIVER_ID;


