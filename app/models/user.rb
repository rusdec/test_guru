class User < ApplicationRecord
  has_many :test_passages
  has_many :tests, through: :test_passages

  has_many :role_users, dependent: :destroy
  has_many :roles, through: :role_users

  has_many :test_authors
  has_many :created_tests, through: :test_authors, source: :test

  validate :validate_email_format
  validates :email, presence: true,
                    uniqueness: true

  validates :last_name, presence: true
  validates :first_name, presence: true

  has_secure_password

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  private

  def validate_email_format
    errors.add(:email, 'Bad email format') unless email_format =~ email
  end

  def email_format
    /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  end
end
