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

## Typical interview question

1. Different between list and tuple?

List
  - Mutable: Element can be change after creation
  - Memory usage: Consume more memory
  - Performance: Slower iteration compared to tuples but better for insertion and deletion operations

Tuple:
  - Immutable: Elements cannot be changed after creation
  - Memory Usage: Consumes less memory
  - Performance: Faster iteration compared to lists but lacks the flexibility of lists

2. What is __init__() in Python?

  - Initalize an object state
  - Assign value to object properties

3. Difference between a mutable data type and an immutable data type

Mutable data types:
  - Data type can be modified after creation
  - Examples: List, Dictionary, Set
  - Chracteristics: Element can be added, removed or changed
  - Use case: Suitable for collection of item that frequently update needed

Immutable data types:
  - Data type cannot be modified after creation
  - Examples: tuple, string, numeric (int, float)
  - Chracteristics: Element cannot be change once set; any operation that appear to modify an immutable object will create a new object

4. Explain List, Dict and Tuple

List
```
my_list = [1, 2, 3, 4, 5]
```

Dictionary
```
my_dict = {1, 2, 3, 4, 5}
```

Tuple
```
my_tuple = (1, 2, 3, 4, 5)
```