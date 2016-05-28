class Friendship < ApplicationRecord
  belongs_to :follower_id
  belongs_to :follwing_id
end
