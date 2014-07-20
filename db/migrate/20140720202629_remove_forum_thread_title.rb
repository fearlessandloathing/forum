class RemoveForumThreadTitle < ActiveRecord::Migration
  def change
    remove_column :forum_threads, :title, :string
  end
end
