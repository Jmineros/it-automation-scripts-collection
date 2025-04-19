CopyEdit
import boto3

iam = boto3.client('iam')

users = iam.list_users()['Users']
for user in users:
login = user.get('PasswordLastUsed', 'Never')
print(f"{user['UserName']} - Last login: {login}")
Expand to include group memberships, attached policies, MFA status