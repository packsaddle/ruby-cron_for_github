module CronForGithub
  class CronForGithubError < StandardError; end
  class NeedSlugError < CronForGithubError; end
  class InvalidRefPrefixError < CronForGithubError; end
  class ReservedNamespaceError < CronForGithubError; end
end
