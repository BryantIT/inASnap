# frozen_string_literal: true

class SessionsController < ApplicationController
  # before_action :redirect_logged_in, except: [:destroy]
  skip_before_action :verify_authenticity_token, only: :create

  def new
    # @user = User.new
    # login view
  end

  def create
    user = User.find_or_create_by(provider: auth[:provider], uid: auth[:uid]) do |user|
      user.username = auth[:info][:username]
    end

    session[:user_id] = user.id
    redirect_to photographers_path

  end

  def destroy
    session.clear
    redirect_to welcome_path
  end

  private
  def auth
    request.env['omniauth.auth']
  end
end
