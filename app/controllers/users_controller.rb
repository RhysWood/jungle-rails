class UsersController < ApplicationController
  def create
    @new_user = User.new(user_params)
    if @new_user.save 
      redirect_to login_path
    else 
      redirect_to new_user_path, flash: { error: @new_user.errors.full_messages.first }
    end
  end

  def update
  end

  def destroy
  end

  def new
    #signup page
    #need a corresponding View page (view/user/new)
  end

  def login
  end

  def show_login
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
