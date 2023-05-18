-- CONNECT TO FORMULA 1

-- QUESTION 1
SELECT COUNT(*) FROM COMPETITION WHERE QUIT_COMP = 'N';

-- QUESTION 2
SELECT COUNT(*) FROM COMPETITION WHERE DURATION IS NOT NULL;

-- QUESTION 3
SELECT SUM(SALARY), AVG(SALARY), MIN(SALARY), MAX(SALARY) FROM DRIVER;

-- QUESTION 4
SELECT COUNT(DRIVER_ID) FROM COMPETITION WHERE QUIT_COMP = 'Y';

-- QUESTION 5
SELECT COUNT(*) FROM DRIVER WHERE HIRE_DATE >= '95-01-01' AND HIRE_DATE <= '95-12-31';

-- QUESTION 6
SELECT COUNTRY_ID, SUM(SALARY) FROM DRIVER GROUP BY COUNTRY_ID;

-- QUESTION 7
SELECT COUNT(*) DRIVERS FROM COMPETITION WHERE NB_OF_ROUNDS > 67; 

-- QUESTION 8
SELECT COUNTRY_NAME, COUNT(*)
FROM DRIVER
HAVING COUNT(*)>=2
GROUP BY COUNTRY_NAME;

-----------------------------------------------------------------------------
-- EXERCISE 3

-- QUESTION 1
SELECT C.CIRCUIT_ID, C.DESCRIPTION, C.ROUND_LENGTH, CC.NAME FROM CIRCUIT C
JOIN COUNTRY CC ON C.COUNTRY_ID = CC.COUNTRY_ID;

-- QUESTION 2
SELECT D.DRIVER_ID, D.FIRST_NAME, D.LAST_NAME FROM DRIVER D
JOIN COMPETITION C ON C.DRIVER_ID = D.DRIVER_ID
WHERE C.QUIT_COMP = 'N'
ORDER BY C.DURATION DESC;

-- QUESTION 3
SELECT D.DRIVER_ID, D.FIRST_NAME, D.LAST_NAME FROM DRIVER D
JOIN COMPETITION C ON C.DRIVER_ID = D.DRIVER_ID
WHERE C.QUIT_COMP = 'N' AND C.DURATION < 1.5370;

-- QUESTION 4
SELECT D.LAST_NAME, D.COUNTRY_NAME, CON.CONSTRUCTOR_NAME, COMP.NB_OF_ROUNDS FROM COMPETITION COMP
JOIN CONSTRUCTOR CON ON CON.CONSTRUCTOR_ID = COMP.CONSTRUCTOR_ID
JOIN DRIVER D ON COMP.DRIVER_ID = D.DRIVER_ID;

-- QUESTION 5
SELECT D.LAST_NAME, CON.CONSTRUCTOR_NAME, CIR.DESCRIPTION, COMP.NB_OF_ROUNDS, C.NAME FROM COMPETITION COMP
JOIN CIRCUIT CIR ON CIR.CIRCUIT_ID = COMP.CIRCUIT_ID
JOIN CONSTRUCTOR CON ON COMP.CONSTRUCTOR_ID = CON.CONSTRUCTOR_ID
JOIN DRIVER D ON D.DRIVER_ID = COMP.DRIVER_ID
JOIN COUNTRY C ON D.COUNTRY_ID = C.COUNTRY_ID;

-- QUESTION 6
CREATE VIEW V1_COMPETITION AS
SELECT D.LAST_NAME, CON.CONSTRUCTOR_NAME, CIR.DESCRIPTION, COMP.NB_OF_ROUNDS, C.NAME FROM COMPETITION COMP
JOIN CIRCUIT CIR ON CIR.CIRCUIT_ID = COMP.CIRCUIT_ID
JOIN CONSTRUCTOR CON ON COMP.CONSTRUCTOR_ID = CON.CONSTRUCTOR_ID
JOIN DRIVER D ON D.DRIVER_ID = COMP.DRIVER_ID
JOIN COUNTRY C ON D.COUNTRY_ID = C.COUNTRY_ID;

-- QUESTION 7
CREATE VIEW V2_COMPETITION AS 
SELECT D.LAST_NAME, CON.CONSTRUCTOR_NAME, COMP.SPEED FROM DRIVER D
JOIN COMPETITION COMP ON D.DRIVER_ID = COMP.DRIVER_ID
JOIN CONSTRUCTOR CON ON COMP.CONSTRUCTOR_ID = CON.CONSTRUCTOR_ID;

SELECT * FROM V2_COMPETITION;

-- QUESTION 8 (NOT CORRECT)
SELECT CON.CONSTRUCTOR_NAME, COUNT(*) FROM COMPETITION COMP
JOIN DRIVER D ON COMP.DRIVER_ID = D.DRIVER_ID
JOIN CONSTRUCTOR CON ON CON.CONSTRUCTOR_ID = COMP.CONSTRUCTOR_ID
HAVING COUNT(*)>=2
GROUP BY CON.CONSTRUCTOR_NAME;
