class Api::V1::UserTypesController < Api::V1::GraphitiController
  def index
    user_types = UserTypeResource.all(params)
    respond_with(user_types)
  end

  def show
    user_type = UserTypeResource.find(params)
    respond_with(user_type)
  end

  def create
    user_type = UserTypeResource.build(params)

    if user_type.save
      render jsonapi: user_type, status: 201
    else
      render jsonapi_errors: user_type
    end
  end

  def update
    user_type = UserTypeResource.find(params)

    if user_type.update_attributes
      render jsonapi: user_type
    else
      render jsonapi_errors: user_type
    end
  end

  def destroy
    user_type = UserTypeResource.find(params)

    if user_type.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: user_type
    end
  end
end
