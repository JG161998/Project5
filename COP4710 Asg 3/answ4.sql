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
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspClass3`(IN `depName` CHAR(15), OUT `Answer` CHAR(100))
BEGIN
    
    DECLARE salarySum decimal(10,2);

    Select SUM(salary) INTO salarySum
    from employee
    where dno = (SELECT d.dnumber FROM department d WHERE d.dname = depName);
    
   
    -
    IF ( salarySum is null ) THEN
      SET Answer = concat('No department exists with the name ', depName);
    ELSE
      SET Answer = concat('The total salary of this department is ', cast(salarySum as char(15)));
    END IF;
END$$
DELIMITER ;

