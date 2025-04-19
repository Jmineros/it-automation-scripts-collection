CopyEdit
def lambda_handler(event, context):
for record in event['Records']:
bucket = record['s3']['bucket']['name']
key = record['s3']['object']['key']
print(f"📁 New file in S3: {bucket}/{key}")
# Do something here, like process file or send alert
Setup via S3 → Properties → Event Notifications
