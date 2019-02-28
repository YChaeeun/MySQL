# group by : 조건에 맞게 그룹으로 묶기
# having : group을 한 뒤에야 조건을 걸 수 있는 경우
#		   그룹을 우선 나눠야지만 다른 그룹내 조건이 생기는 경우
#		   where을 쓰지 않고 having을 씀!

-- ====================================================

# 사원의 수를 성별로 구분하여 가져온다
# 만약 select에서 다른 컬럼을 가져오면 count 값과 매치가 안됨
select gender, count(*)
from employees
group by gender;

# 각 부서에 현재 근무하고 있는 사원들의 사원수를 가져온다
select dept_no, count(*)
from dept_emp
where to_date = '9999-01-01'
group by dept_no;

# 각 부서별 과거의 매니저의 수를 구한다
select dept_no, count(*)
from dept_manager
where to_date <> '9999-01-01'
group by dept_no;

# 급여 수령 시작일별 급여 총합, 평균, 최고액, 최저액을 가져온다
# 단 현재 수령하고 있는 급여만 가져오기!
select from_date, sum(salary), avg(salary), max(salary), min(salary)
from salaries
where to_date = '9999-01-01'
group by from_date
order by from_date desc;

## ===============================================================

-- HAVING
# 그룹을 우선 나눠야지만 다른 그룹내 조건이 생기는 경우에 having을 쓰자
# 하지만 사실 where 을 써도 되는 경우도 있음

# d001, d002 부서에 현재 근무하고 있는 사원들의 수를 가져온다
-- having을 썼을 때
select dept_no, count(*)
from dept_emp
where to_date = '9999-01-01'
group by dept_no
having dept_no in ('d001', 'd002');

-- where을 썼을 때
select dept_no, count(*)
from dept_emp
where to_date = '9999-01-01' and dept_no in ('d001', 'd002')
group by dept_no;

# 현재 근무하고 있는 사원들의 정보를 가져온 다음, 부서번호를 기준으로 그룹화
# 다음에 d001 그룹과 d002 그룹을 제외하고 남은 각 그룹의 사원수를 계산하기
select dept_no, count(*)
from dept_emp
where to_date = '9999-01-01'
group by dept_no
having not dept_no in ('d001', 'd002');

# 10만명 이상이 사용하고 있는 직함의 이름과 직원의 수를 가져온다
# 직함별 직원의 수
select title, count(*)
from titles
group by title
having count(title) >= 100000;

# 5만명 이상이 근무하고 있는 부서의 부서번호와 소속사원들의 수를 가져온다
# 부서별 사원들의 수
select dept_no, count(*)
from dept_emp
group by dept_no
having count(*) > 50000;
