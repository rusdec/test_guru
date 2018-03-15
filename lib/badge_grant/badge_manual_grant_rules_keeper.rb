module BadgeGrant
  module BadgeManualGrantRulesKeeper
    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods
      ##
      # Startegies: from the first time pass the test
      ##
      def by_manual_first_attempt_success(params)
        if badge_grant_valid?(params) && first_attempt_success_valid?(params)
          puts 'FIRST YES'
          grant_badge(grant_badge_params(params))
        else
          puts 'FIRST NO'
          false
        end
      end

      private

      def first_attempt_success_valid?(params)
        test_id = params[:resource].test.id
        user = params[:user]
        badge_params = { badge_id: params[:badge].id,
                         test_passage_id: params[:resource].id }

        user.first_attempt?(test_id) && params[:resource].success? && user.have_not_badge?(badge_params)
      end
    end
  end
end
