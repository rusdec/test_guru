module BadgeGrant
  module RuleCreator
    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods
      private

      #
      # params = { strategy: symblol, name: symbol, event: :symbol, conditions: hash }
      #
      # === Examples
      #
      #   add_rule  strategy: :by_count,
      #             conditions: { count: 5 }
      #             name: :complete_five_tests,
      #             event: :test_passage_completed
      #
      #   add_rule  strategy: :by_category,
      #             conditions: { category: 'Ruby' }
      #             name: :complete_all_ruby_tests,
      #             event: :test_passage_completed
      #
      #   add_rule  strategy: :by_manual,
      #             name: :first_attempt_success,
      #             event: :test_passage_completed
      #
      def add_rule(params)
        return if params[:name].nil?
        return if self.class.instance_methods.include?(method_name(params))
        if templated_strategies.include?(params[:strategy])
          send "templated_strategy_#{params[:strategy]}", params
        end

        send 'add_event', { event: params[:event],
                            rule: method_name(params) } unless params[:event].nil?
      end

    end
  end
end
