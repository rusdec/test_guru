class Admin < User
  has_many :test_authors
  has_many :created_tests, through: :test_authors, source: :test

  scope :contactable, -> { where(email_contactable: true) }

  def first_attempt?(test_id)
    test_passages.completed.where(test_id: test_id).count == 1
  end
end
