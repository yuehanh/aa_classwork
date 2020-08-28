class AddTimstampsToVisits < ActiveRecord::Migration[5.2]
  def change
      change_table :visits do |t|
        t.timestamps
      end
      
  end
end
