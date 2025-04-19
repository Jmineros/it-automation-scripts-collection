CopyEdit
import boto3
from datetime import datetime, timezone, timedelta

s3 = boto3.client('s3')
bucket = "your-bucket-name"
prefix = "logs/"
days_old = 30
cutoff = datetime.now(timezone.utc) - timedelta(days=days_old)

response = s3.list_objects_v2(Bucket=bucket, Prefix=prefix)
for obj in response.get('Contents', []):
if obj['LastModified'] < cutoff:
print(f"🗑️ Deleting: {obj['Key']}")
s3.delete_object(Bucket=bucket, Key=obj['Key'])
