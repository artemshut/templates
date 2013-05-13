class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
   # @user = current_user
    #@name = @user.comments.create(params[:comment])
    @comment = @post.comments.create(params[:comment])
    respond_to do |format|
      format.html { redirect_to post_path(@post) }
      format.js
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to posts_path(@post) }
      format.js
    end
  end

  def show
    @post = Post.find(params[:post_id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @comment }
      format.js
    end
  end
end
