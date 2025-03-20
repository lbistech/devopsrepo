# 🚀 2-Tier Application on Amazon EKS

This project deploys a **2-tier web application** on **Amazon EKS** with:
- **Frontend:** Nginx serving a simple PHP application.
- **Database:** MySQL running as a StatefulSet.

## **📂 Project Structure**
```
2-tier-app/
│── kubernetes/
│   ├── mysql/
│   │   ├── mysql-deployment.yaml
│   │   ├── mysql-service.yaml
│   │   ├── mysql-secret.yaml
│   │   ├── mysql-init-configmap.yaml
│   ├── php-app/
│   │   ├── php-app.yaml
│── php-app/
│   ├── index.php
│   ├── Dockerfile
│── README.md
```

---

## **🚀 Deployment Steps**

### **1️⃣ Prerequisites**
- AWS EKS Cluster is **running**.
- `kubectl` and `AWS CLI` installed.
- `docker` installed for building images.

### **2️⃣ Deploy MySQL**
```bash
kubectl apply -f kubernetes/mysql/mysql-secret.yaml
kubectl apply -f kubernetes/mysql/mysql-init-configmap.yaml
kubectl apply -f kubernetes/mysql/mysql-deployment.yaml
kubectl apply -f kubernetes/mysql/mysql-service.yaml
```

### **3️⃣ Build & Push PHP App**
```bash
cd php-app
docker build -t your-dockerhub-username/php-mysql-app .
docker push your-dockerhub-username/php-mysql-app
```

### **4️⃣ Deploy PHP Application**
```bash
kubectl apply -f kubernetes/php-app/php-app.yaml
```

### **5️⃣ Verify Deployment**
```bash
kubectl get pods -n two-tier-app
kubectl get svc -n two-tier-app
```
- **Access the application:**  
  ```bash
  http://<nginx-loadbalancer-url>
  ```
- Check **MySQL logs**:
  ```bash
  kubectl logs -n two-tier-app -l app=mysql
  ```

---

## **🛠 Troubleshooting**
✅ **Check logs of failing pods**
```bash
kubectl logs -n two-tier-app -l app=php-app
```
✅ **Test MySQL connectivity**
```bash
kubectl exec -it <mysql-pod-name> -n two-tier-app -- mysql -u root -p
```

---

# 🎉 **Congratulations!**
Your **2-tier application is now running on AWS EKS**! 🚀
