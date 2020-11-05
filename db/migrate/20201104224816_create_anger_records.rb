class CreateAngerRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :anger_records do |t|
      t.integer :level
      t.string :place
      t.text :body

      t.timestamps
    end
  end
end
