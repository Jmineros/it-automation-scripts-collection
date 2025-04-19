CopyEdit
import psutil, time

print("Monitoring bandwidth usage. Press Ctrl+C to stop.")
old = psutil.net_io_counters()
time.sleep(5)
new = psutil.net_io_counters()

bytes_sent = (new.bytes_sent - old.bytes_sent) / 1024
bytes_recv = (new.bytes_recv - old.bytes_recv) / 1024

print(f"Upload: {bytes_sent:.2f} KB")
print(f"Download: {bytes_recv:.2f} KB")
🔁 Can run as a loop to log every 60s
