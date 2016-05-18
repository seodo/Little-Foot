class UsersController < ApplicationController

  def index
    @users = User.all
    @top_ten_users = current_user.top_ten_users(@users)
    @last_survey = Survey.last
  end

  def new
    @user = User.new
    if request.xhr?
      render partial: 'users/new'
    else
      render 'new'
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      @errors = @user.errors.full_messages
      render 'new'
    end
  end

  # def show
  #   if logged_in?
  #     @user = User.find_by(id: params[:id])
  #     if @user
  #       render 'show'
  #     else
  #       redirect_to root_path
  #     end
  #   else
  #     render partial: 'shared/unauthorized'
  #   end
  # end


def show
  @user = User.find_by(id: params[:id])
  @surveys = @user.surveys.last(10)
# @scores = surveys.map do |survey|
#   survey.calculate_footprint_by_category('food')
#   survey.calculate_footprint_by_category('transportation')
#   survey.calculate_footprint_by_category('lifestyle')
# end

    if @user == current_user
      if request.xhr?
        # render :json => surveys
      else
        render 'show'
      end
    else
      redirect_to root_path
    end
  end

  private
  def user_params
    params.require(:user).permit(:full_name, :email, :password, :image_url, :city, :state, :bio)
  end

end
