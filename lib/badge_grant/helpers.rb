module BadgeGrant
  module Helpers
    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods
      private

      def default_category
        ''
      end

      #
      # params = { strategy: symbol, name: symbol }
      # 
      # === Example
      #   
      #   method_name strategy: :by_count,
      #               name: :complete_five_tests
      #
      def method_name(params)
        "#{params[:strategy]}_#{params[:name]}".tr(' ', '_').downcase.to_sym
      end
    end
  end
end
