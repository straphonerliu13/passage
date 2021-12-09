class Api::V1::AttractionCategoriesController < Api::V1::GraphitiController
  def index
    attraction_categories = AttractionCategoryResource.all(params)
    respond_with(attraction_categories)
  end

  def show
    attraction_category = AttractionCategoryResource.find(params)
    respond_with(attraction_category)
  end

  def create
    attraction_category = AttractionCategoryResource.build(params)

    if attraction_category.save
      render jsonapi: attraction_category, status: :created
    else
      render jsonapi_errors: attraction_category
    end
  end

  def update
    attraction_category = AttractionCategoryResource.find(params)

    if attraction_category.update_attributes
      render jsonapi: attraction_category
    else
      render jsonapi_errors: attraction_category
    end
  end

  def destroy
    attraction_category = AttractionCategoryResource.find(params)

    if attraction_category.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: attraction_category
    end
  end
end
