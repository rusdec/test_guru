module BadgeGrant
  module BadgeGranter
    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods
      def call(context)
        context[:flash] ||= false
        return if events[context[:event]].nil?
        grant_badges(event: context[:event],
                     flash: context[:flash],
                     rules: events[context[:event]][:rules],
                     params: context[:params])
      end

      private

      def grant_badges(params)
        rules = params[:rules]
        flash = params[:flash]
        params = params[:params]

        rules.each do |rule|
          params[:badge] = Badge.active.find_by(rule: rule)
          next if params[:badge].nil?
          create_flash_message(flash, params[:badge]) if send(rule, params) && flash
        end
      end

      def create_flash_message(flash, badge)
        flash[badge.rule] = I18n.t('badges.was_granted', badge_title: badge.title)
      end

      def grant_badge(badge)
        UserBadge.create!(badge)
      end

      def grant_badge_params(params)
        { user: params[:user],
          badge: params[:badge],
          resource: params[:resource],
          resource_type: resource_type(params[:resource]) }
      end

      def resource_type(resource)
        resource.class.to_s
      end

      def badge_grant_valid?(params)
        return true if params[:badge].is_multiple
        return true unless params[:user].have_badge?(badge_id: params[:badge].id)

        false
      end
    end
  end
end
