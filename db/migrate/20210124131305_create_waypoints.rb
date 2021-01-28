# frozen_string_literal: true

class CreateWaypoints < ActiveRecord::Migration[6.0]
  def change
    create_table :waypoints do |t|
      t.string :lat
      t.string :lng
      t.string :address
      t.string :type
      t.references :trip, null: false, foreign_key: true

      t.timestamps
    end
  end
end
