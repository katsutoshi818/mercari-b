class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_category_brand, only: [:show, :profile, :logout, :identification, :deliver_address, :email, :card, :password]
  before_action :set_avatar_img, only: [:profile, :deliver_address, :email, :password, :identification, :logout, :show]

  def index
  end

  def show
    @user = User.find(params[:id])
    @products = Product.where(seller_user_id: params[:id])
  end

  def profile
  end

  def logout
  end

  def identification
    @addressee = Addressee.find_by(id: current_user.id)
    @profile = Profile.find_by(id: current_user.id)
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

  def set_avatar_img
    if user_signed_in?
      @profile = Profile.find_by(user_id: current_user.id)
    end
  end

end
