# Corsair

A Rack middleware that adds the CORS Access-Control-Allow-Origin header to your application, even if the app raised an exception.

## Installation

Require Corsair in your application's Gemfile:
```ruby
gem "corsair"
```

In order for Corsair to do its thing it needs to be at the top of the middleware stack. For Rails, this will work nicely in your application.rb:
```ruby
config.middleware.insert_before 0, "Rack::Corsair"
```

## Options

By default, Corsair will add `Access-Control-Allow-Origin: *` to all your response headers. You can currently control which domain gets added instead of `*`, and which resources get the header added. You pass those options in a block, like this:
```ruby
config.middleware.insert_before 0, "Rack::Corsair" do |corsair|
  corsair.allow_origin "*"
  corsair.allow_resource :things
end
```

## License

Licensed under the MIT license. See the separate MIT-LICENSE file.
