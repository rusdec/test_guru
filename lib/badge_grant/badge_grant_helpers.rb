module BadgeGrant
  module BadgeGrantHelpers
    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods
      private

      def default_category
        ''
      end

      def method_name(params)
        "#{params[:strategy]}_#{params[:name]}".tr(' ', '_').downcase.to_sym
      end
    end
  end
end
