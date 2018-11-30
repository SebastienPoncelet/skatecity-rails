class ImagesController < ApplicationController
  def index
    # Need to show one image per card
    # The image needs to be linked to the corresponding spot id
    @images = Image.all
  end

  def show
    # Sample 5 pictures linked to the spot being displayed
    # The sampling
    @images = Image.where(params[:spot_id])
  end

  def new
    @image = Image.new
  end

  def create
    # Need to get the spot and user id to link the image to them
    @image = Image.new(image_params)
  end

  private

  def image_params
    params.require(:image).permit(:url, :user_id, :spot_id)
  end
end
