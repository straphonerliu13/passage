class RecordingsController < ApplicationController
  before_action :set_recording, only: %i[show edit update destroy]

  def index
    @q = Recording.ransack(params[:q])
    @recordings = @q.result(distinct: true).includes(:exhibit,
                                                     :attraction).page(params[:page]).per(10)
  end

  def show; end

  def new
    @recording = Recording.new
  end

  def edit; end

  def create
    @recording = Recording.new(recording_params)

    if @recording.save
      message = "Recording was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @recording, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @recording.update(recording_params)
      redirect_to @recording, notice: "Recording was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @recording.destroy
    message = "Recording was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to recordings_url, notice: message
    end
  end

  private

  def set_recording
    @recording = Recording.find(params[:id])
  end

  def recording_params
    params.require(:recording).permit(:exhibit_id, :audio_upload,
                                      :video_upload)
  end
end
