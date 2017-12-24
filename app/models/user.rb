class User < ApplicationRecord
  has_many :test_passages
  has_many :tests, through: :test_passages

  has_many :role_users, dependent: :destroy
  has_many :roles, through: :role_users

  def tests_by_level(level)
    self.tests.where(level: level)
  end
end
