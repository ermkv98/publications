# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  before_action do
    ActiveStorage::Current.host = '127.0.0.1'
  end

  def authorize_request!
    redirect_to '/users/login' unless session[:user_id]
  end
end
