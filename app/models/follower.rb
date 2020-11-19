class Follower < ApplicationRecord
  validates :screen_name, uniqueness: true
end
