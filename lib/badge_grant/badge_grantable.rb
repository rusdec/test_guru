module BadgeGrant
  class BadgeGrantable
    include BadgeGrant::BadgeGrantHelpers
    include BadgeGrant::BadgeGrantRuleStrategies
    include BadgeGrant::BadgeBaseGrantRulesKeeper
    include BadgeGrant::BadgeManualGrantRulesKeeper
    include BadgeGrant::BadgeGrantRulesGenerator
    include BadgeGrant::BadgeGranter
    include BadgeGrant::BadgeGrantEventsGenerator
  end
end
