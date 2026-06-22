CREATE TABLE patients (
  patient_id    INT PRIMARY KEY AUTO_INCREMENT,
  name          VARCHAR(100) NOT NULL,
  date_of_birth DATE NOT NULL,
  gender        CHAR(1),
  phone         VARCHAR(15),
  blood_type    VARCHAR(5)
);

CREATE TABLE doctors (
  doctor_id        INT PRIMARY KEY AUTO_INCREMENT,
  name             VARCHAR(100) NOT NULL,
  specialization   VARCHAR(80),
  department       VARCHAR(80),
  years_experience INT
);

CREATE TABLE beds (
  bed_id      INT PRIMARY KEY AUTO_INCREMENT,
  ward        VARCHAR(50),
  bed_number  VARCHAR(10) UNIQUE,
  is_occupied BOOLEAN DEFAULT FALSE
);

CREATE TABLE appointments (
  appointment_id INT PRIMARY KEY AUTO_INCREMENT,
  patient_id     INT NOT NULL,
  doctor_id      INT NOT NULL,
  scheduled_at   DATETIME NOT NULL,
  status         ENUM('scheduled','completed','cancelled') DEFAULT 'scheduled',
  notes          TEXT,
  FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
  FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id)
);

CREATE TABLE admissions (
  admission_id INT PRIMARY KEY AUTO_INCREMENT,
  patient_id INT NOT NULL,
  bed_id INT NOT NULL,
  admitted_on DATE NOT NULL,
  discharged_on DATE,
  FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
  FOREIGN KEY (bed_id) REFERENCES beds(bed_id)
);

CREATE TABLE prescriptions (
  prescription_id INT PRIMARY KEY AUTO_INCREMENT,
  appointment_id INT NOT NULL,
  medication VARCHAR(100),
  dosage VARCHAR(50),
  duration_days INT,
  prescribed_on DATE DEFAULT (CURRENT_DATE),
  FOREIGN KEY (appointment_id) REFERENCES appointments(appointment_id)
);

CREATE TABLE billing (
  bill_id INT PRIMARY KEY AUTO_INCREMENT,
  admission_id INT NOT NULL,
  total_amount DECIMAL(10,2),
  paid_amount DECIMAL(10,2) DEFAULT 0,
  payment_status ENUM('pending','partial','paid') DEFAULT 'pending',
  billed_on DATE DEFAULT (CURRENT_DATE),
  FOREIGN KEY (admission_id) REFERENCES admissions(admission_id)
);