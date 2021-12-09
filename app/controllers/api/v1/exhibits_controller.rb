class Api::V1::ExhibitsController < Api::V1::GraphitiController
  def index
    exhibits = ExhibitResource.all(params)
    respond_with(exhibits)
  end

  def show
    exhibit = ExhibitResource.find(params)
    respond_with(exhibit)
  end

  def create
    exhibit = ExhibitResource.build(params)

    if exhibit.save
      render jsonapi: exhibit, status: :created
    else
      render jsonapi_errors: exhibit
    end
  end

  def update
    exhibit = ExhibitResource.find(params)

    if exhibit.update_attributes
      render jsonapi: exhibit
    else
      render jsonapi_errors: exhibit
    end
  end

  def destroy
    exhibit = ExhibitResource.find(params)

    if exhibit.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: exhibit
    end
  end
end
