class ForumThread < ActiveRecord::Base
  belongs_to :user
  has_many :posts
  has_many :complaints, as: :complainable
end
