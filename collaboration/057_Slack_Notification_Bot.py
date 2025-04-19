CopyEdit
import requests

slack_webhook = "https://hooks.slack.com/services/XXX/YYY/ZZZ"
message = {
"text": "🚨 High CPU usage on server1 detected!"
}
response = requests.post(slack_webhook, json=message)
print("✅ Alert sent to Slack." if response.status_code == 200 else "❌ Failed")
🔁 Integrate this into any monitoring or CI/CD pipeline step.
