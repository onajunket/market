class ListingsController < ApplicationController
  # before_action :set_listing, only: [:show, :edit, :update]
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  # GET /listings
  # GET /listings.json
  def index
    @listings = Listing.all
  end

  # GET /listings/1
  # GET /listings/1.json
  def show
    @listing = Listing.find(params[:id])
  end

  # GET /listings/new
  def new
    @listing = Listing.new
  end

  # GET /listings/1/edit
  def edit
    @listing = Listing.find(params[:id])
  end

  # POST /listings
  # POST /listings.json
  def create
    @listing = current_user.listings.build(listing_params)
      if @listing.save
        flash[:success] = "Listing created!"
        redirect_to root_url
        # format.html { redirect_to @listing, notice: 'Listing was successfully created.' }
        # format.json { render :show, status: :created, location: @listing }
      else
      @feed_listings = []
      render 'static_pages/home'
        # format.html { render :new }
        # format.json { render json: @listing.errors, status: :unprocessable_entity }
      end

  end

  # PATCH/PUT /listings/1
  # PATCH/PUT /listings/1.json
  def update
    @listing = Listing.find(params[:id])
    respond_to do |format|
      if @listing.update(listing_params)
        format.html { redirect_to @listing, notice: 'Listing was successfully updated.' }
        format.json { render :show, status: :ok, location: @listing }
      else
        format.html { render :edit }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /listings/1
  # DELETE /listings/1.json
  def destroy
    @listing.destroy
    flash[:success] = "Micropost deleted"
    redirect_to '/'
  end

  private


    # Never trust parameters from the scary internet, only allow the white list through.
    def listing_params
      params.require(:listing).permit(:title, :description, :price, :user_id, :category_id, :subcategory_id, :picture)
    end

    def correct_user
      @listing = current_user.listings.find_by(id: params[:id])
      redirect_to root_url if @listing.nil?
    end
end
