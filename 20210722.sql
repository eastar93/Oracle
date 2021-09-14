-- Oracle SQL������ MySQLó�� ���α׷����� �� �� �ֽ��ϴ�.
-- ��, ���� �����̳� ȣ�� ���� ����, �׸��� �ܼ�â�� ����ϴ� ������
-- �Ȱ��� �ʱ� ������ Oracle���� ������ ���� �����ּž� �մϴ�.
-- Oracle���� �����ϴ� ���α׷����� PL/SQL�̶�� �θ��⵵ �մϴ�.

-- PL/SQL ����
-- ����)
-- DECLARE
--    ������ �ڷ���;
--    ......
-- BEGIN
--    ���๮
-- END;

-- �͸� ��� => DECLARE ~ END ������ ����̶�� �θ��ϴ�.
-- �͸� ����� ��Ī�� ������ �ʰ� ����ϴ� PL/SQL ���α׷��� ������ �ǹ��մϴ�.
/*
DECLARE
    vi_num NUMBER;
BEGIN
    vi_num := 100;
    DBMS_OUTPUT.PUT_LINE(vi_num); --print������ ������
END;

-- Sql Developer���� �ܼ�â�� ���� ���
-- ��� �޴��� ���� -> DBMS ��� Ŭ��
-- DBMS ��� â���� �»�� ��� ���ڰ� Ŭ�� �� ���Ӱ���

-- ���������� �Ϲ� ���α׷���ó�� �����ڸ� ����� �� �ֽ��ϴ�.

/*
DECLARE
    a INTEGER := 2**2*3**2;
BEGIN
    DBMS_OUTPUT.PUT_LINE('a = ' || TO_CHAR(a));
END;
*/

-- MySQL�� ���������� PL/SQL������ Ư�� ������
-- INTO ������ �̿��� SELECT �������� ������� ������ �� �ս��ϴ�.
/*
DECLARE
    vs_emp_name VARCHAR2(80);
BEGIN
    SELECT first_name INTO vs_emp_name
        FROM employees
        WHERE employee_id=100;
    dbms_output.put_line('�޾ƿ� ����� ' || vs_emp_name);
END;
*/
-- employees ���̺��� 105�� ����� �μ���ȣ, �̸� �޿���
-- PL/SQL �������� ȣ���ؼ� �ֿܼ� ����ּ���.
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
        dbms_output.put_line('�μ���ȣ ' || vs_dep_id ||
        ', ����� ' || vs_emp_name || ' ,�޿� ' || vs_sal);
END;
*/

-- ����ο��� ���� �ڷ����� ������ �� Ư�� ���̺��� Ư�� �÷�����
-- �������� ����� �ϴ� ��찡 ����մϴ�.
-- �� ��, ����ڰ� ���������� �ڷ����� ������ Ȯ���ϰ� �����ϸ� �����ϴ�
-- �ڵ����� �ش� �÷� �ڷ����� �޾ƿ����� ó���� ���� �ֽ��ϴ�.
-- ������ ���̺��.�÷���%TYPE; �̶�� ��� ó���մϴ�.
-- ���÷� DEPARTMENT���� DEPARTMENT_NAME�� LACATION_ID�� �������ڽ��ϴ�.
/*
DECLARE
    d_name DEPARTMENTS.DEPARTMENT_NAME%TYPE;
    l_id DEPARTMENTS.LOCATION_ID%TYPE;
BEGIN
    SELECT DEPARTMENT_NAME, LOCATION_ID
        INTO d_NAME, l_id
        FROM DEPARTMENTS
        WHERE DEPARTMENT_ID = 20;
    DBMS_OUTPUT.PUT_LINE('�μ��̸� : ' || d_name ||
                            ', �μ���ġ : ' || l_id );
END;
*/

-- PL/SQL�� ���ǹ�
-- IF ���ǽ� THEN�� ����ϸ�, ������ ������ END IF; �� �����ָ� �˴ϴ�.
-- �̿� ������ ���� MySQL�ʰ� �����ϴ� else if�� ELSIF�� ǥ���մϴ�.
-- ����) vn_num1, vn_num2�� NUMBER Ÿ������ ���� ���ڸ� ����־��ֽð�
-- ������� ���ڵ� �� num1�� ũ�� "num1�� Ů�ϴ�.", num2�� ũ�� "num2�� Ů�ϴ�."
-- ��� ����ϴ� ���ǹ��� �ۼ����ּ���
/*
DECLARE 
    vn_num1 NUMBER := 3;
    vn_num2 NUMBER := 5;
BEGIN
    IF vn_num1 > vn_num2 THEN
        DBMS_OUTPUT.PUT_LINE('num1�� Ů�ϴ�');
    ELSIF vn_num1 < vn_num2 THEN
        DBMS_OUTPUT.PUT_LINE('num2�� Ů�ϴ�.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('���� ���� �����Դϴ�.');
    END IF;
END;
*/

-- ���ν��� ����
-- ���ν����� MySQL�� ����ϰ� ����ϸ�
-- ������ �ణ �ٸ��� ������ �����ϼž� �մϴ�.
-- ����)
-- CREATE OR REPLACE PROCEDURE ���ν�����(
--      �Ķ����1 ������Ÿ��,
--      ......
-- )
-- IS
--      �ʿ�� ���� �� ��� ����
-- BEGIN
--      ���౸��
-- END ���ν�����;

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

-- ���ν��� ȣ��ô� MySQL�� CALL���
-- Oracle SQL������ EXEC ���ν�����, EXECUTE ���ν������� ����մϴ�.
EXEC my_new_job('INTERN', 'INTERN STAFF', 500, 1000);












