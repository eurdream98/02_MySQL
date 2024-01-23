-- 7. GRUPING
-- GROUP BY : 결과 집합을 특정 열의 값에 따라 그룹화 하는데 사용 => 그룹 함수 사용
-- HAVING : GROUP BY 절과 함께 사용해야 하며 그룹에 대한 조건을 적용하는데 사용

-- COUNT(*) : 행의 갯수를 셀 수 있는 그룹 함수
SELECT 
	category_code,
    COUNT(*)
FROM tbl_menu
GROUP BY category_code;

-- SUM(컬럼) : 컬럼 값의 합계를 알 수 있는 그룹 함수
SELECT 
	category_code,
    SUM(menu_price)
FROM tbl_menu
GROUP BY category_code;

-- AVG(컬럼) : 컬럼 값들의 평균을 알 수 있는 그룹 함수
SELECT 
	category_code,
    AVG(menu_price)
FROM tbl_menu
GROUP BY category_code;

-- 2개 이상의 그룹 생성
SELECT
	menu_price,
    category_code,
    COUNT(*)
FROM
	tbl_menu
GROUP BY
	menu_price,
	category_code;
    
    
-- HAVING : GROUP BY 결과에 조건을 작성함    
SELECT 
	category_code,
    COUNT(*) a
FROM tbl_menu
GROUP BY category_code
HAVING a>3;


SELECT 
	category_code,
    AVG(menu_price)
FROM tbl_menu
GROUP BY category_code
HAVING AVG(menu_price) >=10000;

-- ROLLUP(집계 함수)
-- 컬럼 1개를 활용한 ROLLUP은 카테고리별 총 합계를 계산한다.
SELECT 
	category_code,
    SUM(menu_price)
FROM 
	tbl_menu
GROUP BY 
	category_code
WITH ROLLUP;

-- 컬럼 2개를 활용한 ROLLUP
-- 첫 번째 GOUP BY에 서술 된 컬럼에 대한 중간 집계와 마지막 총 집계가 구해짐
SELECT 
	menu_price,
	category_code,
    SUM(menu_price)
FROM 
	tbl_menu
GROUP BY 
	menu_price,
	category_code
WITH ROLLUP;

