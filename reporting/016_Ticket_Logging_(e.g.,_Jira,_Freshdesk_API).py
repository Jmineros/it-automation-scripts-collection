CopyEdit
import requests
import json

api_key = "YOUR_API_KEY"
domain = "yourcompany"
headers = { "Content-Type": "application/json" }

data = {
"description": "Spooler crashed on PC123. Restarted automatically.",
"subject": "Spooler Crash Auto-Report",
"email": "user@company.com",
"priority": 1,
"status": 2
}

response = requests.post(
f"https://{domain}.freshdesk.com/api/v2/tickets",
auth=(api_key, "X"),
headers=headers,
data=json.dumps(data)
)

print("✅ Ticket created" if response.status_code == 201 else f"❌ Failed: {response.status_code}")
🔄 Swap domain and API key to use with your own Jira/Freshdesk
