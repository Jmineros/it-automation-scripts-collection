CopyEdit
from azure.identity import DefaultAzureCredential
from azure.mgmt.resource import ResourceManagementClient

subscription_id = "your-subscription-id"
credentials = DefaultAzureCredential()
client = ResourceManagementClient(credentials, subscription_id)

tags = {"Owner": "josh", "Environment": "Prod"}

for rg in client.resource_groups.list():
print(f"Tagging {rg.name}")
client.resource_groups.update(rg.name, {"tags": tags})
Can extend to tag specific resources (VMs, Storage) based on criteria
