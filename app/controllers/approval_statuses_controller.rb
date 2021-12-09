class ApprovalStatusesController < ApplicationController
  before_action :set_approval_status, only: %i[show edit update destroy]

  def index
    @q = ApprovalStatus.ransack(params[:q])
    @approval_statuses = @q.result(distinct: true).includes(:requests).page(params[:page]).per(10)
  end

  def show
    @request = Request.new
  end

  def new
    @approval_status = ApprovalStatus.new
  end

  def edit; end

  def create
    @approval_status = ApprovalStatus.new(approval_status_params)

    if @approval_status.save
      redirect_to @approval_status,
                  notice: "Approval status was successfully created."
    else
      render :new
    end
  end

  def update
    if @approval_status.update(approval_status_params)
      redirect_to @approval_status,
                  notice: "Approval status was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @approval_status.destroy
    redirect_to approval_statuses_url,
                notice: "Approval status was successfully destroyed."
  end

  private

  def set_approval_status
    @approval_status = ApprovalStatus.find(params[:id])
  end

  def approval_status_params
    params.require(:approval_status).permit(:status_name)
  end
end
