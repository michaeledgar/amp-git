$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'rubygems'
require 'amp-front'
require 'amp-core'
require 'amp-git'
require 'spec'
require 'spec/autorun'

Amp::Plugins::Core.new.load!
Amp::Plugins::Git.new.load!
Spec::Runner.configure do |config|
  
end
