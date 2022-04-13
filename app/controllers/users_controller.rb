class UsersController < ApplicationController
  def create
    @new_user = User.new(user_params)
    if @new_user.save 
      session[:user_id] = user.id
      redirect_to '/'
    else 
      redirect_to '/signup'
      # redirect_to new_user_path, flash: { error: @new_user.errors.full_messages.first }
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
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
