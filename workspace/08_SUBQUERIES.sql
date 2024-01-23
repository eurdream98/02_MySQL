-- 8. SUBQUERIES
-- : 다른 쿼리 내에서 실행 되는 쿼리. 서브 쿼리의 결과를 활용해서 복잡한 MAIN QUERY를 작성해 한 번에 여러 작업을 수행할 수 있음
-- 서브 쿼리의 결과를 활용해서 복잡한 MAIN QUERY를 작성해 한 번에 여러 작업을 수행할 수 있음

-- EX) 민트미역국과 동일 카테고리인 메뉴 목록 조회
SELECT 
	menu_code,
    menu_name,
    menu_price,
    orderable_status
FROM 
	tbl_menu
WHERE
	category_code = (SELECT 
	category_code
FROM
	tbl_menu
WHERE
	menu_name = '민트미역국');

-- FROM절에 쓰인 서브쿼리(derived table, 파생 테이블)
-- 파생 테이블은 별칭을 가져야만 한다. 
-- 서브 쿼리
SELECT
		COUNT(*) AS 'count'
FROM 
		tbl_menu
GROUP BY
		category_code;
        
SELECT
	MAX(count)
FROM
	(SELECT
		COUNT(*) AS 'count'
	FROM 
		tbl_menu
	GROUP BY
		category_code) AS countmenu;


-- 상관 서브쿼리
-- 메인 쿼리가 서브 쿼리의 결과에 영향을 주는 경우를 말한다. 

-- 카테고리별 평균 가격보다 높은 가격의 메뉴를 조회
SELECT
	menu_code,
    menu_name,
    menu_price,
    category_code,
    orderable_status
FROM
	tbl_menu a
WHERE
	menu_price>(
    SELECT
		AVG(menu_price)
        FROM
			tbl_menu
		WHERE
			category_code = a.category_code);
            
-- EXISTS : 조회 결과가 있으면 true, 없으면 false를 반환하는 연산자
-- 메뉴가 있는 카테고리 조회
SELECT
	category_name
FROM
	tbl_category a
WHERE
	EXISTS(
		SELECT
			1
		FROM
			tbl_menu b
		WHERE
             b.category_code = a.category_code
        )
ORDER BY 1;  -- 컬럼 순번으로 작성 가능(컬럼 순번 : SELECT 절에 나열 된 컬럼의 순서)

-- CTE (Common Table Expressions)
-- 파생 테이블과 비슷한 개념으로 코드의 가독성 및 재사용성을 위해 파생 테이블 대신 사용한다.
-- FROM 절(JOIN절) 에서만 사용 된다.
WITH menucate AS(
	SELECT
		menu_name,
        category_name
	FROM
		tbl_menu a
	JOIN
		tbl_category b ON a.category_code = b.category_code
)
SELECT 
	*
FROM
	menucate
ORDER BY
	menu_name;