-- < 실습: DDL 이용해 테이블 생성하기 >
USE new_smartfactory;
CREATE TABLE member (
    id VARCHAR(20) PRIMARY KEY,
    name VARCHAR(5) NOT NULL,
    age INT,
    gender VARCHAR(2) NOT NULL,
    email VARCHAR(50),
    promotion VARCHAR(2) DEFAULT'x'
);

-- < 실습: DDL 이용해 테이블 구조 수정하기 >
-- ALTER

-- id 컬럼 값 형식 변경
ALTER TABLE member MODIFY id VARCHAR(10);
ALTER TABLE member CHANGE id id VARCHAR(10);

-- age 컬럼 삭제
ALTER TABLE member DROP age;

-- interest 컬럼 추가
ALTER TABLE member ADD interest VARCHAR(100);

DESC member;
