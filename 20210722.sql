-- Oracle SQL에서도 MySQL처럼 프로그래밍을 할 수 있습니다.
-- 단, 변수 선언이나 호출 등의 문법, 그리고 콘솔창에 출력하는 문법이
-- 똑같지 않기 때문에 Oracle쪽의 문법을 따로 익혀주셔야 합니다.
-- Oracle에서 진행하는 프로그래밍은 PL/SQL이라고 부르기도 합니다.

-- PL/SQL 문법
-- 문법)
-- DECLARE
--    변수명 자료형;
--    ......
-- BEGIN
--    실행문
-- END;

-- 익명 블록 => DECLARE ~ END 구간을 블록이라고 부릅니다.
-- 익명 블록은 명칭을 붙이지 않고 사용하는 PL/SQL 프로그래밍 구간을 의미합니다.
/*
DECLARE
    vi_num NUMBER;
BEGIN
    vi_num := 100;
    DBMS_OUTPUT.PUT_LINE(vi_num); --print구문은 좌측에
END;

-- Sql Developer에서 콘솔창을 여는 방법
-- 상단 메뉴의 보기 -> DBMS 출력 클릭
-- DBMS 출력 창에서 좌상단 녹색 십자가 클릭 후 접속계정

-- 내부적으로 일반 프로그래밍처럼 연산자를 사용할 수 있습니다.

/*
DECLARE
    a INTEGER := 2**2*3**2;
BEGIN
    DBMS_OUTPUT.PUT_LINE('a = ' || TO_CHAR(a));
END;
*/

-- MySQL과 마찬가지로 PL/SQL에서도 특정 변수에
-- INTO 구문을 이용해 SELECT 쿼리문의 결과값을 저장할 수 잇습니다.
/*
DECLARE
    vs_emp_name VARCHAR2(80);
BEGIN
    SELECT first_name INTO vs_emp_name
        FROM employees
        WHERE employee_id=100;
    dbms_output.put_line('받아온 사원명 ' || vs_emp_name);
END;
*/
-- employees 테이블의 105번 사원의 부서번호, 이름 급여를
-- PL/SQL 형식으로 호출해서 콘솔에 찍어주세요.
/*
DECLARE
    vs_dep_id INT;
    vs_emp_name VARCHAR2(80);
    vs_sal INT;
BEGIN
    SELECT Employee_id, First_name, Salary
        INTO vs_dep_id, vs_emp_name, vs_sal
            FROM employees
            WHERE employee_id = 105;
        dbms_output.put_line('부서번호 ' || vs_dep_id ||
        ', 사원명 ' || vs_emp_name || ' ,급여 ' || vs_sal);
END;
*/

-- 선언부에서 변수 자료형을 설정할 때 특정 테이블의 특정 컬럼값을
-- 기준으로 맞춰야 하는 경우가 빈번합니다.
-- 이 때, 사용자가 직접적으로 자료형을 일일히 확인하고 기입하면 불편하니
-- 자동으로 해당 컬럼 자료형을 받아오도록 처리할 수도 있습니다.
-- 변수명 테이블명.컬럼명%TYPE; 이라고 적어서 처리합니다.
-- 예시로 DEPARTMENT에서 DEPARTMENT_NAME과 LACATION_ID를 가져오겠습니다.
/*
DECLARE
    d_name DEPARTMENTS.DEPARTMENT_NAME%TYPE;
    l_id DEPARTMENTS.LOCATION_ID%TYPE;
BEGIN
    SELECT DEPARTMENT_NAME, LOCATION_ID
        INTO d_NAME, l_id
        FROM DEPARTMENTS
        WHERE DEPARTMENT_ID = 20;
    DBMS_OUTPUT.PUT_LINE('부서이름 : ' || d_name ||
                            ', 부서위치 : ' || l_id );
END;
*/

-- PL/SQL의 조건문
-- IF 조건식 THEN을 사용하며, 끝나는 지점에 END IF; 를 적어주면 됩니다.
-- 이외 문법은 전부 MySQL쪽과 동일하니 else if는 ELSIF로 표기합니다.
-- 문제) vn_num1, vn_num2에 NUMBER 타입으로 각각 숫자를 집어넣어주시고
-- 집어넣은 숫자들 중 num1이 크면 "num1이 큽니다.", num2가 크면 "num2가 큽니다."
-- 라고 출력하는 조건문을 작성해주세요
/*
DECLARE 
    vn_num1 NUMBER := 3;
    vn_num2 NUMBER := 5;
BEGIN
    IF vn_num1 > vn_num2 THEN
        DBMS_OUTPUT.PUT_LINE('num1이 큽니다');
    ELSIF vn_num1 < vn_num2 THEN
        DBMS_OUTPUT.PUT_LINE('num2이 큽니다.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('서로 같은 숫자입니다.');
    END IF;
END;
*/

-- 프로시저 생성
-- 프로시저는 MySQL과 비슷하게 사용하며
-- 문법은 약간 다르기 때문에 주의하셔야 합니다.
-- 문법)
-- CREATE OR REPLACE PROCEDURE 프로시저명(
--      파라미터1 데이터타입,
--      ......
-- )
-- IS
--      필요시 변수 및 상수 선언
-- BEGIN
--      실행구문
-- END 프로시저명;

CREATE OR REPLACE PROCEDURE my_new_job(
    n_job_id IN JOBS.JOB_ID%TYPE,
    n_job_title IN JOBS.JOB_TITLE%TYPE,
    n_min_salary IN JOBS.MIN_SALARY%TYPE,
    n_max_salary IN JOBS.MAX_SALARY%TYPE
)
IS
BEGIN
    INSERT INTO JOBS(JOB_ID, JOB_TITLE, MIN_SALARY, MAX_SALARY)
        VALUES(n_job_id, n_job_title, n_min_salary, n_max_salary);
    COMMIT;
END my_new_job;

-- 프로시저 호출시는 MySQL의 CALL대신
-- Oracle SQL에서는 EXEC 프로시저명, EXECUTE 프로시저명을 사용합니다.
EXEC my_new_job('INTERN', 'INTERN STAFF', 500, 1000);












