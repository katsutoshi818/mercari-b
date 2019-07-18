class ProductsController < ApplicationController
  before_action :set_product, only: [:show]
  before_action :set_category_brand, only: [:index, :show, :edit]

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

  def edit
    @product = Product.find(params[:id])
    @category3 = @product.category
    @category2 = @category3.parent
    @category1 = @category2.parent
    @top_category = [["----", 0]]
    @mid_category = [["----", 0]]
    @low_category = [["----", 0]]
    @product_size = [["----", 0]]
    Category.where("ancestry IS NULL").each do |category|
      @top_category <<  [category.category_name, category.id]
    end
    @category1.children.each do |category|
      @mid_category  << [category.category_name, category.id]
    end
    @category2.children.each do |category|
      @low_category  << [category.category_name, category.id]
    end
    ProductSize.all.each do |size|
      @product_size << [size.size_text, size.id]
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
      @product_image = ProductImage.new(image_params)
      @product_image.save!
    end
    redirect_to root_path
  end
  
  def update
    @brand = Brand.new(brand_name: params.require(:product)[:brand_name], category_id: params.require(:product)[:low_category_id])
    @brand_id = @brand.brand_registration(@brand)
    @product = Product.find(params[:id])
    Product.transaction do
      @product.update(product_params)
    end
    ProductImage.transaction do
      @product_image = ProductImage.new(image_params)
      @product_image.save!
    end
    redirect_to root_path
  end

  def destroy
    product = Product.find(params[:id])
    product.destroy if product.seller_user_id == current_user.id
    redirect_to root_path
  end

  private
  def product_params
    params.require(:product).permit(:product_name, :introduction, :product_state, :who_pays_shipping_fee, :prefecture_id, :days_to_ship, :price, :product_size_id).merge(category_id: params.require(:product)[:low_category_id], brand_id: @brand_id, seller_user_id: current_user.id, buyer_user_id: 1, trade_state: 1, way_to_ship: 1)
  end

  def image_params
    params.require(:product).permit(:image).merge(product_id: @product[:id])
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def set_category_brand
    @brands = Brand.all
    @parents = Category.where(ancestry: nil)
    @parent = Category.find_by('category_name LIKE(?)', "%#{params[:keyword]}%")
    @children = @parent.children
    if current_user.present?
      @products = Product.where(seller_user_id: current_user.id)
    end
    respond_to do |format|
      format.html
      format.json
    end
  end
end
