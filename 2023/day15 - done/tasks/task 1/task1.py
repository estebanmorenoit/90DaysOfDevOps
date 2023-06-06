import json

# Define a dictionary
dictionary = {
    "name": "John Doe",
    "age": 30,
    "city": "New York"
}

# Open a file in write mode and use json.dump() to write the dictionary to the file
with open("task1.json", "w") as file:
    json.dump(dictionary, file, indent=4)
    # The indent parameter is used to format the JSON data with indentation for better readability

print("Dictionary has been written to task1.json")
