$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'rubygems'
require 'amp-front'
require 'amp-core'
require 'amp-git'
require 'test/unit'
AmpTestCase = Test::Unit::TestCase
