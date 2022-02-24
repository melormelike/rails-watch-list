class BookmarksController < ApplicationController

  def create
    @bookmark = Bookmark.new(bookmark_params)
    # @movie = Movie.find(params[:movie_id])
    @list = List.find(params[:list_id])
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@list), notice: "Bookmark was successfully created."
    else
      render :new
    end
  end

  def new
    @bookmark = Bookmark.new
    @list = List.find(params[:list_id])
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to list_bookmarks(@bookmark), notice: "List was successfully destroyed."
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end
