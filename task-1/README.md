# 🚀 Task 1: On-Premise Application Stack Deployment

## 📌 Objective

This task demonstrates the deployment of a multi-tier application stack by containerizing and orchestrating both **MERN** and **LAMP** architectures on a Linux-based virtual machine. The setup simulates an on-premise customer environment using Docker Compose for service orchestration and Nginx as a reverse proxy.

---

## 🏗️ Architecture Overview

```
                Client Request
                      |
                      v
              Nginx Reverse Proxy
               /app        /legacy
                |              |
        -------------------------------
        |                             |
   MERN Stack                    LAMP Stack
(React + Node + MongoDB)   (Apache + PHP + MySQL)
```

---

## 🛠️ Technology Stack

* Containerization: Docker, Docker Compose
* Reverse Proxy: Nginx
* MERN Stack:

  * MongoDB (Database)
  * Node.js & Express (Backend API)
  * React (Frontend served via Nginx)
* LAMP Stack:

  * Apache (Web Server)
  * PHP (Application Layer)
  * MySQL (Database)
* Platform: Linux (Ubuntu on AWS EC2)

---

## 📦 Service Composition

### 🔹 MERN Stack (`/app`)

* MongoDB container for NoSQL data storage
* Node.js + Express backend exposing REST APIs
* React frontend served via Nginx container

### 🔹 LAMP Stack (`/legacy`)

* Apache web server hosting PHP application
* MySQL database container for relational data

---

## 🌐 Routing Configuration

| Endpoint  | Destination Service |
| --------- | ------------------- |
| `/app`    | React Frontend      |
| `/legacy` | Apache (PHP)        |

Routing is handled via Nginx reverse proxy using internal Docker DNS-based service discovery.

---

## ⚙️ Setup Instructions

### 1. Clone Repository

```bash
git clone https://github.com/<your-username>/syook-devops-assignment.git
cd syook-devops-assignment/task-1
```

### 2. Run Bootstrap Script

```bash
chmod +x setup.sh
./setup.sh
```

### 3. Verify Deployment

```bash
docker ps
```

---

## 🌍 Access Application

* MERN Application: `http://52.204.233.134/app`
* LAMP Application: `http://52.204.233.134/legacy`

---

## 🔐 Security & Infrastructure Considerations

This implementation is intentionally deployed on a **single public EC2 instance** to simulate a simple on-premise environment and ensure ease of execution within limited time constraints.

### ⚠️ Current Limitations (Non-Production Setup)

* Publicly accessible instance without network segmentation
* No HTTPS (TLS termination not configured)
* Credentials managed via environment variables (not secrets manager)
* No authentication or authorization mechanisms
* No rate limiting or WAF protection

---

## 🏭 Production-Grade Enhancements

In a real-world production deployment, the following improvements would be implemented:

### 🔒 Security Hardening

* Deployment within a **custom VPC** with public/private subnet segregation
* Use of **bastion host** or VPN for secure administrative access
* Implementation of **AWS Security Groups and NACLs** for traffic control
* Secrets management via **AWS Secrets Manager / HashiCorp Vault**
* Enabling **HTTPS with TLS termination** using a load balancer (ALB/Nginx)
* Integration with **Web Application Firewall (WAF)** for threat protection

---

### ⚙️ High Availability & Scalability

* Multi-instance deployment behind a **load balancer**
* Stateless application design with horizontal scaling
* Database replication (MongoDB Replica Set, MySQL Primary-Replica)
* Use of **container orchestration platforms** like Kubernetes (EKS)
* Health checks and auto-recovery mechanisms

---

### 📊 Observability & Monitoring

* Metrics collection using **Prometheus**
* Visualization via **Grafana dashboards**
* Centralized logging using ELK/EFK stack
* Alerting mechanisms for proactive incident response

---

### 🔁 CI/CD & Automation

* Integration with CI/CD pipelines (Jenkins / GitHub Actions)
* Automated image builds and deployments
* Infrastructure provisioning using **Terraform (IaC)**

---

## 🧠 Design Decisions

* **Docker Compose** used for rapid multi-service orchestration
* **Nginx reverse proxy** implemented for unified routing and abstraction layer
* **Containerized architecture** ensures portability and consistency
* **Service discovery via Docker DNS** eliminates dependency on static IPs
* Deployment performed directly on a Linux VM to simulate an **on-premise deployment model**

---

## 📌 Conclusion

This setup successfully demonstrates a working multi-stack deployment in a controlled environment. While intentionally simplified, the architecture reflects foundational DevOps practices and is designed to be extensible toward production-grade infrastructure.

---

## 👤 Author

**Anjul Tanwer**
DevOps Engineer

