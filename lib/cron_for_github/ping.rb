module CronForGithub
  class Ping
    NAMESPACE = 'cron'
    BASE = 'master'

    def ping(params)
      client = Client.new
      slug = decide_slug(params[:slug])
      head_ref = decide_head_ref(params[:base])
      cron_ref = decide_cron_ref(params[:namespace])

      latest_sha = client.latest_sha(slug, head_ref)
      client.create_branch(slug, cron_ref, latest_sha)
    end

    def decide_slug(text)
      text
    end

    def decide_head_ref(text)
      text = BASE if !text || text.empty?
      "heads/#{text}"
    end

    def decide_cron_ref(text)
      text = NAMESPACE if !text || text.empty?
      "heads/#{text}/#{SecureRandom.uuid}"
    end

    def clear(_params)
      puts 'clear!'
    end
  end
end
