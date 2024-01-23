-- 6. JOIN
-- 두 개 이상의 테이블을 관련 있는 컬럼을 통해 결합하는데 사용
-- 반드시 연관 있는 컬럼이 존재해야하며 이를 통해 JOIN 된 테이블들의 컬럼을 모두 활용할 수 있다. 

-- ALIAS
-- 컬럼 또는 테이블에 별칭을 부여할 수 있다.

-- 컬렴 별칭
-- AS '별칭'의 형태로 작성하나 별칭에 특수문자가 없다면 생략하고 작성 가능하다.
SELECT
    menu_code AS 'code',
    menu_name AS name,
    menu_price 'price'
FROM
	tbl_menu
ORDER BY 
	price; -- 컬럼 별칭 ORDER BY절 사용 가능

-- 테이블 별칭
-- 어떤 테이블 소속인지 쉽게 알 수 있게 하며 AS를 써도 되고 생략도 가능하다.
SELECT
	category_code,
    menu_name
FROM
	-- tbl_menu AS a
    tbl_menu a 
ORDER BY
	category_code,
    menu_name;
    
SELECT
	a.category_code,
    a.menu_name
FROM
	-- tbl_menu AS a
    tbl_menu a 
ORDER BY
	a.category_code,
    a.menu_name;
    
-- JOIN의 종류

-- (1)INNER JOIN : 두 테이블의 교집합을 반환하는 SQL JOIN 유형

-- 1-1. ON을이용한 방법(연결에 사용 될 컬럼명이 동일하지 않거나, 동일하거나 모두 사용 가능)
SELECT
	a.menu_name,
    b.category_name
FROM
	tbl_menu a
-- INNER JOIN tbl_category b ON a.category_code = b.category_code;
JOIN tbl_category b ON a.category_code = b.category_code;

-- 1-2. USING을 이용한 문법(연결에 사용 될 컬렴명이 동일한 경우만 사용)
SELECT
	a.menu_name,
    b.category_name
FROM
	tbl_menu a
-- INNER JOIN tbl_category b ON a.category_code = b.category_code;
JOIN tbl_category b USING (category_code);

-- (2) LEFT JOIN : 첫 번쨰(왼쪽) 테이블의 모든 레코드와 두 번째(오른쪽) 테이블에서 일치하는 레코드를 반환하는 SQL JOIN 유형
SELECT 
	*
FROM
	tbl_category a
LEFT JOIN tbl_menu b ON a.category_code = b.category_code;

-- (3) RIGHT JOIN : 두 번쨰(오른쪽) 테이블의 모든 레코드와 첫 번째(왼쪽) 테이블에서 일치하는 레코드를 반환하는 SQL JOIN 유형
SELECT 
	*
FROM
	tbl_menu a
RIGHT JOIN tbl_category b ON a.category_code = b.category_code;

-- (4) CROSS JOIN : 두 테이블의 모든 가능한 조합을 반환하는 SQL JOIN유형 
SELECT
	*
FROM
	tbl_menu a
CROSS JOIN tbl_category b;

-- (5) SELF JOIN : 같은 테이블 내에서 행과 행 사이의 관계를 찾기 위해 사용되는 SQL JOIN 유형
SELECT 
	*
FROM
	tbl_category a
JOIN tbl_category b ON a.ref_category_code = b. category_code;