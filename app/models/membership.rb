class Membership < ApplicationRecord
    belongs_to :gym
    belongs_to :client

  validates :client_id, uniqueness: {scope: gym_id, message: "A client can have only one membership with gym"}
end
