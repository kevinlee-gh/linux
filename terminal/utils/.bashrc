# The next line updates PATH for the Google Cloud SDK.
if [ -f '~/.local/lib/google-cloud-sdk/path.bash.inc' ]; then . '~/.local/lib/google-cloud-sdk/path.bash.inc'; fi

# Add personal bin
export PATH=~/.local/bin:~/go/bin:/snap/bin:~/.local/lib/google-cloud-sdk/bin/:$PATH

# Auto complete bash
for completion_bash in ~/.local/bash-completion/completions/* ; do 
    source "$completion_bash"
done

# Custom functions

dotenv() {(
    ############################
    # Load env from .env files #
    ############################

    if [ "$#" == 0 ]; then echo "Missing env files"; fi

    envNoCommentAndBlank() {
        cat ${i} | grep -v "^#" | grep -v "^[[:space:]]*$"
    }
    validRegex="^([\w]+)=(([^# \"\']*)|\"(.*)\"|\'(.*)\')( *)$"

    for i in $@; do
        # Check valid of env file
        if [ $( envNoCommentAndBlank | grep -vP "$validRegex" | wc -l) != "0" ]; then
            # If not include '='
            echo "Invalid syntax in '${i}':"
            envNoCommentAndBlank | grep -vP "$validRegex" | sed 's/^/  * /'
            continue
        fi

        # Get envs from env file
        if [[ -z "$HIDE_ENVS" ]] ; then
            echo Get env from $i:
            envNoCommentAndBlank | grep -P "$validRegex" | sed 's/^/  * /'
        fi
        eval "export $( envNoCommentAndBlank | grep -P "$validRegex" )"
    done
)}

# Load envs
HIDE_ENVS=1 dotenv ~/.local/envs/.env*

# git comment prefix
alias branch="git branch --show-current"
alias feat='echo "feat($(branch))"'
alias fix='echo "fix($(branch))"'

# Fast move
alias "cdw"="cd ~/workspace"

# Starship
eval "$(starship init bash)"