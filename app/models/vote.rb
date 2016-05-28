class Vote < ApplicationRecord
  belongs_to :event
  belongs_to :agenda
end
