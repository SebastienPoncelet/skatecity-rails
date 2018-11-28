class Api::V1::SpotsController < Api::V1::BaseController

  def index
    @spots = Spot.all
  end

  def show
    @spot = Spot.find(params[:id])
  end

  def new
    @spot = Spot.new
  end

  def create
    @spot = Spot.new(spot_params)
    if @spot.save
      render :show
      # The render allows WeChat frontend to see what's going on when adding a new element.
    else
      render_error
    end
  end

  private

  def spot_params
    params.require(:spot).permit(:name, :description, :geocoding, :tag_list, :user_id)
  end
end
