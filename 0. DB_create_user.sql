-- 사용자 생성
-- 오직 로컬 서버상에서만 접속 가능
create user 'guest'@'localhost' identified by '1234';

-- 모든 IP에서 접근해도 다 OK
-- 51.2.3.% or %.naver.com
create user 'guest2'@'%' identified by '1234';

-- 권한 부여
-- *.* : 모든 디비와 모든 그안에 테이블
grant all on *.* to 'guest2'@'%' with grant option;

-- 권한 제거
revoke delete on *.* from 'guest2'@'%';

-- 권한 확인 => 확인 => show
show grants for 'guest'@'localhost';

-- 비번변경
set password for 'guest'@'localhost'=password('12345');

-- 사용자 삭제
drop user 'guest'@'localhost';

-- ============================================================

-- workbench에서 사용자 생성하기
-- 1. root 접속 후 Administration (schemas 탭 옆에) -> Users and priviliges
-- 2. add acount, 이미 있다면 Schema previlige -> Add entry
-- 3. 아래에서 권한 체크 해주고 apply 해주면 끝!

-- =======================================

-- workbench에서 root 외에 connection 만들기
-- 1. 홈 화면 root 옆에 + 표시를 누르고
-- 2. 원하는 이름 적고
-- 3. 설정한 유저 정보입력, Default Schemas 설정하고 싶다면 설정
-- 4. 끝!