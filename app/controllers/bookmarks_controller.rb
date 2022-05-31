class BookmarksController < ApplicationController
  
  def create
    bookmark = current_user.bookmarks.create(food_id: params[:food_id])
    redirect_to foods_path, notice: "#{bookmark.food.user.name}さんの投稿をお気に入り登録しました"
  end

  def destroy
    bookmark = current_user.bookmarks.find_by(id: params[:id]).destroy
    redirect_to feeds_path, notice: "#{bookmark.food.user.name}さんの投稿をお気に入り解除しました"
  end

  def show
    bookmarks = Bookmark.where(user_id: current_user.id).pluck(:food_id)
    @bookmark_list = Food.find(bookmarks)
  end
end
