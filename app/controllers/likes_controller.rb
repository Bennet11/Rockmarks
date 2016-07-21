class LikesController < ApplicationController
  def create
    @bookmark = Bookmark.find(params[:bookmark_id])
    @like = current_user.likes.build(bookmark: @bookmark)

    if @like.save
      flash[:notice] = "Bookmark Liked"
      redirect_to [@topic, @bookmark]
    else
      flash[:alert] = "Failed to Like Bookmark"
      render :new
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:bookmark_id])
    @like = current_user.likes.find_by(bookmark: @bookmark)

    if @like.destroy
      flash[:notice] = "Bookmark Unliked"
      redirect_to [@topic, @bookmark]
    else
      flash[:alert] = "Failed to Unlike Bookmark"
      render :show
    end
  end
end
