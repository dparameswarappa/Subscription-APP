class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def show
    puts "in show"
    @user = User.find(params[:id])
    @plan = Plan.find(@user.plan_id)
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to the Subscriptions app!"
      render 'visitors/index'
    else
      render 'new'
    end
  end
  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
end
