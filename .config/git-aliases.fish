# Aliases
abbr gcl='git clone'
abbr ga='git add'
abbr gap='git add -p'
abbr gall='git add -A'
abbr gf='git fetch --all --prune'
abbr gft='git fetch --all --prune --tags'
abbr gfv='git fetch --all --prune --verbose'
abbr gftv='git fetch --all --prune --tags --verbose'
abbr gus='git reset HEAD'
abbr gm="git merge"
abbr g='git'
abbr get='git'
abbr gst='git status'
abbr gs='git status'
abbr gss='git status -s'
abbr gsu='git submodule update --init --recursive'
abbr gl='git pull'
abbr gpr='git pull --rebase'
abbr gr='git rebase'
abbr grc='git rebase --continue'
abbr grom='git rebase origin/master'
abbr gp='git push'
abbr gpo='git push origin'
abbr gpu='git push --set-upstream'
abbr gpom='git push origin master'
abbr gc='git commit -v'
abbr gca='git commit -v -a'
abbr gcm='git commit -v -m'
abbr gci='git commit --interactive'
abbr gb='git branch'
abbr gba='git branch -a'
abbr gbt='git branch --track'
abbr gcount='git shortlog -sn'
abbr gcp='git cherry-pick'
abbr gco='git checkout'
abbr gcb='git checkout -b'
abbr gct='git checkout --track'
abbr gdel='git branch -D'
abbr gmu='git fetch origin -v; git fetch upstream -v; git merge upstream/master'
abbr gll='git log --graph --pretty=oneline --abbrev-commit'
abbr gg="git log --graph --pretty=format:'%C(bold)%h%Creset%C(magenta)%d%Creset %s %C(yellow)<%an> %C(cyan)(%cr)%Creset' --abbrev-commit --date=relative"
abbr glo="git log --oneline"
abbr ggs="gg --stat"
abbr gsl="git shortlog -sn"
abbr gw="git whatchanged"
abbr gt="git tag"
abbr gta="git tag -a"
abbr gtd="git tag -d"
abbr gtl="git tag -l"
# From http://blogs.atlassian.com/2014/10/advanced-git-abbres/
# Show commits since last pull
abbr gnew="git log HEAD@{1}..HEAD@{0}"
# Add uncommitted and unstaged changes to the last commit
abbr gcaa="git commit -a --amend -C HEAD"
abbr ggui="git gui"

abbr gd="git diff"
abbr gds="git diff --staged"
