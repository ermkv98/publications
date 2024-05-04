# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authorize_request!, only: %i[create]

  def create
    alert = 'User created'
    user = User.find_by(login: user_params[:login])

    if user
      alert = 'Login already taken'
    else
      User.create(user_params)
    end

    redirect_to '/users/form', alert:
  end

  def index
    render
  end

  def login
    user = User.find_by(login: user_params[:login])
    if user&.authenticate(user_params[:password])
      session[:user_id] = user.id
      session[:user_name] = user.full_name
      session[:user_role] = user.role.to_s
      redirect_to root_url, alert: 'User logged in successfully'
    else
      render :login, alert: 'Login failed'
    end
  end

  def logout
    session.clear

    render :login, alert: 'Logout succeed'
  end

  private

  def user_params
    params.permit(:first_name, :second_name, :third_name, :role, :region, :login, :password)
  end
end
