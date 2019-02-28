# string function

# concat(), insert(), replace()
# left(), right(), mid()
# trim(), ltrim(), rtrim()
# reverse()
# lcase(), lower(), ucase(), upper()

## =============================================

-- 문자열 합치기 concat()
# select 'aa'+'bb' ; not working!!
select concat('aa', 'bbb', 'ccc');

# 사원의 이름과 사원번호를 가져온다
# first_name last _name의 사원번호는 emp_no입니다.
select concat(first_name, ' ' ,last_name, '의 사원번호는 ', emp_no,'입니다.')
from employees;


-- 문자열 삽입 insert()
# 'aaaaa' 에서 2번째 글자부터 글자 3개를 삭제하고 그 자리에 'bbb'를 삽입한다.
select insert('aaaaa', 2, 3, 'bbb');

# 'abcdefg' 에서 2번째 글자부터 0 글자를 삭제하고 그 자리에 '_hi_'를 넣는다.
select insert('abcdefg', 2, 0, '_hi_');


-- 문자열을 지정하여 변경 replace()
# 'aabbcc'에서 'bb'를 'gg'로 바꿔라
select replace('aabbcc', 'bb', 'gg');

# 만약 바꿀 문자열을 잘못 지정하면 replace()가 실행되지 않는다
select replace('aabbcc', 'kk', 'gg'); -- 대상 문자열에 'kk'가 없어서 실행 안됨

# 사원의 사원번호와 직함을 가져온다
# 직함에서 Senior를 Master로 변경하여 가져온다.
select emp_no, replace(title, 'Senior', 'Master')
from titles;

## ============================================================================

-- 지정된 위치로부터 가져온다 left(), right(), mid()
# left : 왼쪽에서 00개 글자 가져오기, right : 오른쪽에서 00개 글자 가져오기, mid : 왼쪽에서 00번 위치에서 부터 나머지 가져오기
select left('abcdefg', 2), right('abcdefg', 2), mid('abcdefg', 2);

## ========================================================================

-- 공백제거 trim(), ltrim(), rtrim()
select concat('[','     abc     ', ']'), 
	   concat('[',ltrim('     abc     '), ']'),
       concat('[',rtrim('     abc     '), ']'),
	   concat('[',trim('     abc     '), ']');
       
-- 문자열 뒤집기 reverse()
# 굳이...? 잘 안쓴대
select first_name, reverse(first_name)
from employees;


## ==========================================================================

-- 대문자 -> 소문자 lcase(), lower()
-- 소문자 -> 대문자 ucase(), upper()

# 사원들의 이름을 가져온다
# first_name은 소문자로, last_name은 대문자로
select lcase(first_name), upper(last_name)
from employees;


