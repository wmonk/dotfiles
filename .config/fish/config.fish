if not status --is-interactive
  exit
end

set -U TERM xterm-256coor
export EDITOR=nvim
export PYTHONPATH=$HOME/Code/minifort/services/passfort
export PASSFORT_ROOT=$HOME/Code/minifort/services/passfort
export RUST_SRC_PATH=/Users/will/.rustup/toolchains/nightly-x86_64-apple-darwin/lib/rustlib/src/rust/src

function tree
    find $argv[1] -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'
end
alias fishconfig="vim ~/.config/fish/config.fish"
alias vim="nvim"

# nodejs
set -g NODE_PATH "$HOME/.npm-packages/lib/node_modules" $NODE_PATH
set -g PATH "/usr/local/sbin" "./node_modules/.bin" $PATH

set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_describe_style 'branch'
set __fish_git_prompt_showuntrackedfiles 'yes'

function vimfind
    ag -l $argv[1] $argv[2] | xargs -o nvim
end

function vimlint
    eslint src | awk '/\.js/{print $1}' | xargs -o vim
end

function last_status
    echo -n $status
end

function rm
    command rm -i $argv
end

alias lll='ls -1 | less'

abbr br="git branch ^/dev/null | sed -n '/\* /s///p'"

set -x PATH ~/.cargo/bin $PATH
set -x PATH ~/.yarn/bin $PATH

alias fvim="vim (fzf)"
alias recent="git checkout (git reflog | egrep -io 'moving from ([^[:space:]]+)' | awk '{ print \$3 }' | awk ' !x[\$0]++' | fzf)"

alias c="fzf-cd-widget"
alias git=hub
alias json="pbpaste | jq . -C | less -r"

abbr gcl='git clone'
abbr ga='git add'
abbr gap='git add -p'
abbr gf='git fetch --all --prune'
abbr gm="git merge"
abbr g='git'
abbr gs='git status'
abbr gl='git pull'
abbr gr='git rebase'
abbr grc='git rebase --continue'
abbr grom='git rebase origin/master'
abbr gros='git rebase origin/staging'
abbr gp='git push'
abbr gpu='git push --set-upstream'
abbr gc='git commit -v'
abbr gcm='git commit -v -m'
abbr gb='git branch'
abbr gba='git branch -a'
abbr gcp='git cherry-pick'
abbr gco='git checkout'
abbr gcb='git checkout -b'
abbr gdel='git branch -D'
abbr glo="git log --oneline"
abbr gnew="git log HEAD@{1}..HEAD@{0}"
function gd
    git diff --color $argv | diff-so-fancy  | less --tabs=4 -RFX
end
abbr gds="git diff --staged"
abbr gsp="git stash pop"
abbr gst="git stash"
abbr gca="git commit --amend"
abbr gcane="git commit --amend --no-edit"

function fish_right_prompt
    __fish_git_prompt
end

# Defined in /Users/will/.config/fish/functions/fish_prompt.fish @ line 1
function fish_prompt
  test $SSH_TTY
  and printf (set_color red)$USER(set_color brwhite)'@'(set_color yellow)(prompt_hostname)' '
  test $USER = 'root'
  and echo (set_color red)"#"

  # Main
  echo -n (set_color brblack)(date -j "+%H:%M:%S") (set_color cyan)(prompt_pwd) (set_color red)'❯'(set_color yellow)'❯'(set_color green)'❯ '
end

# if type -q fizzygit
#     fizzygit
# end
