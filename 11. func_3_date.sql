# date/time function
# 날짜 시간 함수

# now(), curdate(), curtime()
# year, month, day, hour, minute, second ...

# date_add(000, interval 000 day/month/year...)
# date_sub(000, interval 000 day/month/year...)
# date_format()

## ========================================================

-- 현재 날짜와 시간
select now(), sysdate(), current_timestamp();

-- 현재 날짜
select curdate(), current_date();

-- 현재 시간
select curtime(), current_time();

## ==========================================================

-- 현재 시간을 기준으로 날짜를 더한다 date_add()
# 숫자 적고 스페이스..... ex. 100day 하면 안되고 100 day 해야 함...
select now(),
	   date_add(now(), interval 100 day),
       date_add(now(), interval 10 hour),
       date_add(now(), interval 1 month);
       
-- 현재 시간을 기준으로 시간을 뺀다 date_sub()
select now(),
	   date_sub(now(), interval 100 day),
       date_sub(now(), interval 10 hour),
       date_sub(now(), interval 1 month);
       
# 각 사원들의 입사일, 입사일로부터 1000일 후, 입사일로부터 1000일 전의 날짜를 가져온다
select hire_date, date_add(hire_date, interval 1000 day), date_sub(hire_date, interval 1000 day)
from employees;

## ==========================================================================

-- 원하는 값을 가지고 온다
-- year, month, monthname, dayname, dayofweek(1- 일요일 2- 월요일 3- 화요일.... 7 - 토요일),
# weekday(0 - 월요일, 1- 화, 2-수...), dayofyear(올해의 몇번째날인지), week, dayofmonth(이번달의 몇번째?)
select year(now()), month(now()), week(now()), dayofmonth(now()),
	   monthname(now()), weekday(now()),
       dayofyear(now()), dayofweek(now()), dayname(now());
	
# 각 사원의 입사일을 년, 월, 일로 가져온다
select hire_date, year(hire_date), month(hire_date), dayofmonth(hire_date)
from employees;

## ===========================================================================

-- 포맷 : 지정된 양식에 맞춰서 문자열을 만든다
# 데이터베이스 마다 한글 지원가능여부가 다름!!
select date_format(hire_date, '%Y년%m월%d일')
from employees;
