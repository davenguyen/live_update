require 'live_update/game'
require 'live_update/schedule'
require 'open-uri'

module LiveUpdate
  BASE_URL = 'http://www.nfl.com/liveupdate/'

  ::ActiveSupport::Inflector.inflections(:en) do |inflect|
    inflect.acronym 'NFL'
  end
end
