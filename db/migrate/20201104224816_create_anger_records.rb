class CreateAngerRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :anger_records do |t|
      t.integer :level
      t.datetime :got_angry_at
      t.string :place
      t.text :body
      t.boolean :changeable
      t.boolean :important
      t.timestamps
    end
  end
end
