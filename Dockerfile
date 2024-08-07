FROM apache/airflow:2.9.3

# Добавьте это в начале вашего Dockerfile
ARG USER_ID
ARG GROUP_ID

# Добавьте это в ваш Dockerfile для создания пользователя с указанными UID и GID
RUN groupadd -g ${GROUP_ID} airflow && \
    useradd -u ${USER_ID} -g airflow -m airflow && \
    chown -R airflow:airflow /opt/airflow

USER airflow

RUN pip install clickhouse-driver
