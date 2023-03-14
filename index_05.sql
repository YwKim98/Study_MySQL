USE smartfactory;
SELECT * FROM orders; -- 9명
SELECT * FROM customer; -- 19건
SELECT * FROM customer, orders; -- 19 * 9 = 171
-- a 고객이 orders의 19개의 행과 결합, b 고객이 orders의 19개 행과 결합, ... => 논리에 안맞음

-- WHERE 절을 이용해 조인 조건을 추가
-- 참고) [테이블이름.테이블명] 표기: 특정 테이블의 열을 가르킴
SELECT *
    FROM customer, orders 
    WHERE customer.custid = orders.custid;
SELECT *
    FROM customer INNER JOIN orders 
	ON customer.custid = orders.custid;
SELECT * 
    FROM customer JOIN orders ON customer.custid = orders.custid; -- INNER JOIN
-- +) custid 순으로 정렬
SELECT *
    FROM customer, orders 
    WHERE customer.custid = orders.custid
    ORDER BY customer.custid;
SELECT *
    FROM customer INNER JOIN orders
    ON customer.custid = orders.custid
    ORDER BY customer.custid;

SELECT custname AS '고객이름', SUM(price*amount) AS '총 구매액'
    FROM customer INNER JOIN orders
    ON customer.custid = orders.custid
    GROUP BY custname
    ORDER BY custname;
    
-- < 서브 쿼리, 부속 질의 >
-- : SQL 문 내에 또 다른 SQL 문 작성
-- : SELECT 문의 WHERE 절에 또 다른 테이블 경과를 이용해서 다시 SELECT 문을 괄호로 묶는다.
-- => SELECT ~ FROM ~ WHERE (SELECT ~ FROM~~);
-- STEP 1. 주문 금액이 가장 큰 주문 가격은 얼마인가?
SELECT MAX(price*amount) FROM orders;
-- STEP 2. 주문 금액이 10000원인 주문아이디, 고객아이디, 상품명 조회
SELECT orderid, custid, prodname FROM orders WHERE price * amount = 10000;
-- STEP 3. 서브 쿼리를 이용해 두 SQL 문을 하나로 합치기
SELECT orderid, custid, prodname FROM orders 
	WHERE price * amount = (SELECT MAX(price * amount) FROM orders);
-- 주문 이력이 있는 고객 조회
SELECT custname FROM customer WHERE custid IN (SELECT custid FROM orders);
    



