class WeightHistoriesController < ApplicationController
  before_action :set_weight_history, only: %i[ show edit update destroy ]

  def index
    @weight_histories = WeightHistory.where(user_id: current_user.id).includes(:user).order("created_at DESC")
  end

  def show
    @weight_history = WeightHistory.find(id:params[:id])
    @user = User.find_by(id:@weight_history.user_id)
  end

  def new
    if params[:back]
      @weight_history = WeightHistory.new(weight_history_params)
    else
      @weight_history = WeightHistory.new
    end
  end

  def edit
  end

  def create
    @weight_history = current_user.weight_histories.build(weight_history_params)

    respond_to do |format|
      if @weight_history.save
        format.html { redirect_to weight_history_url(@weight_history), notice: "Weight history was successfully created." }
        format.json { render :show, status: :created, location: @weight_history }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @weight_history.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @weight_history.update(weight_history_params)
        format.html { redirect_to weight_history_url(@weight_history), notice: "Weight history was successfully updated." }
        format.json { render :show, status: :ok, location: @weight_history }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @weight_history.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @weight_history.destroy

    respond_to do |format|
      format.html { redirect_to weight_histories_url, notice: "Weight history was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_weight_history
      @weight_history = WeightHistory.find(params[:id])
    end

    def weight_history_params
      params.require(:weight_history).permit(:user_id, :weight, :start_time)
    end
end
