module Refinery
  module Admin
    class LinksDialogController < ::Refinery::AdminDialogController

      def index
        @tabs = Refinery::Links.tabs
      end

    private

      def refinery_plugin
        @refinery_plugin ||= Refinery::Plugins['core']
      end

    end
  end
end
