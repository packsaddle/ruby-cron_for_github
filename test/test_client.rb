require_relative 'helper'

module CronForGithub
  class TestClient < Test::Unit::TestCase
    setup do
      @client = Client.new
    end
    sub_test_case '#remove_prefix_refs' do
      test 'not match' do
        assert_raise(InvalidRefPrefixError) do
          @client.remove_prefix_refs('foo/bar')
        end
      end
      test 'not match2' do
        assert_raise(InvalidRefPrefixError) do
          @client.remove_prefix_refs('refs/')
        end
      end
      test 'match' do
        input = 'refs/heads/ping/foo-bar'
        expected = 'heads/ping/foo-bar'
        assert do
          @client.remove_prefix_refs(input) == expected
        end
      end
    end
  end
end
