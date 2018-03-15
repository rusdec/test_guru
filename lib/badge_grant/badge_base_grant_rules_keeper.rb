module BadgeGrant
  module BadgeBaseGrantRulesKeeper
    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods
      private

      #
      # Strategy: by_count
      #
      def base_by_count_valid?(params)
        params[:user].uniq_completed_tests_ids.count >= params[:count]
      end

      def base_by_count(params)
        if base_by_count_valid?(params) && badge_grant_valid?(params)
          puts 'COUNT YES'
          grant_badge(grant_badge_params(params))
        else
          puts 'COUNT NO'
          false
        end
      end

      #
      # Strategy: by_category
      #
      def base_by_category_valid?(params)
        test_ids = params[:user].uniq_completed_tests_ids
        tests_total = Test.by_category(params[:category].title).count
        completed_tests = Test.by_category_and_ids(params[:category].title,
                                                   test_ids).count

        completed_tests >= tests_total
      end

      def base_by_category(params)
        params[:user] ||= params[:resource].user
        if params[:category] == default_category
          # any category
          params[:category] = params[:resource].test.category
        end

        if badge_grant_valid?(params) && base_by_category_valid?(params)
          puts 'CATEGORY YES'
          grant_badge(grant_badge_params(params))
        else
          puts 'CATEGORY NO'
          false
        end
      end
    end
  end
end
