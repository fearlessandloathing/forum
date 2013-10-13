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

  validates_format_of :email, :with => /\w@oberlin\.edu/, :message => "must be an oberlin.edu email"
  validates_format_of :pseudonym, :with => /\A[A-Za-z\d_]+\z/, :message => "should be alphanumeric + _"

  validates_length_of :password, :minimum => 6

  def user_params
    params.require(:user).permit(:email, :name, :pseudonym, :role_ids, :password, :password_confirmation, :current_password)
  end

end

