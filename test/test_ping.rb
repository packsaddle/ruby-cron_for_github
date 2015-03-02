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

    sub_test_case '#decide_head_ref' do
      test 'no params' do
        assert do
          @ping.decide_head_ref(nil) == 'heads/master'
        end
      end
      test 'empty params' do
        assert do
          @ping.decide_head_ref('') == 'heads/master'
        end
      end
      test 'set anything' do
        assert do
          @ping.decide_head_ref('anything') == 'heads/anything'
        end
      end
    end
  end
end
