#!/bin/bash
warning_days=5
critical_days=7
log_file="/var/log/sh-logs/warning-logs.log"
hostname=$(hostname)
admin_email="abcd@gmail.com"

log(){
	echo "[$(date '+%d-%m-%y %H:%M:%S')] $1" | tee -a "$log_file"
}


get_uptime_days(){
	uptime_seconds=$(awk '{print int($1)}' /proc/uptime)
	echo $((uptime_seconds/86400))
}


user_notify(){
	local message="$1"
	wall "$message"
	log "Notification sent to all user: $message"
}

admin_notify(){
	local message="$1"
	echo "$message" | mail -s "[alert] uptime warning - $hostname" "$admin_email"
	log "admin email sent to $admin_email"
}

log "uptime check started on $hostname"

days=$(get_uptime_days)
log "current uptime: $days days"

if [ "$days" -ge "$critical_days" ]; then
       message="critical: $hostname has been running for $days days without restart . immediate shutdown required . please save all the work and shut down now."
	log "critical threshold reached"
	user_notify "$message"
	admin_notify "$message"

elif [ "$days" -ge "$warning_days" ]; then
       message="critical: $hostname has been running for $days days without restart . immediate shutdown required . please save all the work and shut down now"
       user_notify "$message"

else
	log "uptime within accepatable range ($days) days. no action needed by $hostname."

fi

log "uptime check completed"


