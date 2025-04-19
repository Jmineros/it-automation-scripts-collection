CopyEdit
import requests

GITHUB_TOKEN = "your_token_here"
REPO = "username/repo"
WORKFLOW = "build.yml"  # name of the workflow
headers = {
"Authorization": f"token {GITHUB_TOKEN}",
"Accept": "application/vnd.github.v3+json"
}

res = requests.post(
f"https://api.github.com/repos/{REPO}/actions/workflows/{WORKFLOW}/dispatches",
headers=headers,
json={"ref": "main"}
)

print("✅ Workflow triggered" if res.status_code == 204 else res.text)
