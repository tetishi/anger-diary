# frozen_string_literal: true

class CreateSuccessRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :success_records do |t|
      t.text :body

      t.timestamps
    end
  end
end
