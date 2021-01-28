# frozen_string_literal: true

class CreateTrips < ActiveRecord::Migration[6.0]
  def change
    create_table :trips do |t|
      t.integer :price_subunit
      t.float :distance
      t.date :date

      t.timestamps
    end
  end
end
