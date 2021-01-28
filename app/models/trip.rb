# frozen_string_literal: true

# == Schema Information
#
# Table name: trips
#
#  id            :bigint           not null, primary key
#  date          :date
#  distance      :float
#  price_subunit :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Trip < ApplicationRecord
  has_one :origin, class_name: 'Trip::Origin', dependent: :destroy
  has_one :destination, class_name: 'Trip::Destination', dependent: :destroy

  monetize :price_subunit
end
