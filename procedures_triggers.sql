-- 1. Simple Procedure

-- CREATE OR REPLACE PROCEDURE hello_world
-- IS
-- BEGIN
--     DBMS_OUTPUT.PUT_LINE('Hello World');
-- END;
-- /
-- BEGIN
--     HELLO_WORLD;
-- end;
-- /
-- 2. Procedure with Input Parameter

-- CREATE OR REPLACE PROCEDURE show_employee
-- (
--     p_emp_name VARCHAR2
-- )
-- IS
-- BEGIN
--     DBMS_OUTPUT.PUT_LINE('Employee Name: ' || p_emp_name);
-- END;
-- /
-- begin 
--     SHOW_EMPLOYEE('Hema');
-- end;
-- /
-- -- 3. Procedure with Addition

-- CREATE OR REPLACE PROCEDURE add_numbers
-- (
--     a NUMBER,
--     b NUMBER
-- )
-- IS
--     c NUMBER;
-- BEGIN
--     c := a + b;

--     DBMS_OUTPUT.PUT_LINE('Sum = ' || c);
-- END;
-- /
-- begin
--     add_numbers(10,20);
-- end;
-- /


-- 4. Procedure with OUT Parameter

-- CREATE OR REPLACE PROCEDURE get_square
-- (
--     p_num IN NUMBER,
--     p_square OUT NUMBER
-- )
-- IS
-- BEGIN
--     p_square := p_num * p_num;
-- END;
-- /
-- DECLARE
--     p_square NUMBER;
-- BEGIN
--     get_square(10, p_square);
--     DBMS_OUTPUT.PUT_LINE('Square = ' || p_square);
-- END;
-- /


-- 5. Employee Salary Update

-- CREATE OR REPLACE PROCEDURE update_salary
-- (
--     p_empid NUMBER,
--     p_increment NUMBER
-- )
-- IS
-- BEGIN
--     UPDATE employees
--     SET salary = salary + p_increment
--     WHERE emp_id = p_empid;

--     COMMIT;

--     DBMS_OUTPUT.PUT_LINE('Salary Updated');
-- END;
-- /
-- begin 
--     update_salary(105,1000);
-- end;
-- /


-- 6. Insert Employee Record

-- CREATE OR REPLACE PROCEDURE insert_employee
-- (
--     p_id NUMBER,
--     p_name VARCHAR2,
--     p_salary NUMBER
-- )
-- IS
-- BEGIN
--     INSERT INTO employees(emp_id, emp_name, salary)
--     VALUES(p_id, p_name, p_salary);

--     COMMIT;

--     DBMS_OUTPUT.PUT_LINE('Record Inserted');
-- END;
-- /
-- BEGIN
--     insert_employee(109,'Alex',200000);
-- end;
-- /

-- 7. Delete Employee

-- CREATE OR REPLACE PROCEDURE delete_employee
-- (
--     p_empid NUMBER
-- )
-- IS
-- BEGIN
--     DELETE FROM employees
--     WHERE emp_id = p_empid;

--     COMMIT;

--     DBMS_OUTPUT.PUT_LINE('Employee Deleted');
-- END;
-- /
-- BEGIN
--     delete_employee(109);
-- end;

-- 8. Find Maximum Salary

-- CREATE OR REPLACE PROCEDURE max_salary
-- IS
--     v_max NUMBER;
-- BEGIN
--     SELECT MAX(salary)
--     INTO v_max
--     FROM employees;

--     DBMS_OUTPUT.PUT_LINE('Maximum Salary = ' || v_max);
-- END;
-- /
-- BEGIN
--     max_salary;
-- end;
-- /

-- 9. Procedure with Exception Handling
-- CREATE OR REPLACE PROCEDURE divide_numbers
-- (
--     a NUMBER,
--     b NUMBER
-- )
-- IS
--     c NUMBER;
-- BEGIN
--     c := a / b;

--     DBMS_OUTPUT.PUT_LINE('Result = ' || c);

-- EXCEPTION
--     WHEN ZERO_DIVIDE THEN
--         DBMS_OUTPUT.PUT_LINE('Cannot divide by zero');
-- END;
-- /
-- BEGIN
--     divide_numbers(10,0);
-- end;
-- /

