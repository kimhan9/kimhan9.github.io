# MkDocs

Material for MkDocs is a powerful documentation framework on top of MkDocs, a static site generator for project documentation.

##  Installation

Create a new virtual environment

```
python3 -m venv venv
```

Activate the environment

```
source venv/bin/activate
```

Install[^1]

```
pip install mkdocs-material
```

Bootstrap

```
mkdocs new .
```

Adding minimal configuration on `mkdocs.yml`

```
theme:
  name: material
```

## Preview as you write
```
source venv/bin/activate
mkdocs serve
```


[^1]: [mkdocs-material doc](https://squidfunk.github.io/mkdocs-material/guides/creating-a-reproduction/#environment)