# frozen_string_literal: true

class RenameUserNameColumnToUsers < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :user_name, :username
  end
end
