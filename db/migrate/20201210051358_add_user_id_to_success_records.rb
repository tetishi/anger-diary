class AddUserIdToSuccessRecords < ActiveRecord::Migration[6.0]
  def change
    add_reference :success_records, :user, foreign_key: true
  end
end
