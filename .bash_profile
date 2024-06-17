echo hi bash_profile
#test -f ~/.profile && . ~/.profile
bashrc=~/.bashrc
bash_profile=~/.bash_profile
space="               "
test -f $bashrc && . $bashrc
prl(){
  # test -f $bashrc && . $bashrc
  test -f $bash_profile && . $bash_profile
}
catbashrc(){
  cat $bashrc
}
catprofile(){
  cat $bash_profile
}
autogit(){
  if [ -z $1 ];then
    echo "please type git repository"
    showgitrepository
    return
  fi
  for path in "${!git_paths[@]}"; do
    branch=main
    if [ $1 != "all" ];then
      if [ "$path" == "$1" ];then
        git_commit $path
        break
      fi
    else
      git_commit $path
    fi
  done
}
git_commit(){
  path_url=${git_paths[${path}]}
  echo "[${path}${space:0:`expr ${#space}-${#path}`}]: ${path_url}"
  if [ "$1" == "linux" ]; then
    cp $bashrc $path_url/`basename $bashrc`
    cp $bash_profile $path_url/`basename $bash_profile`
  fi
  if [ "$1" == "algorithm_Java" ]; then
    branch=master
  fi
  cd ${git_paths[${path}]}
  git add .
  git commit -m "auto commit $(date +'%Y/%m/%d %H:%M:%S')"
  git push origin $branch
}

showgitrepository(){
  for path in "${!git_paths[@]}"; do
    path_url=${git_paths[${path}]}
    echo "[${path}${space:0:`expr ${#space}-${#path}`}]: ${path_url}"
  done
}
