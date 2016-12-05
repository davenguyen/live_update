module NFLLiveUpdate
  class Schedule
    FEED_URL = 'scorestrip/ss.xml'

    attr_reader :_data, :_xml, :games, :updated_at, :week, :year

    def initialize
      @_xml = open(BASE_URL + FEED_URL).read
      @updated_at = Time.now
      @_data = Hash.from_xml(_xml).deep_symbolize_keys!
      parse
    end

    def game(id)
      games.find { |game| game.id == id }
    end

    private

    def parse
      @week = _data[:ss][:gms][:w].to_i
      @year = _data[:ss][:gms][:y].to_i
      parse_games
    end

    def parse_games
      @games = []
      _data[:ss][:gms][:g].each do |game|
        games << Game.new(game)
      end
    end
  end
end
