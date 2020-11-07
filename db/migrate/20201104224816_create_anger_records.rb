class CreateAngerRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :anger_records do |t|
      t.integer :level
      t.date :got_angry_on
      t.time :got_angry_at
      t.string :place
      t.text :body
      t.string :changeable
      t.string :important
      t.timestamps
    end
  end
end
