class UsersController < ApplicationController
    # before_action :set_user, only: %i[show edit update]

    def index
        @users = User.all
    end

    def show
        # @user = User.find(params[:id])
    end

    def new
        @user = User.new
    end

    def edit; end

    def create
        @user = User.new(user_params)
        if @user.save
            flash[:success] = "new user successfully created"
            redirect_to 
        else
            flash[:danger] = "new user not created"
            render 'new'
        end

    end


    private

    def user_params
        params.require(:user).permit(:username, :email, :password)
    end

    # def set_user
    #     @user = User.find(params[:id])
    # end
end
