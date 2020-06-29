class User < ApplicationRecord
  has_many :user_surveys, dependent: :destroy
  has_many :surveys, :through => :user_surveys

  has_many :questions, as: :choice_response
end
