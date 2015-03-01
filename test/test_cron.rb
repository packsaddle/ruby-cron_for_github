require_relative 'helper'

module CronForGithub
  class TestCron < Test::Unit::TestCase
    test 'version' do
      assert do
        !::CronForGithub::VERSION.nil?
      end
    end
  end
end
