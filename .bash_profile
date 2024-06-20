echo hi bash_profile
#test -f ~/.profile && . ~/.profile
bashrc=~/.bashrc
bash_profile=~/.bash_profile
space="               "
test -f $bashrc && . $bashrc

PRL(){
  # test -f $bashrc && . $bashrc
  test -f $bash_profile && . $bash_profile
}


CATBASHRC(){
  cat $bashrc
}


CATPROFILE(){
  cat $bash_profile
}

AUTOGIT(){
  ret=""
  _mode=$1
  if [ "$_mode" == "" ];then CHECK_MODE; return; fi

  _repository=$2
  _repository_info=${git_repositorys[$_repository]}
  if [ "$_repository_info" == "" ];then CHECK_REPOSITORY; return; fi

  _EXECUTE_COMMAND=${git_modes[$_mode]}
  _repository_info=(${_repository_info})
  _branch=${_repository_info[0]}
  _repository_path=${_repository_info[1]}

  if [ "$_repository" == "all" ];then
    for _repository in "${!git_repositorys[@]}"; do
      GIT_COMMIT
    done
    return
  fi

  [ "$_mode" == "status" ] && GIT_STATUS
  [ "$_mode" == "commit" ] && GIT_COMMIT
  [ "$ret" != "OK" ] && echo 'not defined repository'
}


GIT_STATUS(){
  CHECK_REPOSITORY $_repository
}


GIT_COMMIT(){
  echo "[${_repository}${space:0:`expr ${#space}-${#_repository}`}]: ${_repository_path}"
  if [ "$_repository" == "linux" ]; then
    cp $bashrc $_repository_path/`basename $bashrc`
    cp $bash_profile $_repository_path/`basename $bash_profile`
  fi
  cd "${_repository_path}"
  echo $_EXECUTE_COMMAND
  #$_EXECUTE_COMMAND
  git add .
  git commit -m "auto commit $(date +'%Y/%m/%d %H:%M:%S')"
  git push origin $_branch
  ret="OK"
}


SHOW_GIT_REPOSITORY_LIST(){
  for _repository_ in "${!git_repositorys[@]}"; do echo "[${_repository_}${space:0:`expr ${#space}-${#_repository_}`}]: ${git_repositorys[${_repository_}]}"; done;
}

SHOW_GIT_MODE_LIST(){
  for _mode_ in "${!git_modes[@]}"; do echo "[${_mode_}${space:0:`expr ${#space}-${#_mode_}`}]: ${git_modes[${_mode_}]}"; done;
}

CHECK_REPOSITORY(){
  if [ -z $_repository_info ];then
    echo "please type git repository"
    SHOW_GIT_REPOSITORY_LIST
  fi
}

CHECK_MODE(){
  if [ -z $_mode];then
    echo "please type git mode"
    SHOW_GIT_MODE_LIST
  fi
}
