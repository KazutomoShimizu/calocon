class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def edit
  end


  private
  def food_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation, :image, :image_cache)
  end
end
