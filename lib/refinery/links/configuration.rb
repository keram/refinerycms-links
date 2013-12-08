module Refinery
  module Links
    include ActiveSupport::Configurable

    config_accessor :tabs

    self.tabs = %w(website email)
  end
end
