class HomeController < ApplicationController

  ## skip_before_action :authenticateuser!

  ## ao fazer o skip, a página fica pública. Neste file criamos as
  ## restantes páginas publicas (e.g.contacts, about us)
  ## depois, ir ao routes.rb e adicionar as rotas: eg: get 'home/contacts'
  def index

  end

 ##def contacts
  ##end

  ##def about_us
  ##end
end