class ModerationController < ApplicationController
  def index
    @complainables = Complaint.all.group_by(&:complainable)
  end
end
