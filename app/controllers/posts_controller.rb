class PostsController < ApplicationController

    def index
        @posts = Post.all
    end

    def show
        @post = Post.find(params[:id])
    
    end

    def new
        @post = Post.new
    end

    def create 
        @post = Post.create(post_params)
        if @post.valid?
            redirect_to post_path(@post)
        else
            flash[:post_errors] = @post.errors.full_messages
            redirect_to new_post_path
        end
    end

    def edit
        @post = Post.find(params[:id])
        render :edit
    end

    def update
        @post = Post.find(params[:id])
        if @post.update(post_params)
            redirect_to post_path(@post)
        else
            flash[:post_errors] = @post.errors.full_messages
            redirect_to edit_post_path
        end
    end

    def add_like
        @post = Post.find(params[:id])
        @post.likes += 1
        @post.save
        redirect_to post_path(@post)
    end

private
    def post_params
        params.require(:post).permit(:title,:content,:likes, :blogger_id,:destination_id)
    end


end
