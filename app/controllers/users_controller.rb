class UsersController < ApplicationController

  def new
  end

  def create
    # create new user
    @user = User.create(user_params)
    @returning_user = false

    # check if user was saved
    if @user.save
      # auto login after create user
      session[:user_id] = @user.id
      session[:password_digest] = @user.password_digest
      flash[:cyan] = "You must be new here! Welcome!"
      redirect_to root_path
    # check if user name already exists
    elsif User.find_by_name(user_params[:name])
      flash[:amber] = "That name already exists. Please choose another."
      @returning_user = true
      render :new
    # did not validate
    else
      flash[:amber] = "Please properly fill out the form."
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name,:password)
  end

end
