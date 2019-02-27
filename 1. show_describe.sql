# 현재 접속한 계정으로 사용 가능한 데이터 베이스의 목록을 가져온다
# show all the databases this account can use
show databases;

# 데이터베이스 선택(워크벤치 더블클릭)
# use 데이터베이스 명
# you can also just double click the database on Schemas
use employees;

# 현재 선택된 데이터베이스 안에서 접근 가능한 테이블의 목록 조회
show tables;

# 테이블 정보를 조회
# desc 테이블 명 
# describe 테이블 명
desc employees;
describe departments;
