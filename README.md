# NFL Live Update
Get NFL schedules and live scores through official feeds.

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'live_update'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install live_update
```

## Usage

```ruby
# Pull the latest schedule
schedule = LiveUpdate::Schedule.new

# Grab some stats about the schedule
schedule.week      #=> 14
schedule.year      #=> 2016
schedule.games     #=> [#<LiveUpdate::Game>, ...]

# Get the raw data:
schedule._data     #=> {:ss=>{:gms=>{:w=>"13", :y=>"2016", ...}}}
schedule._xml      #=> "<?xml version=\"1.0\" ..."

# Find game by ID and grab its stats
game = schedule.game(id)
game.started?      #=> true
game.final?        #=> false
game.home          #=> PHI
game.possession    #=> PHI
game.quarter       #=> 4
game.clock         #=> 02:13
game.home_score    #=> 24
game._data         #=> {:eid=>"2016120100", :gsis=>"57078", ...}
```

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
