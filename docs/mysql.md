# MySQL

## MySQL Definition

- The **Primary Key** constraint uniquely identifies each record in a table. Primary keys must contain UNIQUE values, and cannot contain NULL values.
- The **FOREIGN KEY** is a field in one table, refers to the **PRIMARY KEY** of another table.
- `KEY`s (INDEXes) are defined on certain columns to facilitate fast search on these columns. We would use `SHOW INDEX FROM tableName \G` to display the details on indexes.
```
CREATE INDEX email_index ON Users(email);
```

## MySQL Query

- [w3schools MySQL learning](https://www.w3schools.com/sql/default.asp)
- [NTU Lecture](https://www3.ntu.edu.sg/home/ehchua/programming/sql/SampleDatabases.html)
- [Sample MySQL DB](https://dev.mysql.com/doc/sakila/en/)

## MySQL Explain

- Add `EXPLAIN` before select statement show analyzing how queries are executed.