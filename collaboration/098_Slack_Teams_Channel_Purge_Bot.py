CopyEdit
import requests

token = "xoxb-your-slack-token"
channel = "C1234567890"

res = requests.get("https://slack.com/api/conversations.history",
headers={"Authorization": f"Bearer {token}"},
params={"channel": channel})

for msg in res.json().get("messages", []):
ts = msg['ts']
requests.post("https://slack.com/api/chat.delete",
headers={"Authorization": f"Bearer {token}"},
data={"channel": channel, "ts": ts})

print("🧹 Slack channel messages deleted.")
⚠ Ensure the bot has chat:write + channels:history + chat:delete scopes
