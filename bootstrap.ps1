
git pull origin master;

git submodule update --init --recursive

Copy-Item -Path '.vim' -Destination "$env:userprofile\vimfiles" -Recurse -Force
Copy-Item -Path '.vimrc' -Destination "$env:userprofile\_vimrc"

Copy-Item -Path '.config' -Destination "$env:userprofile\.config" -Recurse -Force
