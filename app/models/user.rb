class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :forum_threads
  has_many :posts
  has_many :complaints # I bet they do

  validates_presence_of :email
  validates_presence_of :name
  validates_presence_of :pseudonym

  validates_uniqueness_of :email
  validates_uniqueness_of :name
  validates_uniqueness_of :pseudonym

  #validates_format_of :email, :with => /\w@oberlin\.edu/, :message => "must be an oberlin.edu email"
  #validates_format_of :pseudonym, :with => /\A[A-Za-z\d_]+\z/, :message => "should be alphanumeric + _"
  
  # For the beta only:
  validates_format_of :email, :with => /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/, :message => "must be an oberlin.edu email"
  validates_format_of :pseudonym, :with => /\A[A-Z a-z\d_]+\z/, :message => "should be alphanumeric + _"

  validates_length_of :password, :minimum => 6

  def user_params
    params.require(:user).permit(:email, :name, :pseudonym, :role_ids, :password, :password_confirmation, :current_password)
  end

  def has_complained_on(thing)
    self.complaints.where(complainable: thing).count > 0
  end

  def can_moderate?
    # TODO: figure out how CanCan works with Rolify and fix this.
    has_role?(:vip) || has_role?(:admin)
  end

end

