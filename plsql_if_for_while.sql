-- =========================================
-- ORACLE SQL & PL/SQL PRACTICE QUERIES
-- IF CONDITIONS, FOR LOOP, WHILE LOOP
-- =========================================

-- 1. Check Positive or Negative Number
-- DECLARE
--     num NUMBER := -5;
-- BEGIN
--     IF num > 0 THEN
--         DBMS_OUTPUT.PUT_LINE('Positive');
--     ELSE
--         DBMS_OUTPUT.PUT_LINE('Negative');
--     END IF;
-- END;

-- 2. Check Even or Odd
-- DECLARE
--     num NUMBER := 10;
-- BEGIN
--     IF MOD(num,2)=0 THEN
--         DBMS_OUTPUT.PUT_LINE('Even');
--     ELSE
--         DBMS_OUTPUT.PUT_LINE('Odd');
--     END IF;
-- END;
-- /

-- 3. Find Greater Number
-- DECLARE
--     a NUMBER := 20;
--     b NUMBER := 15;
-- BEGIN
--     IF a>b THEN
--         DBMS_OUTPUT.PUT_LINE('A is Greater');
--     ELSE
--         DBMS_OUTPUT.PUT_LINE('B is Greater');
--     END IF;
-- END;
-- /

-- 4. Grade Calculation
-- DECLARE
--     marks NUMBER := 85;
-- BEGIN
--     IF marks >= 90 THEN
--         DBMS_OUTPUT.PUT_LINE('Grade A');
--     ELSIF marks >= 75 THEN
--         DBMS_OUTPUT.PUT_LINE('Grade B');
--     ELSE
--         DBMS_OUTPUT.PUT_LINE('Grade C');
--     END IF;
-- END;
-- /

-- 5. Check Eligible for Voting
-- DECLARE
--     age NUMBER := 20;
-- BEGIN
--     IF age >= 18 THEN
--         DBMS_OUTPUT.PUT_LINE('Eligible');
--     ELSE
--         DBMS_OUTPUT.PUT_LINE('Not Eligible');
--     END IF;
-- END;
-- /

-- 6. Salary Bonus Check
-- DECLARE
--     salary NUMBER := 50000;
-- BEGIN
--     IF salary > 40000 THEN
--         DBMS_OUTPUT.PUT_LINE('Bonus Applicable');
--     END IF;
-- END;
-- /

-- 7. Leap Year Check
-- DECLARE
--     year NUMBER := 2024;
-- BEGIN
--     IF MOD(year,400)=0 OR (MOD(year,4)=0 AND MOD(year,100)!=0) THEN
--         DBMS_OUTPUT.PUT_LINE('Leap Year');
--     ELSE
--         DBMS_OUTPUT.PUT_LINE('Not Leap Year');
--     END IF;
-- END;
-- /

-- 8. Check Null Value
-- DECLARE
--     name VARCHAR2(20);
-- BEGIN
--     IF name IS NULL THEN
--         DBMS_OUTPUT.PUT_LINE('Value is NULL');
--     END IF;
-- END;
-- /

-- 9. Find Largest of Three Numbers
-- DECLARE
--     a NUMBER:=10;
--     b NUMBER:=40;
--     c NUMBER:=30;
-- BEGIN
--     IF a>b AND a>c THEN
--         DBMS_OUTPUT.PUT_LINE('A Largest');
--     ELSIF b>c THEN
--         DBMS_OUTPUT.PUT_LINE('B Largest');
--     ELSE
--         DBMS_OUTPUT.PUT_LINE('C Largest');
--     END IF;
-- END;
-- /

-- 10. Password Validation
-- DECLARE
--     pwd VARCHAR2(20):='oracle123';
-- BEGIN
--     IF LENGTH(pwd)>=8 THEN
--         DBMS_OUTPUT.PUT_LINE('Valid Password');
--     ELSE
--         DBMS_OUTPUT.PUT_LINE('Weak Password');
--     END IF;
-- END;
-- /

-- =========================================
-- FOR LOOP EXAMPLES
-- =========================================

-- 11. Print Numbers 1 to 10
-- BEGIN
--     FOR i IN 1..10 LOOP
--         DBMS_OUTPUT.PUT_LINE(i);
--     END LOOP;
-- END;
-- /

-- 12. Reverse Numbers
-- BEGIN
--     FOR i IN REVERSE 1..10 LOOP
--         DBMS_OUTPUT.PUT_LINE(i);
--     END LOOP;
-- END;
-- /

-- 13. Multiplication Table
-- DECLARE
--     n NUMBER:=5;
-- BEGIN
--     FOR i IN 1..10 LOOP
--         DBMS_OUTPUT.PUT_LINE(n || ' x ' || i || ' = ' || n*i);
--     END LOOP;
-- END;
-- /

-- 14. Sum of First 10 Numbers
-- DECLARE
--     total NUMBER:=0;
-- BEGIN
--     FOR i IN 1..10 LOOP
--         total := total + i;
--     END LOOP;

--     DBMS_OUTPUT.PUT_LINE('Total = ' || total);
-- END;
-- /

-- 15. Factorial Using FOR LOOP
-- DECLARE
--     n NUMBER:=5;
--     fact NUMBER:=1;
-- BEGIN
--     FOR i IN 1..n LOOP
--         fact := fact * i;
--     END LOOP;

