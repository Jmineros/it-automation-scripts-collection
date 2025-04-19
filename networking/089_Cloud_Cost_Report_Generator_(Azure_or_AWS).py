CopyEdit
import boto3
from datetime import datetime, timedelta

client = boto3.client('ce')
end = datetime.today().strftime('%Y-%m-%d')
start = (datetime.today() - timedelta(days=30)).strftime('%Y-%m-%d')

res = client.get_cost_and_usage(
TimePeriod={'Start': start, 'End': end},
Granularity='MONTHLY',
Metrics=['UnblendedCost'],
GroupBy=[{'Type': 'SERVICE', 'Key': 'SERVICE'}]
)

for group in res['ResultsByTime'][0]['Groups']:
print(f"{group['Keys'][0]}: ${group['Metrics']['UnblendedCost']['Amount']}")
Azure equivalent: Use az consumption usage list or Cost Management APIs
