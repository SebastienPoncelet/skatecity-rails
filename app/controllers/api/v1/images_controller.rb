class ImagesController < ApplicationController
  def new
    @image = Image.new
  end

  def create
    # Need to get the spot and user id to link the image to them
    @image = Image.new(image_params)
    @image.save
  end

  private

  def image_params
    params.require(:image).permit(:url, :user_id, :spot_id)
  end
end
