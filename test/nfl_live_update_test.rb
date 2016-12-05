require 'test_helper'

class LiveUpdate::Test < ActiveSupport::TestCase
  test 'schedule has games' do
    assert_equal schedule.games.count, 15
  end

  test 'game finality' do
    assert_equal schedule.game(game_id_1).final?, true
    assert_equal schedule.game(game_id_2).final?, false
  end
end
