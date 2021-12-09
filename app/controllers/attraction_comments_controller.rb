class AttractionCommentsController < ApplicationController
  before_action :set_attraction_comment, only: [:show, :edit, :update, :destroy]

  # GET /attraction_comments
  def index
    @attraction_comments = AttractionComment.all
  end

  # GET /attraction_comments/1
  def show
  end

  # GET /attraction_comments/new
  def new
    @attraction_comment = AttractionComment.new
  end

  # GET /attraction_comments/1/edit
  def edit
  end

  # POST /attraction_comments
  def create
    @attraction_comment = AttractionComment.new(attraction_comment_params)

    if @attraction_comment.save
      message = 'AttractionComment was successfully created.'
      if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referrer, notice: message
      else
        redirect_to @attraction_comment, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /attraction_comments/1
  def update
    if @attraction_comment.update(attraction_comment_params)
      redirect_to @attraction_comment, notice: 'Attraction comment was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /attraction_comments/1
  def destroy
    @attraction_comment.destroy
    message = "AttractionComment was successfully deleted."
    if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referrer, notice: message
    else
      redirect_to attraction_comments_url, notice: message
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attraction_comment
      @attraction_comment = AttractionComment.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def attraction_comment_params
      params.require(:attraction_comment).permit(:commenter_id, :attraction_id, :comment_text)
    end
end
