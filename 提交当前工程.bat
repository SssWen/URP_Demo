@cd  !cd! 
git add .
git stash
git pull
git stash pop
git commit -m "剥离Unity Editor代码." -a
git push

start /b

pause