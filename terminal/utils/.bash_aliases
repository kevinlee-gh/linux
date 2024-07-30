# git comment prefix
alias branch="git branch --show-current"
alias feat='echo "feat($(branch))"'
alias fix='echo "fix($(branch))"'

# Fast move
alias "cdw"="cd ~/workspace"
alias "cdr"='cd $(git rev-parse --show-toplevel)'

export STARSHIP_CONFIG=~/.config/starship/starship.toml