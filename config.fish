set -x PATH /opt/homebrew/bin /opt/homebrew/opt/grep/libexec/gnubin $PATH

function get
  git $argv
end

function ls
  /bin/ls -FGh $argv
end

# these require bat (https://github.com/sharkdp/bat)
alias cat 'bat --paging=never'
alias more bat
alias man batman

alias hr 'history --merge'  # read and merge history from disk

# Use ISO dates and thousands separator in GNU coreutils (e.g., ls)
set -x TIME_STYLE long-iso
set -x BLOCK_SIZE "'1"

if not set -q abbrs_initialized
  set -U abbrs_initialized
  echo -n Setting abbreviations...

  abbr g 'git'
  abbr ga 'git add'
  abbr gb 'git branch'
  abbr gbl 'git blame'
  abbr gc 'git commit -m'
  abbr gco 'git checkout'
  abbr gcp 'git cherry-pick'
  abbr gd 'git diff'
  abbr gf 'git fetch'
  abbr gl 'git log'
  abbr gls 'git ls'
  abbr gll 'git ll'
  abbr gm 'git merge'
  abbr gp 'git pull'
  abbr gpr 'git pull --rebase'
  abbr gpu 'git push'
  abbr gr 'git remote'
  abbr gs 'git status'
  abbr gst 'git stash'

  abbr gbr 'git branch | grep -v master | xargs git branch -D'

  echo 'Done'
end

# move to top of repository
function rt
  cd (git rev-parse --show-cdup)
end

# set VI mode
fish_vi_key_bindings

function setjdk
  if test -n "$JAVA_HOME"
    removeFromPath "$JAVA_HOME/bin"
  end
  set -e JAVA_HOME
  set -gx JAVA_HOME (/usr/libexec/java_home -v $argv[1])
  set -gx PATH $JAVA_HOME/bin $PATH
end

function removeFromPath
  set -l idx 0
  for x in (seq (count $PATH))
    if test "$argv[1]" = "$PATH[$x]"
      set idx $x
    end
  end
  if test $idx -gt 0
    set -e PATH[$idx]
  end
end
