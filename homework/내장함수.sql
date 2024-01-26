-- 내장함수 과제 

-- Q1.
-- 전화번호가 010으로 시작하는 직원의 직원명과 전화번호를 다음과 같이 출력하세요.
SELECT 
	emp_name,
    CONCAT_WS("-",SUBSTRING(phone,1,3),SUBSTRING(phone,4,4),SUBSTRING(phone,8))
FROM 
	employee
WHERE
	phone LIKE '010%';
    
-- Q2.
-- 근속 일수가 20년 이상인 직원의 직원명, 입사일, 급여를 다음과 같이 출력하세요.
-- 단, 입사한 순서대로 출력하고 입사일이 같으면 급여가 높은 순서로 출력되도록 하세요.
SELECT 
	emp_name 직원명,
    CONCAT(SUBSTRING_INDEX(hire_date,"-",1),"년",SUBSTRING(hire_date,6,2),"월",SUBSTRING_INDEX(hire_date,"-",-1),"일") 입사일 ,
    FORMAT(salary,0) 급여
FROM employee
WHERE YEAR(curdate())-YEAR(hire_date)>20
ORDER BY hire_date ;
    
-- Q3.
-- 모든 직원의 직원명, 급여, 보너스, 급여에 보너스를 더한 금액을 다음과 같이 출력하세요.
-- 단, 급여에 보너스를 더한 금액이 높은 순으로 출력되도록 하세요.
SELECT
	EMP_NAME,
    SALARY,
    CONCAT(ROUND(BONUS*100),"%") BONUS,
    FORMAT(COALESCE(ROUND(SALARY+SALARY*BONUS),SALARY*2),0) TOTAL_SALARY
FROM
	EMPLOYEE
ORDER BY
	COALESCE(ROUND(SALARY+SALARY*BONUS),SALARY*2) DESC; 
	
    
-- Q4.
-- 직원의 직원명과 이메일을 다음과 같이 출력하세요.
-- 출력한 결과집합 헤더의 명칭은 각각 ‘EMP_NAME’, ‘EMAIL’이어야 함
-- 이메일의 도메인 주소인 greedy.com 은 모두 동일하므로, 해당 문자열이 맞춰질 수 있
-- 도록 이메일의 앞에 공백을 두고 출력해야 함

SELECT
	EMP_NAME,
    LPAD(email,(select
max(length(email))
from employee),' ')
FROM
	employee;

-- 이메일의 도메인 주소가 모두 다르다고 가정할 때, @의 위치를 한 줄로 맞추고 싶은 경
-- 우에는 어떻게 수정할 수 있을까?
SELECT
    EMP_NAME AS 'EMP_NAME',
    CONCAT(' ', SUBSTRING_INDEX(email, '@', 1)) AS 'EMAIL'
FROM
    employee;



-- Q5.
-- 사내 행사 준비를 위해 직원 목록을 출력하려고 합니다. 직원 목록을 다음과 같이 출력하세
-- 요.
-- 단, 관리자의 이름순으로 정렬하여 출력되도록 하세요.
SELECT 
	CONCAT(a.emp_name," ",c.job_name,"님") NAME_TAG,
    RPAD(RPAD(a.emp_no,8,""),13,"*") EMP_NO,
    CONCAT(f.national_name,"지사 ",b.dept_title,"소속") BELONG,
	d.emp_name
FROM
	employee a
LEFT JOIN
employee d ON a.manager_id=d.emp_id
	JOIN
	job c ON a.job_code=c.job_code
 JOIN
	department b ON a.dept_code=b.dept_id
    JOIN
    location e ON b.location_id=e.local_code
    JOIN 
    nation f ON e.national_code=f.national_code
 ORDER BY
	4;


    
    