-- 10. Cursor Procedure

-- CREATE OR REPLACE PROCEDURE employee_details
-- IS
--     CURSOR emp_cursor IS
--         SELECT emp_name, salary
--         FROM employees;

--     v_name employees.emp_name%TYPE;
--     v_salary employees.salary%TYPE;

-- BEGIN
--     OPEN emp_cursor;

--     LOOP
--         FETCH emp_cursor INTO v_name, v_salary;

--         EXIT WHEN emp_cursor%NOTFOUND;

--         DBMS_OUTPUT.PUT_LINE(v_name || ' - ' || v_salary);
--     END LOOP;

--     CLOSE emp_cursor;
-- END;
-- /
-- BEGIN
--     EMPLOYEE_DETAILS;
-- end;
-- /

-- 11. Banking Deposit Procedure

-- CREATE OR REPLACE PROCEDURE deposit_amount
-- (
--     p_accno NUMBER,
--     p_amount NUMBER
-- )
-- IS
-- BEGIN
--     UPDATE bank_accounts
--     SET balance = balance + p_amount
--     WHERE account_no = p_accno;

--     COMMIT;

--     DBMS_OUTPUT.PUT_LINE('Amount Deposited');
-- END;
-- /


-- 12. Banking Withdrawal Procedure

-- CREATE OR REPLACE PROCEDURE withdraw_amount
-- (
--     p_accno NUMBER,
--     p_amount NUMBER
-- )
-- IS
--     v_balance NUMBER;
-- BEGIN
--     SELECT balance
--     INTO v_balance
--     FROM bank_accounts
--     WHERE account_no = p_accno;

--     IF v_balance >= p_amount THEN

--         UPDATE bank_accounts
--         SET balance = balance - p_amount
--         WHERE account_no = p_accno;

--         COMMIT;

--         DBMS_OUTPUT.PUT_LINE('Withdrawal Successful');

--     ELSE
--         DBMS_OUTPUT.PUT_LINE('Insufficient Balance');
--     END IF;
-- END;
-- /

-- 13. Student Grade Procedure

-- CREATE OR REPLACE PROCEDURE student_grade
-- (
--     p_marks NUMBER
-- )
-- IS
-- BEGIN
--     IF p_marks >= 90 THEN
--         DBMS_OUTPUT.PUT_LINE('Grade A');

--     ELSIF p_marks >= 75 THEN
--         DBMS_OUTPUT.PUT_LINE('Grade B');

--     ELSIF p_marks >= 50 THEN
--         DBMS_OUTPUT.PUT_LINE('Grade C');

--     ELSE
--         DBMS_OUTPUT.PUT_LINE('Fail');
--     END IF;
-- END;
-- /
-- begin
--     student_grade(100);
-- end;
-- /


-- 14. Factorial Procedure

-- CREATE OR REPLACE PROCEDURE factorial_proc
-- (
--     p_num NUMBER
-- )
-- IS
--     fact NUMBER := 1;
-- BEGIN
--     FOR i IN 1..p_num LOOP
--         fact := fact * i;
--     END LOOP;

--     DBMS_OUTPUT.PUT_LINE('Factorial = ' || fact);
-- END;
-- /
-- begin
--     factorial_proc(10);
-- end;
-- /

-- 15. Prime Number Procedure

-- CREATE OR REPLACE PROCEDURE check_prime
-- (
--     p_num NUMBER
-- )
-- IS
--     flag NUMBER := 0;
-- BEGIN
--     FOR i IN 2..p_num-1 LOOP

--         IF MOD(p_num, i) = 0 THEN
--             flag := 1;
--         END IF;

--     END LOOP;

--     IF flag = 0 THEN
--         DBMS_OUTPUT.PUT_LINE('Prime Number');
--     ELSE
--         DBMS_OUTPUT.PUT_LINE('Not Prime');
--     END IF;
-- END;
-- /
-- BEGIN
--     CHECK_PRIME(23);
-- end;
-- /

-- 16. Procedure Using LOOP

