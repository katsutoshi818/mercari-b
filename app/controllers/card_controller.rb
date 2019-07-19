class CardController < ApplicationController
  before_action :set_category_brand, only: [:show, :index]
  before_action :set_avatar_img, only: [:index, :show]
  require "payjp"

  def new
    card = Card.where(user_id: current_user.id)
    redirect_to action: "show" if card.exists?
  end

  def pay #payjpとCardのデータベース作成を実施します。
    Payjp.api_key = 'sk_test_a17c0589014ff4e26b8c6d4b'
    if params['payjp-token'].blank?
      redirect_to action: "new"
    else
      customer = Payjp::Customer.create(
      card: params['payjp-token'],
      metadata: {user_id: current_user.id}
      )
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
        if @card.save
          redirect_to users_thanks_path
        else
          redirect_to action: "pay"
      end
    end
  end
  
  def index
    @card = Card.where(user_id: current_user.id).first
  end
  
  
  def payjp
    Payjp.api_key = 'sk_test_a17c0589014ff4e26b8c6d4b'
    if params['payjp-token'].blank?
      redirect_to action: "index"
    else
      customer = Payjp::Customer.create(
        card: params['payjp-token'],
        metadata: {user_id: current_user.id}
        )
        @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
        if @card.save
          redirect_to card_path(current_user.id)
        else
          redirect_to card_path(current_user.id)
        end
      end
    end
    

  def delete
    @card = Card.where(user_id: current_user.id).first
    if @card.blank?
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(@card.customer_id)
      customer.delete
      @card.delete
    end
      redirect_to action: "index"
  end


  def show #Cardのデータpayjpに送り情報を取り出します
    @card = Card.where(user_id: current_user.id).first
    if @card.blank?
      redirect_to action: "index" 
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
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
    end
  end

  private

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

  def set_avatar_img
    if user_signed_in?
      @profile = Profile.find_by(user_id: current_user.id)
    end
  end

end