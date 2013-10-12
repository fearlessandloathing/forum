class CreateForumThreads < ActiveRecord::Migration
  def change
    create_table :forum_threads do |t|
      t.string :title
      t.text :body
      t.integer :user_id
      t.boolean :real_allowed
      t.boolean :pseudo_allowed
      t.boolean :anon_allowed

      t.timestamps
    end
  end
end
