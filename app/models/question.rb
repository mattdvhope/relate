class Question < ApplicationRecord
  belongs_to :choice_response, polymorphic: true, optional: true
  has_many :choices, dependent: :destroy
end
