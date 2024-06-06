/*  ========================================================

     Name: ______Joshua Gomez___________________

     Panther-ID: x x x -__2979_____

     Course: COP 4710 

     Assignment#: 3

     Due: Wed, Mar 15, 2023

     I hereby certify that this work is my own and none of
     it is the work of any other person.

                             Signature: ___Joshua Gomez___________________
     =========================================================
     */
     DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspClass1`(IN `depName` CHAR(20), OUT `Answer` CHAR(100))
BEGIN
    -- Declare the local variable here
    DECLARE employeeCount char(12);

    Select count(dno) INTO employeeCount
    from employee
    where dno = (SELECT d.dnumber FROM department d WHERE d.dname = depName);
    
   
    -- check if the income value is present
    IF ( employeeCount is null ) THEN
      SET Answer = concat('No department exists with the name ', depName);
    ELSE
      SET Answer = concat('The number of employees is ', employeeCount);
    END IF;
END$$
DELIMITER ;