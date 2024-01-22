-- 2. ORDER BY
-- SELECT문과 함께 사용하며 결과 집합을 특정 열이나 열들의 값에 따라 정렬하는데 사용

-- 결과 집합을 하나의 열로 정렬 
SELECT 
	menu_code,
    menu_name,
    menu_price
FROM
	tbl_menu
ORDER BY
 --  menu_name ASC; 
	 menu_price DESC; 
    
-- 결과 집합을 여러 열로 정렬
SELECT
	menu_code,
    menu_name,
    menu_price
FROM
	tbl_menu
ORDER BY
	menu_price DESC,
    menu_name ASC;
    
-- 연산 결과로 결과 집합 정렬
SELECT
	menu_code,
    menu_price,
    menu_code * menu_price AS a
FROM
	tbl_menu
ORDER BY
	a;
    
-- 사용자 지정 목록을 사용하여 데이터 정렬
SELECT FIELD('A','A','B','C');
SELECT FIELD('B','A','B','C');
SELECT FIELD('C','A','B','C');
SELECT 
	FIELD(orderable_status,'N','Y')
FROM
	tbl_menu;
    
SELECT 
	menu_name,
    orderable_status
FROM
	tbl_menu
ORDER BY
	FIELD(orderable_status,'N','Y');
    
-- NULL 값이 있는 컬럼에 대한 정렬
-- 오름차순 설정 시 null 값이 처음으로(기본설정)
SELECT
	category_code,
    category_name,
    ref_category_code
FROM
	tbl_category
ORDER BY
	ref_category_code ASC;
    
-- 오름차순 설정 시 null 값이 마지막으로
SELECT
	category_code,
    category_name,
    ref_category_code
FROM
	tbl_category
ORDER BY
	ref_category_code IS NULL ASC,
    ref_category_code ASC;
    
-- 내림차순 설정 시 null 값이 마지막으로(기본 설정)
SELECT
	category_code,
    category_name,
    ref_category_code
FROM
	tbl_category
ORDER BY
	ref_category_code DESC;
    
-- 내림차순 설정 시 null 값이 처음으로
SELECT
	category_code,
    category_name,
    ref_category_code
FROM
	tbl_category
ORDER BY
	ref_category_code IS NULL DESC,ref_category_code DESC;
