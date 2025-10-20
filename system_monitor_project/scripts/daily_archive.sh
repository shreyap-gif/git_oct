#!/usr/bin/env bash
# daily_archive.sh — Compress all daily metrics into archive/

BASE_DIR="/home/ec2-user/git_oct/system_monitor_project"
REPORTS_DIR="$BASE_DIR/reports"
ARCHIVE_DIR="$BASE_DIR/archive"

mkdir -p "$REPORTS_DIR" "$ARCHIVE_DIR"

DATE=$(date +"%Y%m%d")
ARCHIVE_FILE="$ARCHIVE_DIR/metrics_${DATE}.tar.gz"

tar -czf "$ARCHIVE_FILE" -C "$REPORTS_DIR" .
echo " Archived reports to $ARCHIVE_FILE"

