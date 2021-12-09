class Api::V1::ExhibitCommentsController < Api::V1::GraphitiController
  def index
    exhibit_comments = ExhibitCommentResource.all(params)
    respond_with(exhibit_comments)
  end

  def show
    exhibit_comment = ExhibitCommentResource.find(params)
    respond_with(exhibit_comment)
  end

  def create
    exhibit_comment = ExhibitCommentResource.build(params)

    if exhibit_comment.save
      render jsonapi: exhibit_comment, status: 201
    else
      render jsonapi_errors: exhibit_comment
    end
  end

  def update
    exhibit_comment = ExhibitCommentResource.find(params)

    if exhibit_comment.update_attributes
      render jsonapi: exhibit_comment
    else
      render jsonapi_errors: exhibit_comment
    end
  end

  def destroy
    exhibit_comment = ExhibitCommentResource.find(params)

    if exhibit_comment.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: exhibit_comment
    end
  end
end
