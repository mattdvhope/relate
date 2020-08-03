class Question < ApplicationRecord
  belongs_to :anon_survey
  has_many :choices, dependent: :destroy
end
