lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dotenv/missing_variable_notifier/version'

Gem::Specification.new do |spec|
  spec.name          = 'dotenv-missing_variable_notifier'
  spec.version       = Dotenv::MissingVariableNotifier::VERSION
  spec.authors       = ['Glen Crawford']

  spec.summary       = 'Tiny extension for dotenv to notify you if you are missing any environment variables listed in your example file.'
  spec.homepage      = 'https://github.com/GlenCrawford/dotenv-missing_variable_notifier'
  spec.license       = 'MIT'

  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |file| file.match(%r{^(spec)/}) }
  end

  spec.require_paths = ['lib']

  # Runtime versions deliberately left unspecified.
  spec.add_runtime_dependency 'dotenv-rails'
  spec.add_runtime_dependency 'railties'

  spec.add_development_dependency 'bundler', '~> 2.1'
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rspec', '~> 3.9'
end
