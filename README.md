# JSdk

A Ruby Gem that can be used to get information from the LOTR API found [here](https://the-one-api.dev/).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'j_sdk'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install j_sdk

## Usage

```ruby
require 'j_sdk'

lotr_api = JSdk::LOTR.new('API_TOKEN')

# get a list of movies
movies = lotr_api.get_movies()

# get a movie by id
id_move = '5cd95395de30eff6ebccde5b'
movie = lotr_api.get_movie(id_move)

# get list of quotes from movie, default is 10 per page but can be specified by supplying a `limit` and `page` perameter. Default is 10 and 0 respectively.
quotes = movie.get_quotes()
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Testing

The following command will run all of the test suites. We use VCR/WebMock, so upon first run when adding a new test it'll hit the live api and record the response to our fixtures. Subsequent runs will use those fixtures and be faster.

```
bundle exec rspec spec/
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ilovemysillybanana/j_sdk.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
