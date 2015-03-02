require 'logger'
require 'octokit'
require 'securerandom'

require 'cron_for_github/client'
require 'cron_for_github/error'
require 'cron_for_github/ping'
require 'cron_for_github/version'

module CronForGithub
  ISSUE_URL = 'https://github.com/packsaddle/ruby-cron_for_github/issues/new'
  def self.default_logger
    logger = Logger.new(STDERR)
    logger.progname = 'CronForGithub'
    logger.level = Logger::WARN
    logger
  end

  def self.logger
    return @logger if @logger
    @logger = default_logger
  end

  class << self
    attr_writer :logger
  end
end
