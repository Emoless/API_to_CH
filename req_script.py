import requests
import os
import json

full_url = 'https://api.nasa.gov/EPIC/api/natural/date/2019-05-30?api_key=DEMO_KEY'
save_path = '/home/user/PycharmProjects/Project_K/API_to_CH'

# Создание папки, если не существует
os.makedirs(save_path, exist_ok=True)

response = requests.get(full_url)
data = response.json()

file_path = os.path.join(save_path, 'epic_data.json')
with open(file_path, 'w') as file:
    json.dump(data, file, indent=4)

print(f"Data saved to {file_path}")

