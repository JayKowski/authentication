# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :require_user, only: %i[new create]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
  end

  # def edit; end

  def create
    @post = Post.new(post_params)
    @post.user = current_user

    if @post.save
      flash[:success] = 'Post was successfully created'
      redirect_to root_path
    else
      render 'new'
    end
  end

  # def update
  #     if @post.update(post_params)
  #         flash[:success] = "Article was successfully edited"
  #         # redirect_to post_path(@post)
  #     else
  #         render 'new'
  #     end
  # end

  # def destroy
  #     @post.destroy
  #     flash[:danger] = "Article was successfully deleted"
  #     redirect_to posts_path
  # end

  private

  def post_params
    params.require(:post).permit(:title, :body, :user_id)
  end
end
