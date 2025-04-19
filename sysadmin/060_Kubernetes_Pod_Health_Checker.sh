CopyEdit
#!/bin/bash
echo "🔍 Checking for unhealthy pods..."
kubectl get pods --all-namespaces | grep -v Running | grep -v Completed
Extend with Slack/Teams alert on detection