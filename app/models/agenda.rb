class Agenda < ApplicationRecord
  belongs_to :event
  belongs_to :location
end
