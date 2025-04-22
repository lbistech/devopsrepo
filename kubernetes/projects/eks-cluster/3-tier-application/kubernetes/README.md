# Backend Autoscaling Demonstration – HPA & VPA on Kubernetes

This project demonstrates the setup and testing of **Horizontal Pod Autoscaler (HPA)** and **Vertical Pod Autoscaler (VPA)** for the `backend` service in a 3-tier application deployed on Amazon EKS.

---
## 📦 Components
- **Backend Application**: Node.js app connected to a MariaDB database
- **HPA**: Scales pods horizontally based on CPU utilization
- **VPA**: Dynamically adjusts CPU/memory resource requests based on actual usage

---
## 📁 Directory Structure
kubernetes/ └── backend/ ├── backend-deployment.yaml ├── backend-service.yaml ├── backend-vpa.yaml └── hpa.yaml (optional)

---
## ⚙️ Prerequisites
- An existing EKS cluster
- Metrics Server installed and working
- VPA components installed:
  - `vpa-admission-controller`
  - `vpa-recommender`
  - `vpa-updater`

To verify:
```bash
kubectl get deployment -n kube-system | grep vpa
kubectl top pods
```

## Installation of CRD for the Vertical Pod Autoscaler (VPA):
```bash
git clone https://github.com/kubernetes/autoscaler.git
cd autoscaler/vertical-pod-autoscaler/

chmod +x hack/vpa-up.sh
./hack/vpa-up.sh
```
- ** Now you will be able to execute the "backend-vpa.yaml" manifest

🚀 Setup Instructions
1. Deploy the Backend with Resource Requests

Ensure backend-deployment.yaml includes CPU and memory requests:
```bash
resources:
  requests:
    cpu: "50m"
    memory: "128Mi"
  limits:
    cpu: "500m"
    memory: "256Mi"
```

Apply the deployment:
```kubectl apply -f backend/backend-deployment.yaml```

2. Apply the Vertical Pod Autoscaler (VPA)
```bash
apiVersion: autoscaling.k8s.io/v1
kind: VerticalPodAutoscaler
metadata:
  name: backend-vpa
  namespace: three-tier-app
spec:
  targetRef:
    apiVersion: "apps/v1"
    kind: Deployment
    name: backend
  updatePolicy:
    updateMode: "Auto"
```

Apply it:
```kubectl apply -f backend/backend-vpa.yaml```

🔄 Load Generation for Testing
Run a BusyBox pod to generate constant load:
```bash
kubectl run -it --rm load-generator -n three-tier-app \
  --image=busybox --restart=Never -- /bin/sh
```

Inside the pod:
```while true; do wget -q -O- http://backend-service:3000/users; done```

🔍 Monitoring
Monitor Pod Metrics:
```kubectl top pods -n three-tier-app```

Monitor VPA Recommendations:
```kubectl describe vpa backend-vpa -n three-tier-app```

📊 Horizontal Pod Autoscaler (HPA)
Apply the HPA Resource:
```bash
apiVersion: autoscaling/v2
kind: HorizontalPodAutoscaler
metadata:
  name: backend-hpa
  namespace: three-tier-app
spec:
  scaleTargetRef:
    apiVersion: apps/v1
    kind: Deployment
    name: backend
  minReplicas: 2
  maxReplicas: 5
  metrics:
    - type: Resource
      resource:
        name: cpu
        target:
          type: Utilization
          averageUtilization: 50
```
Apply it:
```kubectl apply -f backend/backend-hpa.yaml```

Monitor HPA:
```kubectl get hpa -n three-tier-app -w```

Expected output:
```bash
NAME        REFERENCE           TARGETS    MINPODS   MAXPODS   REPLICAS   AGE
backend-hpa Deployment/backend  65%/50%    2         5         3          3m
```
HPA evaluates every 15 seconds and scales in only after sustained low usage for 5 minutes.

🔄 Load Generation for Testing HPA:
Run a BusyBox pod to simulate load:
```bash
kubectl run -it --rm load-generator -n three-tier-app \
  --image=busybox --restart=Never -- /bin/sh
```

Inside the pod:
```while true; do wget -q -O- http://backend-service:3000/users; done```
Keep it running for at least 5–10 minutes to observe autoscaling.

✅ Expected Behavior VPA
    - HPA increases pod replicas when CPU usage > 50%
    - VPA evicts pods and reassigns CPU/memory requests based on observed usage
    - New pods reflect VPA’s recommended resources

✅ Expected Behavior HPA
    - CPU > 50% avg - HPA increases pod replicas (scale out)
    - CPU < 50% for ~5 minutes - HPA reduces pod replicas (scale in)
    - Sustained usage on few pods - VPA adjusts CPU/memory requests automatically

📘 Notes
    - VPA only modifies requests, not limits.
    - HPA and VPA can be used together but manage different aspects.
    - Use kubectl get pods -o wide --sort-by=.metadata.creationTimestamp to observe pod evictions.
    - HPA works based on CPU utilization from metrics-server.

👨‍💻 Maintainer
Usman Ahmad
DevOps Engineer | Kubernetes Enthusiast