-- CREATE OR REPLACE PROCEDURE print_numbers
-- IS
--     i NUMBER := 1;
-- BEGIN
--     LOOP
--         DBMS_OUTPUT.PUT_LINE(i);

--         i := i + 1;

--         EXIT WHEN i > 10;
--     END LOOP;
-- END;
-- /
-- BEGIN
--     print_numbers;
-- end;
-- /

-- 17. Retail Discount Procedure

-- CREATE OR REPLACE PROCEDURE calculate_discount
-- (
--     p_amount NUMBER
-- )
-- IS
--     v_discount NUMBER;
-- BEGIN
--     IF p_amount >= 10000 THEN
--         v_discount := p_amount * 0.20;

--     ELSIF p_amount >= 5000 THEN
--         v_discount := p_amount * 0.10;

--     ELSE
--         v_discount := p_amount * 0.05;
--     END IF;

--     DBMS_OUTPUT.PUT_LINE('Discount = ' || v_discount);
-- END;
-- /
-- begin
--     calculate_discount(5000);
-- end;
-- /


-- 18. Procedure with IN OUT Parameter

-- CREATE OR REPLACE PROCEDURE increment_value
-- (
--     p_num IN OUT NUMBER
-- )
-- IS
-- BEGIN
--     p_num := p_num + 1;
-- END;
-- /
-- DECLARE
--     p_num NUMBER := 10;
-- BEGIN
--     increment_value(p_num);

--     DBMS_OUTPUT.PUT_LINE('Updated Value = ' || p_num);
-- END;
-- /

-- 19. Procedure to Count Employees

-- CREATE OR REPLACE PROCEDURE employee_count
-- IS
--     v_count NUMBER;
-- BEGIN
--     SELECT COUNT(*)
--     INTO v_count
--     FROM employees;

--     DBMS_OUTPUT.PUT_LINE('Total Employees = ' || v_count);
-- END;
-- /
-- begin
--     employee_count;
-- end;
-- /

-- 20. Procedure for Transaction Transfer

-- CREATE OR REPLACE PROCEDURE transfer_amount
-- (
--     p_from_acc NUMBER,
--     p_to_acc NUMBER,
--     p_amount NUMBER
-- )
-- IS
--     v_balance NUMBER;
-- BEGIN

--     SELECT balance
--     INTO v_balance
--     FROM bank_accounts
--     WHERE account_no = p_from_acc;

--     IF v_balance >= p_amount THEN

--         UPDATE bank_accounts
--         SET balance = balance - p_amount
--         WHERE account_no = p_from_acc;

--         UPDATE bank_accounts
--         SET balance = balance + p_amount
--         WHERE account_no = p_to_acc;

--         COMMIT;

--         DBMS_OUTPUT.PUT_LINE('Transfer Successful');

--     ELSE
--         DBMS_OUTPUT.PUT_LINE('Insufficient Funds');
--     END IF;

-- EXCEPTION
--     WHEN OTHERS THEN
--         ROLLBACK;
--         DBMS_OUTPUT.PUT_LINE('Transaction Failed');
-- END;
-- /

-- EXAMPLE 1 : BEFORE INSERT TRIGGER

-- CREATE TABLE employees1
-- (
--     employee_id NUMBER,
--     employee_name VARCHAR2(100),
--     salary NUMBER
-- );

-- CREATE OR REPLACE TRIGGER trg_before_insert
-- BEFORE INSERT
-- ON employees1
-- FOR EACH ROW
-- BEGIN
--     DBMS_OUTPUT.PUT_LINE('Before Insert Trigger Fired');
-- END;
-- /

-- INSERT INTO employees1
-- VALUES(101, 'Bharath', 50000);

-- UPDATE employees1
-- SET salary = 60000
-- WHERE employee_id = 101;

-- EXAMPLE 2 : AFTER INSERT TRIGGER

-- CREATE TABLE employees2
-- (
--     employee_id NUMBER,
--     employee_name VARCHAR2(100),
--     salary NUMBER
-- );
-- CREATE OR REPLACE TRIGGER trg_after_insert
-- AFTER INSERT
-- ON employees2
-- FOR EACH ROW
-- BEGIN
--     DBMS_OUTPUT.PUT_LINE('After Insert Trigger Fired');
-- END;
-- /
-- INSERT INTO employees2
-- VALUES(102, 'Rahul', 45000);

