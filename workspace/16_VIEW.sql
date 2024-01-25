-- 16. VIEW

-- VIEW 생성
CREATE VIEW hansik AS
SELECT 
	menu_code,
    menu_name,
    menu_price,
    category_code,
    orderable_status
FROM
	tbl_menu
WHERE
	category_code = 4;
    
SELECT * FROM hansik;

-- 베이스 테이블의 정보 변경
INSERT INTO
	tbl_menu
VALUES
	(null, '식혜맛 국밥', 5500, 4, 'Y');
    
SELECT * FROM tbl_menu;
-- 베이스 테이블의 정보가 변경 되면 VIEW의 결과도 같이 변경 된다.
SELECT * FROM hansik;

-- VIEW를 통한 INSERT
INSERT INTO
	hansik
VALUES
	(null, '수정과맛 국밥', 5500, 4, 'Y');

SELECT * FROM hansik;
SELECT * FROM tbl_menu;

-- VIEW를 통한 UPDATE
UPDATE
	hansik
SET
	menu_name = '버터맛국밥',
    menu_price = 5700
WHERE
	menu_code = 5;

SELECT * FROM hansik;
SELECT * FROM tbl_menu;

-- VIEW를 통한 DELETE 
DELETE FROM hansik WHERE menu_code = 5;

SELECT * FROM hansik;
SELECT * FROM tbl_menu;

-- VIEW 삭제
DROP VIEW hansik;

-- OR REPLACE 옵션 : 만약 동일한 이름의 view가 존재한다면 현재의 view로 교체하는 옵션 
CREATE OR REPLACE VIEW hansik AS
SELECT
	menu_code 메뉴코드,
    menu_name 메뉴명,
    category_name 카테고리명
FROM
	tbl_menu a
JOIN
	tbl_category b ON a.category_code = b.category_code
WHERE
	category_name = '한식';