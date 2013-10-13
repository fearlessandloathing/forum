class AddDefaultsToForumThread < ActiveRecord::Migration
  def change
    change_column :forum_threads, :real_allowed, :boolean, :default => true
    change_column :forum_threads, :pseudo_allowed, :boolean, :default => true
    change_column :forum_threads, :anon_allowed, :boolean, :default => true
  end
end
