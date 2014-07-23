class Post < ActiveRecord::Base
  resourcify
  belongs_to :user
  belongs_to :forum_thread, touch: true
  has_many :complaints, as: :complainable, dependent: :destroy

  before_save :update_markdown

  validates_presence_of :body
  validates_presence_of :mode

  self.per_page = 10

  def body_markdown!
    if self.body_markdown.nil?
      update_markdown
      save!
    end

    return body_markdown
  end

  def complain(user)
    c = Complaint.new
    c.complainable = self
    c.user = user
    r = c.save
    return c, r
  end

  private

  def update_markdown
    self.body_markdown = MK.markdown(body)
  end
end

