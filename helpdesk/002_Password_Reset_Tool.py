CopyEdit
from pyad import pyad, aduser
import logging

# Setup AD connection
pyad.set_defaults(ldap_server="dc.company.com", username="admin", password="AdminPass")

# Setup logging
logging.basicConfig(filename="password_reset.log", level=logging.INFO)

# Input: Get username to reset
username = input("Enter username to reset password: ")

try:
user = aduser.ADUser.from_cn(username)

# Reset password
new_password = "Temp2025!"
user.set_password(new_password)

# Unlock account (if locked)
if user.get_account_locked():
user.unlock_account()

# Force password change at next login
user.force_password_change_at_next_login()

print(f"✅ Password for '{username}' has been reset to '{new_password}' and account unlocked.")
logging.info(f"Reset password for {username} and forced password change.")
except Exception as e:
print(f"❌ Failed to reset password for {username}: {e}")
logging.error(f"Error resetting password for {username}: {e}")
