module CronForGithub
  class Ping
    NAMESPACE = 'cron_for_github'
    BASE = 'master'
    RESERVED_REFS = %w(
      tags
      gh-pages
      master
      branches
      trunk
      feature
      develop
      release
      hotfix
    )

    def ping(params)
      client = Client.new
      slug = decide_slug(params[:slug])
      head_ref = decide_head_ref(params[:base])
      cron_ref = decide_cron_ref(params[:namespace], :ping)

      latest_sha = client.latest_sha(slug, head_ref)
      client.create_ref(slug, cron_ref, latest_sha)
    end

    def decide_slug(text)
      text
    end

    def decide_head_ref(text)
      text = BASE if !text || text.empty?
      "heads/#{text}"
    end

    def decide_cron_ref(text, caller = nil)
      "heads/#{decide_cron_refs_prefix(text, caller)}/#{SecureRandom.uuid}"
    end

    def clear(params)
      client = Client.new
      slug = decide_slug(params[:slug])
      cron_refs_prefix = decide_cron_refs_prefix(params[:namespace])

      cron_refs = client.refs(slug, cron_refs_prefix)
      cron_refs
        .each do |clear_ref|
          client.delete_ref(slug, clear_ref)
        end
    end

    def decide_cron_refs_prefix(text, caller = nil)
      if caller == :ping
        text = NAMESPACE if !text || text.empty?
      else
        text = NAMESPACE if !text || text.empty?
      end
      "heads/#{text}/"
    end
  end
end
