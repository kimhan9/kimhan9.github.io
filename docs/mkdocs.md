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

Install[^1][^2]

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

## Build Template
```
mkdocs build
```

## Preview as you write
```
source venv/bin/activate
mkdocs serve
```


[^1]: [Doc - mkdocs-material](https://squidfunk.github.io/mkdocs-material/guides/creating-a-reproduction/#environment)
[^2]: [Youtube - How To Create STUNNING Code Documentation With MkDocs Material Theme](https://www.youtube.com/watch?v=Q-YA_dA8C20)