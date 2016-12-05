module LiveUpdate
  class Game
    FEED_URL = 'scorestrip/ss.xml'
    GAME_TYPES = { CON: 'Conference', DIV: 'Division', PRO: 'Pro Bowl',
                   REG: 'Regular', WC: 'Wild Card' }.with_indifferent_access

    attr_reader :_data, :clock, :home, :home_name, :home_score, :id,
      :possession, :quarter, :starts_at, :type, :updated_at, :visitor,
      :visitor_name, :visitor_score

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
      @type = GAME_TYPES[_data[:gt]] || _data[:gt]
    end
  end
end
