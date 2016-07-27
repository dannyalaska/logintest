class HomeController < ApplicationController
  def home
    redirect_to(login_path)
  end
end
