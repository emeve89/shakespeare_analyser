require 'webmock/rspec' 
require_relative "./support/vcr_setup"

WebMock.disable_net_connect!(allow_localhost: true)  
PROJECT_ROOT = File.expand_path("../..", __FILE__)

Dir.glob(File.join(PROJECT_ROOT, "lib", "*.rb")).each do |file|
  require file
end