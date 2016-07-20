class BookmarksController < ApplicationController
  def show
    @bookmark = Bookmark.find(params[:id])
  end

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    if @bookmark.save
      flash[:notice] = "Bookmark Saved"
      redirect_to topic_path(@topic)
    else
      flash[:alert] = "Failed to save Bookmark"
      render :new
    end
  end

  def edit
    @bookmark = Bookmark.find(params[:id])
  end

  def update
    @bookmark = Bookmark.find(params[:id])
    if @bookmark.update(bookmark_params)
      flash[:notice] = "Bookmark Updated"
      redirect_to topic_path(@topic)
    else
      flash[:alert] = "Failed to update bookmark"
      render :edit
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    if @bookmark.destroy
      flash[:notice] = "Bookmark deleted"
      redirect_to topics_path(@topic)
    else
      flash[:alert] = "Failed to delete bookmark"
      render :show
    end
  end

  private
  def bookmark_params
    params.require(:bookmark).permit(:url)
  end
end
