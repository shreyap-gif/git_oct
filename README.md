# git_oct
# System Monitor Project

This project collects and archives server performance metrics.

## Scripts

- **collect_metrics.sh** — Captures CPU, Memory, Disk Usage, Uptime, and Load Average every 15 minutes.
- **daily_archive.sh** — Compresses all daily metrics into `archive/metrics_<date>.tar.gz` every 24 hours.

## Cron Jobs

| Schedule | Command | Purpose |
|-----------|----------|----------|
| Every 15 mins | `/home/ec2-user/system_monitor_project/collect_metrics.sh` | Collect metrics |
| Every midnight | `/home/ec2-user/system_monitor_project/daily_archive.sh` | Archive daily reports |

`.gitignore` excludes `reports/` and `archive/` folders.
