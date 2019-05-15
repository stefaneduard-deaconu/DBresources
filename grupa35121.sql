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
update emp_sde e
set (salary, commission_pct) = (
    select salary, commission_pct
    from emp_sde
    where employee_id = e.manager_id
) where salary = (
        select min(salary)
        from emp_sde
        );

select * from emp_sde where deparment_id = 132;

--19

desc emp_sde;
select email from emp_sde;

update emp_sde
set (email) = (
        select upper(substr(last_name, 1, 1)) || coalesce(upper(first_name))
        from emp_sde as selected
        where selected.salary = (select max(salary)
                       from emp_sde as emp
                       where emp.department_id = selected.department_id)
)

(salary, nvl(department_id, -1)) in (

--20. Pentru fiecare departament s? se m?reasc? salariul celor care au fost angaja?i primii astfel
--încât s? devin? media salariilor din companie. ?ine?i cont de liniile introduse anterior.

UPDATE emp_sde o
SET salary = (
    SELECT SUM(salary) / COUNT(1)
    FROM emp_sde
)
WHERE hire_date = (
    SELECT MIN(hire_date)
    FROM emp_sde i
    WHERE (i.department_id = o.department_id)
    GROUP BY department_id
) AND salary < (
    SELECT SUM(salary) / COUNT(1)
    FROM emp_sde
);


update emp_sde
set salary = (
    select sum(nvl(salary, 0)) / count(*)
    from emp_sde
    where hire_date = (select min(hire_date)
                      from emp_sde emp_min
                      where department_id = emp_min.department_id
          )
    );

--21
update emp_sde
set (job_id, department_id) = (
    select job_id, department_id
    from emp_sde
    where employee_id = 205
    );

--22
