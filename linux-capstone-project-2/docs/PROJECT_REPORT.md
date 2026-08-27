# Project Report

## Objective

Build and verify a small Linux server environment covering web-server administration, firewall configuration, network troubleshooting, log analysis, and automation.

## Environment

- Ubuntu Linux
- Virtual Machine
- Nginx
- firewalld
- Bash
- cron

## Implementation

1. Installed and started Nginx.
2. Verified the service with `systemctl` and checked the installed version.
3. Tested the local web server with browser/curl.
4. Explored Nginx configuration under `/etc/nginx/`.
5. Configured firewall access for HTTP and SSH.
6. Tested that port 8080 was not reachable.
7. Inspected Nginx access logs using `grep` and `awk`.
8. Reviewed and filtered system logs.
9. Tested networking utilities including `ping`, `nslookup`, `dig`, `ss`, `wget`, and `curl`.
10. Created a Bash health-check script.
11. Stored health-check output in `/var/log/health_check.log`.
12. Scheduled the health check with cron.
13. Created an Nginx service-management script supporting start, stop, restart, and status.
14. Performed final verification of the server state.

## Result

The submitted evidence documents the configuration and testing stages, including service status, firewall state, log analysis, health-check output, cron configuration, script testing, and final verification.
