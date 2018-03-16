class BadgeGrantService < BadgeGrant::BadgeGrantable
    add_rule strategy: :by_count,
             name: :complete_three_tests,
             count: 3

    add_rule strategy: :by_count,
             name: :complete_five_tests,
             count: 5

    add_rule strategy: :by_category,
             name: :complete_all_tests_of_ruby_category,
             category: 'Ruby'

    add_rule strategy: :by_category,
             name: :complete_all_tests_of_any_category,
             category: ''

    add_event :test_passage_complete, :by_count_complete_three_tests
    add_event :test_passage_complete, :by_count_complete_five_tests
    add_event :test_passage_complete, :by_category_complete_all_tests_of_ruby_category
    add_event :test_passage_complete, :by_category_complete_all_tests_of_any_category
    add_event :test_passage_complete, :by_manual_first_attempt_success

end
