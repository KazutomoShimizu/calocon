class MomentumCountsController < ApplicationController
  def index
    @momentum_count = MomentumCount.new(momentum_count_params)
    if @momentum_count.save
      @momentum_count = MomentumCount.find(params[:id])
      @name = @momentum_count["name"]
      @magnification = @momentum_count["magnification"]
      @nomal = @name * @magnification
      @diet = @name * @magnification - 400
    end
  end

  private
  def momentum_count_params
    params.require(:momentum_count).permit(:name, :magnification)
  end
end
