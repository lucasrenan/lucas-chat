module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = find_user_or_reject
    end

    private
    def find_user_or_reject
      if user = User.find_by(id: cookies.signed[:user_id])
        user
      else
        reject_unauthorized_connection
      end
    end
  end
end
