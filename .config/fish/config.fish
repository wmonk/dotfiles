. ~/.config/z-fish/z.fish
source ~/.config/git-aliases.fish

export EDITOR=nvim

function tree
    find $argv[1] -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'
end
alias fishconfig="vim ~/.config/fish/config.fish"
alias vim="nvim"

function hot-reload
    echo "Applying hot-reloading commit, fingers crossed 🔥"
    git cherry-pick cf0c890a2cac670b50547eed04edfa2c965fa9f9
end

function aroundline
    set -l file (string split ':' $argv[1])
    set -l args (count $argv)
    if test $args -eq 2
        set around $argv[2]
    else
        set around 10
    end
    showlines (math $file[2] - $around) (math $file[2] + $around) $file[1]
end

function showlines
    cat $argv[3] | awk "NR >= $argv[1] && NR <= $argv[2]"
end

function git-freeze
    git commit -am 'FROZEN'
end

function git-unfreeze
    set -l matched (string match -r "FROZEN" (git log --oneline -n 1))
    if test -n "$matched"
        git reset --soft HEAD^
    else
        echo "No frozen commit found"
    end
end

function gcb
    git commit -m (string join "" "[" (git branch ^/dev/null | sed -n '/\* /s///p') "]" " " $argv[1])
end

# eval sh ~/.config/base16-shell/base16-solarized.dark.sh
# eval sh ~/.config/base16-shell/base16-ocean.light.sh

# nodejs
set -x NODE_PATH "$HOME/.npm-packages/lib/node_modules" $NODE_PATH
set -x PATH "./node_modules/.bin" $PATH
set -x PATH "/usr/local/sbin" $PATH

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

alias vpn='sudo -p "sudo password: " openconnect -g SKY-MINI-TOKEN -u $LOGNAME -m 1000 https://skyremoteaccess.bskyb.com'
alias lll='ls -1 | less'

#function fish_mode_prompt
#end

function fishy_vi_prompt
if set -q __fish_vi_mode
    switch $fish_bind_mode
      case default
        set_color red
        echo '◉'
      case insert
        set_color green
        echo '◉'
      case replace-one
        set_color green
        echo '◉'
      case visual
        set_color magenta
        echo '◉'
    end
    set_color normal
    echo -n ' '
  end
end

function fish_prompt
    set -l last_status $status
    set -l git_branch (git branch ^/dev/null | sed -n '/\* /s///p')

    z --add "$PWD"

    if [ $last_status -ne 0 ]
        set_color red
        echo -ne '\n▽ '
    else
        set_color cyan
        echo -ne '\n△ '
    end
    set_color yellow
    echo -ne (prompt_pwd)
    set_color normal

    if echo "$PWD" | grep -q -E 'vmcode|skybetdev'
        set_color normal
        echo " =>"
        return
    end

    if git ls-files >/dev/null ^/dev/null
        if git status | grep "nothing to commit" > /dev/null
            set_color green
        else
            set_color red
        end
    end

    echo (__fish_git_prompt)
    set_color normal
    echo -e '=> '
end

function gh --description 'Open the webpage for the current github repo/branch'
    set -l fetch_url (command git remote --verbose show -n origin ^/dev/null | command grep Fetch | cut -c 18- | string replace : / | rev | cut -c 5- | rev)

    #did we get an exit status?
    if [ $status -gt 0 ]
        echo 'Not a git repo.'
        return 1
    end

    if [ -z $fetch_url ]
        echo 'Not a git repo.'
        return 1
    end

    if [ -z (echo $fetch_url | grep github ) ]
        echo 'Not a github repo.'
        return 3
    end

    if [ (string match (git remote -v | awk '{ print $2 }') 'https' = 'https') ]
        open (git remote -v | awk '{ print $2 }')
    end

    set -l branch (command git rev-parse --abbrev-ref HEAD)

    if [ $branch = 'HEAD' ]
        # we couldn't find a branch or tag, so lets get a sha
        set branch (command git rev-parse HEAD)
    end

    set url (echo "$fetch_url/tree/$branch" | sed 's|git@github.com:\(.*\)\.git|https://github.com/\1|')

    open "http://$url/$argv"
end

alias vimconfig="nvim ~/.config/nvim/ts.vim"
#alias npm="npm -s"

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

function vf
  set files (locate -Ai -0 $argv | grep -z -vE '~$' | fzf --read0 -0 -1 -m)

  if [[ -n $files ]]
     vim -- $files
     print -l $files[1]
  end
end

