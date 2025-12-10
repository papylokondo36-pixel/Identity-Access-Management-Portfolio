#!/usr/bin/env python3
"""
IAM Bulk User Management Script
Day 2: User Lifecycle Management for Divestiture Scenarios
"""

import csv
import random
from datetime import datetime
import json

class AzureADUserManager:
    def __init__(self):
        self.users = []
        self.departments = {
            'IT': ['Systems Administrator', 'Help Desk Analyst', 'Security Engineer', 'Network Admin'],
            'Finance': ['Accountant', 'Financial Analyst', 'Payroll Specialist', 'Controller'],
            'HR': ['HR Partner', 'Recruiter', 'Compensation Analyst', 'HR Director'],
            'Sales': ['Sales Representative', 'Account Executive', 'Sales Manager', 'Business Dev'],
            'Operations': ['Operations Manager', 'Logistics Coordinator', 'Project Manager']
        }
        self.script_version = "1.0"
        self.generated_time = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        
    def generate_strong_password(self, length=16):
        """Generate a secure random password that meets Azure AD requirements"""
        import secrets
        import string
        
        # Azure AD password requirements: 8+ chars, 3 of 4: lowercase, uppercase, numbers, symbols
        lowercase = string.ascii_lowercase
        uppercase = string.ascii_uppercase
        digits = string.digits
        symbols = "!@#$%^&*"
        
        # Ensure at least one of each required character type
        password = [
            secrets.choice(lowercase),
            secrets.choice(uppercase), 
            secrets.choice(digits),
            secrets.choice(symbols)
        ]
        
        # Fill the rest randomly
        all_chars = lowercase + uppercase + digits + symbols
        password += [secrets.choice(all_chars) for _ in range(length - 4)]
        
        # Shuffle the password
        secrets.SystemRandom().shuffle(password)
        return ''.join(password)
    
    def generate_sample_users(self, count=20):
        """Generate realistic sample users for divestiture scenario"""
        print(f"🚀 Generating {count} sample users for divestiture...")
        
        first_names = ['James', 'Mary', 'John', 'Patricia', 'Robert', 'Jennifer', 'Michael', 'Linda', 'William', 'Elizabeth', 
                      'David', 'Barbara', 'Richard', 'Susan', 'Joseph', 'Jessica', 'Thomas', 'Sarah', 'Charles', 'Karen']
        
        last_names = ['Smith', 'Johnson', 'Williams', 'Brown', 'Jones', 'Garcia', 'Miller', 'Davis', 'Rodriguez', 'Martinez',
                     'Hernandez', 'Lopez', 'Gonzalez', 'Wilson', 'Anderson', 'Thomas', 'Taylor', 'Moore', 'Jackson', 'Martin']
        
        for i in range(count):
            first_name = random.choice(first_names)
            last_name = random.choice(last_names)
            department = random.choice(list(self.departments.keys()))
            job_title = random.choice(self.departments[department])
            
            user = {
                'id': i + 1,
                'displayName': f'{first_name} {last_name}',
                'givenName': first_name,
                'surname': last_name,
                'userPrincipalName': f'{first_name.lower()}.{last_name.lower()}@contosodivest.onmicrosoft.com',
                'mailNickname': f'{first_name.lower()}.{last_name.lower()}',
                'accountEnabled': True,
                'password': self.generate_strong_password(),
                'department': department,
                'jobTitle': job_title,
                'usageLocation': 'US',
                'employeeId': f'EMP{10000 + i}',
                'createdDate': self.generated_time
            }
            self.users.append(user)
            print(f"✅ Created user: {user['displayName']} - {department}")
        
        print(f"🎉 Successfully generated {len(self.users)} users!")
        return self.users
    
    def export_to_csv(self, filename='divestiture-users.csv'):
        """Export users to CSV for manual review and Azure AD import"""
        filepath = f'../02-Technical-Implementations/Azure-AD-Lab/{filename}'
        
        with open(filepath, 'w', newline='', encoding='utf-8') as csvfile:
            fieldnames = ['id', 'displayName', 'givenName', 'surname', 'userPrincipalName', 
                         'mailNickname', 'department', 'jobTitle', 'password', 'employeeId', 'createdDate']
            writer = csv.DictWriter(csvfile, fieldnames=fieldnames)
            
            writer.writeheader()
            for user in self.users:
                # Don't write password to CSV for security in real scenarios
                user_copy = user.copy()
                if 'password' in user_copy:
                    del user_copy['password']
                writer.writerow(user_copy)
        
        print(f"📁 User data exported to: {filepath}")
        return filepath
    
    def generate_creation_summary(self):
        """Generate a summary report of created users"""
        dept_summary = {}
        for user in self.users:
            dept = user['department']
            if dept not in dept_summary:
                dept_summary[dept] = 0
            dept_summary[dept] += 1
        
        print(f"\n📊 USER GENERATION SUMMARY")
        print(f"Generated: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}")
        print(f"Total Users: {len(self.users)}")
        print("Department Breakdown:")
        for dept, count in dept_summary.items():
            print(f"  - {dept}: {count} users")
        
        return dept_summary

# Demonstration and execution
if __name__ == "__main__":
    print("=" * 60)
    print("🔐 AZURE AD USER MANAGEMENT SCRIPT")
    print("Day 2: Divestiture User Preparation")
    print("=" * 60)
    
    # Initialize manager
    manager = AzureADUserManager()
    
    # Generate sample users
    users = manager.generate_sample_users(15)
    
    # Export to CSV
    csv_file = manager.export_to_csv()
    
    # Generate summary
    summary = manager.generate_creation_summary()
    
    print(f"\n🎯 NEXT STEPS:")
    print(f"1. Open Azure Portal: https://portal.azure.com")
    print(f"2. Navigate to Azure AD > Users")
    print(f"3. Use CSV file to manually create users: {csv_file}")
    print(f"4. Document the process in azure-user-creation.md")
    print("=" * 60)
    
﻿#!/usr/bin/env python3
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
