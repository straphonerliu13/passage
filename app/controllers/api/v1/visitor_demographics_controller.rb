class Api::V1::VisitorDemographicsController < Api::V1::GraphitiController
  def index
    visitor_demographics = VisitorDemographicResource.all(params)
    respond_with(visitor_demographics)
  end

  def show
    visitor_demographic = VisitorDemographicResource.find(params)
    respond_with(visitor_demographic)
  end

  def create
    visitor_demographic = VisitorDemographicResource.build(params)

    if visitor_demographic.save
      render jsonapi: visitor_demographic, status: 201
    else
      render jsonapi_errors: visitor_demographic
    end
  end

  def update
    visitor_demographic = VisitorDemographicResource.find(params)

    if visitor_demographic.update_attributes
      render jsonapi: visitor_demographic
    else
      render jsonapi_errors: visitor_demographic
    end
  end

  def destroy
    visitor_demographic = VisitorDemographicResource.find(params)

    if visitor_demographic.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: visitor_demographic
    end
  end
end
