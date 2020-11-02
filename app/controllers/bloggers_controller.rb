class BloggersController < ApplicationController

    def index
        @bloggers = Blogger.all
    end

    def show
        total_likes = 0
        @blogger = Blogger.find(params[:id])
        @blogger.posts.each do |post|
            total_likes += post.likes
        end
        @blogger_likes = total_likes
    end

    def new
        @blogger = Blogger.new
    end

    def create
        @blogger = Blogger.create(blogger_params)

        if @blogger.valid?
        redirect_to blogger_path(@blogger)
        else
            flash[:blogger_errors] = @blogger.errors.full_messages
            redirect_to new_blogger_path
        end
    end


private
    def blogger_params
        params.require(:blogger).permit(:name,:bio,:age)
    end

end
