class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :forum_thread
  has_many :complaints, as: :complainable
end
