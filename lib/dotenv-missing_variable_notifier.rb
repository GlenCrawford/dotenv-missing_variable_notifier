if defined?(Rails) && defined?(Dotenv) && Rails.env.development?
  require 'dotenv/missing_variable_notifier/railtie'
  require 'dotenv/missing_variable_notifier/core'
end
