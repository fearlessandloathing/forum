class AddMarkdownBodyToPost < ActiveRecord::Migration
  def change
    add_column :posts, :body_markdown, :text
  end
end
