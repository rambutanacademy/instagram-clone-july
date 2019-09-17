class PhotosController < ApplicationController
  def new
    @photo = Photo.new
  end

  def create
    @photo = current_user.photos.new(photo_params)

    if @photo.save
      redirect_to @photo
    else
      render :new
    end
  end

  def show
    @photo = Photo.find(params[:id])
  end

  private
    def photo_params
      params.require(:photo).permit(:caption, :user_id, :image, :attachment, images: [])
    end
end
