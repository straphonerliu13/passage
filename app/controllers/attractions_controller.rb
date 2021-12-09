class AttractionsController < ApplicationController
  before_action :set_attraction, only: %i[show edit update destroy]

  def index
    @q = Attraction.ransack(params[:q])
    @attractions = @q.result(distinct: true).includes(:attraction_comments,
                                                      :exhibits, :bookmarks, :requests, :attraction_category, :modification_requests, :recordings, :users).page(params[:page]).per(10)
    @location_hash = Gmaps4rails.build_markers(@attractions.where.not(attraction_location_latitude: nil)) do |attraction, marker|
      marker.lat attraction.attraction_location_latitude
      marker.lng attraction.attraction_location_longitude
    end
  end

  def show
    @request = Request.new
    @bookmark = Bookmark.new
    @exhibit = Exhibit.new
    @attraction_comment = AttractionComment.new
  end

  def new
    @attraction = Attraction.new
  end

  def edit; end

  def create
    @attraction = Attraction.new(attraction_params)

    if @attraction.save
      message = "Attraction was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @attraction, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @attraction.update(attraction_params)
      redirect_to @attraction, notice: "Attraction was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @attraction.destroy
    message = "Attraction was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to attractions_url, notice: message
    end
  end

  private

  def set_attraction
    @attraction = Attraction.find(params[:id])
  end

  def attraction_params
    params.require(:attraction).permit(:attraction_name,
                                       :attraction_location, :attraction_description, :attraction_image, :status_id, :phone_number, :email_address, :hours_of_operation, :cost_of_entry, :attraction_category_id)
  end
end
