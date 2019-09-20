class PhotosController < ApplicationController
  def index
    @photos = Photo.all
  end

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

  def destroy
    @photo = Photo.find(params[:id])

    if @photo.destroy
      redirect_to root_url
    else
      redirect_to @photo
    end
  end

  private
    def photo_params
      params.require(:photo).permit(:caption, :user_id, :image, :attachment, images: [])
    end
end
