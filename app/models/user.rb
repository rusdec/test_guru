class User < ApplicationRecord
  has_many :test_passages
  has_many :tests, through: :test_passages

  def tests_by_level(level)
    self.tests.where(level: level)
  end
end
