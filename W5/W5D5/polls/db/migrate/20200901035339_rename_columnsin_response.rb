class RenameColumnsinResponse < ActiveRecord::Migration[6.0]
  def change
    rename_column :responses, :user_id, :respondent_id
  end
end
