class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def last_voter_id
    session[:last_voter_id]
  end

  def remember_voter_id(voter_id)
    session[:last_voter_id] = voter_id
  end
end
