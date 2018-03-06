class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :confirmable

  has_many :test_passages
  has_many :tests, through: :test_passages

  has_many :role_users, dependent: :destroy
  has_many :roles, through: :role_users

  has_many :gists

  validate :validate_email_contactable_permission
  validate :validate_email_format
  validates :email, presence: true,
                    uniqueness: true

  validates :last_name, presence: true
  validates :first_name, presence: true

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def admin?
    is_a?(Admin)
  end

  private

  def validate_email_contactable_permission
    errors.add(:email_contactable, 'Only admin have contactable email') if !admin? && email_contactable
  end

  def validate_email_format
    errors.add(:email, 'Bad email format') unless email_format =~ email
  end

  def email_format
    /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  end
end
