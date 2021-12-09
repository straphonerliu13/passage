class Api::V1::AttractionCommentsController < Api::V1::GraphitiController
  def index
    attraction_comments = AttractionCommentResource.all(params)
    respond_with(attraction_comments)
  end

  def show
    attraction_comment = AttractionCommentResource.find(params)
    respond_with(attraction_comment)
  end

  def create
    attraction_comment = AttractionCommentResource.build(params)

    if attraction_comment.save
      render jsonapi: attraction_comment, status: 201
    else
      render jsonapi_errors: attraction_comment
    end
  end

  def update
    attraction_comment = AttractionCommentResource.find(params)

    if attraction_comment.update_attributes
      render jsonapi: attraction_comment
    else
      render jsonapi_errors: attraction_comment
    end
  end

  def destroy
    attraction_comment = AttractionCommentResource.find(params)

    if attraction_comment.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: attraction_comment
    end
  end
end
