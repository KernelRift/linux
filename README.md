# Linux Capstone Project 2 — Server Administration & Monitoring

A practical Linux administration project completed on an Ubuntu virtual machine. The project demonstrates Nginx deployment, firewall configuration, network troubleshooting, log analysis, Bash automation, service management, and scheduled health checks.

## Project Overview

**Author:** Nitin Maurya  
**Environment:** Virtual Machine  
**OS:** Ubuntu  
**Project:** Linux Capstone Project 2  
**Submission Date:** 21 August 2026

### What this project demonstrates

- Installing and validating **Nginx**
- Serving and testing a custom web page
- Exploring Nginx configuration
- Configuring **firewalld** with HTTP and SSH access
- Verifying that an unauthorized port is blocked
- Inspecting Nginx access logs with `grep` and `awk`
- Filtering system logs
- Using common network troubleshooting tools
- Building a reusable Bash server health-check script
- Logging health-check results
- Scheduling automated checks with `cron`
- Building a Bash Nginx service-management utility
- Performing final system verification

## Repository Structure

```text
linux-capstone-project-2/
├── .github/
│   └── workflows/
│       └── shellcheck.yml
├── docs/
│   ├── PROJECT_REPORT.md
│   └── VERIFICATION.md
├── evidence/
│   ├── screenshot-01.*
│   ├── screenshot-02.*
│   └── ...
├── scripts/
│   ├── health_check.sh
│   └── manage_nginx.sh
├── .gitignore
├── LICENSE
└── README.md
```

## Key Components

### 1. Nginx Administration

The project installs and validates Nginx using commands such as:

```bash
sudo systemctl start nginx
systemctl status nginx
nginx -v
curl http://localhost
```

The submitted evidence includes Nginx service status and web-server testing.

### 2. Firewall Configuration

The project uses `firewalld` to allow required services such as HTTP and SSH and verifies that port `8080` is not accessible.

Example verification:

```bash
sudo firewall-cmd --list-all
curl http://localhost:8080
```

A failed connection to port 8080 demonstrates that the port is not exposed by the configured firewall/service state.

### 3. Log Analysis

Nginx access logs are reviewed and filtered using standard Linux text-processing tools:

```bash
grep ...
awk ...
sort ...
```

This demonstrates practical log inspection rather than simply viewing raw logs.

### 4. Network Troubleshooting

The project exercises:

```bash
ping
nslookup
dig
ss
wget
curl
```

These commands are useful for connectivity testing, DNS investigation, socket inspection, HTTP validation, and resource retrieval.

### 5. Automated Server Health Check

`scripts/health_check.sh` checks:

- Nginx service status
- firewalld service status
- HTTP port 80
- SSH port 22
- Root filesystem usage
- Available memory
- Local HTTP response status

Results are written to:

```text
/var/log/health_check.log
```

The script reports `PASS` / `FAIL` results and attempts to restart a failed service.

Run it with:

```bash
sudo ./scripts/health_check.sh
```

### 6. Nginx Management Utility

`scripts/manage_nginx.sh` provides a simple interface for:

```bash
./scripts/manage_nginx.sh start
./scripts/manage_nginx.sh stop
./scripts/manage_nginx.sh restart
./scripts/manage_nginx.sh status
```

This demonstrates Bash arguments, conditional logic, `case` statements, and `systemctl`.

### 7. Cron Automation

The health-check script can be scheduled with cron.

Edit the current user's crontab:

```bash
crontab -e
```

Example:

```cron
*/5 * * * * /absolute/path/to/linux-capstone-project-2/scripts/health_check.sh
```

Verify the schedule:

```bash
crontab -l
```

## Installation / Reproduction

Tested environment: Ubuntu VM.

Install the required packages:

```bash
sudo apt update
sudo apt install -y nginx firewalld curl wget dnsutils
```

Enable and start services:

```bash
sudo systemctl enable --now nginx
sudo systemctl enable --now firewalld
```

Make the scripts executable:

```bash
chmod +x scripts/*.sh
```

Run the health check:

```bash
sudo ./scripts/health_check.sh
```

Test the Nginx manager:

```bash
./scripts/manage_nginx.sh status
./scripts/manage_nginx.sh restart
```

## Verification Checklist

```bash
systemctl is-active nginx
nginx -v
curl -I http://localhost
sudo firewall-cmd --list-all
ss -tlnp
sudo tail -n 20 /var/log/nginx/access.log
sudo tail -n 20 /var/log/health_check.log
crontab -l
```

## Evidence

The `evidence/` directory contains screenshots captured during the original project submission, including:

- Nginx installation/status
- Web-server testing
- Nginx configuration inspection
- Firewall configuration
- Port-blocking test
- Nginx log analysis
- System-log filtering
- Network commands
- Health-check execution
- Health-check log output
- Cron scheduling
- Nginx management-script testing
- Final system verification

## Skills Demonstrated

**Linux:** Ubuntu, systemd, services, permissions, logs, cron  
**Web Server:** Nginx configuration and troubleshooting  
**Networking:** TCP listening ports, DNS, HTTP, connectivity testing  
**Security:** Firewall rules, exposed-port validation, service hardening basics  
**Automation:** Bash scripting, health checks, recovery actions, scheduled execution  
**Monitoring:** Log files, PASS/FAIL reporting, system resource checks  
**Tools:** `systemctl`, `firewall-cmd`, `ss`, `curl`, `wget`, `ping`, `dig`, `nslookup`, `grep`, `awk`, `df`, `free`

## Recruiter Summary

This project shows hands-on Linux administration rather than only command-line practice. It combines a web server, firewall, networking, monitoring, log analysis, Bash automation, and cron scheduling into one reproducible administration workflow.

## Notes

## Related Project

### Linux Capstone Project 1

This project builds on the Linux administration fundamentals demonstrated in Project 1, including users and groups, permissions, ACLs, process management, Bash scripting, and cron automation.

➡️ **[View Linux Capstone Project 1](https://github.com/KernelRift/linux-capstone-project-1)**

The repository version of the Bash scripts is cleaned up for readability and portability while preserving the functionality demonstrated in the submitted project report. The screenshots are retained as project evidence.
