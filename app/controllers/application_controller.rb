class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|
    flash.now[:notice] = "Access denied!"
    redirect_to root_path
  end
end
