CopyEdit
import boto3
from datetime import datetime, timedelta

ec2 = boto3.client("ec2")
cutoff = datetime.now() - timedelta(days=1)

snapshots = ec2.describe_snapshots(OwnerIds=['self'])['Snapshots']
for snap in snapshots:
snap_time = snap['StartTime'].replace(tzinfo=None)
if snap_time > cutoff:
print(f"✅ Snapshot OK: {snap['SnapshotId']} from {snap_time}")
Can extend to fail alert if any target server is missing a backup
