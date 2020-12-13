# frozen_string_literal: true

class RemoveUserFromSuccessRecords < ActiveRecord::Migration[6.0]
  def change
    remove_foreign_key :success_records, :users
    remove_reference :success_records, :user, index: true
  end
end
