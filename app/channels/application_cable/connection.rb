module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      current_user = AuthService.get_user_ws(token: request.params[:token])
      if current_user.present?
        Rails.logger.info "User #{current_user.id} connected"
        self.current_user = current_user
      else
        reject_unauthorized_connection
      end
    end
  end
end
