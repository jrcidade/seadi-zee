FROM python:3.9

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

WORKDIR /code

COPY requirements.txt .

RUN pip install -r requirements.txt
RUN apt-get update
RUN apt-get -y install libgdal-dev
RUN apt-get -y install gdal-data
RUN apt-get -y install gdal-bin
COPY . .

CMD ["gunicorn", "--config", "gunicorn-cfg.py", "core.wsgi"]