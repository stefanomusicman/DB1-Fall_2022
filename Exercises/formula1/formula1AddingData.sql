-- QUESTION 1 : ADDING IN COUNTRIES TO COUNTRY TABLE
INSERT INTO COUNTRY VALUES (1, 'Britain');
INSERT INTO COUNTRY VALUES (2, 'Germany');
INSERT INTO COUNTRY VALUES (3, 'Columbia');
INSERT INTO COUNTRY VALUES (4, 'Spain');
INSERT INTO COUNTRY VALUES (5, 'Japan');
INSERT INTO COUNTRY VALUES (6, 'Portugal');
INSERT INTO COUNTRY VALUES (7, 'Canada');
INSERT INTO COUNTRY VALUES (8, 'Finland');
INSERT INTO COUNTRY VALUES (9, 'Italy');
INSERT INTO COUNTRY VALUES (10, 'Brazil');
COMMIT;

-- CHANGING FORMAT OF DATE
ALTER SESSION SET NLS_DATE_FORMAT = 'DD-MON-YYYY';

-- QUESTION 2 : ADDING IN DRIVERS TO DRIVER TABLE
-- ORDER OF COLUMNS DRIVER_ID - LAST_NAME - FIRST_NAME - BIRTH_DATE - SALARY - COUNTRY_ID - HIRE_DATE
INSERT INTO DRIVER VALUES ('P100', 'Button', 'jenson', '20-JAN-1970', 55000, 1, '12-APR-1995');
INSERT INTO DRIVER VALUES ('P200', 'Schumacher', 'michael', '13-DEC-1973', 65000, 2, '20-MAY-1990');
INSERT INTO DRIVER VALUES ('P300', 'Alonso', 'fernando', '12-JAN-1980', 58000, 4, '15-JUN-1998');
INSERT INTO DRIVER VALUES ('P400', 'Montoya', 'juan pablo', '10-FEB-1981', 56000, 3, '25-OCT-1995');
INSERT INTO DRIVER VALUES ('P500', 'Schumacher', 'ralf', '11-NOV-1977', 50000, 2, '18-MAR-1999');
INSERT INTO DRIVER VALUES ('P600', 'Sato', 'takuma', '05-MAY-1975', 57000, 5, '10-AUG-2000');
INSERT INTO DRIVER VALUES ('P700', 'Villeneuve', 'jacques', '27-JAN-1975', 65000, 7, '26-SEP-1999');
INSERT INTO DRIVER VALUES ('P800', 'Heifeld', 'nick', '22-FEB-1982', 45000, 2, '12-OCT-2000');
INSERT INTO DRIVER VALUES ('P900', 'Raikkonen', 'kimi', '12-APR-1980', 60000, 8, '25-JUL-1998');
INSERT INTO DRIVER VALUES ('P1000', 'Monteiro', 'tiago', '19-DEC-1978', 40000, 6, '17-MAY-2000');
INSERT INTO DRIVER VALUES ('P1100', 'Trulli', 'jamo', '10-MAR-1979', 42000, 9, '25-AUG-2000');
INSERT INTO DRIVER VALUES ('P1200', 'Barrichello', 'rubens', '10-MAR-1979', 47000, 10, '05-JAN-1996');
COMMIT;

-- QUESTION 3 : ADDING DATA TO THE CONSTRUCTOR DATA
INSERT INTO CONSTRUCTOR VALUES (10, 'Bar Honda');
INSERT INTO CONSTRUCTOR VALUES (20, 'Ferrari');
INSERT INTO CONSTRUCTOR VALUES (30, 'Renault');
INSERT INTO CONSTRUCTOR VALUES (40, 'Mclaren');
INSERT INTO CONSTRUCTOR VALUES (50, 'Sauber');
INSERT INTO CONSTRUCTOR VALUES (60, 'Toyota');
INSERT INTO CONSTRUCTOR VALUES (70, 'Williams');
INSERT INTO CONSTRUCTOR VALUES (80, 'Jordan');
INSERT INTO CONSTRUCTOR VALUES (90, 'Red Bull');
INSERT INTO CONSTRUCTOR VALUES (100, 'Menardi');
COMMIT;

-- QUESTION 4 : ADDING DATA TO THE CIRCUIT TABLE
-- ORDER OF COLUMNS : CIRCUIT_ID - ROUND_LENGTH - NB_OF_ROUNDS - COUNTRY_ID - DESCRIPTION
ALTER TABLE CIRCUIT MODIFY ROUND_LENGTH NUMBER(5,2); -- CHANGING TYPE TO ACCEPT DECIMALS
INSERT INTO CIRCUIT VALUES (1, 4.93, 62, 5, 'CIRCUIT DE MONACO');
INSERT INTO CIRCUIT VALUES (2, 4.33, 70, 7, 'CIRCUIT DE CANADA');
INSERT INTO CIRCUIT VALUES (3, 4.19, 73, 8, 'CIRCUIT DES USA');
COMMIT;

