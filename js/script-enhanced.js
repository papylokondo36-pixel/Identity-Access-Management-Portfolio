// Identity & Access Management Portfolio - JavaScript

// DOM Content Loaded
document.addEventListener('DOMContentLoaded', function() {
    console.log('IAM Portfolio loaded');
    initializeApp();
});

// Initialize application
function initializeApp() {
    // Set current year in footer
    const year = new Date().getFullYear();
    const footer = document.querySelector('.footer');
    if (footer) {
        const yearElement = document.createElement('p');
        yearElement.textContent = ©  IAM Portfolio Project;
        footer.appendChild(yearElement);
    }
    
    // Add active state to navigation
    const navLinks = document.querySelectorAll('.nav-menu a');
    navLinks.forEach(link => {
        link.addEventListener('click', function(e) {
            navLinks.forEach(l => l.classList.remove('active'));
            this.classList.add('active');
        });
    });
    
    // Initial API call for demo data
    setTimeout(() => {
        fetchIAMData();
    }, 1000);
}

// Show concept details
function showConceptDetails(concept) {
    const concepts = {
        'authentication': {
            title: 'Authentication',
            description: 'The process of verifying the identity of a user, device, or system.',
            details: 'Authentication ensures that users are who they claim to be. Common methods include passwords, biometrics, security tokens, and multi-factor authentication (MFA).'
        },
        'authorization': {
            title: 'Authorization',
            description: 'The process of determining what permissions an authenticated user has.',
            details: 'Authorization controls access to resources. Common models include Role-Based Access Control (RBAC), Attribute-Based Access Control (ABAC), and Policy-Based Access Control (PBAC).'
        },
        'directory': {
            title: 'Directory Services',
            description: 'Centralized repositories for storing and managing identity information.',
            details: 'Directory services like LDAP, Active Directory, and Azure AD provide a structured way to store user identities, groups, and access policies.'
        }
    };
    
    const conceptData = concepts[concept];
    if (conceptData) {
        alert(${conceptData.title}\n\n\n\n);
    }
}

// Fetch IAM data from mock API
async function fetchIAMData() {
    const apiResults = document.getElementById('api-results');
    if (!apiResults) return;
    
    // Show loading state
    apiResults.innerHTML = '<p><i class="fas fa-spinner fa-spin"></i> Loading IAM data...</p>';
    
    try {
        // Mock API endpoint - in real scenario, replace with actual API
        const mockData = {
            technologies: [
                { name: 'Azure Active Directory', category: 'Cloud IAM', vendor: 'Microsoft' },
                { name: 'AWS IAM', category: 'Cloud IAM', vendor: 'Amazon' },
                { name: 'Okta', category: 'Identity Provider', vendor: 'Okta' },
                { name: 'Keycloak', category: 'Open Source', vendor: 'Red Hat' }
            ],
            stats: {
                users: 1250,
                groups: 85,
                policies: 42,
                lastAudit: '2024-01-15'
            }
        };
        
        // Simulate API delay
        await new Promise(resolve => setTimeout(resolve, 1000));
        
        // Display results
        let html = 
            <h3><i class="fas fa-database"></i> IAM Data Loaded Successfully</h3>
            <div class="data-grid">
                <div class="data-card">
                    <h4>IAM Technologies</h4>
                    <ul>
        ;
        
        mockData.technologies.forEach(tech => {
            html += <li><strong></strong> -  ()</li>;
        });
        
        html += 
                    </ul>
                </div>
                <div class="data-card">
                    <h4>IAM Statistics</h4>
                    <p><i class="fas fa-users"></i> Users: </p>
                    <p><i class="fas fa-user-friends"></i> Groups: </p>
                    <p><i class="fas fa-file-contract"></i> Policies: </p>
                    <p><i class="fas fa-calendar-check"></i> Last Audit: </p>
                </div>
            </div>
        ;
        
        apiResults.innerHTML = html;
        
        // Add some styling for the data
        const style = document.createElement('style');
        style.textContent = 
            .data-grid {
                display: grid;
                grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
                gap: 1.5rem;
                margin-top: 1rem;
            }
            .data-card {
                background: white;
                padding: 1.5rem;
                border-radius: 8px;
                box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            }
            .data-card h4 {
                color: #2c3e50;
                margin-bottom: 1rem;
                border-bottom: 2px solid #3498db;
                padding-bottom: 0.5rem;
            }
            .data-card ul {
                list-style: none;
                padding: 0;
            }
            .data-card li {
                padding: 0.5rem 0;
                border-bottom: 1px solid #eee;
            }
            .data-card li:last-child {
                border-bottom: none;
            }
            .data-card p {
                margin: 0.5rem 0;
                display: flex;
                align-items: center;
                gap: 8px;
            }
        ;
        document.head.appendChild(style);
        
    } catch (error) {
        // Error handling
        apiResults.innerHTML = 
            <div class="error-message">
                <i class="fas fa-exclamation-triangle"></i>
                <h3>Error Loading Data</h3>
                <p></p>
                <button onclick="fetchIAMData()" class="btn-primary">
                    <i class="fas fa-redo"></i> Try Again
                </button>
            </div>
        ;
        console.error('API Error:', error);
    }
}

// Smooth scrolling for navigation links
document.querySelectorAll('a[href^="#"]').forEach(anchor => {
    anchor.addEventListener('click', function(e) {
        e.preventDefault();
        const targetId = this.getAttribute('href');
        if (targetId === '#') return;
        
        const targetElement = document.querySelector(targetId);
        if (targetElement) {
            window.scrollTo({
                top: targetElement.offsetTop - 80,
                behavior: 'smooth'
            });
        }
    });
});

// Add performance monitoring
function logPerformance() {
    if ('performance' in window) {
        const perfData = window.performance.timing;
        const loadTime = perfData.loadEventEnd - perfData.navigationStart;
        console.log(Page loaded in ms);
        
        // Report to console (in real app, send to analytics)
        if (loadTime > 3000) {
            console.warn('Page load time exceeds 3 seconds - consider optimization');
        }
    }
}

// Call performance logging
window.addEventListener('load', logPerformance);

// Keyboard shortcuts
document.addEventListener('keydown', function(e) {
    // Alt + 1 for Dashboard
    if (e.altKey && e.key === '1') {
        document.querySelector('a[href="#dashboard"]').click();
    }
    // Alt + 2 for Concepts
    if (e.altKey && e.key === '2') {
        document.querySelector('a[href="#concepts"]').click();
    }
});

