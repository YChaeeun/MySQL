# MySQL
  - mysql basic practice with employees sample
    + [MySQL Documentation] (https://dev.mysql.com/doc/employee/en/)
  - employees 샘플 데이터를 통한 MySQL 기초 공부하기


MySQL employees 샘플 데이터 복원하기 (윈도우10)
--------------------------------
  1. repository에 있는 employee.zip 파일 다운받고, 압축해제하기
  2. 내 컴퓨터에 설치되어 있는 MySQL의 bin 폴더에 대한 path 설정 
  
    * 로컬 디스크(C:) -> Program Files -> MySQL -> MySQL Server 8.0 -> bin
    * C:\Program Files\MySQL\MySQL Server 8.0\bin 경로 복사하기
    * 제어판 -> 시스템 및 보안 -> 시스템 -> 고급 시스템 설정 -> 고급 탭 밑에 있는 환경변수
    * 그 중 아래에 시스템 변수에서 '새로 만들기' 버튼 누르기
    * 변수 이름 : path / 변수 값 : 위에서 복사한 경로 붙여넣기 -> 확인
    
  3. cmd 창을 열고 (윈도우+R+cmd 입력) employees 압축을 풀었던 폴더로 경로를 이동한다
  
    * cd 경로명 (ex. cd Desktop) 
    
  4. 경로 이동후에 MySQL에 접속한다 (cmd 창에 mysql -u root -p 입력)
   
  5. employees 파일을 복원한다 ( cmd 창에 source employees.sql 입력)
  
  
