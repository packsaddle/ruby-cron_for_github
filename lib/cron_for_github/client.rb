module CronForGithub
  class Client
    def client
      @client ||= Octokit::Client.new(access_token: access_token)
    end

    def latest_sha(slug, head_ref)
      client.ref(slug, head_ref).object.sha
    end

    def create_branch(slug, expected_ref, sha)
      client.create_ref(slug, expected_ref, sha)
    end

    def access_token
      ENV['GITHUB_ACCESS_TOKEN']
    end
  end
end
