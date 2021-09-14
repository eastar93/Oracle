/* ������ �ּ� */
-- �� �� �ּ�
-- HR �������� �׽�Ʈ�ϰ� �ֽ��ϴ�.
-- MySQL���� �޸� Oracle SQL������ ������ �����ͺ��̽� ������� ���� �� �ֽ��ϴ�.
-- hr�������� �λ��� ���� �����Ͱ� ���� �ֽ��ϴ�.

-- MySQL�� ���������� Oracle������ ���� ������ SELECT������ ����մϴ�.
SELECT employee_id, first_name, last_name 
FROM employees;

SELECT * FROM employees;
-- �޿��� 5000�̻��� ������ ���̵�, ��, �̸��� ����غ�����.
SELECT employee_id, first_name, last_name
FROM employees
WHERE salary >= 5000;

-- Oracle������ ORDER BY�� ������ �� �� �ֽ��ϴ�.
-- �� ������ �������̵� ������������ ���ı��� �� �ּ���
SELECT employee_id, first_name, last_name
FROM employees
WHERE salary >= 5000
ORDER BY employee_id ASC;

-- ������ �������� �ɰڽ��ϴ�.
-- �޿� 5000�̻� + job_id�� 'IT_PROG'�� ���̽��� ��ȸ���ּ���.
SELECT employee_id, first_name, last_name
FROM employees
WHERE salary >=5000 AND job_id = 'IT_PROG'
ORDER BY employee_id DESC;

-- Oracle�� ���ڿ� �ڷ����� ��� ��ҹ��� ������ �մϴ�.
-- �޿��� 5000�̻��̰ų� Ȥ�� job_id�� 'IT_PROG'�� �������� ��ȸ���ּ���.
SELECT employee_id, first_name, last_name
FROM employees
WHERE salary >= 5000 OR job_id = 'IT_PROG';

-- ������ row������ �˰� ���� ���
SELECT COUNT(*)
FROM employees
WHERE salary >= 5000 OR job_id = 'IT_PROG';

-- �÷����� ������ ������ ���̺��� ���鶧 ������ �̸����� ��ȸ������
-- SELECT ��������� �ٲ㼭 ��ȸ�ϰ� �������� AS������ ����մϴ�.
-- SELECT �÷���1 AS �ٲ��̸�1, �÷���2 AS �ٲ��̸�2...
-- Ű���� AS�� ������ �� �ִ�.
SELECT employee_id AS �������̵� FROM employees;
SELECT employee_id �������̵� FROM employees;

-- INSERT INTO������ ���̺� ROW�� �߰��ϴ� �����Դϴ�.
-- MYSQL�� ���� ������ ������ ����մϴ�.
-- �׽�Ʈ�� ���̺��� �ϳ� ����ڽ��ϴ�.
CREATE TABLE test1 (
    col1 VARCHAR2(10), -- ���ڿ�
    col2 NUMBER, -- ����
    col3 DATE -- ��¥,(�󼼽ð� ����, �󼼽ð� �Է½� TIMESTAMP)
);

-- INSERT INTO�� �̿��� test1�� �����մϴ�.
-- �ð��� �����ð����� ������ ��� SYSDATE�� �Է����ݴϴ�.
-- mysql������ SYSDATE ��� now()�� ����մϴ�.
INSERT INTO test1(col1, col2, col3) VALUES('ABC', 10, SYSDATE);

-- INTO ������ �÷� ������ �ٲ㵵 VALUES���� �ٲ� ������ ��ó�̼� �־��ָ�
-- ������ �����ϴ�.
INSERT INTO test1(col3, col1, col2) VALUES(SYSDATE, 'DEF', 20);

-- ������ ������ ���� ������ Ÿ���� ������ ������ ������ �߻��մϴ�.
INSERT INTO test1(col1, col2, col3) VALUES('ABC', 10, 30);

-- �÷����� ��ü�÷��� ���� �ִ� ��� MySQL�� ���������� ���� �����մϴ�.
INSERT INTO test1 VALUES('GHI', 10, SYSDATE);

-- �Ϻ� ������ ���� ������ �߻��մϴ�.
INSERT INTO test1 VALUES('JKL', 30);

SELECT * FROM test1;

-- �÷� ������ ������ �����ϱ�. INSERT ~ SELECT ��.
-- subQUERY���·� INSERT INTO ������ VALUES�� �� �ڸ���
-- ������ �ڷ����� ��ġ�ϴ� SELECT ������ �ۼ��ϸ�
-- SELECT���� ������� �״�� ���� INSERT �˴ϴ�.
CREATE TABLE test2(
    emp_id NUMBER
);
-- �ٷ� �Ʒ��� SELECT ������ NUMBER�����͸� ����� ���ɴϴ�.
SELECT employee_id FROM employees;

