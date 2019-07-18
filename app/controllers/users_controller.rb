class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_category_brand, only: [:show, :profiles, :logout, :identification, :deliver_address, :email, :card, :password]

  def index
  end

  def show
    @user = User.find(params[:id])
    @products = Product.where(seller_user_id: params[:id])
  end

  def profiles
  end

  def logout
  end

  def identification
  end

  def deliver_address
  end

  def email
  end

  def card
  end

  def password
  end

  private

  def set_category_brand
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
end
