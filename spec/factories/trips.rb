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
FactoryBot.define do
  factory :trip do
    price_subunit { 1 }
    date { '2021-01-23' }
    distance { 13.05 }
  end
end
