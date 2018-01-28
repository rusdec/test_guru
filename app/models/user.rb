class User < ApplicationRecord

  has_many :test_passages
  has_many :tests, through: :test_passages

  has_many :role_users, dependent: :destroy
  has_many :roles, through: :role_users

  has_many :test_authors
  has_many :created_tests, through: :test_authors, source: :test

  validates :email, presence: true
  validates :last_name, presence: true
  validates :first_name, presence: true

  has_secure_password

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end
