module Dotenv
  module MissingVariableNotifier
    class Railtie < Rails::Railtie
      config.before_configuration { Dotenv::MissingVariableNotifier::Core.check_for_missing_environment_variables! }
    end
  end
end
