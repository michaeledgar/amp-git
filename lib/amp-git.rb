class Amp::Plugins::Git < Amp::Plugins::Base
  def initialize(opts)
    @opts = opts
  end
  
  def load!
    puts "Loading amp-git..."
  end
end