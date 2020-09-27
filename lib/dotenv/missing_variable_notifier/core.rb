module Dotenv
  module MissingVariableNotifier
    class MissingEnvironmentVariableError < StandardError; end

    class Core
      def self.check_for_missing_environment_variables!
        example_file = ['.env.template', '.env.example'].detect { |example_file| Rails.root.join(example_file).exist? }
        example_file_contents = File.open(Rails.root.join(example_file), 'rb:bom|utf-8', &:read)
        example_file_variables = Dotenv::Parser.call(example_file_contents, false) # Thank you dotenv <3
        missing_variables = example_file_variables.keys.reject { |variable| ENV.has_key?(variable) }
        if missing_variables.any?
          raise MissingEnvironmentVariableError, "There are environment variables in your dotenv template file that are not set in your development environment: #{missing_variables.join(', ')}"
        end
      end
    end
  end
end
