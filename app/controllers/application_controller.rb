class ApplicationController < ActionController::Base
  include ActionController::Cookies
  include ActionController::RequestForgeryProtection

  protect_from_forgery with: :exception
  before_action :set_csrf_cookie

  private

  def set_csrf_cookie
    return if form_authenticity_token.nil?

    cookies['CSRF-TOKEN'] = form_authenticity_token
  end
end
