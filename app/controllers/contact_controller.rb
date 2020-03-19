class ContactController < ApplicationController
    
    def new
        @contact = Contact.new
    end

    def create
      email = params[:email]
      subject = params[:subject]
      content = params[:content]
      if user_signed_in?
        email = current_user.email
      end
        ContactMailer.contact_email(email,content,subject).deliver
      redirect_to root_path
    end
end
