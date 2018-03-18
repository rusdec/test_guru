module BadgeGrant
  module Strategies
    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods

      private

      def strategies
        templated_strategies.concat(manual_strategies)
      end

      def templated_strategies
        %i[by_count by_category]
      end

      def manual_strategies
        %i[by_manual]
      end
    end
  end
end
