class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by_username(params[:username])
    logger.debug(params[:password])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to posts_path
    else
      render('new')
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to(login)
  end
end
