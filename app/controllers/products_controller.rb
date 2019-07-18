class ProductsController < ApplicationController
  before_action :set_category_brand, only: [:index, :show, :edit, :search]
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :card_img, only: [:edit, :update]
  before_action :set_address, only: [:edit, :update]

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
    @top_category = [["----", 0]]
    Category.where("ancestry IS NULL").each do |category|
    @top_category << [category.category_name, category.id]
    end
    prefectures = Prefecture.all
    @prefecture_selection = []
    prefectures.each do |prefecture|
      @prefecture_selection << [prefecture.name, prefecture.id]
    end
  end

  def edit
    @product = Product.find(params[:id])
    @low_categories = @product.category
    @mid_categories = @low_categories.parent
    @top_categories = @mid_categories.parent
    @top_category = [["----", 0]]
    @mid_category = [["----", 0]]
    @low_category = [["----", 0]]
    @product_size = [["----", 0]]

    Category.where("ancestry IS NULL").each do |category|
      @top_category <<  [category.category_name, category.id]
    end
    @top_categories.children.each do |category|
      @mid_category  << [category.category_name, category.id]
    end
    @mid_categories.children.each do |category|
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
      image_params_array.each do |image|
        ProductImage.new({product_id: @product.id,image: image}).save!
      end
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
      image_params_array.each do |image|
        ProductImage.new({product_id: @product.id,image: image}).save!
      end
    end

    if current_user.id == @product.id
      if @product.update(buy_params)
        Payjp::Charge.create(
          amount: @product.price,
          customer: @card.customer_id,
          currency: 'jpy'
          )
        else
          flash[:alert] += '購入に失敗しました。'
          render :edit
        end
      end

    redirect_to root_path
  end

  def destroy
    @product.destroy
    redirect_to root_path
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
    params.require(:product).permit(:product_name, :introduction, :product_state, :who_pays_shipping_fee, :prefecture_id, :days_to_ship, :price, :product_size_id).merge(category_id: params.require(:product)[:low_category_id], brand_id: @brand_id, seller_user_id: current_user.id, buyer_user_id: 1, trade_state: "buying", way_to_ship: "らくらくメルカリ便")
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
    @products = Product.where(seller_user_id: params[:id])
    @brands = Brand.all
    @parents = Category.where(ancestry: nil)
    @parent = Category.find_by('category_name LIKE(?)', "%#{params[:keyword]}%")
    @children = @parent.children
    if current_user.present?
      @user_products = Product.where(seller_user_id: current_user.id)
    end
    respond_to do |format|
      format.html
      format.json
    end
  end

  def buy_params
    params.require(:product).permit(:trade_state, :buyer_user_id)
  end

  def card_img
    if current_user.id == @product.id
      if @card = Card.where(user_id: current_user.id).first
      Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @default_card_information = customer.cards.retrieve(@card.card_id)
      @card_brand = @default_card_information.brand
      case @card_brand
      when "Visa"
        @card_src = "visa.svg"
      when "JCB"
        @card_src = "jcb.svg"
      when "MasterCard"
        @card_src = "master-card.svg"
      when "American Express"
        @card_src = "american_express.svg"
      when "Diners Club"
        @card_src = "dinersclub.svg"
      when "Discover"
        @card_src = "discover.svg"
      end
      else
        redirect_to controller: "card", acttion: "show"
      end
    end
  end

  def set_address
    @address = Addressee.find_by(user_id: @product.seller_user_id)
  end

end
