# frozen_string_literal: true

class AddUserIdToAngerRecords < ActiveRecord::Migration[6.0]
  def change
    add_column :anger_records, :user_id, :integer
  end
end
