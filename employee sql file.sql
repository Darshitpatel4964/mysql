-- Create All Table --
CREATE TABLE `hobby`
  (
     id   INT NOT NULL auto_increment,
     name VARCHAR(30) NOT NULL,
     PRIMARY KEY (id)
  );

CREATE TABLE `employee`
  (
     id            INT NOT NULL auto_increment,
     first_name    VARCHAR(30) NOT NULL,
     last_name     VARCHAR(30) NOT NULL,
     age           INT NOT NULL,
     mobile_number VARCHAR(17) NOT NULL,
     address       VARCHAR(255) NOT NULL,
     PRIMARY KEY (id)
  );

CREATE TABLE `employee_salary`
  (
     id             INT NOT NULL auto_increment,
     fk_employee_id INT NOT NULL,
     salary         DOUBLE NOT NULL,
     date           DATE NOT NULL,
     PRIMARY KEY (id),
     FOREIGN KEY (fk_employee_id) REFERENCES employee(id)
  );

CREATE TABLE `employee_hobby`
  (
     id             INT NOT NULL auto_increment,
     fk_employee_id INT NOT NULL,
     fk_hobby_id    INT NOT NULL,
     PRIMARY KEY (id),
     FOREIGN KEY (fk_employee_id) REFERENCES employee(id),
     FOREIGN KEY (fk_hobby_id) REFERENCES hobby(id)
  ); 

-- Insert All Table --
INSERT INTO hobby
            (id,
             NAME)
VALUES      (1,
             'Reading Books'),
            (2,
             'Watching movie'),
            (3,
             'Travaling with family'),
            (4,
             'watching t.v'),
            (5,
             'playing gitar'),
            (6,
             'playing tabla');

INSERT INTO employee
            (id,
             first_name,
             last_name,
             age,
             mobile_number,
             address)
VALUES      (1,
             'Darshit',
             'Patel',
             22,
             '7990796103',
             '47,Bhavda Jay Somnath Society,odhav'),
            (2,
             'Jay',
             'Pansuriya',
             22,
             '9898764565',
             '103,Pushkar Residency,odhav'),
            (3,
             'vasu',
             'Sheladiya',
             20,
             '9998786772',
             '11,Aadarsh villas,nikol'),
            (4,
             'Anjali',
             'Bihola',
             22,
             '9987675667',
             'c-201,Madhav Appartment, vastral'),
            (5,
             'Rohan',
             'Patel',
             26,
             '7990343093',
             '42,Bhavda Jay Somnath Society,odhav'),
            (6,
             'Shivang',
             'Gohel',
             25,
             '7345768789',
             '101,Abjibapa Green, nikol');

INSERT INTO employee_salary
            (id,
             fk_employee_id,
             salary,
             date)
VALUES      (1,
             5,
             15000.00,
             '2022-09-06' ),
            (2,
             6,
             16000.00,
             '2022-09-07'),
            (3,
             4,
             17000.00,
             '2022-09-08'),
            (4,
             3,
             18000.00,
             '2022-09-09'),
            (5,
             2,
             19000.00,
             '2022-09-10'),
            (6,
             1,
             20000.00,
             '2022-09-05');
             
INSERT INTO employee_hobby
            (fk_employee_id,
             fk_hobby_id)
VALUES      (1,
             3),
            (2,
             2),
            (3,
             4),
            (4,
             1),
            (5,
             6),
            (6,
             5);
  
-- Update Record Of All Tables --
UPDATE hobby
SET    NAME = 'playing hockey'
WHERE  id = 2;

UPDATE employee
SET    first_name = 'Vasu',
       last_name = 'Sheladiya',
       age = 21
WHERE  id = 3;

UPDATE employee_salary
SET    salary = 22000.00,
       date = '2022-09-12'
WHERE  id = 6;

UPDATE employee_hobby
SET    fk_employee_id = 4,
       fk_hobby_id = 1
WHERE  id = 4; 
  
-- Delete two data for all tables --
SET foreign_key_checks = 0; -- to disable them
DELETE FROM employee
WHERE  id BETWEEN 5 AND 6;

DELETE FROM hobby
WHERE  id BETWEEN 5 AND 6;

DELETE FROM employee_salary
WHERE  id BETWEEN 5 AND 6;

DELETE FROM employee_hobby
WHERE  id BETWEEN 5 AND 6;
SET foreign_key_checks=1; -- to re-enable them

-- Truncate All Tables --
TRUNCATE TABLE employee;

TRUNCATE TABLE hobby;

TRUNCATE TABLE employee_salary;

TRUNCATE TABLE employee_hobby; 

-- Create a separate select queries to get a hobby, employee, employee_salary, employee_hobby. --
SELECT *
FROM   employee;

SELECT *
FROM   hobby;

SELECT *
FROM   employee_salary;

SELECT *
FROM   employee_hobby; 
  
-- Create a select single query to get all employee name, all hobby_name in single column --
SELECT Concat(first_name, ' ', last_name) AS employee_name_hobby_name
FROM   employee
UNION ALL
SELECT name
FROM   hobby; 

-- Create a select query to get  employee name, his/her employee_salary --
SELECT Concat(e.first_name, ' ', e.last_name) AS employee_name,
       es.salary
FROM   employee e
       LEFT JOIN employee_salary es
               ON e.id = es.fk_employee_id; 
  
-- Create a select query to get employee name, total salary of employee, hobby name(comma-separated - you need to use subquery for hobby name). --
SELECT Concat(e.first_name, ' ', e.last_name) AS full_name,
       Sum(es.salary)                         AS total_salary,
       (SELECT Group_concat(h.NAME)
        FROM   hobby h
        WHERE  h.id = eh.fk_hobby_id)         AS hobby_name
FROM   employee_hobby eh
       INNER JOIN employee e
               ON e.id = eh.fk_employee_id
       INNER JOIN employee_salary es
               ON es.fk_employee_id = eh.fk_employee_id
GROUP  BY eh.fk_employee_id;  





    
    
    
    
  
 
 

  
 
 
  
 
 
 




 


