🚀 Project 3: Node.js CI Pipeline with GitHub Actions

📌 Objective

This project introduces a real Continuous Integration (CI) pipeline for a Node.js application using GitHub Actions.

By completing this project, you will learn:
	•	How CI pipelines work in real projects
	•	How to set up Node.js in GitHub Actions
	•	How to install dependencies and run tests
	•	How pipelines fail when tests fail
	•	How to run workflows on Pull Requests

⸻

🧠 Prerequisites
	•	Completion of Project 1 and Project 2
	•	Basic knowledge of:
	•	Node.js
	•	npm install
	•	npm test
	•	Git & GitHub basics

⸻

📁 Project Structure
.
├── README.md
├── package.json
├── index.js
├── test
│   └── sample.test.js
└── .github
    └── workflows
        └── node-ci.yml

⸻
🔧 Step 1: Create a Simple Node.js App

Initialize Node.js project:
npm init -y
⸻
Install Jest:
npm install --save-dev jest
⸻
Update package.json:
{
  "scripts": {
    "test": "jest"
  }
}
⸻
🔧 Step 2: Create Application Code

Create index.js:
function add(a, b) {
  return a + b;
}

module.exports = add;
⸻
🔧 Step 3: Create Test Case

Create test/sample.test.js:

const add = require('../index');

test('adds two numbers correctly', () => {
  expect(add(2, 3)).toBe(5);
});

🔧 Step 4: Create CI Workflow

Create the workflow file:
.github/workflows/node-ci.yml

Add the following:
name: Node.js CI Pipeline

on:
  pull_request:
  push:

jobs:
  test:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout code
        uses: actions/checkout@v4

      - name: Setup Node.js
        uses: actions/setup-node@v4
        with:
          node-version: 18

      - name: Install dependencies
        run: npm install

      - name: Run tests
        run: npm test

▶️ Step 5: Trigger the Pipeline
	1.	Commit and push code
	2.	Create a Pull Request
	3.	Observe:
	•	CI runs automatically
	•	Tests must pass before merge

❌ Step 6: Test Failure Scenario

Modify test to fail:
expect(add(2, 3)).toBe(6);

Observe:
	•	CI fails
	•	PR shows ❌
	•	Merge blocked

📌 Real-World Analogy
This is how teams protect production systems.

