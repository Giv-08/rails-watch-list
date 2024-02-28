class BookmarksController < ApplicationController
  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    # @restaurant = Restaurant.find(params[:restaurant_id])
    # review.restaurant_id = @restaurant.id
    @bookmark.list = @list
    if @review.save
      redirect_to lists_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def bookmark_params
    params.require(:review).permit(:content, :rating)
  end
end
