class PostsController < ApplicationController
	before_action :authenticate_user!
	before_action :user_is_author, only: [:edit, :update, :destroy]
	before_action :commitment_taken, only: [:new, :create]
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :set_forum, only: [:create, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def show
    @reply = Reply.new
    @replies = @post.replies
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    @post.forum = @forum 
    if @post.save
      flash[:success] = "Vous avez créé un nouveau post !"
      redirect_to forum_path(@forum)
    else
      puts @post.errors.messages
      flash[:error] = @post.errors.full_messages.to_sentence
      redirect_to new_forum_post_path
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      flash[:success] = "Vous avez édité votre post avec succès"
      redirect_to forum_post_path(@post.forum, @post)
    else
      flash[:error] = @post.errors.full_messages.to_sentence
      redirect_to edit_forum_post_path(@post.forum, @post)
    end
  end

  def destroy
    @post.destroy
    flash[:success] = "Vous avez détruit votre post avec succès"
    redirect_to forum_path(@forum)
  end


  private 

  def set_post
    @post = Post.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to forums_path
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end

  def set_forum
    @forum = Forum.find(params[:forum_id])
  end

	def user_is_author 
		@post = set_post
		if (current_user != @post.user || current_user.role == 'moderator')
			flash[:error] = "Vous n'êtes pas l'auteur de ce Post, vous n'avez pas l'autorisation pour effectuer cette action."
			redirect_to home_path
		end
	end

	def commitment_taken
		@forum = set_forum
		if @forum.commitment && !(current_user.commitments.include?(@forum.commitment))
			flash[:error] = "Vous devez avoir rejoint le Mouvement \"#{@forum.commitment.title}\" pour créer un Post sur le Forum qui lui est dédié."
			redirect_to commitments_path 
		end
	end
  
end
