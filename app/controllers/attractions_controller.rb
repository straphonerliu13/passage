class AttractionsController < ApplicationController
  before_action :set_attraction, only: [:show, :edit, :update, :destroy]

  # GET /attractions
  def index
    @attractions = Attraction.all
  end

  # GET /attractions/1
  def show
    @request = Request.new
    @bookmark = Bookmark.new
    @exhibit = Exhibit.new
    @attraction_comment = AttractionComment.new
  end

  # GET /attractions/new
  def new
    @attraction = Attraction.new
  end

  # GET /attractions/1/edit
  def edit
  end

  # POST /attractions
  def create
    @attraction = Attraction.new(attraction_params)

    if @attraction.save
      message = 'Attraction was successfully created.'
      if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referrer, notice: message
      else
        redirect_to @attraction, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /attractions/1
  def update
    if @attraction.update(attraction_params)
      redirect_to @attraction, notice: 'Attraction was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /attractions/1
  def destroy
    @attraction.destroy
    message = "Attraction was successfully deleted."
    if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referrer, notice: message
    else
      redirect_to attractions_url, notice: message
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attraction
      @attraction = Attraction.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def attraction_params
      params.require(:attraction).permit(:attraction_name, :attraction_location, :attraction_description, :attraction_image, :status_id, :phone_number, :email_address, :hours_of_operation, :cost_of_entry, :attraction_category_id)
    end
end