-- �Ʒ� ������
-- test2 ���̺� ���ο�, 86������ ����� ���� ���� ��ü�� ����ֽ��ϴ�.
INSERT INTO test2 
    (SELECT employee_id FROM employees);
    
-- 88�� ������ �����δ� mySQL�� �Ʒ��� ����ó�� ó���˴ϴ�.
-- INSERT INTO test2 VALUES
--        (100), (101), (102), ..., (206);
    
SELECT * FROM test2;

-- ���� 
-- INSERT ~ SELECT ������ �̿��ؼ�
-- EMPLOYEE ���̺��� employee_id, first_name, last_name, job_id
-- 4�� �÷��� ��ü ����޴� test3���̺��� ������ ��
-- ���縦 �������ּ���

CREATE TABLE test3(
    emp_id Number, 
    first_name VARCHAR2(20), 
    last_name VARCHAR2(20), 
    job_id VARCHAR2(20)
    );
    
INSERT INTO test3
    (SELECT employee_id, first_name, last_name, job_id FROM employees);
    
SELECT * FROM test3;

-- update��
-- UPDATE SET�� �̿��ؼ� ó���ϸ� mysql�� ���� ������ ������ ����մϴ�.
-- UPDATE SET�� �׳� ó���ϸ� �÷� ��ü ���� �ٲ�ϴ�.
-- ���� WHERE�� �Բ� ����ϴ°��� �Ϲ����̴�.
SELECT * FROM test1;

-- ���̺� col2�� ���� ���� 50���� �ٲ��ݴϴ�.
UPDATE test1 SET col2 = 50;

SELECT * FROM test1;

-- col1�� ���� DEF�� ��츸 col2�� 500���� �����ּ���.
UPDATE test1 SET col2 = 500 WHERE col1 = 'DEF';

SELECT * FROM test1;

-- Oracle SQL�� MERGE ������ MySQL�� ON DUPLICATE KEY�� �����ϴ�.
-- �����Ͱ� �ִ� ��� UPDATE��, ���� ���� INSERT�� �����մϴ�.
-- MERGE INTO�� ����ϰ� ����Ŭ������ MySQL���ٴ� �ټ� ����������
-- ��ɻ����δ� ū ���̴� ���� ������ ������ �������� �ָ����ּ���.
CREATE TABLE test4(
    employee_id NUMBER primary key,
    bonus_amt NUMBER DEFAULT 0 -- �ƹ� ���� �Էµ��� ������ 0 �Է�
);

INSERT INTO test4 (employee_id)
    SELECT e.employee_id 
        FROM  employees e
    WHERE e.employee_id < 106;

SELECT * FROM test4;

-- �����ϴ� EMPLOYEE_ID������ �ִ� ��� => ����
-- �������� �ʴ� EMPLOYEE_ID������ �ִ� ��� => �߰�
INSERT INTO test4(employee_id) VALUES (107);

-- MERGE INTO ������ �̿��ؼ� ó���غ��ڽ��ϴ�.
-- �Է��� ���̺� t1, ���̺� �ϳ��� ���ؼ� �۾��ô� USING DUAL
MERGE INTO test4 t1 USING DUAL
    ON(t1.employee_id = 105) -- ���ǽ�(t1�� t2�� id���� ��ġ�ϴ� ���)
    WHEN MATCHED THEN -- ��Ī�� �Ǵ� ���(���� �����ϴ� ���)
        UPDATE SET t1.bonus_amt = 1000 WHERE t1.employee_id=105
    WHEN NOT MATCHED THEN -- ��Ī�� ���� �ʴ� ���(���� ���� ���)
        INSERT (t1.employee_id, t1.bonus_amt) 
            VALUES (110, 2000);
            
SELECT * FROM test4;

-- DELETE ������ Ư�� �ο츦 �����մϴ�.
-- WHERE���� ���� �ʴ´ٸ� ��ü �����Ͱ� �����Ǳ� ������
-- �� ���� �����ؼ� UPDATE���� ���������� ��ǻ� WHERE���� ��Ʈ��
-- �����ؼ� �� �ֽø� �˴ϴ�.
-- MySQL�� ���������� ū ���̰� �����ϴ�.

-- test4 ���̺��� BONUS_AMT�� 700�� �ʰ��ϴ� �����͸� �������ּ���.
DELETE FROM test4 WHERE bonus_amt > 700;

SELECT * FROM test4;

