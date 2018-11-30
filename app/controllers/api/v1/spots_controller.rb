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

    # No more byebug!!!

    if @spot.save
      render :show
      # The render allows WeChat frontend to see what's going on when adding a new element.
    else
      # render_error
    end
  end

  def edit

  end

  def update
    @spot = Spot.find(params[:id])
    @user = User.find(params[:user_id])
    # @spot = Spot.find(2)
    # @user = User.find(4)

    if @user.voted_for? @spot
      puts "This user already voted for this spot"
    else
      # Associate the user to the spot to make sure he can't vote another time for the same spot
      @spot.vote_by :voter => @user
      # Saving the current number of votes in a temporary variable
      spot_votes = @spot.cached_votes_total
      # Updating only one attribute to the current spot instance
      @spot.update_attribute(:cached_votes_total, spot_votes + 1)
      # puts @spot
    end

    # @post.vote_by :voter => @user3
    # @user.voted_for? @comment1 # => true
    # @user.update_attribute(:reputation,1)
  end

  private

  def spot_params
    params.require(:spot).permit(:name, :description, :styles, :address, :user_id)
  end

  # def vote_params
  #   # Only need to pass on the user ID as we need to associate the vote for a spot to a user
  #   params.require(:spot).permit(:user_id, :id)
  # end
end
