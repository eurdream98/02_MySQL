-- Q1.
-- 재직 중이고 휴대폰 마지막 자리가 2인 직원 중 입사일이 가장 최근인 직원 3명의 사원번호,
-- 직원명, 전화번호, 입사일, 퇴직여부를 출력하세요.
SELECT 
	emp_id,
	emp_name,
    phone,
    hire_date,
    ent_yn
FROM
	employee
WHERE
	ent_yn = 'N'
    AND
    phone LIKE '%2'
ORDER BY hire_date DESC
LIMIT 3;

-- Q2.
-- 재직 중인 ‘대리’들의 직원명, 직급명, 급여, 사원번호, 이메일, 전화번호, 입사일을 출력하세
-- 요.
-- 단, 급여를 기준으로 내림차순 출력하세요.
SELECT 
	a.emp_name,
    b.job_name,
    a.salary,
    a.emp_id,
    a.email,
    a.phone,
    a.hire_date
FROM job b
JOIN employee a ON b.job_code = a.job_code
WHERE b.job_name = "대리" AND ent_yn = 'N'
ORDER BY a.salary DESC;

-- Q3.
-- 재직 중인 직원들을 대상으로 부서별 인원, 급여 합계, 급여 평균을 출력하고, 마지막에는 전
-- 체 인원과 전체 직원의 급여 합계 및 평균이 출력되도록 하세요.
-- 단, 출력되는 데이터의 헤더는 컬럼명이 아닌 ‘부서명’, ‘인원’, ‘급여합계’, ‘급여평균’으로 출
-- 력되도록 하세요.

SELECT
	dept_title AS "부서명",
	COUNT(*) AS "인원",
    SUM(salary)AS"급여합계",
    AVG(salary)AS"급여평균"
FROM
	employee a
JOIN 
	department b ON a.dept_code = b.dept_id
GROUP BY
	dept_title
WITH ROLLUP;
	
-- Q4.
-- 전체 직원의 직원명, 주민등록번호, 전화번호, 부서명, 직급명을 출력하세요.
-- 단, 입사일을 기준으로 오름차순 정렬되도록 출력하세요.
SELECT 
	emp_name "직원명",
    emp_no "주민등록번호",
    phone "전화번호",
    dept_title "부서명",
    job_name "직급명"
FROM
	employee a
LEFT JOIN department b on a.dept_code = b.dept_id
LEFT JOIN job c on a.job_code = c.job_code
ORDER BY a.hire_date;

-- Q5.
-- <1단계> 전체 직원 중 연결된 관리자가 있는 직원의 인원을 출력하세요.
-- 참고. 연결된 관리자가 있다는 것은 관리자사번이 NULL이 아님을 의미함
SELECT 
	COUNT(*) "연결된 관리자가 있는 직원의 인원"
FROM
	employee
WHERE 
	manager_id IS NOT NULL;
    
    
-- <2단계> 1단계에서 조회한 내용에는 문제가 조금 있습니다. 관리자사번이 존재하여 연결된
-- 관리자가 있기는 하나, 해당 관리자가 직원 목록에 존재하지 않는 직원이 있습니다.
-- 따라서 1단계를 디벨롭하여 직원 목록에 관리자사번이 존재하는 직원의 인원을 출력하세요.

SELECT 
	COUNT(*) "연결된 관리자가 있는 직원의 인원"
FROM
	employee
WHERE 
	manager_id IN (SELECT 
	manager_id
FROM
	employee
WHERE 
	manager_id BETWEEN 200 AND 222);


SELECT COUNT(*)
 FROM EMPLOYEE E1
JOIN EMPLOYEE E2 ON E1.MANAGER_ID = E2.EMP_ID
ORDER BY E1.EMP_NAME;

-- <3단계> 모든 직원의 직원명과 관리자의 직원명을 출력하세요.
-- 참고. ‘모든 직원’이므로 관리자가 존재하지 않는 직원도 출력되어야 합니다.
SELECT
	a.emp_name,
    b.emp_name
FROM
	employee a
LEFT JOIN employee b ON a.manager_id = b.emp_id; 


-- <4단계> 관리자가 존재하는 직원의 직원명, 부서명, 관리자의 직원명, 관리자의 부서명을 출
-- 력하세요.
SELECT 
	a.emp_name,
    c.dept_title,
    b.emp_name,
    d.dept_title
