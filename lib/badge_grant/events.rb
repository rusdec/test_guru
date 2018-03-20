module BadgeGrant
  module Events
    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods
      def events
        variable = :@@events
        class_variable_defined?(variable) ? class_variable_get(variable) : {}
      end
    end
  end
end
