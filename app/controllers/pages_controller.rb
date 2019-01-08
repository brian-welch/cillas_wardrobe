class PagesController < ApplicationController
  skip_before_action :authenticate_user!
  # before_action :refer_url

  def home
  end

  def design
  end

  def about
  end

  def cookies
    # cookies[:cookie_accept] = {
    #   value: true,
    #   expires: 1.year,
    #   domain: 'cillaswardrobe'
    # }
    # byebug
    redirect_to session.delete(:return_to)
  end

  private

  # def refer_url
  #   session[:return_to] ||= request.fullpath

  # end

end
