# Python

# Virtual Environment

1. To create
```
python3 -m venv venv
```

2. To activate
```
source venv/bin/activate
```

3. To install the requirements
```
pip install -r requirements.txt
```

# How to Update Requirements Files

1. Get into virtual environment
2. Install packages
```
pip install requests
```
3. Generate the requirements file
```
pip freeze > requirements.txt
```