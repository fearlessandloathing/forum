class ForumThread < ActiveRecord::Base
  resourcify
  belongs_to :user
  has_many :posts
  has_many :complaints, as: :complainable

  def modes
    modes = []
    modes << "real" if real_allowed
    modes << "pseudo" if pseudo_allowed
    modes << "anon" if anon_allowed
    return modes
  end
end

