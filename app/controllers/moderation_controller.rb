class ModerationController < ApplicationController
  before_filter :check_admin
  def index
    @complainables = Complaint.all.group_by(&:complainable)
  end

  private
  
  def check_admin
    if !current_user.has_role? :admin
      redirect_to :root, :flash => { :error => "Unauthorized" }
    end
  end
end
