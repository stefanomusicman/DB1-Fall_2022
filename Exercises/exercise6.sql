-- QUESTION 9
SELECT D.DRIVER_ID, D.FIRST_NAME, D.LAST_NAME, COMP.DURATION 
FROM DRIVER D
JOIN COMPETITION COMP ON D.DRIVER_ID = COMP.DRIVER_ID
WHERE COMP.DURATION > (SELECT AVG(DURATION) FROM COMPETITION)
AND COMP.QUIT_COMP = 'N';

-- QUESTION 10
SELECT LAST_NAME, SALARY FROM DRIVER 
WHERE SALARY > (SELECT SALARY FROM DRIVER WHERE LAST_NAME = 'MONTOYA');

-- QUESTION 11
SELECT LAST_NAME, SALARY FROM DRIVER
WHERE SALARY = (SELECT MAX(SALARY) FROM DRIVER);

-- QUESTION 12
SELECT D.LAST_NAME, COMP.NB_OF_ROUNDS FROM DRIVER D
JOIN COMPETITION COMP ON D.DRIVER_ID = COMP.DRIVER_ID
WHERE COMP.NB_OF_ROUNDS = (SELECT MIN(NB_OF_ROUNDS) FROM COMPETITION WHERE QUIT_COMP = 'N');

-- QUESTION 13
SELECT CONSTRUCTOR_ID, CONSTRUCTOR_NAME FROM CONSTRUCTOR 
WHERE CONSTRUCTOR_ID IN(SELECT COUNT(CONSTRUCTOR_ID) FROM COMPETITION);

-- QUESTION 14
SELECT D.LAST_NAME, D.FIRST_NAME, COMP.SPEED 
FROM DRIVER D
JOIN COMPETITION COMP ON D.DRIVER_ID = COMP.DRIVER_ID
WHERE COMP.SPEED > (SELECT SPEED FROM COMPETITION WHERE DRIVER_ID = 'P500') 
AND COMP.SPEED < (SELECT SPEED FROM COMPETITION WHERE DRIVER_ID = 'P900');

-- QUESTION 15
SELECT D.DRIVER_ID, D.LAST_NAME, D.FIRST_NAME, C.DURATION
FROM DRIVER D
JOIN COMPETITION C ON D.DRIVER_ID = C.DRIVER_ID
WHERE DURATION > (SELECT AVG(DURATION) FROM COMPETITION WHERE QUIT_COMP = 'N')
AND C.QUIT_COMP = 'N';

-- QUESTION 16
SELECT DESCRIPTION
FROM CIRCUIT
WHERE NB_OF_ROUNDS = (SELECT MAX(NB_OF_ROUNDS) FROM CIRCUIT);

-- QUESTION 17
SELECT LAST_NAME, FIRST_NAME, SALARY 
FROM DRIVER
WHERE SALARY > (SELECT SALARY FROM DRIVER WHERE FIRST_NAME = 'Ralf')
AND SALARY < (SELECT SALARY FROM DRIVER WHERE FIRST_NAME = 'Michael');

