--���̺� �����̽� ����
create tablespace sis
datafile 'C:\Users\Chulee\Documents\sisdb\data\sis.dbf' size 48m
extent management local
uniform size 64k
segment space management auto;

--����� ���� ����
create user sisproj	
identified by sisproj123
default tablespace sis;

--����� ���Ѻο�
grant connect,resource to sisproj;

--�� ���� ���� �ο��ϱ�
grant create view to sisproj;