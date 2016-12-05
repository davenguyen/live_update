module NFLLiveUpdate
  class Game
    FEED_URL = 'scorestrip/ss.xml'

    attr_reader :_data, :home, :id, :possession, :quarter, :starts_at,
      :clock, :type, :updated_at, :visitor

    def initialize(data)
      @_data = data
      @updated_at = Time.now
      parse
    end

    def final?
      quarter == 'F'
    end

    def started?
      quarter != 'P'
    end

    private

    def parse
      parse_id
      parse_type
      parse_starts_at
      parse_game_stats
      parse_teams
      parse_scores
    end

    def parse_game_stats
      @possession = _data[:p]
      @quarter = _data[:q]
      @clock = _data[:k]
    end

    def parse_id
      @id = _data[:eid]
    end

    def parse_scores
      @home_score = _data[:hs]
      @visitor_score = _data[:vs]
    end

    def parse_starts_at
      date = id[0..-3]
      time = _data[:t]
      tz = 'Eastern Time (US & Canada)'
      @starts_at = DateTime.parse("#{date} #{time} #{tz}") + 12.hours
    end

    def parse_teams
      @home = _data[:h]
      @home_name = _data[:hnn].capitalize
      @visitor = _data[:v]
      @visitor_name = _data[:vnn].capitalize
    end

    def parse_type
      # TODO: Figure out what preseason and playoff game types are
      @type = (_data[:gt] == 'REG') ? 'Regular' : _data[:gt]
    end
  end
end
