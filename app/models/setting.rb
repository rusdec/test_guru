class Setting < ApplicationRecord
  
  validates :name, presence: true
  validates :value, presence: true

  class << self
    def answers_range
      (min_answers..max_answers)
    end
    def max_answers
      where(setting: :max_answers).pluck(:value).first.to_i 
    end
    def min_answers
      where(setting: :min_answers).pluck(:value).first.to_i  
    end
  end
end
