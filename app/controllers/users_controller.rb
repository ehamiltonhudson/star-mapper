class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def find_zodiac_for_user(birthday)
    case @user.birthday
    when (0320..0420)
      "Aries"
    else
      "not working"
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      redirect_to user_path(@user)
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to new_user_path
    end
  end


  private

  def user_params
    params.require(:user).permit(:name, :birthday, :birth_year, :zodiac_id, :location_id)
  end

end
