class PostsController < ApplicationController

    def index
    end

    def new
        @post = Post.new
    end

    def create
        # need to pass in the parameters that we used to create posts
        # we'll use the *private* method below  
        @post = Post.new(post_params)

        # check to see if post was saved
        # if so, we'll redirect to post itself
        # else, render the new template again
        if @post.save
            redirect_to @post
        else 
            render "new"
        end
    end

    def show
        @post = Post.find(params[:id])
    end

    private

    def post_params
        # if not initialized here, they won't be submitted to server
        params.require(:post).permit(:title, :content)
    end

end
