class AnonSurvey < ApplicationRecord
  belongs_to :survey

  has_many :questions, as: :choice_response
end
