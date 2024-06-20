echo hi bashrc

export declare -A git_modes=(
    ["commit"]="git add .; git commit -m 'auto commit $(date +'%Y/%m/%d %H:%M:%S')'; git push origin $_branch;"
    ["status"]="git status;"
    ["log"]="git log;"
)

export declare -A git_repositorys=(
    ["ufc"]='main C:\Users\wowp1\Desktop\git\ufc'
    ["linux"]='main C:\Users\wowp1\Desktop\git\linux'
    ["SUUMO"]='main C:\work\sts-4.15.3.RELEASE-workspace\Suumo'
    ["python"]='main C:\Users\wowp1\PycharmProjects\python'
    ["algorithm_Java"]='master C:\intelliJ_workplace\algorithm_Java'
    ["git"]='main C:\Users\wowp1\Desktop\git'
    ["all"]='#commit_all'
)


# echo $$ $0 $1 $* $#