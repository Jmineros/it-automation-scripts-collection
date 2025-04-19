CopyEdit
import yaml, glob

files = glob.glob("*.yml") + glob.glob("*.yaml")

for file in files:
try:
with open(file) as f:
yaml.safe_load(f)
print(f"✅ Valid YAML: {file}")
except yaml.YAMLError as e:
print(f"❌ YAML Error in {file}: {e}")
