class ForumThread < ActiveRecord::Base
  resourcify
  belongs_to :user
  has_many :posts
  has_many :complaints, as: :complainable
end