--     DBMS_OUTPUT.PUT_LINE(fact);
-- END;
-- /

-- 16. Print Even Numbers
-- BEGIN
--     FOR i IN 1..20 LOOP
--         IF MOD(i,2)=0 THEN
--             DBMS_OUTPUT.PUT_LINE(i);
--         END IF;
--     END LOOP;
-- END;
-- /

-- 17. Print Employee Names
-- BEGIN
--     FOR rec IN (SELECT employee_id, first_name FROM employees) LOOP
--         DBMS_OUTPUT.PUT_LINE(rec.employee_id || ' ' || rec.first_name);
--     END LOOP;
-- END;
-- /

-- 18. Nested FOR LOOP
-- BEGIN
--     FOR i IN 1..3 LOOP
--         FOR j IN 1..2 LOOP
--             DBMS_OUTPUT.PUT_LINE(i || ' ' || j);
--         END LOOP;
--     END LOOP;
-- END;
-- /

-- 19. Print Squares
-- BEGIN
--     FOR i IN 1..10 LOOP
--         DBMS_OUTPUT.PUT_LINE(i*i);
--     END LOOP;
-- END;
-- /

-- 20. Insert Data Using FOR LOOP
-- BEGIN
--     FOR i IN 1..5 LOOP
--         INSERT INTO test_table(id,name)
--         VALUES(i,'User'||i);
--     END LOOP;

--     COMMIT;
-- END;
-- /

-- =========================================
-- WHILE LOOP EXAMPLES
-- =========================================

-- 21. Print Numbers Using WHILE LOOP
-- DECLARE
--     i NUMBER:=1;
-- BEGIN
--     WHILE i<=10 LOOP
--         DBMS_OUTPUT.PUT_LINE(i);
--         i:=i+1;
--     END LOOP;
-- END;

-- 22. Sum Using WHILE LOOP
-- DECLARE
--     i NUMBER:=1;
--     total NUMBER:=0;
-- BEGIN
--     WHILE i<=5 LOOP
--         total:=total+i;
--         i:=i+1;
--     END LOOP;

--     DBMS_OUTPUT.PUT_LINE(total);
-- END;

-- 23. Factorial Using WHILE LOOP
-- DECLARE
--     n NUMBER:=5;
--     fact NUMBER:=1;
-- BEGIN
--     WHILE n>0 LOOP
--         fact:=fact*n;
--         n:=n-1;
--     END LOOP;

--     DBMS_OUTPUT.PUT_LINE(fact);
-- END;

-- 24. Fibonacci Series
-- DECLARE
--     a NUMBER:=0;
--     b NUMBER:=1;
--     c NUMBER;
--     i NUMBER:=1;
-- BEGIN
--     WHILE i<=10 LOOP
--         DBMS_OUTPUT.PUT_LINE(a);
--         c:=a+b;
--         a:=b;
--         b:=c;
--         i:=i+1;
--     END LOOP;
-- END;

-- 25. Reverse a Number
-- DECLARE
--     num NUMBER:=1234;
--     rev NUMBER:=0;
-- BEGIN
--     WHILE num>0 LOOP
--         rev:=rev*10 + MOD(num,10);
--         num:=TRUNC(num/10);
--     END LOOP;
--     DBMS_OUTPUT.PUT_LINE(rev);
-- END;

-- 26. Count Digits
-- DECLARE
--     num NUMBER:=98765;
--     cnt NUMBER:=0;
-- BEGIN
--     WHILE num>0 LOOP
--         cnt:=cnt+1;
--         num:=TRUNC(num/10);
--     END LOOP;

--     DBMS_OUTPUT.PUT_LINE(cnt);
-- END;

-- 27. Palindrome Number Check
-- DECLARE
--     num NUMBER:=121;
--     temp NUMBER;
--     rev NUMBER:=0;
-- BEGIN
--     temp:=num;

--     WHILE num>0 LOOP
--         rev:=rev*10 + MOD(num,10);
--         num:=TRUNC(num/10);
--     END LOOP;
--     IF temp=rev THEN
--         DBMS_OUTPUT.PUT_LINE('Palindrome');
--     ELSE
--         DBMS_OUTPUT.PUT_LINE('Not Palindrome');
--     END IF;
-- END;

-- 28. Print Odd Numbers
-- DECLARE
--     i NUMBER:=1;
-- BEGIN
--     WHILE i<=20 LOOP
--         IF MOD(i,2)!=0 THEN
--             DBMS_OUTPUT.PUT_LINE(i);
--         END IF;

--         i:=i+1;
--     END LOOP;
-- END;

-- 29. Exit WHILE LOOP
-- DECLARE
--     i NUMBER:=1;
-- BEGIN
--     WHILE i<=10 LOOP
--         DBMS_OUTPUT.PUT_LINE('i value:' || i);
--         EXIT WHEN i=5;

--         DBMS_OUTPUT.PUT_LINE(i);
--         i:=i+1;
--     END LOOP;
-- END;

-- 30. Update Salaries Using WHILE LOOP
-- DECLARE
--     i NUMBER:=100;
-- BEGIN
--     WHILE i<=105 LOOP
--         UPDATE employees
--         SET salary = salary + 1000
--         WHERE employee_id = i;

--         i:=i+1;
--     END LOOP;

--     COMMIT;
-- END;


