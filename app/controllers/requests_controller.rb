class RequestsController < ApplicationController
  before_action :set_request, only: %i[show edit update destroy]

  def index
    @q = Request.ransack(params[:q])
    @requests = @q.result(distinct: true).includes(:approver, :attraction,
                                                   :exhibit, :status, :main_exhibit, :main_attraction).page(params[:page]).per(10)
  end

  def show; end

  def new
    @request = Request.new
  end

  def edit; end

  def create
    @request = Request.new(request_params)

    if @request.save
      message = "Request was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @request, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @request.update(request_params)
      redirect_to @request, notice: "Request was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @request.destroy
    message = "Request was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to requests_url, notice: message
    end
  end

  private

  def set_request
    @request = Request.find(params[:id])
  end

  def request_params
    params.require(:request).permit(:request_name, :request_description,
                                    :status_id, :approver_id, :requestor_id, :exhibit_id, :attraction_id)
  end
end
