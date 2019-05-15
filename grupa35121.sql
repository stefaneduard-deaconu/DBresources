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
