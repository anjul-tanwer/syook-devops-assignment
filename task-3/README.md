# Task 3: Networking & Security Hardening

## Objective
To secure an application deployed in a restricted network simulating IoT communication via BLE gateway, ensuring minimal exposure and strong security controls.

---

## Architecture Overview

IoT Device → BLE Gateway → App Server → Database

- BLE Gateway communicates over HTTPS (TCP 443)
- App Server communicates with Database over TCP 3306
- Time synchronization via NTP (UDP 123)

---

## Implementation Details

### 1. Infrastructure
- Deployed on AWS EC2 (RHEL 9)
- Security Groups configured to allow only required ports:
  - SSH (22) – restricted to my IP
  - HTTP (80)
  - HTTPS (443)

### 2. OS-Level Firewall
- Configured using firewalld
- Allowed only SSH, HTTP, HTTPS
- All other traffic denied by default

### 3. Nginx Security
- SSL/TLS enabled using self-signed certificate
- HTTP redirected to HTTPS
- Rate limiting applied (10 requests/sec)
- Security headers added:
  - HSTS
  - X-Frame-Options
  - CSP
  - XSS Protection

### 4. SELinux
- SELinux kept in enforcing mode
- Required contexts and policies configured

### 5. SSH Hardening
- Root login disabled
- Password authentication disabled (key-based login only)

### 6. Logging & Monitoring
- Log rotation configured via logrotate
- Nginx logs monitored

### 7. Automatic Updates
- Enabled using dnf-automatic

---

## Security Layers

1. Cloud Level:
   - AWS Security Groups restrict inbound traffic

2. OS Level:
   - firewalld enforces local firewall rules

3. Application Level:
   - Nginx enforces HTTPS, rate limiting, and headers

---

## Assumptions
- BLE Gateway is external and communicates via HTTPS
- IoT devices are not directly exposed to the server

---

## Trade-offs
- Database deployed on same instance for simplicity
- In production, DB should be placed in a private subnet

---

## Testing

- Verified HTTPS access
- Verified HTTP to HTTPS redirection
- Verified security headers via curl
- Simulated traffic using curl

---

## Conclusion
Successfully implemented a secure application environment with layered security, ensuring minimal exposure and adherence to best practices.
