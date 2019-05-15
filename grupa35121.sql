--insert all
--when salary between * and * into emp1_sde
--...;

--14
create table emp0_sde as select * from employees where 1=0;

INSERT all
WHEN department_id = 80 THEN INTO ...
 …
 ELSE INTO emp3_sde
SELECT * FROM employees;
SELECT * FROM emp1_sde;


--15

select * from emp_sde;
rollback;


--16


--attention: LDD commands implicitly make a commit

update emp_sde
set job_id = 'SA_REP'
where department_id = 80 and commission_pct is not null;

--17

update dep_sde
set manager_id = (select employee_id from emp_sde
                  where first_name || ' ' || last_name = 'Douglas Grant')
where department_id = 20;

select * from dep_sde where department_id = 20;
rollback;

--18

update emp_sde
set (salary, commission_pct) = (select mng.salary, mng.commission_pct
                                from emp_sde mng, emp_sde emp
                                where mng.employee_id = emp.manager_id
                                      and emp.salary = (select min(salary) from emp_sde));