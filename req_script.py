import requests
import json
import boto3
from botocore.exceptions import NoCredentialsError
from io import BytesIO

full_url = 'https://api.nasa.gov/DONKI/CMEAnalysis?startDate=2016-09-01&endDate=2016-09-30&mostAccurateOnly=true&speed=500&halfAngle=30&catalog=ALL&api_key=DEMO_KEY'

# Параметры MinIO
minio_endpoint = 'http://localhost:9002'
minio_access_key = 'minioadmin'
minio_secret_key = 'minioadmin'
bucket_name = 'databucket'
object_name = 'epic_data.json'

response = requests.get(full_url)
data = response.json()

# Преобразование данных в байтовый поток
data_str = json.dumps(data, indent=4)  # Преобразуем данные в строку JSON
data_bytes = BytesIO(data_str.encode('utf-8'))  # Кодируем строку в байты и создаем поток
data_bytes.seek(0)  # Вернуться в начало потока

# Конфигурация MinIO клиента
s3_client = boto3.client(
    's3',
    endpoint_url=minio_endpoint,
    aws_access_key_id=minio_access_key,
    aws_secret_access_key=minio_secret_key
)

# Загрузка данных в MinIO
try:
    s3_client.upload_fileobj(data_bytes, bucket_name, object_name)
    print(f"Data successfully uploaded to MinIO bucket '{bucket_name}' as '{object_name}'")
except NoCredentialsError:
    print("Credentials not available")
except Exception as e:
    print(f"An error occurred: {e}")

