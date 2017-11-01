class VisitorsController < ApplicationController
  def create
    puts "******"
    puts params[:plan_id]
    @user = User.find_by(id: session[:user_id])
    @user.plan_id = params[:plan_id]
    @user.save
    render 'index'
  end
end
