CopyEdit
import requests

ACCESS_TOKEN = "your_access_token"
headers = {
"Authorization": f"Bearer {ACCESS_TOKEN}",
"Content-Type": "application/json"
}

user = {
"accountEnabled": True,
"displayName": "Jane Doe",
"mailNickname": "janedoe",
"userPrincipalName": "janedoe@yourtenant.onmicrosoft.com",
"passwordProfile": {
"forceChangePasswordNextSignIn": True,
"password": "Temp2025!"
}
}

response = requests.post(
"https://graph.microsoft.com/v1.0/users",
headers=headers,
json=user
)

print("✅ Created Azure AD user" if response.status_code == 201 else response.text)
Can loop over a CSV with user rows
