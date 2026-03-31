# Install SSL tools
sudo apt install certbot python3-certbot-nginx
sudo certbot --nginx

# File Integrity Monitoring (AIDE)
sudo apt install aide
sudo aideinit
sudo cp /var/lib/aide/aide.db.new /var/lib/aide/aide.db

# Strong password policy
sudo nano /etc/security/pwquality.conf
# minlen=12

# Fail2Ban
sudo apt install fail2ban
sudo systemctl enable fail2ban
sudo systemctl start fail2ban

# Restrict sudo access
sudo visudo

# Disable unnecessary services
sudo systemctl list-units --type=service
sudo systemctl disable <service_name>

# Automatic updates
sudo apt install unattended-upgrades
sudo dpkg-reconfigure --priority=low unattended-upgrades

# Firewall (UFW)
sudo apt install ufw
sudo ufw allow OpenSSH
sudo ufw enable

# SSH hardening
sudo nano /etc/ssh/sshd_config
# PasswordAuthentication no
# PermitRootLogin no
sudo systemctl restart sshd
