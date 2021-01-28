# frozen_string_literal: true

# == Schema Information
#
# Table name: waypoints
#
#  id         :bigint           not null, primary key
#  address    :string
#  lat        :decimal(, )
#  lng        :decimal(, )
#  type       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  trip_id    :bigint           not null
#
# Indexes
#
#  index_waypoints_on_trip_id  (trip_id)
#
# Foreign Keys
#
#  fk_rails_...  (trip_id => trips.id)
#
class Waypoint < ApplicationRecord
  belongs_to :trip
  validates :lat, :lng, :address, presence: true
end
