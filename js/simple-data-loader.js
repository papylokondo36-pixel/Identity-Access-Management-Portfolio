// simple-data-loader.js - Working version
document.addEventListener('DOMContentLoaded', function() {
    console.log('Loading portfolio data...');
    
    // Simple data (can be replaced with fetch later)
    const portfolioData = {
        stats: {
            projects: 15,
            experience: 5,
            technologies: 20,
            certifications: 8,
            implementations: 50,
            clients: 25
        },
        skills: [
            { name: "SailPoint", category: "IGA", level: "Expert" },
            { name: "Okta", category: "SSO", level: "Expert" },
            { name: "Azure AD", category: "Cloud IAM", level: "Expert" },
            { name: "AWS IAM", category: "Cloud Security", level: "Advanced" },
            { name: "OAuth 2.0", category: "API Security", level: "Expert" },
            { name: "SAML 2.0", category: "Federation", level: "Expert" },
            { name: "RBAC/ABAC", category: "Access Control", level: "Expert" },
            { name: "MFA/Passwordless", category: "Authentication", level: "Expert" }
        ],
        projects: [
            {
                title: "Enterprise SSO Migration",
                client: "Fortune 500 Bank",
                description: "Migrated 15,000+ users to modern SSO with adaptive MFA",
                technologies: ["Okta", "SAML 2.0", "Azure AD", "MFA"],
                outcome: "Reduced authentication tickets by 85%"
            },
            {
                title: "Cloud IAM Governance",
                client: "Global Tech Company", 
                description: "Centralized IAM governance across AWS, Azure, and GCP",
                technologies: ["AWS IAM", "Azure RBAC", "Terraform", "Python"],
                outcome: "Reduced excessive permissions by 60%"
            }
        ]
    };
    
    // Update stats
    const statsContainer = document.getElementById('stats-container');
    if (statsContainer) {
        const stats = portfolioData.stats;
        statsContainer.innerHTML = \
            <div class="stats-grid">
                <div class="stat-item">
                    <div class="stat-number">\+</div>
                    <div class="stat-label">IAM Projects</div>
                </div>
                <div class="stat-item">
                    <div class="stat-number">\+</div>
                    <div class="stat-label">Years Experience</div>
                </div>
                <div class="stat-item">
                    <div class="stat-number">\+</div>
                    <div class="stat-label">Technologies</div>
                </div>
                <div class="stat-item">
                    <div class="stat-number">\+</div>
                    <div class="stat-label">Certifications</div>
                </div>
            </div>
        \;
    }
    
    // Update skills
    const skillsContainer = document.getElementById('skills-container');
    if (skillsContainer) {
        let skillsHTML = '<div class="skills-list">';
        portfolioData.skills.forEach(skill => {
            skillsHTML += \
                <span class="skill-tag">
                    <i class="fas fa-check"></i> \
                    <span class="skill-level" style="font-size: 0.8em; margin-left: 5px; color: #10b981;">
                        (\)
                    </span>
                </span>
            \;
        });
        skillsHTML += '</div>';
        skillsContainer.innerHTML = skillsHTML;
    }
    
    // Update projects
    const projectsContainer = document.getElementById('projects-container');
    if (projectsContainer) {
        let projectsHTML = '';
        portfolioData.projects.forEach(project => {
            const techTags = project.technologies.map(tech => \<span class="tech-tag">\</span>\).join('');
            
            projectsHTML += \
                <div class="project-item">
                    <h3>\ - \</h3>
                    <p>\</p>
                    <div class="project-tech">\</div>
                    <p><strong>Outcome:</strong> \</p>
                </div>
            \;
        });
        projectsContainer.innerHTML = projectsHTML;
    }
    
    console.log('Portfolio data loaded successfully!');
});
