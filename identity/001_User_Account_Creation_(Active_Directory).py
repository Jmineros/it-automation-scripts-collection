CopyEdit
import pandas as pd
from pyad import aduser, adgroup, adcontainer, pyad
import logging

# Setup AD config
pyad.set_defaults(ldap_server="dc.company.com", username="admin", password="AdminPass")

# Setup logging
logging.basicConfig(filename='user_creation.log', level=logging.INFO)

# Read user data
df = pd.read_csv("new_users.csv")

# OU mapping
ou_mapping = {
"Marketing": "OU=Marketing,DC=company,DC=com",
"IT": "OU=IT,DC=company,DC=com"
}

# Group mapping
group_mapping = {
"Marketing": "MarketingGroup",
"IT": "ITGroup"
}

# Create users
for index, row in df.iterrows():
full_name = f"{row['first_name']} {row['last_name']}"
username = row["username"]
department = row["department"]

try:
ou = adcontainer.ADContainer.from_dn(ou_mapping[department])
user = aduser.ADUser.create(
name=full_name,
container_object=ou,
password="P@ssw0rd2025!",
upn=f"{username}@company.com"
)
group = adgroup.ADGroup.from_cn(group_mapping[department])
group.add_members([user])

logging.info(f"Created user {username} in {department}")
except Exception as e:
logging.error(f"Failed to create user {username}: {e}")
