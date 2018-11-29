class Api::V1::SpotsController < Api::V1::BaseController
  def index
    # Add condition to check if any tags have been selected to decide what to show.
    # byebug
    if params[:tag_list].nil? || params[:tag_list].empty?
      @spots = Spot.all
    else
      @spots = Spot.tagged_with(params[:tag_list], :match_all => true)
    end
  end

  def show
    @spot = Spot.find(params[:id])
  end

  def new
    @spot = Spot.new
  end

  def create
    # :styles is not an attribute of Spot, need to convert it to :tag_list.
    styles = spot_params[:styles]
    # We exclude :styles from spot_params to save in params as it can't accept it
    params = spot_params.except(:styles)
    @spot = Spot.new(params)
    # We associate the tag_list to the current spot instance according to the gem's rule
    @spot.tag_list.add(styles, parse: true)
    byebug
    if @spot.save
      render :show
      # The render allows WeChat frontend to see what's going on when adding a new element.
    else
      # render_error
    end
  end

  private

  def spot_params
    params.require(:spot).permit(:name, :description, :styles, :address, :user_id)
  end
end
