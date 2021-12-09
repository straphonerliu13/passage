class Api::V1::ApprovalStatusesController < Api::V1::GraphitiController
  def index
    approval_statuses = ApprovalStatusResource.all(params)
    respond_with(approval_statuses)
  end

  def show
    approval_status = ApprovalStatusResource.find(params)
    respond_with(approval_status)
  end

  def create
    approval_status = ApprovalStatusResource.build(params)

    if approval_status.save
      render jsonapi: approval_status, status: :created
    else
      render jsonapi_errors: approval_status
    end
  end

  def update
    approval_status = ApprovalStatusResource.find(params)

    if approval_status.update_attributes
      render jsonapi: approval_status
    else
      render jsonapi_errors: approval_status
    end
  end

  def destroy
    approval_status = ApprovalStatusResource.find(params)

    if approval_status.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: approval_status
    end
  end
end
