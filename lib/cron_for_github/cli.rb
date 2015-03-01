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
  end
end
