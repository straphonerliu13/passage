class ExhibitCommentsController < ApplicationController
  before_action :set_exhibit_comment, only: [:show, :edit, :update, :destroy]

  # GET /exhibit_comments
  def index
    @exhibit_comments = ExhibitComment.all
  end

  # GET /exhibit_comments/1
  def show
  end

  # GET /exhibit_comments/new
  def new
    @exhibit_comment = ExhibitComment.new
  end

  # GET /exhibit_comments/1/edit
  def edit
  end

  # POST /exhibit_comments
  def create
    @exhibit_comment = ExhibitComment.new(exhibit_comment_params)

    if @exhibit_comment.save
      redirect_to @exhibit_comment, notice: 'Exhibit comment was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /exhibit_comments/1
  def update
    if @exhibit_comment.update(exhibit_comment_params)
      redirect_to @exhibit_comment, notice: 'Exhibit comment was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /exhibit_comments/1
  def destroy
    @exhibit_comment.destroy
    message = "ExhibitComment was successfully deleted."
    if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referrer, notice: message
    else
      redirect_to exhibit_comments_url, notice: message
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exhibit_comment
      @exhibit_comment = ExhibitComment.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def exhibit_comment_params
      params.require(:exhibit_comment).permit(:commenter_id, :exhibit_id, :comment_text)
    end
end
