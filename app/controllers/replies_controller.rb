class RepliesController < ApplicationController
	before_action :authenticate_user!
	before_action :user_is_author, only: [:edit, :update, :destroy]
	before_action :commmitment_taken, only: [:new, :create]
  before_action :set_post, only: [:create, :update, :destroy]
  before_action :set_reply, only: [:edit, :update, :destroy]

  def new
    @reply = Reply.new
  end

  def create
    @reply = Reply.new(reply_params)
    @reply.user = current_user
    @reply.post = @post
    if @reply.save
      flash[:success] = "Vous avez répondu à ce post"
      redirect_to forum_post_path(@post.forum, @post)
    else
      flash[:error] = @reply.errors.full_messages.to_sentence
      redirect_to new_forum_post_reply_path(@post.forum, @post)
    end
  end

  def edit
    unless authenticate_user! && current_user == @reply.user
      redirect_to root_path
    end
  end

  def update
    if @reply.update(reply_params)
      flash[:success] = "Vous avez édité votre commentaire avec succès"
      redirect_to forum_post_path(@post.forum, @post)
    else
      flash[:error] = @reply.errors.full_messages.to_sentence
      redirect_to edit_forum_post_reply_path(@post.forum, @post, @reply)
    end
  end

  def destroy
    @reply.destroy
    flash[:success] = "Vous avez détruit votre commentaire avec succès"
    redirect_to forum_post_path(@post.forum, @post)
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_reply
    @reply = Reply.find(params[:id])
  end

  def reply_params
    params.require(:reply).permit(:content)
  end

	def user_is_author
		@reply = set_reply
		if (current_user != @reply.user || current_user.role == 'moderator')
			flash[:error] = "Vous n'êtes pas l'auteur de cette Réponse, vous n'avez pas l'autorisation pour effectuer cette action."
			redirect_to home_path
		end
	end

	def commitment_taken
		@post = set_post
		if (@post.forum.commitment && !(current_user.commitments.include?(@post.forum.commitment)))
			flash[:error] = "Vous devez avoir rejoint le Mouvement \"#{@post.forum.commitment.title}\" pour utiliser le Forum qui lui est dédié."
			redirect_to commitments_path
		end	
	end

end
