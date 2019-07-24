if not status --is-interactive
  exit
end

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

set -U TERM xterm-256coor
export EDITOR=nvim

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


set -x PATH ~/.cargo/bin $PATH
set -x PATH ~/.yarn/bin $PATH

alias fvim="vim (fzf)"
alias recent="git checkout (git reflog | egrep -io 'moving from ([^[:space:]]+)' | awk '{ print \$3 }' | awk ' !x[\$0]++' | fzf)"

alias c="fzf-cd-widget"
alias git=hub
alias json="pbpaste | jq . -C | less -r"

if status --is-interactive
    abbr --add --global br "git branch ^/dev/null | sed -n '/\* /s///p'"
    abbr --add --global gcl 'git clone'
    abbr --add --global ga 'git add'
    abbr --add --global gap 'git add -p'
    abbr --add --global gf 'git fetch --all --prune'
    abbr --add --global gm "git merge"
    abbr --add --global g 'git'
    abbr --add --global gs 'git status'
    abbr --add --global gl 'git pull'
    abbr --add --global gr 'git rebase'
    abbr --add --global grc 'git rebase --continue'
    abbr --add --global grom 'git rebase origin/master'
    abbr --add --global gros 'git rebase origin/staging'
    abbr --add --global gp 'git push'
    abbr --add --global gpu 'git push --set-upstream'
    abbr --add --global gc 'git commit -v'
    abbr --add --global gcm 'git commit -v -m'
    abbr --add --global gb 'git branch'
    abbr --add --global gba 'git branch -a'
    abbr --add --global gcp 'git cherry-pick'
    abbr --add --global gco 'git checkout'
    abbr --add --global gcb 'git checkout -b'
    abbr --add --global gdel 'git branch -D'
    abbr --add --global glo "git log --oneline"
    abbr --add --global gnew "git log HEAD@{1}..HEAD@{0}"
    abbr --add --global gds "git diff --staged"
    abbr --add --global gsp "git stash pop"
    abbr --add --global gst "git stash"
    abbr --add --global gca "git commit --amend"
    abbr --add --global gcane "git commit --amend --no-edit"
end

function gd
    git diff --color $argv | diff-so-fancy  | less --tabs=4 -RFX
end

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
