require_relative 'helper'

module CronForGithub
  class TestPing < Test::Unit::TestCase
    setup do
      @ping = Ping.new
    end

    sub_test_case '#decide_slug' do
      test 'anything' do
        anything = 'anything'
        assert do
          @ping.decide_slug(anything) == anything
        end
      end
    end
  end
end
