if not status --is-interactive
    exit
end

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export SHELL=/usr/local/bin/fish


set -U TERM xterm-256coor
export EDITOR=nvim

function tree
    find $argv[1] -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'
end
alias fishconfig="vim ~/.config/fish/config.fish"
alias vim="nvim"

# nodejs
set -g NODE_PATH "$HOME/.npm-packages/lib/node_modules" $NODE_PATH
set -g PATH (yarn global bin) /Users/will/Library/Python/bin /usr/local/sbin "./node_modules/.bin" "/Library/Frameworks/Python.framework/Versions/3.7/bin/" $PATH
set -g ANDROID_HOME $HOME/Library/Android/sdk
set -g PATH $ANDROID_HOME/tools $PATH
set -g PATH $ANDROID_HOME/tools/bin $PATH
set -g PATH $ANDROID_HOME/sdk/emulator $PATH
set -g PATH $ANDROID_HOME/platform-tools $PATH

set -x -U GOPATH $HOME/go
set -g PATH $GOPATH/bin $PATH
set -gx LOCALSTACK_API_KEY 5uhwlubifs

set __fish_git_prompt_showdirtystate yes
set __fish_git_prompt_describe_style branch
set __fish_git_prompt_showuntrackedfiles yes

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
    abbr --add --global g git
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
    git diff --color $argv | diff-so-fancy | less --tabs=4 -RFX
end

function fish_right_prompt
    __fish_git_prompt
end

# Defined in /Users/will/.config/fish/functions/fish_prompt.fish @ line 1
function fish_prompt
    test $SSH_TTY
    and printf (set_color red)$USER(set_color brwhite)'@'(set_color yellow)(prompt_hostname)' '
    test $USER = root
    and echo (set_color red)"#"

    if test (date -j '+%H') -gt 20
        echo -n (set_color white)(date -j "+%H:%M:%S")
    else
        if test (date -j '+%H') -eq 20
            echo -n (set_color white)(date -j "+%H:%M:%S")
        else
            echo -n (set_color black)(date -j "+%H:%M:%S")
        end
    end

    # Main
    echo -n ' ' (set_color cyan)(prompt_pwd) (set_color red)'❯'(set_color yellow)'❯'(set_color green)'❯ '
end

if not functions -q fisher
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end
set -g fish_user_paths /usr/local/opt/icu4c/bin $fish_user_paths
set -g fish_user_paths /usr/local/opt/icu4c/sbin $fish_user_paths

function caring-reminders
    z api
    ./scripts/run-script ./scripts/bitwerx-product-reminders.ts gula-api keys/api/config-prod ts-transpile --practiceId=8134BE20-53A9-44E3-99A1-A11EEAC29C6C --out caring-pet-product-reminders.csv --zone America/Los_angeles
end

function caring-appts
    z api
    ./scripts/run-script ./scripts/bitwerx-appt-reminders.ts gula-api keys/api/config-prod ts-transpile --practiceId=8134BE20-53A9-44E3-99A1-A11EEAC29C6C --out caring-pet-appt-reminders.csv --zone America/Los_angeles
end

function send-caring-reminders
    z api
    ./scripts/run-script ./scripts/send-bitwerx-reminders.ts gula-api keys/api/config-prod ts-transpile --pets caring-pet-product-reminders.csv $argv
end

function night
    kitty +kitten themes Bright Lights
end

function day
    kitty +kitten themes Tomorrow
end

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/will/Downloads/google-cloud-sdk/path.fish.inc' ]
    . '/Users/will/Downloads/google-cloud-sdk/path.fish.inc'
end

function invoke-lambda
    env AWS_PROFILE=gula AWS_DEFAULT_REGION=eu-west-1 aws lambda invoke \
        --cli-binary-format raw-in-base64-out \
        --function-name $argv[1] \
        --payload $argv[2] \
        response.json

    node -e 'console.log(JSON.parse(process.argv[1]))' (jq .body response.json) | jq .
end

set --universal nvm_default_version v16.16.0
