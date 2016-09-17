class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_or_initialize_by(email: user_params[:email])

    if @user.save
      cookies.signed[:user_id] = @user.id

      redirect_to chat_path
    else
      render :new
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email)
    end
end
