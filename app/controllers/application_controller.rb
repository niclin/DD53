class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_cart

  include UrlHelper

  def admin_required
    if !current_user.admin?
      redirect_to "/"
    end
  end

  def current_cart
    @current_cart ||= find_cart
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

  def after_sign_out_path_for(resource_or_scope)
    root_url(:subdomain => false )
  end

end
