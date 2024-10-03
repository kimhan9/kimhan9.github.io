# Bash

## Check for a particular file size.
`du -sh <filename>`

## Find listening port on Mac

```
netstat -an | grep -i listen | grep 80
netstat -an | grep LISTEN | grep 80
```

## Set

```
set -x  # debug
set -e  # exit the script when there is an error
set -o pipeline  # exit when there is an error in pipe command
```

## AWK

```
# Grep column 1 and 4
echo employee.txt | awk '{print $1 $4}'
```