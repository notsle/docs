# Git Alias
add to .gitconfig file.
find your files location with `git config --list --show-origin`
```
[alias]
  co = checkout
  ac = !git add -A && git commit
  pu = !"git fetch origin -v; git fetch upstream -v; git merge upstream/master"
  nuke = !sh -c 'git branch -D $1 && git push origin :$1' -
  release-notes = "!sh -c 'git log $(git rev-parse --abbrev-ref HEAD) --no-merges --not master | format_release_notes.rb' -"
  tagsbydate = for-each-ref --sort=-taggerdate --format='%(refname:short)' refs/tags
  previoustag = !sh -c 'git tagsbydate --count 2 | cut -f2 | sed -n 2p'
  lg = log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit
  markdownlog = log --color --pretty=format:'* %s `%Cred%h%Creset` - %C(bold blue)[%an](mailto:%ae)%Creset' --abbrev-commit --dense --no-merges --r$
  releasenotes = !sh -c 'git markdownlog ...`git previoustag`'
  ignore-clean = !"git rm -r --cached . && git add ."
  cleanup = "!git branch --merged| egrep -v '(^\\*|master|develop|release)' | xargs -n 1 git branch -d"
  gui = open -a Terminal .
  pr = pull --rebase
```