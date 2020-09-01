class ChangePollidInQuestions < ActiveRecord::Migration[6.0]
  def change
    remove_column :questions, :poll_id
    add_column :questions, :poll_id, :integer
  end
end
