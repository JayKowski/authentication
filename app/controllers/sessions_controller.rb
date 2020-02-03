# frozen_string_literal: true

class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user&.authenticate(params[:session][:password])
      login(user)
      flash[:success] = 'You have successfully logged in'
      redirect_to root_path
    else
      flash.now[:danger] = 'There is something wrong with your login information'
      render 'new'
    end
  end

  def destroy
    log_out
    flash[:success] = 'You have logged out'
    redirect_to root_path
  end
end
