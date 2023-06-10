FROM python:3.11-slim

RUN export DEBIAN_FRONTEND=noninteractive && \
    apt-get update && \
    apt-get -y upgrade && \
    apt-get install -y --no-install-recommends \
    xcb \ 
    libglib2.0-0 \
    libgl1-mesa-glx && \
    apt-get -y clean && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir /src
WORKDIR /src

COPY requirements.txt .
COPY script.py .

COPY requirements.txt requirements.txt

RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt

ENV QT_X11_NO_MITSHM=1

CMD ["python", "script.py"]