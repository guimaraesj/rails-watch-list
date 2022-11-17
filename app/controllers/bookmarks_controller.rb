class BookmarksController < ApplicationController
  before_action :set_list, only: %i[new create]

  def new
    # quando queremos um novo bookmark, precisamos de identificar qual a lista em que estamos - set list
    @bookmark = Bookmark.new
  end

  def create
    # quando queremos um novo bookmark, precisamos de identificar qual a lista em que estamos - set list
    @bookmark = Bookmark.new(bookmark_params)
    # associate bookmark to list:
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@list) # or redirect_to @bookmark
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    # No need for app/views/bookmarks/destroy.html.erb
    redirect_to list_path(@bookmark.list), status: :see_other
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end

  def set_list
    # @list = List.find(params[:id])
    @list = List.find(params[:list_id]) #neste caso é o list_id
  end
end
