require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = 'amp-git'
    gem.summary = %Q{The git plugin for Amp.}
    gem.description = %Q{This gem provides git support to Amp. It is bundled with Amp itself.}
    gem.email = 'michael.j.edgar@dartmouth.edu'
    gem.homepage = 'http://github.com/michaeledgar/amp-git'
    gem.authors = ['Michael Edgar']
    gem.add_dependency 'amp-front', '>= 0.1.0'
    gem.add_dependency 'amp-core', '>= 0.1.0'
    gem.add_development_dependency 'rspec', '>= 1.2.9'
    gem.add_development_dependency 'yard', '>= 0'
    gem.add_development_dependency 'cucumber', '>= 0'
    gem.add_development_dependency 'minitest', '>= 1.7'
    gem.add_development_dependency 'devver-construct', '>= 1.1.0'
    # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts 'Jeweler (or a dependency) not available. Install it with: gem install jeweler'
end

require 'spec/rake/spectask'
Spec::Rake::SpecTask.new(:spec) do |spec|
  spec.libs << 'lib' << 'spec'
  spec.spec_files = FileList['spec/**/*_spec.rb']
end

Spec::Rake::SpecTask.new(:rcov) do |spec|
  spec.libs << 'lib' << 'spec'
  spec.pattern = 'spec/**/*_spec.rb'
  spec.rcov = true
end

require 'rake/testtask'
Rake::TestTask.new do |t|
  t.libs << 'test'
  t.test_files = FileList['test/**/test*.rb']
  t.verbose = true
end

task :spec => :check_dependencies

begin
  require 'cucumber/rake/task'
  Cucumber::Rake::Task.new(:features)

  task :features => :check_dependencies
rescue LoadError
  task :features do
    abort 'Cucumber is not available. In order to run features, you must: sudo gem install cucumber'
  end
end

task :default => [:spec, :test]

begin
  require 'yard'
  YARD::Rake::YardocTask.new
rescue LoadError
  task :yardoc do
    abort 'YARD is not available. In order to run yardoc, you must: sudo gem install yard'
  end
end
