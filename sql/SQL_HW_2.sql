-- 1. Создать таблицу employees:
-- - id (serial, primary key),
-- - employee_name (varchar(50), not null)

CREATE TABLE employees (
	id SERIAL PRIMARY KEY,
	employee_name VARCHAR(50) UNIQUE NOT NULL
)

-- 2. Наполнить таблицу employee 70 строками

INSERT INTO employees (employee_name)
VALUES ('Robert Harris'),
	('Francis Lawson'),
	('Frank Robinson'),
	('Laura Baker'),
	('Andrea Campbell'),
	('Vivian Clarke'),
	('Rachel Robbins'),
	('Walter Carroll'),
	('Monica Welch'),
	('Amy Walton'),
	('Christopher Wright'),
	('Mark Hardy'),
	('Agnes Rogers'),
	('Laura Gray'),
	('Sue Roberson'),
	('Jo Foster'),
	('Lisa Jordan'),
	('Jose Hall'),
	('Helen Thomas'),
	('Jesse Harvey'),
	('Chris Gonzales'),
	('Erik Diaz'),
	('Sarah Lawson'),
	('Mary Snyder'),
	('Daniel Martin'),
	('Bruce Hunter'),
	('Ashley Wright'),
	('Charles Jackson'),
	('Rene Miller'),
	('Rita Meyer'),
	('Denise Manning'),
	('Christopher Morris'),
	('Shannon Edwards'),
	('Sandra Pope'),
	('Rhonda Williams'),
	('Marjorie Parsons'),
	('Ricky Lewis'),
	('Bertha Curtis'),
	('Ruby Stanley'),
	('Joshua Johnson'),
	('Theresa Rodriguez'),
	('Gladys Jennings'),
	('John Estrada'),
	('Randy Harrington'),
	('Donna Perez'),
	('Mark Boyd'),
	('Joseph Brown'),
	('David Richardson'),
	('Frank Mitchell'),
	('Roy Lee'),
	('Charlie Evans'),
	('Javier Martinez'),
	('Billy Reynolds'),
	('Irene Miller'),
	('Maria West'),
	('Fred Cooper'),
	('Harold Garcia'),
	('Rita Brown'),
	('Jerry Moore'),
	('Dorothy Edwards'),
	('Brian Vega'),
	('Emma Howard'),
	('Ella Gonzalez'),
	('Michelle Hall'),
	('Christine Stevenson'),
	('Marie Johnson'),
	('James Watson'),
	('James Smith'),
	('Michelle Torres'),
	('Sandra Hunt')
 
-- 3. Создать таблицу salary:
-- - id (serial, primary key),
-- - monthly_salary (int, not null)

CREATE TABLE salary (
	id SERIAL PRIMARY KEY,
	monthly_salary INT UNIQUE NOT NULL
)

-- 4. Наполнить таблицу salary 16 строками

INSERT INTO salary (monthly_salary)
VALUES ('1000'),
	('1100'),
	('1200'),
	('1300'),
	('1400'),
	('1500'),
	('1600'),
	('1700'),
	('1800'),
	('1900'),
	('2000'),
	('2100'),
	('2200'),
	('2300'),
	('2400'),
	('2500')

-- 5. Создать таблицу employee_salary:
-- - id (serial, primary key),
-- - employee_id (int, not null, unique)
-- - salary_id (int, not null)

CREATE TABLE employee_salary (
	id SERIAL PRIMARY KEY,
	employee_id INT UNIQUE NOT NULL,
	salary_id INT NOT NULL
)

-- 6. Наполнить таблицу employee_salary 40 строками:
-- - в 10 строк из 40 вставить несуществующие employee_id

INSERT INTO employee_salary (employee_id, salary_id)
VALUES ('1', '1'),
	('2', '2'),
	('3', '3'),
	('4', '4'),
	('5', '5'),
	('6', '6'),
	('7', '7'),
	('8', '8'),
	('9', '9'),
	('10', '10'),
	('11', '11'),
	('12', '12'),
	('13', '13'),
	('14', '14'),
	('15', '15'),
	('16', '16'),
	('17', '1'),
	('18', '2'),
	('19', '3'),
	('20', '4'),
	('21', '5'),
	('22', '6'),
	('23', '7'),
	('24', '8'),
	('25', '9'),
	('26', '10'),
	('27', '11'),
	('28', '12'),
	('29', '13'),
	('30', '14'),
	('71', '15'),
	('72', '16'),
	('73', '1'),
	('74', '2'),
	('75', '3'),
	('76', '4'),
	('77', '5'),
	('78', '6'),
	('79', '7'),
	('80', '8')

-- 7. Создать таблицу roles
-- - id (serial, primary key),
-- - role_name (int, not null, unique)
	
CREATE TABLE roles (
	id SERIAL PRIMARY KEY,
	role_name INT UNIQUE NOT NULL
)

-- 8. Поменять тип столба role_name с int на varchar(30)

ALTER TABLE roles ALTER COLUMN role_name TYPE VARCHAR(30)

-- 9. Наполнить таблицу roles 20 строками

INSERT INTO roles
VALUES (1, 'Junior Python developer'),
	(2, 'Middle Python developer'),
	(3, 'Senior Python developer'),
	(4, 'Junior Java developer'),
	(5, 'Middle Java developer'),
	(6, 'Senior Java developer'),
	(7, 'Junior JavaScript developer'),
	(8, 'Middle JavaScript developer'),
	(9, 'Senior JavaScript developer'),
	(10, 'Junior Manual QA engineer'),
	(11, 'Middle Manual QA engineer'),
	(12, 'Senior Manual QA engineer'),
	(13, 'Project Manager'),
	(14, 'Designer'),
	(15, 'HR'),
	(16, 'CEO'),
	(17, 'Sales manager'),
	(18, 'Junior Automation QA engineer'),
	(19, 'Middle Automation QA engineer'),
	(20, 'Senior Automation QA engineer')

-- 10. Создать таблицу roles_employee
-- - id (serial, primary key),
-- - employee_id (int, not null, unique (внешний ключ для таблицы employees, поле id))
-- - role_id (int, not null (внешний ключ для таблицы roles, поле id))

CREATE TABLE roles_employee (
	id SERIAL PRIMARY KEY,
	employee_id INT UNIQUE NOT NULL,
	role_id INT NOT NULL,
	FOREIGN KEY (employee_id)
		REFERENCES employees (id),
	FOREIGN KEY (role_id)
		REFERENCES roles (id)
)

-- 11. Наполнить таблицу roles_employee 40 строками

INSERT INTO roles_employee (employee_id, role_id)
VALUES (7, 2),
	(20, 4),
	(3, 9),
	(5, 13),
	(23, 4),
	(11, 2),
	(10, 9),
	(22, 13),
	(21, 3),
	(34, 4),
	(6, 7),
	(1, 2),
	(2, 4),
	(4, 9),
	(8, 13),
	(9, 4),
	(12, 2),
	(13, 9),
	(14, 13),
	(15, 3),
	(16, 4),
	(17, 7),
	(18, 2),
	(19, 4),
	(24, 9),
	(25, 13),
	(26, 4),
	(27, 2),
	(28, 9),
	(29, 13),
	(30, 3),
	(31, 4),
	(32, 7),
	(33, 2),
	(35, 4),
	(36, 9),
	(37, 13),
	(38, 4),
	(39, 2),
	(40, 9)