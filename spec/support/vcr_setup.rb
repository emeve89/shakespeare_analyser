require "vcr"

VCR.configure do |c|  
  c.cassette_library_dir = 'spec/vcr'
  c.hook_into :webmock
end

RSpec.configure do |c|
  c.around(:each, :vcr) do |example|
    name = example.metadata[:cassete_name]
    VCR.use_cassette(name) { example.call }
  end
end