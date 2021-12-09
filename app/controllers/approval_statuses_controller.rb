class ApprovalStatusesController < ApplicationController
  before_action :set_approval_status, only: [:show, :edit, :update, :destroy]

  # GET /approval_statuses
  def index
    @approval_statuses = ApprovalStatus.all
  end

  # GET /approval_statuses/1
  def show
  end

  # GET /approval_statuses/new
  def new
    @approval_status = ApprovalStatus.new
  end

  # GET /approval_statuses/1/edit
  def edit
  end

  # POST /approval_statuses
  def create
    @approval_status = ApprovalStatus.new(approval_status_params)

    if @approval_status.save
      redirect_to @approval_status, notice: 'Approval status was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /approval_statuses/1
  def update
    if @approval_status.update(approval_status_params)
      redirect_to @approval_status, notice: 'Approval status was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /approval_statuses/1
  def destroy
    @approval_status.destroy
    redirect_to approval_statuses_url, notice: 'Approval status was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_approval_status
      @approval_status = ApprovalStatus.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def approval_status_params
      params.require(:approval_status).permit(:status_name)
    end
end
