class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from ActiveRecord::RecordNotFound, with: :couldnt_find_record
  rescue_from NoMethodError, with: :no_method_error
  rescue_from ActionController::RoutingError, with: :no_route_error

  private
  def couldnt_find_record
    redirect_to root_url, alert: "That record doesn't exist."
  end

  def no_method_error
    redirect_to root_url, notice: "Sorry. An error has occurred and it is probably our fault."
  end

  def no_route_error
    redirect_to root_url, notice: "Sorry. An error has occurred and it is probably our fault."
  end
end
