class Admin < User
    validates :first_name, presence: true
    validates :last_name, presence: true

    has_many :test_authors
    has_many :created_tests, through: :test_authors, source: :test
end
