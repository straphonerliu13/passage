class VisitorDemographicsController < ApplicationController
  before_action :set_visitor_demographic,
                only: %i[show edit update destroy]

  def index
    @q = VisitorDemographic.ransack(params[:q])
    @visitor_demographics = @q.result(distinct: true).includes(:users).page(params[:page]).per(10)
  end

  def show
    @user = User.new
  end

  def new
    @visitor_demographic = VisitorDemographic.new
  end

  def edit; end

  def create
    @visitor_demographic = VisitorDemographic.new(visitor_demographic_params)

    if @visitor_demographic.save
      redirect_to @visitor_demographic,
                  notice: "Visitor demographic was successfully created."
    else
      render :new
    end
  end

  def update
    if @visitor_demographic.update(visitor_demographic_params)
      redirect_to @visitor_demographic,
                  notice: "Visitor demographic was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @visitor_demographic.destroy
    redirect_to visitor_demographics_url,
                notice: "Visitor demographic was successfully destroyed."
  end

  private

  def set_visitor_demographic
    @visitor_demographic = VisitorDemographic.find(params[:id])
  end

  def visitor_demographic_params
    params.require(:visitor_demographic).permit(:demographic_name,
                                                :demographic_description)
  end
end
