class ExhibitsController < ApplicationController
  before_action :set_exhibit, only: [:show, :edit, :update, :destroy]

  # GET /exhibits
  def index
    @exhibits = Exhibit.page(params[:page]).per(10)
    @location_hash = Gmaps4rails.build_markers(@exhibits.where.not(:exhibit_location_latitude => nil)) do |exhibit, marker|
      marker.lat exhibit.exhibit_location_latitude
      marker.lng exhibit.exhibit_location_longitude
      marker.infowindow "<h5><a href='/exhibits/#{exhibit.id}'>#{exhibit.exhibit_name}</a></h5><small>#{exhibit.exhibit_location_formatted_address}</small>"
    end
  end

  # GET /exhibits/1
  def show
    @request = Request.new
    @recording = Recording.new
    @bookmark = Bookmark.new
    @exhibit_comment = ExhibitComment.new
  end

  # GET /exhibits/new
  def new
    @exhibit = Exhibit.new
  end

  # GET /exhibits/1/edit
  def edit
  end

  # POST /exhibits
  def create
    @exhibit = Exhibit.new(exhibit_params)

    if @exhibit.save
      message = 'Exhibit was successfully created.'
      if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referrer, notice: message
      else
        redirect_to @exhibit, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /exhibits/1
  def update
    if @exhibit.update(exhibit_params)
      redirect_to @exhibit, notice: 'Exhibit was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /exhibits/1
  def destroy
    @exhibit.destroy
    message = "Exhibit was successfully deleted."
    if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referrer, notice: message
    else
      redirect_to exhibits_url, notice: message
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exhibit
      @exhibit = Exhibit.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def exhibit_params
      params.require(:exhibit).permit(:exhibit_name, :attraction_id, :exhibit_description, :exhibit_image, :exhibit_location, :status_id)
    end
end
