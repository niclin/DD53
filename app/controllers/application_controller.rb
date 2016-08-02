class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :prepare_exception_notifier

  helper_method :current_cart
  helper_method :current_team

  include SubdomainHelper

  def admin_required
    if !current_user.admin?
      redirect_to "/"
    end
  end

  def current_cart
    @current_cart ||= find_cart
  end

  def current_team
    @current_team ||= find_team
  end



  private

  def find_cart
    cart = Cart.find_by(id: session[:cart_id], event_id: session[:event_id])

    unless cart.present?
      cart = Cart.create(event_id: session[:event_id])
    end

    session[:cart_id] = cart.id
    session[:event_id] = cart.event_id
    cart
  end

  def find_team
    Team.find_by_domain(request.subdomain)
  end

  def after_sign_out_path_for(resource_or_scope)
    root_url(:subdomain => false )
  end

  def after_sign_in_path_for(resource)
    request.env['omniauth.origin'] || stored_location_for(resource) || root_path || root_path(:subdomain => current_team.domain)
  end

  def prepare_exception_notifier
    request.env["exception_notifier.exception_data"] = {
      :current_user => current_user
    }
  end

end
