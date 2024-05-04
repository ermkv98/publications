# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def authorize_request!
    redirect_to '/users/login' unless session[:user_id]
  end
end
