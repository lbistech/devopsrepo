# MySQL Database Initialization - Deployment Instructions

## Problem Solved
The MySQL database was not initialized with the `appdb` database and `users` table with dummy data. This has been fixed by adding an initialization script.

## Changes Made

1. **Created `init.sql`** - SQL script to create database and populate with dummy user data
2. **Created `mysql-configmap.yaml`** - ConfigMap containing the initialization script
3. **Updated `mysql-deployment.yaml`** - Added volume mount for the init script

## Deployment Steps

### Option 1: Fresh Deployment (Recommended)

If you want to start fresh with the initialized database:

```bash
# 1. Delete the existing MySQL StatefulSet and PVC
kubectl delete statefulset mysql -n three-tier-app
kubectl delete pvc mysql-pvc -n three-tier-app

# 2. Apply the ConfigMap
kubectl apply -f mysql-configmap.yaml

# 3. Redeploy MySQL with the updated deployment
kubectl apply -f mysql-deployment.yaml
kubectl apply -f mysql-pvc.yaml
kubectl apply -f mysql-service.yaml
kubectl apply -f mysql-secret.yaml

# 4. Wait for MySQL to be ready
kubectl wait --for=condition=ready pod -l app=mysql -n three-tier-app --timeout=120s

# 5. Restart backend pods to establish fresh connections
kubectl rollout restart deployment backend -n three-tier-app
```

### Option 2: Manual Database Initialization (If you want to keep existing data)

If you don't want to delete the PVC:

```bash
# 1. Apply the ConfigMap
kubectl apply -f mysql-configmap.yaml

# 2. Get the MySQL pod name
kubectl get pods -n three-tier-app | grep mysql

# 3. Copy and execute the init script manually
kubectl exec -it mysql-0 -n three-tier-app -- mysql -u root -ppassword < init.sql

# Or execute directly:
kubectl exec -it mysql-0 -n three-tier-app -- mysql -u root -ppassword -e "
CREATE DATABASE IF NOT EXISTS appdb;
USE appdb;
CREATE TABLE IF NOT EXISTS users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  email VARCHAR(100) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO users (name, email) VALUES
  ('Alice Johnson', 'alice.johnson@example.com'),
  ('Bob Smith', 'bob.smith@example.com'),
  ('Charlie Brown', 'charlie.brown@example.com'),
  ('Diana Prince', 'diana.prince@example.com'),
  ('Edward Norton', 'edward.norton@example.com');
"
```

## Verification Steps

### 1. Check if database and table were created:

```bash
kubectl exec -it mysql-0 -n three-tier-app -- mysql -u root -ppassword -e "SHOW DATABASES;"
kubectl exec -it mysql-0 -n three-tier-app -- mysql -u root -ppassword appdb -e "SHOW TABLES;"
kubectl exec -it mysql-0 -n three-tier-app -- mysql -u root -ppassword appdb -e "SELECT * FROM users;"
```

### 2. Check backend logs:

```bash
kubectl logs -f deployment/backend -n three-tier-app
```

You should see: `Connected to MySQL`

### 3. Test the application:

Access your frontend and verify that the users list is displayed.

## Dummy Data

The initialization script includes 10 dummy users:
- Alice Johnson
- Bob Smith
- Charlie Brown
- Diana Prince
- Edward Norton
- Fiona Apple
- George Wilson
- Hannah Montana
- Ian McKellen
- Julia Roberts

## Troubleshooting

### Backend can't connect to database:
```bash
# Check backend environment variables
kubectl exec -it deployment/backend -n three-tier-app -- env | grep DB_

# Check if MySQL service is reachable
kubectl exec -it deployment/backend -n three-tier-app -- ping mysql
```

### Database not initialized:
```bash
# Check MySQL logs
kubectl logs mysql-0 -n three-tier-app

# Check if init script was mounted
kubectl exec -it mysql-0 -n three-tier-app -- ls -la /docker-entrypoint-initdb.d/
```

### Frontend not showing data:
- Check browser console for errors
- Verify backend service is accessible
- Check backend logs for database connection errors
