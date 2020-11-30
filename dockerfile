FROM python:3.6

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        mysql-common \
    && rm -rf /var/lib/apt/lists/*
WORKDIR /usr/src/app
COPY requirements.txt ./
RUN pip install -r requirements.txt
COPY ./guest/ .
EXPOSE 8001
ENTRYPOINT ["/bin/bash", "start.sh"]
CMD ["python", "manage.py", "runserver", "0.0.0.0:8001"]
