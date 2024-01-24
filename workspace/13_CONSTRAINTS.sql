-- 13. CONSTRAINTS (제약조건)
-- 테이블에 데이터가 입력 되거나 수정 될 때의 규칙을 정의하며 데이터 무결성 보장에 도움이 된다. 

-- 1. NOT NULL : 컬럼 값에 NULL을 허용하지 않는 제약조건
-- 컬럼 레벨에 작성 

CREATE TABLE IF NOT EXISTS user_notnull (
	user_no INT NOT NULL,
    user_id VARCHAR(255) NOT NULL,
    user_pwd VARCHAR(255) NOT NULL,
    user_name VARCHAR(255) NOT NULL,
    gender VARCHAR(3),
    phone VARCHAR(255) NOT NULL,
    email VARCHAR(255)
) ENGINE=INNODB;

INSERT INTO 
	user_notnull(user_no, user_id, user_pwd, user_name, gender, phone, email)
VALUES
	(1, 'user01', 'pass01', '홍길동', '남', '010-1234-5678', 'hong123@gmail.com');

INSERT INTO 
	user_notnull(user_no, user_id, user_pwd, user_name, gender, phone, email)
VALUES
	(2, 'user02', 'pass02', '유관순', '여', '010-8765-4321', 'yoo123@gmail.com');

SELECT * FROM user_notnull;

INSERT INTO 
	user_notnull(user_no, user_id, user_pwd, user_name, gender, phone, email)
VALUES
	(3, 'user03', null, null, '여', '010-8765-4321', 'yoo123@gmail.com'); -- not null 제약조건 위반으로 삽입 불가

-- 2. UNIQUE : 중복 값 허용하지 않는 제약 조건
-- 컬럼 레벨, 테이블 레벨 작성

CREATE TABLE IF NOT EXISTS user_unique (
	user_no INT NOT NULL UNIQUE, -- 컬럼 레벨에 작성
    user_id VARCHAR(255) NOT NULL,
    user_pwd VARCHAR(255) NOT NULL,
    user_name VARCHAR(255) NOT NULL,
    gender VARCHAR(3),
    phone VARCHAR(255) NOT NULL,
    email VARCHAR(255), 
    UNIQUE(phone)	-- 테이블 레벨에 작성
) ENGINE=INNODB;

INSERT INTO 
	user_unique(user_no, user_id, user_pwd, user_name, gender, phone, email)
VALUES
	(1, 'user01', 'pass01', '홍길동', '남', '010-1234-5678', 'hong123@gmail.com');

INSERT INTO 
	user_unique(user_no, user_id, user_pwd, user_name, gender, phone, email)
VALUES
	(2, 'user02', 'pass02', '유관순', '여', '010-8765-4321', 'yoo123@gmail.com');

SELECT * FROM user_unique;

INSERT INTO 
	user_unique(user_no, user_id, user_pwd, user_name, gender, phone, email)
VALUES
	(3, 'user03', 'pass03', '신사임당', '여', '010-8765-4321', 'shin123@gmail.com'); -- unique 제약 조건으로 인해 삽입 불가
    
-- 3. PRIMARY KEY : 테이블에서 한 행의 정보를 찾기 위해 사용하는 컬럼
-- 테이블의 식별자 역할. NOT NULL + UNIQUE의 의미. 한 테이블 당 1개씩 설정.
-- 컬럼 레벨, 테이블 레벨 작성 가능. 
-- 한 개 컬럼을 대상으로 설정할 수도 있고, 여러 개의 컬럼을 묶어서 설정할 수도 있음. (복합키)

CREATE TABLE IF NOT EXISTS user_primarykey (
	user_no INT, -- PRIMARY KEY, 컬럼 레벨에 작성
    user_id VARCHAR(255) NOT NULL,
    user_pwd VARCHAR(255) NOT NULL,
    user_name VARCHAR(255) NOT NULL,
    gender VARCHAR(3),
    phone VARCHAR(255) NOT NULL,
    email VARCHAR(255), 
    PRIMARY KEY(user_no)	-- 테이블 레벨에 작성
) ENGINE=INNODB;

