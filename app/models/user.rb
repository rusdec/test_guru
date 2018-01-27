class User < ApplicationRecord
  include Auth

  has_many :test_passages
  has_many :tests, through: :test_passages

  has_many :role_users, dependent: :destroy
  has_many :roles, through: :role_users

  has_many :test_authors
  has_many :created_tests, through: :test_authors, source: :test

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end
