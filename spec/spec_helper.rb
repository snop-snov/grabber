require 'rspec'
require 'webmock/rspec'
require 'celluloid/test'
require 'vcr'

Celluloid.boot

VCR.configure do |c|
  c.cassette_library_dir = 'spec/fixtures/vcr_cassettes'
  c.hook_into :webmock
  c.default_cassette_options = { record: :new_episodes }
  c.configure_rspec_metadata!
end

RSpec.configure do |c|
  c.order = :random
end