module Refinery
  module Links
    class Engine < ::Rails::Engine
      isolate_namespace Refinery
      engine_name :refinery_links

    end
  end
end

