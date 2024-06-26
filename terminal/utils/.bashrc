# The next line updates PATH for the Google Cloud SDK.
if [ -f '~/.local/lib/google-cloud-sdk/path.bash.inc' ]; then . '~/.local/lib/google-cloud-sdk/path.bash.inc'; fi

# Add personal bin
export PATH=~/.local/bin:~/go/bin:/snap/bin:$PATH

# Auto complete bash
for completion_bash in ~/.local/bash-completion/completions/* ; do 
    source "$completion_bash"
done

# Custom func
function dotenv() {
    if [ "$#" == 0 ]; then 
        echo "Missing env files"
    fi

    for i in $@; do
        echo Get env from $i
        echo $(grep -v '^#' ${i} | xargs)
        export $(grep -v '^#' ${i} | xargs)
    done
}

# git comment prefix
alias branch="git branch --show-current"
alias feat='echo "feat($(branch))"'
alias fix='echo "fix($(branch))"'

# Fast move
alias "cdw"="cd ~/workspace"