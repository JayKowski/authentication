class UserController < ApplicationController
    def index
        @users = User.all
    end

    def show; end

    def new
        @user = User.new
    end

    def edit; end

    def create

        @user = user_params

        if @user.save
            flash[:success] = "new user successfully created"
            redirect_to new_user_path
        else
            flash[:danger] = "new user not created"
        end

    end


    private

    def user_params
        params.require(user).permit(:username, :email, :password_digest, :remember_digest)
    end
end
