  DROP DATABASE IF EXISTS exercise;
  CREATE DATABASE exercise;
  USE exercise;


  CREATE TABLE region(
    region_id INT(11) NOT NULL,
    region_name VARCHAR(25) DEFAULT NULL,
    PRIMARY KEY(region_id)
  )ENGINE=InnoDB DEFAULT CHARSET=utf8;
  INSERT INTO region VALUES (1,'北京');
  INSERT INTO region VALUES (2,'南京');


  CREATE TABLE grade(
    grade_level VARCHAR(3) DEFAULT NULL,
    lowest_sal DECIMAL(10,0) DEFAULT NULL,
    hight_sal DECIMAL(10,0) DEFAULT NULL
  )ENGINE=InnoDB DEFAULT CHARSET=utf8;
  INSERT INTO grade VALUES('大神','800','1000');
  INSERT INTO grade VALUES('super大神','1800','11000');


  CREATE TABLE department(
    department_id INT(4) NOT NULL AUTO_INCREMENT,
    department_name VARCHAR(30) NOT NULL,
    manager_id INT(6) DEFAULT NULL,
    location_id INT(4) DEFAULT NULL,
    PRIMARY KEY(department_id),
    KEY(location_id)

  )ENGINE=InnoDB DEFAULT CHARSET=utf8;
  INSERT INTO department VALUES(1,'腾讯',1,1);
  INSERT INTO department VALUES(2,'腾讯',1,1);





  CREATE TABLE employee(
    employee_id INT(6) NOT NULL  AUTO_INCREMENT,
    first_name VARCHAR(20) DEFAULT NULL,
    last_name VARCHAR(25) NOT NULL,
    email VARCHAR(25) NOT NULL,
    phone_int VARCHAR(20) DEFAULT NULL,
    hire_date DATE NOT NULL,
    job_id VARCHAR(10) NOT NULL,
    salary DECIMAL(8,2) DEFAULT NULL,
    commission_pct DECIMAL(2,2),
    manager_id INT(6) DEFAULT NULL,
    department_id INT(4) DEFAULT NULL,
    PRIMARY KEY(employee_id),
    UNIQUE KEY(email),
    KEY job_id(job_id)

  )ENGINE=InnoDB DEFAULT CHARSET=utf8;
  INSERT INTO `exercise`.`employee` (`employee_id`, `first_name`, `last_name`, `email`, `phone_int`, `hire_date`, `job_id`, `salary`, `commission_pct`, `manager_id`, `department_id`) VALUES ('１', 'FFF', 'LLL', 'a1@q.com', '12345678900', '1989-01-12', '1', '1', '0.2', '1', '1');
  INSERT INTO `exercise`.`employee` (`employee_id`, `first_name`, `last_name`, `email`, `phone_int`, `hire_date`, `job_id`, `salary`, `commission_pct`, `manager_id`, `department_id`) VALUES ('2', 'QQQ', 'WWW', 'a2@q.com', '12345678900', '2000-01-12', '1', '1', '0.2', '1', '2');
  INSERT INTO `exercise`.`employee` (`employee_id`, `first_name`, `last_name`, `email`, `phone_int`, `hire_date`, `job_id`, `salary`, `commission_pct`, `manager_id`, `department_id`) VALUES ('3', 'ZZZ', 'DSF', 'a3@q.com', '12345678900', '1901-01-12', '1', '1', '0.2', '1', '1');
  INSERT INTO `exercise`.`employee` (`employee_id`, `first_name`, `last_name`, `email`, `phone_int`, `hire_date`, `job_id`, `salary`, `commission_pct`, `manager_id`, `department_id`) VALUES ('4', 'QQQF', 'WWWF', 'a4@q.com', '12345678900', '2002-01-12', '1', '1', '0.2', '1', '2');








  CREATE TABLE location(
    location_id INT(4) NOT NULL AUTO_INCREMENT,
    street_address VARCHAR(40) DEFAULT NULL,
    postal_code VARCHAR(12) DEFAULT NULL,
    city VARCHAR(30) NOT NULL,
    state_province VARCHAR(25) DEFAULT NULL,
    country_id char(2) DEFAULT NULL,
    PRIMARY KEY(location_id),
    KEY(country_id)
  )ENGINE=InnoDB DEFAULT CHARSET=utf8;



  CREATE TABLE country(
    country_id char(2) NOT NULL,
    country_name VARCHAR(40) DEFAULT NULL,
    region_id INT(11) DEFAULT NULL,
    PRIMARY KEY(country_id),
    KEY(region_id)
  )ENGINE=InnoDB DEFAULT CHARSET=utf8;







  CREATE TABLE history(
    employee_id INT(6) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    job_id VARCHAR(40) NOT NULL,
    department_id INT(4) DEFAULT NULL,
    PRIMARY KEY(employee_id, start_date)
  )ENGINE=InnoDB DEFAULT CHARSET=utf8;



  --1 select concat(first_name,last_name) as legalname,email ,phone_int from employee;
  --2 select concat(first_name,last_name) as legalname,salary, salary * 12 as yearSalary from employee;
  --3 select concat(first_name,last_name) as legalname,salary, salary * 12*commission_pct as yearSalary from employee;
  --4 select distinct d.department_id,e.job_id from employee e join department d using(department_id)
  --5 select * from employee e where e.hire_date > '1999-00-00'
  --6 select * from employee e join department d on(e.employee_id = d.manager_id)
  --7 select e.department_id,e.salary from employee e  order by e.department_id desc,e.salary desc
  --8 select concat(first_name,last_name) as legalname, salary * 12*(1+commission_pct) as yearSalary from employee;
  --9 select e.employee_id,IFNULL(e.department_id,"未分配部门") from employee e
  --10 select e.department_id,AVG(e.salary) from employee e group by e.department_id
  --11 select e.department_id,AVG(e.salary) from employee e group by e.department_id having AVG(e.salary)>8000
  --12 select h.employee_id,COUNT(h.employee_id) from history h group by h.employee_id
  --13
   select year,COUNT(employee_id) from employee right join (
        select 1995 year union
        select 1996 year union
        select 1997	year union
        select 1998 year
        ) yearTable on(YEAR(employee.hire_date) = yearTable.year)
        group by year



  --16 select e.employee_id,g.grade_level from employee e join grade g where e.salary between g.lowest_sal and g.hight_sal
  --17 select * from employee e where  e.commission_pct > 0
  --18 select * from employee e1 where e1.employee_id in ( select e2.manager_id from employee e2 where e2.last_name='Ki')
  --19 select * from employee where employee.salary = ( select MIN(e1.salary) from employee e1 )
  --20 select * from employee where employee.salary = ( select MAX(e1.salary) from employee e1 where YEAR(e1.hire_date) = 1999)
  --21 select