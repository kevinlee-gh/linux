# git comment prefix
# alias branch="git branch --show-current"
# alias feat='echo "feat($(branch))"'
# alias fix='echo "fix($(branch))"'

export PATH=~/.local/bin:~/go/bin:~/.local/lib/google-cloud-sdk/bin/:$PATH

# Fast move
alias cdw="cd ~/workspace"
alias cdr='cd $(git rev-parse --show-toplevel)'

export VISUAL=nvim
export EDITOR=nvim

export STARSHIP_CONFIG=~/.config/starship/starship.toml
