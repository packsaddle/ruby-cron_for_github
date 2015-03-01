module CronForGithub
  class Ping
    NAMESPACE = 'cron'
    BASE = 'master'

    def ping(_params)
      puts 'ping!'
    end

    def clear(_params)
      puts 'clear!'
    end
  end
end
