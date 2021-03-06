class FoodsController < ApplicationController
  before_action :set_food, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  def index
    @foods = Food.all.order(created_at: :desc)
  end

  def show
    @food = Food.find_by(id:params[:id])
    @user = User.find_by(id:@food.user_id)
    @bookmark = current_user.bookmarks.find_by(food_id: @food.id)
  end

  def new
    if params[:back]
      @food = Food.new(food_params)
    else
      @food = Food.new
    end
  end

  def edit
    @food = Food.find(params[:id])
    if @food.user == current_user
      render "edit"
    else
      redirect_to foods_path
    end
  end

  def create
    @food = current_user.foods.build(food_params)
    respond_to do |format|
      if @food.save
        format.html { redirect_to food_url(@food), notice: "食事投稿しました。" }
        format.json { render :show, status: :created, location: @food }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @food.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @food.update(food_params)
        format.html { redirect_to food_url(@food), notice: "食事投稿を更新しました。" }
        format.json { render :show, status: :ok, location: @food }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @food.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @food.destroy

    respond_to do |format|
      format.html { redirect_to foods_url, notice: "食事投稿を削除しました。" }
      format.json { head :no_content }
    end
  end

  private

  def set_food
    @food = Food.find(params[:id])
  end

  def food_params
    params.require(:food).permit(:image, :image_cache, :body)
  end
end