-- UPDATE employees2
-- SET salary = 48000
-- WHERE employee_id = 102;

-- EXAMPLE 3 : BEFORE UPDATE TRIGGER
-- CREATE TABLE employees3
-- (
--     employee_id NUMBER,
--     employee_name VARCHAR2(100),
--     salary NUMBER
-- );
-- CREATE OR REPLACE TRIGGER trg_before_update
-- BEFORE UPDATE
-- ON employees3
-- FOR EACH ROW
-- BEGIN
--     DBMS_OUTPUT.PUT_LINE('Before Update Trigger Fired');
-- END;
-- /
-- INSERT INTO employees3
-- VALUES(103, 'Anil', 30000);
-- UPDATE employees3
-- SET salary = 35000
-- WHERE employee_id = 103;

-- EXAMPLE 4 : AFTER UPDATE TRIGGER

-- CREATE TABLE employees4
-- (
--     employee_id NUMBER,
--     employee_name VARCHAR2(100),
--     salary NUMBER
-- );
-- CREATE OR REPLACE TRIGGER trg_after_update
-- AFTER UPDATE
-- ON employees4
-- FOR EACH ROW
-- BEGIN
--     DBMS_OUTPUT.PUT_LINE('After Update Trigger Fired');
-- END;
-- /
-- INSERT INTO employees4
-- VALUES(104, 'Kiran', 40000);
-- UPDATE employees4
-- SET salary = 45000
-- WHERE employee_id = 104;

-- EXAMPLE 5 : BEFORE DELETE TRIGGER

-- CREATE TABLE employees5
-- (
--     employee_id NUMBER,
--     employee_name VARCHAR2(100),
--     salary NUMBER
-- );
-- CREATE OR REPLACE TRIGGER trg_before_delete
-- BEFORE DELETE
-- ON employees5
-- FOR EACH ROW
-- BEGIN
--     DBMS_OUTPUT.PUT_LINE('Before Delete Trigger Fired');
-- END;
-- /
-- INSERT INTO employees5
-- VALUES(105, 'Ramesh', 35000);
-- DELETE FROM employees5
-- WHERE employee_id = 105;

-- EXAMPLE 6 : AFTER DELETE TRIGGER

-- CREATE TABLE employees6
-- (
--     employee_id NUMBER,
--     employee_name VARCHAR2(100),
--     salary NUMBER
-- );
-- CREATE OR REPLACE TRIGGER trg_after_delete
-- AFTER DELETE
-- ON employees6
-- FOR EACH ROW
-- BEGIN
--     DBMS_OUTPUT.PUT_LINE('After Delete Trigger Fired');
-- END;
-- /
-- INSERT INTO employees6
-- VALUES(106, 'Suresh', 55000);
-- DELETE FROM employees6
-- WHERE employee_id = 106;

-- EXAMPLE 7 : NEGATIVE SALARY VALIDATION

-- create table employees7
-- (
--     employee_id NUMBER,
--     employee_name VARCHAR2(100),
--     salary NUMBER
-- );
-- create or replace trigger trg_negative_salary
-- before insert or UPDATE
-- on employees7
-- for each row
-- begin
--     if :new.salary < 0 THEN
--      raise_application_error
--     (
--         -20000,
--         'negative salary not allowed'
--     );
--     end if;
-- end;
-- /
-- insert into employees7
-- values (107, 'mahesh', 50000);
-- update employees7
-- set salary = -1000
-- where Employee_id = 107;

-- EXAMPLE 8 : AUTO UPPERCASE NAME
-- create table employees8
-- (
--     employee_id NUMBER,
--     employee_name varchar2(100)
-- );
-- create or replace trigger trg_uppercase_name
-- before insert or UPDATE
-- on employees8
-- for each row
-- BEGIN
--     :new.employee_name:=upper(:new.employee_name);
-- end;
-- /
-- insert into employees8
-- values(108, 'bharath');
-- update employees8
-- set employee_name = 'rahul'
-- where employee_id = 108;

