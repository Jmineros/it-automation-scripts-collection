CopyEdit
import pandas as pd

df = pd.read_csv("tickets.csv")  # must include columns: AssignedTo, Status, ResolvedDate

monthly = df[df['ResolvedDate'].str.contains("2025-04")]
summary = monthly.groupby('AssignedTo').size().reset_index(name='TicketsClosed')

summary.to_csv("April_Ticket_Report.csv", index=False)
print(summary)
