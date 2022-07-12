require 'spec_helper'
require 'pundit/rspec'
require_relative '../config/environment'

abort('The Rails environment is running in production mode!') if Rails.env.production?
require 'rspec/rails'

Dir[Rails.root.join('spec/support/**/*.rb')].sort.each { |f| require f }

ActiveRecord::Migration.maintain_test_schema!

OmniAuth.config.test_mode = true

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  config.use_transactional_fixtures = true

  config.infer_spec_type_from_file_location!

  config.filter_rails_from_backtrace!

  config.include Devise::Test::ControllerHelpers, type: :controller

  config.include Devise::Test::IntegrationHelpers, type: :request

  config.include Devise::Test::IntegrationHelpers, type: :feature
end
