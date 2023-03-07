-- smartfactory 데이터베이스 사용
USE smartfactory;

-- 고객 테이블의 모든 정보를 조회
SELECT * FROM customer;

-- 주문 테이블의 모든 정보를 조회
SELECT * FROM orders;

-- 모든 고객의 아이디를 검색
SELECT custid FROM customer;

-- 모든 고객의 아이디와 생년월일을 검색
SELECT custid, birth FROM customer;

-- 입력 순서에 따라 결과가 다름
SELECT birth, custid FROM customer;

-- 모든 고객의 아이디, 주소, 전화번호, 이름, 생년월일 검색
SELECT custid, addr, phone, custname, birth FROM customer;

-- (와일드카드 사용) 모든 고객의 아이디, 이름, 주소, 전화번호, 생년월일을 검색
-- *: ALL, 모든 것을 의미
SELECT * FROM customer;

-- 고객 테이블에 있는 모든 주소를 검색
SELECT addr FROM customer;

-- 고객 테이블에 있는 중복을 제외한 주소 검색
-- DISTINCT : 중복값 제거
SELECT DISTINCT addr FROM customer;

-- < WHERE 절 >

-- 비교 : =, <, <=, >, >=
-- 고객 이름이 강해린인 고객을 검색alter
SELECT * FROM customer WHERE custname='강해린';

-- 제품 가격이 4000원 이상인 주문 내역을 검색
SELECT * FROM orders WHERE price >= 4000;

-- 범위 : BETWEEN a AND b
-- 1995년 이상 2000년 이하 출생 고객 검색
SELECT * FROM customer WHERE birth BETWEEN '1995-01-01' AND '2000-12-31';
SELECT * FROM customer WHERE birth >= '1995-01-01' AND birth <= '2000-12-31';

-- 집합
-- 주소가 서울 혹은 런던인 고객 검색
SELECT * FROM customer WHERE addr IN ('대한민국 서울', '영국 런던');
SELECT * FROM customer WHERE addr='대한민국 서울'OR addr='영국 런던';
SELECT * FROM customer WHERE addr LIKE '대한민국 서울' OR addr LIKE '영국 런던';

-- 주소가 서울 혹은 런던이 아닌 고객 검색
SELECT * FROM customer WHERE addr NOT IN ('대한민국 서울', '영국 런던');
SELECT * FROM customer WHERE addr !='대한민국 서울'AND addr !='영국 런던';
SELECT * FROM customer WHERE addr NOT LIKE '대한민국 서울' AND addr NOT LIKE '영국 런던';

-- 패턴 (LIKE) : 특정 패턴을 포함하는 데이터를 검색
-- % : 0개 이상의 문자
-- _ : 1개의 단일 문자
-- 주소가 '미국 로스앤젤레스'인 고객 검색
SELECT * FROM customer WHERE addr LIKE '미국 로스앤젤레스';

-- 주소에 '미국'이 포함되어 있는 고객 검색
-- 검출 가능한 케이스 예시 : '미국', '미국 ', '미국 워싱턴', '미국 로스앤젤레스', ...
SELECT * FROM customer WHERE addr LIKE '미국%'; -- 패턴에서만 사용가능

-- 고객 이름 두번째 글자가 '지'인 고객 검색
SELECT * FROM customer WHERE custname LIKE '_지%';

-- 고객 이름 세번째 글자가 '수'인 고객 검색
SELECT * FROM customer WHERE custname LIKE '__수%';

-- 복합 조건 (AND, OR, NOT)
-- 주소지가 대한민국이고, 2000년 이후 출생 고객 검색
SELECT * FROM customer WHERE addr LIKE '대한민국%' AND birth > '2000-12-31';
-- 주소지가 미국이거나 영국인 고객 검색
SELECT * FROM customer WHERE addr LIKE '미국%' OR addr LIKE '영국%';
-- 휴대폰 번호 마지막 자리가 4가 아닌 고객 검색
SELECT * FROM customer WHERE phone NOT LIKE '%4';

-- < ORDER BY >
-- ORDER BY 절을 사용하지 않는 경우, pk 기준으로 정렬
SELECT * FROM customer;

-- custname 속성을 기준으로 "오름차순" 정렬
SELECT * FROM customer ORDER BY custname;

-- custname 속성을 기준으로 "내림차순" 정렬
SELECT * FROM customer ORDER BY custname DESC;

-- order by & where 함께 사용
-- 2000년 이후 출생자 중에서 주소를 기준으로 내림차순 검색
-- SELECT * FROM customer ORDER BY addr DESC WHERE birth >= '2000-01-01'; -- 실행순서가 잘못됨
SELECT * FROM customer WHERE birth >= '2000-01-01' ORDER BY addr DESC ;

SELECT * FROM customer WHERE birth >= '2000-01-01' ORDER BY custid DESC, addr DESC;

-- ORDER BY 뒤에 여러 개의 속성을 줄 수 있음
-- 아래 두 퀴리문의 결과는 상이함alter
SELECT * FROM orders ORDER BY price, amount;
SELECT * FROM orders ORDER BY amount, price;

-- < LIMIT >
-- LIMIT 형식 : LIMIT 시작, 개수 == LIMIT 개수 OFFSET 시작
-- LIMIT 에서 시작은 0
-- 고객 테이블 전체 정보를 조회하는데, 앞에 2건만 조회하고 싶은 경우
SELECT * FROM customer LIMIT 2;
SELECT * FROM customer LIMIT 0, 2;

-- 고객 테이블 전체 정보를 조회하는데, 두번째부터 여섯번째 행만 조회하고 싶은 경우
SELECT * FROM customer LIMIT 1, 5;
SELECT * FROM customer LIMIT 5 OFFSET 1;

-- 2000년 이후 출생 고객 중에서 앞에 2건만 조회하고 싶은 경우
SELECT * FROM customer WHERE birth > '2000-12-31' LIMIT 2;

-- 2000년 이후 출생 고객 중에서 앞에 2건만 조회하고 싶은 경우
SELECT * FROM customer WHERE birth > '2000-12-31' ORDER BY custid DESC LIMIT 2;

-- 실습.
-- 1.
SELECT * FROM user ORDER BY birthday;
-- 2.
SELECT * FROM user WHERE gender='M'ORDER BY Name DESC;
-- 3.
SELECT Id, Name FROM user WHERE birthday>'1989-12-31'AND birthday<'2000-01-01';
-- 4.
SELECT * FROM user WHERE birthday LIKE'%-06%'ORDER BY birthday;
-- 5.
SELECT * FROM user WHERE gender='M' AND birthday LIKE'197%';
-- 6.
SELECT * FROM user ORDER BY age DESC LIMIT 3;
-- 7.
SELECT * FROM user WHERE age >=25 AND age <= 50;
