CopyEdit
import requests
import pandas as pd

access_token = "YOUR_ACCESS_TOKEN"
site_id = "YOUR_SITE_ID"
list_id = "YOUR_LIST_ID"
headers = {"Authorization": f"Bearer {access_token}"}

url = f"https://graph.microsoft.com/v1.0/sites/{site_id}/lists/{list_id}/items?expand=fields"
res = requests.get(url, headers=headers)
items = [i['fields'] for i in res.json()['value']]
df = pd.DataFrame(items)
df.to_csv("sharepoint_list_export.csv", index=False)

print("✅ SharePoint list exported.")
