-- Створення бази даних PersonnelAccountingDW
CREATE DATABASE PersonnelAccountingDW;
GO

USE PersonnelAccountingDW;
GO

-- Таблиця вимірів для працівників
CREATE TABLE Dim_Employee (
    employee_id INT IDENTITY(1,1) PRIMARY KEY,
    full_name VARCHAR(155),
    date_of_birth DATE,
	place_of_birth VARCHAR(50) NOT NULL,
	passport_data INT NOT NULL,
	report_number INT NOT NULL,
    home_address VARCHAR(50),
	employee_key INT NOT NULL
);

-- Таблиця вимірів для відділів
CREATE TABLE Dim_Department (
    department_id INT IDENTITY(1,1) PRIMARY KEY,
    name VARCHAR(50),
    abbreviation VARCHAR(4),
    manager_name VARCHAR(50),
	department_key INT NOT NULL
);

-- Таблиця вимірів для посад
CREATE TABLE Dim_Position (
    position_id INT IDENTITY(1,1) PRIMARY KEY,
    name VARCHAR(50),
    base_salary INT,
    rate DECIMAL(10,2),
	position_key INT NOT NULL
);

CREATE TABLE Dim_Date (
    date_id INT IDENTITY(1,1) PRIMARY KEY,
    date DATE NULL,
    year INT NULL,
    month INT NULL,
    day INT NULL
);

-- Таблиця фактів для аналізу
CREATE TABLE Fact_Personnel (
    fact_id INT IDENTITY(1,1) PRIMARY KEY,
    employee_id INT,
    department_id INT,
    position_id INT,
    holiday_start_date_id INT,
    holiday_end_date_id INT NULL,
    work_start_date_id INT,
    work_end_date_id INT NULL,
	vacation_days INT DEFAULT 0,
    total_salary DECIMAL(15,2),
	FOREIGN KEY (holiday_start_date_id) REFERENCES Dim_Date(date_id), 
    FOREIGN KEY (holiday_end_date_id) REFERENCES Dim_Date(date_id),   
    FOREIGN KEY (work_start_date_id) REFERENCES Dim_Date(date_id),    
    FOREIGN KEY (work_end_date_id) REFERENCES Dim_Date(date_id),
    FOREIGN KEY (employee_id) REFERENCES Dim_Employee(employee_id),
    FOREIGN KEY (department_id) REFERENCES Dim_Department(department_id),
    FOREIGN KEY (position_id) REFERENCES Dim_Position(position_id)
);
GO
