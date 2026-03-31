CREATE TABLE Department (
    Dept_ID INT PRIMARY KEY,
    Dept_Name VARCHAR(50),
    Head_of_Dep VARCHAR(50),
    Contact_No VARCHAR(15),
    Number_of_Employees INT
);

CREATE TABLE Employee (
    E_ID INT PRIMARY KEY,
    First_Name VARCHAR(50),
    Last_Name VARCHAR(50),
    Phone_Number VARCHAR(15),
    Email VARCHAR(100),
    Address VARCHAR(150),
    Age INT,
    Gender VARCHAR(10),
    Dept_ID INT,
    FOREIGN KEY (Dept_ID) REFERENCES Department(Dept_ID)
);

CREATE TABLE Salary (
    Salary_ID INT PRIMARY KEY,
    E_ID INT,
    Salary_Amount DECIMAL(10,2),
    Description VARCHAR(100),
    FOREIGN KEY (E_ID) REFERENCES Employee(E_ID)
);

CREATE TABLE Project (
    Project_ID INT PRIMARY KEY,
    Dept_ID INT,
    Project_Name VARCHAR(100),
    Budget DECIMAL(10,2),
    FOREIGN KEY (Dept_ID) REFERENCES Department(Dept_ID)
);

CREATE TABLE Employee_Training (
    Training_ID INT PRIMARY KEY,
    Training_Name VARCHAR(100),
    Cost DECIMAL(10,2),
    Start_Date DATE,
    End_Date DATE
);

CREATE TABLE Employee_Training_Enrollment (
    E_ID INT,
    Training_ID INT,
    Enrollment_Date DATE DEFAULT SYSDATE,
    Completion_Status VARCHAR(20) DEFAULT 'Enrolled',
    PRIMARY KEY (E_ID, Training_ID),
    FOREIGN KEY (E_ID) REFERENCES Employee(E_ID),
    FOREIGN KEY (Training_ID) REFERENCES Employee_Training(Training_ID)
);
