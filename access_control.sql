CREATE USER system_admin IDENTIFIED BY AdminPass123;
GRANT CONNECT, RESOURCE TO system_admin;

CREATE USER manager_user IDENTIFIED BY ManagerPass123;
GRANT CONNECT, RESOURCE TO manager_user;

GRANT SELECT, INSERT, UPDATE, DELETE ON Department TO manager_user;
GRANT SELECT, INSERT, UPDATE, DELETE ON Employee TO manager_user;
GRANT SELECT, INSERT, UPDATE, DELETE ON Salary TO manager_user;
GRANT SELECT, INSERT, UPDATE, DELETE ON Project TO manager_user;
GRANT SELECT, INSERT, UPDATE, DELETE ON Employee_Training TO manager_user;
GRANT SELECT, INSERT, UPDATE, DELETE ON Employee_Training_Enrollment TO manager_user;

CREATE USER executive_user IDENTIFIED BY ExecPass123;

GRANT CONNECT TO executive_user;
GRANT SELECT ON Department TO executive_user;
GRANT SELECT ON Employee TO executive_user;
GRANT SELECT ON Project TO executive_user;
GRANT SELECT ON Salary TO executive_user;
GRANT SELECT ON Employee_Training TO executive_user;
GRANT SELECT ON Employee_Training_Enrollment TO executive_user;
