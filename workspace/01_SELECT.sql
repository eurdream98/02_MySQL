-- 1. SELECT
-- 데이터 추출 = 데이터 조회
-- 가장 기본적인 명령어로 특정 테이블에서 원하는 데이터를 조회에서 가져오는데 사용

-- 단일 열 데이터 검색
SELECT menu_name FROM tbl_menu;

-- 여러 열의 데이터 검색
SELECT
	menu_code,
	menu_name,
    menu_price
FROM
	tbl_menu;
    
-- 모든 열의 데이터 검색
SELECT
	*
FROM
	tbl_menu;
    
-- 단독 SELECT문 사용
-- FROM절 없이 단순 테스트를 위해 단독으로 사용 될 수 있는 절이다.
SELECT 6+3,6*3,6%3;


-- 내장함수의 결과 확인
SELECT NOW();
SELECT CONCAT("홍"," ","길동");

-- 컬럼 별칭 결과 확인
SELECT CONCAT('홍','','길동') AS name;







