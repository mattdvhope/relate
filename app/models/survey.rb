class Survey < ApplicationRecord
  has_many :user_surveys, dependent: :destroy
  has_many :users, :through => :user_surveys
end
