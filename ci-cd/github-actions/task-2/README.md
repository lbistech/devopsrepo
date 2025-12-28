🚀 Project 2: Multi-Job GitHub Actions Workflow

📌 Objective

This project builds on Project 1 and introduces multiple jobs in a GitHub Actions workflow.

By completing this project, you will learn:
	•	How to define multiple jobs in a workflow
	•	How jobs run in parallel
	•	How to enforce job order using needs
	•	How pipeline failures affect dependent jobs

⸻

🧠 Prerequisites
	•	Completion of Project 1
	•	Basic understanding of:
	•	Workflow
	•	Job
	•	Step
	•	GitHub Actions UI

⸻

📁 Project Structure
.
├── README.md
└── .github
    └── workflows
        └── multi-job-workflow.yml

🔧 Step 1: Create the Workflow File

Create a new workflow file:
.github/workflows/multi-job-workflow.yml

🔧 Step 2: Define Multiple Jobs (Parallel Execution)

Add the following content:

name: Multi Job Workflow Demo

on:
  push:

jobs:
  job-one:
    runs-on: ubuntu-latest
    steps:
      - name: Job One Step
        run: echo "This is Job One"

  job-two:
    runs-on: ubuntu-latest
    steps:
      - name: Job Two Step
        run: echo "This is Job Two"

🔍 Explanation (Important Concept)
	•	job-one and job-two are independent
	•	GitHub Actions runs them in parallel
	•	Each job gets its own runner

📌 Teaching Point

Parallel execution reduces pipeline time.

⸻

▶️ Step 3: Commit and Run
git add .
git commit -m "Add multi-job workflow"
git push

Go to Actions → Multi Job Workflow Demo and observe:
	•	Both jobs start at the same time

⸻

🔄 Step 4: Add Job Dependencies (Sequential Execution)

Now update the workflow to make job-two wait for job-one.
name: Multi Job Workflow Demo

on:
  push:

jobs:
  job-one:
    runs-on: ubuntu-latest
    steps:
      - name: Job One Step
        run: echo "This is Job One"

  job-two:
    needs: job-one
    runs-on: ubuntu-latest
    steps:
      - name: Job Two Step
        run: echo "This is Job Two and runs after Job One"