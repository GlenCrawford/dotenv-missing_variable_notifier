# dotenv-missing_variable_notifier

dotenv-missing_variable_notifier is a tiny (literally 6 lines of code) extension for [dotenv](https://github.com/bkeepers/dotenv) to notify you if your development environment is missing any environment variables listed in the example dotenv file in your Rails application. This is useful for projects that use an example file for their environment variables (usually `.env.template` or `.env.example`), which is most projects that use dotenv. Now you won't need to check for new environment variables after you do a `git pull`!

## Installation

Add the gem to your Gemfile _after_ `dotenv-rails`.

```ruby
group :development, :test do
  gem 'dotenv-rails'
  gem 'dotenv-missing_variable_notifier', '~> 1.0'
end
```

And then install:

```
bundle install
```

### Load order

`dotenv-missing_variable_notifier` is basically a tiny [Railtie](https://api.rubyonrails.org/classes/Rails/Railtie.html) that runs in a `before_configuration` callback while your application is booting. If it runs before dotenv does then it will complain that _every_ environment variable is missing, and it would be right! This means that you _must_ list `dotenv-missing_variable_notifier` in your Gemfile after `dotenv-rails`.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/GlenCrawford/dotenv-missing_variable_notifier.

## Acknowledgements

A huge thanks to the author(s) of [dotenv](https://github.com/bkeepers/dotenv) for their amazing gem.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
