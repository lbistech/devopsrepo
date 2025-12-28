🚀 GitHub Actions DevOps Training – Monorepo

Ref Github Repository: https://github.com/engr-usman/devops-cicd-b9-repo.git

📌 Overview

This repository is a hands-on DevOps training monorepo designed to teach GitHub Actions from beginner to intermediate level, progressing into real-world CI/CD pipelines using Docker and AWS.

All projects are organized in a single repository to reflect modern DevOps monorepo practices.

⸻

🎯 Training Goals

By completing all projects in this repository, students will learn how to:
	•	Build CI pipelines using GitHub Actions
	•	Write multi-job workflows
	•	Run automated tests for Python & Node.js applications
	•	Build Docker images in CI
	•	Push images to Docker Hub and Amazon ECR
	•	Deploy applications to EC2 and EKS
	•	Implement environment-based deployments with approvals

⸻

🧱 Repository Structure
.
├── README.md
├── .gitignore
├── .github
│   └── workflows
│       ├── hello-actions.yml
│       ├── multi-job-workflow.yml
│       ├── node-ci.yml
│       ├── python-ci.yml
│       ├── docker-build.yml
│       ├── docker-push.yml
│       ├── ecr-push.yml
│       ├── deploy-ec2.yml
│       ├── deploy-eks.yml
│       └── multi-env-deploy.yml
│
├── project-03-node-ci
│   ├── package.json
│   ├── index.js
│   └── test/
│
├── project-04-python-ci
│   ├── app.py
│   ├── test_app.py
│   └── requirements.txt
│
├── docker-python-app-code
│   ├── Dockerfile
│   ├── app.py
│   └── requirements.txt
│
└── k8s
    └── deployment.yaml

📌 Note
All workflows are stored under .github/workflows/, while application code is organized by project.

⸻

📘 Project Roadmap

🟢 Level 1: GitHub Actions Basics
Project.     Description
Project 1.   Hello GitHub Actions
Project 2.   Multi-job workflows (parallel & sequential)

🟡 Level 2: CI Fundamentals
Project.     Description
Project 3.   Node.js CI pipeline
Project 4.   Python CI with linting (flake8 + black)

🟠 Level 3: Docker + CI
Project.     Description
Project 5.   Build Docker image using GitHub Actions
Project 6.   Push Docker image to Docker Hub
Project 7.   Push Docker image to Amazon ECR

🔵 Level 4: Deployment
Project.     Description
Project 8.   Deploy Docker container to EC2 via SSH
Project 9.   Deploy application to Amazon EKS
Project 10.  Dev / Staging / Prod deployments with approvals

⚙️ How to Use This Repository (Students)
	1.	Clone the repository
	2.	Navigate to the relevant project folder
	3.	Follow the project’s instructions
	4.	Trigger workflows via:
	•	git push
	•	Pull Requests
	•	workflow_dispatch (manual runs)
	5.	Observe logs in the Actions tab

⸻

🔐 Secrets & Credentials

This repository does not store secrets.

All sensitive values must be configured in:
GitHub → Settings → Secrets and variables → Actions

Examples:
	•	Docker Hub credentials
	•	AWS credentials
	•	EC2 SSH keys
	•	ECR repository details

⸻

🛡️ Security & Best Practices
	•	.gitignore is configured to prevent secrets and build artifacts
	•	IAM roles are used instead of hardcoded credentials
	•	Least-privilege access is enforced for AWS resources
	•	Production deployments require manual approval

⸻

🎓 Instructor Notes

This repository is designed to:
	•	Mimic real DevOps workflows
	•	Encourage debugging and troubleshooting
	•	Prepare students for real interviews
	•	Demonstrate industry-standard CI/CD practices

⸻

🏁 Completion Outcome

After completing all projects, students will be able to:
	•	Design CI/CD pipelines independently
	•	Debug GitHub Actions failures
	•	Deploy containerized applications to AWS
	•	Apply DevOps best practices confidently

⸻

🚀 Next Enhancements (Optional)
	•	Terraform CI pipelines
	•	Reusable workflows
	•	GitHub Actions matrix builds
	•	Security scanning
	•	Capstone end-to-end pipeline