class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate
  helper_method :current_user
  include SessionsHelper

  before_action :authenticate


  private
    def authenticate
      flash[:error] = "You must be logged in to access this section of the site"
      redirect_to '/login' unless current_user
    end
end
