class Admin < User
    has_many :test_authors
    has_many :created_tests, through: :test_authors, source: :test
end
