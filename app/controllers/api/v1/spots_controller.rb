class Api::V1::SpotsController < Api::V1::BaseController

  def index
    @spots = Spot.all
  end

end