INSERT INTO 
	user_primarykey(user_no, user_id, user_pwd, user_name, gender, phone, email)
VALUES
	(1, 'user01', 'pass01', '홍길동', '남', '010-1234-5678', 'hong123@gmail.com');

INSERT INTO 
	user_primarykey(user_no, user_id, user_pwd, user_name, gender, phone, email)
VALUES
	(2, 'user02', 'pass02', '유관순', '여', '010-8765-4321', 'yoo123@gmail.com');

SELECT * FROM user_primarykey;

INSERT INTO 
	user_primarykey(user_no, user_id, user_pwd, user_name, gender, phone, email)
VALUES
	(null, 'user03', 'pass03', '신사임당', '여', '010-8765-4321', 'shin123@gmail.com'); -- pk 제약 조건으로 인해 삽입 불가

INSERT INTO 
	user_primarykey(user_no, user_id, user_pwd, user_name, gender, phone, email)
VALUES
	(2, 'user03', 'pass03', '신사임당', '여', '010-8765-4321', 'shin123@gmail.com'); -- pk 제약 조건으로 인해 삽입 불가

-- 4. FOREIGN KEY : 참조 된 다른 테이블에서 제공하는 값만 사용할 수 있도록 하는 제약 조건
-- 참조 무결성을 위배하지 않기 위해 사용. FK 제약조건에 의해 테이블 간의 관계가 형성. 
-- 제공 값 외에는 null 값을 사용할 수 있음. 
-- 컬럼 레벨, 테이블 레벨 작성 가능.

-- 참조 될 부모 테이블
CREATE TABLE IF NOT EXISTS user_grade (
	grade_code INT PRIMARY KEY,
    grade_name VARCHAR(255) NOT NULL
) ENGINE=INNODB;

INSERT INTO
	user_grade
VALUES
	(10, '일반회원'),
	(20, '우수회원'),
	(30, '특별회원');

SELECT * FROM user_grade;

-- user_grade 부모 테이블을 참조하는 자식 테이블 
CREATE TABLE IF NOT EXISTS user_foreignkey1 (
	user_no INT PRIMARY KEY, 
    user_id VARCHAR(255) NOT NULL,
    user_pwd VARCHAR(255) NOT NULL,
    user_name VARCHAR(255) NOT NULL,
    gender VARCHAR(3),
    phone VARCHAR(255) NOT NULL,
    email VARCHAR(255), 
    grade_code INT,
    FOREIGN KEY(grade_code) REFERENCES user_grade (grade_code)
) ENGINE=INNODB;

INSERT INTO 
	user_foreignkey1(user_no, user_id, user_pwd, user_name, gender, phone, email, grade_code)
VALUES
	(1, 'user01', 'pass01', '홍길동', '남', '010-1234-5678', 'hong123@gmail.com', 10);

INSERT INTO 
	user_foreignkey1(user_no, user_id, user_pwd, user_name, gender, phone, email, grade_code)
VALUES
	(2, 'user02', 'pass02', '유관순', '여', '010-8765-4321', 'yoo123@gmail.com', 20);

SELECT * FROM user_foreignkey1;

INSERT INTO 
	user_foreignkey1(user_no, user_id, user_pwd, user_name, gender, phone, email, grade_code)
VALUES
	(3, 'user03', 'pass03', '신사임당', '여', '010-8765-4321', 'shin123@gmail.com', 50); -- fk 제약 조건으로 인해 삽입 불가

INSERT INTO 
	user_foreignkey1(user_no, user_id, user_pwd, user_name, gender, phone, email, grade_code)
VALUES
	(3, 'user03', 'pass03', '신사임당', '여', '010-8765-4321', 'shin123@gmail.com', null); -- null 값은 삽입 가능

-- 참조하는 자식 테이블의 행이 있을 경우 부모 테이블에서 값을 삭제하거나 수정할 수 없다. (기본 삭제 룰)
DELETE FROM user_grade WHERE grade_code = 10;

