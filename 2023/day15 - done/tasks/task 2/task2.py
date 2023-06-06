import json

# Open the 'services.json' file
with open('services.json') as file:
    # Load the JSON data into a Python dictionary
    data = json.load(file)

# Access the 'name' attribute of the 'aws' service
print("aws: ", data['services']['aws']['name'])

# Access the 'name' attribute of the 'azure' service
print("azure: ", data['services']['azure']['name'])

# Access the 'name' attribute of the 'gcp' service
print("gcp: ", data['services']['gcp']['name'])