FROM
	employee a
JOIN employee b ON a.manager_id = b.emp_id
JOIN department c ON a.dept_code = c.dept_id
JOIN department d ON b.dept_code = d.dept_id
WHERE 
	a.manager_id IN (SELECT 
	manager_id
FROM
	employee
WHERE 
	manager_id BETWEEN 200 AND 222);
    

-- Q1.
-- 부서별 직원 급여의 총합 중 가장 큰 액수를 출력하세요.

SELECT 
	max(b) as "부서별 직원 급여의 총합 중 가장 큰 액수"
FROM
	(SELECT
	SUM(salary) as b
FROM
	employee
GROUP BY 
	dept_code
WITH ROLLUP) a;

-- Q2.
-- 서브쿼리를 이용하여 영업부인 직원들의 사원번호, 직원명, 부서코드, 급여를 출력하세요.
-- 참고. 영업부인 직원은 부서명에 ‘영업’이 포함된 직원임
SELECT 
	emp_id,
    emp_name,
    dept_code,
    salary
 FROM
	(SELECT
		*
	FROM
	employee a
JOIN department b on a.dept_code = b.dept_id
		WHERE
	b.dept_title LIKE "%영업%") AS C;
-- Q3.
-- 서브쿼리와 JOIN을 이용하여 영업부인 직원들의 사원번호, 직원명, 부서명, 급여를 출력하
-- 세요.
SELECT 
	emp_id,
    emp_name,
    dept_code,
    salary
 FROM
	(SELECT
		*
	FROM
	employee a
JOIN department b on a.dept_code = b.dept_id
		WHERE
	b.dept_title LIKE "%영업%") as c;

-- Q4.
-- 1. JOIN을 이용하여 부서의 부서코드, 부서명, 해당 부서가 위치한 지역명, 국가명을 추출
-- 하는 쿼리를 작성하세요.
SELECT
distinct
	a.dept_code,
    b.dept_title,
    c.local_name,
    d.national_name
FROM employee a
LEFT JOIN department b ON a.dept_code=b.dept_id
LEFT JOIN location c ON b.location_id=c.local_code
LEFT JOIN nation d ON c.national_code=d.national_code ;

-- 2. 위 1에서 작성한 쿼리를 서브쿼리로 활용하여 모든 직원의 사원번호, 직원명, 급여, 부서
-- 명, (부서의) 국가명을 출력하세요.
-- 단, 국가명 내림차순으로 출력되도록 하세요.
SELECT 
distinct
	a.emp_id,
    a.emp_name,
    a.salary,
    b.dept_title,
    b.national_name
FROM employee a
JOIN (
SELECT
    b.dept_id,
    b.dept_title,
    c.local_name,
    d.national_name
FROM department b
LEFT JOIN location c ON b.location_id=c.local_code
LEFT JOIN nation d ON c.national_code=d.national_code ) AS b on a.dept_code=b.dept_id
ORDER BY
	b.national_name DESC;


-- Q5.
-- 러시아에서 발발한 전쟁으로 인해 정신적 피해를 입은 직원들에게 위로금을 전달하려고 합
-- 니다. 위로금은 각자의 급여에 해당 직원의 급여 등급에 해당하는 최소 금액을 더한 금액으로
-- 정했습니다.
-- Q4에서 작성한 쿼리를 활용하여 해당 부서의 국가가 ‘러시아’인 직원들을 대상으로, 직원의
-- 사원번호, 직원명, 급여, 부서명, 국가명, 위로금을 출력하세요.
-- 단, 위로금 내림차순으로 출력되도록 하세요.
SELECT 
distinct
	a.emp_id,
     a.emp_name,
     a.salary,
     b.dept_title,
     b.national_name,
	salary+min_sal "위로금"
FROM employee a
JOIN (
SELECT
	a.dept_code,
    b.dept_title,
    c.local_name,
    d.national_name
FROM employee a
LEFT JOIN department b ON a.dept_code=b.dept_id
LEFT JOIN location c ON b.location_id=c.local_code
LEFT JOIN nation d ON c.national_code=d.national_code ) AS b
LEFT JOIN sal_grade c ON a.sal_level=c.sal_level
WHERE
 b.national_name="러시아"
ORDER BY
	6 DESC;




	