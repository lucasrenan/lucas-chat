class RoomsController < ApplicationController
  before_action :check_signed_user!

  def index
  end

  private
    def check_signed_user!
      unless User.find_by(id: cookies.signed[:user_id])
        return redirect_to root_path
      end
    end
end
