set -x JAVA_HOME /Library/Java/JavaVirtualMachines/jdk1.8.0_121.jdk/Contents/Home
set -x JRE_HOME /Library/Java/JavaVirtualMachines/jdk1.8.0_121.jdk/Contents/Home/jre
set -x M2_HOME /opt/apache-maven-3.5.0
set -x PATH $JAVA_HOME/bin $JRE_HOME/bin /usr/local/bin /sbin $M2_HOME/bin $PATH

function get
  git $argv
end

function ct
  pushd ~/mf/core-server/dev/test/assemblies/container/target/centralmgmt-test-container-master-SNAPSHOT
end

function core
  pushd ~/mf/core-server/dev/test/assemblies/container/target/centralmgmt-test-container-master-SNAPSHOT/bin
  ./server console
end

function cb
  pushd ~/mf/core-server/dev
  mvn clean
  mvn clean -DbuildContainers -PfuncTests,testContainer
  mvn install -DskipTests
  if test $status -eq 0
    mvn install -DbuildContainers -PtestContainer,funcTests -DskipTests
  end
end

function rt
  cd (git rev-parse --show-cdup)
end

# set VI mode
fish_vi_key_bindings
