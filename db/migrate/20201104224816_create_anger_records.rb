# frozen_string_literal: true

class CreateAngerRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :anger_records do |t|
      t.integer :level
      t.date :got_angry_on
      t.time :got_angry_at
      t.string :place
      t.text :anger_body
      t.string :changeable
      t.string :important

      t.timestamps
    end
  end
end
