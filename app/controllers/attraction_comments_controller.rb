class AttractionCommentsController < ApplicationController
  before_action :set_attraction_comment, only: %i[show edit update destroy]

  def index
    @q = AttractionComment.ransack(params[:q])
    @attraction_comments = @q.result(distinct: true).includes(:commenter,
                                                              :attraction).page(params[:page]).per(10)
  end

  def show; end

  def new
    @attraction_comment = AttractionComment.new
  end

  def edit; end

  def create
    @attraction_comment = AttractionComment.new(attraction_comment_params)

    if @attraction_comment.save
      message = "AttractionComment was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @attraction_comment, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @attraction_comment.update(attraction_comment_params)
      redirect_to @attraction_comment,
                  notice: "Attraction comment was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @attraction_comment.destroy
    message = "AttractionComment was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to attraction_comments_url, notice: message
    end
  end

  private

  def set_attraction_comment
    @attraction_comment = AttractionComment.find(params[:id])
  end

  def attraction_comment_params
    params.require(:attraction_comment).permit(:commenter_id, :attraction_id,
                                               :comment_text)
  end
end
