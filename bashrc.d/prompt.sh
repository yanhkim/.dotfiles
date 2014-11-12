c_cyan=`tput setaf 6`
c_red=`tput setaf 1`
c_green=`tput setaf 2`
c_pink=`tput setaf 5`
c_bold=`tput bold`
c_off=`tput sgr0`

# global flag
git_prompt=0

branch_color() {
    color=""
    gitstatus=$(git status 2> /dev/null | sed -n '/:$/p' | tail -n 1)
    case "$gitstatus" in
        "Untracked files:" ) color=${c_pink};;
        "Changes not staged for commit:" ) color=${c_red};;
        "Changes to be committed:" ) color=${c_cyan};;
        * ) color=${c_green};;
    esac
    echo -ne $color
}

parse_branch() {
    if [ $git_prompt -eq 0 ] &&  git rev-parse --git-dir > /dev/null 2>&1
    then
        branchname="("$(branch_color)$(git branch 2> /dev/null | sed -n '/^\*/s/^\* //p')${c_off}") "
    else
        return 0
    fi
    echo -e $branchname
}

toggle_branch_parsing() {
    if [ $git_prompt -eq 0 ]
    then
        let git_prompt=1
    else
        let git_prompt=0
    fi
}

alias pstog=toggle_branch_parsing

export PS1='\u@\h:\[${c_bold}\]\W\[${c_off}\] $(parse_branch)\$ '
