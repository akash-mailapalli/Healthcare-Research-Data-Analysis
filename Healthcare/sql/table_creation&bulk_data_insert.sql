CREATE DATABASE HealthcareAnalyticsDB;
GO

USE HealthcareAnalyticsDB;
GO

CREATE TABLE patients (
    patient_id INT PRIMARY KEY,
    patient_name VARCHAR(100),
    gender VARCHAR(10),
    age INT,
    city VARCHAR(50),
    registration_date DATE
);

BULK INSERT patients
FROM 'C:\Users\akash\Desktop\Data_Analyst\Projects\Healthcare\data\healthcare_patients_clean.csv'
WITH
(
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    TABLOCK
);

CREATE TABLE doctors (
    doctor_id INT PRIMARY KEY,
    doctor_name VARCHAR(100),
    department VARCHAR(50),
    experience_years INT
);

BULK INSERT doctors
FROM 'C:\Users\akash\Desktop\Data_Analyst\Projects\Healthcare\data\healthcare_doctors_clean.csv'
WITH
(
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    TABLOCK
);

CREATE TABLE visits (
    visit_id INT PRIMARY KEY,
    patient_id INT,
    doctor_id INT,
    visit_date DATE,
    treatment_type VARCHAR(50),
    treatment_cost DECIMAL(10,2),
    outcome VARCHAR(50),
    length_of_stay_days INT,
    satisfaction_score INT,

    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id)
);

BULK INSERT visits
FROM 'C:\Users\akash\Desktop\Data_Analyst\Projects\Healthcare\data\healthcare_visits_clean.csv'
WITH
(
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    TABLOCK
);

CREATE TABLE operations (
    department VARCHAR(50),
    month DATE,
    patients_handled INT,
    avg_wait_time_minutes INT,
    bed_utilization_percent INT
);

BULK INSERT operations
FROM 'C:\Users\akash\Desktop\Data_Analyst\Projects\Healthcare\data\healthcare_operations_clean.csv'
WITH
(
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    TABLOCK
);

SELECT top 10 * FROM patients;
SELECT top 10 * FROM doctors;
SELECT top 10 * FROM visits;
SELECT top 10 * FROM operations;

SELECT 
    COLUMN_NAME,
    DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME IN ('patients','doctors','visits','operations');

