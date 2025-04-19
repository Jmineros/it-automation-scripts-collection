CopyEdit
import pandas as pd
from datetime import datetime, timedelta

df = pd.read_csv("software_expiry.csv")  # columns: Name, ExpiryDate
df['ExpiryDate'] = pd.to_datetime(df['ExpiryDate'])
soon = df[df['ExpiryDate'] <= datetime.today() + timedelta(days=30)]

if not soon.empty:
body = soon.to_string(index=False)
# Use Send-MailMessage in PowerShell or Python smtplib to send
print("⚠️ Expiring software:\n", body)
else:
print("✅ No upcoming expiries.")
