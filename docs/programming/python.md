# Python

## Virtual Environment

To create
```
python3 -m venv venv
```

To activate
```
source venv/bin/activate
```

To install the requirements
```
pip install -r requirements.txt
```

## How to Update Requirements Files

Get into virtual environment

Install packages
```
pip install requests
```
Generate the requirements file
```
pip freeze > requirements.txt
```