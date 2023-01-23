require 'spec_helper'

ENV['RAILS_ENV'] ||= 'test'

require File.expand_path('../config/environment', __dir__)

abort('The Rails environment is running in production mode!') if Rails.env.production?

require 'rspec/rails'

Dir[Rails.root.join('lib/*.rb')].sort.each { |file| require file }
Dir[Rails.root.join('lib/*/*.rb')].sort.each { |file| require file }

begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end

RSpec.configure do |config|
  Dir[File.join(__dir__, 'factories', '*.rb')].sort.each { |file| require file }
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = false

  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
  config.include ActionDispatch::TestProcess::FixtureFile, type: :request
  config.include ActionView::Helpers::NumberHelper

  ActiveJob::Base.queue_adapter = :test
end

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end
