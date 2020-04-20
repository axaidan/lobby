class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update]
  before_action :is_current_user?

  def show
    @user_commitments = UserCommitment.where(user: @user)
  end

  def edit
    @departement = []
    count = 0
    95.times do
      count += 1
      unless count == 20
        @departement << count.to_s
      end
      if count == 2
        @departement += ["2A", "2B"]
      end
    end
  end

  def update
    if @user.update(user_params)
      @user.save
			flash[:success] = "Vous avez modifié vos informations avec succès."
      redirect_to user_path(current_user)
    else
      flash[:error] = @user.errors.full_messages.to_sentence
      redirect_to edit_user_path(current_user)
    end
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :username, :first_name, :last_name, :department, :name_display, :accept_mails)
  end

  def is_current_user?
    unless authenticate_user! && current_user == find_user
      redirect_to root_path
    end
  end

end
