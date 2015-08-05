class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.authenticate(params[:user][:name], params[:user][:password])

    if @user
      session[:user_id] = @user.id
      session[:password_digest] = @user.password_digest
      flash[:cyan] = "User logged in!!"
      redirect_to root_path
    else
      flash[:amber] = "Credentials Invalid!!"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:yellow] = "You are now logged out."
    redirect_to login_path
  end

end
