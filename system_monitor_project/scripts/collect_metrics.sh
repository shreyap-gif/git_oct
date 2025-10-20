#!/usr/bin/env bash
# collect_metrics.sh — Collect CPU, Memory, Disk, Uptime, Load Average

BASE_DIR="/home/ec2-user/git_oct/system_monitor_project"
REPORTS_DIR="$BASE_DIR/reports"
ARCHIVE_DIR="$BASE_DIR/archive"

mkdir -p "$REPORTS_DIR" "$ARCHIVE_DIR"

TIMESTAMP=$(date +"%Y%m%d_%H%M")
OUTPUT_FILE="$REPORTS_DIR/metrics_${TIMESTAMP}.txt"

# ----- CPU USAGE -----
CPU_USAGE=$(top -bn1 | awk '/Cpu\(s\)/ {print 100 - $8"%"}')

# ----- MEMORY USAGE -----
MEM_USAGE=$(free -m | awk '/Mem:/ {printf "%.1f%%", $3*100/$2}')

# ----- DISK USAGE -----
DISK_USAGE=$(df -h / | awk 'NR==2 {print $5}')

# ----- SYSTEM UPTIME -----
UPTIME_INFO=$(uptime -p)

# ----- LOAD AVERAGE -----
LOAD_AVG=$(uptime | awk -F'load average:' '{print $2}' | xargs)

# ----- SAVE OUTPUT -----
{
  echo "Date & Time   : $(date)"
  echo "CPU Usage     : $CPU_USAGE"
  echo "Memory Usage  : $MEM_USAGE"
  echo "Disk Usage    : $DISK_USAGE"
  echo "Uptime        : $UPTIME_INFO"
  echo "Load Average  : $LOAD_AVG"
} > "$OUTPUT_FILE"

echo " Metrics saved to $OUTPUT_FILE"

