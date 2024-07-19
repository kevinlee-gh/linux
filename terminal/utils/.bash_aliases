# docker-compose
alias docker-compose="docker compose"

# git comment prefix
alias branch="git branch --show-current"
alias feat='echo "feat($(branch))"'
alias fix='echo "fix($(branch))"'

# Fast move
alias "cdw"="cd ~/workspace"

export STARSHIP_CONFIG=~/.config/starship/starship.toml