class PseudonymController < ApplicationController
  def show
    @user = User.where(pseudonym: params[:pseudonym]).first
  end
end
