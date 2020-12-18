class ApplicationController < ActionController::Base
  before_action :persist_last_visited_path, :authenticate_user!

  def after_sign_in_path_for(_current_user)
    # Após logar, verifica a última página visitada pelo usuário e
    # direciona de acordo com a situação.
    session[:last_visited_path] if session[:last_visited_path].present?
    root_path
    # if current_user.user_judicials?
    #   user_judicials_path(current_user)
    # else
    #   root_path
    # end
  end

  # Pegar o path da página atual e defini-la como última página visitada.
  def persist_last_visited_path
    unless Rails.configuration.ignored_paths.include?(request.path) || request.xhr?
      session[:last_visited_path] = request.path # página atual
      session[:previous_path] = request.referer # página anterior: botão Voltar
    end
  end
end
