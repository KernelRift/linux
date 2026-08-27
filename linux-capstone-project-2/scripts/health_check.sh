#!/bin/bash
# ============================================
# Server Health Check Script
# Linux Capstone Project 2
# ============================================

LOGFILE="/var/log/health_check.log"
TIMESTAMP="$(date '+%Y-%m-%d %H:%M:%S')"
PASS=0
FAIL=0

log() {
    echo "[$TIMESTAMP] $1" | tee -a "$LOGFILE"
}

check_service() {
    local service="$1"

    if systemctl is-active --quiet "$service"; then
        log "PASS: $service is running"
        ((PASS++))
    else
        log "FAIL: $service is NOT running"
        ((FAIL++))

        # Attempt recovery
        systemctl restart "$service" 2>/dev/null
        log "Attempted restart of $service"
    fi
}

check_port() {
    local port="$1"
    local name="$2"

    if ss -tlnp | grep -q ":$port"; then
        log "PASS: Port $port ($name) is open"
        ((PASS++))
    else
        log "FAIL: Port $port ($name) is NOT open"
        ((FAIL++))
    fi
}

check_disk() {
    local threshold=80
    local usage
    usage="$(df / | awk 'NR==2 {print $5}' | tr -d '%')"

    if [ "$usage" -lt "$threshold" ]; then
        log "PASS: Disk usage is ${usage}% (below ${threshold}% threshold)"
        ((PASS++))
    else
        log "WARN: Disk usage is ${usage}% (above ${threshold}% threshold)"
        ((FAIL++))
    fi
}

check_memory() {
    local free_mem
    free_mem="$(free | awk 'NR==2 {printf "%.0f", $4/$2*100}')"

    if [ "$free_mem" -gt 10 ]; then
        log "PASS: Free memory is ${free_mem}%"
        ((PASS++))
    else
        log "WARN: Low memory — only ${free_mem}% free"
        ((FAIL++))
    fi
}

check_http() {
    local http_code
    http_code="$(curl -s -o /dev/null -w "%{http_code}" http://localhost/)"

    if [ "$http_code" = "200" ]; then
        log "PASS: HTTP response code is $http_code"
        ((PASS++))
    else
        log "FAIL: HTTP response code is $http_code (expected 200)"
        ((FAIL++))
    fi
}

# ---- Run All Checks ----
log "========================================"
log "Server Health Check Started"
log "========================================"

check_service "nginx"
check_service "firewalld"
check_port 80 "HTTP"
check_port 22 "SSH"
check_disk
check_memory
check_http

log "========================================"
log "Health Check Complete: PASS=$PASS | FAIL=$FAIL"
log "========================================"
echo ""
