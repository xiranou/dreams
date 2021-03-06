class UsersController < ApplicationController

  def create
    if !User.exists?(user_id: params[:userId])
      @user = User.new(user_id: params[:userId])
      if @user.save
        session[:user_id] = @user.user_id
      else
        redirect_to(root_path)
      end
    else
      @user = User.find_by(user_id: params[:userId])
      session[:user_id] = @user.user_id
    end
  end

  def logout
    session[:user_id] = nil
  end

  def user_params
    params.require(:user).permit!
  end
  
end
