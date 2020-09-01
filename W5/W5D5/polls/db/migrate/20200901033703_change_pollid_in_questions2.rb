class ChangePollidInQuestions2 < ActiveRecord::Migration[6.0]
  def change
    change_column_null :questions, :poll_id, false
    add_index :questions, :poll_id
  end
end
