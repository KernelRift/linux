#!/bin/bash
# ============================================
# Nginx Service Management Script
# Linux Capstone Project 2
# ============================================

ACTION="${1:-}"

if [ -z "$ACTION" ]; then
    echo "Usage: $0 {start|stop|restart|status}"
    exit 1
fi

case "$ACTION" in
    start)
        echo "Starting Nginx..."
        sudo systemctl start nginx

        if systemctl is-active --quiet nginx; then
            echo "Nginx started successfully"
        else
            echo "Failed to start Nginx"
            exit 1
        fi
        ;;

    stop)
        echo "Stopping Nginx..."
        sudo systemctl stop nginx
        echo "Nginx stopped"
        ;;

    restart)
        echo "Restarting Nginx..."
        sudo systemctl restart nginx

        if systemctl is-active --quiet nginx; then
            echo "Nginx restarted successfully"
        else
            echo "Failed to restart Nginx"
            exit 1
        fi
        ;;

    status)
        systemctl status nginx --no-pager
        ;;

    *)
        echo "Invalid action: $ACTION"
        echo "Usage: $0 {start|stop|restart|status}"
        exit 1
        ;;
esac
