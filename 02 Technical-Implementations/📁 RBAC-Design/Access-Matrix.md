# RBAC Access Matrix - Divestiture Scenario

## Application Access Matrix:

### Microsoft 365 Applications:
| Business Role | Exchange Online | SharePoint | Teams | Azure AD | Security Center |
|---------------|----------------|------------|-------|----------|----------------|
| IT-Administrator | Full Access | Full Access | Full Access | Global Admin | Security Admin |
| IT-Support | Limited Admin | Limited Admin | Limited Admin | Helpdesk Admin | Reader |
| Finance-Manager | Full Mailbox | Contribute | Owner | User Admin | Reader |
| Finance-Analyst | Read Only | Read Only | Member | User | Reader |
| HR-Manager | Full Mailbox | Contribute | Owner | User Admin | Reader |
| HR-Specialist | Read Only | Read Only | Member | User | Reader |

### Financial Systems:
| Business Role | ERP System | CRM | Payroll | Expenses | Reporting |
|---------------|------------|-----|---------|----------|----------|
| IT-Administrator | Admin | Admin | Admin | Admin | Admin |
| IT-Support | Read Only | Read Only | No Access | No Access | Read Only |
| Finance-Manager | Full Access | Full Access | Approver | Approver | Full Access |
| Finance-Analyst | Read/Write | Read/Write | Read Only | Read Only | Read/Write |
| HR-Manager | Read Only | Read Only | Admin | Admin | Read Only |
| HR-Specialist | Read Only | Read Only | Read/Write | Read/Write | Read Only |

### HR Systems:
| Business Role | HRIS | Recruitment | Learning | Performance | Analytics |
|---------------|------|-------------|----------|------------|----------|
| IT-Administrator | Admin | Admin | Admin | Admin | Admin |
| IT-Support | Read Only | Read Only | Read Only | Read Only | Read Only |
| Finance-Manager | No Access | No Access | No Access | No Access | No Access |
| Finance-Analyst | No Access | No Access | No Access | No Access | No Access |
| HR-Manager | Full Access | Full Access | Full Access | Full Access | Full Access |
| HR-Specialist | Read/Write | Read/Write | Read/Write | Read/Write | Read Only |

## Data Classification & Access:

### Confidential Data:
- Employee personal information
- Financial reports
- Executive communications
- Security configurations

### Restricted Access Rules:
- HR data: HR roles only
- Financial data: Finance roles only
- IT configurations: IT roles only
- Cross-department access: Manager approval required

## Emergency Access Procedures:
- Break-glass accounts for critical outages
- Time-limited elevated permissions
- Audit logging for all emergency access
- Post-access review and justification
