class ProductsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_all_products
  before_action :set_one_product, only: [:show]

  def index
    @all_pending_products = @all_products.where(live_status: false);
    @all_live_products = @all_products.where(live_status: true)
  end

  def shoes
    @all_shoe_products = @all_products.where("main_category_id = ? AND live_status = ?", MainCategory.find_by_name("shoes").id, true)

  end

  def clothing
    @all_clothing_products = @all_products.where("main_category_id = ? AND live_status = ?", MainCategory.find_by_name("clothes").id, true)
  end

  def home
    @all_home_products = @all_products.where("main_category_id = ? AND live_status = ?", MainCategory.find_by_name("home").id, true)
  end

  def show
  end

  def new
    @new_product = Product.new(product_number: make_prod_num, live_status: false)
    @all_sizes = Size.all
    @all_colors = Color.all
    @all_patterns = Pattern.all
    @all_materials = Material.all
  end

  def create
    # byebug
    @all_sizes = Size.all
    @all_colors = Color.all
    @all_patterns = Pattern.all
    @new_product = Product.new(product_params)
    @all_materials = Material.all
    # @new_product.user = current_user

    if @new_product.save
      5.times.with_index do |_, i|
        if params["material_id_0#{(i + 1)}"] != ""
          ProductMaterial.create!(product_id: @new_product.id,
                                  material_id: params["material_id_0#{(i + 1)}"].to_i,
                                  percent: params["material_percent_0#{(i + 1)}"].to_i)
        else
          break
        end
      end
      redirect_to @new_product
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
    @all_sizes = Size.all
    @all_colors = Color.all
    @all_patterns = Pattern.all
    @all_materials = Material.all
    @product_materials = ProductMaterial.where(product_id: params[:id])
  end

  def update
    @product = Product.find(params[:id])
    @product = Product.update(product_params)
    @all_sizes = Size.all
    @all_colors = Color.all
    @all_patterns = Pattern.all
    @all_materials = Material.all

    if @product.save
      5.times.with_index do |_, i|
        if params["material_id_0#{(i + 1)}"] != ""
          ProductMaterial.create!(product_id: @product.id,
                                  material_id: params["material_id_0#{(i + 1)}"].to_i,
                                  percent: params["material_percent_0#{(i + 1)}"].to_i)
        else
          break
        end
      end
      redirect_to @product
    else
      render :edit
    end

  end




  private

  def product_params
    # byebug
    params.require(:product).permit(:name,
                                    :size_id,
                                    :color_id,
                                    :pattern_id,
                                    :product_number,
                                    :sku,
                                    :live_status,
                                    :description,
                                    :brand_id,
                                    :price,
                                    :quantity,
                                    :style_id,
                                    :segment_id,
                                    :main_category_id,
                                    :category_id,
                                    :country_id,
                                    photos: [])
  end

  def edit_product_params
    # byebug
    params.require(:product).permit(:name,
                                    :size_id,
                                    :color_id,
                                    :pattern_id,
                                    :product_number,
                                    :sku,
                                    :live_status,
                                    :description,
                                    :brand_id,
                                    :price,
                                    :quantity,
                                    :style_id,
                                    :segment_id,
                                    :main_category_id,
                                    :category_id,
                                    :country_id,
                                    photos: [])
  end

  def make_prod_num
    t_one = Time.now
    temp = (digi_check(t_one.year) +
            digi_check(t_one.month) +
            digi_check(t_one.day) +
            digi_check(t_one.hour) +
            digi_check(t_one.min) +
            digi_check(t_one.sec) +
            rand(100..999).to_s).scan(/.{1,3}/m).join("-")
  end

  def digi_check(int)
    int.to_s.length == 1 ? "0" + int.to_s : int.to_s[-2..-1]
  end

  def set_one_product
    @product = Product.find(params[:id])
  end

  def set_all_products
    @all_products = Product.all
  end
end
