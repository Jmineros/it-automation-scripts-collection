CopyEdit
import os, requests
from subprocess import run

username = "your-github-user"
token = "ghp_..."
headers = {"Authorization": f"token {token}"}

repos = requests.get(f"https://api.github.com/users/{username}/repos", headers=headers).json()
os.makedirs("repo_backups", exist_ok=True)

for repo in repos:
name = repo['name']
url = repo['clone_url']
print(f"📦 Backing up {name}")
run(["git", "clone", "--mirror", url], cwd="repo_backups")
