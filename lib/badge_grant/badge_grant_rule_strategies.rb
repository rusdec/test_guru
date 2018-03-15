module BadgeGrant
  module BadgeGrantRuleStrategies
    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods
      def rules
        strategies = rule_strategies.concat(rule_manual_strategies)
        puts strategies
        match_pattern = /^(#{strategies.join('|')})/
        methods.select { |method| method.match(match_pattern) }
      end

      private

      def rule_strategies
        %i[by_count by_category]
      end

      def rule_manual_strategies
        %i[by_manual]
      end
    end
  end
end
