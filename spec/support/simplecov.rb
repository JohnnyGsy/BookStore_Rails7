require 'simplecov'

SimpleCov.start 'rails' do
  add_filter '/spec'

  add_group 'Models', 'app/models'
  add_group 'Controllers', 'app/controllers'
  add_group 'Decorators', 'app/decorators'
  add_group 'Presenters', 'app/presenters'
  add_group 'Queries', 'app/queries'
  add_group 'Services', 'app/services'
  add_group 'Forms', 'app/forms'
end
