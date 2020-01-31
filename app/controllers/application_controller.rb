class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?

    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def logged_in?
        !!current_user
    end

    def require_user
        if !logged_in?
            flash[:danger] = "You must log in to perform that action"
            redirect_to root_path
        end
    end

    def create_token_and_save(user)
        user.create_token_and_save
        cookies.permanent.signed[:user_id] = user.id
        cookies.permanent[:gen_token] = user.gen_token
    end
end
