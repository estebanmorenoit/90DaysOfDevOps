import yaml
import json

# Read the YAML file
with open('services.yaml') as file:
    yaml_data = yaml.safe_load(file)

# Convert YAML to JSON
json_data = json.dumps(yaml_data)

# Write the JSON data to a file
with open('task3.json', 'w') as file:
    file.write(json_data)

print("Converted YAML to JSON and saved to task3.json")
