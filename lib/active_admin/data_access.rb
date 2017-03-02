module ActiveAdmin
  class ResourceController < BaseController
    module DataAccess
      def max_per_page
        @max_per_page || 10_000
      end
    end
  end
end