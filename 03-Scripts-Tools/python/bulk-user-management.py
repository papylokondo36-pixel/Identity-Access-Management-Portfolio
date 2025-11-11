#!/usr/bin/env python3
# -*- coding: utf-8 -*-

print("Azure AD User Management Script")
print("Generating sample users...")

import csv
import random
import os

# Create sample users
users = []
departments = ["IT", "Finance", "HR", "Sales"]
first_names = ["James", "Mary", "John", "Patricia", "Robert", "Jennifer"]
last_names = ["Smith", "Johnson", "Williams", "Brown", "Jones"]

for i in range(8):
    first = random.choice(first_names)
    last = random.choice(last_names)
    dept = random.choice(departments)
    
    user = {
        "id": i + 1,
        "displayName": f"{first} {last}",
        "userPrincipalName": f"{first.lower()}.{last.lower()}@contoso.com", 
        "department": dept,
        "jobTitle": f"{dept} Specialist"
    }
    users.append(user)
    print(f"Created: {user['displayName']} - {dept}")

# Export to CSV
csv_path = "../../02 Technical-Implementations/Azure-AD-Lab/divestiture-users.csv"
os.makedirs(os.path.dirname(csv_path), exist_ok=True)

with open(csv_path, 'w', newline='', encoding='utf-8') as file:
    writer = csv.DictWriter(file, fieldnames=users[0].keys())
    writer.writeheader()
    writer.writerows(users)

print(f"CSV exported to: {csv_path}")
print("Script completed successfully!")
