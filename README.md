# Uptime Warning Alert System

A Bash script that monitors system uptime and alerts users and admin when a Linux server has been running too long without a restart.

## What It Does
- Checks uptime using /proc/uptime
- Sends warning alert if uptime exceeds 5 days
- Sends critical alert if uptime exceeds 7 days
- Notifies all logged-in users via wall command
- Emails the administrator
- Logs every check with timestamp

## How to Use

1. Clone the repo
git clone https://github.com/manthannn123/uptime_warning_bash.git

2. Create log directory
sudo mkdir -p /var/log/sh-logs

3. Make script executable
chmod +x alert.sh

4. Run it
./alert.sh

5. Schedule via cron (run every hour)
0 * * * * /path/to/alert.sh

## Configure
Edit these lines at the top of alert.sh
- warning_days=5
- critical_days=7
- admin_email="your-email@domain.com"

## Requirements
- Linux (RHEL/CentOS)
- mail utility installed (sudo yum install mailx)

## Author
Manthan Sawant - github.com/manthannn123
