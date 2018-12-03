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
    # Only one API call from frontend to save at the same time spot and image information
    @spot = Spot.new
    @image = Image.new
  end

  def create
    # :styles is not an attribute of Spot, need to convert it to :tag_list.
    styles = spot_params[:styles]
    # We exclude :styles from spot_params to save in params as it can't accept it
    params = spot_params.except(:styles)
    @spot = Spot.new(params)
    # We associate the tag_list to the current spot instance according to the gem's rule
    @spot.tag_list.add(styles, parse: true)

    if @spot.save
      @spot.geocode
      render :show
      # The render allows WeChat frontend to see what's going on when adding a new element.
    else
      # render_error
    end

    # ---------- Image Instance Creation ----------#
    # Saving Image information with one API call from frontend
    @image = Image.new(image_params)

    if @image.save
      # Adding the current Spot instance ID to the image instance being created.
      @image[:spot_id] = @spot.id
      @image.update
      render :show
    else
      # render_error
    end
  end

  def edit
    # Not necessary in this case as it's managed by WeChat frontend
  end

  def update
    @spot = Spot.find(params[:id])
    @user = User.find(params[:user_id])

    if @user.voted_for? @spot
      puts "This user already voted for this spot"
    else
      # Associate the user to the spot to make sure he can't vote another time for the same spot
      @spot.vote_by :voter => @user
    end
    # Vote gem syntax
    # @post.vote_by :voter => @user3
    # @user.voted_for? @comment1 # => true
    # @user.update_attribute(:reputation,1)
  end

  private

  def spot_params
    params.require(:spot).permit(:name, :description, :styles, :address, :user_id)
  end

  # Adding this method to get all image information to only have one API call from the frontend.
  def image_params
    params.require(:image).permit(:url, :user_id)
  end
end


# Need to ship the current spot instance id when saving the image
