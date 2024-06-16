echo hi bash_profile
bashrc=~/.bashrc
bash_profile=~/.bash_profile

#test -f ~/.profile && . ~/.profile
prl(){
test -f $bashrc && . $bashrc
test -f $bash_profile && . $bash_profile
}
catbashrc(){
cat $bashrc
}
catprofile(){
cat $bash_profile
}
autogit(){
if [ "$1" == "" ];then
  echo "please type git repository"
  return
fi
for path in "${!git_paths[@]}"; do
  if [ "$path" == "$1" ];then
    path_url=${git_paths[${path}]}
    echo "${path}:${path_url}"
    echo $path_url\`basename $bashrc`
    if [ "$1" == "git_practice" ]; then
      cp $bashrc $path_url\`basename $bashrc`
      cp $bash_profile $path_url\`basename $bash_profile`
    fi
    cd ${git_paths[${path}]}
    #git add .
    #git commit -m "auto commit $(date +'%Y/%m/%d %H:%M:%S')"
    #git push origin main
  fi
done
}
