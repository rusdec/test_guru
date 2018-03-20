class BadgeGrantService < BadgeGrant::Grantable
    add_rule strategy: :by_count,
             name: :complete_three_tests,
             event: :test_passage_complete,
             conditions: { count: 3 }

    add_rule strategy: :by_count,
             name: :complete_five_tests,
             event: :test_passage_complete,
             conditions: { count: 5 }

    add_rule strategy: :by_category,
             name: :complete_all_tests_of_ruby_category,
             event: :test_passage_complete,
             conditions: { category: 'Ruby' }

    add_rule strategy: :by_category,
             name: :complete_all_tests_of_any_category,
             event: :test_passage_complete,
             conditions: { category: '' }

    add_rule strategy: :by_manual,
             name: :first_attempt_success,
             event: :test_passage_complete
end
