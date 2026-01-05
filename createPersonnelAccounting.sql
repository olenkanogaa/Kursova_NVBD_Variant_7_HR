-- Створення бази даних PersonnelAccounting
CREATE DATABASE PersonnelAccounting;
GO

USE PersonnelAccounting;
GO

-- Таблиця для паспортних даних
CREATE TABLE data_Passport (
    id INT IDENTITY(1,1) PRIMARY KEY,
    father_name VARCHAR(50) NOT NULL,
    name VARCHAR(50) NOT NULL,
    surname VARCHAR(50) NOT NULL,
    passport_data INT NOT NULL,
    date_of_birth DATE NOT NULL,
    place_of_birth VARCHAR(50) NOT NULL
);

-- Таблиця для відділів
CREATE TABLE Departments (
    id INT IDENTITY(1,1) PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    abbreviation VARCHAR(4) NOT NULL,
    manager_name VARCHAR(50) NOT NULL
);

-- Таблиця для посад
CREATE TABLE Positions (
    id INT IDENTITY(1,1) PRIMARY KEY,
    name VARCHAR(32) NOT NULL,
    salary INT NOT NULL,
    rate DECIMAL(10,2) NOT NULL
);

-- Таблиця для працівників
CREATE TABLE Employees (
    id INT IDENTITY(1,1) PRIMARY KEY,
    id_passport INT NOT NULL,
    report_number INT NOT NULL,
    home_address VARCHAR(50) NOT NULL,
    id_departament INT NOT NULL,
    position INT NOT NULL,
    FOREIGN KEY (id_departament) REFERENCES Departments(id),
    FOREIGN KEY (position) REFERENCES Positions(id),
    FOREIGN KEY (id_passport) REFERENCES data_Passport(id)
);

-- Таблиця для історії посад
CREATE TABLE History_Position (
    id INT IDENTITY(1,1) PRIMARY KEY,
    id_empoyee INT NOT NULL,
    id_position INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NULL,
    FOREIGN KEY (id_empoyee) REFERENCES Employees(id),
    FOREIGN KEY (id_position) REFERENCES Positions(id)
);

-- Таблиця для відпусток
CREATE TABLE Holidays (
    id INT IDENTITY(1,1) PRIMARY KEY,
    id_employee INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NULL,
    FOREIGN KEY (id_employee) REFERENCES Employees(id)
);
GO
