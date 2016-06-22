require 'open3'

integrationdeps = Array[]
File.open("integration-deps.txt", "r") do |f|
  f.each_line do |line|
    integrationdeps.push line
  end
end
integrationdeps.each do |dep|
    p dep
    snap.stageintegration = exec "apt-cache depends #{dep} | awk '/Depends:/{print$2}' | sed 's/^Depends: //g'"
    puts stdout
#    snap.stageintegration = IO.popen("apt-cache depends #{dep} | awk '/Depends:/{print$2}' | sed -e 's/Depends:/""/' | sed -e '/</ d' | sed -e 's/ |Depends:/''/' | sed -e 's/  Depends:/''/'.split('\n')")  { |f| puts f.gets }
#    snap.stageintegration = `apt-cache depends #{dep} | awk '/Recommends:/{print$2}' | sed -e '/</ d' | sed -e 's/ |Depends:/""/' | sed -e 's/  Depends:/""/`.split("\n")
#    snap.stageintegration = `apt-cache depends #{dep} | awk '/Suggests:/{print$2}' | sed -e '/</ d' | sed -e 's/ |Depends:/""/' | sed -e 's/  Depends:/""/`.split("\n")
end

