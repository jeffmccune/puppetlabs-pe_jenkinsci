require 'rake'

task :default => [:spec]

task :setup do
  system("puppet-module clean")
  system("bash -c 'cd ..; puppet-module install */resources/rtyler-jenkins*.tar.gz'")
end

desc "Run all module spec tests (Requires rspec-puppet gem)"
task :spec do
  system("rspec --format d spec")
end

desc "Build package"
task :build do
  system("puppet-module build")
end

desc "Clean packages"
task :clean do
  system("rm -rf pkg/*")
end
