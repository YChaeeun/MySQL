### LIKE
-- use to get rows that contain specific 'string' under conditions
-- under_bar( _ ) : one character each
-- % : every character (the numer of characters is not limitted)

# 이름이 Tommaso 사원의 사원번호, 이름을 가져온다
select emp_no, first_name, last_name
from employees
where first_name = 'Tommaso';

# 이름의 첫 글자가 A로 시작하는 사원의 사원번호와 이름을 가져온다
select emp_no, first_name, last_name
from employees
where first_name like'A%';

# 이름이 s로 끝나는 사원의 사원번호, 이름을 가져온다
select emp_no, first_name
from employees
where first_name like '%s';

# 이름의 두번 째 글자가 i인 사원의 사원번호, 이름을 가져온다
select emp_no, first_name
from employees
where first_name like '_i%';

# 이름의 마지막이 i로 끝나고, 총 글자수가 5개인 사원의 사원번호, 이름을 가져온다
select emp_no, first_name
from employees
where first_name like '____i';

# 이름이 4글자인 사원들의 사원번호, 이름을 가져온다
select emp_no, first_name
from employees
where first_name like '____';
