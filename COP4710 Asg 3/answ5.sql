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
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspClass4`(IN `depName` CHAR(12), OUT `Answer` CHAR(150))
BEGIN
    -- Declare the local variable here
    DECLARE departmentCount int(20);

    Select Count(*) INTO departmentCount
    from employee JOIN dependent ON ssn = essn
    where dno = (SELECT d.dnumber FROM department d WHERE d.dname = departmentName);
    
   
    -- check if the income value is present
    IF ( departmentCount is null ) THEN
      SET Answer = concat('No department exists with the name ', departmentName);
    ELSE
      SET Answer = concat('The number  of dependents of employees in this department is ', cast(departmentCount as char(15)));
    END IF;
END$$
DELIMITER ;