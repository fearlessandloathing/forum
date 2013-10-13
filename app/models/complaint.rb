class Complaint < ActiveRecord::Base
  belongs_to :complainable, polymorphic: true
  belongs_to :user

  validates_presence_of :user
  validates_presence_of :complainable

  validates_uniqueness_of :user_id, :scope => [:complainable_type, :complainable_id]
end