-- 자식 테이블의 FK에 삭제룰을 추가해서 생성하는 경우 
CREATE TABLE IF NOT EXISTS user_foreignkey2 (
	user_no INT PRIMARY KEY, 
    user_id VARCHAR(255) NOT NULL,
    user_pwd VARCHAR(255) NOT NULL,
    user_name VARCHAR(255) NOT NULL,
    gender VARCHAR(3),
    phone VARCHAR(255) NOT NULL,
    email VARCHAR(255), 
    grade_code INT,
    FOREIGN KEY(grade_code) REFERENCES user_grade (grade_code) ON UPDATE SET NULL ON DELETE SET NULL
) ENGINE=INNODB;

INSERT INTO 
	user_foreignkey2(user_no, user_id, user_pwd, user_name, gender, phone, email, grade_code)
VALUES
	(1, 'user01', 'pass01', '홍길동', '남', '010-1234-5678', 'hong123@gmail.com', 10);

INSERT INTO 
	user_foreignkey2(user_no, user_id, user_pwd, user_name, gender, phone, email, grade_code)
VALUES
	(2, 'user02', 'pass02', '유관순', '여', '010-8765-4321', 'yoo123@gmail.com', 20);

SELECT * FROM user_foreignkey2;

INSERT INTO 
	user_foreignkey2(user_no, user_id, user_pwd, user_name, gender, phone, email, grade_code)
VALUES
	(3, 'user03', 'pass03', '신사임당', '여', '010-8765-4321', 'shin123@gmail.com', 50); -- fk 제약 조건으로 인해 삽입 불가

INSERT INTO 
	user_foreignkey2(user_no, user_id, user_pwd, user_name, gender, phone, email, grade_code)
VALUES
	(3, 'user03', 'pass03', '신사임당', '여', '010-8765-4321', 'shin123@gmail.com', null); -- null 값은 삽입 가능
    
-- 첫번째 테스트 자식 테이블 삭제 후 테스트하기
DROP TABLE IF EXISTS user_foreignkey1;

-- 삭제 룰을 별도로 적용하고 수행하면 삭제 가능. 자식 테이블의 값은 null 로 변경 됨. 
DELETE FROM user_grade WHERE grade_code = 10;

SELECT * FROM user_grade;
SELECT * FROM user_foreignkey2;

-- 5. CHECK : check 제약 조건 위반 시 허용하지 않는 제약 조건
-- 컬럼 레벨, 테이블 레벨 작성 가능.
CREATE TABLE IF NOT EXISTS user_check(
	user_no INT AUTO_INCREMENT PRIMARY KEY,
    user_name VARCHAR(255) NOT NULL,
    gender VARCHAR(3) CHECK(gender IN ('남', '여')),
    age INT CHECK (age >= 19)
) ENGINE=INNODB;

INSERT INTO
	user_check
VALUES
	(null, '신사임당', '여', 40),
    (null, '홍길동', '남', 30);
    
SELECT * FROM user_check;

INSERT INTO
	user_check
VALUES
	(null, '이순신', '남자', 33);  -- gender check 제약조건 위반

INSERT INTO
	user_check
VALUES
	(null, '유관순', '여', 16);  -- age check 제약조건 위반

-- 6. DEFALUT : 컬럼에 null 대신 기본 값을 적용할 수 있다.
CREATE TABLE IF NOT EXISTS tbl_country (
	country_code INT AUTO_INCREMENT PRIMARY KEY,
    country_name VARCHAR(255) DEFAULT '한국',
    population VARCHAR(255) DEFAULT '0명',
    add_day DATE DEFAULT (current_date),
    add_time DATETIME DEFAULT (current_time)
) ENGINE=INNODB;

INSERT INTO
	tbl_country
VALUES
	(null, default, default, default, default);

INSERT INTO
	tbl_country(country_name)
VALUES
	('미국');	-- 지정 되지 않은 컬럼에는 null 값이 아닌 default 값으로 insert 된다. 

SELECT * FROM tbl_country;







