class Post < ActiveRecord::Base
  resourcify
  belongs_to :user
  belongs_to :forum_thread, touch: true
  has_many :complaints, as: :complainable

  validates_presence_of :body

end

