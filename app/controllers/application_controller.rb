class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_filter :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  helper_method :current_cart

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

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name, :email, :password, :password_confirmation, :current_password) }
  end
end
