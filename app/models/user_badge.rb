class UserBadge < ApplicationRecord
  belongs_to :user
  belongs_to :badge
  belongs_to :resource, polymorphic: true

  scope :by_resource, ->(resource) { where(resource_type: resource) }
  scope :tests, -> { by_resource('Test') }
  scope :tests_by_id, ->(test_id) { tests.where(resource_id: test_id) }
  scope :test_passages, -> { by_resource('TestPassage') }
end
