class BookmarksController < ApplicationController
  # before_action :set_bookmark, only: :destroy

  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @list = List.find(params[:list_id])
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end

  def bookmark_params
    params.require(:review).permit(:comment, :movie_id)
  end
end
