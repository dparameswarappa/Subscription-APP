class SubscriptionsController < ApplicationController
  def new
    if !params[:plan].nil?
      @plan = Plan.find_by!(stripe_id: params[:plan])
      puts "plan found"
      flash[:success] = "Found the plan!"
    else
      puts "plan not found"
      flash[:success] = "plan not found!"
    end
  end
end
