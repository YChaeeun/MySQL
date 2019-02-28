# 산술연산
# 원본 데이터를 수정하는 것이 절대 아님!

# arithmetic operator
-- NOT modifying the raw data itself! --
-- it's for numeric data, not for strings etc

# for string type data, we should use different operator

select 10 + 10;
select 20 - 20;
select 20 * 10;
select 20/10;

# 모든 사원의 급여, 급여 + 1000, 급여 - 1000, 급여*1000, 급여 / 1000 한 것을 가져온다.
select salary, salary+1000, salary-1000, salary*1000, salary/1000
from salaries;

# 모든 사원들의 10% 인상된 급여를 가져온다
select salary*1.1
from salaries;

# 모든 사원들의 10% 인하된 급여를 가져온다
select salary*0.9
from salaries;


