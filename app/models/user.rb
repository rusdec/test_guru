class User < ApplicationRecord
  has_many :test_passages
  has_many :tests, through: :test_passages

  has_many :role_users, dependent: :destroy
  has_many :roles, through: :role_users

  has_many :test_authors
  has_many :created_tests, through: :test_authors, source: :test

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :password_digest, presence: true
end
