module CronForGithub
  class Client
    def client
      @client ||= Octokit::Client.new(access_token: access_token)
    end

    def latest_sha(slug, head_ref)
      client.ref(slug, head_ref).object.sha
    end

    def create_ref(slug, expected_ref, sha)
      client.create_ref(slug, expected_ref, sha)
    end

    def refs(slug, refs_prefix)
      client
        .refs(slug, refs_prefix)
        .map(&:ref)
    end

    def delete_ref(slug, ref)
      client.delete_ref(slug, ref)
    end

    def access_token
      ENV['GITHUB_ACCESS_TOKEN']
    end
  end
end
