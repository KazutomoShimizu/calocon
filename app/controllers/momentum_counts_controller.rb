class MomentumCountsController < ApplicationController
  def index
    @momentum_counts = MomentumCount.new
    if @momentum_counts.save
      @calorie = params[:bmr].to_f * params[:magnification].to_f
      @diet = @calorie - 500
    end
  end
end
