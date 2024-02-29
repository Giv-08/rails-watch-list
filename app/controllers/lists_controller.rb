class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
    @bookmark = @list.bookmarks
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list), notice: 'List was created successfully'
    else
      render :new, status: :unprocessable_entity
    end

    def destroy
      @list = List.find(params[:id])
      @List.destroy
      redirect_to lists_path
    end
  end

  private

  def list_params
    params.require(:list).permit(:name, :photo)
  end
end
