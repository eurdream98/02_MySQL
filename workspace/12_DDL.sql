-- 12. DDL(데이터 정의 언어)

-- 1. CREATE
-- IF NOT EXISTS : 기본에 존재하는 테이블에 있어도 오류가 발생하지 않음


-- DATE 타입이 0으로 추가 되지 않는 설정을 수정한다.
ALTER TABLE tb2
ADD col3 DATE NOT NULL,
ADD col4 INT NOT NULL;
DESCRIBE tb2;

-- 4. DROP : 테이블을 삭제하는 구문 
CREATE TABLE IF NOT EXISTS tb3(
pk INT AUTO_INCREMENT PRIMARY KEY,
fk INT,
col1 VARCHAR(255),
CHECK(col1 IN ('Y','N'))
)ENGINE = INNODB;

DROP TABLE IF EXISTS tb3;

CREATE TABLE IF NOT EXISTS tb4(
pk INT AUTO_INCREMENT PRIMARY KEY,
fk INT,
col1 VARCHAR(255),
CHECK(col1 IN ('Y','N'))
)ENGINE = INNODB;

CREATE TABLE IF NOT EXISTS tb5(
pk INT AUTO_INCREMENT PRIMARY KEY,
fk INT,
col1 VARCHAR(255),
CHECK(col1 IN ('Y','N'))
)ENGINE = INNODB;

DROP TABLE IF EXISTS tb4,tb5;

-- 5. TRUNCATE
-- : 테이블에 존재하는 모든 데이터 제거
-- DELETE는 행을 하나씩 지우지만 TRUNCATE는 DROP 이후 테이블을 재생성 해주므로 효율적이다. 