require 'thor'

module CronForGithub
  class CLI < Thor
    def self.exit_on_failure?
      true
    end

    desc 'version', 'Show the CronForGithub version'
    map %w(-v --version) => :version

    def version
      puts "CronForGithub version #{::CronForGithub::VERSION}"
    end

    desc 'clear', 'Delete cron branches'
    option :debug, type: :boolean, default: false
    option :verbose, type: :boolean, default: false
    option :slug, type: :string, required: true
    option :namespace, type: :string, default: Ping::NAMESPACE
    def clear
      if options[:debug]
        logger.level = Logger::DEBUG
      elsif options[:verbose]
        logger.level = Logger::INFO
      end
      logger.debug(options)
      puts 'clear!'
    end

    desc 'ping', 'Kick cron'
    option :debug, type: :boolean, default: false
    option :verbose, type: :boolean, default: false
    option :slug, type: :string, required: true
    option :namespace, type: :string, default: Ping::NAMESPACE
    option :base, type: :string, default: Ping::BASE
    def ping
      if options[:debug]
        logger.level = Logger::DEBUG
      elsif options[:verbose]
        logger.level = Logger::INFO
      end
      logger.debug(options)
      puts 'ping!'
    end

    no_commands do
      def logger
        ::CronForGithub.logger
      end
    end
  end
end
