# Python

## Virtual Environment

To create
```
python3 -m venv venv
```

To activate
```
source venv/bin/activate
pip install Flask
```

To install the requirements
```
pip install -r requirements.txt
```

## How to update Requirements file

Get into virtual environment

Install packages
```
pip install requests
```
Generate the requirements file
```
pip freeze > requirements.txt
```

## A Python app container example

```
FROM python:3.9.6-slim-buster

RUN useradd --create-home appuser
USER appuser

WORKDIR /app

COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt

COPY app.py .
EXPOSE 5000
CMD ["python3", "./app.py"]
```