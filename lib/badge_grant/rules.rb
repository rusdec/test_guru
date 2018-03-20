module BadgeGrant
  module Rules
    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods
      def rules
        match_pattern = /^(#{strategies.join('|')})/
        methods.select { |method| method.match(match_pattern) }
      end
      
      # Template rule: by_count
      #
      # === Example
      #
      #   add_strategy_by_count name: :complete_five_tests,
      #                         count: 5
      #
      def templated_strategy_by_count(input_params)
        self.class.send :define_method, method_name(input_params) do |params|
          params[:count] = input_params[:conditions][:count]
          condition_by_count_valid?(params) ? grant_badge_safely(params) : false
        end
      end

      # Template rule: by_category
      #
      # === Example
      #
      #   add_strategy_by_category name: :complete_all_tests_of_ruby_category,
      #                            category: 'Ruby'
      #
      def templated_strategy_by_category(input_params)
        category = input_params[:conditions][:category]
        return if Category.by_title(category).nil? && !category.empty?

        self.class.send :define_method, method_name(input_params) do |params|
          category = params[:resource].test.category.title if (category == default_category)
          params[:category] = category
          condition_by_category_valid?(params) ? grant_badge_safely(params) : false
        end
      end


      #
      # Manual rules
      #
      def by_manual_first_attempt_success(params)
        first_attempt_success_valid?(params) ? grant_badge_safely(params) : false
      end

      private

      #
      # Validators
      #
      
      def condition_by_count_valid?(params)
        params[:user].uniq_completed_tests_ids.count >= params[:count]
      end

      def condition_by_category_valid?(params)
        category = params[:category]
        test_ids = params[:resource].user.uniq_completed_tests_ids
        completed_tests = Test.by_category_and_ids(category, test_ids).count

        completed_tests >= Test.by_category(category).count
      end

      def first_attempt_success_valid?(params)
        test_passage = params[:resource]
        test_id = test_passage.test.id
        user = test_passage.user
        badge_id = params[:badge].id

        test_passage.passed? && user.have_not_badge?(badge_id) && user.first_attempt?(test_id)
      end

    end
  end
end
