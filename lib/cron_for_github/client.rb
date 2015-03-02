module CronForGithub
  class Client
    def client
      @client ||= Octokit::Client.new(access_token: access_token)
    end

    def latest_sha(slug, head_ref)
      response = client.ref(slug, head_ref)
      logger.debug(response)
      response.object.sha
    end

    def create_ref(slug, expected_ref, sha)
      return_ref = client.create_ref(slug, expected_ref, sha)
      logger.info('create ref')
      logger.info(slug: slug, ref: expected_ref)
      logger.debug(return_ref)
      return_ref
    end

    def refs(slug, refs_prefix)
      client
        .refs(slug, refs_prefix)
        .map(&:ref)
        .map { |ref| remove_prefix_refs(ref) }
    end

    def delete_ref(slug, ref)
      return_ref = client.delete_ref(slug, ref)
      logger.info('delete ref')
      logger.info(slug: slug, ref: ref)
      logger.debug(return_ref)
      return_ref
    end

    def access_token
      ENV['GITHUB_ACCESS_TOKEN']
    end

    # remove refs/ from "refs/heads/ping/foo-bar"
    def remove_prefix_refs(ref)
      regex = %r{\Arefs/(?<stripped_ref>.+)\Z}
      match = regex.match(ref)
      fail InvalidRefPrefixError, "ref: #{ref}" unless match
      match[:stripped_ref]
    end

    def logger
      ::CronForGithub.logger
    end
  end
end
