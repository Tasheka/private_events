# frozen_string_literal: true

class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :location
      t.datetime :date
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