-- Oracle SQL������ �ε����� ��ȸ�ϱⰡ MySQL���� �����ϴ�.
-- �ε����� ��ȸ�� ���� ROW���� �Ű��� ������ ���Դϴ�.
-- Oracle SQL������ SELECT ���� rownum�� ��� �ο� �ε��� ��ȣ��
-- SELECT ���� rowid�� ���� �ο� �ε��� �ּҰ��� ���� ��ȸ�� �� �ֽ��ϴ�.
-- MySQL���� ���� ����Դϴ�.
-- rownum, rowidó�� ����ڰ� ���� �Է����� �ʰ� ��ȸ�Ǵ� �÷��� �����Ѽ�
-- �ǻ��÷��̶�� �θ��ϴ�.
SELECT rownum, rowid, employee_id, bonus_amt FROM test4;

SELECT rownum, rowid, employee_id, first_name, last_name FROM employees;

-- Group BY ���� MySQL�� ����� ������ ����մϴ�.
-- SELECT �����Լ�(�÷���)... GROUP BY (�����÷�)HAVING ������;
-- �������� HAVING���� ó���մϴ�.
SELECT * FROM EMPLOYEES;
-- EMPLOYEES���� JOB_ID(���� ����), DEPARTMENT_ID(�μ� ����) �� 
-- ���� ������ ��ǥ�ϴ� �ڷᰡ �ֽ��ϴ�.
-- GROUP BY�� �̿��� �μ���, ������ �����͸� �����غ��ڽ��ϴ�.

-- �� ������ ��� ������ �����ּ���.
SELECT JOB_ID, AVG(SALARY) 
FROM employees 
GROUP BY JOB_ID;

-- �� ������ ��� ������ ���ϵ�, 10000�̻��� �����ּ���.
SELECT JOB_ID, AVG(SALARY) 
FROM employees 
GROUP BY JOB_ID
HAVING AVG(SALARY)>10000;

-- �� �μ��� ��� ������ ���ϵ�, 6000 - 9000���̷� �����ּ���
SELECT DEPARTMENT_ID, AVG(SALARY) 
FROM employees 
GROUP BY DEPARTMENT_ID
HAVING 6000 <= AVG(SALARY) AND AVG(SALARY) < 9000;

-- JOIN�� �� �� �̻��� ���̺��� �ϳ��� �����ִ� ���� �ǹ��մϴ�.
-- �⺻������ JOIN�ô� Ư���� ��츦 �����ϰ�� �����ֱ� ���� ���� �÷���
-- �ʿ��ϸ�, �Ϲ������� FOREIGN KEY�� ����� �÷����� JOIN�� �����մϴ�.
-- �׷��� �ݵ�� FOREIGN KEY ���迩�߸� ������ ���� �� �� �ִ°��� �ƴմϴ�.

-- SELECT ���̺�1.�÷�1, ���̺�1.�÷�2, ���̺�2.�÷�1 ...
--     FROM ���̺�1(����) JOIN ���̺�2(����)
--     ON ���̺�1.�����÷� = ���̺�2.�����÷�;
-- ���α����� INNER, LEFT, RIGHT, FULL�� ������
-- MySQL������ FULL������ FULLŰ����δ� �Ұ����մϴ�.
-- ORACLE������ FULLŰ���带 ����մϴ�.
CREATE TABLE JOIN_A(
    EMP_ID NUMBER
);
CREATE TABLE JOIN_B(
    EMP_ID NUMBER
);
INSERT INTO JOIN_A VALUES(10);
INSERT INTO JOIN_A VALUES(20);
INSERT INTO JOIN_A VALUES(40);
INSERT INTO JOIN_B VALUES(10);
INSERT INTO JOIN_B VALUES(20);
INSERT INTO JOIN_B VALUES(30);

-- INNER JOIN 
--> �� �� ������ �ִ� 10, 20�� ���
SELECT a.emp_id, b.emp_id 
    FROM JOIN_A a INNER JOIN JOIN_B b
        ON(a.emp_id = b.emp_id);
        
-- LEFT OUTER JOIN 
--> ���� ���̺� �ڷ�� ��� �츮�� ������ �����ڷ� 10, 20 �׸��� A�� ���� �ڷ� 40�� ���
SELECT a.emp_id, b.emp_id 
    FROM JOIN_A a LEFT OUTER JOIN JOIN_B b
        ON(a.emp_id = b.emp_id);

-- RIGHT OUTER JOIN 
--> ������ ���̺� �ڷ�� ��� �츮�� ������ �����ڷ� 10, 20 �׸��� B�� ���� �ڷ� 30�� ���
SELECT a.emp_id, b.emp_id 
    FROM JOIN_A a RIGHT OUTER JOIN JOIN_B b
        ON(a.emp_id = b.emp_id);
        
-- FULL OUTER JOIN 
--> �����ڷ� 10, 20 �Ӹ� �ƴ϶� ���� A�� 40�� ������ B�� 30���� ��� ���
SELECT a.emp_id, b.emp_id 
    FROM JOIN_A a FULL OUTER JOIN JOIN_B b
        ON(a.emp_id = b.emp_id); 
        
        