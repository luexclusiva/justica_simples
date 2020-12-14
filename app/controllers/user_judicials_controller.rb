class UserJudicialsController < ApplicationController
  def index
    @user_judicials = UserJudicial.where(user_id: current_user.id)
  end

  def create
    user_judicial = UserJudicial.new
    user_judicial.user_id = current_user.id
    user_judicial.judicial_id = params[:user_judicial][:judicial_id]

    if user_judicial.save
      flash[:alert] = "O processo foi salvo"
      # redirect_to user_judicials_path
      redirect_to judicial_path(user_judicial.judicial_id)
    end
  end
end
