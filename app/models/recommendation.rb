class Recommendation < ApplicationRecord
  has_many :recommendation_actions
  has_many :actions, through: :recommendation_actions
end
