class UsersController < ApplicationController

  def new
  end

  def create
    @user = User.create(user_params)

    flash[:cyan] = "Welcome new member!!"
    redirect_to root_path

  end

  private

  def user_params
    params.require(:user).permit(:name,:password)
  end

end
