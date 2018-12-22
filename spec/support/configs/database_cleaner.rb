# frozen_string_literal: true

RSpec.configure do |config|
  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
  DatabaseCleaner.strategy = :truncation
  DatabaseCleaner.clean

  config.before(:each) do
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.clean
  end
end
