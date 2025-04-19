CopyEdit
import boto3

route53 = boto3.client('route53')

response = route53.change_resource_record_sets(
HostedZoneId='Z123456ABCDEFG',
ChangeBatch={
'Changes': [{
'Action': 'UPSERT',
'ResourceRecordSet': {
'Name': 'app.yourdomain.com',
'Type': 'A',
'TTL': 300,
'ResourceRecords': [{'Value': '203.0.113.10'}]
}
}]
}
)
print("✅ DNS A record updated.")