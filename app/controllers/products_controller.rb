class ProductsController < ApplicationController

  def index
  end

  def new
    @product = Product.new
  end

  def create
    @brand = Brand.new(brand_name: params.require(:product)[:brand_name], category_id: params.require(:product)[:low_category_id])
    # @brand = {brand_name: params.require(:product)[:brand_name], category_id: params.require(:product)[:low_category_id]}
    binding.pry
    @brand_id = @brand.brand_registration(@brand)
    @product = Product.new(product_params)
    binding.pry
    Product.transaction do
      @product.save!
    end
    ProductImage.transaction do
      @product_image = ProductImage.new(image_params)
      @product_image.save!
    end
    respond_to do |format|
      format.html  {redirect_to root_path}
      format.json
    end
  end

  private
  def product_params
    params.require(:product).permit(:product_name, :introduction, :product_state, :who_pays_shipping_fee, :seller_prefecture, :days_to_ship, :price).merge(category_id: params.require(:product)[:low_category_id], brand_id: @brand_id, seller_user_id: 1, buyer_user_id: 1, trade_state: 1, way_to_ship: 1)
  end

  def image_params
    params.require(:product).permit(:image).merge(product_id: @product[:id])
  end
end
