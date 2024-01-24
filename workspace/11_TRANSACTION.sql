-- 11. TRANSACTION : 데이터베이스에서 한 번에 수행 되는 작업의 단위
-- 작업 중 문제가 있을 경우 ROLLBACK, 잘 수행 되었을 경우 COMMIT 처리
-- MySQL의 기본 설정은 autocommit 이므로 해당 설정을 변경 후 테스트

-- autocommit 활성화
SET autocommit = 1;
SET autocommit = ON;

-- autocommit 비활성화
SET autocommit = 0;
SET autocommit = OFF;

START TRANSACTION;

SELECT * FROM tbl_menu;

INSERT INTO tbl_menu VALUES(null,'바나나해장국',8500,4,'Y');
UPDATE tbl_menu SET menu_name = '이름수정' WHERE menu_code = 9;
DELETE FROM tbl_menu WHERE menu_code = 7;

COMMIT; -- 트랜잭션을 최종 반영해서 저장한다. 
ROLLBACK; -- 트랜잭션을 되돌린다.