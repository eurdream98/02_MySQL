-- 10. DML(데이터 조작 언어)
-- 테이블에 값을 삽입(INSERT),수정(UPDATE),삭제(DELELTE) 하는 SQL

-- 1. INSERT : 새로운 행을 추가하는 구문으로 테이블의 행의 수가 증가한다.
INSERT INTO tbl_menu VALUES(null,'바나나해장국',8500,4,'Y');

-- NULL 허용 가능 컬럼 또는 auto_increment 설정 된 컬럼을 제외하고 insert 할 컬럼을 지정해서 insert 가능
INSERT INTO
	tbl_menu(menu_name,menu_price,category_code,orderable_status)
VALUES
	('초콜릿죽',6500,7,'Y');

-- 컬럼을 명시할 경우 데이터의 순서를 바꾸는 것도 가능
INSERT INTO
	tbl_menu(orderable_status,menu_price,menu_name,category_code)
VALUES
	('Y',5500,"파인애플탕",4);

-- multi insert (여러 행을 한 번에 삽입)
INSERT INTO
	tbl_menu
VALUES
	(null,'참치맛아이스크림',1700,12,'Y'),
    (null,'멸치맛아이스크림',1700,12,'Y'),
    (null,'소세지맛아이스크림',2500,8,'Y');
    
-- 2. UPDATE : 테이블에 기록 된 컬럼의 값을 수정하는 구문으로 행 갯수의 변하는 없다. 
SELECT
	menu_code,
    category_code
FROM
	tbl_menu
WHERE
	menu_name="파인애플탕";
    
-- 초콜릿죽  카테고리 코드를 7에서 4로 수정
UPDATE 
	tbl_menu
SET
	category_code = 4
WHERE
	menu_code = 27;
    
-- SUBQUERY를 활용한 UPDATE
-- MySQL에서는 update,delete 시 자기 자신 테이블의 데이터를 사용하면 1903에러가 발생함. 
-- 이 때 SUBQUERY를 한 번 더 사용하여 임시 테이블로 사용하면 해결할 수 있음. 
-- SUBQUERY의 결과가 1개이냐 여러개냐에 따라 =을 쓰던가 IN을 쓰는지 달라짐 조심!!
UPDATE
	tbl_menu
SET
	category_code = 6
WHERE 
	menu_code IN (SELECT
					tmp.menu_code
				FROM
                (
		SELECT
			menu_code
		FROM
			tbl_menu
		WHERE
			menu_name='파인애플탕'
    ) tmp );

-- 3. DELETE : 테이블의 행을 삭제하는 구문으로 테이블의 행의 갯수가 줄어든다.
SELECT * FROM tbl_menu ORDER BY menu_price;

-- LIMIT을 활용한 행 삭제(offset 지정 불가)
DELETE 
FROM tbl_menu
ORDER BY menu_price
LIMIT 2;

-- WHERE절을 활용한 행 삭제
DELETE 
FROM tbl_menu
WHERE
	menu_code = 68;

-- 해당 테이블 전체 행 삭제
DELETE FROM tbl_menu;

-- 4. REPLACE : 중복된 데이터를 덮어 쓸 수 있는 기능
-- INSERT 시 PRIMARY KEY 또는 UNIQUE KEY가 충돌이 발생할 때 사용 가능 
INSERT INTO
	tbl_menu
VALUES
	(17,'참기름소주',5000,10,'Y'); -- menu_code 중복으로 삽입 불가
    
REPLACE INTO
	tbl_menu
VALUES
	(17,'참기름소주',5000,10,'Y');
    
REPLACE -- INTO도 생략 가능
	tbl_menu
VALUES
	(17,'참기름소주',5000,10,'Y');
    
-- UPDATE 시 WHERE 구문 없이 UPDATE 가능
REPLACE tbl_menu
SET
	menu_code = 2,
    menu_name = '우럭주스',
    menu_price = 2000,
    category_code = 9,
    orderable_status = 'N';

    







SELECT * FROM tbl_menu;

	
    
