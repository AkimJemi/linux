echo hi bashrc
alias tree='cmd //c tree //A //F | iconv -f CP932 -t UTF-8'


#declare -A ufc=(
#    ["_branch"]="main"
#    ["_repository_path"]="C:\Users\wowp1\Desktop\git\ufc"
#)

commit_command=('git add .' 'git commit -m 'auto commit $(date +'%Y/%m/%d %H:%M:%S')'' 'git push origin $_branch')
echo 11
echo ${commit_command[@]}
export declare -xA git_modes=(
    ["commit"]="${commit_command[@]}"
    ["status"]="git status"
    ["log"]="git log"
)
export declare -xA git_repositorys=(
    ["ufc"]='main C:\Users\wowp1\Desktop\git\ufc'
    ["linux"]='main C:\Users\wowp1\Desktop\git\linux'
    ["SUUMO"]='main C:\work\sts-4.15.3.RELEASE-workspace\Suumo'
    ["python"]='main C:\Users\wowp1\PycharmProjects\python'
    ["algorithm_Java"]='master C:\intelliJ_workplace\algorithm_Java'
    ["git"]='main C:\Users\wowp1\Desktop\git'
    ["all"]='#commit_all'
)

# echo $$ $0 $1 $* $#
# env | grep ^PATH | sed 's/:/\n/g'
