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
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspClass2`(IN `depName` CHAR(15), OUT `Answer` CHAR(150))
BEGIN
    -- Declare the local variable here
    DECLARE hourSum decimal(10,1);

    Select SUM(hours) INTO hourSum
    from works_on
    where pno = (SELECT p.pnumber from project p WHERE p.dnum =(SELECT d.dnumber FROM department d WHERE d.dname = depName));
    
   
    -- check if the income value is present
    IF ( hourSum is null ) THEN
      SET Answer = concat('No department exists with the name ', depName);
    ELSE
      SET Answer = concat('The total number of hours worked on a project in this department is ', cast(hourSum as char(15)));
    END IF;
END$$
DELIMITER ;