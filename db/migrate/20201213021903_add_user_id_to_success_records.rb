class AddUserIdToSuccessRecords < ActiveRecord::Migration[6.0]
  def change
    add_column :success_records, :user_id, :integer
  end
end
