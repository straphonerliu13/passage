class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]

  def index
    @q = User.ransack(params[:q])
    @users = @q.result(distinct: true).includes(:attraction_comments,
                                                :exhibit_comments, :bookmarks, :requests, :user_type, :demographic, :exhibits, :attractions).page(params[:page]).per(10)
  end

  def show
    @request = Request.new
    @bookmark = Bookmark.new
    @exhibit_comment = ExhibitComment.new
    @attraction_comment = AttractionComment.new
  end

  def new
    @user = User.new
  end

  def edit; end

  def create
    @user = User.new(user_params)

    if @user.save
      message = "User was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @user, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: "User was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    message = "User was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to users_url, notice: message
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email_address,
                                 :password, :home_city, :home_state, :home_country, :user_image, :user_bio, :user_type_id, :demographic_id)
  end
end
