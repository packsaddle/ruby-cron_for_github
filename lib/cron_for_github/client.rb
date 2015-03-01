module CronForGithub
  class Client
    def client
      @client ||= Octokit::Client.new(access_token: access_token)
    end

    def access_token
      ENV['GITHUB_ACCESS_TOKEN']
    end
  end
end
