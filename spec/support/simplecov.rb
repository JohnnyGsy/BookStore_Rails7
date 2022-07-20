require 'simplecov'

SimpleCov.start 'rails' do
  add_filter '/spec'
  add_filter '/channels'
  add_filter '/jobs'
  add_filter '/mailers'
  add_filter '/helpers'

  add_group 'Models', 'app/models'
  add_group 'Controllers', 'app/controllers'
  add_group 'Decorators', 'app/decorators'
  add_group 'Presenters', 'app/presenters'
  add_group 'Queries', 'app/queries'
  add_group 'Services', 'app/services'
  add_group 'Forms', 'app/forms'
end
