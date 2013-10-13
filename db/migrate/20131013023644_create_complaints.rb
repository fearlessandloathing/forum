class CreateComplaints < ActiveRecord::Migration
  def change
    create_table :complaints do |t|
      t.integer :user_id
      t.integer :complainable_id
      t.string :complainable_type

      t.timestamps
    end
  end
end
