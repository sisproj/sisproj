--테이블 스페이스 생성
create tablespace sis
datafile 'C:\Users\Chulee\Documents\sisdb\data\sis.dbf' size 48m
extent management local
uniform size 64k
segment space management auto;

--사용자 계정 생성
create user sisproj	
identified by sisproj123
default tablespace sis;

--사용자 권한부여
grant connect,resource to sisproj;

--뷰 생성 권한 부여하기
grant create view to sisproj;