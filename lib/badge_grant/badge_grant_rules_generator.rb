module BadgeGrant
  module BadgeGrantRulesGenerator
    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods
      private

      # === Examples
      #
      #   add_rule(strategy: :by_count, name: :complete_five_tests, count: 5)
      #   add_rule(strategy: :by_category, name: :complete_all_ruby_tests, category: 'Ruby')
      #
      def add_rule(params)
        return unless rule_strategies.include?(params[:strategy])
        return if self.class.instance_methods.include?(method_name(params))

        send "add_strategy_#{params[:strategy]}", params
      end

      # === Example
      #   add_strategy_by_count(name: :complete_five_tests, count: 5)
      #
      def add_strategy_by_count(input_params)
        self.class.send :define_method, method_name(input_params) do |params|
          params[:count] = input_params[:count]
          base_by_count(params)
        end
      end

      # === Example
      #
      #   add_strategy_by_category(name: :complete_all_tests_of_ruby_category, category: 'Ruby')
      #
      def add_strategy_by_category(input_params)
        self.class.send :define_method, method_name(input_params) do |params|
          params[:category] = input_params[:category]
          params[:category] = Category.by_title(params[:category]) unless params[:category] == default_category
          base_by_category(params) unless params[:category].nil?
        end
      end
    end
  end
end
