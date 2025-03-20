# 🚀 3-Tier Application on Amazon EKS

This project deploys a **3-tier web application** on **Amazon EKS** using Kubernetes. It consists of:
- **Frontend (React/Nginx):** A simple UI connecting to the backend.
- **Backend (Node.js Express API):** Serves data from MySQL.
- **Database (MySQL):** Stores application data.

## **📂 Project Structure**
```
3-tier-app/
│── kubernetes/
│   ├── mysql/
│   │   ├── mysql-deployment.yaml
│   │   ├── mysql-service.yaml
│   │   ├── mysql-secret.yaml
│   │   ├── mysql-init-configmap.yaml
│   ├── backend/
│   │   ├── backend-deployment.yaml
│   │   ├── backend-service.yaml
│   ├── frontend/
│   │   ├── frontend-deployment.yaml
│   │   ├── frontend-service.yaml
│   │   ├── frontend-ingress.yaml
│── backend/
│   ├── server.js
│   ├── package.json
│   ├── Dockerfile
│── frontend/
│   ├── index.html
│   ├── Dockerfile
│── README.md
```

---

## **🚀 Deployment Steps**

### **1️⃣ Prerequisites**
- AWS EKS Cluster is **running**.
- `kubectl` and `AWS CLI` installed.
- `docker` installed for building images.

---

### **2️⃣ Deploy MySQL**
```bash
kubectl apply -f kubernetes/mysql/mysql-secret.yaml
kubectl apply -f kubernetes/mysql/mysql-init-configmap.yaml
kubectl apply -f kubernetes/mysql/mysql-deployment.yaml
kubectl apply -f kubernetes/mysql/mysql-service.yaml
```

### **3️⃣ Build & Push Backend**
```bash
cd backend
docker build --platform=linux/amd64 -t lbistech/3-tier-backend-app:latest . --no-cache
docker push your-dockerhub-username/backend-app
```

### **4️⃣ Deploy Backend**
```bash
kubectl apply -f kubernetes/backend/backend-deployment.yaml
kubectl apply -f kubernetes/backend/backend-service.yaml
```

### **5️⃣ Build & Push Frontend**
```bash
cd frontend
docker build --platform=linux/amd64 -t lbistech/3-tier-frontend-app:latest . --no-cache
docker push your-dockerhub-username/frontend-app
```

### **6️⃣ Deploy Frontend**
```bash
kubectl apply -f kubernetes/frontend/frontend-deployment.yaml
kubectl apply -f kubernetes/frontend/frontend-service.yaml
kubectl apply -f kubernetes/frontend/frontend-ingress.yaml
```

---

## **7️⃣ Verify Deployments**
```bash
kubectl get pods -n three-tier-app
kubectl get svc -n three-tier-app
kubectl get ingress -n three-tier-app
```

- **Access Frontend (React) via ALB:**
  ```bash
  http://<alb-dns-name>
  ```
- **Test Backend API manually:**
  ```bash
  curl -X GET http://backend-service:3000/users
  ```

---

## **🛠 Troubleshooting**
✅ **Check failing pods:**
```bash
kubectl logs -n three-tier-app -l app=backend
```
✅ **Test MySQL connectivity:**
```bash
kubectl exec -it <mysql-pod-name> -n three-tier-app -- mysql -u root -p
```

---

# 🎉 **Congratulations!**
Your **3-tier application is now running on AWS EKS**! 🚀


