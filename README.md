[readme_preview.html](https://github.com/user-attachments/files/29115379/readme_preview.html)


<!DOCTYPE html>
<html>
<head>
<style>
  body { font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif; padding: 20px; max-width: 800px; margin: 0 auto; background: var(--color-background-primary); color: var(--color-text-primary); }
  h1 { font-size: 24px; border-bottom: 1px solid var(--color-border-secondary); padding-bottom: 10px; }
  h2 { font-size: 18px; margin-top: 24px; border-bottom: 1px solid var(--color-border-tertiary); padding-bottom: 6px; }
  h3 { font-size: 15px; margin-top: 16px; }
  pre { background: var(--color-background-secondary); border-radius: 6px; padding: 14px; font-size: 13px; overflow-x: auto; line-height: 1.6; }
  code { background: var(--color-background-secondary); padding: 2px 6px; border-radius: 4px; font-size: 13px; }
  ul, ol { font-size: 14px; line-height: 1.9; color: var(--color-text-secondary); }
  p { font-size: 14px; line-height: 1.7; color: var(--color-text-secondary); }
  .badge { display: inline-block; font-size: 11px; padding: 3px 10px; border-radius: 20px; margin-right: 6px; font-weight: 500; background: var(--color-background-success); color: var(--color-text-success); }
  table { border-collapse: collapse; width: 100%; font-size: 13px; margin: 12px 0; }
  th { background: var(--color-background-secondary); padding: 8px 12px; text-align: left; border: 1px solid var(--color-border-secondary); }
  td { padding: 8px 12px; border: 1px solid var(--color-border-tertiary); color: var(--color-text-secondary); }
</style>
</head>
<body>

<h1>🖥️ Uptime Warning Alert System</h1>

<span class="badge">Bash</span>
<span class="badge">Linux</span>
<span class="badge">Monitoring</span>
<span class="badge">Sysadmin</span>

<p>A lightweight Bash monitoring script that tracks system uptime and automatically alerts users and administrators when a Linux server has been running for an extended period without a restart. Designed for sysadmin environments where unplanned long uptimes can indicate missed patching or maintenance windows.</p>

<h2>📋 What It Does</h2>
<ul>
  <li>Reads system uptime directly from <code>/proc/uptime</code> for accuracy</li>
  <li>Sends a <strong>warning</strong> alert when uptime exceeds 5 days</li>
  <li>Sends a <strong>critical</strong> alert when uptime exceeds 7 days</li>
  <li>Notifies all logged-in users via <code>wall</code> command</li>
  <li>Emails the system administrator automatically</li>
  <li>Logs all checks and alerts with timestamps to a log file</li>
</ul>

<h2>🏗️ Architecture</h2>
<pre>
/proc/uptime
     │
     ▼
get_uptime_days()
     │
     ├── days >= 7 → CRITICAL → user_notify() + admin_notify() + log()
     ├── days >= 5 → WARNING  → user_notify() + log()
     └── days < 5  → OK       → log() only
</pre>

<h2>⚙️ Configuration</h2>
<p>Edit these variables at the top of <code>alert.sh</code> before deploying:</p>
<pre>
warning_days=5           # Days before warning alert triggers
critical_days=7          # Days before critical alert triggers
log_file="/var/log/sh-logs/warning-logs.log"
admin_email="your-admin@email.com"   # Set via environment variable
</pre>

<p>Recommended: set admin email via environment variable instead of hardcoding:</p>
<pre>
export ADMIN_EMAIL="your-email@domain.com"
</pre>

<h2>🚀 Setup & Usage</h2>

<h3>1. Clone the repo</h3>
<pre>git clone https://github.com/manthannn123/uptime_warning_bash.git
cd uptime_warning_bash</pre>

<h3>2. Create the log directory</h3>
<pre>sudo mkdir -p /var/log/sh-logs
sudo chmod 755 /var/log/sh-logs</pre>

<h3>3. Make the script executable</h3>
<pre>chmod +x alert.sh</pre>

<h3>4. Run manually to test</h3>
<pre>./alert.sh</pre>

<h3>5. Schedule via cron (recommended)</h3>
<pre># Run every hour — add this via: crontab -e
0 * * * * /path/to/alert.sh

# Or run every 6 hours
0 */6 * * * /path/to/alert.sh</pre>

<h2>📁 File Structure</h2>
<table>
  <tr><th>File</th><th>Description</th></tr>
  <tr><td><code>alert.sh</code></td><td>Main monitoring script</td></tr>
  <tr><td><code>/var/log/sh-logs/warning-logs.log</code></td><td>Auto-generated log file (created on first run)</td></tr>
</table>

<h2>🔧 Requirements</h2>
<ul>
  <li>Linux system (tested on RHEL / CentOS)</li>
  <li><code>mail</code> utility installed (<code>sudo yum install mailx</code>)</li>
  <li>SMTP configured for outbound email alerts</li>
  <li>Root or sudo access to create log directory</li>
</ul>

<h2>💡 Skills Demonstrated</h2>
<ul>
  <li>Bash functions and modular scripting</li>
  <li>System monitoring via <code>/proc</code> filesystem</li>
  <li>Multi-channel alerting (terminal broadcast + email)</li>
  <li>Timestamped logging with <code>tee</code></li>
  <li>Cron-based automation</li>
  <li>Two-tier threshold alerting (warning / critical)</li>
</ul>

<h2>👤 Author</h2>
<p>Manthan Sawant — <a href="https://github.com/manthannn123">github.com/manthannn123</a></p>

</body>
</html>
