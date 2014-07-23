class ForumThread < ActiveRecord::Base
  resourcify
  belongs_to :user
  has_many :posts
  has_many :complaints, as: :complainable

  #validates_presence_of :title
  validates_presence_of :body

  #validates_length_of :title, :maximum => 30

  after_create do
    p = posts.new
    p.user = user
    p.mode = mode
    p.body = body
    p.save!
  end

  self.per_page = 10

  def complain(user)
    c = Complaint.new
    c.complainable = self
    c.user = user
    r = c.save
    return c, r
  end

  def modes
    modes = []
    modes << "real" if real_allowed
    modes << "pseudo" if pseudo_allowed
    modes << "anon" if anon_allowed
    return modes
  end

  def form_modes
    modes = []
    modes << ["Real Name", "real"] if real_allowed
    modes << ["Pseudonym", "pseudo"] if pseudo_allowed
    modes << ["Anonymous", "anon"] if anon_allowed
    return modes
  end

  def radio_form_modes
    modes = {}
    modes["Real Name"] = "real" if real_allowed
    modes["Pseudonym"] = "pseudo" if pseudo_allowed
    modes["Anonymous"] = "anon" if anon_allowed
    return modes
  end

  def as_post
    post = OpenStruct.new
    post.user = user
    post.body = body
    post.updated_at = updated_at
    post.mode = mode
    return post
  end
end

