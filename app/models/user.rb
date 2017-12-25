class User < ApplicationRecord
  has_many :test_passages
  has_many :tests, through: :test_passages

  has_many :role_users, dependent: :destroy
  has_many :roles, through: :role_users

  has_many :test_authors
  has_many :created_tests, through: :test_authors, source: :test
  
  def tests_by_level(level)
    self.tests.by_level(level)
  end
end
