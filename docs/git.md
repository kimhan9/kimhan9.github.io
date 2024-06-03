# Git

## Push an existing repository to new repository

Get current remote repo URL
```
git remote -v
```

Set new remote repo
```
git remote set-url origin https://github.com/kimhan9/my-eatgo.git
```

Push to repo
```
git branch -M main
git push -u origin main
```

## Git command

- List which files are staged, unstage and untracked.
```
git status
```

- Displays committed snapshots.
```
git log
git log --oneline

# Display last 3 commits
git log -n 3
```

- Changes on a individual file.
```
git blame <filename>
git blame README.md
```

- Undo a file
```
# Undo last change
git revert  HEAD
```

- Reset to a specific commit
```
git reset --hard <ID>
```