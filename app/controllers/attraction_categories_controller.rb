class AttractionCategoriesController < ApplicationController
  before_action :set_attraction_category,
                only: %i[show edit update destroy]

  def index
    @q = AttractionCategory.ransack(params[:q])
    @attraction_categories = @q.result(distinct: true).includes(:attractions).page(params[:page]).per(10)
  end

  def show
    @attraction = Attraction.new
  end

  def new
    @attraction_category = AttractionCategory.new
  end

  def edit; end

  def create
    @attraction_category = AttractionCategory.new(attraction_category_params)

    if @attraction_category.save
      redirect_to @attraction_category,
                  notice: "Attraction category was successfully created."
    else
      render :new
    end
  end

  def update
    if @attraction_category.update(attraction_category_params)
      redirect_to @attraction_category,
                  notice: "Attraction category was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @attraction_category.destroy
    redirect_to attraction_categories_url,
                notice: "Attraction category was successfully destroyed."
  end

  private

  def set_attraction_category
    @attraction_category = AttractionCategory.find(params[:id])
  end

  def attraction_category_params
    params.require(:attraction_category).permit(:category_type,
                                                :category_description, :target_demographic)
  end
end
