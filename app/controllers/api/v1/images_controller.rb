class Api::V1::ImagesController < Api::V1::BaseController
  def new
    @image = Image.new
  end

  def create
    # Need to get the spot and user id to link the image to them
    @image = Image.new(image_params)
    if @image.save
      render :show
      # The render allows WeChat frontend to see what's going on when adding a new element.
    else
      # render_error
    end
  end

  private

  def image_params
    params.require(:image).permit(:url, :user_id, :spot_id)
  end
end
