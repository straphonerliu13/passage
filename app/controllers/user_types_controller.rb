class UserTypesController < ApplicationController
  before_action :set_user_type, only: %i[show edit update destroy]

  def index
    @q = UserType.ransack(params[:q])
    @user_types = @q.result(distinct: true).includes(:users).page(params[:page]).per(10)
  end

  def show
    @user = User.new
  end

  def new
    @user_type = UserType.new
  end

  def edit; end

  def create
    @user_type = UserType.new(user_type_params)

    if @user_type.save
      redirect_to @user_type, notice: "User type was successfully created."
    else
      render :new
    end
  end

  def update
    if @user_type.update(user_type_params)
      redirect_to @user_type, notice: "User type was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @user_type.destroy
    redirect_to user_types_url, notice: "User type was successfully destroyed."
  end

  private

  def set_user_type
    @user_type = UserType.find(params[:id])
  end

  def user_type_params
    params.require(:user_type).permit(:user_type)
  end
end
