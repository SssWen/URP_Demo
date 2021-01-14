@cd  !cd! 
git add .
git stash
git pull
git stash pop
git commit -m "auto: Update Assets" -a
git push

start /b

pause