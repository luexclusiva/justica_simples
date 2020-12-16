class ApplicationController < ActionController::Base
  before_action :persist_last_visited_path, :authenticate_user!

  def after_sign_in_path_for(current_user)

    # Após logar, verifica a última página visitada pelo usuário e 
    # direciona de acordo com a situação.
    if session[:last_visited_path].present?
      session[:last_visited_path]
    else
      root_path
    end

    # if current_user.user_judicials?
    #   user_judicials_path(current_user)
    # else
    #   root_path
    # end

  end

  # Pegar o path da página atual e defini-la como última página visitada.
  def persist_last_visited_path
    unless Rails.configuration.ignored_paths.include?(request.path) || request.xhr?
      session[:last_visited_path] = request.path
    end  
  end

end
