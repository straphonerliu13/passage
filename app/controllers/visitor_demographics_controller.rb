class VisitorDemographicsController < ApplicationController
  before_action :set_visitor_demographic, only: [:show, :edit, :update, :destroy]

  # GET /visitor_demographics
  def index
    @q = VisitorDemographic.ransack(params[:q])
    @visitor_demographics = @q.result(:distinct => true).includes(:users).page(params[:page]).per(10)
  end

  # GET /visitor_demographics/1
  def show
    @user = User.new
  end

  # GET /visitor_demographics/new
  def new
    @visitor_demographic = VisitorDemographic.new
  end

  # GET /visitor_demographics/1/edit
  def edit
  end

  # POST /visitor_demographics
  def create
    @visitor_demographic = VisitorDemographic.new(visitor_demographic_params)

    if @visitor_demographic.save
      redirect_to @visitor_demographic, notice: 'Visitor demographic was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /visitor_demographics/1
  def update
    if @visitor_demographic.update(visitor_demographic_params)
      redirect_to @visitor_demographic, notice: 'Visitor demographic was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /visitor_demographics/1
  def destroy
    @visitor_demographic.destroy
    redirect_to visitor_demographics_url, notice: 'Visitor demographic was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_visitor_demographic
      @visitor_demographic = VisitorDemographic.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def visitor_demographic_params
      params.require(:visitor_demographic).permit(:demographic_name, :demographic_description)
    end
end
