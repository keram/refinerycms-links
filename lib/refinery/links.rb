require 'refinerycms-core'

module Refinery
  module Links
    require 'refinery/links/engine'
    require 'refinery/links/configuration'

    class << self
      def root
        @root ||= Pathname.new(File.expand_path('../../../', __FILE__))
      end
    end
  end
end
