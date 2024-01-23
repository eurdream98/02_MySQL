-- 3. WHERE
-- 특정 조건에 맞는 레코드만을 선택하는데 사용되며, 다양한 방법으로 조건을 설정할 수 있다.

-- (1) 비교 연산자 활용

-- 같음(=) 연산자 예제
SELECT
	menu_name,
    menu_price,
    orderable_status
FROM
	tbl_menu
WHERE
	orderable_status = 'Y';
    
SELECT
	menu_name,
    menu_price,
    orderable_status
FROM
	tbl_menu
WHERE
	menu_price = 13000;
    
-- 같지 않음(!=,<>) 연산자 예제
SELECT
	menu_name,
    menu_price,
    orderable_status
FROM
	tbl_menu
WHERE
	orderable_status = 'Y';
    
SELECT
	menu_name,
    menu_price,
    orderable_status
FROM
	tbl_menu
WHERE
	orderable_status <> 'Y';

-- 대소비교 연산자(>,<,>=,<=) 예제
SELECT
	menu_code,
    menu_name,
    menu_price
FROM
	tbl_menu
WHERE
	menu_price>20000;
    
SELECT
	menu_code,
    menu_name,
    menu_price
FROM
	tbl_menu
WHERE
	menu_price<=20000;
    

-- (2) AND 연산자
SELECT 1 AND 1;
SELECT 1 AND 0, 0 AND 1, 0 AND 0, 0 AND NULL;
SELECT 1 AND NULL, NULL AND NULL;

-- 구매 가능하면서 카테고리 코드가 10인 메뉴 조회
SELECT 
	*
FROM
	tbl_menu
WHERE 
	orderable_status='Y' AND category_code=10;
	
-- 메뉴 가격이 5000원을 초과하며 카테고리 코드가 10인 메뉴 조회
SELECT
	*
FROM
	tbl_menu
WHERE
	menu_price>5000 AND category_code=10;
    
-- (3) OR 연산자 사용
SELECT 1 OR 1, 1 OR 0, 0 OR 1;
SELECT 0 OR 0;
SELECT 1 OR NULL, 0 OR NULL, NULL or NULL;

-- 구매 가능 상태이거나 카테고리가 10인 메뉴 조회
SELECT 
	*
FROM
	tbl_menu
WHERE
	orderable_status='Y'OR
    category_code=10;

-- 메뉴 가격이 5000원을 초과하거나 카테고리 코드가 10인 메뉴 조회
SELECT
	*
FROM
 tbl_menu
 WHERE
	menu_price>5000 OR
    category_code=10;

-- AND와 OR의 우선순위
-- AND가 OR보다 우선순위가 높다. 만약 OR의 우선순위를 높이고 싶다면 소괄호를 사용해야 한다.
SELECT 1 OR 0 AND 0;
-- 결과 1
SELECT(1 OR 0) AND 0;
-- 결과 0
SELECT 
	*
FROM
	tbl_menu
WHERE
	category_code = 4 OR
    menu_price = 9000 AND
    menu_code >10;

-- (4) BETWEEN 연산자
SELECT 
	*
FROM
	tbl_menu
WHERE
	menu_price >=10000 AND
    menu_price <=25000
ORDER BY
	menu_price;
    

SELECT 
	*
FROM
	tbl_menu
WHERE
	menu_price BETWEEN 10000 AND 25000
ORDER BY
	menu_price;
    
-- 부정 연산자 NOT과 함께 사용
SELECT 
	*
FROM
	tbl_menu
WHERE
	menu_price NOT BETWEEN 10000 AND 25000
ORDER BY
	menu_price;
    
-- (5) LIKE 연산자
-- '검색어% : 검색어로 시작하는 단어, '%검색어' : 검색어로 끝나는 단어, '%검색어%' : 검색어를 포함한 단어
SELECT 
	*
FROM
	tbl_menu
WHERE
	menu_name LIKE '%마늘%'
ORDER BY
	menu_name;
    
-- 부정 연산자 NOT과 함께 사용
SELECT 
	*
FROM
	tbl_menu
WHERE
	menu_name NOT LIKE '%마늘%'
ORDER BY
	menu_name;

-- (6) IN 연산자
SELECT
	*
FROM
	tbl_menu
WHERE
	category_code IN(4,5,6);
    
-- 부정 연산자 NOT 과 함께 사용
SELECT
	*
FROM
	tbl_menu
WHERE
	category_code NOT IN(4,5,6)
ORDER BY
	category_code;


SELECT 
	*
FROM
	tbl_category
WHERE
	ref_category_code NOT IN(1,2);
    
-- (7) IS NULL 연산자
SELECT
	*
FROM
	tbl_category
WHERE
	ref_category_code IS NULL;
    
-- 부정 연산자 NOT과 함께 사용
SELECT
	*
FROM
	tbl_category
WHERE
	ref_category_code IS NOT NULL;