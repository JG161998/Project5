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
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspClass`(IN `depName` CHAR(15), OUT `Answer` CHAR(100))
BEGIN
    -- Declare the local variable here
    DECLARE lastName char(12);
    DECLARE firstName char(12);

    Select lname INTO lastName
    from employee
    where ssn = (SELECT d.mgrssn FROM department d WHERE d.dname = depName);
    
    Select fname INTO firstName
    from employee
    where ssn = (SELECT d.mgrssn FROM department d WHERE d.dname = depName);
    -- check if the income value is present
    IF ( lastName is null ) THEN
      SET Answer = concat('No department exists with the name ', depName);
    ELSE
      SET Answer = concat('Name of Manager of ',
	               depName, ' is ', firstName, ' ', lastName);
    END IF;
END$$
DELIMITER ;

