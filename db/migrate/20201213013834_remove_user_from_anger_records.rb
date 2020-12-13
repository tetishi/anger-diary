class RemoveUserFromAngerRecords < ActiveRecord::Migration[6.0]
  def change
    remove_foreign_key :anger_records, :users
    remove_reference :anger_records, :user, index: true
  end
end
