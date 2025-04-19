CopyEdit
import json
import requests

def lambda_handler(event, context):
slack_webhook = "https://hooks.slack.com/services/XXX/YYY/ZZZ"
message = {
"text": f"🚨 CloudWatch Alert:\n{json.dumps(event)}"
}
requests.post(slack_webhook, json=message)
Plug into CloudWatch via SNS → Lambda trigger
