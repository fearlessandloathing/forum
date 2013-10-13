class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :set_forum_thread

  # GET /posts
  # GET /posts.json
  def index
    @posts = @forum_thread.posts
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = @forum_thread.posts.new
    
  end

  # GET /posts/1/edit
  def edit
    if cannot? :update, @post
      redirect_to :root
    end
  end

  # POST /posts
  # POST /posts.json
  def create
    puts params.inspect
    @post = @forum_thread.posts.new(post_params)
    @post.user = current_user


    respond_to do |format|
      if @post.save
        format.html { redirect_to [@forum_thread, @post], notice: 'Post was successfully created.' }
        format.json { render action: 'show', status: :created, location: @post }
      else
        format.html { render action: 'new' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    if can? :update, @post
      respond_to do |format|
        if @post.update(post_params)
          format.html { redirect_to [@forum_thread, @post], notice: 'Post was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: 'edit' }
          format.json { render json: @post.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to :root
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    if can? :destroy, @post
      @post.destroy
    end
    respond_to do |format|
      format.html { redirect_to forum_thread_posts_path(@forum_thread) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    def set_forum_thread
      @forum_thread = ForumThread.find(params[:forum_thread_id])
      puts @forum_thread.inspect
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:body, :user_id, :mode)
    end
end
