-- 17. INDEX
DROP TABLE phone;
CREATE TABLE phone(
	phone_code INT PRIMARY KEY,
    phone_name VARCHAR(100),
    phone_price DECIMAL(10,2)
);

INSERT INTO
	phone
VALUES
(1,'galaxyS23',1200000),
(2,'iPhone14pro',1430000),
(3,'galaxyZfole3',1700000);

SELECT * FROM phone;

-- 인덱스가 없는 컬럼을 WHERE절의 조건으로 활용한 조회
EXPLAIN SELECT * FROM phone WHERE phone_name = 'galaxyS23';

-- 인덱스 생성
-- phone_name 컬럼에 인덱스 생성
CREATE INDEX idx_name
ON phone(phone_name);



-- 2개 이상의 컬럼을 한 번에 하나의 인덱스로 설정해서 생성할 수 있다.
CREATE INDEX idx_name_price
ON phone(phone_name,phone_price);

SHOW INDEX FROM phone;


-- 인덱스가 생성 된 컬럼을 WHERE절의 조건으로 활용한 조회
EXPLAIN SELECT * FROM phone WHERE phone_name = 'galaxyS23';

-- 인덱스 최적화(재구성)
-- 데이터의 변경이 많은 경우 인덱스를 재구성하여 성능을 개선하고 디스크 공간을 더 효율적으로 사용하도록 한다.
-- 단, 재구성하는 동안 해당 테이블은 잠길 수 있으므로 주의해서 수행한다. 
ALTER TABLE phone DROP INDEX idx_name;
ALTER TABLE phone ADD INDEX idx_name(phone_name);

-- InnoDB 엔진을 사용하는 경우 OPTIMIZE TABLE 명령어로 최적화 가능하다.
OPTIMIZE TABLE phone;

-- 인덱스 삭제
DROP INDEX idx_name_price ON phone;
SHOW INDEX FROM phone;



