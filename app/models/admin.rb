class Admin < User
  has_many :test_authors
  has_many :created_tests, through: :test_authors, source: :test

  scope :contactable, -> { where(email_contactable: true) }
end
