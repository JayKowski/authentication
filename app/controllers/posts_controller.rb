class PostsController < ApplicationController
   
    
    def index
        @post = Post.all
    end

    def new
        @post = Post.new
    end

    def show
    end

    def edit
    end

    def create
        @post = Post.new(post_params)
       
        if @post.save
            flash[:success] = "Article was successfully created"
            # redirect_to root_path(@post)
        else
            render 'new'
        end
        
    end

    def update
        if @post.update(post_params)
            flash[:success] = "Article was successfully edited"
            # redirect_to post_path(@post)
        else
            render 'new'
        end
    end

    def destroy
        @post.destroy
        flash[:danger] = "Article was successfully deleted"
        # redirect_to posts_path
    end

    private
        
        def post_params
            params.require(:post).permit(:title, :body)
        end
end