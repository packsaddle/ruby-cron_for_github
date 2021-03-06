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
      setup_logger(options)

      params = {
        slug: options[:slug],
        namespace: options[:namespace]
      }
      Ping.new.clear(params)
    rescue StandardError => e
      suggest_messages(options)
      raise e
    end

    desc 'ping', 'Kick cron'
    option :debug, type: :boolean, default: false
    option :verbose, type: :boolean, default: false
    option :slug, type: :string, required: true
    option :namespace, type: :string, default: Ping::NAMESPACE
    option :base, type: :string, default: Ping::BASE
    def ping
      setup_logger(options)

      params = {
        slug: options[:slug],
        namespace: options[:namespace],
        base: options[:base]
      }
      Ping.new.ping(params)
    rescue StandardError => e
      suggest_messages(options)
      raise e
    end

    no_commands do
      def logger
        ::CronForGithub.logger
      end

      def setup_logger(options)
        if options[:debug]
          logger.level = Logger::DEBUG
        elsif options[:verbose]
          logger.level = Logger::INFO
        end
        logger.debug(options)
      end

      def suggest_messages(options)
        logger.error 'Please report from here:'
        logger.error ISSUE_URL
        logger.error 'options:'
        logger.error options
      end
    end
  end
end
