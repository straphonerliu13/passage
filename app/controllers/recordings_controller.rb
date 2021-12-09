class RecordingsController < ApplicationController
  before_action :set_recording, only: [:show, :edit, :update, :destroy]

  # GET /recordings
  def index
    @recordings = Recording.all
  end

  # GET /recordings/1
  def show
  end

  # GET /recordings/new
  def new
    @recording = Recording.new
  end

  # GET /recordings/1/edit
  def edit
  end

  # POST /recordings
  def create
    @recording = Recording.new(recording_params)

    if @recording.save
      redirect_to @recording, notice: 'Recording was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /recordings/1
  def update
    if @recording.update(recording_params)
      redirect_to @recording, notice: 'Recording was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /recordings/1
  def destroy
    @recording.destroy
    redirect_to recordings_url, notice: 'Recording was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recording
      @recording = Recording.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def recording_params
      params.require(:recording).permit(:exhibit_id, :audio_upload, :video_upload)
    end
end
