# ChatgptErr

The `ChatgptErr` gem provides a middleware to handle exceptions in Rails applications. When an exception occurs, the middleware sends the error message to OpenAI's GPT-3 model, which generates an explanation for the error that can be presented to the user.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'chatgpterr'
```

And then execute:

```ruby
$ bundle install
```

Or install it yourself as:

```ruby
$ gem install chatgpterr
```

## Usage

To use `ChatgptErr` in your Rails application, add the following line to your `config/application.rb` file:

```ruby
config.middleware.use ChatgptErr::Middleware
```

That's it! Now when an exception occurs in your application, the middleware will automatically generate an explanation for the error message using OpenAI's GPT-3 model.

## Configuration

`ChatgptErr` requires an OpenAI API access token to work properly. You can configure the access token and other options using the `ChatgptErr.configure` method. For example:

```ruby
ChatgptErr.configure do |config|
  config.access_token = 'YOUR_ACCESS_TOKEN'
  config.organization_id = 'YOUR_ORGANIZATION_ID' # optional
end
```

or

```ruby
ChatgptErr.configuration.access_token = 'YOUR_ACCESS_TOKEN'
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/amonrreal/chatgpterr. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/amonrreal/chatgpterr/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the ChatgptErr project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/amonrreal/chatgpterr/blob/master/CODE_OF_CONDUCT.md).
