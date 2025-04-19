CopyEdit
import requests
from requests.auth import HTTPBasicAuth

jenkins_url = "http://jenkins.local"
job_name = "my-build"
username = "admin"
token = "your-token"

# Delete builds older than 10
for i in range(1, 10):
url = f"{jenkins_url}/job/{job_name}/{i}/doDelete"
r = requests.post(url, auth=HTTPBasicAuth(username, token))
if r.status_code == 200:
print(f"🗑️ Deleted build #{i}")
