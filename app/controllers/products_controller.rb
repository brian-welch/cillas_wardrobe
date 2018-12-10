class ProductsController < ApplicationController
  skip_before_action :authenticate_user!

  def shoes
  end

  def clothing
  end

  def home
  end

end
