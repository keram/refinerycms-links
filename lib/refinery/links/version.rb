module Refinery
  module Links
    class Version
      @major = 0
      @minor = 0
      @tiny  = 1
      @build = nil

      class << self
        attr_reader :major, :minor, :tiny, :build

        def to_s
          [@major, @minor, @tiny, @build].compact.join('.')
        end
      end
    end
  end
end