-- EXAMPLE 9 : MODIFIED DATE TRIGGER
-- CREATE TABLE employees9
-- (
--     employee_id NUMBER,
--     employee_name VARCHAR2(100),
--     modified_date DATE
-- );
-- CREATE OR REPLACE TRIGGER trg_modified_date
-- BEFORE UPDATE
-- ON employees9
-- FOR EACH ROW
-- BEGIN
--     :NEW.modified_date := SYSDATE;
-- END;
-- /
-- INSERT INTO employees9
-- VALUES(109, 'Ajay', NULL);
-- UPDATE employees9
-- SET employee_name = 'Ajay Kumar'
-- WHERE employee_id = 109;

-- EXAMPLE 10 : INSERT AUDIT TRIGGER
-- CREATE TABLE employees10
-- (
--     employee_id NUMBER,
--     employee_name VARCHAR2(100)
-- );
-- CREATE TABLE employee_audit10
-- (
--     emp_id NUMBER,
--     action_type VARCHAR2(20)
-- );
-- CREATE OR REPLACE TRIGGER trg_insert_audit
-- AFTER INSERT
-- ON employees10
-- FOR EACH ROW
-- BEGIN
--     INSERT INTO employee_audit10
--     VALUES(:NEW.employee_id, 'INSERT');
-- END;
-- /
-- INSERT INTO employees10
-- VALUES(110, 'Deepak');
-- UPDATE employees10
-- SET employee_name = 'Deepak Kumar'
-- WHERE employee_id = 110;

-- EXAMPLE 11 : UPDATE AUDIT TRIGGER

-- create table employees11
-- (
--     employee_id  NuMBER,
--     EMPLOYEE_NAME varchar2(100)
-- );
-- create table employee_audit11
-- (
--     emp_id number,
--     action_type varchar2(20)
-- );
-- create or replace trigger trg_update_audit
-- after UPDATE
-- on employees11
-- for each ROW
-- begin
--     insert into employee_audit11
--     values(:new.employee_id, 'update');
-- end;
-- /
-- insert into employees11
-- values(111,'vikram');
-- update employees11
-- set employee_name = 'vikram R'
-- where employee_id = 111;

-- EXAMPLE 12 : DELETE AUDIT TRIGGER

-- create table employees12
-- (
--     employee_id number,
--     employee_name varchar2(100)
-- );
-- create table employee_audit12
-- (
--     emp_id number,
--     action_type varchar2(20)
-- );
-- create or replace trigger trg_delete_audit
-- after delete
-- on employees12
-- for each row
-- BEGIN
--     insert into employee_audit12
--     values(:old.employee_id,'delete');
-- end;
-- /
-- insert into employees12
-- values(112,'rohit');
-- delete from employees12
-- where employee_id = 112;

-- EXAMPLE 13 : MINIMUM BALANCE TRIGGER
-- CREATE TABLE accounts13
-- (
--     account_no NUMBER,
--     balance NUMBER
-- );
-- CREATE OR REPLACE TRIGGER trg_min_balance
-- BEFORE UPDATE
-- ON accounts13
-- FOR EACH ROW
-- BEGIN
--     IF :NEW.balance < 1000 THEN

--         RAISE_APPLICATION_ERROR
--         (
--             -20002,
--             'Minimum Balance Required'
--         );

--     END IF;
-- END;
-- /
-- INSERT INTO accounts13
-- VALUES(1001, 5000);
-- UPDATE accounts13
-- SET balance = 500
-- WHERE account_no = 1001;

-- EXAMPLE 14 : AUTO DISCOUNT TRIGGER

-- CREATE TABLE orders14
-- (
--     order_id NUMBER,
--     amount NUMBER,
--     discount NUMBER
-- );

-- CREATE OR REPLACE TRIGGER trg_discount
-- BEFORE INSERT
-- ON orders14
-- FOR EACH ROW
-- BEGIN

--     IF :NEW.amount > 10000 THEN
--         :NEW.discount := 20;
--     ELSE
--         :NEW.discount := 5;
--     END IF;

-- END;
-- /

-- INSERT INTO orders14
-- VALUES(1, 15000, NULL);

-- UPDATE orders14
-- SET amount = 20000
-- WHERE order_id = 1;

