# The next line updates PATH for the Google Cloud SDK.
if [ -f '~/.local/lib/google-cloud-sdk/path.bash.inc' ]; then . '~/.local/lib/google-cloud-sdk/path.bash.inc'; fi

# Auto complete bash
for completion_bash in ~/.local/bash-completion/completions/* ; do 
    source "$completion_bash"
done

# Custom functions

function dotenv() {
    ############################
    # Load env from .env files #
    ############################

    if [ "$#" == 0 ]; then echo "ERROR: Missing env files"; exit 1; fi

    linesExceptCommentOrBlankLines() {
        cat ${i} | grep -v "^#" | grep -v "^[[:space:]]*$"
    }
    validRegex="^([\w]+)=(([^# \"\']*)|\"(.*)\"|\'(.*)\')( *)$"

    for i in $@; do
        # Check valid of env file
        if [ $( linesExceptCommentOrBlankLines | grep -vP "$validRegex" | wc -l) != "0" ]; then
            # If not include '='
            echo "ERROR: Invalid syntax in '${i}':"
            linesExceptCommentOrBlankLines | grep -vP "$validRegex" | sed 's/^/  * /'
            continue
        elif [ $( linesExceptCommentOrBlankLines | grep -P "$validRegex" | wc -l) == "0" ]; then
            echo "WARN: Blank env file - '${i}'"
            continue
        fi

        # Get envs from env file
        if [[ -z "$HIDE_ENVS" ]] ; then
            echo Get env from $i:
            linesExceptCommentOrBlankLines | grep -P "$validRegex" | sed 's/^/  * /'
        fi
        while read line; do 
            export "$line"
        done < <(linesExceptCommentOrBlankLines)
    done
}

# Load envs
HIDE_ENVS=1 dotenv ~/.local/envs/.env*

# Starship
eval "$(starship init bash)"