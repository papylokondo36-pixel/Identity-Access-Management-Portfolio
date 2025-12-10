// portfolio-data-loader.js
class PortfolioDataLoader {
    constructor() {
        this.data = null;
        this.baseURL = window.location.origin;
    }

    async loadData() {
        try {
            const response = await fetch('data/portfolio.json');
            if (!response.ok) {
                throw new Error('Failed to load portfolio data');
            }
            this.data = await response.json();
            console.log('Portfolio data loaded successfully:', this.data);
            return this.data;
        } catch (error) {
            console.error('Error loading portfolio data:', error);
            // Fallback to embedded data
            this.loadFallbackData();
            return this.data;
        }
    }

    loadFallbackData() {
        this.data = {
            personal: {
                name: "IAM Security Specialist",
                title: "Senior Identity & Access Management Expert",
                email: "contact@example.com"
            },
            stats: {
                projects: 12,
                experience: 5,
                technologies: 15,
                certifications: 8
            }
        };
    }

    // Render methods
    renderStats() {
        if (!this.data || !this.data.stats) return;
        
        const stats = this.data.stats;
        const statsContainer = document.getElementById('stats-container');
        if (!statsContainer) return;

        const statsHTML = \
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
        
        statsContainer.innerHTML = statsHTML;
    }

    renderSkills() {
        if (!this.data || !this.data.skills) return;
        
        const skills = this.data.skills;
        const skillsContainer = document.getElementById('skills-container');
        if (!skillsContainer) return;

        let skillsHTML = '<div class="skills-grid">';
        skills.forEach(skill => {
            skillsHTML += \
                <div class="skill-item">
                    <i class="fas \"></i>
                    <div>
                        <strong>\</strong>
                        <div class="skill-meta">
                            <span class="skill-category">\</span>
                            <span class="skill-level \">\</span>
                        </div>
                    </div>
                </div>
            \;
        });
        skillsHTML += '</div>';
        
        skillsContainer.innerHTML = skillsHTML;
    }

    renderProjects() {
        if (!this.data || !this.data.projects) return;
        
        const projects = this.data.projects;
        const projectsContainer = document.getElementById('projects-container');
        if (!projectsContainer) return;

        let projectsHTML = '<div class="projects-grid">';
        projects.forEach(project => {
            const techTags = project.technologies.map(tech => \<span class="tech-tag">\</span>\).join('');
            
            projectsHTML += \
                <div class="project-card">
                    <div class="project-header">
                        <h3>\</h3>
                        <span class="project-client">\</span>
                    </div>
                    <div class="project-body">
                        <p>\</p>
                        <div class="project-tech">
                            \
                        </div>
                        <div class="project-outcome">
                            <strong>Outcome:</strong> \
                        </div>
                        <div class="project-meta">
                            <span><i class="fas fa-calendar"></i> \</span>
                            <span><i class="fas fa-user-tie"></i> \</span>
                        </div>
                    </div>
                </div>
            \;
        });
        projectsHTML += '</div>';
        
        projectsContainer.innerHTML = projectsHTML;
    }

    renderCertifications() {
        if (!this.data || !this.data.certifications) return;
        
        const certs = this.data.certifications;
        const certsContainer = document.getElementById('certifications-container');
        if (!certsContainer) return;

        let certsHTML = '<div class="certifications-list">';
        certs.forEach(cert => {
            certsHTML += \
                <div class="cert-item">
                    <i class="fas fa-certificate"></i>
                    <div>
                        <strong>\</strong>
                        <div>\</div>
                        <div class="cert-meta">
                            <span>\</span>
                            <span>\</span>
                        </div>
                    </div>
                </div>
            \;
        });
        certsHTML += '</div>';
        
        certsContainer.innerHTML = certsHTML;
    }

    // Initialize everything
    async init() {
        await this.loadData();
        this.renderStats();
        this.renderSkills();
        this.renderProjects();
        this.renderCertifications();
        
        // Update personal info if available
        if (this.data.personal) {
            const nameElement = document.getElementById('personal-name');
            const titleElement = document.getElementById('personal-title');
            
            if (nameElement && this.data.personal.name) {
                nameElement.textContent = this.data.personal.name;
            }
            if (titleElement && this.data.personal.title) {
                titleElement.textContent = this.data.personal.title;
            }
        }
    }
}

// Initialize when DOM is loaded
document.addEventListener('DOMContentLoaded', () => {
    const portfolioLoader = new PortfolioDataLoader();
    portfolioLoader.init();
});
