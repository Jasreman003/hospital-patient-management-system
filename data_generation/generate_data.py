from faker import Faker
import pandas as pd
import random
from datetime import datetime, timedelta
import os

fake = Faker("en_IN")

# Create output folder
os.makedirs("../generated_data", exist_ok=True)

# ---------------------------
# PATIENTS
# ---------------------------
patients = []

blood_types = ["A+", "A-", "B+", "B-", "AB+", "AB-", "O+", "O-"]

for i in range(1, 101):
    patients.append({
        "patient_id": i,
        "name": fake.name(),
        "date_of_birth": fake.date_of_birth(minimum_age=18, maximum_age=80),
        "gender": random.choice(["M", "F"]),
        "phone": fake.msisdn()[:10],
        "blood_type": random.choice(blood_types)
    })

patients_df = pd.DataFrame(patients)

# ---------------------------
# DOCTORS
# ---------------------------
specializations = [
    ("Cardiologist", "Cardiology"),
    ("Neurologist", "Neurology"),
    ("Orthopedic", "Orthopedics"),
    ("Dermatologist", "Dermatology"),
    ("Pediatrician", "Pediatrics"),
    ("Oncologist", "Oncology"),
    ("ENT Specialist", "ENT"),
    ("Psychiatrist", "Psychiatry")
]

doctors = []

for i in range(1, 21):
    spec = random.choice(specializations)

    doctors.append({
        "doctor_id": i,
        "name": fake.name(),
        "specialization": spec[0],
        "department": spec[1],
        "years_experience": random.randint(1, 25)
    })

doctors_df = pd.DataFrame(doctors)

# ---------------------------
# BEDS
# ---------------------------
wards = ["General", "ICU", "Emergency", "Pediatrics", "Private"]

beds = []

for i in range(1, 51):
    beds.append({
        "bed_id": i,
        "ward": random.choice(wards),
        "bed_number": f"B{i}",
        "is_occupied": random.choice([0, 1])
    })

beds_df = pd.DataFrame(beds)

# ---------------------------
# APPOINTMENTS
# ---------------------------
appointments = []

for i in range(1, 501):
    appointments.append({
        "appointment_id": i,
        "patient_id": random.randint(1, 100),
        "doctor_id": random.randint(1, 20),
        "scheduled_at": fake.date_time_between(
            start_date="-12M",
            end_date="now"
        ),
        "status": random.choice(
            ["scheduled", "completed", "cancelled"]
        ),
        "notes": fake.sentence()
    })

appointments_df = pd.DataFrame(appointments)

# ---------------------------
# ADMISSIONS
# ---------------------------
admissions = []

for i in range(1, 151):

    admitted = fake.date_between(
        start_date="-1y",
        end_date="today"
    )

    if random.random() < 0.7:
        discharged = admitted + timedelta(
            days=random.randint(1, 15)
        )
    else:
        discharged = None

    admissions.append({
        "admission_id": i,
        "patient_id": random.randint(1, 100),
        "bed_id": random.randint(1, 50),
        "admitted_on": admitted,
        "discharged_on": discharged
    })

admissions_df = pd.DataFrame(admissions)

# ---------------------------
# PRESCRIPTIONS
# ---------------------------
medications = [
    "Paracetamol",
    "Amoxicillin",
    "Ibuprofen",
    "Metformin",
    "Atorvastatin",
    "Azithromycin"
]

prescriptions = []

for i in range(1, 501):

    prescriptions.append({
        "prescription_id": i,
        "appointment_id": random.randint(1, 500),
        "medication": random.choice(medications),
        "dosage": random.choice(
            ["1 tablet", "2 tablets", "5 ml", "10 ml"]
        ),
        "duration_days": random.randint(3, 30),
        "prescribed_on": fake.date_between(
            start_date="-1y",
            end_date="today"
        )
    })

prescriptions_df = pd.DataFrame(prescriptions)

# ---------------------------
# BILLING
# ---------------------------
billing = []

for i in range(1, 201):

    total = random.randint(5000, 100000)

    status = random.choice(
        ["paid", "partial", "pending"]
    )

    if status == "paid":
        paid = total

    elif status == "partial":
        paid = random.randint(
        int(total * 0.2),
        int(total * 0.8)
        )

    else:
        paid = 0

    billing.append({
        "bill_id": i,
        "admission_id": random.randint(1, 150),
        "total_amount": total,
        "paid_amount": paid,
        "payment_status": status,
        "billed_on": fake.date_between(
            start_date="-1y",
            end_date="today"
        )
    })

billing_df = pd.DataFrame(billing)

# ---------------------------
# SAVE FILES
# ---------------------------
patients_df.to_csv(
    "../generated_data/patients.csv",
    index=False
)

doctors_df.to_csv(
    "../generated_data/doctors.csv",
    index=False
)

beds_df.to_csv(
    "../generated_data/beds.csv",
    index=False
)

appointments_df.to_csv(
    "../generated_data/appointments.csv",
    index=False
)

admissions_df.to_csv(
    "../generated_data/admissions.csv",
    index=False
)

prescriptions_df.to_csv(
    "../generated_data/prescriptions.csv",
    index=False
)

billing_df.to_csv(
    "../generated_data/billing.csv",
    index=False
)

print("All CSV files generated successfully!")