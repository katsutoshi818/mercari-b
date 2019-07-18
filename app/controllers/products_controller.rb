class ProductsController < ApplicationController
  before_action :set_product, only: [:show]
  before_action :set_category_brand, only: [:index, :show, :search]

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
    @top_category = [["----", 0]]
    Category.where("ancestry IS NULL").each do |category|
    @top_category << [category.category_name, category.id]
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
    respond_to do |format|
      format.json
      format.html
    end
  end

  def search
    @top_category = []
    Category.where("ancestry IS NULL").each do |category|
    @top_category << [category.category_name, category.id]
    end
    if params[:word]
      @keyword = params[:word]
      @products = Product.where('product_name LIKE(?) OR introduction LIKE (?)', "%#{params[:word]}%", "%#{params[:word]}%")
    else
      @product_box = []
        if params[:words].empty?
          @product_box = Product.all
        else
          @keyword = params[:words]
          @words = params[:words].to_s.split(" ")
          @words.each do |word|
          @key_products = Product.where('product_name LIKE(?) OR introduction LIKE (?)', "%#{word}%", "%#{word}%")
          @key_products.each do |product|
          @product_box << product
            end
          end
        end
      @category_box = []
      if params[:low_category]
        low_category_ids = params[:low_category]
        low_category_ids.each do |low_category_id|
          low_categories = Category.where(id: low_category_id)
            low_categories.each do |low_category|
              if low_category.children.empty?
                  @product_category = Product.where(category_id: low_category)
                  @product_category.each do |product|
                    @category_box << product
                  end
              else
                search_categories =low_category.children
                search_categories.each do |category_id|
                  @product_category = Product.where(category_id: category_id)
                  @product_category.each do |product|
                    @category_box << product
                  end
                end
              end
            end
        end
      elsif params[:mid_category]
        high_category = Category.find_by(id: params[:mid_category])
        mid_categories = high_category.children
        mid_categories.each do |mid_category|
          low_categories = mid_category.children
          low_categories.each do |category_id|
            @product_category = Product.where(category_id: category_id)
              @product_category.each do |product|
                @category_box << product
              end
            end
        end
      else
        @category_box = Product.all
      end
      @brand_box = []
      if params[:brand].empty?
        @brand_box = Product.all
      else
        set_brands = Brand.where(brand_name: params[:brand])
        set_brands.each do |brand|
          @product_brands = Product.where(brand_id: brand.id)
          @product_brands.each do |product|
            @brand_box << product
          end
        end
      end
      @product_sizes = []
      if params[:size_id]
        params[:size_id].each do |size_id|
          @products_size = Product.where(product_size_id: size_id)
          @products_size.each do |product|
            @product_sizes << product
          end
        end
      else
        @product_sizes = Product.all
      end
      @products_min_price = []
      if params[:min_price].empty?
        @products_min_price = Product.all
      else
        @products_min_prices = Product.where("price > ?", params[:min_price].to_i - 1)
        @products_min_prices.each do |product|
          @products_min_price << product
        end
      end
      @products_max_price = []
      if params[:max_price].empty?
        @products_max_price = Product.all
      else
        @products_max_prices = Product.where("price < ?", params[:max_price].to_i - 1)
        @products_max_prices.each do |product|
          @products_max_price << product
        end
      end
      @product_states = []
      if params[:product_state]
        params[:product_state].each do |state_id|
          @products_state = Product.where(product_state: state_id)
          @products_state.each do |product|
            @product_states << product
          end
        end
      else
        @product_states = Product.all
      end
      @product_fees = []
      if params[:who_pays_shipping_fee]
          params[:who_pays_shipping_fee].each do |fee_id|
          @products_fee = Product.where(who_pays_shipping_fee: fee_id)
          @products_fee.each do |product|
          @product_fees << product
          end
        end
      else
        @product_fees = Product.all
      end
      @product_trades = []
      if params[:trade_state]
          params[:trade_state].each do |trade_id|
          @products_trade = Product.where(trade_state: trade_id)
          @products_trade.each do |product|
            @product_trades << product
          end
        end
      else
        @product_trades = Product.all
      end
      @products = @product_box.uniq & @category_box.uniq & @brand_box.uniq & @product_sizes.uniq & @products_min_price.uniq & @products_max_price.uniq & @product_states.uniq & @product_fees.uniq & @product_trades.uniq
      @top_category_id = Category.find_by(id: params[:top_category_id])
      @mid_category_id = Category.find_by(id: params[:mid_category])
      @ids_category_low = params[:low_category]
      @low_category_id = Category.where(id: params[:low_category])
    
      
    end
  end

  private
  def product_params
    params.require(:product).permit(:product_name, :introduction, :product_state, :who_pays_shipping_fee, :seller_prefecture, :days_to_ship, :price, :product_size).merge(category_id: params.require(:product)[:low_category_id], brand_id: @brand_id, seller_user_id: 1, buyer_user_id: 1, trade_state: 1, way_to_ship: 1)
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
    respond_to do |format|
      format.html
      format.json
    end
  end

end
