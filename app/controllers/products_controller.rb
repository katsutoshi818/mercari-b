class ProductsController < ApplicationController
  before_action :set_product, only: [:show]
  before_action :set_category_brand, only: [:index, :show]

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
    @top_category = [["----", 0]]
    Category.where("ancestry IS NULL").each do |category|
      @top_category <<  [category.category_name, category.id]
    end
  end

  def show
    @images = @product.product_images
    @category3 = @product.category
    @category2 = @category3.parent
    @category1 = @category2.parent
    @brand = @product.brand
    @seller_user = @product.seller_user
    @user_products = Product.where(seller_user_id: @product.seller_user_id).where.not(id: params[:id]).limit(6)
    @brand_products = Product.where(brand_id: @product.brand_id).where.not(id: params[:id]).limit(6)
  end


  def create
    @brand = Brand.new(brand_name: params.require(:product)[:brand_name], category_id: params.require(:product)[:low_category_id])
    @brand_id = @brand.brand_registration(@brand)
    @product = Product.new(product_params)
    Product.transaction do
      @product.save!
    end
    ProductImage.transaction do
      image_params_array.each do |image|
        ProductImage.new({product_id: @product.id,image: image}).save!
      end
    end
    redirect_to root_path
  end

  private
  def product_params
    params.require(:product).permit(:product_name, :introduction, :product_state, :who_pays_shipping_fee, :prefecture_id, :days_to_ship, :price, :product_size_id).merge(category_id: params.require(:product)[:low_category_id], brand_id: @brand_id, seller_user_id: 1, buyer_user_id: 1, trade_state: 1, way_to_ship: 1)
  end

  def image_params
    params.require(:product).permit(:image).merge(product_id: @product[:id])
  end

  def image_params_array
    params.require(:product).select{ |key, value| key =~ /^image/}.values
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def set_category_brand
    @brands = Brand.all
    @parents = Category.where(ancestry: nil)
    @parent = Category.find_by('category_name LIKE(?)', "%#{params[:keyword]}%")
    @children = @parent.children
    respond_to do |format|
      format.html
      format.json
    end
  end

end
