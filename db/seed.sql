INSERT INTO doctors
(name, specialization, department, years_experience)
VALUES
('Amit Sharma', 'Cardiologist', 'Cardiology', 12),
('Neha Singh', 'Neurologist', 'Neurology', 10),
('Rahul Verma', 'Orthopedic', 'Orthopedics', 8),
('Priya Gupta', 'Dermatologist', 'Dermatology', 7),
('Karan Kapoor', 'Pediatrician', 'Pediatrics', 9);

INSERT INTO patients
(name, date_of_birth, gender, phone, blood_type)
VALUES
('Rohan Kumar', '1998-04-10', 'M', '9876543210', 'O+'),
('Anjali Sharma', '1995-09-18', 'F', '9876543211', 'A+'),
('Vikas Singh', '1988-02-22', 'M', '9876543212', 'B+'),
('Pooja Verma', '1992-11-12', 'F', '9876543213', 'AB+'),
('Arjun Gupta', '2000-01-25', 'M', '9876543214', 'O-');

INSERT INTO beds
(ward, bed_number, is_occupied)
VALUES
('General', 'G101', TRUE),
('General', 'G102', FALSE),
('ICU', 'I201', TRUE),
('ICU', 'I202', FALSE),
('Private', 'P301', TRUE);

INSERT INTO appointments
(patient_id, doctor_id, scheduled_at, status, notes)
VALUES
(1, 1, '2026-06-10 10:30:00', 'completed', 'Regular heart checkup'),
(2, 2, '2026-06-11 11:00:00', 'completed', 'Headache and dizziness'),
(3, 3, '2026-06-12 14:00:00', 'completed', 'Knee pain consultation'),
(4, 4, '2026-06-13 09:30:00', 'scheduled', 'Skin allergy checkup'),
(5, 5, '2026-06-14 16:00:00', 'completed', 'Child health examination'),
(1, 1, '2026-06-15 10:00:00', 'scheduled', 'Follow-up visit'),
(2, 2, '2026-06-16 12:30:00', 'cancelled', 'Patient cancelled appointment'),
(3, 3, '2026-06-17 15:00:00', 'completed', 'Post treatment review');

INSERT INTO admissions
(patient_id, bed_id, admitted_on, discharged_on)
VALUES
(1, 1, '2026-06-10', '2026-06-15'),
(2, 3, '2026-06-11', NULL),
(3, 5, '2026-06-12', '2026-06-18'),
(4, 2, '2026-06-13', NULL),
(5, 4, '2026-06-14', '2026-06-16');

INSERT INTO prescriptions
(appointment_id, medication, dosage, duration_days)
VALUES
(1, 'Aspirin', '75mg once daily', 30),
(2, 'Paracetamol', '500mg twice daily', 5),
(3, 'Ibuprofen', '400mg once daily', 7),
(4, 'Cetirizine', '10mg once daily', 10),
(5, 'Vitamin D3', '1 tablet weekly', 30),
(6, 'Aspirin', '75mg once daily', 30),
(7, 'Pain Relief Gel', 'Apply twice daily', 7),
(8, 'Physiotherapy Medication', 'As prescribed', 14);

INSERT INTO billing
(admission_id, total_amount, paid_amount, payment_status)
VALUES
(1, 25000.00, 25000.00, 'paid'),
(2, 45000.00, 20000.00, 'partial'),
(3, 30000.00, 30000.00, 'paid'),
(4, 18000.00, 0.00, 'pending'),
(5, 22000.00, 15000.00, 'partial');