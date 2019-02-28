# numerical function (숫자 함수)
# only for numerical values!

# abs()
# floor(), ceil(), round(), truncate()
# pow()
# mod()
# greatest(), least()

## ==========================================

-- 절대값 abs()
select abs(-3), abs(3);

## =====================================================

-- 소수점 이하 버림 floor()
select floor(3.2), floor(-2.5);

# 사원들의 급여를 10% 인상한 금액을 가져온다
# 소수점 이하는 버린다
select emp_no, floor(salary*1.1)
from salaries;

-- 소수점 이하 올림 ceil()
# 무조건 올림! 반올림 아니야
select ceil(3.6), ceil(1.1), ceil(-2.5);

# 사원들의 급여를 10% 인상된 급여를 가져온다
# 소수점 이하 자리는 올린다.
select salary*1.1, ceil(salary*1.1)
from salaries;

## ==========================================================

-- 반올림 round()
# 소수점 이하를 기준으로 반올림 
select round(3.4), round(3.5), round(-2.3), round(-2.5);

# 자리수를 정해서 반올림을 할 수 있음!
# 양수 : 소수점 이하 자리에서 반올림 (0 소수점 이하 첫번째, 1 소수점 이하 두번째에서 반올림)
# 음수 : 정수부 자리에서 반올림 (-1 일의자리, -2 십의 자리..)
select round(3.124531, 0), round(3.124531, 1), round(3.124531, 2);
select round(365.124531, -1), round(365.124531, -2), round(365.124531, -3);

# 사원들의 급여를 10% 인상된 급여를 가져온다
# 십의 단위를 기준으로 반올림한다.
select salary*1.1, round(salary*1.1, -2)
from salaries;

## =============================================================

-- 버림 truncate()
# 자리수 설정 가능 (자리수 정해서 올림은 없음)
select truncate(245.123, 0), truncate(245.123, 1), truncate(245.125, 2);
select truncate(245.123, -1), truncate(245.123, -2), truncate(245.123, -3);

# 사원들의 급여를 10% 인상한 급여를 가져온다
# 십의 자리를 기준으로 버린다
select salary*1.1, truncate(salary*1.1, -2)
from salaries;

## =============================================================

-- x의 y승 pow()
select pow(2,3);

# 직원들의 급여를 3 제곱한 만큼 인상한다
select salary, pow(salary,3)
from salaries;

-- 나머지 구하기 mod()
select mod(10,2), 10/2;
select mod(5,3), 5/3;

# 사원번호가 짝수인 사원의 사원번호와 이름을 가져온다
select emp_no, first_name, last_name
from employees
where mod(emp_no,2) = 0; 

# 사원번호가 홀수인 사원의 사원번호와 이름을 가져온다
select emp_no, first_name, last_name
from employees
where mod(emp_no,2) <> 0; 

## ================================================

-- 최대 최소 구하기 greatest(), least()
select greatest(3,2,1,5), least(1,6,7,2,4);

# 단, 이 함수들은 괄호 안에 있는 숫자들에서 최대최소를 구할 뿐... 컬럼값을 넣으면 작동하지 않는다
# 컬럼 전체에서 최대최소를 구하고 싶다면, 그룹함수 max(), min() 으로 구할 수 있다.
-- select greatest(salary) -- Error code: 1582 Incorrect parameter count in the call to native function 'greatest'
-- from salaries;

