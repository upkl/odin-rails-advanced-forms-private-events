# frozen_string_literal: true

class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :name, null: false
      t.datetime :date, null: false
      t.bigint :creator_id, null: false

      t.timestamps
    end

    add_foreign_key :events, :users, column: :creator_id
  end
end
