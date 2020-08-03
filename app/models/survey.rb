class Survey < ApplicationRecord
  has_many :anon_surveys, dependent: :destroy
end