-- QUESTION 5 : ADDING DATA TO THE COMPETITION TABLE
-- ORDER : COMP_TYPE - DRIVER_ID - CONSTRUCTOR_ID - CIRCUIT_ID - COMP_DATE - DURATION - QUIT_COMP(NULL) - NB_OF_ROUND
INSERT INTO COMPETITION VALUES ('C', 'P900', 40, 2, TO_DATE('12-05-2005', 'DD-MM-YYYY'), 1.535833, NULL, 70);
INSERT INTO COMPETITION VALUES ('C', 'P200', 20, 2, TO_DATE('12-06-2005', 'DD-MM-YYYY'), 1.536110, NULL, 70);
INSERT INTO COMPETITION VALUES ('C', 'P1000', 80, 2, TO_DATE('12-06-2005', 'DD-MM-YYYY'), 1.53777, NULL, 67);
INSERT INTO COMPETITION VALUES ('C', 'P700', 50, 2, TO_DATE('12-06-2005', 'DD-MM-YYYY'), 1.547493, NULL, 69);
INSERT INTO COMPETITION VALUES ('C', 'P800', 70, 2, TO_DATE('12-06-2005', 'DD-MM-YYYY'), 0.932221, NULL, 43);
INSERT INTO COMPETITION VALUES ('C', 'P500', 60, 2, TO_DATE('12-06-2005', 'DD-MM-YYYY'), 1.542777, NULL, 69);
INSERT INTO COMPETITION VALUES ('C', 'P600', 10, 2, TO_DATE('12-06-2005', 'DD-MM-YYYY'), 0.915555, NULL, 40);
INSERT INTO COMPETITION VALUES ('C', 'P300', 30, 2, TO_DATE('12-06-2005', 'DD-MM-YYYY'), 0.808333, NULL, 38);
INSERT INTO COMPETITION VALUES ('C', 'P100', 10, 2, TO_DATE('12-06-2005', 'DD-MM-YYYY'), 0.986110, NULL, 46);
INSERT INTO COMPETITION VALUES ('C', 'P400', 40, 2, TO_DATE('12-06-2005', 'DD-MM-YYYY'), NULL, NULL, NULL);
COMMIT;


-- ***EXERCISE 2***

-- QUESTION 1
UPDATE DRIVER SET SALARY = SALARY + (SALARY * 0.05) WHERE SALARY > 48000;

-- QUESTION 2
UPDATE COMPETITION SET QUIT_COMP='Y' WHERE NB_OF_ROUNDS<65; 

-- QUESTION 3
UPDATE COMPETITION SET QUIT_COMP='N' WHERE NB_OF_ROUNDS>65; 

COMMIT;

-- QUESTION 4
DELETE FROM CONSTRUCTOR WHERE CONSTRUCTOR_ID=10;
  -- A. THE ERROR IS DESCRIBING HOW THE ROW WE ARE TRYING TO DELETE IS A FOREIGN KEY AND CANT BE DELETED
  -- B. CASCADE CONSTRAINTS
  
-- QUESTION 5
UPDATE DRIVER SET LAST_NAME=UPPER(LAST_NAME);
COMMIT;

-- QUESTION 6
UPDATE DRIVER SET FIRST_NAME=INITCAP(FIRST_NAME);
COMMIT;

-- QUESTION 7 (ALREADY DONE)

-- QUESTION 8
UPDATE COMPETITION SET DURATION=DURATION + 0.006944445 WHERE DRIVER_ID='P100';
COMMIT;

-- QUESTION 9
  -- A.
  ALTER TABLE DRIVER ADD COUNTRY_NAME VARCHAR(20);
  -- B.
  UPDATE DRIVER SET COUNTRY_NAME=(SELECT NAME FROM COUNTRY WHERE COUNTRY.COUNTRY_ID = DRIVER.COUNTRY_ID);
COMMIT;  

-- QUESTION 10
  -- A.
  ALTER TABLE COMPETITION ADD DISTANCE NUMBER(5,2);
  -- B.
  UPDATE COMPETITION SET DISTANCE=(SELECT (CIRCUIT.ROUND_LENGTH * CIRCUIT.NB_OF_ROUNDS) FROM CIRCUIT WHERE CIRCUIT.CIRCUIT_ID = COMPETITION.CIRCUIT_ID);
COMMIT;

-- QUESTION 11
  -- A.
  ALTER TABLE COMPETITION ADD SPEED NUMBER(5,2);
  
  --B.
  UPDATE COMPETITION SET SPEED = DISTANCE / DURATION;
COMMIT;

