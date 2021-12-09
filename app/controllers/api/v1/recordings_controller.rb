class Api::V1::RecordingsController < Api::V1::GraphitiController
  def index
    recordings = RecordingResource.all(params)
    respond_with(recordings)
  end

  def show
    recording = RecordingResource.find(params)
    respond_with(recording)
  end

  def create
    recording = RecordingResource.build(params)

    if recording.save
      render jsonapi: recording, status: :created
    else
      render jsonapi_errors: recording
    end
  end

  def update
    recording = RecordingResource.find(params)

    if recording.update_attributes
      render jsonapi: recording
    else
      render jsonapi_errors: recording
    end
  end

  def destroy
    recording = RecordingResource.find(params)

    if recording.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: recording
    end
  end
end
