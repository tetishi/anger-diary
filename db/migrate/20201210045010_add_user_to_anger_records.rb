# frozen_string_literal: true

class AddUserToAngerRecords < ActiveRecord::Migration[6.0]
  def change
    add_reference :anger_records, :user, foreign_key: true
  end
end
