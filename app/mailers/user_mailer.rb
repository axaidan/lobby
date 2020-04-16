class UserMailer < ApplicationMailer
  default from: 'admilobbynistrator@gmail.com'

  def welcome_email(user)
    # on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
    @user = user
    # on définit une variable @url qu'on utilisera dans la view d'e-mail
    @url  = 'http://le-lobby.herokuapp.com'
    # c'est cet appel à mail() qui permet d'envoyer l'e-mail en définissant destinataire et sujet.
    mail(to: @user.email, subject: 'Le Lobby - votre inscription')
  end
end
