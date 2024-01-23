-- 4. DISNTINCT
-- 중복 값을 제거하는데 사용한다. 컬럼에 있는 컬러 값의 종류를 쉡게 파악할 수 있다.

SELECT
	category_code
FROM
	tbl_menu
ORDER BY
	category_code;
    
-- 단일 DISTINCT 사용

SELECT
	DISTINCT category_code
FROM
	tbl_menu
ORDER BY
	category_code;

-- NULL값을 포함한 열의 DISTINCT 사용
SELECT
	ref_category_code
FROM
	tbl_category;
    
    
SELECT
	DISTINCT ref_category_code
FROM
	tbl_category;
    
-- 다중 열 DISTINCT 사용
SELECT 
	DISTINCT category_code,
    orderable_status
FROM
	tbl_menu;
    


    
    

    
    
    
    
    