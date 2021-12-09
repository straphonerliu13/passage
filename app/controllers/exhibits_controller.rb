class ExhibitsController < ApplicationController
  before_action :set_exhibit, only: %i[show edit update destroy]

  def index
    @q = Exhibit.ransack(params[:q])
    @exhibits = @q.result(distinct: true).includes(:attraction,
                                                   :exhibit_comments, :bookmarks, :recordings, :requests, :modification_request, :users).page(params[:page]).per(10)
    @location_hash = Gmaps4rails.build_markers(@exhibits.where.not(exhibit_location_latitude: nil)) do |exhibit, marker|
      marker.lat exhibit.exhibit_location_latitude
      marker.lng exhibit.exhibit_location_longitude
    end
  end

  def show
    @request = Request.new
    @recording = Recording.new
    @bookmark = Bookmark.new
    @exhibit_comment = ExhibitComment.new
  end

  def new
    @exhibit = Exhibit.new
  end

  def edit; end

  def create
    @exhibit = Exhibit.new(exhibit_params)

    if @exhibit.save
      message = "Exhibit was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @exhibit, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @exhibit.update(exhibit_params)
      redirect_to @exhibit, notice: "Exhibit was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @exhibit.destroy
    message = "Exhibit was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to exhibits_url, notice: message
    end
  end

  private

  def set_exhibit
    @exhibit = Exhibit.find(params[:id])
  end

  def exhibit_params
    params.require(:exhibit).permit(:exhibit_name, :attraction_id,
                                    :exhibit_description, :exhibit_image, :exhibit_location, :status_id)
  end
end
