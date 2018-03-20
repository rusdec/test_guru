module BadgeGrant
  class Grantable
    include BadgeGrant::Rules
    include BadgeGrant::Events
    include BadgeGrant::Helpers
    include BadgeGrant::Granter
    include BadgeGrant::Strategies
    include BadgeGrant::RuleCreator
    include BadgeGrant::EventCreator
  end
end
