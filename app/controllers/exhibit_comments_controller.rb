class ExhibitCommentsController < ApplicationController
  before_action :set_exhibit_comment, only: %i[show edit update destroy]

  def index
    @q = ExhibitComment.ransack(params[:q])
    @exhibit_comments = @q.result(distinct: true).includes(:commenter,
                                                           :exhibit).page(params[:page]).per(10)
  end

  def show; end

  def new
    @exhibit_comment = ExhibitComment.new
  end

  def edit; end

  def create
    @exhibit_comment = ExhibitComment.new(exhibit_comment_params)

    if @exhibit_comment.save
      message = "ExhibitComment was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @exhibit_comment, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @exhibit_comment.update(exhibit_comment_params)
      redirect_to @exhibit_comment,
                  notice: "Exhibit comment was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @exhibit_comment.destroy
    message = "ExhibitComment was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to exhibit_comments_url, notice: message
    end
  end

  private

  def set_exhibit_comment
    @exhibit_comment = ExhibitComment.find(params[:id])
  end

  def exhibit_comment_params
    params.require(:exhibit_comment).permit(:commenter_id, :exhibit_id,
                                            :comment_text)
  end
end
