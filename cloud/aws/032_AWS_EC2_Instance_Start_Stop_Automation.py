CopyEdit
import boto3

ec2 = boto3.client('ec2', region_name='us-east-1')

# Start instance
ec2.start_instances(InstanceIds=['i-0123456789abcdef0'])
print("✅ EC2 started.")

# Stop instance
# ec2.stop_instances(InstanceIds=['i-0123456789abcdef0'])
# print("🛑 EC2 stopped.")
