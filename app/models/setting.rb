class Setting < ApplicationRecord
  
  scope :value_by_setting, ->(setting) { where(setting: setting).pluck(:value).first }
  scope :max_answers, -> { value_by_setting(:max_answers).to_i }
  scope :min_answers, -> { value_by_setting(:min_answers).to_i }
  scope :answers_range, -> { (min_answers..max_answers) }

  validates :name, presence: true
  validates :value, presence: true
end
