class ProductsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_all_products
  before_action :set_one_product, only: [:show]

  def shoes
    @all_shoe_products = @all_products.where(main_category_id: MainCategory.find_by_name("shoes").id)
  end

  def clothing
    @all_clothing_products = @all_products.where(main_category: MainCategory.find_by_name("clothes").id)
  end

  def home
    @all_home_products = @all_products.where(main_category: MainCategory.find_by_name("housewares").id)
  end

  def show
  end

  def new
    @new_product = Product.new
  end

  def create
    @new_product = Product.new(new_product_params)

  end

  private

  def new_product_params
    params.require(:artifact).permit(:name,
                                     :size,
                                     :color,
                                     :pattern,
                                     :product_number,
                                     :status)
  end

  def set_one_product
    @product = Product.find(params[:id])
  end

  def set_all_products
    @all_products = Product.all
  end
end
