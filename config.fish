set -x JAVA_HOME /Library/Java/JavaVirtualMachines/jdk1.8.0_121.jdk/Contents/Home
set -x JRE_HOME /Library/Java/JavaVirtualMachines/jdk1.8.0_121.jdk/Contents/Home/jre
set -x M2_HOME /opt/apache-maven-3.5.0
set -x PATH $JAVA_HOME/bin $JRE_HOME/bin /usr/local/bin /sbin $M2_HOME/bin $PATH

function get
  git $argv
end

function ls
  /bin/ls -FGh $argv
end

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
