class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def after_sign_in_path_for(current_user)
    if current_user.user_judicials?
      user_judicials_path(current_user)
    else
      root_path
    end
  end
end
