-- Manager View
CREATE OR REPLACE VIEW Manager_View AS
SELECT 
    E.E_ID,
    E.First_Name,
    E.Last_Name,
    E.Phone_Number,
    E.Email,
    E.Address,
    E.Age,
    E.Gender,
    D.Dept_Name,
    S.Salary_Amount
FROM Employee E
JOIN Department D ON E.Dept_ID = D.Dept_ID
JOIN Salary S ON E.E_ID = S.E_ID;

-- Encryption functions
CREATE OR REPLACE FUNCTION encrypt_data(p_text VARCHAR2)
RETURN RAW IS
BEGIN
    RETURN UTL_RAW.cast_to_raw(p_text);
END;

CREATE OR REPLACE FUNCTION decrypt_data(p_raw RAW)
RETURN VARCHAR2 IS
BEGIN
    RETURN UTL_RAW.cast_to_varchar2(p_raw);
END;

-- Masking Views
CREATE OR REPLACE VIEW Employee_Masked AS
SELECT 
    First_Name,
    Last_Name,
    SUBSTR(Phone_Number,1,2)||'XXXXX' AS Phone_Number,
    SUBSTR(Email,1,3)||'*****' AS Email,
    Age,
    Gender,
    Dept_ID
FROM Employee;

CREATE OR REPLACE VIEW Salary_Masked AS
SELECT 
    Salary_ID,
    E_ID,
    NULL AS Salary_Amount,
    NULL AS Description
FROM Salary;

-- FGA Policies
BEGIN
    DBMS_FGA.add_policy(
        object_schema => 'SYSTEM',
        object_name => 'EMPLOYEE',
        policy_name => 'EMP_PHONE_AUDIT',
        audit_column => 'PHONE_NUMBER',
        enable => TRUE
    );
END;
/
