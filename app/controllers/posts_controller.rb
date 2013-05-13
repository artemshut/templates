class PostsController < ApplicationController

  def index
   # @posts = Post.paginate(page: params[:page])
    @search = Post.search do
      fulltext params[:search]
    end
    @posts = @search.results
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
  end

  # GET /templates/1
  # GET /templates/1.json
  def show
    @post = Post.find(params[:id])

        respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
  end


  # GET /templates/new
  # GET /templates/new.json
  def new
    @post = Post.new
    @post.avatar  = Avatar.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @post }
    end
  end



  # GET /templates/1/edit
  def edit
    @post = Post.find(params[:id])
  end

  # POST /templates
  # POST /templates.json
  def create
      @post = Post.new(params[:post])
      @post.avatar = Avatar.new(params[:avatar])
      respond_to do |format|
        if @post.save
          format.html { redirect_to @post,  notice: 'Post was successfully created.' }
          format.json { render json: @post, status: :created, location: @post }
       else
          format.html { render action: "new" }
          format.json { render json: @post.errors, status: :unprocessable_entity }
       end
      end
    end

  # PUT /templates/1
  # PUT /templates/1.json
  def update
    @post = Post.find(params[:id])
    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
      format.js
    end
  end
end
