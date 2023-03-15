-- < DCL >
-- Data Control Language
-- GRANT, REVOKE

USE new_smartfactory;
SELECT * FROM new_customer;

-- 현재 root 사용자만 존재~
-- => 새로운 사용자(유저, 계정) 추가 (codee)
-- CREATE USER [계정명]@[접속경로] IDENTIFIED BY [비밀번호];
CREATE USER 'codee'@'localhost' IDENTIFIED BY '0325';
CREATE USER 'lucky'@'localhost' IDENTIFIED BY '0325';
CREATE USER 'happy'@'localhost' IDENTIFIED BY '0325';

-- 참고) MySQL 사용자 비밀번호 변경하고 싶다면?
ALTER USER 'codee'@'localhost' IDENTIFIED WITH mysql_native_password BY '1234';
FLUSH PRIVILEGES; -- 새로고침해야 반영

-- 새로 생성한 사용자 확인
SELECT user FROM mysql.user; -- mysql.user: mysql db의 user table

-- < GRANT >
-- : 권한 부여

-- To [계정명@접속경로] [WITH GRANT OPTION];
-- ex. codee2 사용자에게 모든 데이터베이스의 모든 테이블에 모든 권한 부여
-- 모든 데이터베이스의 모든 테이블 : *.*
-- 모든 권한 부여 : GRANT ALL PRIVILEGES
-- WITH GRANT OPTION : 권한을 다른 사용자한테 부여 가능할 수 있는 옵션
-- root -> codee2 -> ?
GRANT ALL PRIVILEGES ON *.* TO 'codee'@'localhost' WITH GRANT OPTION;

-- 새로운 사용자 생성
--CREATE USER [계정명]@[접속경로] IDENTIFIED BY [비밀번호];
-- 새로 생성한 사용자 확인
SELECT user FROM mysql.user; -- mysql.user: mysql db의 user table
-- 사용자 삭제 
DROP USER 'codee'@'localhost';
FLUSH PRIVILEGES; -- 새로고침해야 반영

CREATE USER 'happy'@'localhost' IDENTIFIED BY '0325';
GRANT SELECT ON new_smartfactory.* TO 'happy'@'localhost' WITH GRANT OPTION;

-- < REVOKE >
-- : 권한 박탈alter-- 
-- REVOKE [권한 유형] ON [데이터베이스 이름].[테이블이름] FROM [계정명@접속경로];
REVOKE DELETE ON *.* FROM 'codee'@'localhost'; -- SELECT 권한 박탈
REVOKE ALL ON *.* FROM 'codee'@'localhost'; -- 모든 권한 박탈

-- 계정 삭제
DROP USER 'codee'@'localhost';
FLUSH PRIVILEGES;


