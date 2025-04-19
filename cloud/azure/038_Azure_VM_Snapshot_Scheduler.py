CopyEdit
from azure.identity import DefaultAzureCredential
from azure.mgmt.compute import ComputeManagementClient

subscription_id = "your-subscription-id"
credentials = DefaultAzureCredential()
compute_client = ComputeManagementClient(credentials, subscription_id)

resource_group = "MyRG"
disk_name = "vmname_OsDisk"
snapshot_name = "snapshot-vmname"

disk = compute_client.disks.get(resource_group, disk_name)

snapshot_params = {
'location': disk.location,
'creation_data': {'create_option': 'Copy', 'source_resource_id': disk.id}
}

compute_client.snapshots.begin_create_or_update(resource_group, snapshot_name, snapshot_params)
print(f"✅ Snapshot {snapshot_name} started.")
