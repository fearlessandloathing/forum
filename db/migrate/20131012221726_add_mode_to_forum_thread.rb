class AddModeToForumThread < ActiveRecord::Migration
  def change
    add_column :forum_threads, :mode, :string
  end
end