-- EXAMPLE 15 : RESTRICT DELETE

-- CREATE TABLE employees15
-- (
--     employee_id NUMBER,
--     employee_name VARCHAR2(100)
-- );

-- CREATE OR REPLACE TRIGGER trg_restrict_delete
-- BEFORE DELETE
-- ON employees15
-- BEGIN

--     RAISE_APPLICATION_ERROR
--     (
--         -20003,
--         'Delete Not Allowed'
--     );

-- END;
-- /

-- INSERT INTO employees15
-- VALUES(115, 'Harish');

-- DELETE FROM employees15
-- WHERE employee_id = 115;

-- EXAMPLE 16 : CHECK AGE VALIDATION

-- CREATE TABLE students16
-- (
--     student_id NUMBER,
--     student_name VARCHAR2(100),
--     age NUMBER
-- );
-- CREATE OR REPLACE TRIGGER trg_check_age
-- BEFORE INSERT OR UPDATE
-- ON students16
-- FOR EACH ROW
-- BEGIN
--     IF :NEW.age < 18 THEN
--         RAISE_APPLICATION_ERROR
--         (
--             -20004,
--             'Age Must Be Greater Than 18'
--         );
--     END IF;
-- END;
-- /
-- INSERT INTO students16
-- VALUES(1, 'Kiran', 20);
-- UPDATE students16
-- SET age = 15
-- WHERE student_id = 1;

-- EXAMPLE 17 : STORE OLD SALARY
-- CREATE TABLE employees17
-- (
--     employee_id NUMBER,
--     salary NUMBER
-- );
-- CREATE TABLE salary_history17
-- (
--     emp_id NUMBER,
--     old_salary NUMBER
-- );
-- CREATE OR REPLACE TRIGGER trg_old_salary
-- BEFORE UPDATE
-- ON employees17
-- FOR EACH ROW
-- BEGIN
--     INSERT INTO salary_history17
--     VALUES(:OLD.employee_id, :OLD.salary);
-- END;
-- /
-- INSERT INTO employees17
-- VALUES(117, 40000);
-- UPDATE employees17
-- SET salary = 50000
-- WHERE employee_id = 117;

-- EXAMPLE 18 : LOGIN AUDIT TRIGGER
-- CREATE TABLE login_audit18
-- (
--     username VARCHAR2(100),
--     login_time DATE
-- );
-- CREATE OR REPLACE TRIGGER trg_login_audit
-- AFTER LOGON
-- ON DATABASE
-- BEGIN
--     INSERT INTO login_audit18
--     VALUES(USER, SYSDATE);
-- END;
-- /
-- select * from login_audit18;

-- EXAMPLE 19 : INSTEAD OF TRIGGER
-- CREATE TABLE employees19
-- (
--     employee_id NUMBER,
--     employee_name VARCHAR2(100)
-- );
-- CREATE VIEW employee_view19 AS
-- SELECT * FROM employees19;
-- CREATE OR REPLACE TRIGGER trg_instead_of_insert
-- INSTEAD OF INSERT
-- ON employee_view19
-- FOR EACH ROW
-- BEGIN
--     INSERT INTO employees19
--     VALUES(:NEW.employee_id, :NEW.employee_name);
-- END;
-- /
-- INSERT INTO employee_view19
-- VALUES(119, 'Bharath');
-- UPDATE employees19
-- SET employee_name = 'Bharath Kumar'
-- WHERE employee_id = 119;

-- EXAMPLE 20 : MULTIPLE EVENT TRIGGER

CREATE TABLE employees20
(
    employee_id NUMBER,
    employee_name VARCHAR2(100)
);
CREATE OR REPLACE TRIGGER trg_multiple_events
BEFORE INSERT OR UPDATE OR DELETE
ON employees20
FOR EACH ROW
BEGIN
    DBMS_OUTPUT.PUT_LINE('Multiple Event Trigger Fired');
END;
/
INSERT INTO employees20
VALUES(120, 'Rahul');
UPDATE employees20
SET employee_name = 'Rahul Sharma'
WHERE employee_id = 120;
DELETE FROM employees20
WHERE employee_id = 120;