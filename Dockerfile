FROM python:3.7

COPY sources.list /etc/apt/sources.list
RUN apt-get update && apt-get install ffmpeg libsm6 libxext6 nvidia-cuda-toolkit -y && /usr/local/bin/python -m pip install --upgrade pip && mkdir /app && mkdir /app/images && mkdir /app/documents

WORKDIR /app
COPY requirements.txt /app/requirements.txt
RUN pip install -r /app/requirements.txt
COPY . /app

CMD python /app/bot.py
