🚀 Project 1: Hello GitHub Actions (Basics)

📌 Objective

This project introduces GitHub Actions and helps you run your first CI workflow.

By completing this project, you will understand:
	•	What GitHub Actions is
	•	How workflows are triggered
	•	The structure of a workflow (workflow → job → steps)
	•	How GitHub provides runtime information using context variables

⸻

🧠 Prerequisites
	•	A GitHub account
	•	Basic Git knowledge (git add, commit, push)
	•	No CI/CD or YAML experience required

⸻

📁 Project Structure
.
├── README.md
└── .github
    └── workflows
        └── hello-actions.yml

⚠️ Important
GitHub Actions workflows must be placed inside:
.github/workflows/

🔧 Step 1: Create a GitHub Repository
	1.	Create a new GitHub repository
Example name: github-actions-basics
	2.	Add this README.md file
	3.	Commit and push the changes

⸻

🔧 Step 2: Create Your First Workflow

Create a file at:
.github/workflows/hello-actions.yml

Add the following content:
name: Hello GitHub Actions

on:
  push:

jobs:
  hello-job:
    runs-on: ubuntu-latest

    steps:
      - name: Print Hello
        run: echo "Hello from GitHub Actions!"
⸻

🔍 Explanation
Component
      Description
name
      Workflow name shown in GitHub
on: push
      Trigger workflow on every push
jobs
      Defines jobs in the workflow
runs-on
      VM provided by GitHub
steps
      Commands or actions to execute

⸻
▶️ Step 3: Run the Workflow
Commit and push the workflow file:
git add .
git commit -m "Add first GitHub Actions workflow"
git push

👀 Step 4: View Workflow Execution
	1.	Open your GitHub repository
	2.	Click Actions
	3.	Select Hello GitHub Actions
	4.	Open the job and view logs

You should see:
Hello from GitHub Actions!

⸻
🔄 Step 5: Use GitHub Context Variables
Update your workflow to print GitHub metadata:

name: Hello GitHub Actions

on:
  push:

jobs:
  hello-job:
    runs-on: ubuntu-latest

    steps:
      - name: Show GitHub Information
        run: |
          echo "Actor: ${{ github.actor }}"
          echo "Repository: ${{ github.repository }}"
          echo "Branch: ${{ github.ref }}"
          echo "Commit SHA: ${{ github.sha }}"

Commit and push again.

🧠 What You Learned
Variable
      Meaning
github.actor
      User who triggered the workflow
github.repository
      Repository name
github.ref
      Branch or tag
github.sha
      Commit hash

🧪 Practice Exercises
Try the following:
	1.	Add a new step to print the current date:
```
run: date
````

	2.	Intentionally fail the workflow:
```
run: exit 1
```
	3.	Observe how GitHub shows failed jobs
❌ Common Mistakes
Mistake
      Result
Workflow not in .github/workflows
      Workflow will not run
YAML indentation issues
      Workflow fails
Wrong file extension
      Workflow ignored

✅ Project Completion Criteria

✔ Workflow runs on push
✔ Logs visible in GitHub Actions
✔ GitHub context variables printed

⸻
⏭️ What’s Next?

Project 2: Multi-Job Workflow
	•	Sequential jobs
	•	Parallel execution
	•	Job dependencies using needs
⸻
📘 This project is part of the GitHub Actions DevOps Training Series.
⸻