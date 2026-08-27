# Verification Guide

## Nginx

```bash
systemctl status nginx --no-pager
nginx -v
curl -I http://localhost
```

Expected outcome: Nginx is active and the local HTTP endpoint responds successfully.

## Firewall

```bash
sudo firewall-cmd --list-all
```

Confirm that the required HTTP and SSH services/ports are permitted according to the lab configuration.

## Port Test

```bash
curl --connect-timeout 3 http://localhost:8080
```

Expected outcome in the submitted lab evidence: the connection fails because port 8080 is blocked/not listening.

## Logs

```bash
sudo tail -n 20 /var/log/nginx/access.log
sudo tail -n 20 /var/log/health_check.log
```

## Health Check

```bash
sudo ./scripts/health_check.sh
```

Review the PASS/FAIL summary and the generated log.

## Cron

```bash
crontab -l
```

Confirm that the health-check command is scheduled.

## Nginx Manager

```bash
./scripts/manage_nginx.sh status
./scripts/manage_nginx.sh restart
./scripts/manage_nginx.sh stop
./scripts/manage_nginx.sh start
```
