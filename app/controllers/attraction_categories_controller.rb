class AttractionCategoriesController < ApplicationController
  before_action :set_attraction_category, only: [:show, :edit, :update, :destroy]

  # GET /attraction_categories
  def index
    @attraction_categories = AttractionCategory.all
  end

  # GET /attraction_categories/1
  def show
    @attraction = Attraction.new
  end

  # GET /attraction_categories/new
  def new
    @attraction_category = AttractionCategory.new
  end

  # GET /attraction_categories/1/edit
  def edit
  end

  # POST /attraction_categories
  def create
    @attraction_category = AttractionCategory.new(attraction_category_params)

    if @attraction_category.save
      redirect_to @attraction_category, notice: 'Attraction category was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /attraction_categories/1
  def update
    if @attraction_category.update(attraction_category_params)
      redirect_to @attraction_category, notice: 'Attraction category was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /attraction_categories/1
  def destroy
    @attraction_category.destroy
    redirect_to attraction_categories_url, notice: 'Attraction category was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attraction_category
      @attraction_category = AttractionCategory.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def attraction_category_params
      params.require(:attraction_category).permit(:category_type, :category_description, :target_demographic)
    end
end
