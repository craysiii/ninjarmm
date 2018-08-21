# NinjaRMM

An unofficial REST API wrapper for the NinjaRMM platform.

## Installation

Place in your Gemfile:
```ruby
gem 'ninjarmm'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ninjarmm

## Getting Started

Require NinjaRMM

```ruby
require 'ninjarmm'
```

Create a new Client instance

```ruby
client = NinjaRMM::Client.new access_id: 'x', secret_key: 'y'
```

You can also pass a Faraday adapter

```ruby
client = NinjaRMM::Client.new access_id: 'x', secret_key: 'y', adapter: :typhoeus
```

Start making calls to the API
```ruby
client.customer id: 25 # => "id"=>25, "name"=>"SOM_CUST", "description"=>"Some Customer"} 
```
## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/craysiii/ninjarmm.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
