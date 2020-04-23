class PostsController < ApplicationController
    
    def new
        @post = Post.new
    end
  
    def index
        if current_user
            @posts = User.find(current_user.id).posts
        end
    end
  
    def show
        @post = Post.find(params[:id])
    end

    def create
        @post = Post.new(permit_post)
        @post.user_id = current_user.id
        
        if @post.save
            flash[:success] = "Success!"
            redirect_to post_path(@post)
        else
            flash[:error] = @post.errors.full_messages
            redirect_to new_post_path
        end
    end

    private

    def permit_post
        params.require(:post).permit(:image, :description, :user_id)
    end
end
